/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : L-2016.03-SP3
// Date      : Tue Oct 18 20:31:49 2016
/////////////////////////////////////////////////////////////


module FSM_Add_Subtract ( clk, rst, rst_FSM, beg_FSM, zero_flag_i, 
        norm_iteration_i, add_overflow_i, round_i, load_1_o, load_2_o, 
        load_3_o, load_8_o, A_S_op_o, load_4_o, left_right_o, bit_shift_o, 
        load_5_o, load_6_o, load_7_o, ctrl_a_o, ctrl_b_o, ctrl_b_load_o, 
        ctrl_c_o, ctrl_d_o, rst_int, ready );
  output [1:0] ctrl_b_o;
  input clk, rst, rst_FSM, beg_FSM, zero_flag_i, norm_iteration_i,
         add_overflow_i, round_i;
  output load_1_o, load_2_o, load_3_o, load_8_o, A_S_op_o, load_4_o,
         left_right_o, bit_shift_o, load_5_o, load_6_o, load_7_o, ctrl_a_o,
         ctrl_b_load_o, ctrl_c_o, ctrl_d_o, rst_int, ready;
  wire   n53, n54, n55, n56, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46,
         n47, n48, n49, n50, n51, n52, n57, n58, n59, ctrl_a_o, n61, n62, n63,
         n64, n65, n66, n67, n69, n70, n71, n73, n75, n77, n78, n79;
  wire   [3:0] state_reg;
  assign ctrl_d_o = ctrl_a_o;

  DFFRX2TS state_reg_reg_1_ ( .D(n54), .CK(clk), .RN(n79), .Q(state_reg[1]), 
        .QN(n61) );
  DFFRX2TS state_reg_reg_0_ ( .D(n56), .CK(clk), .RN(n79), .Q(state_reg[0]) );
  DFFRX2TS state_reg_reg_2_ ( .D(n53), .CK(clk), .RN(n79), .Q(state_reg[2]) );
  DFFRX2TS state_reg_reg_3_ ( .D(n55), .CK(clk), .RN(n79), .Q(state_reg[3]), 
        .QN(n62) );
  INVX2TS U3 ( .A(n39), .Y(n63) );
  AOI21X1TS U4 ( .A0(n25), .A1(n66), .B0(n67), .Y(bit_shift_o) );
  NAND2X1TS U5 ( .A(n52), .B(n51), .Y(n40) );
  NAND4X1TS U6 ( .A(add_overflow_i), .B(n36), .C(n48), .D(n49), .Y(A_S_op_o)
         );
  NOR2BX1TS U7 ( .AN(state_reg[2]), .B(state_reg[0]), .Y(n51) );
  NOR2BX1TS U8 ( .AN(state_reg[0]), .B(state_reg[2]), .Y(n46) );
  NOR2X1TS U9 ( .A(state_reg[3]), .B(state_reg[1]), .Y(n52) );
  NOR2X1TS U10 ( .A(state_reg[2]), .B(state_reg[0]), .Y(n59) );
  NOR2X1TS U11 ( .A(n61), .B(state_reg[3]), .Y(n57) );
  NAND2X1TS U12 ( .A(state_reg[2]), .B(state_reg[0]), .Y(n58) );
  NAND3X1TS U13 ( .A(n46), .B(n61), .C(state_reg[3]), .Y(n32) );
  NOR3X1TS U14 ( .A(n62), .B(state_reg[1]), .C(n58), .Y(load_7_o) );
  INVX2TS U15 ( .A(n43), .Y(rst_int) );
  INVX2TS U16 ( .A(n40), .Y(n71) );
  INVX2TS U17 ( .A(n42), .Y(ready) );
  OAI21X1TS U18 ( .A0(n64), .A1(n40), .B0(n29), .Y(load_8_o) );
  AOI21X1TS U19 ( .A0(n73), .A1(norm_iteration_i), .B0(n77), .Y(n25) );
  NAND2X1TS U20 ( .A(n23), .B(n34), .Y(load_5_o) );
  INVX2TS U21 ( .A(n44), .Y(n73) );
  INVX2TS U22 ( .A(norm_iteration_i), .Y(n64) );
  NAND3X1TS U23 ( .A(n40), .B(n41), .C(n29), .Y(load_3_o) );
  INVX2TS U24 ( .A(n31), .Y(n69) );
  NOR2X1TS U25 ( .A(n61), .B(n62), .Y(n45) );
  NOR2BX1TS U26 ( .AN(round_i), .B(n32), .Y(ctrl_a_o) );
  NAND2X1TS U27 ( .A(n45), .B(n59), .Y(n31) );
  NAND2X1TS U28 ( .A(n39), .B(n31), .Y(ctrl_b_load_o) );
  NAND2X1TS U29 ( .A(n44), .B(n47), .Y(load_4_o) );
  NAND2X1TS U30 ( .A(n78), .B(n52), .Y(n44) );
  NAND2X1TS U31 ( .A(n45), .B(n51), .Y(n42) );
  NAND2X1TS U32 ( .A(n52), .B(n59), .Y(n43) );
  INVX2TS U33 ( .A(load_8_o), .Y(n66) );
  NOR3X1TS U34 ( .A(load_1_o), .B(load_7_o), .C(load_2_o), .Y(n36) );
  AOI21X1TS U35 ( .A0(load_2_o), .A1(zero_flag_i), .B0(load_7_o), .Y(n33) );
  AND2X2TS U36 ( .A(n57), .B(n59), .Y(load_2_o) );
  AND2X2TS U37 ( .A(n52), .B(n46), .Y(load_1_o) );
  NAND2X1TS U38 ( .A(n57), .B(n51), .Y(n23) );
  NAND2X1TS U39 ( .A(n45), .B(n46), .Y(n29) );
  NAND2X1TS U40 ( .A(n57), .B(n46), .Y(n41) );
  NAND2X1TS U41 ( .A(n78), .B(n57), .Y(n34) );
  INVX2TS U42 ( .A(n47), .Y(n77) );
  INVX2TS U43 ( .A(n58), .Y(n78) );
  AOI31X1TS U44 ( .A0(n24), .A1(n25), .A2(n26), .B0(n27), .Y(n56) );
  NOR3X1TS U45 ( .A(n71), .B(n75), .C(rst_int), .Y(n26) );
  AOI21X1TS U46 ( .A0(load_2_o), .A1(n65), .B0(n69), .Y(n24) );
  INVX2TS U47 ( .A(zero_flag_i), .Y(n65) );
  INVX2TS U48 ( .A(n32), .Y(n75) );
  INVX2TS U49 ( .A(n39), .Y(load_6_o) );
  OAI22X1TS U50 ( .A0(rst_FSM), .A1(n42), .B0(beg_FSM), .B1(n43), .Y(n27) );
  NOR4XLTS U51 ( .A(n50), .B(ctrl_b_load_o), .C(load_5_o), .D(load_4_o), .Y(
        n49) );
  AOI211X1TS U52 ( .A0(n71), .A1(n64), .B0(ready), .C0(rst_int), .Y(n48) );
  NAND3X1TS U53 ( .A(n32), .B(n58), .C(n41), .Y(n50) );
  NAND3X1TS U54 ( .A(state_reg[3]), .B(n61), .C(n51), .Y(n47) );
  NAND4BBX1TS U55 ( .AN(n28), .BN(load_5_o), .C(n29), .D(n30), .Y(n55) );
  AOI21X1TS U56 ( .A0(state_reg[3]), .A1(n27), .B0(n69), .Y(n30) );
  OAI211X1TS U57 ( .A0(n32), .A1(round_i), .B0(n33), .C0(n25), .Y(n28) );
  NAND4BX1TS U58 ( .AN(ctrl_a_o), .B(n34), .C(n31), .D(n35), .Y(n54) );
  AOI221X1TS U59 ( .A0(state_reg[1]), .A1(n27), .B0(n73), .B1(n64), .C0(n70), 
        .Y(n35) );
  INVX2TS U60 ( .A(n36), .Y(n70) );
  AOI211X1TS U61 ( .A0(n40), .A1(n44), .B0(n64), .C0(add_overflow_i), .Y(
        left_right_o) );
  NAND3X1TS U62 ( .A(n37), .B(n33), .C(n38), .Y(n53) );
  NOR4XLTS U63 ( .A(load_3_o), .B(n75), .C(n63), .D(n77), .Y(n38) );
  AOI22X1TS U64 ( .A0(state_reg[2]), .A1(n27), .B0(n73), .B1(n64), .Y(n37) );
  NAND3X1TS U65 ( .A(state_reg[3]), .B(n61), .C(n59), .Y(n39) );
  INVX2TS U66 ( .A(add_overflow_i), .Y(n67) );
  INVX2TS U67 ( .A(n23), .Y(ctrl_c_o) );
  OAI21X1TS U68 ( .A0(n39), .A1(n67), .B0(n31), .Y(ctrl_b_o[1]) );
  NOR2BX1TS U69 ( .AN(ctrl_b_load_o), .B(add_overflow_i), .Y(ctrl_b_o[0]) );
  INVX2TS U70 ( .A(rst), .Y(n79) );
endmodule


module RegisterAdd_W1_13 ( clk, rst, load, D, Q );
  input [0:0] D;
  output [0:0] Q;
  input clk, rst, load;
  wire   n1, n3, n2;

  DFFRX2TS Q_reg_0_ ( .D(n3), .CK(clk), .RN(n2), .Q(Q[0]), .QN(n1) );
  INVX2TS U2 ( .A(rst), .Y(n2) );
  OAI2BB2XLTS U3 ( .B0(n1), .B1(load), .A0N(load), .A1N(D[0]), .Y(n3) );
endmodule


module RegisterAdd_W1_12 ( clk, rst, load, D, Q );
  input [0:0] D;
  output [0:0] Q;
  input clk, rst, load;
  wire   n2, n4, n5;

  DFFRX2TS Q_reg_0_ ( .D(n4), .CK(clk), .RN(n2), .Q(Q[0]), .QN(n5) );
  INVX2TS U2 ( .A(rst), .Y(n2) );
  OAI2BB2XLTS U3 ( .B0(n5), .B1(load), .A0N(load), .A1N(D[0]), .Y(n4) );
endmodule


module RegisterAdd_W2_1 ( clk, rst, load, D, Q );
  input [1:0] D;
  output [1:0] Q;
  input clk, rst, load;
  wire   n1, n2, n3, n5, n4;

  DFFRX2TS Q_reg_1_ ( .D(n5), .CK(clk), .RN(n4), .Q(Q[1]), .QN(n2) );
  DFFRX2TS Q_reg_0_ ( .D(n3), .CK(clk), .RN(n4), .Q(Q[0]), .QN(n1) );
  INVX2TS U2 ( .A(rst), .Y(n4) );
  OAI2BB2XLTS U3 ( .B0(n2), .B1(load), .A0N(D[1]), .A1N(load), .Y(n5) );
  OAI2BB2XLTS U4 ( .B0(n1), .B1(load), .A0N(load), .A1N(D[0]), .Y(n3) );
endmodule


module RegisterAdd_W64_2 ( clk, rst, load, D, Q );
  input [63:0] D;
  output [63:0] Q;
  input clk, rst, load;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
         n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122,
         n123, n124, n125, n126, n127, n129, n128, n130, n131, n132, n133,
         n134, n135, n136, n137, n138, n139, n140, n141, n142, n143, n144,
         n145, n146, n147, n148, n149;

  DFFRX2TS Q_reg_63_ ( .D(n129), .CK(clk), .RN(n134), .Q(Q[63]), .QN(n64) );
  DFFRX2TS Q_reg_23_ ( .D(n88), .CK(clk), .RN(n130), .Q(Q[23]), .QN(n24) );
  DFFRX2TS Q_reg_21_ ( .D(n86), .CK(clk), .RN(n130), .Q(Q[21]), .QN(n22) );
  DFFRX2TS Q_reg_22_ ( .D(n87), .CK(clk), .RN(n130), .Q(Q[22]), .QN(n23) );
  DFFRX2TS Q_reg_33_ ( .D(n98), .CK(clk), .RN(n131), .Q(Q[33]), .QN(n34) );
  DFFRX2TS Q_reg_17_ ( .D(n82), .CK(clk), .RN(n128), .Q(Q[17]), .QN(n18) );
  DFFRX2TS Q_reg_9_ ( .D(n74), .CK(clk), .RN(n134), .Q(Q[9]), .QN(n10) );
  DFFRX2TS Q_reg_31_ ( .D(n96), .CK(clk), .RN(n131), .Q(Q[31]), .QN(n32) );
  DFFRX2TS Q_reg_15_ ( .D(n80), .CK(clk), .RN(n128), .Q(Q[15]), .QN(n16) );
  DFFRX2TS Q_reg_16_ ( .D(n81), .CK(clk), .RN(n128), .Q(Q[16]), .QN(n17) );
  DFFRX2TS Q_reg_8_ ( .D(n73), .CK(clk), .RN(n134), .Q(Q[8]), .QN(n9) );
  DFFRX2TS Q_reg_57_ ( .D(n122), .CK(clk), .RN(n133), .Q(Q[57]), .QN(n58) );
  DFFRX2TS Q_reg_35_ ( .D(n100), .CK(clk), .RN(n131), .Q(Q[35]), .QN(n36) );
  DFFRX2TS Q_reg_56_ ( .D(n121), .CK(clk), .RN(n133), .Q(Q[56]), .QN(n57) );
  DFFRX2TS Q_reg_36_ ( .D(n101), .CK(clk), .RN(n131), .Q(Q[36]), .QN(n37) );
  DFFRX2TS Q_reg_34_ ( .D(n99), .CK(clk), .RN(n131), .Q(Q[34]), .QN(n35) );
  DFFRX2TS Q_reg_32_ ( .D(n97), .CK(clk), .RN(n131), .Q(Q[32]), .QN(n33) );
  DFFRX2TS Q_reg_39_ ( .D(n104), .CK(clk), .RN(n131), .Q(Q[39]), .QN(n40) );
  DFFRX2TS Q_reg_61_ ( .D(n126), .CK(clk), .RN(n134), .Q(Q[61]), .QN(n62) );
  DFFRX2TS Q_reg_46_ ( .D(n111), .CK(clk), .RN(n132), .Q(Q[46]), .QN(n47) );
  DFFRX2TS Q_reg_44_ ( .D(n109), .CK(clk), .RN(n132), .Q(Q[44]), .QN(n45) );
  DFFRX2TS Q_reg_42_ ( .D(n107), .CK(clk), .RN(n132), .Q(Q[42]), .QN(n43) );
  DFFRX2TS Q_reg_30_ ( .D(n95), .CK(clk), .RN(n131), .Q(Q[30]), .QN(n31) );
  DFFRX2TS Q_reg_28_ ( .D(n93), .CK(clk), .RN(n130), .Q(Q[28]), .QN(n29) );
  DFFRX2TS Q_reg_26_ ( .D(n91), .CK(clk), .RN(n130), .Q(Q[26]), .QN(n27) );
  DFFRX2TS Q_reg_19_ ( .D(n84), .CK(clk), .RN(n128), .Q(Q[19]), .QN(n20) );
  DFFRX2TS Q_reg_13_ ( .D(n78), .CK(clk), .RN(n128), .Q(Q[13]), .QN(n14) );
  DFFRX2TS Q_reg_11_ ( .D(n76), .CK(clk), .RN(n128), .Q(Q[11]), .QN(n12) );
  DFFRX2TS Q_reg_62_ ( .D(n127), .CK(clk), .RN(n134), .Q(Q[62]), .QN(n63) );
  DFFRX2TS Q_reg_60_ ( .D(n125), .CK(clk), .RN(n134), .Q(Q[60]), .QN(n61) );
  DFFRX2TS Q_reg_58_ ( .D(n123), .CK(clk), .RN(n133), .Q(Q[58]), .QN(n59) );
  DFFRX2TS Q_reg_55_ ( .D(n120), .CK(clk), .RN(n133), .Q(Q[55]), .QN(n56) );
  DFFRX2TS Q_reg_53_ ( .D(n118), .CK(clk), .RN(n133), .Q(Q[53]), .QN(n54) );
  DFFRX2TS Q_reg_52_ ( .D(n117), .CK(clk), .RN(n133), .Q(Q[52]), .QN(n53) );
  DFFRX2TS Q_reg_51_ ( .D(n116), .CK(clk), .RN(n133), .Q(Q[51]), .QN(n52) );
  DFFRX2TS Q_reg_50_ ( .D(n115), .CK(clk), .RN(n133), .Q(Q[50]), .QN(n51) );
  DFFRX2TS Q_reg_49_ ( .D(n114), .CK(clk), .RN(n132), .Q(Q[49]), .QN(n50) );
  DFFRX2TS Q_reg_48_ ( .D(n113), .CK(clk), .RN(n132), .Q(Q[48]), .QN(n49) );
  DFFRX2TS Q_reg_47_ ( .D(n112), .CK(clk), .RN(n132), .Q(Q[47]), .QN(n48) );
  DFFRX2TS Q_reg_45_ ( .D(n110), .CK(clk), .RN(n132), .Q(Q[45]), .QN(n46) );
  DFFRX2TS Q_reg_43_ ( .D(n108), .CK(clk), .RN(n132), .Q(Q[43]), .QN(n44) );
  DFFRX2TS Q_reg_38_ ( .D(n103), .CK(clk), .RN(n131), .Q(Q[38]), .QN(n39) );
  DFFRX2TS Q_reg_29_ ( .D(n94), .CK(clk), .RN(n130), .Q(Q[29]), .QN(n30) );
  DFFRX2TS Q_reg_27_ ( .D(n92), .CK(clk), .RN(n130), .Q(Q[27]), .QN(n28) );
  DFFRX2TS Q_reg_25_ ( .D(n90), .CK(clk), .RN(n130), .Q(Q[25]), .QN(n26) );
  DFFRX2TS Q_reg_20_ ( .D(n85), .CK(clk), .RN(n130), .Q(Q[20]), .QN(n21) );
  DFFRX2TS Q_reg_18_ ( .D(n83), .CK(clk), .RN(n128), .Q(Q[18]), .QN(n19) );
  DFFRX2TS Q_reg_14_ ( .D(n79), .CK(clk), .RN(n128), .Q(Q[14]), .QN(n15) );
  DFFRX2TS Q_reg_12_ ( .D(n77), .CK(clk), .RN(n128), .Q(Q[12]), .QN(n13) );
  DFFRX2TS Q_reg_10_ ( .D(n75), .CK(clk), .RN(n128), .Q(Q[10]), .QN(n11) );
  DFFRX2TS Q_reg_7_ ( .D(n72), .CK(clk), .RN(n134), .Q(Q[7]), .QN(n8) );
  DFFRX2TS Q_reg_4_ ( .D(n69), .CK(clk), .RN(n134), .Q(Q[4]), .QN(n5) );
  DFFRX2TS Q_reg_59_ ( .D(n124), .CK(clk), .RN(n133), .Q(Q[59]), .QN(n60) );
  DFFRX2TS Q_reg_54_ ( .D(n119), .CK(clk), .RN(n133), .Q(Q[54]), .QN(n55) );
  DFFRX2TS Q_reg_6_ ( .D(n71), .CK(clk), .RN(n134), .Q(Q[6]), .QN(n7) );
  DFFRX2TS Q_reg_40_ ( .D(n105), .CK(clk), .RN(n132), .Q(Q[40]), .QN(n41) );
  DFFRX2TS Q_reg_24_ ( .D(n89), .CK(clk), .RN(n130), .Q(Q[24]), .QN(n25) );
  DFFRX2TS Q_reg_37_ ( .D(n102), .CK(clk), .RN(n131), .Q(Q[37]), .QN(n38) );
  DFFRX2TS Q_reg_41_ ( .D(n106), .CK(clk), .RN(n132), .Q(Q[41]), .QN(n42) );
  DFFRX2TS Q_reg_5_ ( .D(n70), .CK(clk), .RN(n134), .Q(Q[5]), .QN(n6) );
  DFFRX2TS Q_reg_2_ ( .D(n67), .CK(clk), .RN(n149), .Q(Q[2]), .QN(n3) );
  DFFRX2TS Q_reg_1_ ( .D(n66), .CK(clk), .RN(n149), .Q(Q[1]), .QN(n2) );
  DFFRX2TS Q_reg_0_ ( .D(n65), .CK(clk), .RN(n149), .Q(Q[0]), .QN(n1) );
  DFFRX2TS Q_reg_3_ ( .D(n68), .CK(clk), .RN(n149), .Q(Q[3]), .QN(n4) );
  CLKBUFX2TS U2 ( .A(n147), .Y(n140) );
  CLKBUFX2TS U3 ( .A(n148), .Y(n139) );
  CLKBUFX2TS U4 ( .A(n146), .Y(n137) );
  CLKBUFX2TS U5 ( .A(n146), .Y(n136) );
  CLKBUFX2TS U6 ( .A(n148), .Y(n138) );
  CLKBUFX2TS U7 ( .A(n147), .Y(n141) );
  CLKBUFX2TS U8 ( .A(n135), .Y(n142) );
  CLKBUFX2TS U9 ( .A(n135), .Y(n143) );
  CLKBUFX2TS U10 ( .A(n146), .Y(n144) );
  CLKBUFX2TS U11 ( .A(n146), .Y(n145) );
  CLKBUFX2TS U12 ( .A(n135), .Y(n147) );
  CLKBUFX2TS U13 ( .A(load), .Y(n146) );
  CLKBUFX2TS U14 ( .A(n135), .Y(n148) );
  CLKBUFX2TS U15 ( .A(load), .Y(n135) );
  CLKBUFX2TS U16 ( .A(n149), .Y(n128) );
  CLKBUFX2TS U17 ( .A(n149), .Y(n130) );
  CLKBUFX2TS U18 ( .A(n149), .Y(n131) );
  CLKBUFX2TS U19 ( .A(n149), .Y(n132) );
  CLKBUFX2TS U20 ( .A(n149), .Y(n133) );
  CLKBUFX2TS U21 ( .A(n149), .Y(n134) );
  OAI2BB2XLTS U22 ( .B0(n1), .B1(n141), .A0N(n145), .A1N(D[0]), .Y(n65) );
  OAI2BB2XLTS U23 ( .B0(n2), .B1(n140), .A0N(D[1]), .A1N(n145), .Y(n66) );
  OAI2BB2XLTS U24 ( .B0(n3), .B1(n141), .A0N(D[2]), .A1N(n145), .Y(n67) );
  OAI2BB2XLTS U25 ( .B0(n4), .B1(n140), .A0N(D[3]), .A1N(n144), .Y(n68) );
  OAI2BB2XLTS U26 ( .B0(n5), .B1(n140), .A0N(D[4]), .A1N(n144), .Y(n69) );
  OAI2BB2XLTS U27 ( .B0(n6), .B1(n141), .A0N(D[5]), .A1N(n143), .Y(n70) );
  OAI2BB2XLTS U28 ( .B0(n7), .B1(n141), .A0N(D[6]), .A1N(n144), .Y(n71) );
  OAI2BB2XLTS U29 ( .B0(n8), .B1(n140), .A0N(D[7]), .A1N(n144), .Y(n72) );
  OAI2BB2XLTS U30 ( .B0(n9), .B1(n140), .A0N(D[8]), .A1N(n142), .Y(n73) );
  OAI2BB2XLTS U31 ( .B0(n10), .B1(n139), .A0N(D[9]), .A1N(n143), .Y(n74) );
  OAI2BB2XLTS U32 ( .B0(n11), .B1(n139), .A0N(D[10]), .A1N(n142), .Y(n75) );
  OAI2BB2XLTS U33 ( .B0(n12), .B1(n140), .A0N(D[11]), .A1N(n145), .Y(n76) );
  OAI2BB2XLTS U34 ( .B0(n13), .B1(n140), .A0N(D[12]), .A1N(n142), .Y(n77) );
  OAI2BB2XLTS U35 ( .B0(n14), .B1(n139), .A0N(D[13]), .A1N(n148), .Y(n78) );
  OAI2BB2XLTS U36 ( .B0(n15), .B1(n140), .A0N(D[14]), .A1N(n142), .Y(n79) );
  OAI2BB2XLTS U37 ( .B0(n16), .B1(n140), .A0N(D[15]), .A1N(n145), .Y(n80) );
  OAI2BB2XLTS U38 ( .B0(n17), .B1(n139), .A0N(D[16]), .A1N(n135), .Y(n81) );
  OAI2BB2XLTS U39 ( .B0(n18), .B1(n139), .A0N(D[17]), .A1N(n148), .Y(n82) );
  OAI2BB2XLTS U40 ( .B0(n19), .B1(n140), .A0N(D[18]), .A1N(n147), .Y(n83) );
  OAI2BB2XLTS U41 ( .B0(n20), .B1(n139), .A0N(D[19]), .A1N(n142), .Y(n84) );
  OAI2BB2XLTS U42 ( .B0(n21), .B1(n139), .A0N(D[20]), .A1N(n141), .Y(n85) );
  OAI2BB2XLTS U43 ( .B0(n22), .B1(n139), .A0N(D[21]), .A1N(n135), .Y(n86) );
  OAI2BB2XLTS U44 ( .B0(n23), .B1(n139), .A0N(D[22]), .A1N(n141), .Y(n87) );
  OAI2BB2XLTS U45 ( .B0(n24), .B1(n138), .A0N(D[23]), .A1N(n135), .Y(n88) );
  OAI2BB2XLTS U46 ( .B0(n25), .B1(n138), .A0N(D[24]), .A1N(n141), .Y(n89) );
  OAI2BB2XLTS U47 ( .B0(n26), .B1(n138), .A0N(D[25]), .A1N(n135), .Y(n90) );
  OAI2BB2XLTS U48 ( .B0(n27), .B1(n138), .A0N(D[26]), .A1N(n146), .Y(n91) );
  OAI2BB2XLTS U49 ( .B0(n28), .B1(n138), .A0N(D[27]), .A1N(n141), .Y(n92) );
  OAI2BB2XLTS U50 ( .B0(n29), .B1(n138), .A0N(D[28]), .A1N(n141), .Y(n93) );
  OAI2BB2XLTS U51 ( .B0(n30), .B1(n138), .A0N(D[29]), .A1N(n146), .Y(n94) );
  OAI2BB2XLTS U52 ( .B0(n31), .B1(n138), .A0N(D[30]), .A1N(n141), .Y(n95) );
  OAI2BB2XLTS U53 ( .B0(n32), .B1(n139), .A0N(D[31]), .A1N(n146), .Y(n96) );
  OAI2BB2XLTS U54 ( .B0(n33), .B1(n138), .A0N(D[32]), .A1N(load), .Y(n97) );
  OAI2BB2XLTS U55 ( .B0(n34), .B1(n137), .A0N(D[33]), .A1N(n147), .Y(n98) );
  OAI2BB2XLTS U56 ( .B0(n35), .B1(n137), .A0N(D[34]), .A1N(n146), .Y(n99) );
  OAI2BB2XLTS U57 ( .B0(n36), .B1(n137), .A0N(D[35]), .A1N(load), .Y(n100) );
  OAI2BB2XLTS U58 ( .B0(n37), .B1(n137), .A0N(D[36]), .A1N(n146), .Y(n101) );
  OAI2BB2XLTS U59 ( .B0(n38), .B1(n137), .A0N(D[37]), .A1N(load), .Y(n102) );
  OAI2BB2XLTS U60 ( .B0(n39), .B1(n137), .A0N(D[38]), .A1N(n142), .Y(n103) );
  OAI2BB2XLTS U61 ( .B0(n40), .B1(n137), .A0N(D[39]), .A1N(n142), .Y(n104) );
  OAI2BB2XLTS U62 ( .B0(n41), .B1(n137), .A0N(D[40]), .A1N(load), .Y(n105) );
  OAI2BB2XLTS U63 ( .B0(n42), .B1(n137), .A0N(D[41]), .A1N(n142), .Y(n106) );
  OAI2BB2XLTS U64 ( .B0(n43), .B1(n137), .A0N(D[42]), .A1N(n135), .Y(n107) );
  OAI2BB2XLTS U65 ( .B0(n44), .B1(n136), .A0N(D[43]), .A1N(n142), .Y(n108) );
  OAI2BB2XLTS U66 ( .B0(n45), .B1(n136), .A0N(D[44]), .A1N(n143), .Y(n109) );
  OAI2BB2XLTS U67 ( .B0(n46), .B1(n136), .A0N(D[45]), .A1N(n142), .Y(n110) );
  OAI2BB2XLTS U68 ( .B0(n47), .B1(n136), .A0N(D[46]), .A1N(n143), .Y(n111) );
  OAI2BB2XLTS U69 ( .B0(n48), .B1(n136), .A0N(D[47]), .A1N(n143), .Y(n112) );
  OAI2BB2XLTS U70 ( .B0(n49), .B1(n136), .A0N(D[48]), .A1N(n143), .Y(n113) );
  OAI2BB2XLTS U71 ( .B0(n50), .B1(n136), .A0N(D[49]), .A1N(n143), .Y(n114) );
  OAI2BB2XLTS U72 ( .B0(n51), .B1(n136), .A0N(D[50]), .A1N(n143), .Y(n115) );
  OAI2BB2XLTS U73 ( .B0(n52), .B1(n136), .A0N(D[51]), .A1N(n143), .Y(n116) );
  OAI2BB2XLTS U74 ( .B0(n53), .B1(n136), .A0N(D[52]), .A1N(n143), .Y(n117) );
  OAI2BB2XLTS U75 ( .B0(n54), .B1(n148), .A0N(D[53]), .A1N(n144), .Y(n118) );
  OAI2BB2XLTS U76 ( .B0(n55), .B1(n147), .A0N(D[54]), .A1N(n144), .Y(n119) );
  OAI2BB2XLTS U77 ( .B0(n56), .B1(n146), .A0N(D[55]), .A1N(n144), .Y(n120) );
  OAI2BB2XLTS U78 ( .B0(n57), .B1(n148), .A0N(D[56]), .A1N(n144), .Y(n121) );
  OAI2BB2XLTS U79 ( .B0(n58), .B1(n147), .A0N(D[57]), .A1N(n144), .Y(n122) );
  OAI2BB2XLTS U80 ( .B0(n59), .B1(n147), .A0N(D[58]), .A1N(n144), .Y(n123) );
  OAI2BB2XLTS U81 ( .B0(n60), .B1(n148), .A0N(D[59]), .A1N(n145), .Y(n124) );
  OAI2BB2XLTS U82 ( .B0(n61), .B1(n135), .A0N(D[60]), .A1N(n145), .Y(n125) );
  OAI2BB2XLTS U83 ( .B0(n62), .B1(load), .A0N(D[61]), .A1N(n145), .Y(n126) );
  OAI2BB2XLTS U84 ( .B0(n63), .B1(load), .A0N(D[62]), .A1N(n145), .Y(n127) );
  OAI2BB2XLTS U85 ( .B0(n64), .B1(n138), .A0N(D[63]), .A1N(n145), .Y(n129) );
  INVX2TS U86 ( .A(rst), .Y(n149) );
endmodule


module RegisterAdd_W64_1 ( clk, rst, load, D, Q );
  input [63:0] D;
  output [63:0] Q;
  input clk, rst, load;
  wire   n128, n130, n131, n132, n133, n134, n135, n136, n137, n138, n139,
         n140, n141, n142, n143, n144, n145, n146, n147, n148, n149, n150,
         n151, n152, n153, n154, n155, n156, n157, n158, n159, n160, n161,
         n162, n163, n164, n165, n166, n167, n168, n169, n170, n171, n172,
         n173, n174, n175, n176, n177, n178, n179, n180, n181, n182, n183,
         n184, n185, n186, n187, n188, n189, n190, n191, n192, n193, n194,
         n195, n196, n197, n198, n199, n200, n201, n202, n203, n204, n205,
         n206, n207, n208, n209, n210, n211, n212, n213, n214, n215, n216,
         n217, n218, n219, n220, n221, n222, n223, n224, n225, n226, n227,
         n228, n229, n230, n231, n232, n233, n234, n235, n236, n237, n238,
         n239, n240, n241, n242, n243, n244, n245, n246, n247, n248, n249,
         n250, n251, n252, n253, n254, n255, n256, n257, n258, n259, n260,
         n261, n262, n263, n264, n265, n266, n267, n268, n269, n270, n271,
         n272, n273, n274, n275, n276, n277;

  DFFRX2TS Q_reg_63_ ( .D(n150), .CK(clk), .RN(n149), .Q(Q[63]), .QN(n214) );
  DFFRX2TS Q_reg_22_ ( .D(n191), .CK(clk), .RN(n131), .Q(Q[22]), .QN(n255) );
  DFFRX2TS Q_reg_23_ ( .D(n190), .CK(clk), .RN(n131), .Q(Q[23]), .QN(n254) );
  DFFRX2TS Q_reg_21_ ( .D(n192), .CK(clk), .RN(n131), .Q(Q[21]), .QN(n256) );
  DFFRX2TS Q_reg_53_ ( .D(n160), .CK(clk), .RN(n134), .Q(Q[53]), .QN(n224) );
  DFFRX2TS Q_reg_51_ ( .D(n162), .CK(clk), .RN(n134), .Q(Q[51]), .QN(n226) );
  DFFRX2TS Q_reg_49_ ( .D(n164), .CK(clk), .RN(n133), .Q(Q[49]), .QN(n228) );
  DFFRX2TS Q_reg_25_ ( .D(n188), .CK(clk), .RN(n131), .Q(Q[25]), .QN(n252) );
  DFFRX2TS Q_reg_55_ ( .D(n158), .CK(clk), .RN(n134), .Q(Q[55]), .QN(n222) );
  DFFRX2TS Q_reg_47_ ( .D(n166), .CK(clk), .RN(n133), .Q(Q[47]), .QN(n230) );
  DFFRX2TS Q_reg_52_ ( .D(n161), .CK(clk), .RN(n134), .Q(Q[52]), .QN(n225) );
  DFFRX2TS Q_reg_50_ ( .D(n163), .CK(clk), .RN(n134), .Q(Q[50]), .QN(n227) );
  DFFRX2TS Q_reg_48_ ( .D(n165), .CK(clk), .RN(n133), .Q(Q[48]), .QN(n229) );
  DFFRX2TS Q_reg_4_ ( .D(n209), .CK(clk), .RN(n128), .Q(Q[4]), .QN(n273) );
  DFFRX2TS Q_reg_7_ ( .D(n206), .CK(clk), .RN(n128), .Q(Q[7]), .QN(n270) );
  DFFRX2TS Q_reg_40_ ( .D(n173), .CK(clk), .RN(n133), .Q(Q[40]), .QN(n237) );
  DFFRX2TS Q_reg_24_ ( .D(n189), .CK(clk), .RN(n131), .Q(Q[24]), .QN(n253) );
  DFFRX2TS Q_reg_62_ ( .D(n151), .CK(clk), .RN(n149), .Q(Q[62]), .QN(n215) );
  DFFRX2TS Q_reg_60_ ( .D(n153), .CK(clk), .RN(n149), .Q(Q[60]), .QN(n217) );
  DFFRX2TS Q_reg_58_ ( .D(n155), .CK(clk), .RN(n134), .Q(Q[58]), .QN(n219) );
  DFFRX2TS Q_reg_45_ ( .D(n168), .CK(clk), .RN(n133), .Q(Q[45]), .QN(n232) );
  DFFRX2TS Q_reg_43_ ( .D(n170), .CK(clk), .RN(n133), .Q(Q[43]), .QN(n234) );
  DFFRX2TS Q_reg_38_ ( .D(n175), .CK(clk), .RN(n132), .Q(Q[38]), .QN(n239) );
  DFFRX2TS Q_reg_29_ ( .D(n184), .CK(clk), .RN(n131), .Q(Q[29]), .QN(n248) );
  DFFRX2TS Q_reg_27_ ( .D(n186), .CK(clk), .RN(n131), .Q(Q[27]), .QN(n250) );
  DFFRX2TS Q_reg_20_ ( .D(n193), .CK(clk), .RN(n131), .Q(Q[20]), .QN(n257) );
  DFFRX2TS Q_reg_18_ ( .D(n195), .CK(clk), .RN(n130), .Q(Q[18]), .QN(n259) );
  DFFRX2TS Q_reg_14_ ( .D(n199), .CK(clk), .RN(n130), .Q(Q[14]), .QN(n263) );
  DFFRX2TS Q_reg_12_ ( .D(n201), .CK(clk), .RN(n130), .Q(Q[12]), .QN(n265) );
  DFFRX2TS Q_reg_10_ ( .D(n203), .CK(clk), .RN(n130), .Q(Q[10]), .QN(n267) );
  DFFRX2TS Q_reg_1_ ( .D(n212), .CK(clk), .RN(n128), .Q(Q[1]), .QN(n276) );
  DFFRX2TS Q_reg_61_ ( .D(n152), .CK(clk), .RN(n149), .Q(Q[61]), .QN(n216) );
  DFFRX2TS Q_reg_56_ ( .D(n157), .CK(clk), .RN(n134), .Q(Q[56]), .QN(n221) );
  DFFRX2TS Q_reg_46_ ( .D(n167), .CK(clk), .RN(n133), .Q(Q[46]), .QN(n231) );
  DFFRX2TS Q_reg_44_ ( .D(n169), .CK(clk), .RN(n133), .Q(Q[44]), .QN(n233) );
  DFFRX2TS Q_reg_42_ ( .D(n171), .CK(clk), .RN(n133), .Q(Q[42]), .QN(n235) );
  DFFRX2TS Q_reg_36_ ( .D(n177), .CK(clk), .RN(n132), .Q(Q[36]), .QN(n241) );
  DFFRX2TS Q_reg_34_ ( .D(n179), .CK(clk), .RN(n132), .Q(Q[34]), .QN(n243) );
  DFFRX2TS Q_reg_33_ ( .D(n180), .CK(clk), .RN(n132), .Q(Q[33]), .QN(n244) );
  DFFRX2TS Q_reg_32_ ( .D(n181), .CK(clk), .RN(n132), .Q(Q[32]), .QN(n245) );
  DFFRX2TS Q_reg_30_ ( .D(n183), .CK(clk), .RN(n132), .Q(Q[30]), .QN(n247) );
  DFFRX2TS Q_reg_28_ ( .D(n185), .CK(clk), .RN(n131), .Q(Q[28]), .QN(n249) );
  DFFRX2TS Q_reg_26_ ( .D(n187), .CK(clk), .RN(n131), .Q(Q[26]), .QN(n251) );
  DFFRX2TS Q_reg_19_ ( .D(n194), .CK(clk), .RN(n130), .Q(Q[19]), .QN(n258) );
  DFFRX2TS Q_reg_17_ ( .D(n196), .CK(clk), .RN(n130), .Q(Q[17]), .QN(n260) );
  DFFRX2TS Q_reg_15_ ( .D(n198), .CK(clk), .RN(n130), .Q(Q[15]), .QN(n262) );
  DFFRX2TS Q_reg_13_ ( .D(n200), .CK(clk), .RN(n130), .Q(Q[13]), .QN(n264) );
  DFFRX2TS Q_reg_11_ ( .D(n202), .CK(clk), .RN(n130), .Q(Q[11]), .QN(n266) );
  DFFRX2TS Q_reg_31_ ( .D(n182), .CK(clk), .RN(n132), .Q(Q[31]), .QN(n246) );
  DFFRX2TS Q_reg_59_ ( .D(n154), .CK(clk), .RN(n134), .Q(Q[59]), .QN(n218) );
  DFFRX2TS Q_reg_57_ ( .D(n156), .CK(clk), .RN(n134), .Q(Q[57]), .QN(n220) );
  DFFRX2TS Q_reg_54_ ( .D(n159), .CK(clk), .RN(n134), .Q(Q[54]), .QN(n223) );
  DFFRX2TS Q_reg_39_ ( .D(n174), .CK(clk), .RN(n132), .Q(Q[39]), .QN(n238) );
  DFFRX2TS Q_reg_35_ ( .D(n178), .CK(clk), .RN(n132), .Q(Q[35]), .QN(n242) );
  DFFRX2TS Q_reg_6_ ( .D(n207), .CK(clk), .RN(n128), .Q(Q[6]), .QN(n271) );
  DFFRX2TS Q_reg_16_ ( .D(n197), .CK(clk), .RN(n130), .Q(Q[16]), .QN(n261) );
  DFFRX2TS Q_reg_8_ ( .D(n205), .CK(clk), .RN(n128), .Q(Q[8]), .QN(n269) );
  DFFRX2TS Q_reg_0_ ( .D(n213), .CK(clk), .RN(n128), .Q(Q[0]), .QN(n277) );
  DFFRX2TS Q_reg_3_ ( .D(n210), .CK(clk), .RN(n128), .Q(Q[3]), .QN(n274) );
  DFFRX2TS Q_reg_41_ ( .D(n172), .CK(clk), .RN(n133), .Q(Q[41]), .QN(n236) );
  DFFRX2TS Q_reg_5_ ( .D(n208), .CK(clk), .RN(n128), .Q(Q[5]), .QN(n272) );
  DFFRX2TS Q_reg_2_ ( .D(n211), .CK(clk), .RN(n128), .Q(Q[2]), .QN(n275) );
  DFFRX2TS Q_reg_9_ ( .D(n204), .CK(clk), .RN(n128), .Q(Q[9]), .QN(n268) );
  DFFRX2TS Q_reg_37_ ( .D(n176), .CK(clk), .RN(n132), .Q(Q[37]), .QN(n240) );
  CLKBUFX2TS U2 ( .A(n136), .Y(n138) );
  CLKBUFX2TS U3 ( .A(n147), .Y(n139) );
  CLKBUFX2TS U4 ( .A(n147), .Y(n140) );
  CLKBUFX2TS U5 ( .A(n146), .Y(n141) );
  CLKBUFX2TS U6 ( .A(n146), .Y(n142) );
  CLKBUFX2TS U7 ( .A(n145), .Y(n143) );
  CLKBUFX2TS U8 ( .A(n145), .Y(n144) );
  CLKBUFX2TS U9 ( .A(n136), .Y(n148) );
  CLKBUFX2TS U10 ( .A(n135), .Y(n147) );
  CLKBUFX2TS U11 ( .A(n135), .Y(n146) );
  CLKBUFX2TS U12 ( .A(n135), .Y(n145) );
  CLKBUFX2TS U13 ( .A(n135), .Y(n137) );
  CLKBUFX2TS U14 ( .A(load), .Y(n136) );
  CLKBUFX2TS U15 ( .A(load), .Y(n135) );
  CLKBUFX2TS U16 ( .A(n149), .Y(n128) );
  CLKBUFX2TS U17 ( .A(n149), .Y(n130) );
  CLKBUFX2TS U18 ( .A(n149), .Y(n131) );
  CLKBUFX2TS U19 ( .A(n149), .Y(n132) );
  CLKBUFX2TS U20 ( .A(n149), .Y(n133) );
  CLKBUFX2TS U21 ( .A(n149), .Y(n134) );
  OAI2BB2XLTS U22 ( .B0(n277), .B1(n148), .A0N(n144), .A1N(D[0]), .Y(n213) );
  OAI2BB2XLTS U23 ( .B0(n276), .B1(n148), .A0N(D[1]), .A1N(n144), .Y(n212) );
  OAI2BB2XLTS U24 ( .B0(n275), .B1(n146), .A0N(D[2]), .A1N(n144), .Y(n211) );
  OAI2BB2XLTS U25 ( .B0(n274), .B1(n148), .A0N(D[3]), .A1N(n143), .Y(n210) );
  OAI2BB2XLTS U26 ( .B0(n273), .B1(n148), .A0N(D[4]), .A1N(n143), .Y(n209) );
  OAI2BB2XLTS U27 ( .B0(n272), .B1(n145), .A0N(D[5]), .A1N(n142), .Y(n208) );
  OAI2BB2XLTS U28 ( .B0(n271), .B1(n148), .A0N(D[6]), .A1N(n143), .Y(n207) );
  OAI2BB2XLTS U29 ( .B0(n270), .B1(n148), .A0N(D[7]), .A1N(n143), .Y(n206) );
  OAI2BB2XLTS U30 ( .B0(n269), .B1(n148), .A0N(D[8]), .A1N(n141), .Y(n205) );
  OAI2BB2XLTS U31 ( .B0(n268), .B1(n135), .A0N(D[9]), .A1N(n142), .Y(n204) );
  OAI2BB2XLTS U32 ( .B0(n267), .B1(n136), .A0N(D[10]), .A1N(n141), .Y(n203) );
  OAI2BB2XLTS U33 ( .B0(n266), .B1(n148), .A0N(D[11]), .A1N(n140), .Y(n202) );
  OAI2BB2XLTS U34 ( .B0(n265), .B1(n148), .A0N(D[12]), .A1N(n141), .Y(n201) );
  OAI2BB2XLTS U35 ( .B0(n264), .B1(n135), .A0N(D[13]), .A1N(n140), .Y(n200) );
  OAI2BB2XLTS U36 ( .B0(n263), .B1(n147), .A0N(D[14]), .A1N(n141), .Y(n199) );
  OAI2BB2XLTS U37 ( .B0(n262), .B1(n146), .A0N(D[15]), .A1N(n140), .Y(n198) );
  OAI2BB2XLTS U38 ( .B0(n261), .B1(n135), .A0N(D[16]), .A1N(n139), .Y(n197) );
  OAI2BB2XLTS U39 ( .B0(n260), .B1(n136), .A0N(D[17]), .A1N(n140), .Y(n196) );
  OAI2BB2XLTS U40 ( .B0(n259), .B1(n145), .A0N(D[18]), .A1N(n139), .Y(n195) );
  OAI2BB2XLTS U41 ( .B0(n258), .B1(load), .A0N(D[19]), .A1N(n141), .Y(n194) );
  OAI2BB2XLTS U42 ( .B0(n257), .B1(n135), .A0N(D[20]), .A1N(n144), .Y(n193) );
  OAI2BB2XLTS U43 ( .B0(n256), .B1(load), .A0N(D[21]), .A1N(n140), .Y(n192) );
  OAI2BB2XLTS U44 ( .B0(n255), .B1(n135), .A0N(D[22]), .A1N(n144), .Y(n191) );
  OAI2BB2XLTS U45 ( .B0(n254), .B1(n138), .A0N(D[23]), .A1N(n139), .Y(n190) );
  OAI2BB2XLTS U46 ( .B0(n253), .B1(n138), .A0N(D[24]), .A1N(n146), .Y(n189) );
  OAI2BB2XLTS U47 ( .B0(n252), .B1(n138), .A0N(D[25]), .A1N(n139), .Y(n188) );
  OAI2BB2XLTS U48 ( .B0(n251), .B1(n138), .A0N(D[26]), .A1N(n139), .Y(n187) );
  OAI2BB2XLTS U49 ( .B0(n250), .B1(n138), .A0N(D[27]), .A1N(n145), .Y(n186) );
  OAI2BB2XLTS U50 ( .B0(n249), .B1(n138), .A0N(D[28]), .A1N(n147), .Y(n185) );
  OAI2BB2XLTS U51 ( .B0(n248), .B1(n138), .A0N(D[29]), .A1N(n139), .Y(n184) );
  OAI2BB2XLTS U52 ( .B0(n247), .B1(n138), .A0N(D[30]), .A1N(n148), .Y(n183) );
  OAI2BB2XLTS U53 ( .B0(n246), .B1(load), .A0N(D[31]), .A1N(n139), .Y(n182) );
  OAI2BB2XLTS U54 ( .B0(n245), .B1(n138), .A0N(D[32]), .A1N(n140), .Y(n181) );
  OAI2BB2XLTS U55 ( .B0(n244), .B1(n136), .A0N(D[33]), .A1N(n139), .Y(n180) );
  OAI2BB2XLTS U56 ( .B0(n243), .B1(n147), .A0N(D[34]), .A1N(n139), .Y(n179) );
  OAI2BB2XLTS U57 ( .B0(n242), .B1(n146), .A0N(D[35]), .A1N(n140), .Y(n178) );
  OAI2BB2XLTS U58 ( .B0(n241), .B1(n145), .A0N(D[36]), .A1N(n139), .Y(n177) );
  OAI2BB2XLTS U59 ( .B0(n240), .B1(n136), .A0N(D[37]), .A1N(n140), .Y(n176) );
  OAI2BB2XLTS U60 ( .B0(n239), .B1(n147), .A0N(D[38]), .A1N(n141), .Y(n175) );
  OAI2BB2XLTS U61 ( .B0(n238), .B1(n146), .A0N(D[39]), .A1N(n141), .Y(n174) );
  OAI2BB2XLTS U62 ( .B0(n237), .B1(n145), .A0N(D[40]), .A1N(n140), .Y(n173) );
  OAI2BB2XLTS U63 ( .B0(n236), .B1(n146), .A0N(D[41]), .A1N(n141), .Y(n172) );
  OAI2BB2XLTS U64 ( .B0(n235), .B1(n145), .A0N(D[42]), .A1N(n140), .Y(n171) );
  OAI2BB2XLTS U65 ( .B0(n234), .B1(n136), .A0N(D[43]), .A1N(n141), .Y(n170) );
  OAI2BB2XLTS U66 ( .B0(n233), .B1(n147), .A0N(D[44]), .A1N(n142), .Y(n169) );
  OAI2BB2XLTS U67 ( .B0(n232), .B1(load), .A0N(D[45]), .A1N(n141), .Y(n168) );
  OAI2BB2XLTS U68 ( .B0(n231), .B1(load), .A0N(D[46]), .A1N(n142), .Y(n167) );
  OAI2BB2XLTS U69 ( .B0(n230), .B1(load), .A0N(D[47]), .A1N(n142), .Y(n166) );
  OAI2BB2XLTS U70 ( .B0(n229), .B1(n136), .A0N(D[48]), .A1N(n142), .Y(n165) );
  OAI2BB2XLTS U71 ( .B0(n228), .B1(n135), .A0N(D[49]), .A1N(n142), .Y(n164) );
  OAI2BB2XLTS U72 ( .B0(n227), .B1(n136), .A0N(D[50]), .A1N(n142), .Y(n163) );
  OAI2BB2XLTS U73 ( .B0(n226), .B1(n136), .A0N(D[51]), .A1N(n142), .Y(n162) );
  OAI2BB2XLTS U74 ( .B0(n225), .B1(n147), .A0N(D[52]), .A1N(n142), .Y(n161) );
  OAI2BB2XLTS U75 ( .B0(n224), .B1(n137), .A0N(D[53]), .A1N(n143), .Y(n160) );
  OAI2BB2XLTS U76 ( .B0(n223), .B1(n137), .A0N(D[54]), .A1N(n143), .Y(n159) );
  OAI2BB2XLTS U77 ( .B0(n222), .B1(n137), .A0N(D[55]), .A1N(n143), .Y(n158) );
  OAI2BB2XLTS U78 ( .B0(n221), .B1(n137), .A0N(D[56]), .A1N(n143), .Y(n157) );
  OAI2BB2XLTS U79 ( .B0(n220), .B1(n137), .A0N(D[57]), .A1N(n143), .Y(n156) );
  OAI2BB2XLTS U80 ( .B0(n219), .B1(n137), .A0N(D[58]), .A1N(n143), .Y(n155) );
  OAI2BB2XLTS U81 ( .B0(n218), .B1(n137), .A0N(D[59]), .A1N(n144), .Y(n154) );
  OAI2BB2XLTS U82 ( .B0(n217), .B1(n137), .A0N(D[60]), .A1N(n144), .Y(n153) );
  OAI2BB2XLTS U83 ( .B0(n216), .B1(n137), .A0N(D[61]), .A1N(n144), .Y(n152) );
  OAI2BB2XLTS U84 ( .B0(n215), .B1(n137), .A0N(D[62]), .A1N(n144), .Y(n151) );
  OAI2BB2XLTS U85 ( .B0(n214), .B1(n138), .A0N(D[63]), .A1N(n144), .Y(n150) );
  INVX2TS U86 ( .A(rst), .Y(n149) );
endmodule


module RegisterAdd_W1_10 ( clk, rst, load, D, Q );
  input [0:0] D;
  output [0:0] Q;
  input clk, rst, load;
  wire   n2, n4, n5;

  DFFRX2TS Q_reg_0_ ( .D(n4), .CK(clk), .RN(n2), .Q(Q[0]), .QN(n5) );
  OAI2BB2XLTS U2 ( .B0(n5), .B1(load), .A0N(load), .A1N(D[0]), .Y(n4) );
  INVX2TS U3 ( .A(rst), .Y(n2) );
endmodule


module Comparator_W63 ( Data_X_i, Data_Y_i, gtXY_o, eqXY_o );
  input [62:0] Data_X_i;
  input [62:0] Data_Y_i;
  output gtXY_o, eqXY_o;
  wire   n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82,
         n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96,
         n97, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107, n108,
         n109, n110, n111, n112, n113, n114, n115, n116, n117, n118, n119,
         n120, n121, n122, n123, n124, n125, n126, n127, n128, n129, n130,
         n131, n132, n133, n134, n135, n136, n137, n138, n139, n140, n141,
         n142, n143, n144, n145, n146, n147, n148, n149, n150, n151, n152,
         n153, n154, n155, n156, n157, n158, n159, n160, n161, n162, n163,
         n164, n165, n166, n167, n168, n169, n170, n171, n172, n173, n174,
         n175, n176, n177, n178, n179, n180, n181, n182, n183, n184, n185,
         n186, n187, n188, n189, n190, n191, n192, n193, n194, n195, n196,
         n197, n198, n199, n200, n201, n202, n204, n205, n206, n207, n208,
         n209, n210, n211, n212, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11,
         n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25,
         n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39,
         n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53,
         n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67,
         n68, n203;

  XNOR2X1TS U1 ( .A(Data_X_i[3]), .B(Data_Y_i[3]), .Y(n76) );
  NOR4BX1TS U2 ( .AN(n211), .B(n212), .C(n156), .D(n159), .Y(n187) );
  XOR2X1TS U3 ( .A(n203), .B(Data_Y_i[0]), .Y(n74) );
  XOR2X1TS U4 ( .A(n67), .B(Data_Y_i[2]), .Y(n77) );
  OAI21X1TS U5 ( .A0(n74), .A1(n203), .B0(n75), .Y(n123) );
  AOI21X1TS U6 ( .A0(n76), .A1(n77), .B0(n36), .Y(n126) );
  INVX2TS U7 ( .A(n125), .Y(n36) );
  NOR4XLTS U8 ( .A(n69), .B(n70), .C(n71), .D(n72), .Y(eqXY_o) );
  NAND4X1TS U9 ( .A(n74), .B(n75), .C(n76), .D(n77), .Y(n69) );
  NAND2X1TS U10 ( .A(n73), .B(n34), .Y(n70) );
  XNOR2X1TS U11 ( .A(Data_X_i[9]), .B(n32), .Y(n111) );
  AOI22X1TS U12 ( .A0(n109), .A1(n110), .B0(Data_Y_i[10]), .B1(n62), .Y(n107)
         );
  OAI32X1TS U13 ( .A0(n111), .A1(Data_X_i[8]), .A2(n33), .B0(Data_X_i[9]), 
        .B1(n32), .Y(n110) );
  INVX2TS U14 ( .A(Data_Y_i[8]), .Y(n33) );
  AOI22X1TS U15 ( .A0(n166), .A1(n167), .B0(Data_Y_i[45]), .B1(n48), .Y(n164)
         );
  OAI22X1TS U16 ( .A0(Data_X_i[44]), .A1(n11), .B0(n168), .B1(n169), .Y(n167)
         );
  AOI22X1TS U17 ( .A0(n170), .A1(n171), .B0(Data_Y_i[43]), .B1(n49), .Y(n168)
         );
  OAI22X1TS U18 ( .A0(Data_X_i[42]), .A1(n12), .B0(n172), .B1(n173), .Y(n171)
         );
  OA21XLTS U19 ( .A0(Data_Y_i[1]), .A1(n68), .B0(n124), .Y(n75) );
  AOI22X1TS U20 ( .A0(n184), .A1(n185), .B0(Data_Y_i[38]), .B1(n52), .Y(n175)
         );
  OAI32X1TS U21 ( .A0(n186), .A1(Data_X_i[36]), .A2(n15), .B0(Data_X_i[37]), 
        .B1(n14), .Y(n185) );
  INVX2TS U22 ( .A(Data_Y_i[37]), .Y(n14) );
  AOI22X1TS U23 ( .A0(n101), .A1(n102), .B0(Data_Y_i[14]), .B1(n60), .Y(n99)
         );
  OAI22X1TS U24 ( .A0(Data_X_i[13]), .A1(n30), .B0(n103), .B1(n104), .Y(n102)
         );
  AOI22X1TS U25 ( .A0(n105), .A1(n106), .B0(Data_Y_i[12]), .B1(n61), .Y(n103)
         );
  OAI22X1TS U26 ( .A0(Data_X_i[11]), .A1(n31), .B0(n107), .B1(n108), .Y(n106)
         );
  AOI32X1TS U27 ( .A0(n76), .A1(n67), .A2(Data_Y_i[2]), .B0(n66), .B1(
        Data_Y_i[3]), .Y(n125) );
  INVX2TS U28 ( .A(Data_X_i[3]), .Y(n66) );
  XOR2X1TS U29 ( .A(n64), .B(Data_Y_i[5]), .Y(n120) );
  XOR2X1TS U30 ( .A(n50), .B(Data_Y_i[41]), .Y(n174) );
  AOI32X1TS U31 ( .A0(Data_Y_i[40]), .A1(n51), .A2(n174), .B0(Data_Y_i[41]), 
        .B1(n50), .Y(n172) );
  INVX2TS U32 ( .A(Data_X_i[40]), .Y(n51) );
  AOI32X1TS U33 ( .A0(Data_Y_i[4]), .A1(n65), .A2(n120), .B0(Data_Y_i[5]), 
        .B1(n64), .Y(n118) );
  XOR2X1TS U34 ( .A(Data_X_i[37]), .B(Data_Y_i[37]), .Y(n186) );
  OAI2BB1X1TS U35 ( .A0N(n71), .A1N(n2), .B0(n78), .Y(gtXY_o) );
  OAI211X1TS U36 ( .A0(Data_X_i[31]), .A1(n20), .B0(n2), .C0(n79), .Y(n78) );
  INVX2TS U37 ( .A(Data_Y_i[31]), .Y(n20) );
  INVX2TS U38 ( .A(Data_X_i[0]), .Y(n203) );
  NAND2X1TS U39 ( .A(Data_Y_i[1]), .B(n68), .Y(n124) );
  INVX2TS U40 ( .A(Data_X_i[1]), .Y(n68) );
  AOI222XLTS U41 ( .A0(n160), .A1(n161), .B0(n162), .B1(n163), .C0(
        Data_Y_i[47]), .C1(n47), .Y(n146) );
  OAI222X1TS U42 ( .A0(Data_X_i[39]), .A1(n13), .B0(n175), .B1(n176), .C0(n177), .C1(n178), .Y(n161) );
  OAI22X1TS U43 ( .A0(Data_X_i[46]), .A1(n10), .B0(n164), .B1(n165), .Y(n163)
         );
  INVX2TS U44 ( .A(Data_Y_i[39]), .Y(n13) );
  AOI222XLTS U45 ( .A0(Data_Y_i[7]), .A1(n63), .B0(n115), .B1(n34), .C0(n116), 
        .C1(n117), .Y(n98) );
  OAI22X1TS U46 ( .A0(Data_X_i[6]), .A1(n35), .B0(n118), .B1(n119), .Y(n117)
         );
  AOI31X1TS U47 ( .A0(n123), .A1(n124), .A2(n125), .B0(n126), .Y(n115) );
  INVX2TS U48 ( .A(Data_Y_i[6]), .Y(n35) );
  AOI222XLTS U49 ( .A0(n80), .A1(n81), .B0(n73), .B1(n82), .C0(n83), .C1(n84), 
        .Y(n79) );
  OAI22X1TS U50 ( .A0(Data_X_i[30]), .A1(n21), .B0(n139), .B1(n137), .Y(n81)
         );
  OAI22X1TS U51 ( .A0(Data_X_i[23]), .A1(n24), .B0(n85), .B1(n86), .Y(n84) );
  OAI222X1TS U52 ( .A0(n98), .A1(n72), .B0(n99), .B1(n100), .C0(Data_X_i[15]), 
        .C1(n29), .Y(n82) );
  INVX2TS U53 ( .A(Data_X_i[2]), .Y(n67) );
  INVX2TS U54 ( .A(Data_X_i[41]), .Y(n50) );
  INVX2TS U55 ( .A(Data_X_i[5]), .Y(n64) );
  INVX2TS U56 ( .A(Data_Y_i[9]), .Y(n32) );
  INVX2TS U57 ( .A(n144), .Y(n2) );
  OAI221XLTS U58 ( .A0(n145), .A1(n3), .B0(n146), .B1(n147), .C0(n148), .Y(
        n144) );
  INVX2TS U59 ( .A(n187), .Y(n3) );
  AOI22X1TS U60 ( .A0(n149), .A1(n150), .B0(Data_Y_i[62]), .B1(n37), .Y(n148)
         );
  XOR2X1TS U61 ( .A(Data_X_i[56]), .B(n7), .Y(n211) );
  NAND4BX1TS U62 ( .AN(n152), .B(n149), .C(n157), .D(n153), .Y(n212) );
  XNOR2X1TS U63 ( .A(Data_X_i[11]), .B(n31), .Y(n108) );
  XNOR2X1TS U64 ( .A(Data_X_i[13]), .B(n30), .Y(n104) );
  XNOR2X1TS U65 ( .A(Data_X_i[15]), .B(n29), .Y(n100) );
  XNOR2X1TS U66 ( .A(Data_X_i[26]), .B(n23), .Y(n138) );
  XNOR2X1TS U67 ( .A(Data_X_i[42]), .B(n12), .Y(n173) );
  XNOR2X1TS U68 ( .A(Data_X_i[46]), .B(n10), .Y(n165) );
  XNOR2X1TS U69 ( .A(Data_X_i[30]), .B(n21), .Y(n137) );
  XNOR2X1TS U70 ( .A(Data_X_i[44]), .B(n11), .Y(n169) );
  XNOR2X1TS U71 ( .A(Data_X_i[28]), .B(n22), .Y(n136) );
  XNOR2X1TS U72 ( .A(Data_X_i[19]), .B(n26), .Y(n94) );
  NAND4BX1TS U73 ( .AN(n192), .B(n210), .C(n189), .D(n193), .Y(n199) );
  XOR2X1TS U74 ( .A(n42), .B(Data_Y_i[52]), .Y(n210) );
  XNOR2X1TS U75 ( .A(Data_X_i[61]), .B(n4), .Y(n152) );
  XNOR2X1TS U76 ( .A(Data_X_i[17]), .B(n27), .Y(n97) );
  XNOR2X1TS U77 ( .A(Data_X_i[33]), .B(n18), .Y(n183) );
  XNOR2X1TS U78 ( .A(Data_X_i[31]), .B(Data_Y_i[31]), .Y(n80) );
  NOR2BX1TS U79 ( .AN(n130), .B(n131), .Y(n83) );
  NAND4BX1TS U80 ( .AN(n132), .B(n133), .C(n134), .D(n135), .Y(n131) );
  NOR4BX1TS U81 ( .AN(n80), .B(n136), .C(n137), .D(n138), .Y(n130) );
  XOR2X1TS U82 ( .A(Data_Y_i[24]), .B(Data_X_i[24]), .Y(n132) );
  OAI22X1TS U83 ( .A0(Data_X_i[61]), .A1(n4), .B0(n151), .B1(n152), .Y(n150)
         );
  AOI22X1TS U84 ( .A0(n153), .A1(n154), .B0(Data_Y_i[60]), .B1(n38), .Y(n151)
         );
  OAI22X1TS U85 ( .A0(Data_X_i[59]), .A1(n5), .B0(n155), .B1(n156), .Y(n154)
         );
  INVX2TS U86 ( .A(Data_Y_i[59]), .Y(n5) );
  AOI22X1TS U87 ( .A0(n87), .A1(n88), .B0(Data_Y_i[22]), .B1(n57), .Y(n85) );
  OAI22X1TS U88 ( .A0(Data_X_i[21]), .A1(n25), .B0(n89), .B1(n90), .Y(n88) );
  AOI22X1TS U89 ( .A0(n91), .A1(n92), .B0(Data_Y_i[20]), .B1(n58), .Y(n89) );
  OAI22X1TS U90 ( .A0(Data_X_i[19]), .A1(n26), .B0(n93), .B1(n94), .Y(n92) );
  AOI22X1TS U91 ( .A0(n133), .A1(n140), .B0(Data_Y_i[29]), .B1(n53), .Y(n139)
         );
  OAI22X1TS U92 ( .A0(Data_X_i[28]), .A1(n22), .B0(n141), .B1(n136), .Y(n140)
         );
  AOI22X1TS U93 ( .A0(n135), .A1(n142), .B0(Data_Y_i[27]), .B1(n54), .Y(n141)
         );
  OAI22X1TS U94 ( .A0(Data_X_i[26]), .A1(n23), .B0(n143), .B1(n138), .Y(n142)
         );
  NAND2BX1TS U95 ( .AN(n112), .B(n113), .Y(n72) );
  NOR4XLTS U96 ( .A(n108), .B(n100), .C(n104), .D(n114), .Y(n113) );
  NAND4BX1TS U97 ( .AN(n111), .B(n109), .C(n105), .D(n101), .Y(n112) );
  XOR2X1TS U98 ( .A(Data_Y_i[8]), .B(Data_X_i[8]), .Y(n114) );
  NOR2X1TS U99 ( .A(n1), .B(n182), .Y(n179) );
  XNOR2X1TS U100 ( .A(Data_X_i[34]), .B(n17), .Y(n1) );
  NAND4BBX1TS U101 ( .AN(n186), .BN(n176), .C(n202), .D(n184), .Y(n178) );
  XOR2X1TS U102 ( .A(Data_X_i[36]), .B(n15), .Y(n202) );
  NOR2BX1TS U103 ( .AN(n204), .B(n205), .Y(n160) );
  NAND4BX1TS U104 ( .AN(n206), .B(n166), .C(n174), .D(n170), .Y(n205) );
  NOR4BX1TS U105 ( .AN(n162), .B(n169), .C(n165), .D(n173), .Y(n204) );
  XOR2X1TS U106 ( .A(Data_Y_i[40]), .B(Data_X_i[40]), .Y(n206) );
  NAND3X1TS U107 ( .A(n207), .B(n187), .C(n208), .Y(n147) );
  XOR2X1TS U108 ( .A(n46), .B(Data_Y_i[48]), .Y(n207) );
  NOR3BX1TS U109 ( .AN(n198), .B(n199), .C(n195), .Y(n208) );
  XOR2X1TS U110 ( .A(n52), .B(Data_Y_i[38]), .Y(n184) );
  XOR2X1TS U111 ( .A(n54), .B(Data_Y_i[27]), .Y(n135) );
  XOR2X1TS U112 ( .A(n49), .B(Data_Y_i[43]), .Y(n170) );
  XOR2X1TS U113 ( .A(n38), .B(Data_Y_i[60]), .Y(n153) );
  XOR2X1TS U114 ( .A(n60), .B(Data_Y_i[14]), .Y(n101) );
  XOR2X1TS U115 ( .A(n39), .B(Data_Y_i[58]), .Y(n157) );
  XOR2X1TS U116 ( .A(n61), .B(Data_Y_i[12]), .Y(n105) );
  XOR2X1TS U117 ( .A(Data_X_i[59]), .B(Data_Y_i[59]), .Y(n156) );
  XOR2X1TS U118 ( .A(n53), .B(Data_Y_i[29]), .Y(n133) );
  XOR2X1TS U119 ( .A(n48), .B(Data_Y_i[45]), .Y(n166) );
  XOR2X1TS U120 ( .A(n62), .B(Data_Y_i[10]), .Y(n109) );
  XOR2X1TS U121 ( .A(n37), .B(Data_Y_i[62]), .Y(n149) );
  XOR2X1TS U122 ( .A(n58), .B(Data_Y_i[20]), .Y(n91) );
  XOR2X1TS U123 ( .A(n43), .B(Data_Y_i[51]), .Y(n197) );
  AOI21X1TS U124 ( .A0(n179), .A1(n180), .B0(n181), .Y(n177) );
  OAI32X1TS U125 ( .A0(n183), .A1(Data_X_i[32]), .A2(n19), .B0(Data_X_i[33]), 
        .B1(n18), .Y(n180) );
  OAI32X1TS U126 ( .A0(n182), .A1(Data_X_i[34]), .A2(n17), .B0(Data_X_i[35]), 
        .B1(n16), .Y(n181) );
  INVX2TS U127 ( .A(Data_Y_i[35]), .Y(n16) );
  XOR2X1TS U128 ( .A(n59), .B(Data_Y_i[18]), .Y(n95) );
  AND4X1TS U129 ( .A(n91), .B(n87), .C(n127), .D(n128), .Y(n73) );
  NOR3BX1TS U130 ( .AN(n95), .B(n90), .C(n94), .Y(n127) );
  NOR4BX1TS U131 ( .AN(n83), .B(n97), .C(n86), .D(n129), .Y(n128) );
  XOR2X1TS U132 ( .A(Data_Y_i[16]), .B(Data_X_i[16]), .Y(n129) );
  XOR2X1TS U133 ( .A(Data_X_i[57]), .B(Data_Y_i[57]), .Y(n159) );
  XOR2X1TS U134 ( .A(Data_X_i[6]), .B(Data_Y_i[6]), .Y(n119) );
  XOR2X1TS U135 ( .A(Data_X_i[54]), .B(Data_Y_i[54]), .Y(n192) );
  XOR2X1TS U136 ( .A(n41), .B(Data_Y_i[53]), .Y(n193) );
  AOI22X1TS U137 ( .A0(n95), .A1(n96), .B0(Data_Y_i[18]), .B1(n59), .Y(n93) );
  OAI32X1TS U138 ( .A0(n97), .A1(Data_X_i[16]), .A2(n28), .B0(Data_X_i[17]), 
        .B1(n27), .Y(n96) );
  INVX2TS U139 ( .A(Data_Y_i[16]), .Y(n28) );
  AOI22X1TS U140 ( .A0(n157), .A1(n158), .B0(Data_Y_i[58]), .B1(n39), .Y(n155)
         );
  OAI32X1TS U141 ( .A0(n159), .A1(Data_X_i[56]), .A2(n7), .B0(Data_X_i[57]), 
        .B1(n6), .Y(n158) );
  INVX2TS U142 ( .A(Data_Y_i[57]), .Y(n6) );
  XOR2X1TS U143 ( .A(n63), .B(Data_Y_i[7]), .Y(n116) );
  XOR2X1TS U144 ( .A(n40), .B(Data_Y_i[55]), .Y(n189) );
  XOR2X1TS U145 ( .A(n55), .B(Data_Y_i[25]), .Y(n134) );
  NAND2X1TS U146 ( .A(n209), .B(n197), .Y(n195) );
  XOR2X1TS U147 ( .A(n44), .B(Data_Y_i[50]), .Y(n209) );
  XOR2X1TS U148 ( .A(Data_X_i[35]), .B(Data_Y_i[35]), .Y(n182) );
  AOI32X1TS U149 ( .A0(Data_Y_i[24]), .A1(n56), .A2(n134), .B0(Data_Y_i[25]), 
        .B1(n55), .Y(n143) );
  INVX2TS U150 ( .A(Data_X_i[24]), .Y(n56) );
  AOI32X1TS U151 ( .A0(Data_Y_i[52]), .A1(n42), .A2(n193), .B0(Data_Y_i[53]), 
        .B1(n41), .Y(n191) );
  AOI32X1TS U152 ( .A0(Data_Y_i[48]), .A1(n46), .A2(n198), .B0(Data_Y_i[49]), 
        .B1(n45), .Y(n194) );
  AOI32X1TS U153 ( .A0(Data_Y_i[50]), .A1(n44), .A2(n197), .B0(Data_Y_i[51]), 
        .B1(n43), .Y(n196) );
  XOR2X1TS U154 ( .A(n47), .B(Data_Y_i[47]), .Y(n162) );
  XOR2X1TS U155 ( .A(n45), .B(Data_Y_i[49]), .Y(n198) );
  XOR2X1TS U156 ( .A(Data_X_i[39]), .B(Data_Y_i[39]), .Y(n176) );
  INVX2TS U157 ( .A(n121), .Y(n34) );
  NAND4BX1TS U158 ( .AN(n119), .B(n122), .C(n116), .D(n120), .Y(n121) );
  XOR2X1TS U159 ( .A(n65), .B(Data_Y_i[4]), .Y(n122) );
  INVX2TS U160 ( .A(Data_X_i[18]), .Y(n59) );
  INVX2TS U161 ( .A(Data_X_i[58]), .Y(n39) );
  INVX2TS U162 ( .A(Data_X_i[10]), .Y(n62) );
  INVX2TS U163 ( .A(Data_X_i[43]), .Y(n49) );
  INVX2TS U164 ( .A(Data_X_i[20]), .Y(n58) );
  INVX2TS U165 ( .A(Data_X_i[27]), .Y(n54) );
  INVX2TS U166 ( .A(Data_X_i[29]), .Y(n53) );
  INVX2TS U167 ( .A(Data_X_i[38]), .Y(n52) );
  INVX2TS U168 ( .A(Data_X_i[45]), .Y(n48) );
  INVX2TS U169 ( .A(Data_X_i[60]), .Y(n38) );
  INVX2TS U170 ( .A(Data_X_i[12]), .Y(n61) );
  INVX2TS U171 ( .A(Data_X_i[14]), .Y(n60) );
  INVX2TS U172 ( .A(Data_X_i[62]), .Y(n37) );
  INVX2TS U173 ( .A(Data_Y_i[42]), .Y(n12) );
  INVX2TS U174 ( .A(Data_Y_i[11]), .Y(n31) );
  INVX2TS U175 ( .A(Data_Y_i[19]), .Y(n26) );
  INVX2TS U176 ( .A(Data_Y_i[26]), .Y(n23) );
  INVX2TS U177 ( .A(Data_Y_i[44]), .Y(n11) );
  INVX2TS U178 ( .A(Data_Y_i[13]), .Y(n30) );
  INVX2TS U179 ( .A(Data_Y_i[28]), .Y(n22) );
  INVX2TS U180 ( .A(Data_Y_i[61]), .Y(n4) );
  INVX2TS U181 ( .A(Data_Y_i[46]), .Y(n10) );
  INVX2TS U182 ( .A(Data_Y_i[30]), .Y(n21) );
  AOI222XLTS U183 ( .A0(n8), .A1(n188), .B0(n189), .B1(n190), .C0(Data_Y_i[55]), .C1(n40), .Y(n145) );
  INVX2TS U184 ( .A(n199), .Y(n8) );
  OAI21X1TS U185 ( .A0(n194), .A1(n195), .B0(n196), .Y(n188) );
  OAI22X1TS U186 ( .A0(Data_X_i[54]), .A1(n9), .B0(n191), .B1(n192), .Y(n190)
         );
  INVX2TS U187 ( .A(Data_X_i[7]), .Y(n63) );
  INVX2TS U188 ( .A(Data_X_i[47]), .Y(n47) );
  INVX2TS U189 ( .A(Data_X_i[55]), .Y(n40) );
  INVX2TS U190 ( .A(Data_X_i[4]), .Y(n65) );
  INVX2TS U191 ( .A(Data_X_i[52]), .Y(n42) );
  INVX2TS U192 ( .A(Data_X_i[50]), .Y(n44) );
  INVX2TS U193 ( .A(Data_X_i[48]), .Y(n46) );
  INVX2TS U194 ( .A(Data_X_i[25]), .Y(n55) );
  INVX2TS U195 ( .A(Data_X_i[49]), .Y(n45) );
  INVX2TS U196 ( .A(Data_X_i[53]), .Y(n41) );
  INVX2TS U197 ( .A(Data_X_i[51]), .Y(n43) );
  INVX2TS U198 ( .A(Data_Y_i[56]), .Y(n7) );
  INVX2TS U199 ( .A(Data_Y_i[34]), .Y(n17) );
  INVX2TS U200 ( .A(Data_Y_i[32]), .Y(n19) );
  INVX2TS U201 ( .A(Data_Y_i[36]), .Y(n15) );
  INVX2TS U202 ( .A(Data_Y_i[15]), .Y(n29) );
  INVX2TS U203 ( .A(Data_Y_i[17]), .Y(n27) );
  INVX2TS U204 ( .A(Data_Y_i[33]), .Y(n18) );
  XNOR2X1TS U205 ( .A(Data_X_i[23]), .B(n24), .Y(n86) );
  XNOR2X1TS U206 ( .A(Data_X_i[21]), .B(n25), .Y(n90) );
  NAND4BX1TS U207 ( .AN(n147), .B(n160), .C(n200), .D(n201), .Y(n71) );
  XOR2X1TS U208 ( .A(Data_X_i[32]), .B(n19), .Y(n200) );
  NOR3BX1TS U209 ( .AN(n179), .B(n178), .C(n183), .Y(n201) );
  XOR2X1TS U210 ( .A(n57), .B(Data_Y_i[22]), .Y(n87) );
  INVX2TS U211 ( .A(Data_X_i[22]), .Y(n57) );
  INVX2TS U212 ( .A(Data_Y_i[21]), .Y(n25) );
  INVX2TS U213 ( .A(Data_Y_i[23]), .Y(n24) );
  INVX2TS U214 ( .A(Data_Y_i[54]), .Y(n9) );
endmodule


module xor_tri_W64 ( A_i, B_i, C_i, Z_o );
  input A_i, B_i, C_i;
  output Z_o;
  wire   n1;

  XOR2X1TS U1 ( .A(A_i), .B(n1), .Y(Z_o) );
  XOR2X1TS U2 ( .A(C_i), .B(B_i), .Y(n1) );
endmodule


module sgn_result ( Add_Subt_i, sgn_X_i, sgn_Y_i, gtXY_i, eqXY_i, sgn_result_o
 );
  input Add_Subt_i, sgn_X_i, sgn_Y_i, gtXY_i, eqXY_i;
  output sgn_result_o;
  wire   n2, n3, n4;

  OAI31X1TS U1 ( .A0(n2), .A1(gtXY_i), .A2(eqXY_i), .B0(n3), .Y(sgn_result_o)
         );
  OAI21X1TS U2 ( .A0(gtXY_i), .A1(n4), .B0(sgn_X_i), .Y(n3) );
  INVX2TS U3 ( .A(n2), .Y(n4) );
  XNOR2X1TS U4 ( .A(sgn_Y_i), .B(Add_Subt_i), .Y(n2) );
endmodule


module MultiplexTxT_W63 ( select, D0_i, D1_i, S0_o, S1_o );
  input [62:0] D0_i;
  input [62:0] D1_i;
  output [62:0] S0_o;
  output [62:0] S1_o;
  input select;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
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
         n145, n146, n147, n148, n149, n150, n151, n152, n153, n154;

  INVX2TS U1 ( .A(n22), .Y(n1) );
  INVX2TS U2 ( .A(n24), .Y(n2) );
  INVX2TS U3 ( .A(n24), .Y(n3) );
  INVX2TS U4 ( .A(n25), .Y(n4) );
  INVX2TS U5 ( .A(n23), .Y(n5) );
  INVX2TS U6 ( .A(n27), .Y(n6) );
  INVX2TS U7 ( .A(n24), .Y(n7) );
  INVX2TS U8 ( .A(n22), .Y(n8) );
  INVX2TS U9 ( .A(n22), .Y(n9) );
  INVX2TS U10 ( .A(n25), .Y(n10) );
  INVX2TS U11 ( .A(n24), .Y(n11) );
  INVX2TS U12 ( .A(n25), .Y(n12) );
  CLKBUFX2TS U13 ( .A(n22), .Y(n20) );
  CLKBUFX2TS U14 ( .A(n22), .Y(n19) );
  CLKBUFX2TS U15 ( .A(n23), .Y(n18) );
  CLKBUFX2TS U16 ( .A(n23), .Y(n17) );
  CLKBUFX2TS U17 ( .A(n23), .Y(n16) );
  CLKBUFX2TS U18 ( .A(n24), .Y(n15) );
  CLKBUFX2TS U19 ( .A(n24), .Y(n14) );
  CLKBUFX2TS U20 ( .A(n24), .Y(n13) );
  CLKBUFX2TS U21 ( .A(n22), .Y(n21) );
  CLKBUFX2TS U22 ( .A(n26), .Y(n25) );
  CLKBUFX2TS U23 ( .A(n26), .Y(n24) );
  CLKBUFX2TS U24 ( .A(n27), .Y(n22) );
  CLKBUFX2TS U25 ( .A(n27), .Y(n23) );
  CLKBUFX2TS U26 ( .A(n28), .Y(n26) );
  CLKBUFX2TS U27 ( .A(n28), .Y(n27) );
  INVX2TS U28 ( .A(select), .Y(n28) );
  OAI22X1TS U29 ( .A0(n13), .A1(n30), .B0(select), .B1(n93), .Y(S1_o[61]) );
  OAI22X1TS U30 ( .A0(n13), .A1(n76), .B0(n7), .B1(n139), .Y(S1_o[15]) );
  OAI22X1TS U31 ( .A0(n16), .A1(n74), .B0(n8), .B1(n137), .Y(S1_o[17]) );
  OAI22X1TS U32 ( .A0(n18), .A1(n59), .B0(n9), .B1(n122), .Y(S1_o[32]) );
  OAI22X1TS U33 ( .A0(n16), .A1(n58), .B0(n9), .B1(n121), .Y(S1_o[33]) );
  OAI22X1TS U34 ( .A0(n23), .A1(n57), .B0(n10), .B1(n120), .Y(S1_o[34]) );
  OAI22X1TS U35 ( .A0(n20), .A1(n55), .B0(n10), .B1(n118), .Y(S1_o[36]) );
  OAI22X1TS U36 ( .A0(n25), .A1(n35), .B0(n12), .B1(n98), .Y(S1_o[56]) );
  OAI22X1TS U37 ( .A0(n3), .A1(n59), .B0(n16), .B1(n122), .Y(S0_o[32]) );
  OAI22X1TS U38 ( .A0(n3), .A1(n58), .B0(n16), .B1(n121), .Y(S0_o[33]) );
  OAI22X1TS U39 ( .A0(n3), .A1(n57), .B0(n16), .B1(n120), .Y(S0_o[34]) );
  OAI22X1TS U40 ( .A0(n3), .A1(n55), .B0(n16), .B1(n118), .Y(S0_o[36]) );
  OAI22X1TS U41 ( .A0(n6), .A1(n35), .B0(n14), .B1(n98), .Y(S0_o[56]) );
  OAI22X1TS U42 ( .A0(n15), .A1(n90), .B0(n8), .B1(n153), .Y(S1_o[1]) );
  OAI22X1TS U43 ( .A0(n25), .A1(n80), .B0(n7), .B1(n143), .Y(S1_o[11]) );
  OAI22X1TS U44 ( .A0(n19), .A1(n78), .B0(n7), .B1(n141), .Y(S1_o[13]) );
  OAI22X1TS U45 ( .A0(n17), .A1(n72), .B0(n8), .B1(n135), .Y(S1_o[19]) );
  OAI22X1TS U46 ( .A0(n28), .A1(n70), .B0(n8), .B1(n133), .Y(S1_o[21]) );
  OAI22X1TS U47 ( .A0(n18), .A1(n68), .B0(n8), .B1(n131), .Y(S1_o[23]) );
  OAI22X1TS U48 ( .A0(n28), .A1(n65), .B0(n9), .B1(n128), .Y(S1_o[26]) );
  OAI22X1TS U49 ( .A0(n17), .A1(n63), .B0(n9), .B1(n126), .Y(S1_o[28]) );
  OAI22X1TS U50 ( .A0(n27), .A1(n61), .B0(n9), .B1(n124), .Y(S1_o[30]) );
  OAI22X1TS U51 ( .A0(n23), .A1(n49), .B0(n10), .B1(n112), .Y(S1_o[42]) );
  OAI22X1TS U52 ( .A0(n27), .A1(n47), .B0(n11), .B1(n110), .Y(S1_o[44]) );
  OAI22X1TS U53 ( .A0(n27), .A1(n45), .B0(n11), .B1(n108), .Y(S1_o[46]) );
  OAI22X1TS U54 ( .A0(n2), .A1(n65), .B0(n18), .B1(n128), .Y(S0_o[26]) );
  OAI22X1TS U55 ( .A0(n3), .A1(n63), .B0(n17), .B1(n126), .Y(S0_o[28]) );
  OAI22X1TS U56 ( .A0(n3), .A1(n61), .B0(n17), .B1(n124), .Y(S0_o[30]) );
  OAI22X1TS U57 ( .A0(n4), .A1(n49), .B0(n24), .B1(n112), .Y(S0_o[42]) );
  OAI22X1TS U58 ( .A0(n4), .A1(n47), .B0(n24), .B1(n110), .Y(S0_o[44]) );
  OAI22X1TS U59 ( .A0(n5), .A1(n45), .B0(n22), .B1(n108), .Y(S0_o[46]) );
  OAI22X1TS U60 ( .A0(n6), .A1(n30), .B0(n13), .B1(n93), .Y(S0_o[61]) );
  OAI22X1TS U61 ( .A0(n1), .A1(n76), .B0(n19), .B1(n139), .Y(S0_o[15]) );
  OAI22X1TS U62 ( .A0(n1), .A1(n74), .B0(n20), .B1(n137), .Y(S0_o[17]) );
  OAI22X1TS U63 ( .A0(n2), .A1(n90), .B0(n18), .B1(n153), .Y(S0_o[1]) );
  OAI22X1TS U64 ( .A0(n1), .A1(n80), .B0(n21), .B1(n143), .Y(S0_o[11]) );
  OAI22X1TS U65 ( .A0(n1), .A1(n78), .B0(n21), .B1(n141), .Y(S0_o[13]) );
  OAI22X1TS U66 ( .A0(n2), .A1(n72), .B0(n19), .B1(n135), .Y(S0_o[19]) );
  OAI22X1TS U67 ( .A0(n2), .A1(n70), .B0(n19), .B1(n133), .Y(S0_o[21]) );
  OAI22X1TS U68 ( .A0(n2), .A1(n68), .B0(n18), .B1(n131), .Y(S0_o[23]) );
  OAI22X1TS U69 ( .A0(n7), .A1(n82), .B0(n145), .B1(n21), .Y(S0_o[9]) );
  OAI22X1TS U70 ( .A0(n21), .A1(n91), .B0(n7), .B1(n154), .Y(S1_o[0]) );
  OAI22X1TS U71 ( .A0(n28), .A1(n89), .B0(n9), .B1(n152), .Y(S1_o[2]) );
  OAI22X1TS U72 ( .A0(n14), .A1(n88), .B0(n10), .B1(n151), .Y(S1_o[3]) );
  OAI22X1TS U73 ( .A0(n15), .A1(n87), .B0(n11), .B1(n150), .Y(S1_o[4]) );
  OAI22X1TS U74 ( .A0(n28), .A1(n86), .B0(n12), .B1(n149), .Y(S1_o[5]) );
  OAI22X1TS U75 ( .A0(n17), .A1(n85), .B0(select), .B1(n148), .Y(S1_o[6]) );
  OAI22X1TS U76 ( .A0(n27), .A1(n84), .B0(select), .B1(n147), .Y(S1_o[7]) );
  OAI22X1TS U77 ( .A0(n27), .A1(n83), .B0(select), .B1(n146), .Y(S1_o[8]) );
  OAI22X1TS U78 ( .A0(n82), .A1(n21), .B0(select), .B1(n145), .Y(S1_o[9]) );
  OAI22X1TS U79 ( .A0(n13), .A1(n81), .B0(n7), .B1(n144), .Y(S1_o[10]) );
  OAI22X1TS U80 ( .A0(n18), .A1(n79), .B0(n7), .B1(n142), .Y(S1_o[12]) );
  OAI22X1TS U81 ( .A0(n17), .A1(n77), .B0(n7), .B1(n140), .Y(S1_o[14]) );
  OAI22X1TS U82 ( .A0(n24), .A1(n75), .B0(n8), .B1(n138), .Y(S1_o[16]) );
  OAI22X1TS U83 ( .A0(n20), .A1(n73), .B0(n8), .B1(n136), .Y(S1_o[18]) );
  OAI22X1TS U84 ( .A0(n18), .A1(n71), .B0(n8), .B1(n134), .Y(S1_o[20]) );
  OAI22X1TS U85 ( .A0(n17), .A1(n69), .B0(n8), .B1(n132), .Y(S1_o[22]) );
  OAI22X1TS U86 ( .A0(n25), .A1(n67), .B0(n8), .B1(n130), .Y(S1_o[24]) );
  OAI22X1TS U87 ( .A0(n21), .A1(n66), .B0(n9), .B1(n129), .Y(S1_o[25]) );
  OAI22X1TS U88 ( .A0(n25), .A1(n64), .B0(n9), .B1(n127), .Y(S1_o[27]) );
  OAI22X1TS U89 ( .A0(n14), .A1(n62), .B0(n9), .B1(n125), .Y(S1_o[29]) );
  OAI22X1TS U90 ( .A0(n16), .A1(n60), .B0(n9), .B1(n123), .Y(S1_o[31]) );
  OAI22X1TS U91 ( .A0(n20), .A1(n56), .B0(n10), .B1(n119), .Y(S1_o[35]) );
  OAI22X1TS U92 ( .A0(n13), .A1(n54), .B0(n10), .B1(n117), .Y(S1_o[37]) );
  OAI22X1TS U93 ( .A0(n19), .A1(n53), .B0(n10), .B1(n116), .Y(S1_o[38]) );
  OAI22X1TS U94 ( .A0(n23), .A1(n52), .B0(n10), .B1(n115), .Y(S1_o[39]) );
  OAI22X1TS U95 ( .A0(n21), .A1(n51), .B0(n10), .B1(n114), .Y(S1_o[40]) );
  OAI22X1TS U96 ( .A0(n22), .A1(n50), .B0(n10), .B1(n113), .Y(S1_o[41]) );
  OAI22X1TS U97 ( .A0(n28), .A1(n48), .B0(n11), .B1(n111), .Y(S1_o[43]) );
  OAI22X1TS U98 ( .A0(n16), .A1(n46), .B0(n11), .B1(n109), .Y(S1_o[45]) );
  OAI22X1TS U99 ( .A0(n28), .A1(n44), .B0(n11), .B1(n107), .Y(S1_o[47]) );
  OAI22X1TS U100 ( .A0(n15), .A1(n43), .B0(n11), .B1(n106), .Y(S1_o[48]) );
  OAI22X1TS U101 ( .A0(n14), .A1(n42), .B0(n11), .B1(n105), .Y(S1_o[49]) );
  OAI22X1TS U102 ( .A0(n26), .A1(n41), .B0(n11), .B1(n104), .Y(S1_o[50]) );
  OAI22X1TS U103 ( .A0(n27), .A1(n40), .B0(n11), .B1(n103), .Y(S1_o[51]) );
  OAI22X1TS U104 ( .A0(n19), .A1(n39), .B0(n12), .B1(n102), .Y(S1_o[52]) );
  OAI22X1TS U105 ( .A0(n13), .A1(n38), .B0(n12), .B1(n101), .Y(S1_o[53]) );
  OAI22X1TS U106 ( .A0(n16), .A1(n37), .B0(n12), .B1(n100), .Y(S1_o[54]) );
  OAI22X1TS U107 ( .A0(n14), .A1(n36), .B0(n12), .B1(n99), .Y(S1_o[55]) );
  OAI22X1TS U108 ( .A0(n14), .A1(n34), .B0(n12), .B1(n97), .Y(S1_o[57]) );
  OAI22X1TS U109 ( .A0(n18), .A1(n33), .B0(n12), .B1(n96), .Y(S1_o[58]) );
  OAI22X1TS U110 ( .A0(n28), .A1(n32), .B0(n12), .B1(n95), .Y(S1_o[59]) );
  OAI22X1TS U111 ( .A0(n20), .A1(n31), .B0(n12), .B1(n94), .Y(S1_o[60]) );
  OAI22X1TS U112 ( .A0(n19), .A1(n29), .B0(select), .B1(n92), .Y(S1_o[62]) );
  OAI22X1TS U113 ( .A0(n2), .A1(n64), .B0(n18), .B1(n127), .Y(S0_o[27]) );
  OAI22X1TS U114 ( .A0(n3), .A1(n62), .B0(n15), .B1(n125), .Y(S0_o[29]) );
  OAI22X1TS U115 ( .A0(n3), .A1(n60), .B0(n17), .B1(n123), .Y(S0_o[31]) );
  OAI22X1TS U116 ( .A0(n3), .A1(n56), .B0(n16), .B1(n119), .Y(S0_o[35]) );
  OAI22X1TS U117 ( .A0(n4), .A1(n54), .B0(n26), .B1(n117), .Y(S0_o[37]) );
  OAI22X1TS U118 ( .A0(n4), .A1(n53), .B0(n26), .B1(n116), .Y(S0_o[38]) );
  OAI22X1TS U119 ( .A0(n4), .A1(n52), .B0(n22), .B1(n115), .Y(S0_o[39]) );
  OAI22X1TS U120 ( .A0(n4), .A1(n51), .B0(n23), .B1(n114), .Y(S0_o[40]) );
  OAI22X1TS U121 ( .A0(n4), .A1(n50), .B0(n26), .B1(n113), .Y(S0_o[41]) );
  OAI22X1TS U122 ( .A0(n4), .A1(n48), .B0(n26), .B1(n111), .Y(S0_o[43]) );
  OAI22X1TS U123 ( .A0(n4), .A1(n46), .B0(n26), .B1(n109), .Y(S0_o[45]) );
  OAI22X1TS U124 ( .A0(n5), .A1(n44), .B0(n23), .B1(n107), .Y(S0_o[47]) );
  OAI22X1TS U125 ( .A0(n5), .A1(n43), .B0(n22), .B1(n106), .Y(S0_o[48]) );
  OAI22X1TS U126 ( .A0(n5), .A1(n42), .B0(n28), .B1(n105), .Y(S0_o[49]) );
  OAI22X1TS U127 ( .A0(n5), .A1(n41), .B0(n15), .B1(n104), .Y(S0_o[50]) );
  OAI22X1TS U128 ( .A0(n5), .A1(n40), .B0(n15), .B1(n103), .Y(S0_o[51]) );
  OAI22X1TS U129 ( .A0(n5), .A1(n39), .B0(n15), .B1(n102), .Y(S0_o[52]) );
  OAI22X1TS U130 ( .A0(n5), .A1(n38), .B0(n15), .B1(n101), .Y(S0_o[53]) );
  OAI22X1TS U131 ( .A0(n5), .A1(n37), .B0(n15), .B1(n100), .Y(S0_o[54]) );
  OAI22X1TS U132 ( .A0(n6), .A1(n36), .B0(n14), .B1(n99), .Y(S0_o[55]) );
  OAI22X1TS U133 ( .A0(n6), .A1(n34), .B0(n14), .B1(n97), .Y(S0_o[57]) );
  OAI22X1TS U134 ( .A0(n6), .A1(n33), .B0(n14), .B1(n96), .Y(S0_o[58]) );
  OAI22X1TS U135 ( .A0(n6), .A1(n32), .B0(n14), .B1(n95), .Y(S0_o[59]) );
  OAI22X1TS U136 ( .A0(n6), .A1(n31), .B0(n13), .B1(n94), .Y(S0_o[60]) );
  OAI22X1TS U137 ( .A0(n6), .A1(n29), .B0(n13), .B1(n92), .Y(S0_o[62]) );
  OAI22X1TS U138 ( .A0(n1), .A1(n91), .B0(n25), .B1(n154), .Y(S0_o[0]) );
  OAI22X1TS U139 ( .A0(n3), .A1(n89), .B0(n17), .B1(n152), .Y(S0_o[2]) );
  OAI22X1TS U140 ( .A0(n4), .A1(n88), .B0(n26), .B1(n151), .Y(S0_o[3]) );
  OAI22X1TS U141 ( .A0(n5), .A1(n87), .B0(n26), .B1(n150), .Y(S0_o[4]) );
  OAI22X1TS U142 ( .A0(n6), .A1(n86), .B0(n13), .B1(n149), .Y(S0_o[5]) );
  OAI22X1TS U143 ( .A0(n6), .A1(n85), .B0(n13), .B1(n148), .Y(S0_o[6]) );
  OAI22X1TS U144 ( .A0(n7), .A1(n84), .B0(n25), .B1(n147), .Y(S0_o[7]) );
  OAI22X1TS U145 ( .A0(n7), .A1(n83), .B0(n25), .B1(n146), .Y(S0_o[8]) );
  OAI22X1TS U146 ( .A0(n1), .A1(n81), .B0(n20), .B1(n144), .Y(S0_o[10]) );
  OAI22X1TS U147 ( .A0(n1), .A1(n79), .B0(n21), .B1(n142), .Y(S0_o[12]) );
  OAI22X1TS U148 ( .A0(n1), .A1(n77), .B0(n20), .B1(n140), .Y(S0_o[14]) );
  OAI22X1TS U149 ( .A0(n1), .A1(n75), .B0(n20), .B1(n138), .Y(S0_o[16]) );
  OAI22X1TS U150 ( .A0(n1), .A1(n73), .B0(n20), .B1(n136), .Y(S0_o[18]) );
  OAI22X1TS U151 ( .A0(n2), .A1(n71), .B0(n19), .B1(n134), .Y(S0_o[20]) );
  OAI22X1TS U152 ( .A0(n2), .A1(n69), .B0(n19), .B1(n132), .Y(S0_o[22]) );
  OAI22X1TS U153 ( .A0(n2), .A1(n67), .B0(n17), .B1(n130), .Y(S0_o[24]) );
  OAI22X1TS U154 ( .A0(n2), .A1(n66), .B0(n18), .B1(n129), .Y(S0_o[25]) );
  INVX2TS U155 ( .A(D1_i[8]), .Y(n83) );
  INVX2TS U156 ( .A(D1_i[16]), .Y(n75) );
  INVX2TS U157 ( .A(D1_i[6]), .Y(n85) );
  INVX2TS U158 ( .A(D1_i[35]), .Y(n56) );
  INVX2TS U159 ( .A(D1_i[37]), .Y(n54) );
  INVX2TS U160 ( .A(D1_i[39]), .Y(n52) );
  INVX2TS U161 ( .A(D1_i[54]), .Y(n37) );
  INVX2TS U162 ( .A(D1_i[57]), .Y(n34) );
  INVX2TS U163 ( .A(D1_i[59]), .Y(n32) );
  INVX2TS U164 ( .A(D1_i[31]), .Y(n60) );
  INVX2TS U165 ( .A(D0_i[24]), .Y(n130) );
  INVX2TS U166 ( .A(D0_i[40]), .Y(n114) );
  INVX2TS U167 ( .A(D0_i[3]), .Y(n151) );
  INVX2TS U168 ( .A(D1_i[9]), .Y(n82) );
  INVX2TS U169 ( .A(D1_i[11]), .Y(n80) );
  INVX2TS U170 ( .A(D1_i[13]), .Y(n78) );
  INVX2TS U171 ( .A(D1_i[15]), .Y(n76) );
  INVX2TS U172 ( .A(D1_i[17]), .Y(n74) );
  INVX2TS U173 ( .A(D1_i[19]), .Y(n72) );
  INVX2TS U174 ( .A(D1_i[21]), .Y(n70) );
  INVX2TS U175 ( .A(D1_i[23]), .Y(n68) );
  INVX2TS U176 ( .A(D1_i[26]), .Y(n65) );
  INVX2TS U177 ( .A(D1_i[28]), .Y(n63) );
  INVX2TS U178 ( .A(D1_i[30]), .Y(n61) );
  INVX2TS U179 ( .A(D1_i[32]), .Y(n59) );
  INVX2TS U180 ( .A(D1_i[33]), .Y(n58) );
  INVX2TS U181 ( .A(D1_i[34]), .Y(n57) );
  INVX2TS U182 ( .A(D1_i[36]), .Y(n55) );
  INVX2TS U183 ( .A(D1_i[42]), .Y(n49) );
  INVX2TS U184 ( .A(D1_i[44]), .Y(n47) );
  INVX2TS U185 ( .A(D1_i[46]), .Y(n45) );
  INVX2TS U186 ( .A(D1_i[56]), .Y(n35) );
  INVX2TS U187 ( .A(D1_i[61]), .Y(n30) );
  INVX2TS U188 ( .A(D1_i[1]), .Y(n90) );
  INVX2TS U189 ( .A(D1_i[10]), .Y(n81) );
  INVX2TS U190 ( .A(D1_i[12]), .Y(n79) );
  INVX2TS U191 ( .A(D1_i[14]), .Y(n77) );
  INVX2TS U192 ( .A(D1_i[18]), .Y(n73) );
  INVX2TS U193 ( .A(D1_i[20]), .Y(n71) );
  INVX2TS U194 ( .A(D1_i[22]), .Y(n69) );
  INVX2TS U195 ( .A(D1_i[27]), .Y(n64) );
  INVX2TS U196 ( .A(D1_i[29]), .Y(n62) );
  INVX2TS U197 ( .A(D1_i[38]), .Y(n53) );
  INVX2TS U198 ( .A(D1_i[43]), .Y(n48) );
  INVX2TS U199 ( .A(D1_i[45]), .Y(n46) );
  INVX2TS U200 ( .A(D1_i[58]), .Y(n33) );
  INVX2TS U201 ( .A(D1_i[60]), .Y(n31) );
  INVX2TS U202 ( .A(D1_i[62]), .Y(n29) );
  INVX2TS U203 ( .A(D0_i[6]), .Y(n148) );
  INVX2TS U204 ( .A(D0_i[54]), .Y(n100) );
  INVX2TS U205 ( .A(D0_i[59]), .Y(n95) );
  INVX2TS U206 ( .A(D0_i[0]), .Y(n154) );
  INVX2TS U207 ( .A(D0_i[1]), .Y(n153) );
  INVX2TS U208 ( .A(D0_i[2]), .Y(n152) );
  INVX2TS U209 ( .A(D0_i[4]), .Y(n150) );
  INVX2TS U210 ( .A(D0_i[5]), .Y(n149) );
  INVX2TS U211 ( .A(D0_i[7]), .Y(n147) );
  INVX2TS U212 ( .A(D0_i[10]), .Y(n144) );
  INVX2TS U213 ( .A(D0_i[12]), .Y(n142) );
  INVX2TS U214 ( .A(D0_i[14]), .Y(n140) );
  INVX2TS U215 ( .A(D0_i[18]), .Y(n136) );
  INVX2TS U216 ( .A(D0_i[20]), .Y(n134) );
  INVX2TS U217 ( .A(D0_i[22]), .Y(n132) );
  INVX2TS U218 ( .A(D0_i[25]), .Y(n129) );
  INVX2TS U219 ( .A(D0_i[27]), .Y(n127) );
  INVX2TS U220 ( .A(D0_i[29]), .Y(n125) );
  INVX2TS U221 ( .A(D0_i[38]), .Y(n116) );
  INVX2TS U222 ( .A(D0_i[41]), .Y(n113) );
  INVX2TS U223 ( .A(D0_i[43]), .Y(n111) );
  INVX2TS U224 ( .A(D0_i[45]), .Y(n109) );
  INVX2TS U225 ( .A(D0_i[47]), .Y(n107) );
  INVX2TS U226 ( .A(D0_i[48]), .Y(n106) );
  INVX2TS U227 ( .A(D0_i[49]), .Y(n105) );
  INVX2TS U228 ( .A(D0_i[50]), .Y(n104) );
  INVX2TS U229 ( .A(D0_i[51]), .Y(n103) );
  INVX2TS U230 ( .A(D0_i[52]), .Y(n102) );
  INVX2TS U231 ( .A(D0_i[53]), .Y(n101) );
  INVX2TS U232 ( .A(D0_i[55]), .Y(n99) );
  INVX2TS U233 ( .A(D0_i[58]), .Y(n96) );
  INVX2TS U234 ( .A(D0_i[60]), .Y(n94) );
  INVX2TS U235 ( .A(D0_i[62]), .Y(n92) );
  INVX2TS U236 ( .A(D0_i[11]), .Y(n143) );
  INVX2TS U237 ( .A(D0_i[13]), .Y(n141) );
  INVX2TS U238 ( .A(D0_i[19]), .Y(n135) );
  INVX2TS U239 ( .A(D0_i[21]), .Y(n133) );
  INVX2TS U240 ( .A(D0_i[23]), .Y(n131) );
  INVX2TS U241 ( .A(D0_i[26]), .Y(n128) );
  INVX2TS U242 ( .A(D0_i[28]), .Y(n126) );
  INVX2TS U243 ( .A(D0_i[30]), .Y(n124) );
  INVX2TS U244 ( .A(D0_i[42]), .Y(n112) );
  INVX2TS U245 ( .A(D0_i[44]), .Y(n110) );
  INVX2TS U246 ( .A(D0_i[46]), .Y(n108) );
  INVX2TS U247 ( .A(D0_i[61]), .Y(n93) );
  INVX2TS U248 ( .A(D1_i[24]), .Y(n67) );
  INVX2TS U249 ( .A(D1_i[40]), .Y(n51) );
  INVX2TS U250 ( .A(D1_i[7]), .Y(n84) );
  INVX2TS U251 ( .A(D1_i[4]), .Y(n87) );
  INVX2TS U252 ( .A(D1_i[48]), .Y(n43) );
  INVX2TS U253 ( .A(D1_i[50]), .Y(n41) );
  INVX2TS U254 ( .A(D1_i[52]), .Y(n39) );
  INVX2TS U255 ( .A(D1_i[47]), .Y(n44) );
  INVX2TS U256 ( .A(D1_i[55]), .Y(n36) );
  INVX2TS U257 ( .A(D1_i[2]), .Y(n89) );
  INVX2TS U258 ( .A(D1_i[5]), .Y(n86) );
  INVX2TS U259 ( .A(D1_i[25]), .Y(n66) );
  INVX2TS U260 ( .A(D1_i[41]), .Y(n50) );
  INVX2TS U261 ( .A(D1_i[49]), .Y(n42) );
  INVX2TS U262 ( .A(D1_i[51]), .Y(n40) );
  INVX2TS U263 ( .A(D1_i[53]), .Y(n38) );
  INVX2TS U264 ( .A(D0_i[39]), .Y(n115) );
  INVX2TS U265 ( .A(D0_i[32]), .Y(n122) );
  INVX2TS U266 ( .A(D0_i[34]), .Y(n120) );
  INVX2TS U267 ( .A(D0_i[36]), .Y(n118) );
  INVX2TS U268 ( .A(D0_i[56]), .Y(n98) );
  INVX2TS U269 ( .A(D0_i[35]), .Y(n119) );
  INVX2TS U270 ( .A(D0_i[37]), .Y(n117) );
  INVX2TS U271 ( .A(D0_i[57]), .Y(n97) );
  INVX2TS U272 ( .A(D1_i[3]), .Y(n88) );
  INVX2TS U273 ( .A(D0_i[8]), .Y(n146) );
  INVX2TS U274 ( .A(D0_i[16]), .Y(n138) );
  INVX2TS U275 ( .A(D1_i[0]), .Y(n91) );
  INVX2TS U276 ( .A(D0_i[9]), .Y(n145) );
  INVX2TS U277 ( .A(D0_i[15]), .Y(n139) );
  INVX2TS U278 ( .A(D0_i[31]), .Y(n123) );
  INVX2TS U279 ( .A(D0_i[17]), .Y(n137) );
  INVX2TS U280 ( .A(D0_i[33]), .Y(n121) );
endmodule


module RegisterAdd_W63_1 ( clk, rst, load, D, Q );
  input [62:0] D;
  output [62:0] Q;
  input clk, rst, load;
  wire   n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40,
         n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54,
         n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68,
         n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82,
         n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96,
         n97, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107, n108,
         n109, n110, n111, n112, n113, n114, n115, n116, n117, n118, n119,
         n120, n121, n122, n123, n124, n125, n127, n1, n2, n3, n4, n5, n6, n7,
         n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18;

  DFFRX2TS Q_reg_62_ ( .D(n127), .CK(clk), .RN(n1), .Q(Q[62]), .QN(n63) );
  DFFRX2TS Q_reg_51_ ( .D(n115), .CK(clk), .RN(n2), .Q(Q[51]), .QN(n52) );
  DFFRX2TS Q_reg_50_ ( .D(n114), .CK(clk), .RN(n2), .Q(Q[50]), .QN(n51) );
  DFFRX2TS Q_reg_49_ ( .D(n113), .CK(clk), .RN(n2), .Q(Q[49]), .QN(n50) );
  DFFRX2TS Q_reg_61_ ( .D(n125), .CK(clk), .RN(n1), .Q(Q[61]), .QN(n62) );
  DFFRX2TS Q_reg_60_ ( .D(n124), .CK(clk), .RN(n1), .Q(Q[60]), .QN(n61) );
  DFFRX2TS Q_reg_59_ ( .D(n123), .CK(clk), .RN(n1), .Q(Q[59]), .QN(n60) );
  DFFRX2TS Q_reg_48_ ( .D(n112), .CK(clk), .RN(n2), .Q(Q[48]), .QN(n49) );
  DFFRX2TS Q_reg_47_ ( .D(n111), .CK(clk), .RN(n2), .Q(Q[47]), .QN(n48) );
  DFFRX2TS Q_reg_46_ ( .D(n110), .CK(clk), .RN(n2), .Q(Q[46]), .QN(n47) );
  DFFRX2TS Q_reg_45_ ( .D(n109), .CK(clk), .RN(n2), .Q(Q[45]), .QN(n46) );
  DFFRX2TS Q_reg_58_ ( .D(n122), .CK(clk), .RN(n1), .Q(Q[58]), .QN(n59) );
  DFFRX2TS Q_reg_57_ ( .D(n121), .CK(clk), .RN(n1), .Q(Q[57]), .QN(n58) );
  DFFRX2TS Q_reg_56_ ( .D(n120), .CK(clk), .RN(n1), .Q(Q[56]), .QN(n57) );
  DFFRX2TS Q_reg_44_ ( .D(n108), .CK(clk), .RN(n2), .Q(Q[44]), .QN(n45) );
  DFFRX2TS Q_reg_43_ ( .D(n107), .CK(clk), .RN(n2), .Q(Q[43]), .QN(n44) );
  DFFRX2TS Q_reg_42_ ( .D(n106), .CK(clk), .RN(n3), .Q(Q[42]), .QN(n43) );
  DFFRX2TS Q_reg_41_ ( .D(n105), .CK(clk), .RN(n3), .Q(Q[41]), .QN(n42) );
  DFFRX2TS Q_reg_55_ ( .D(n119), .CK(clk), .RN(n1), .Q(Q[55]), .QN(n56) );
  DFFRX2TS Q_reg_54_ ( .D(n118), .CK(clk), .RN(n1), .Q(Q[54]), .QN(n55) );
  DFFRX2TS Q_reg_53_ ( .D(n117), .CK(clk), .RN(n1), .Q(Q[53]), .QN(n54) );
  DFFRX2TS Q_reg_52_ ( .D(n116), .CK(clk), .RN(n2), .Q(Q[52]), .QN(n53) );
  DFFRX2TS Q_reg_40_ ( .D(n104), .CK(clk), .RN(n3), .Q(Q[40]), .QN(n41) );
  DFFRX2TS Q_reg_39_ ( .D(n103), .CK(clk), .RN(n3), .Q(Q[39]), .QN(n40) );
  DFFRX2TS Q_reg_38_ ( .D(n102), .CK(clk), .RN(n3), .Q(Q[38]), .QN(n39) );
  DFFRX2TS Q_reg_37_ ( .D(n101), .CK(clk), .RN(n3), .Q(Q[37]), .QN(n38) );
  DFFRX2TS Q_reg_36_ ( .D(n100), .CK(clk), .RN(n3), .Q(Q[36]), .QN(n37) );
  DFFRX2TS Q_reg_35_ ( .D(n99), .CK(clk), .RN(n3), .Q(Q[35]), .QN(n36) );
  DFFRX2TS Q_reg_34_ ( .D(n98), .CK(clk), .RN(n3), .Q(Q[34]), .QN(n35) );
  DFFRX2TS Q_reg_33_ ( .D(n97), .CK(clk), .RN(n3), .Q(Q[33]), .QN(n34) );
  DFFRX2TS Q_reg_32_ ( .D(n96), .CK(clk), .RN(n4), .Q(Q[32]), .QN(n33) );
  DFFRX2TS Q_reg_31_ ( .D(n95), .CK(clk), .RN(n4), .Q(Q[31]), .QN(n32) );
  DFFRX2TS Q_reg_30_ ( .D(n94), .CK(clk), .RN(n4), .Q(Q[30]), .QN(n31) );
  DFFRX2TS Q_reg_29_ ( .D(n93), .CK(clk), .RN(n4), .Q(Q[29]), .QN(n30) );
  DFFRX2TS Q_reg_28_ ( .D(n92), .CK(clk), .RN(n4), .Q(Q[28]), .QN(n29) );
  DFFRX2TS Q_reg_27_ ( .D(n91), .CK(clk), .RN(n4), .Q(Q[27]), .QN(n28) );
  DFFRX2TS Q_reg_26_ ( .D(n90), .CK(clk), .RN(n4), .Q(Q[26]), .QN(n27) );
  DFFRX2TS Q_reg_25_ ( .D(n89), .CK(clk), .RN(n4), .Q(Q[25]) );
  DFFRX2TS Q_reg_24_ ( .D(n88), .CK(clk), .RN(n4), .Q(Q[24]) );
  DFFRX2TS Q_reg_23_ ( .D(n87), .CK(clk), .RN(n4), .Q(Q[23]) );
  DFFRX2TS Q_reg_22_ ( .D(n86), .CK(clk), .RN(n5), .Q(Q[22]) );
  DFFRX2TS Q_reg_21_ ( .D(n85), .CK(clk), .RN(n5), .Q(Q[21]) );
  DFFRX2TS Q_reg_20_ ( .D(n84), .CK(clk), .RN(n5), .Q(Q[20]) );
  DFFRX2TS Q_reg_19_ ( .D(n83), .CK(clk), .RN(n5), .Q(Q[19]) );
  DFFRX2TS Q_reg_18_ ( .D(n82), .CK(clk), .RN(n5), .Q(Q[18]) );
  DFFRX2TS Q_reg_17_ ( .D(n81), .CK(clk), .RN(n5), .Q(Q[17]) );
  DFFRX2TS Q_reg_16_ ( .D(n80), .CK(clk), .RN(n5), .Q(Q[16]) );
  DFFRX2TS Q_reg_15_ ( .D(n79), .CK(clk), .RN(n5), .Q(Q[15]) );
  DFFRX2TS Q_reg_14_ ( .D(n78), .CK(clk), .RN(n5), .Q(Q[14]) );
  DFFRX2TS Q_reg_13_ ( .D(n77), .CK(clk), .RN(n5), .Q(Q[13]) );
  DFFRX2TS Q_reg_12_ ( .D(n76), .CK(clk), .RN(n6), .Q(Q[12]) );
  DFFRX2TS Q_reg_11_ ( .D(n75), .CK(clk), .RN(n6), .Q(Q[11]) );
  DFFRX2TS Q_reg_10_ ( .D(n74), .CK(clk), .RN(n6), .Q(Q[10]) );
  DFFRX2TS Q_reg_9_ ( .D(n73), .CK(clk), .RN(n6), .Q(Q[9]) );
  DFFRX2TS Q_reg_8_ ( .D(n72), .CK(clk), .RN(n6), .Q(Q[8]) );
  DFFRX2TS Q_reg_6_ ( .D(n70), .CK(clk), .RN(n6), .Q(Q[6]) );
  DFFRX2TS Q_reg_5_ ( .D(n69), .CK(clk), .RN(n6), .Q(Q[5]) );
  DFFRX2TS Q_reg_4_ ( .D(n68), .CK(clk), .RN(n6), .Q(Q[4]) );
  DFFRX2TS Q_reg_3_ ( .D(n67), .CK(clk), .RN(n6), .Q(Q[3]) );
  DFFRX2TS Q_reg_2_ ( .D(n66), .CK(clk), .RN(n18), .Q(Q[2]) );
  DFFRX2TS Q_reg_1_ ( .D(n65), .CK(clk), .RN(n18), .Q(Q[1]) );
  DFFRX2TS Q_reg_0_ ( .D(n64), .CK(clk), .RN(n18), .Q(Q[0]) );
  DFFRX2TS Q_reg_7_ ( .D(n71), .CK(clk), .RN(n6), .Q(Q[7]) );
  CLKBUFX2TS U2 ( .A(n17), .Y(n9) );
  CLKBUFX2TS U3 ( .A(n17), .Y(n8) );
  CLKBUFX2TS U4 ( .A(n16), .Y(n10) );
  CLKBUFX2TS U5 ( .A(n16), .Y(n11) );
  CLKBUFX2TS U6 ( .A(load), .Y(n12) );
  CLKBUFX2TS U7 ( .A(n17), .Y(n13) );
  CLKBUFX2TS U8 ( .A(n16), .Y(n14) );
  CLKBUFX2TS U9 ( .A(n16), .Y(n15) );
  CLKBUFX2TS U10 ( .A(load), .Y(n16) );
  CLKBUFX2TS U11 ( .A(n7), .Y(n17) );
  CLKBUFX2TS U12 ( .A(load), .Y(n7) );
  CLKBUFX2TS U13 ( .A(n18), .Y(n6) );
  CLKBUFX2TS U14 ( .A(n18), .Y(n5) );
  CLKBUFX2TS U15 ( .A(n18), .Y(n4) );
  CLKBUFX2TS U16 ( .A(n18), .Y(n3) );
  CLKBUFX2TS U17 ( .A(n18), .Y(n2) );
  CLKBUFX2TS U18 ( .A(n18), .Y(n1) );
  OAI2BB2XLTS U19 ( .B0(n33), .B1(n10), .A0N(D[32]), .A1N(n12), .Y(n96) );
  OAI2BB2XLTS U20 ( .B0(n34), .B1(n10), .A0N(D[33]), .A1N(n12), .Y(n97) );
  OAI2BB2XLTS U21 ( .B0(n35), .B1(n10), .A0N(D[34]), .A1N(n12), .Y(n98) );
  OAI2BB2XLTS U22 ( .B0(n37), .B1(n10), .A0N(D[36]), .A1N(n12), .Y(n100) );
  OAI2BB2XLTS U23 ( .B0(n57), .B1(n8), .A0N(D[56]), .A1N(n14), .Y(n120) );
  OAI2BB2XLTS U24 ( .B0(n27), .B1(n11), .A0N(D[26]), .A1N(n13), .Y(n90) );
  OAI2BB2XLTS U25 ( .B0(n29), .B1(n11), .A0N(D[28]), .A1N(n15), .Y(n92) );
  OAI2BB2XLTS U26 ( .B0(n31), .B1(n11), .A0N(D[30]), .A1N(n14), .Y(n94) );
  OAI2BB2XLTS U27 ( .B0(n43), .B1(n9), .A0N(D[42]), .A1N(n13), .Y(n106) );
  OAI2BB2XLTS U28 ( .B0(n45), .B1(n9), .A0N(D[44]), .A1N(n13), .Y(n108) );
  OAI2BB2XLTS U29 ( .B0(n47), .B1(n9), .A0N(D[46]), .A1N(n13), .Y(n110) );
  OAI2BB2XLTS U30 ( .B0(n62), .B1(n8), .A0N(D[61]), .A1N(n15), .Y(n125) );
  CLKMX2X2TS U31 ( .A(Q[15]), .B(D[15]), .S0(n11), .Y(n79) );
  CLKMX2X2TS U32 ( .A(Q[17]), .B(D[17]), .S0(n16), .Y(n81) );
  CLKMX2X2TS U33 ( .A(Q[1]), .B(D[1]), .S0(n12), .Y(n65) );
  CLKMX2X2TS U34 ( .A(Q[11]), .B(D[11]), .S0(load), .Y(n75) );
  CLKMX2X2TS U35 ( .A(Q[13]), .B(D[13]), .S0(n11), .Y(n77) );
  CLKMX2X2TS U36 ( .A(Q[19]), .B(D[19]), .S0(n16), .Y(n83) );
  CLKMX2X2TS U37 ( .A(Q[21]), .B(D[21]), .S0(n17), .Y(n85) );
  CLKMX2X2TS U38 ( .A(Q[23]), .B(D[23]), .S0(n16), .Y(n87) );
  CLKMX2X2TS U39 ( .A(Q[9]), .B(D[9]), .S0(n7), .Y(n73) );
  OAI2BB2XLTS U40 ( .B0(n28), .B1(n11), .A0N(D[27]), .A1N(n14), .Y(n91) );
  OAI2BB2XLTS U41 ( .B0(n30), .B1(n11), .A0N(D[29]), .A1N(n14), .Y(n93) );
  OAI2BB2XLTS U42 ( .B0(n32), .B1(n11), .A0N(D[31]), .A1N(n12), .Y(n95) );
  OAI2BB2XLTS U43 ( .B0(n36), .B1(n10), .A0N(D[35]), .A1N(n15), .Y(n99) );
  OAI2BB2XLTS U44 ( .B0(n38), .B1(n11), .A0N(D[37]), .A1N(n12), .Y(n101) );
  OAI2BB2XLTS U45 ( .B0(n39), .B1(n10), .A0N(D[38]), .A1N(n12), .Y(n102) );
  OAI2BB2XLTS U46 ( .B0(n40), .B1(n10), .A0N(D[39]), .A1N(n13), .Y(n103) );
  OAI2BB2XLTS U47 ( .B0(n41), .B1(n10), .A0N(D[40]), .A1N(n13), .Y(n104) );
  OAI2BB2XLTS U48 ( .B0(n42), .B1(n10), .A0N(D[41]), .A1N(n13), .Y(n105) );
  OAI2BB2XLTS U49 ( .B0(n44), .B1(n9), .A0N(D[43]), .A1N(n15), .Y(n107) );
  OAI2BB2XLTS U50 ( .B0(n46), .B1(n9), .A0N(D[45]), .A1N(n15), .Y(n109) );
  OAI2BB2XLTS U51 ( .B0(n48), .B1(n9), .A0N(D[47]), .A1N(n13), .Y(n111) );
  OAI2BB2XLTS U52 ( .B0(n49), .B1(n9), .A0N(D[48]), .A1N(n13), .Y(n112) );
  OAI2BB2XLTS U53 ( .B0(n50), .B1(n9), .A0N(D[49]), .A1N(n13), .Y(n113) );
  OAI2BB2XLTS U54 ( .B0(n51), .B1(n9), .A0N(D[50]), .A1N(n14), .Y(n114) );
  OAI2BB2XLTS U55 ( .B0(n52), .B1(n9), .A0N(D[51]), .A1N(n14), .Y(n115) );
  OAI2BB2XLTS U56 ( .B0(n53), .B1(n8), .A0N(D[52]), .A1N(n14), .Y(n116) );
  OAI2BB2XLTS U57 ( .B0(n54), .B1(n8), .A0N(D[53]), .A1N(n14), .Y(n117) );
  OAI2BB2XLTS U58 ( .B0(n55), .B1(n8), .A0N(D[54]), .A1N(n14), .Y(n118) );
  OAI2BB2XLTS U59 ( .B0(n56), .B1(n8), .A0N(D[55]), .A1N(n15), .Y(n119) );
  OAI2BB2XLTS U60 ( .B0(n58), .B1(n8), .A0N(D[57]), .A1N(n14), .Y(n121) );
  OAI2BB2XLTS U61 ( .B0(n59), .B1(n8), .A0N(D[58]), .A1N(n15), .Y(n122) );
  OAI2BB2XLTS U62 ( .B0(n60), .B1(n8), .A0N(D[59]), .A1N(n15), .Y(n123) );
  OAI2BB2XLTS U63 ( .B0(n61), .B1(n8), .A0N(D[60]), .A1N(n15), .Y(n124) );
  OAI2BB2XLTS U64 ( .B0(n63), .B1(n10), .A0N(D[62]), .A1N(n15), .Y(n127) );
  CLKMX2X2TS U65 ( .A(Q[0]), .B(D[0]), .S0(n17), .Y(n64) );
  CLKMX2X2TS U66 ( .A(Q[2]), .B(D[2]), .S0(n12), .Y(n66) );
  CLKMX2X2TS U67 ( .A(Q[3]), .B(D[3]), .S0(n12), .Y(n67) );
  CLKMX2X2TS U68 ( .A(Q[4]), .B(D[4]), .S0(load), .Y(n68) );
  CLKMX2X2TS U69 ( .A(Q[5]), .B(D[5]), .S0(n17), .Y(n69) );
  CLKMX2X2TS U70 ( .A(Q[6]), .B(D[6]), .S0(load), .Y(n70) );
  CLKMX2X2TS U71 ( .A(Q[7]), .B(D[7]), .S0(load), .Y(n71) );
  CLKMX2X2TS U72 ( .A(Q[8]), .B(D[8]), .S0(n17), .Y(n72) );
  CLKMX2X2TS U73 ( .A(Q[10]), .B(D[10]), .S0(n16), .Y(n74) );
  CLKMX2X2TS U74 ( .A(Q[12]), .B(D[12]), .S0(n17), .Y(n76) );
  CLKMX2X2TS U75 ( .A(Q[14]), .B(D[14]), .S0(n7), .Y(n78) );
  CLKMX2X2TS U76 ( .A(Q[16]), .B(D[16]), .S0(load), .Y(n80) );
  CLKMX2X2TS U77 ( .A(Q[18]), .B(D[18]), .S0(n17), .Y(n82) );
  CLKMX2X2TS U78 ( .A(Q[20]), .B(D[20]), .S0(n11), .Y(n84) );
  CLKMX2X2TS U79 ( .A(Q[22]), .B(D[22]), .S0(n16), .Y(n86) );
  CLKMX2X2TS U80 ( .A(Q[24]), .B(D[24]), .S0(n17), .Y(n88) );
  CLKMX2X2TS U81 ( .A(Q[25]), .B(D[25]), .S0(n16), .Y(n89) );
  INVX2TS U82 ( .A(rst), .Y(n18) );
endmodule


module RegisterAdd_W63_0 ( clk, rst, load, D, Q );
  input [62:0] D;
  output [62:0] Q;
  input clk, rst, load;
  wire   n126, n128, n129, n130, n131, n132, n133, n134, n135, n136, n137,
         n138, n139, n140, n141, n142, n143, n144, n145, n146, n147, n148,
         n149, n150, n151, n152, n153, n154, n155, n156, n157, n158, n159,
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
         n270, n271, n272, n273;

  DFFRX2TS Q_reg_25_ ( .D(n185), .CK(clk), .RN(n129), .Q(Q[25]), .QN(n248) );
  DFFRX2TS Q_reg_62_ ( .D(n148), .CK(clk), .RN(n147), .Q(Q[62]), .QN(n211) );
  DFFRX2TS Q_reg_51_ ( .D(n159), .CK(clk), .RN(n132), .Q(Q[51]), .QN(n222) );
  DFFRX2TS Q_reg_50_ ( .D(n160), .CK(clk), .RN(n132), .Q(Q[50]), .QN(n223) );
  DFFRX2TS Q_reg_49_ ( .D(n161), .CK(clk), .RN(n131), .Q(Q[49]), .QN(n224) );
  DFFRX2TS Q_reg_48_ ( .D(n162), .CK(clk), .RN(n131), .Q(Q[48]), .QN(n225) );
  DFFRX2TS Q_reg_47_ ( .D(n163), .CK(clk), .RN(n131), .Q(Q[47]), .QN(n226) );
  DFFRX2TS Q_reg_46_ ( .D(n164), .CK(clk), .RN(n131), .Q(Q[46]), .QN(n227) );
  DFFRX2TS Q_reg_45_ ( .D(n165), .CK(clk), .RN(n131), .Q(Q[45]), .QN(n228) );
  DFFRX2TS Q_reg_44_ ( .D(n166), .CK(clk), .RN(n131), .Q(Q[44]), .QN(n229) );
  DFFRX2TS Q_reg_43_ ( .D(n167), .CK(clk), .RN(n131), .Q(Q[43]), .QN(n230) );
  DFFRX2TS Q_reg_42_ ( .D(n168), .CK(clk), .RN(n131), .Q(Q[42]), .QN(n231) );
  DFFRX2TS Q_reg_41_ ( .D(n169), .CK(clk), .RN(n131), .Q(Q[41]), .QN(n232) );
  DFFRX2TS Q_reg_40_ ( .D(n170), .CK(clk), .RN(n131), .Q(Q[40]), .QN(n233) );
  DFFRX2TS Q_reg_39_ ( .D(n171), .CK(clk), .RN(n130), .Q(Q[39]), .QN(n234) );
  DFFRX2TS Q_reg_38_ ( .D(n172), .CK(clk), .RN(n130), .Q(Q[38]), .QN(n235) );
  DFFRX2TS Q_reg_37_ ( .D(n173), .CK(clk), .RN(n130), .Q(Q[37]), .QN(n236) );
  DFFRX2TS Q_reg_36_ ( .D(n174), .CK(clk), .RN(n130), .Q(Q[36]), .QN(n237) );
  DFFRX2TS Q_reg_35_ ( .D(n175), .CK(clk), .RN(n130), .Q(Q[35]), .QN(n238) );
  DFFRX2TS Q_reg_34_ ( .D(n176), .CK(clk), .RN(n130), .Q(Q[34]), .QN(n239) );
  DFFRX2TS Q_reg_33_ ( .D(n177), .CK(clk), .RN(n130), .Q(Q[33]), .QN(n240) );
  DFFRX2TS Q_reg_32_ ( .D(n178), .CK(clk), .RN(n130), .Q(Q[32]), .QN(n241) );
  DFFRX2TS Q_reg_31_ ( .D(n179), .CK(clk), .RN(n130), .Q(Q[31]), .QN(n242) );
  DFFRX2TS Q_reg_30_ ( .D(n180), .CK(clk), .RN(n130), .Q(Q[30]), .QN(n243) );
  DFFRX2TS Q_reg_29_ ( .D(n181), .CK(clk), .RN(n129), .Q(Q[29]), .QN(n244) );
  DFFRX2TS Q_reg_28_ ( .D(n182), .CK(clk), .RN(n129), .Q(Q[28]), .QN(n245) );
  DFFRX2TS Q_reg_27_ ( .D(n183), .CK(clk), .RN(n129), .Q(Q[27]), .QN(n246) );
  DFFRX2TS Q_reg_26_ ( .D(n184), .CK(clk), .RN(n129), .Q(Q[26]), .QN(n247) );
  DFFRX2TS Q_reg_24_ ( .D(n186), .CK(clk), .RN(n129), .Q(Q[24]), .QN(n249) );
  DFFRX2TS Q_reg_23_ ( .D(n187), .CK(clk), .RN(n129), .Q(Q[23]), .QN(n250) );
  DFFRX2TS Q_reg_22_ ( .D(n188), .CK(clk), .RN(n129), .Q(Q[22]), .QN(n251) );
  DFFRX2TS Q_reg_21_ ( .D(n189), .CK(clk), .RN(n129), .Q(Q[21]), .QN(n252) );
  DFFRX2TS Q_reg_20_ ( .D(n190), .CK(clk), .RN(n129), .Q(Q[20]), .QN(n253) );
  DFFRX2TS Q_reg_19_ ( .D(n191), .CK(clk), .RN(n128), .Q(Q[19]), .QN(n254) );
  DFFRX2TS Q_reg_18_ ( .D(n192), .CK(clk), .RN(n128), .Q(Q[18]), .QN(n255) );
  DFFRX2TS Q_reg_17_ ( .D(n193), .CK(clk), .RN(n128), .Q(Q[17]), .QN(n256) );
  DFFRX2TS Q_reg_16_ ( .D(n194), .CK(clk), .RN(n128), .Q(Q[16]), .QN(n257) );
  DFFRX2TS Q_reg_15_ ( .D(n195), .CK(clk), .RN(n128), .Q(Q[15]), .QN(n258) );
  DFFRX2TS Q_reg_14_ ( .D(n196), .CK(clk), .RN(n128), .Q(Q[14]), .QN(n259) );
  DFFRX2TS Q_reg_13_ ( .D(n197), .CK(clk), .RN(n128), .Q(Q[13]), .QN(n260) );
  DFFRX2TS Q_reg_12_ ( .D(n198), .CK(clk), .RN(n128), .Q(Q[12]), .QN(n261) );
  DFFRX2TS Q_reg_11_ ( .D(n199), .CK(clk), .RN(n128), .Q(Q[11]), .QN(n262) );
  DFFRX2TS Q_reg_10_ ( .D(n200), .CK(clk), .RN(n128), .Q(Q[10]), .QN(n263) );
  DFFRX2TS Q_reg_9_ ( .D(n201), .CK(clk), .RN(n126), .Q(Q[9]), .QN(n264) );
  DFFRX2TS Q_reg_8_ ( .D(n202), .CK(clk), .RN(n126), .Q(Q[8]), .QN(n265) );
  DFFRX2TS Q_reg_7_ ( .D(n203), .CK(clk), .RN(n126), .Q(Q[7]), .QN(n266) );
  DFFRX2TS Q_reg_6_ ( .D(n204), .CK(clk), .RN(n126), .Q(Q[6]), .QN(n267) );
  DFFRX2TS Q_reg_5_ ( .D(n205), .CK(clk), .RN(n126), .Q(Q[5]), .QN(n268) );
  DFFRX2TS Q_reg_4_ ( .D(n206), .CK(clk), .RN(n126), .Q(Q[4]), .QN(n269) );
  DFFRX2TS Q_reg_3_ ( .D(n207), .CK(clk), .RN(n126), .Q(Q[3]), .QN(n270) );
  DFFRX2TS Q_reg_2_ ( .D(n208), .CK(clk), .RN(n126), .Q(Q[2]), .QN(n271) );
  DFFRX2TS Q_reg_1_ ( .D(n209), .CK(clk), .RN(n126), .Q(Q[1]), .QN(n272) );
  DFFRX2TS Q_reg_0_ ( .D(n210), .CK(clk), .RN(n126), .Q(Q[0]), .QN(n273) );
  DFFRX2TS Q_reg_61_ ( .D(n149), .CK(clk), .RN(n147), .Q(Q[61]), .QN(n212) );
  DFFRX2TS Q_reg_60_ ( .D(n150), .CK(clk), .RN(n147), .Q(Q[60]), .QN(n213) );
  DFFRX2TS Q_reg_59_ ( .D(n151), .CK(clk), .RN(n132), .Q(Q[59]), .QN(n214) );
  DFFRX2TS Q_reg_58_ ( .D(n152), .CK(clk), .RN(n132), .Q(Q[58]), .QN(n215) );
  DFFRX2TS Q_reg_57_ ( .D(n153), .CK(clk), .RN(n132), .Q(Q[57]), .QN(n216) );
  DFFRX2TS Q_reg_56_ ( .D(n154), .CK(clk), .RN(n132), .Q(Q[56]), .QN(n217) );
  DFFRX2TS Q_reg_55_ ( .D(n155), .CK(clk), .RN(n132), .Q(Q[55]), .QN(n218) );
  DFFRX2TS Q_reg_54_ ( .D(n156), .CK(clk), .RN(n132), .Q(Q[54]), .QN(n219) );
  DFFRX2TS Q_reg_53_ ( .D(n157), .CK(clk), .RN(n132), .Q(Q[53]), .QN(n220) );
  DFFRX2TS Q_reg_52_ ( .D(n158), .CK(clk), .RN(n132), .Q(Q[52]), .QN(n221) );
  CLKBUFX2TS U2 ( .A(n144), .Y(n138) );
  CLKBUFX2TS U3 ( .A(n145), .Y(n136) );
  CLKBUFX2TS U4 ( .A(n145), .Y(n137) );
  CLKBUFX2TS U5 ( .A(n146), .Y(n134) );
  CLKBUFX2TS U6 ( .A(n146), .Y(n135) );
  CLKBUFX2TS U7 ( .A(n144), .Y(n139) );
  CLKBUFX2TS U8 ( .A(n146), .Y(n140) );
  CLKBUFX2TS U9 ( .A(n143), .Y(n141) );
  CLKBUFX2TS U10 ( .A(n143), .Y(n142) );
  CLKBUFX2TS U11 ( .A(n133), .Y(n144) );
  CLKBUFX2TS U12 ( .A(n133), .Y(n145) );
  CLKBUFX2TS U13 ( .A(load), .Y(n143) );
  CLKBUFX2TS U14 ( .A(n133), .Y(n146) );
  CLKBUFX2TS U15 ( .A(load), .Y(n133) );
  CLKBUFX2TS U16 ( .A(n147), .Y(n126) );
  CLKBUFX2TS U17 ( .A(n147), .Y(n128) );
  CLKBUFX2TS U18 ( .A(n147), .Y(n129) );
  CLKBUFX2TS U19 ( .A(n147), .Y(n130) );
  CLKBUFX2TS U20 ( .A(n147), .Y(n131) );
  CLKBUFX2TS U21 ( .A(n147), .Y(n132) );
  OAI2BB2XLTS U22 ( .B0(n212), .B1(n145), .A0N(D[61]), .A1N(n142), .Y(n149) );
  OAI2BB2XLTS U23 ( .B0(n258), .B1(n138), .A0N(D[15]), .A1N(n144), .Y(n195) );
  OAI2BB2XLTS U24 ( .B0(n256), .B1(n137), .A0N(D[17]), .A1N(n145), .Y(n193) );
  OAI2BB2XLTS U25 ( .B0(n241), .B1(n135), .A0N(D[32]), .A1N(n143), .Y(n178) );
  OAI2BB2XLTS U26 ( .B0(n240), .B1(n135), .A0N(D[33]), .A1N(n144), .Y(n177) );
  OAI2BB2XLTS U27 ( .B0(n239), .B1(n135), .A0N(D[34]), .A1N(n146), .Y(n176) );
  OAI2BB2XLTS U28 ( .B0(n237), .B1(n135), .A0N(D[36]), .A1N(n144), .Y(n174) );
  OAI2BB2XLTS U29 ( .B0(n217), .B1(n146), .A0N(D[56]), .A1N(n141), .Y(n154) );
  OAI2BB2XLTS U30 ( .B0(n272), .B1(n138), .A0N(D[1]), .A1N(n142), .Y(n209) );
  OAI2BB2XLTS U31 ( .B0(n262), .B1(n138), .A0N(D[11]), .A1N(n133), .Y(n199) );
  OAI2BB2XLTS U32 ( .B0(n260), .B1(n137), .A0N(D[13]), .A1N(n145), .Y(n197) );
  OAI2BB2XLTS U33 ( .B0(n254), .B1(n137), .A0N(D[19]), .A1N(n133), .Y(n191) );
  OAI2BB2XLTS U34 ( .B0(n252), .B1(n137), .A0N(D[21]), .A1N(n139), .Y(n189) );
  OAI2BB2XLTS U35 ( .B0(n250), .B1(n136), .A0N(D[23]), .A1N(n139), .Y(n187) );
  OAI2BB2XLTS U36 ( .B0(n247), .B1(n136), .A0N(D[26]), .A1N(n139), .Y(n184) );
  OAI2BB2XLTS U37 ( .B0(n245), .B1(n136), .A0N(D[28]), .A1N(n143), .Y(n182) );
  OAI2BB2XLTS U38 ( .B0(n243), .B1(n136), .A0N(D[30]), .A1N(n139), .Y(n180) );
  OAI2BB2XLTS U39 ( .B0(n231), .B1(n134), .A0N(D[42]), .A1N(n133), .Y(n168) );
  OAI2BB2XLTS U40 ( .B0(n229), .B1(n134), .A0N(D[44]), .A1N(n142), .Y(n166) );
  OAI2BB2XLTS U41 ( .B0(n227), .B1(n134), .A0N(D[46]), .A1N(n140), .Y(n164) );
  OAI2BB2XLTS U42 ( .B0(n273), .B1(n139), .A0N(n142), .A1N(D[0]), .Y(n210) );
  OAI2BB2XLTS U43 ( .B0(n271), .B1(n139), .A0N(D[2]), .A1N(n141), .Y(n208) );
  OAI2BB2XLTS U44 ( .B0(n270), .B1(n137), .A0N(D[3]), .A1N(n141), .Y(n207) );
  OAI2BB2XLTS U45 ( .B0(n269), .B1(n138), .A0N(D[4]), .A1N(n141), .Y(n206) );
  OAI2BB2XLTS U46 ( .B0(n268), .B1(n139), .A0N(D[5]), .A1N(n140), .Y(n205) );
  OAI2BB2XLTS U47 ( .B0(n267), .B1(n138), .A0N(D[6]), .A1N(n140), .Y(n204) );
  OAI2BB2XLTS U48 ( .B0(n266), .B1(n138), .A0N(D[7]), .A1N(n141), .Y(n203) );
  OAI2BB2XLTS U49 ( .B0(n265), .B1(n138), .A0N(D[8]), .A1N(n133), .Y(n202) );
  OAI2BB2XLTS U50 ( .B0(n264), .B1(n137), .A0N(D[9]), .A1N(n140), .Y(n201) );
  OAI2BB2XLTS U51 ( .B0(n263), .B1(n138), .A0N(D[10]), .A1N(n143), .Y(n200) );
  OAI2BB2XLTS U52 ( .B0(n261), .B1(n138), .A0N(D[12]), .A1N(n142), .Y(n198) );
  OAI2BB2XLTS U53 ( .B0(n259), .B1(n138), .A0N(D[14]), .A1N(n142), .Y(n196) );
  OAI2BB2XLTS U54 ( .B0(n257), .B1(n137), .A0N(D[16]), .A1N(n146), .Y(n194) );
  OAI2BB2XLTS U55 ( .B0(n255), .B1(n137), .A0N(D[18]), .A1N(n143), .Y(n192) );
  OAI2BB2XLTS U56 ( .B0(n253), .B1(n137), .A0N(D[20]), .A1N(n139), .Y(n190) );
  OAI2BB2XLTS U57 ( .B0(n251), .B1(n136), .A0N(D[22]), .A1N(n144), .Y(n188) );
  OAI2BB2XLTS U58 ( .B0(n249), .B1(n136), .A0N(D[24]), .A1N(n145), .Y(n186) );
  OAI2BB2XLTS U59 ( .B0(n248), .B1(n136), .A0N(D[25]), .A1N(n146), .Y(n185) );
  OAI2BB2XLTS U60 ( .B0(n246), .B1(n136), .A0N(D[27]), .A1N(n139), .Y(n183) );
  OAI2BB2XLTS U61 ( .B0(n244), .B1(n136), .A0N(D[29]), .A1N(n139), .Y(n181) );
  OAI2BB2XLTS U62 ( .B0(n242), .B1(n136), .A0N(D[31]), .A1N(n144), .Y(n179) );
  OAI2BB2XLTS U63 ( .B0(n238), .B1(n135), .A0N(D[35]), .A1N(n143), .Y(n175) );
  OAI2BB2XLTS U64 ( .B0(n236), .B1(n135), .A0N(D[37]), .A1N(n133), .Y(n173) );
  OAI2BB2XLTS U65 ( .B0(n235), .B1(n137), .A0N(D[38]), .A1N(n146), .Y(n172) );
  OAI2BB2XLTS U66 ( .B0(n234), .B1(n135), .A0N(D[39]), .A1N(n133), .Y(n171) );
  OAI2BB2XLTS U67 ( .B0(n233), .B1(n135), .A0N(D[40]), .A1N(n142), .Y(n170) );
  OAI2BB2XLTS U68 ( .B0(n232), .B1(n135), .A0N(D[41]), .A1N(n143), .Y(n169) );
  OAI2BB2XLTS U69 ( .B0(n230), .B1(n134), .A0N(D[43]), .A1N(n133), .Y(n167) );
  OAI2BB2XLTS U70 ( .B0(n228), .B1(n134), .A0N(D[45]), .A1N(n140), .Y(n165) );
  OAI2BB2XLTS U71 ( .B0(n226), .B1(n134), .A0N(D[47]), .A1N(n143), .Y(n163) );
  OAI2BB2XLTS U72 ( .B0(n225), .B1(n134), .A0N(D[48]), .A1N(n140), .Y(n162) );
  OAI2BB2XLTS U73 ( .B0(n224), .B1(n134), .A0N(D[49]), .A1N(n140), .Y(n161) );
  OAI2BB2XLTS U74 ( .B0(n223), .B1(n134), .A0N(D[50]), .A1N(n140), .Y(n160) );
  OAI2BB2XLTS U75 ( .B0(n222), .B1(n134), .A0N(D[51]), .A1N(n140), .Y(n159) );
  OAI2BB2XLTS U76 ( .B0(n221), .B1(n145), .A0N(D[52]), .A1N(n141), .Y(n158) );
  OAI2BB2XLTS U77 ( .B0(n220), .B1(n144), .A0N(D[53]), .A1N(n140), .Y(n157) );
  OAI2BB2XLTS U78 ( .B0(n219), .B1(n146), .A0N(D[54]), .A1N(n141), .Y(n156) );
  OAI2BB2XLTS U79 ( .B0(n218), .B1(n145), .A0N(D[55]), .A1N(n141), .Y(n155) );
  OAI2BB2XLTS U80 ( .B0(n216), .B1(load), .A0N(D[57]), .A1N(n141), .Y(n153) );
  OAI2BB2XLTS U81 ( .B0(n215), .B1(load), .A0N(D[58]), .A1N(n142), .Y(n152) );
  OAI2BB2XLTS U82 ( .B0(n214), .B1(load), .A0N(D[59]), .A1N(n141), .Y(n151) );
  OAI2BB2XLTS U83 ( .B0(n213), .B1(load), .A0N(D[60]), .A1N(n142), .Y(n150) );
  OAI2BB2XLTS U84 ( .B0(n211), .B1(n135), .A0N(D[62]), .A1N(n142), .Y(n148) );
  INVX2TS U85 ( .A(rst), .Y(n147) );
endmodule


module RegisterAdd_W1_9 ( clk, rst, load, D, Q );
  input [0:0] D;
  output [0:0] Q;
  input clk, rst, load;
  wire   n2, n4, n5;

  DFFRX2TS Q_reg_0_ ( .D(n4), .CK(clk), .RN(n2), .Q(Q[0]), .QN(n5) );
  OAI2BB2XLTS U2 ( .B0(n5), .B1(load), .A0N(load), .A1N(D[0]), .Y(n4) );
  INVX2TS U3 ( .A(rst), .Y(n2) );
endmodule


module Oper_Start_In_2_W64 ( clk, rst, load_b_i, intAS, intDX, intDY, DMP_o, 
        DmP_o, zero_flag_o, real_op_o, sign_final_result_o );
  input [63:0] intDX;
  input [63:0] intDY;
  output [62:0] DMP_o;
  output [62:0] DmP_o;
  input clk, rst, load_b_i, intAS;
  output zero_flag_o, real_op_o, sign_final_result_o;
  wire   gtXY, eqXY, sign_result, n1;
  wire   [62:0] intM;
  wire   [62:0] intm;

  Comparator_W63 Magnitude_Comparator ( .Data_X_i(intDX[62:0]), .Data_Y_i(
        intDY[62:0]), .gtXY_o(gtXY), .eqXY_o(eqXY) );
  xor_tri_W64 Op_verification ( .A_i(intDX[63]), .B_i(intDY[63]), .C_i(intAS), 
        .Z_o(real_op_o) );
  sgn_result result_sign_bit ( .Add_Subt_i(intAS), .sgn_X_i(intDX[63]), 
        .sgn_Y_i(intDY[63]), .gtXY_i(gtXY), .eqXY_i(eqXY), .sgn_result_o(
        sign_result) );
  MultiplexTxT_W63 MuxXY ( .select(gtXY), .D0_i(intDX[62:0]), .D1_i(
        intDY[62:0]), .S0_o(intM), .S1_o(intm) );
  RegisterAdd_W63_1 MRegister ( .clk(clk), .rst(rst), .load(n1), .D(intM), .Q(
        DMP_o) );
  RegisterAdd_W63_0 mRegister ( .clk(clk), .rst(rst), .load(load_b_i), .D(intm), .Q(DmP_o) );
  RegisterAdd_W1_9 SignRegister ( .clk(clk), .rst(rst), .load(n1), .D(
        sign_result), .Q(sign_final_result_o) );
  CLKBUFX2TS U1 ( .A(load_b_i), .Y(n1) );
  AND2X2TS U2 ( .A(real_op_o), .B(eqXY), .Y(zero_flag_o) );
endmodule


module Multiplexer_AC_W11_1 ( ctrl, D0, D1, S );
  input [10:0] D0;
  input [10:0] D1;
  output [10:0] S;
  input ctrl;
  wire   n1, n2, n3;

  INVX2TS U1 ( .A(n2), .Y(n1) );
  CLKBUFX2TS U2 ( .A(ctrl), .Y(n2) );
  AO22X1TS U3 ( .A0(D1[0]), .A1(ctrl), .B0(D0[0]), .B1(n1), .Y(S[0]) );
  AO22X1TS U4 ( .A0(D1[1]), .A1(ctrl), .B0(D0[1]), .B1(n3), .Y(S[1]) );
  AO22X1TS U5 ( .A0(D1[2]), .A1(ctrl), .B0(D0[2]), .B1(n3), .Y(S[2]) );
  AO22X1TS U6 ( .A0(D1[3]), .A1(ctrl), .B0(D0[3]), .B1(n3), .Y(S[3]) );
  INVX2TS U7 ( .A(ctrl), .Y(n3) );
  AO22X1TS U8 ( .A0(D1[4]), .A1(ctrl), .B0(D0[4]), .B1(n3), .Y(S[4]) );
  AO22X1TS U9 ( .A0(D1[5]), .A1(ctrl), .B0(D0[5]), .B1(n3), .Y(S[5]) );
  AO22X1TS U10 ( .A0(D1[6]), .A1(ctrl), .B0(D0[6]), .B1(n3), .Y(S[6]) );
  AO22X1TS U11 ( .A0(D1[7]), .A1(ctrl), .B0(D0[7]), .B1(n3), .Y(S[7]) );
  AO22X1TS U12 ( .A0(D1[8]), .A1(n2), .B0(D0[8]), .B1(n3), .Y(S[8]) );
  AO22X1TS U13 ( .A0(n2), .A1(D1[9]), .B0(D0[9]), .B1(n3), .Y(S[9]) );
  AO22X1TS U14 ( .A0(D1[10]), .A1(n2), .B0(D0[10]), .B1(n3), .Y(S[10]) );
endmodule


module Mux_3x1_W11 ( ctrl, D0, D1, D2, S );
  input [1:0] ctrl;
  input [10:0] D0;
  input [10:0] D1;
  input [10:0] D2;
  output [10:0] S;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17;

  CLKBUFX2TS U2 ( .A(n1), .Y(n14) );
  NOR2XLTS U3 ( .A(ctrl[0]), .B(ctrl[1]), .Y(n1) );
  AOI22XLTS U4 ( .A0(D2[1]), .A1(n16), .B0(D1[1]), .B1(n17), .Y(n12) );
  AOI22XLTS U5 ( .A0(D2[2]), .A1(n16), .B0(D1[2]), .B1(n17), .Y(n11) );
  AOI22XLTS U6 ( .A0(D2[3]), .A1(n16), .B0(D1[3]), .B1(n17), .Y(n10) );
  AOI22XLTS U7 ( .A0(D2[4]), .A1(n16), .B0(D1[4]), .B1(n17), .Y(n9) );
  AOI22XLTS U8 ( .A0(D2[5]), .A1(n16), .B0(D1[5]), .B1(n17), .Y(n8) );
  AOI22XLTS U9 ( .A0(D2[6]), .A1(n16), .B0(D1[6]), .B1(n17), .Y(n7) );
  AOI22XLTS U10 ( .A0(D2[7]), .A1(n16), .B0(D1[7]), .B1(n17), .Y(n6) );
  AOI22XLTS U11 ( .A0(D2[8]), .A1(n16), .B0(D1[8]), .B1(n17), .Y(n5) );
  AOI22XLTS U12 ( .A0(D2[9]), .A1(n16), .B0(D1[9]), .B1(n17), .Y(n2) );
  AOI22XLTS U13 ( .A0(D2[10]), .A1(n16), .B0(D1[10]), .B1(n17), .Y(n13) );
  NOR2BXLTS U14 ( .AN(ctrl[0]), .B(ctrl[1]), .Y(n4) );
  CLKBUFX2TS U15 ( .A(n3), .Y(n16) );
  NOR2BX1TS U16 ( .AN(ctrl[1]), .B(ctrl[0]), .Y(n3) );
  AO21X1TS U17 ( .A0(D0[0]), .A1(n1), .B0(n15), .Y(S[0]) );
  AO22X1TS U18 ( .A0(D2[0]), .A1(n3), .B0(D1[0]), .B1(n4), .Y(n15) );
  OAI2BB1X1TS U19 ( .A0N(D0[1]), .A1N(n1), .B0(n12), .Y(S[1]) );
  CLKBUFX2TS U20 ( .A(n4), .Y(n17) );
  OAI2BB1X1TS U21 ( .A0N(D0[2]), .A1N(n1), .B0(n11), .Y(S[2]) );
  OAI2BB1X1TS U22 ( .A0N(D0[3]), .A1N(n1), .B0(n10), .Y(S[3]) );
  OAI2BB1X1TS U23 ( .A0N(D0[4]), .A1N(n1), .B0(n9), .Y(S[4]) );
  OAI2BB1X1TS U24 ( .A0N(D0[6]), .A1N(n1), .B0(n7), .Y(S[6]) );
  OAI2BB1X1TS U25 ( .A0N(D0[7]), .A1N(n1), .B0(n6), .Y(S[7]) );
  OAI2BB1X1TS U26 ( .A0N(D0[5]), .A1N(n1), .B0(n8), .Y(S[5]) );
  OAI2BB1X1TS U27 ( .A0N(D0[8]), .A1N(n1), .B0(n5), .Y(S[8]) );
  OAI2BB1X1TS U28 ( .A0N(D0[9]), .A1N(n14), .B0(n2), .Y(S[9]) );
  OAI2BB1X1TS U29 ( .A0N(D0[10]), .A1N(n14), .B0(n13), .Y(S[10]) );
endmodule


module add_sub_carry_out_W11_DW01_add_0 ( A, B, CI, SUM, CO );
  input [11:0] A;
  input [11:0] B;
  output [11:0] SUM;
  input CI;
  output CO;
  wire   n1, n2;
  wire   [10:1] carry;

  CMPR32X2TS U1_10 ( .A(A[10]), .B(B[10]), .C(carry[10]), .CO(SUM[11]), .S(
        SUM[10]) );
  CMPR32X2TS U1_1 ( .A(A[1]), .B(B[1]), .C(carry[1]), .CO(carry[2]), .S(SUM[1]) );
  CMPR32X2TS U1_9 ( .A(A[9]), .B(B[9]), .C(carry[9]), .CO(carry[10]), .S(
        SUM[9]) );
  CMPR32X2TS U1_8 ( .A(A[8]), .B(B[8]), .C(carry[8]), .CO(carry[9]), .S(SUM[8]) );
  CMPR32X2TS U1_7 ( .A(A[7]), .B(B[7]), .C(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  CMPR32X2TS U1_6 ( .A(A[6]), .B(B[6]), .C(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  CMPR32X2TS U1_5 ( .A(A[5]), .B(B[5]), .C(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  CMPR32X2TS U1_4 ( .A(A[4]), .B(B[4]), .C(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  CMPR32X2TS U1_3 ( .A(A[3]), .B(B[3]), .C(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  CMPR32X2TS U1_2 ( .A(A[2]), .B(B[2]), .C(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  CLKINVX2TS U1 ( .A(B[0]), .Y(n2) );
  XNOR2XLTS U2 ( .A(B[0]), .B(n1), .Y(SUM[0]) );
  NOR2X1TS U3 ( .A(n1), .B(n2), .Y(carry[1]) );
  INVX2TS U4 ( .A(A[0]), .Y(n1) );
endmodule


module add_sub_carry_out_W11_DW01_sub_0 ( A, B, CI, DIFF, CO );
  input [11:0] A;
  input [11:0] B;
  output [11:0] DIFF;
  input CI;
  output CO;
  wire   n1, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13;
  wire   [11:1] carry;

  CMPR32X2TS U2_10 ( .A(A[10]), .B(n3), .C(carry[10]), .CO(carry[11]), .S(
        DIFF[10]) );
  CMPR32X2TS U2_1 ( .A(A[1]), .B(n12), .C(carry[1]), .CO(carry[2]), .S(DIFF[1]) );
  CMPR32X2TS U2_9 ( .A(A[9]), .B(n4), .C(carry[9]), .CO(carry[10]), .S(DIFF[9]) );
  CMPR32X2TS U2_8 ( .A(A[8]), .B(n5), .C(carry[8]), .CO(carry[9]), .S(DIFF[8])
         );
  CMPR32X2TS U2_7 ( .A(A[7]), .B(n6), .C(carry[7]), .CO(carry[8]), .S(DIFF[7])
         );
  CMPR32X2TS U2_6 ( .A(A[6]), .B(n7), .C(carry[6]), .CO(carry[7]), .S(DIFF[6])
         );
  CMPR32X2TS U2_5 ( .A(A[5]), .B(n8), .C(carry[5]), .CO(carry[6]), .S(DIFF[5])
         );
  CMPR32X2TS U2_4 ( .A(A[4]), .B(n9), .C(carry[4]), .CO(carry[5]), .S(DIFF[4])
         );
  CMPR32X2TS U2_3 ( .A(A[3]), .B(n10), .C(carry[3]), .CO(carry[4]), .S(DIFF[3]) );
  CMPR32X2TS U2_2 ( .A(A[2]), .B(n11), .C(carry[2]), .CO(carry[3]), .S(DIFF[2]) );
  INVXLTS U1 ( .A(B[0]), .Y(n13) );
  INVX2TS U2 ( .A(B[2]), .Y(n11) );
  INVX2TS U3 ( .A(B[3]), .Y(n10) );
  INVX2TS U4 ( .A(B[4]), .Y(n9) );
  INVX2TS U5 ( .A(B[5]), .Y(n8) );
  INVX2TS U6 ( .A(B[6]), .Y(n7) );
  INVX2TS U7 ( .A(B[7]), .Y(n6) );
  INVX2TS U8 ( .A(B[8]), .Y(n5) );
  INVX2TS U9 ( .A(B[9]), .Y(n4) );
  INVX2TS U10 ( .A(B[1]), .Y(n12) );
  NAND2X1TS U11 ( .A(B[0]), .B(n1), .Y(carry[1]) );
  INVX2TS U12 ( .A(A[0]), .Y(n1) );
  INVX2TS U13 ( .A(B[10]), .Y(n3) );
  INVX2TS U14 ( .A(carry[11]), .Y(DIFF[11]) );
  XNOR2X1TS U15 ( .A(n13), .B(A[0]), .Y(DIFF[0]) );
endmodule


module add_sub_carry_out_W11 ( op_mode, Data_A, Data_B, Data_S );
  input [10:0] Data_A;
  input [10:0] Data_B;
  output [11:0] Data_S;
  input op_mode;
  wire   N3, N4, N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, N15, N16, N17,
         N18, N19, N20, N21, N22, N23, N24, N25, N26, n1, n2, n3;

  add_sub_carry_out_W11_DW01_add_0 add_36 ( .A({1'b0, Data_A}), .B({1'b0, 
        Data_B}), .CI(1'b0), .SUM({N26, N25, N24, N23, N22, N21, N20, N19, N18, 
        N17, N16, N15}) );
  add_sub_carry_out_W11_DW01_sub_0 sub_34 ( .A({1'b0, Data_A}), .B({1'b0, 
        Data_B}), .CI(1'b0), .DIFF({N14, N13, N12, N11, N10, N9, N8, N7, N6, 
        N5, N4, N3}) );
  INVX2TS U3 ( .A(n2), .Y(n1) );
  CLKBUFX2TS U4 ( .A(op_mode), .Y(n2) );
  AO22X1TS U5 ( .A0(N25), .A1(n3), .B0(N13), .B1(op_mode), .Y(Data_S[10]) );
  AO22X1TS U6 ( .A0(N8), .A1(op_mode), .B0(N20), .B1(n3), .Y(Data_S[5]) );
  AO22X1TS U7 ( .A0(N24), .A1(n3), .B0(op_mode), .B1(N12), .Y(Data_S[9]) );
  AO22X1TS U8 ( .A0(N23), .A1(n3), .B0(N11), .B1(op_mode), .Y(Data_S[8]) );
  AO22X1TS U9 ( .A0(N22), .A1(n3), .B0(N10), .B1(op_mode), .Y(Data_S[7]) );
  AO22X1TS U10 ( .A0(N26), .A1(n1), .B0(N14), .B1(n2), .Y(Data_S[11]) );
  AO22X1TS U11 ( .A0(N6), .A1(op_mode), .B0(N18), .B1(n3), .Y(Data_S[3]) );
  AO22X1TS U12 ( .A0(N9), .A1(n2), .B0(N21), .B1(n3), .Y(Data_S[6]) );
  AO22X1TS U13 ( .A0(N7), .A1(op_mode), .B0(N19), .B1(n3), .Y(Data_S[4]) );
  INVX2TS U14 ( .A(op_mode), .Y(n3) );
  AO22X1TS U15 ( .A0(N5), .A1(op_mode), .B0(N17), .B1(n3), .Y(Data_S[2]) );
  AO22X1TS U16 ( .A0(N4), .A1(n2), .B0(N16), .B1(n1), .Y(Data_S[1]) );
  AO22X1TS U17 ( .A0(N3), .A1(n2), .B0(N15), .B1(n3), .Y(Data_S[0]) );
endmodule


module Greater_Comparator_W12 ( Data_A, Data_B, gthan );
  input [11:0] Data_A;
  input [11:0] Data_B;
  output gthan;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35;

  OA21XLTS U1 ( .A0(n24), .A1(Data_A[10]), .B0(n1), .Y(n2) );
  INVX2TS U2 ( .A(Data_A[8]), .Y(n34) );
  INVX2TS U3 ( .A(Data_A[5]), .Y(n31) );
  INVX2TS U4 ( .A(Data_A[4]), .Y(n30) );
  INVX2TS U5 ( .A(n11), .Y(n33) );
  INVX2TS U6 ( .A(Data_B[11]), .Y(n23) );
  INVX2TS U7 ( .A(Data_B[10]), .Y(n24) );
  INVX2TS U8 ( .A(n9), .Y(n32) );
  INVX2TS U9 ( .A(Data_A[9]), .Y(n35) );
  INVX2TS U10 ( .A(Data_B[3]), .Y(n27) );
  INVX2TS U11 ( .A(Data_B[0]), .Y(n22) );
  INVX2TS U12 ( .A(Data_A[1]), .Y(n29) );
  INVX2TS U13 ( .A(Data_B[6]), .Y(n26) );
  INVX2TS U14 ( .A(Data_B[2]), .Y(n28) );
  INVX2TS U15 ( .A(Data_B[7]), .Y(n25) );
  NAND2BX1TS U16 ( .AN(Data_B[9]), .B(Data_A[9]), .Y(n15) );
  AOI32X1TS U17 ( .A0(Data_B[8]), .A1(n34), .A2(n15), .B0(n35), .B1(Data_B[9]), 
        .Y(n1) );
  NOR2BX1TS U18 ( .AN(Data_A[10]), .B(Data_B[10]), .Y(n17) );
  NOR2BX1TS U19 ( .AN(Data_A[11]), .B(Data_B[11]), .Y(n16) );
  OAI32X1TS U20 ( .A0(n2), .A1(n17), .A2(n16), .B0(Data_A[11]), .B1(n23), .Y(
        n21) );
  NOR2BX1TS U21 ( .AN(Data_A[3]), .B(Data_B[3]), .Y(n3) );
  AOI21X1TS U22 ( .A0(Data_A[2]), .A1(n28), .B0(n3), .Y(n4) );
  OAI32X1TS U23 ( .A0(n28), .A1(Data_A[2]), .A2(n3), .B0(Data_A[3]), .B1(n27), 
        .Y(n6) );
  NAND2BX1TS U24 ( .AN(Data_B[5]), .B(Data_A[5]), .Y(n8) );
  OAI221XLTS U25 ( .A0(Data_B[4]), .A1(n30), .B0(n4), .B1(n6), .C0(n8), .Y(n14) );
  AOI2BB2X1TS U26 ( .B0(Data_A[0]), .B1(n22), .A0N(n29), .A1N(Data_B[1]), .Y(
        n5) );
  AOI211X1TS U27 ( .A0(Data_B[1]), .A1(n29), .B0(n6), .C0(n5), .Y(n13) );
  AND2X1TS U28 ( .A(Data_A[7]), .B(n25), .Y(n7) );
  AOI21X1TS U29 ( .A0(n26), .A1(Data_A[6]), .B0(n7), .Y(n11) );
  OAI32X1TS U30 ( .A0(n26), .A1(Data_A[6]), .A2(n7), .B0(Data_A[7]), .B1(n25), 
        .Y(n10) );
  AOI32X1TS U31 ( .A0(Data_B[4]), .A1(n30), .A2(n8), .B0(n31), .B1(Data_B[5]), 
        .Y(n9) );
  OAI22X1TS U32 ( .A0(n11), .A1(n10), .B0(n10), .B1(n32), .Y(n12) );
  OAI31X1TS U33 ( .A0(n14), .A1(n13), .A2(n33), .B0(n12), .Y(n20) );
  OAI21X1TS U34 ( .A0(Data_B[8]), .A1(n34), .B0(n15), .Y(n18) );
  NOR3X1TS U35 ( .A(n18), .B(n17), .C(n16), .Y(n19) );
  OAI22X1TS U36 ( .A0(n21), .A1(n20), .B0(n19), .B1(n21), .Y(gthan) );
endmodule


module Comparator_Less_W12 ( Data_A, Data_B, less );
  input [11:0] Data_A;
  input [11:0] Data_B;
  output less;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35;

  INVX2TS U1 ( .A(Data_A[10]), .Y(n34) );
  INVX2TS U2 ( .A(Data_A[7]), .Y(n32) );
  INVX2TS U3 ( .A(Data_A[6]), .Y(n31) );
  INVX2TS U4 ( .A(Data_A[2]), .Y(n28) );
  INVX2TS U5 ( .A(n11), .Y(n33) );
  INVX2TS U6 ( .A(Data_A[11]), .Y(n35) );
  INVX2TS U7 ( .A(n9), .Y(n30) );
  INVX2TS U8 ( .A(Data_B[1]), .Y(n26) );
  INVX2TS U9 ( .A(Data_A[0]), .Y(n27) );
  INVX2TS U10 ( .A(Data_A[3]), .Y(n29) );
  INVX2TS U11 ( .A(Data_B[8]), .Y(n23) );
  INVX2TS U12 ( .A(Data_B[4]), .Y(n25) );
  INVX2TS U13 ( .A(Data_B[5]), .Y(n24) );
  INVX2TS U14 ( .A(Data_B[9]), .Y(n22) );
  NAND2BX1TS U15 ( .AN(Data_A[9]), .B(Data_B[9]), .Y(n15) );
  AOI32X1TS U16 ( .A0(Data_A[8]), .A1(n23), .A2(n15), .B0(n22), .B1(Data_A[9]), 
        .Y(n1) );
  OA21XLTS U17 ( .A0(n34), .A1(Data_B[10]), .B0(n1), .Y(n2) );
  NOR2BX1TS U18 ( .AN(Data_B[10]), .B(Data_A[10]), .Y(n17) );
  NOR2BX1TS U19 ( .AN(Data_B[11]), .B(Data_A[11]), .Y(n16) );
  OAI32X1TS U20 ( .A0(n2), .A1(n17), .A2(n16), .B0(Data_B[11]), .B1(n35), .Y(
        n21) );
  NOR2BX1TS U21 ( .AN(Data_B[3]), .B(Data_A[3]), .Y(n3) );
  AOI21X1TS U22 ( .A0(Data_B[2]), .A1(n28), .B0(n3), .Y(n4) );
  OAI32X1TS U23 ( .A0(n28), .A1(Data_B[2]), .A2(n3), .B0(Data_B[3]), .B1(n29), 
        .Y(n6) );
  NAND2BX1TS U24 ( .AN(Data_A[5]), .B(Data_B[5]), .Y(n8) );
  OAI221XLTS U25 ( .A0(Data_A[4]), .A1(n25), .B0(n4), .B1(n6), .C0(n8), .Y(n14) );
  AOI2BB2X1TS U26 ( .B0(Data_B[0]), .B1(n27), .A0N(n26), .A1N(Data_A[1]), .Y(
        n5) );
  AOI211X1TS U27 ( .A0(Data_A[1]), .A1(n26), .B0(n6), .C0(n5), .Y(n13) );
  AND2X1TS U28 ( .A(Data_B[7]), .B(n32), .Y(n7) );
  AOI21X1TS U29 ( .A0(n31), .A1(Data_B[6]), .B0(n7), .Y(n11) );
  OAI32X1TS U30 ( .A0(n31), .A1(Data_B[6]), .A2(n7), .B0(Data_B[7]), .B1(n32), 
        .Y(n10) );
  AOI32X1TS U31 ( .A0(Data_A[4]), .A1(n25), .A2(n8), .B0(n24), .B1(Data_A[5]), 
        .Y(n9) );
  OAI22X1TS U32 ( .A0(n11), .A1(n10), .B0(n10), .B1(n30), .Y(n12) );
  OAI31X1TS U33 ( .A0(n14), .A1(n13), .A2(n33), .B0(n12), .Y(n20) );
  OAI21X1TS U34 ( .A0(Data_A[8]), .A1(n23), .B0(n15), .Y(n18) );
  NOR3X1TS U35 ( .A(n18), .B(n17), .C(n16), .Y(n19) );
  OAI22X1TS U36 ( .A0(n21), .A1(n20), .B0(n19), .B1(n21), .Y(less) );
endmodule


module Comparators_W_Exp12 ( exp, overflow, underflow );
  input [11:0] exp;
  output overflow, underflow;


  Greater_Comparator_W12 GTComparator ( .Data_A(exp), .Data_B({1'b1, 1'b1, 
        1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b0}), .gthan(
        overflow) );
  Comparator_Less_W12 LTComparator ( .Data_A(exp), .Data_B({1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b1}), .less(
        underflow) );
endmodule


module RegisterAdd_W11 ( clk, rst, load, D, Q );
  input [10:0] D;
  output [10:0] Q;
  input clk, rst, load;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n23, n22, n24, n25, n26;

  DFFRX2TS Q_reg_10_ ( .D(n23), .CK(clk), .RN(n22), .Q(Q[10]), .QN(n11) );
  DFFRX2TS Q_reg_9_ ( .D(n21), .CK(clk), .RN(n22), .Q(Q[9]), .QN(n10) );
  DFFRX2TS Q_reg_8_ ( .D(n20), .CK(clk), .RN(n26), .Q(Q[8]), .QN(n9) );
  DFFRX2TS Q_reg_7_ ( .D(n19), .CK(clk), .RN(n26), .Q(Q[7]), .QN(n8) );
  DFFRX2TS Q_reg_6_ ( .D(n18), .CK(clk), .RN(n26), .Q(Q[6]), .QN(n7) );
  DFFRX2TS Q_reg_5_ ( .D(n17), .CK(clk), .RN(n26), .Q(Q[5]), .QN(n6) );
  DFFRX2TS Q_reg_4_ ( .D(n16), .CK(clk), .RN(n26), .Q(Q[4]), .QN(n5) );
  DFFRX2TS Q_reg_3_ ( .D(n15), .CK(clk), .RN(n26), .Q(Q[3]), .QN(n4) );
  DFFRX2TS Q_reg_2_ ( .D(n14), .CK(clk), .RN(n26), .Q(Q[2]), .QN(n3) );
  DFFRX2TS Q_reg_1_ ( .D(n13), .CK(clk), .RN(n26), .Q(Q[1]), .QN(n2) );
  DFFRX2TS Q_reg_0_ ( .D(n12), .CK(clk), .RN(n26), .Q(Q[0]), .QN(n1) );
  CLKBUFX2TS U2 ( .A(n26), .Y(n22) );
  CLKBUFX2TS U3 ( .A(n24), .Y(n25) );
  CLKBUFX2TS U4 ( .A(load), .Y(n24) );
  OAI2BB2XLTS U5 ( .B0(n11), .B1(n25), .A0N(D[10]), .A1N(load), .Y(n23) );
  OAI2BB2XLTS U6 ( .B0(n7), .B1(n24), .A0N(D[6]), .A1N(n24), .Y(n18) );
  OAI2BB2XLTS U7 ( .B0(n8), .B1(n25), .A0N(D[7]), .A1N(load), .Y(n19) );
  OAI2BB2XLTS U8 ( .B0(n9), .B1(n25), .A0N(D[8]), .A1N(load), .Y(n20) );
  OAI2BB2XLTS U9 ( .B0(n10), .B1(n25), .A0N(D[9]), .A1N(load), .Y(n21) );
  OAI2BB2XLTS U10 ( .B0(n4), .B1(n25), .A0N(D[3]), .A1N(load), .Y(n15) );
  OAI2BB2XLTS U11 ( .B0(n5), .B1(n25), .A0N(D[4]), .A1N(n24), .Y(n16) );
  OAI2BB2XLTS U12 ( .B0(n6), .B1(n25), .A0N(D[5]), .A1N(n24), .Y(n17) );
  OAI2BB2XLTS U13 ( .B0(n1), .B1(n25), .A0N(n24), .A1N(D[0]), .Y(n12) );
  OAI2BB2XLTS U14 ( .B0(n2), .B1(n25), .A0N(D[1]), .A1N(load), .Y(n13) );
  OAI2BB2XLTS U15 ( .B0(n3), .B1(n25), .A0N(D[2]), .A1N(n24), .Y(n14) );
  INVX2TS U16 ( .A(rst), .Y(n26) );
endmodule


module RegisterAdd_W1_8 ( clk, rst, load, D, Q );
  input [0:0] D;
  output [0:0] Q;
  input clk, rst, load;
  wire   n2, n4, n5;

  DFFRX2TS Q_reg_0_ ( .D(n4), .CK(clk), .RN(n2), .Q(Q[0]), .QN(n5) );
  OAI2BB2XLTS U2 ( .B0(n5), .B1(load), .A0N(load), .A1N(D[0]), .Y(n4) );
  INVX2TS U3 ( .A(rst), .Y(n2) );
endmodule


module RegisterAdd_W1_5 ( clk, rst, load, D, Q );
  input [0:0] D;
  output [0:0] Q;
  input clk, rst, load;
  wire   n2, n4, n5;

  DFFRX2TS Q_reg_0_ ( .D(n4), .CK(clk), .RN(n2), .Q(Q[0]), .QN(n5) );
  OAI2BB2XLTS U2 ( .B0(n5), .B1(load), .A0N(load), .A1N(D[0]), .Y(n4) );
  INVX2TS U3 ( .A(rst), .Y(n2) );
endmodule


module Exp_Operation_EW11 ( clk, rst, load_a_i, load_b_i, Data_A_i, Data_B_i, 
        Add_Subt_i, Data_Result_o, Overflow_flag_o, Underflow_flag_o );
  input [10:0] Data_A_i;
  input [10:0] Data_B_i;
  output [10:0] Data_Result_o;
  input clk, rst, load_a_i, load_b_i, Add_Subt_i;
  output Overflow_flag_o, Underflow_flag_o;
  wire   Overflow_flag, Underflow_flag;
  wire   [11:0] Data_S;

  add_sub_carry_out_W11 exp_add_subt ( .op_mode(Add_Subt_i), .Data_A(Data_A_i), 
        .Data_B(Data_B_i), .Data_S(Data_S) );
  Comparators_W_Exp12 array_comparators ( .exp(Data_S), .overflow(
        Overflow_flag), .underflow(Underflow_flag) );
  RegisterAdd_W11 exp_result ( .clk(clk), .rst(rst), .load(load_a_i), .D(
        Data_S[10:0]), .Q(Data_Result_o) );
  RegisterAdd_W1_8 Overflow ( .clk(clk), .rst(rst), .load(load_a_i), .D(
        Overflow_flag), .Q(Overflow_flag_o) );
  RegisterAdd_W1_5 Underflow ( .clk(clk), .rst(rst), .load(load_b_i), .D(
        Underflow_flag), .Q(Underflow_flag_o) );
endmodule


module Mux_3x1_W6 ( ctrl, D0, D1, D2, S );
  input [1:0] ctrl;
  input [5:0] D0;
  input [5:0] D1;
  input [5:0] D2;
  output [5:0] S;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9;

  NOR2XLTS U2 ( .A(ctrl[0]), .B(ctrl[1]), .Y(n1) );
  NOR2BX1TS U3 ( .AN(ctrl[1]), .B(ctrl[0]), .Y(n3) );
  NOR2BX1TS U4 ( .AN(ctrl[0]), .B(ctrl[1]), .Y(n4) );
  OAI2BB1X1TS U5 ( .A0N(D0[0]), .A1N(n1), .B0(n9), .Y(S[0]) );
  AOI22X1TS U6 ( .A0(D2[0]), .A1(n3), .B0(D1[0]), .B1(n4), .Y(n9) );
  OAI2BB1X1TS U7 ( .A0N(D0[4]), .A1N(n1), .B0(n5), .Y(S[4]) );
  AOI22X1TS U8 ( .A0(D2[4]), .A1(n3), .B0(D1[4]), .B1(n4), .Y(n5) );
  OAI2BB1X1TS U9 ( .A0N(D0[3]), .A1N(n1), .B0(n6), .Y(S[3]) );
  AOI22X1TS U10 ( .A0(D2[3]), .A1(n3), .B0(D1[3]), .B1(n4), .Y(n6) );
  OAI2BB1X1TS U11 ( .A0N(D0[1]), .A1N(n1), .B0(n8), .Y(S[1]) );
  AOI22X1TS U12 ( .A0(D2[1]), .A1(n3), .B0(D1[1]), .B1(n4), .Y(n8) );
  OAI2BB1X1TS U13 ( .A0N(D0[5]), .A1N(n1), .B0(n2), .Y(S[5]) );
  AOI22X1TS U14 ( .A0(D2[5]), .A1(n3), .B0(D1[5]), .B1(n4), .Y(n2) );
  OAI2BB1X1TS U15 ( .A0N(D0[2]), .A1N(n1), .B0(n7), .Y(S[2]) );
  AOI22X1TS U16 ( .A0(D2[2]), .A1(n3), .B0(D1[2]), .B1(n4), .Y(n7) );
endmodule


module Multiplexer_AC_W55_2 ( ctrl, D0, D1, S );
  input [54:0] D0;
  input [54:0] D1;
  output [54:0] S;
  input ctrl;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12;

  INVX2TS U1 ( .A(n10), .Y(n1) );
  INVX2TS U2 ( .A(n10), .Y(n2) );
  INVX2TS U3 ( .A(n11), .Y(n3) );
  INVX2TS U4 ( .A(n11), .Y(n4) );
  INVX2TS U5 ( .A(n11), .Y(n5) );
  CLKBUFX2TS U6 ( .A(n10), .Y(n7) );
  CLKBUFX2TS U7 ( .A(n10), .Y(n6) );
  CLKBUFX2TS U8 ( .A(n9), .Y(n8) );
  CLKBUFX2TS U9 ( .A(n12), .Y(n10) );
  CLKBUFX2TS U10 ( .A(n12), .Y(n11) );
  CLKBUFX2TS U11 ( .A(n12), .Y(n9) );
  INVX2TS U12 ( .A(ctrl), .Y(n12) );
  AO22X1TS U13 ( .A0(D1[26]), .A1(n4), .B0(D0[26]), .B1(n12), .Y(S[26]) );
  AO22X1TS U14 ( .A0(D1[28]), .A1(n4), .B0(D0[28]), .B1(n12), .Y(S[28]) );
  AO22X1TS U15 ( .A0(D1[25]), .A1(n4), .B0(D0[25]), .B1(n12), .Y(S[25]) );
  AO22X1TS U16 ( .A0(D1[29]), .A1(n4), .B0(D0[29]), .B1(n12), .Y(S[29]) );
  AO22X1TS U17 ( .A0(D1[24]), .A1(n4), .B0(D0[24]), .B1(n12), .Y(S[24]) );
  AO22X1TS U18 ( .A0(D1[30]), .A1(n4), .B0(D0[30]), .B1(n6), .Y(S[30]) );
  AO22X1TS U19 ( .A0(D1[23]), .A1(n4), .B0(D0[23]), .B1(n12), .Y(S[23]) );
  AO22X1TS U20 ( .A0(D1[31]), .A1(n4), .B0(D0[31]), .B1(n6), .Y(S[31]) );
  AO22X1TS U21 ( .A0(D1[32]), .A1(n3), .B0(D0[32]), .B1(n6), .Y(S[32]) );
  AO22X1TS U22 ( .A0(D1[22]), .A1(n5), .B0(D0[22]), .B1(n11), .Y(S[22]) );
  AO22X1TS U23 ( .A0(D1[33]), .A1(n3), .B0(D0[33]), .B1(n6), .Y(S[33]) );
  AO22X1TS U24 ( .A0(D1[21]), .A1(n5), .B0(D0[21]), .B1(n12), .Y(S[21]) );
  AO22X1TS U25 ( .A0(D1[34]), .A1(n3), .B0(D0[34]), .B1(n6), .Y(S[34]) );
  AO22X1TS U26 ( .A0(D1[20]), .A1(n5), .B0(D0[20]), .B1(n11), .Y(S[20]) );
  AO22X1TS U27 ( .A0(D1[35]), .A1(n3), .B0(D0[35]), .B1(n6), .Y(S[35]) );
  AO22X1TS U28 ( .A0(D1[19]), .A1(n5), .B0(D0[19]), .B1(n11), .Y(S[19]) );
  AO22X1TS U29 ( .A0(D1[36]), .A1(n3), .B0(D0[36]), .B1(n6), .Y(S[36]) );
  AO22X1TS U30 ( .A0(D1[18]), .A1(n5), .B0(D0[18]), .B1(n11), .Y(S[18]) );
  AO22X1TS U31 ( .A0(D1[37]), .A1(n3), .B0(D0[37]), .B1(n6), .Y(S[37]) );
  AO22X1TS U32 ( .A0(D1[17]), .A1(n5), .B0(D0[17]), .B1(n11), .Y(S[17]) );
  AO22X1TS U33 ( .A0(D1[38]), .A1(n3), .B0(D0[38]), .B1(n6), .Y(S[38]) );
  AO22X1TS U34 ( .A0(D1[16]), .A1(n5), .B0(D0[16]), .B1(n11), .Y(S[16]) );
  AO22X1TS U35 ( .A0(D1[39]), .A1(n3), .B0(D0[39]), .B1(n7), .Y(S[39]) );
  AO22X1TS U36 ( .A0(D1[15]), .A1(n5), .B0(D0[15]), .B1(n8), .Y(S[15]) );
  AO22X1TS U37 ( .A0(D1[40]), .A1(n3), .B0(D0[40]), .B1(n7), .Y(S[40]) );
  AO22X1TS U38 ( .A0(D1[14]), .A1(n5), .B0(D0[14]), .B1(n8), .Y(S[14]) );
  AO22X1TS U39 ( .A0(D1[41]), .A1(n2), .B0(D0[41]), .B1(n7), .Y(S[41]) );
  AO22X1TS U40 ( .A0(D1[13]), .A1(ctrl), .B0(D0[13]), .B1(n8), .Y(S[13]) );
  AO22X1TS U41 ( .A0(D1[42]), .A1(n2), .B0(D0[42]), .B1(n7), .Y(S[42]) );
  AO22X1TS U42 ( .A0(D1[12]), .A1(ctrl), .B0(D0[12]), .B1(n11), .Y(S[12]) );
  AO22X1TS U43 ( .A0(D1[43]), .A1(n2), .B0(D0[43]), .B1(n7), .Y(S[43]) );
  AO22X1TS U44 ( .A0(D1[11]), .A1(ctrl), .B0(D0[11]), .B1(n8), .Y(S[11]) );
  AO22X1TS U45 ( .A0(D1[44]), .A1(n2), .B0(D0[44]), .B1(n7), .Y(S[44]) );
  AO22X1TS U46 ( .A0(D1[10]), .A1(ctrl), .B0(D0[10]), .B1(n8), .Y(S[10]) );
  AO22X1TS U47 ( .A0(D1[45]), .A1(n2), .B0(D0[45]), .B1(n7), .Y(S[45]) );
  AO22X1TS U48 ( .A0(n1), .A1(D1[9]), .B0(D0[9]), .B1(n8), .Y(S[9]) );
  AO22X1TS U49 ( .A0(D1[46]), .A1(n2), .B0(D0[46]), .B1(n7), .Y(S[46]) );
  AO22X1TS U50 ( .A0(D1[8]), .A1(n1), .B0(D0[8]), .B1(n8), .Y(S[8]) );
  AO22X1TS U51 ( .A0(D1[47]), .A1(n2), .B0(D0[47]), .B1(n7), .Y(S[47]) );
  AO22X1TS U52 ( .A0(D1[7]), .A1(n1), .B0(D0[7]), .B1(n8), .Y(S[7]) );
  AO22X1TS U53 ( .A0(D1[48]), .A1(n2), .B0(D0[48]), .B1(n9), .Y(S[48]) );
  AO22X1TS U54 ( .A0(D1[6]), .A1(n1), .B0(D0[6]), .B1(n10), .Y(S[6]) );
  AO22X1TS U55 ( .A0(D1[49]), .A1(n2), .B0(D0[49]), .B1(n9), .Y(S[49]) );
  AO22X1TS U56 ( .A0(D1[5]), .A1(n1), .B0(D0[5]), .B1(n9), .Y(S[5]) );
  AO22X1TS U57 ( .A0(D1[50]), .A1(n1), .B0(D0[50]), .B1(n9), .Y(S[50]) );
  AO22X1TS U58 ( .A0(D1[4]), .A1(n2), .B0(D0[4]), .B1(n9), .Y(S[4]) );
  AO22X1TS U59 ( .A0(D1[51]), .A1(n1), .B0(D0[51]), .B1(n9), .Y(S[51]) );
  AO22X1TS U60 ( .A0(D1[3]), .A1(n3), .B0(D0[3]), .B1(n7), .Y(S[3]) );
  AO22X1TS U61 ( .A0(D1[52]), .A1(n1), .B0(D0[52]), .B1(n9), .Y(S[52]) );
  AO22X1TS U62 ( .A0(D1[2]), .A1(n4), .B0(D0[2]), .B1(n6), .Y(S[2]) );
  AO22X1TS U63 ( .A0(D1[53]), .A1(n1), .B0(D0[53]), .B1(n9), .Y(S[53]) );
  AO22X1TS U64 ( .A0(D1[54]), .A1(n1), .B0(D0[54]), .B1(n9), .Y(S[54]) );
  AO22X1TS U65 ( .A0(D1[27]), .A1(n4), .B0(D0[27]), .B1(n10), .Y(S[27]) );
  AO22X1TS U66 ( .A0(D1[1]), .A1(n5), .B0(D0[1]), .B1(n8), .Y(S[1]) );
  AO22X1TS U67 ( .A0(D1[0]), .A1(ctrl), .B0(D0[0]), .B1(n8), .Y(S[0]) );
endmodule


module Priority_Codec_64 ( Data_Dec_i, Data_Bin_o );
  input [54:0] Data_Dec_i;
  output [5:0] Data_Bin_o;
  wire   n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34,
         n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48,
         n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62,
         n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76,
         n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90,
         n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103,
         n104, n105, n106, n107, n108, n109, n110, n111, n112, n113, n114,
         n115, n116, n117, n118, n119, n1, n3, n4, n5, n6, n7, n8, n9, n10,
         n11, n12, n13, n14, n15, n16, n17, n18, n19, n20;

  NOR3X1TS U3 ( .A(n54), .B(Data_Dec_i[47]), .C(n9), .Y(n38) );
  NOR3BX1TS U4 ( .AN(n86), .B(Data_Dec_i[23]), .C(Data_Dec_i[24]), .Y(
        Data_Bin_o[5]) );
  NOR3X1TS U5 ( .A(Data_Dec_i[53]), .B(Data_Dec_i[54]), .C(n94), .Y(n53) );
  NOR3BX1TS U6 ( .AN(n93), .B(Data_Dec_i[39]), .C(Data_Dec_i[40]), .Y(n25) );
  NOR4XLTS U7 ( .A(Data_Dec_i[27]), .B(Data_Dec_i[28]), .C(Data_Dec_i[29]), 
        .D(Data_Dec_i[30]), .Y(n64) );
  NOR3BX1TS U8 ( .AN(n88), .B(Data_Dec_i[11]), .C(Data_Dec_i[12]), .Y(n75) );
  NOR3BX1TS U9 ( .AN(n75), .B(Data_Dec_i[10]), .C(Data_Dec_i[9]), .Y(n89) );
  NOR2X1TS U10 ( .A(Data_Dec_i[14]), .B(Data_Dec_i[13]), .Y(n88) );
  INVX2TS U11 ( .A(n25), .Y(n6) );
  INVX2TS U12 ( .A(n112), .Y(n4) );
  INVX2TS U13 ( .A(n53), .Y(n9) );
  INVX2TS U14 ( .A(n38), .Y(n8) );
  AND2X2TS U15 ( .A(n115), .B(Data_Bin_o[5]), .Y(n32) );
  INVX2TS U16 ( .A(Data_Bin_o[5]), .Y(n3) );
  NAND3X1TS U17 ( .A(n35), .B(n36), .C(n37), .Y(n33) );
  INVX2TS U18 ( .A(n70), .Y(n13) );
  NAND3X1TS U19 ( .A(n65), .B(n58), .C(n41), .Y(n110) );
  INVX2TS U20 ( .A(n69), .Y(n7) );
  NOR4BX1TS U21 ( .AN(n117), .B(Data_Dec_i[33]), .C(Data_Dec_i[34]), .D(
        Data_Dec_i[32]), .Y(n44) );
  NOR3BX1TS U22 ( .AN(n60), .B(n6), .C(Data_Dec_i[31]), .Y(n117) );
  NOR4XLTS U23 ( .A(n8), .B(n13), .C(Data_Dec_i[42]), .D(Data_Dec_i[43]), .Y(
        n105) );
  NOR2BX1TS U24 ( .AN(n105), .B(Data_Dec_i[41]), .Y(n93) );
  NAND4BX1TS U25 ( .AN(Data_Dec_i[4]), .B(n4), .C(n84), .D(n19), .Y(n52) );
  NAND3X1TS U26 ( .A(Data_Bin_o[5]), .B(n115), .C(n116), .Y(n112) );
  NOR3BX1TS U27 ( .AN(n89), .B(Data_Dec_i[8]), .C(Data_Dec_i[7]), .Y(n116) );
  NAND3BX1TS U28 ( .AN(Data_Dec_i[26]), .B(n44), .C(n64), .Y(n102) );
  NOR2X1TS U29 ( .A(n102), .B(Data_Dec_i[25]), .Y(n86) );
  AND4X1TS U30 ( .A(n106), .B(n107), .C(n108), .D(n109), .Y(n77) );
  NOR4BX1TS U31 ( .AN(n67), .B(n110), .C(n55), .D(n34), .Y(n109) );
  NOR3BX1TS U32 ( .AN(n37), .B(n27), .C(n111), .Y(n108) );
  NOR2BX1TS U33 ( .AN(n72), .B(n50), .Y(n106) );
  OR2X2TS U34 ( .A(Data_Dec_i[52]), .B(Data_Dec_i[51]), .Y(n94) );
  NOR4BBX1TS U35 ( .AN(n73), .BN(n35), .C(n80), .D(n81), .Y(n79) );
  NAND4X1TS U36 ( .A(n42), .B(n61), .C(n56), .D(n83), .Y(n80) );
  OAI31X1TS U37 ( .A0(n52), .A1(Data_Dec_i[2]), .A2(Data_Dec_i[1]), .B0(n48), 
        .Y(n81) );
  NAND3X1TS U38 ( .A(n4), .B(n84), .C(Data_Dec_i[4]), .Y(n83) );
  NOR4BBX1TS U39 ( .AN(Data_Dec_i[15]), .BN(n82), .C(Data_Dec_i[16]), .D(
        Data_Dec_i[17]), .Y(n50) );
  NOR4BX1TS U40 ( .AN(Data_Dec_i[20]), .B(Data_Dec_i[22]), .C(Data_Dec_i[21]), 
        .D(n3), .Y(n90) );
  NOR4BX1TS U41 ( .AN(n84), .B(Data_Dec_i[4]), .C(n112), .D(n19), .Y(n111) );
  NOR3X1TS U42 ( .A(Data_Dec_i[45]), .B(Data_Dec_i[46]), .C(Data_Dec_i[44]), 
        .Y(n70) );
  NAND3BX1TS U43 ( .AN(Data_Dec_i[24]), .B(n86), .C(Data_Dec_i[23]), .Y(n65)
         );
  NOR3X1TS U44 ( .A(n51), .B(Data_Dec_i[18]), .C(n3), .Y(n82) );
  NAND2BX1TS U45 ( .AN(n102), .B(Data_Dec_i[25]), .Y(n62) );
  NAND4BX1TS U46 ( .AN(Data_Dec_i[12]), .B(Data_Dec_i[11]), .C(n32), .D(n88), 
        .Y(n37) );
  NAND3BX1TS U47 ( .AN(Data_Dec_i[14]), .B(n32), .C(Data_Dec_i[13]), .Y(n36)
         );
  NAND4BX1TS U48 ( .AN(Data_Dec_i[10]), .B(Data_Dec_i[9]), .C(n32), .D(n75), 
        .Y(n74) );
  NAND4BX1TS U49 ( .AN(Data_Dec_i[8]), .B(Data_Dec_i[7]), .C(n32), .D(n89), 
        .Y(n72) );
  AND4X1TS U50 ( .A(n71), .B(n72), .C(n73), .D(n74), .Y(n28) );
  NAND3X1TS U51 ( .A(n32), .B(n75), .C(Data_Dec_i[10]), .Y(n71) );
  OR3X1TS U52 ( .A(Data_Dec_i[49]), .B(Data_Dec_i[50]), .C(Data_Dec_i[48]), 
        .Y(n54) );
  NAND3X1TS U53 ( .A(n32), .B(n88), .C(Data_Dec_i[12]), .Y(n35) );
  NAND4X1TS U54 ( .A(n56), .B(n57), .C(n58), .D(n59), .Y(n23) );
  AOI31X1TS U55 ( .A0(n25), .A1(n60), .A2(Data_Dec_i[34]), .B0(n39), .Y(n59)
         );
  NAND3X1TS U56 ( .A(n61), .B(n62), .C(n63), .Y(n39) );
  AOI31X1TS U57 ( .A0(n64), .A1(n44), .A2(Data_Dec_i[26]), .B0(n5), .Y(n63) );
  INVX2TS U58 ( .A(n65), .Y(n5) );
  NAND3X1TS U59 ( .A(n32), .B(n89), .C(Data_Dec_i[8]), .Y(n73) );
  NAND3BX1TS U60 ( .AN(Data_Dec_i[17]), .B(n82), .C(Data_Dec_i[16]), .Y(n48)
         );
  NOR4BBX1TS U61 ( .AN(n74), .BN(n36), .C(n99), .D(n100), .Y(n98) );
  NAND4X1TS U62 ( .A(n43), .B(n62), .C(n57), .D(n101), .Y(n99) );
  OAI31X1TS U63 ( .A0(n20), .A1(Data_Dec_i[2]), .A2(n52), .B0(n47), .Y(n100)
         );
  NAND3BX1TS U64 ( .AN(Data_Dec_i[6]), .B(n4), .C(Data_Dec_i[5]), .Y(n101) );
  OAI31X1TS U65 ( .A0(n18), .A1(n51), .A2(n3), .B0(n52), .Y(n49) );
  INVX2TS U66 ( .A(Data_Dec_i[18]), .Y(n18) );
  NOR2X1TS U67 ( .A(Data_Dec_i[22]), .B(n3), .Y(n103) );
  NAND2X1TS U68 ( .A(Data_Dec_i[17]), .B(n82), .Y(n47) );
  NOR3BX1TS U69 ( .AN(n60), .B(Data_Dec_i[34]), .C(n6), .Y(n85) );
  NOR2BX1TS U70 ( .AN(n44), .B(Data_Dec_i[30]), .Y(n87) );
  NAND4BX1TS U71 ( .AN(Data_Dec_i[28]), .B(Data_Dec_i[27]), .C(n87), .D(n17), 
        .Y(n41) );
  NAND4BX1TS U72 ( .AN(Data_Dec_i[32]), .B(Data_Dec_i[31]), .C(n85), .D(n16), 
        .Y(n58) );
  NAND3X1TS U73 ( .A(n85), .B(n16), .C(Data_Dec_i[32]), .Y(n56) );
  NAND3X1TS U74 ( .A(n87), .B(n17), .C(Data_Dec_i[28]), .Y(n42) );
  NAND2X1TS U75 ( .A(Data_Dec_i[33]), .B(n85), .Y(n57) );
  NAND2X1TS U76 ( .A(Data_Dec_i[29]), .B(n87), .Y(n43) );
  NAND2X1TS U77 ( .A(Data_Dec_i[24]), .B(n86), .Y(n61) );
  OR3X1TS U78 ( .A(Data_Dec_i[37]), .B(Data_Dec_i[38]), .C(Data_Dec_i[36]), 
        .Y(n26) );
  NAND4X1TS U79 ( .A(n40), .B(n41), .C(n42), .D(n43), .Y(n24) );
  NAND2X1TS U80 ( .A(Data_Dec_i[30]), .B(n44), .Y(n40) );
  NOR2X1TS U81 ( .A(n26), .B(Data_Dec_i[35]), .Y(n60) );
  NOR3BX1TS U82 ( .AN(n118), .B(n51), .C(Data_Dec_i[15]), .Y(n115) );
  NOR3X1TS U83 ( .A(Data_Dec_i[16]), .B(Data_Dec_i[18]), .C(Data_Dec_i[17]), 
        .Y(n118) );
  NOR4BX1TS U84 ( .AN(Data_Dec_i[36]), .B(Data_Dec_i[38]), .C(Data_Dec_i[37]), 
        .D(n6), .Y(n91) );
  NOR3BX1TS U85 ( .AN(Data_Dec_i[35]), .B(n6), .C(n26), .Y(n27) );
  NAND2BX1TS U86 ( .AN(Data_Dec_i[19]), .B(n113), .Y(n51) );
  NOR3X1TS U87 ( .A(Data_Dec_i[21]), .B(Data_Dec_i[22]), .C(Data_Dec_i[20]), 
        .Y(n113) );
  NAND3BX1TS U88 ( .AN(Data_Dec_i[40]), .B(n93), .C(Data_Dec_i[39]), .Y(n67)
         );
  OAI33XLTS U89 ( .A0(n14), .A1(Data_Dec_i[46]), .A2(n8), .B0(n15), .B1(
        Data_Dec_i[38]), .B2(n6), .Y(n104) );
  INVX2TS U90 ( .A(Data_Dec_i[45]), .Y(n14) );
  INVX2TS U91 ( .A(Data_Dec_i[37]), .Y(n15) );
  NOR4BX1TS U92 ( .AN(Data_Dec_i[44]), .B(Data_Dec_i[46]), .C(Data_Dec_i[45]), 
        .D(n8), .Y(n92) );
  NOR3BX1TS U93 ( .AN(Data_Dec_i[47]), .B(n9), .C(n54), .Y(n55) );
  NOR4BX1TS U94 ( .AN(Data_Dec_i[48]), .B(Data_Dec_i[50]), .C(Data_Dec_i[49]), 
        .D(n9), .Y(n95) );
  NOR2X1TS U95 ( .A(Data_Dec_i[6]), .B(Data_Dec_i[5]), .Y(n84) );
  AND4X1TS U96 ( .A(n66), .B(n67), .C(n68), .D(n69), .Y(n29) );
  NAND4BX1TS U97 ( .AN(Data_Dec_i[43]), .B(Data_Dec_i[42]), .C(n38), .D(n70), 
        .Y(n66) );
  NAND2X1TS U98 ( .A(Data_Dec_i[41]), .B(n105), .Y(n69) );
  AND3X2TS U99 ( .A(Data_Dec_i[43]), .B(n38), .C(n70), .Y(n34) );
  NAND2X1TS U100 ( .A(Data_Dec_i[40]), .B(n93), .Y(n68) );
  INVX2TS U101 ( .A(Data_Dec_i[29]), .Y(n17) );
  INVX2TS U102 ( .A(Data_Dec_i[33]), .Y(n16) );
  OAI21X1TS U103 ( .A0(Data_Dec_i[52]), .A1(n11), .B0(n10), .Y(n119) );
  INVX2TS U104 ( .A(Data_Dec_i[51]), .Y(n11) );
  INVX2TS U105 ( .A(Data_Dec_i[53]), .Y(n10) );
  INVX2TS U106 ( .A(Data_Dec_i[54]), .Y(n1) );
  INVX2TS U107 ( .A(Data_Dec_i[1]), .Y(n20) );
  INVX2TS U108 ( .A(Data_Dec_i[50]), .Y(n12) );
  AOI31X1TS U109 ( .A0(Data_Bin_o[5]), .A1(n113), .A2(Data_Dec_i[19]), .B0(
        n114), .Y(n107) );
  NOR4XLTS U110 ( .A(Data_Dec_i[2]), .B(Data_Dec_i[1]), .C(Data_Dec_i[0]), .D(
        n52), .Y(n114) );
  NAND4X1TS U111 ( .A(n96), .B(n77), .C(n97), .D(n98), .Y(Data_Bin_o[0]) );
  AOI32X1TS U112 ( .A0(n53), .A1(n12), .A2(Data_Dec_i[49]), .B0(n119), .B1(n1), 
        .Y(n96) );
  AOI211X1TS U113 ( .A0(n103), .A1(Data_Dec_i[21]), .B0(n104), .C0(n7), .Y(n97) );
  NAND4X1TS U114 ( .A(n76), .B(n77), .C(n78), .D(n79), .Y(Data_Bin_o[1]) );
  AOI31X1TS U115 ( .A0(n10), .A1(n1), .A2(n94), .B0(n95), .Y(n76) );
  NOR4BX1TS U116 ( .AN(n68), .B(n90), .C(n91), .D(n92), .Y(n78) );
  NAND4X1TS U117 ( .A(n28), .B(n29), .C(n45), .D(n46), .Y(Data_Bin_o[2]) );
  AOI211X1TS U118 ( .A0(n53), .A1(n54), .B0(n23), .C0(n55), .Y(n45) );
  NOR4BBX1TS U119 ( .AN(n47), .BN(n48), .C(n49), .D(n50), .Y(n46) );
  NAND4X1TS U120 ( .A(n28), .B(n29), .C(n30), .D(n31), .Y(Data_Bin_o[3]) );
  AOI211X1TS U121 ( .A0(n38), .A1(n13), .B0(n24), .C0(n39), .Y(n30) );
  AOI211X1TS U122 ( .A0(Data_Dec_i[14]), .A1(n32), .B0(n33), .C0(n34), .Y(n31)
         );
  INVX2TS U123 ( .A(n21), .Y(Data_Bin_o[4]) );
  NOR3BX1TS U124 ( .AN(n22), .B(n23), .C(n24), .Y(n21) );
  AOI211X1TS U125 ( .A0(n25), .A1(n26), .B0(n4), .C0(n27), .Y(n22) );
  INVX2TS U126 ( .A(Data_Dec_i[3]), .Y(n19) );
endmodule


module RegisterAdd_W6 ( clk, rst, load, D, Q );
  input [5:0] D;
  output [5:0] Q;
  input clk, rst, load;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n13, n12, n14;

  DFFRX2TS Q_reg_5_ ( .D(n13), .CK(clk), .RN(n14), .Q(Q[5]), .QN(n6) );
  DFFRX2TS Q_reg_4_ ( .D(n11), .CK(clk), .RN(n14), .Q(Q[4]), .QN(n5) );
  DFFRX2TS Q_reg_3_ ( .D(n10), .CK(clk), .RN(n14), .Q(Q[3]), .QN(n4) );
  DFFRX2TS Q_reg_2_ ( .D(n9), .CK(clk), .RN(n14), .Q(Q[2]), .QN(n3) );
  DFFRX2TS Q_reg_1_ ( .D(n8), .CK(clk), .RN(n14), .Q(Q[1]), .QN(n2) );
  DFFRX2TS Q_reg_0_ ( .D(n7), .CK(clk), .RN(n14), .Q(Q[0]), .QN(n1) );
  CLKBUFX2TS U2 ( .A(load), .Y(n12) );
  OAI2BB2XLTS U3 ( .B0(n1), .B1(load), .A0N(load), .A1N(D[0]), .Y(n7) );
  OAI2BB2XLTS U4 ( .B0(n2), .B1(load), .A0N(D[1]), .A1N(load), .Y(n8) );
  OAI2BB2XLTS U5 ( .B0(n3), .B1(load), .A0N(D[2]), .A1N(load), .Y(n9) );
  OAI2BB2XLTS U6 ( .B0(n4), .B1(n12), .A0N(D[3]), .A1N(load), .Y(n10) );
  OAI2BB2XLTS U7 ( .B0(n5), .B1(n12), .A0N(D[4]), .A1N(load), .Y(n11) );
  OAI2BB2XLTS U8 ( .B0(n6), .B1(n12), .A0N(D[5]), .A1N(load), .Y(n13) );
  INVX2TS U9 ( .A(rst), .Y(n14) );
endmodule


module LZD_SWR55_EWR6 ( clk, rst, load_i, Add_subt_result_i, Shift_Value_o );
  input [54:0] Add_subt_result_i;
  output [5:0] Shift_Value_o;
  input clk, rst, load_i;

  wire   [5:0] Codec_to_Reg;

  Priority_Codec_64 LZD_DOUBLEBLK_Codec_64 ( .Data_Dec_i(Add_subt_result_i), 
        .Data_Bin_o(Codec_to_Reg) );
  RegisterAdd_W6 Output_Reg ( .clk(clk), .rst(rst), .load(load_i), .D(
        Codec_to_Reg), .Q(Shift_Value_o) );
endmodule


module Mux_3x1_W1_1 ( ctrl, D0, D1, D2, S );
  input [1:0] ctrl;
  input [0:0] D0;
  input [0:0] D1;
  input [0:0] D2;
  output [0:0] S;
  wire   n3, n4, n1, n2;

  AOI22X1TS U2 ( .A0(D0[0]), .A1(n2), .B0(ctrl[0]), .B1(D1[0]), .Y(n3) );
  OAI22X1TS U3 ( .A0(ctrl[1]), .A1(n3), .B0(n1), .B1(n4), .Y(S[0]) );
  INVX2TS U4 ( .A(ctrl[1]), .Y(n1) );
  NAND2X1TS U5 ( .A(D2[0]), .B(n2), .Y(n4) );
  INVX2TS U6 ( .A(ctrl[0]), .Y(n2) );
endmodule


module Multiplexer_AC_W11_0 ( ctrl, D0, D1, S );
  input [10:0] D0;
  input [10:0] D1;
  output [10:0] S;
  input ctrl;
  wire   n1, n2, n3;

  INVX2TS U1 ( .A(n2), .Y(n1) );
  CLKBUFX2TS U2 ( .A(n3), .Y(n2) );
  INVX2TS U3 ( .A(ctrl), .Y(n3) );
  AO22X1TS U4 ( .A0(D1[0]), .A1(ctrl), .B0(D0[0]), .B1(n2), .Y(S[0]) );
  AO22X1TS U5 ( .A0(D1[1]), .A1(n1), .B0(D0[1]), .B1(n2), .Y(S[1]) );
  AO22X1TS U6 ( .A0(D1[2]), .A1(n1), .B0(D0[2]), .B1(n2), .Y(S[2]) );
  AO22X1TS U7 ( .A0(D1[3]), .A1(n1), .B0(D0[3]), .B1(n2), .Y(S[3]) );
  AO22X1TS U8 ( .A0(D1[4]), .A1(n1), .B0(D0[4]), .B1(n2), .Y(S[4]) );
  AO22X1TS U9 ( .A0(D1[5]), .A1(n1), .B0(D0[5]), .B1(n2), .Y(S[5]) );
  AO22X1TS U10 ( .A0(D1[6]), .A1(n1), .B0(D0[6]), .B1(n2), .Y(S[6]) );
  AO22X1TS U11 ( .A0(D1[7]), .A1(n1), .B0(D0[7]), .B1(n2), .Y(S[7]) );
  AO22X1TS U12 ( .A0(D1[8]), .A1(n1), .B0(D0[8]), .B1(n3), .Y(S[8]) );
  AO22X1TS U13 ( .A0(n1), .A1(D1[9]), .B0(D0[9]), .B1(n3), .Y(S[9]) );
  AO22X1TS U14 ( .A0(D1[10]), .A1(n1), .B0(D0[10]), .B1(n2), .Y(S[10]) );
endmodule


module Multiplexer_AC_W52 ( ctrl, D0, D1, S );
  input [51:0] D0;
  input [51:0] D1;
  output [51:0] S;
  input ctrl;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12;

  AO22XLTS U1 ( .A0(D1[15]), .A1(n5), .B0(D0[15]), .B1(n12), .Y(S[15]) );
  CLKBUFX2TS U2 ( .A(n12), .Y(n6) );
  AO22XLTS U3 ( .A0(D1[2]), .A1(n3), .B0(D0[2]), .B1(n8), .Y(S[2]) );
  INVX2TS U4 ( .A(n12), .Y(n1) );
  INVX2TS U5 ( .A(n12), .Y(n3) );
  INVX2TS U6 ( .A(n12), .Y(n2) );
  CLKBUFX2TS U7 ( .A(n11), .Y(n7) );
  CLKBUFX2TS U8 ( .A(n11), .Y(n8) );
  CLKBUFX2TS U9 ( .A(n11), .Y(n9) );
  CLKBUFX2TS U10 ( .A(n11), .Y(n10) );
  INVX2TS U11 ( .A(n6), .Y(n5) );
  INVX2TS U12 ( .A(n6), .Y(n4) );
  CLKBUFX2TS U13 ( .A(n12), .Y(n11) );
  INVX2TS U14 ( .A(ctrl), .Y(n12) );
  AO22X1TS U15 ( .A0(D1[0]), .A1(ctrl), .B0(D0[0]), .B1(n6), .Y(S[0]) );
  AO22X1TS U16 ( .A0(D1[1]), .A1(n5), .B0(D0[1]), .B1(n12), .Y(S[1]) );
  AO22X1TS U17 ( .A0(D1[3]), .A1(n2), .B0(D0[3]), .B1(n9), .Y(S[3]) );
  AO22X1TS U18 ( .A0(D1[4]), .A1(n1), .B0(D0[4]), .B1(n10), .Y(S[4]) );
  AO22X1TS U19 ( .A0(D1[5]), .A1(n1), .B0(D0[5]), .B1(n10), .Y(S[5]) );
  AO22X1TS U20 ( .A0(D1[6]), .A1(n1), .B0(D0[6]), .B1(n10), .Y(S[6]) );
  AO22X1TS U21 ( .A0(D1[7]), .A1(n1), .B0(D0[7]), .B1(n10), .Y(S[7]) );
  AO22X1TS U22 ( .A0(D1[8]), .A1(n1), .B0(D0[8]), .B1(n10), .Y(S[8]) );
  AO22X1TS U23 ( .A0(n1), .A1(D1[9]), .B0(D0[9]), .B1(n10), .Y(S[9]) );
  AO22X1TS U24 ( .A0(D1[10]), .A1(ctrl), .B0(D0[10]), .B1(n11), .Y(S[10]) );
  AO22X1TS U25 ( .A0(D1[11]), .A1(n5), .B0(D0[11]), .B1(n12), .Y(S[11]) );
  AO22X1TS U26 ( .A0(D1[12]), .A1(n5), .B0(D0[12]), .B1(n6), .Y(S[12]) );
  AO22X1TS U27 ( .A0(D1[13]), .A1(n5), .B0(D0[13]), .B1(n12), .Y(S[13]) );
  AO22X1TS U28 ( .A0(D1[14]), .A1(n5), .B0(D0[14]), .B1(n11), .Y(S[14]) );
  AO22X1TS U29 ( .A0(D1[16]), .A1(n5), .B0(D0[16]), .B1(n6), .Y(S[16]) );
  AO22X1TS U30 ( .A0(D1[17]), .A1(n5), .B0(D0[17]), .B1(n12), .Y(S[17]) );
  AO22X1TS U31 ( .A0(D1[18]), .A1(n5), .B0(D0[18]), .B1(n11), .Y(S[18]) );
  AO22X1TS U32 ( .A0(D1[19]), .A1(n5), .B0(D0[19]), .B1(n6), .Y(S[19]) );
  AO22X1TS U33 ( .A0(D1[20]), .A1(n4), .B0(D0[20]), .B1(n7), .Y(S[20]) );
  AO22X1TS U34 ( .A0(D1[21]), .A1(n4), .B0(D0[21]), .B1(n7), .Y(S[21]) );
  AO22X1TS U35 ( .A0(D1[22]), .A1(n4), .B0(D0[22]), .B1(n7), .Y(S[22]) );
  AO22X1TS U36 ( .A0(D1[23]), .A1(n4), .B0(D0[23]), .B1(n7), .Y(S[23]) );
  AO22X1TS U37 ( .A0(D1[24]), .A1(n4), .B0(D0[24]), .B1(n7), .Y(S[24]) );
  AO22X1TS U38 ( .A0(D1[25]), .A1(n4), .B0(D0[25]), .B1(n7), .Y(S[25]) );
  AO22X1TS U39 ( .A0(D1[26]), .A1(n4), .B0(D0[26]), .B1(n7), .Y(S[26]) );
  AO22X1TS U40 ( .A0(D1[27]), .A1(n4), .B0(D0[27]), .B1(n7), .Y(S[27]) );
  AO22X1TS U41 ( .A0(D1[28]), .A1(n4), .B0(D0[28]), .B1(n7), .Y(S[28]) );
  AO22X1TS U42 ( .A0(D1[29]), .A1(n4), .B0(D0[29]), .B1(n7), .Y(S[29]) );
  AO22X1TS U43 ( .A0(D1[30]), .A1(n3), .B0(D0[30]), .B1(n8), .Y(S[30]) );
  AO22X1TS U44 ( .A0(D1[31]), .A1(n3), .B0(D0[31]), .B1(n8), .Y(S[31]) );
  AO22X1TS U45 ( .A0(D1[32]), .A1(n3), .B0(D0[32]), .B1(n8), .Y(S[32]) );
  AO22X1TS U46 ( .A0(D1[33]), .A1(n3), .B0(D0[33]), .B1(n8), .Y(S[33]) );
  AO22X1TS U47 ( .A0(D1[34]), .A1(n3), .B0(D0[34]), .B1(n8), .Y(S[34]) );
  AO22X1TS U48 ( .A0(D1[35]), .A1(n3), .B0(D0[35]), .B1(n8), .Y(S[35]) );
  AO22X1TS U49 ( .A0(D1[36]), .A1(n3), .B0(D0[36]), .B1(n8), .Y(S[36]) );
  AO22X1TS U50 ( .A0(D1[37]), .A1(n3), .B0(D0[37]), .B1(n8), .Y(S[37]) );
  AO22X1TS U51 ( .A0(D1[38]), .A1(n3), .B0(D0[38]), .B1(n8), .Y(S[38]) );
  AO22X1TS U52 ( .A0(D1[39]), .A1(n2), .B0(D0[39]), .B1(n9), .Y(S[39]) );
  AO22X1TS U53 ( .A0(D1[40]), .A1(n2), .B0(D0[40]), .B1(n9), .Y(S[40]) );
  AO22X1TS U54 ( .A0(D1[41]), .A1(n2), .B0(D0[41]), .B1(n9), .Y(S[41]) );
  AO22X1TS U55 ( .A0(D1[42]), .A1(n2), .B0(D0[42]), .B1(n9), .Y(S[42]) );
  AO22X1TS U56 ( .A0(D1[43]), .A1(n2), .B0(D0[43]), .B1(n9), .Y(S[43]) );
  AO22X1TS U57 ( .A0(D1[44]), .A1(n2), .B0(D0[44]), .B1(n9), .Y(S[44]) );
  AO22X1TS U58 ( .A0(D1[45]), .A1(n2), .B0(D0[45]), .B1(n9), .Y(S[45]) );
  AO22X1TS U59 ( .A0(D1[46]), .A1(n2), .B0(D0[46]), .B1(n9), .Y(S[46]) );
  AO22X1TS U60 ( .A0(D1[47]), .A1(n2), .B0(D0[47]), .B1(n9), .Y(S[47]) );
  AO22X1TS U61 ( .A0(D1[48]), .A1(n1), .B0(D0[48]), .B1(n10), .Y(S[48]) );
  AO22X1TS U62 ( .A0(D1[49]), .A1(n1), .B0(D0[49]), .B1(n10), .Y(S[49]) );
  AO22X1TS U63 ( .A0(D1[50]), .A1(n1), .B0(D0[50]), .B1(n10), .Y(S[50]) );
  AO22X1TS U64 ( .A0(D1[51]), .A1(n1), .B0(D0[51]), .B1(n10), .Y(S[51]) );
endmodule


module RegisterAdd_W64_0 ( clk, rst, load, D, Q );
  input [63:0] D;
  output [63:0] Q;
  input clk, rst, load;
  wire   n128, n130, n131, n132, n133, n134, n135, n136, n137, n138, n139,
         n140, n141, n142, n143, n144, n145, n146, n147, n148, n149, n150,
         n151, n152, n153, n154, n155, n156, n157, n158, n159, n160, n161,
         n162, n163, n164, n165, n166, n167, n168, n169, n170, n171, n172,
         n173, n174, n175, n176, n177, n178, n179, n180, n181, n182, n183,
         n184, n185, n186, n187, n188, n189, n190, n191, n192, n193, n194,
         n195, n196, n197, n198, n199, n200, n201, n202, n203, n204, n205,
         n206, n207, n208, n209, n210, n211, n212, n213, n214, n215, n216,
         n217, n218, n219, n220, n221, n222, n223, n224, n225, n226, n227,
         n228, n229, n230, n231, n232, n233, n234, n235, n236, n237, n238,
         n239, n240, n241, n242, n243, n244, n245, n246, n247, n248, n249,
         n250, n251, n252, n253, n254, n255, n256, n257, n258, n259, n260,
         n261, n262, n263, n264, n265, n266, n267, n268, n269, n270, n271,
         n272, n273, n274, n275, n276, n277;

  DFFRX2TS Q_reg_63_ ( .D(n150), .CK(clk), .RN(n149), .Q(Q[63]), .QN(n214) );
  DFFRX2TS Q_reg_62_ ( .D(n151), .CK(clk), .RN(n149), .Q(Q[62]), .QN(n215) );
  DFFRX2TS Q_reg_61_ ( .D(n152), .CK(clk), .RN(n149), .Q(Q[61]), .QN(n216) );
  DFFRX2TS Q_reg_60_ ( .D(n153), .CK(clk), .RN(n149), .Q(Q[60]), .QN(n217) );
  DFFRX2TS Q_reg_59_ ( .D(n154), .CK(clk), .RN(n134), .Q(Q[59]), .QN(n218) );
  DFFRX2TS Q_reg_58_ ( .D(n155), .CK(clk), .RN(n134), .Q(Q[58]), .QN(n219) );
  DFFRX2TS Q_reg_57_ ( .D(n156), .CK(clk), .RN(n134), .Q(Q[57]), .QN(n220) );
  DFFRX2TS Q_reg_56_ ( .D(n157), .CK(clk), .RN(n134), .Q(Q[56]), .QN(n221) );
  DFFRX2TS Q_reg_55_ ( .D(n158), .CK(clk), .RN(n134), .Q(Q[55]), .QN(n222) );
  DFFRX2TS Q_reg_54_ ( .D(n159), .CK(clk), .RN(n134), .Q(Q[54]), .QN(n223) );
  DFFRX2TS Q_reg_53_ ( .D(n160), .CK(clk), .RN(n134), .Q(Q[53]), .QN(n224) );
  DFFRX2TS Q_reg_52_ ( .D(n161), .CK(clk), .RN(n134), .Q(Q[52]), .QN(n225) );
  DFFRX2TS Q_reg_51_ ( .D(n162), .CK(clk), .RN(n134), .Q(Q[51]), .QN(n226) );
  DFFRX2TS Q_reg_50_ ( .D(n163), .CK(clk), .RN(n134), .Q(Q[50]), .QN(n227) );
  DFFRX2TS Q_reg_49_ ( .D(n164), .CK(clk), .RN(n133), .Q(Q[49]), .QN(n228) );
  DFFRX2TS Q_reg_48_ ( .D(n165), .CK(clk), .RN(n133), .Q(Q[48]), .QN(n229) );
  DFFRX2TS Q_reg_47_ ( .D(n166), .CK(clk), .RN(n133), .Q(Q[47]), .QN(n230) );
  DFFRX2TS Q_reg_46_ ( .D(n167), .CK(clk), .RN(n133), .Q(Q[46]), .QN(n231) );
  DFFRX2TS Q_reg_45_ ( .D(n168), .CK(clk), .RN(n133), .Q(Q[45]), .QN(n232) );
  DFFRX2TS Q_reg_44_ ( .D(n169), .CK(clk), .RN(n133), .Q(Q[44]), .QN(n233) );
  DFFRX2TS Q_reg_43_ ( .D(n170), .CK(clk), .RN(n133), .Q(Q[43]), .QN(n234) );
  DFFRX2TS Q_reg_42_ ( .D(n171), .CK(clk), .RN(n133), .Q(Q[42]), .QN(n235) );
  DFFRX2TS Q_reg_41_ ( .D(n172), .CK(clk), .RN(n133), .Q(Q[41]), .QN(n236) );
  DFFRX2TS Q_reg_40_ ( .D(n173), .CK(clk), .RN(n133), .Q(Q[40]), .QN(n237) );
  DFFRX2TS Q_reg_39_ ( .D(n174), .CK(clk), .RN(n132), .Q(Q[39]), .QN(n238) );
  DFFRX2TS Q_reg_38_ ( .D(n175), .CK(clk), .RN(n132), .Q(Q[38]), .QN(n239) );
  DFFRX2TS Q_reg_37_ ( .D(n176), .CK(clk), .RN(n132), .Q(Q[37]), .QN(n240) );
  DFFRX2TS Q_reg_36_ ( .D(n177), .CK(clk), .RN(n132), .Q(Q[36]), .QN(n241) );
  DFFRX2TS Q_reg_35_ ( .D(n178), .CK(clk), .RN(n132), .Q(Q[35]), .QN(n242) );
  DFFRX2TS Q_reg_34_ ( .D(n179), .CK(clk), .RN(n132), .Q(Q[34]), .QN(n243) );
  DFFRX2TS Q_reg_33_ ( .D(n180), .CK(clk), .RN(n132), .Q(Q[33]), .QN(n244) );
  DFFRX2TS Q_reg_32_ ( .D(n181), .CK(clk), .RN(n132), .Q(Q[32]), .QN(n245) );
  DFFRX2TS Q_reg_31_ ( .D(n182), .CK(clk), .RN(n132), .Q(Q[31]), .QN(n246) );
  DFFRX2TS Q_reg_30_ ( .D(n183), .CK(clk), .RN(n132), .Q(Q[30]), .QN(n247) );
  DFFRX2TS Q_reg_29_ ( .D(n184), .CK(clk), .RN(n131), .Q(Q[29]), .QN(n248) );
  DFFRX2TS Q_reg_28_ ( .D(n185), .CK(clk), .RN(n131), .Q(Q[28]), .QN(n249) );
  DFFRX2TS Q_reg_27_ ( .D(n186), .CK(clk), .RN(n131), .Q(Q[27]), .QN(n250) );
  DFFRX2TS Q_reg_26_ ( .D(n187), .CK(clk), .RN(n131), .Q(Q[26]), .QN(n251) );
  DFFRX2TS Q_reg_25_ ( .D(n188), .CK(clk), .RN(n131), .Q(Q[25]), .QN(n252) );
  DFFRX2TS Q_reg_24_ ( .D(n189), .CK(clk), .RN(n131), .Q(Q[24]), .QN(n253) );
  DFFRX2TS Q_reg_23_ ( .D(n190), .CK(clk), .RN(n131), .Q(Q[23]), .QN(n254) );
  DFFRX2TS Q_reg_22_ ( .D(n191), .CK(clk), .RN(n131), .Q(Q[22]), .QN(n255) );
  DFFRX2TS Q_reg_21_ ( .D(n192), .CK(clk), .RN(n131), .Q(Q[21]), .QN(n256) );
  DFFRX2TS Q_reg_20_ ( .D(n193), .CK(clk), .RN(n131), .Q(Q[20]), .QN(n257) );
  DFFRX2TS Q_reg_19_ ( .D(n194), .CK(clk), .RN(n130), .Q(Q[19]), .QN(n258) );
  DFFRX2TS Q_reg_18_ ( .D(n195), .CK(clk), .RN(n130), .Q(Q[18]), .QN(n259) );
  DFFRX2TS Q_reg_17_ ( .D(n196), .CK(clk), .RN(n130), .Q(Q[17]), .QN(n260) );
  DFFRX2TS Q_reg_16_ ( .D(n197), .CK(clk), .RN(n130), .Q(Q[16]), .QN(n261) );
  DFFRX2TS Q_reg_15_ ( .D(n198), .CK(clk), .RN(n130), .Q(Q[15]), .QN(n262) );
  DFFRX2TS Q_reg_14_ ( .D(n199), .CK(clk), .RN(n130), .Q(Q[14]), .QN(n263) );
  DFFRX2TS Q_reg_13_ ( .D(n200), .CK(clk), .RN(n130), .Q(Q[13]), .QN(n264) );
  DFFRX2TS Q_reg_12_ ( .D(n201), .CK(clk), .RN(n130), .Q(Q[12]), .QN(n265) );
  DFFRX2TS Q_reg_11_ ( .D(n202), .CK(clk), .RN(n130), .Q(Q[11]), .QN(n266) );
  DFFRX2TS Q_reg_10_ ( .D(n203), .CK(clk), .RN(n130), .Q(Q[10]), .QN(n267) );
  DFFRX2TS Q_reg_9_ ( .D(n204), .CK(clk), .RN(n128), .Q(Q[9]), .QN(n268) );
  DFFRX2TS Q_reg_8_ ( .D(n205), .CK(clk), .RN(n128), .Q(Q[8]), .QN(n269) );
  DFFRX2TS Q_reg_7_ ( .D(n206), .CK(clk), .RN(n128), .Q(Q[7]), .QN(n270) );
  DFFRX2TS Q_reg_6_ ( .D(n207), .CK(clk), .RN(n128), .Q(Q[6]), .QN(n271) );
  DFFRX2TS Q_reg_5_ ( .D(n208), .CK(clk), .RN(n128), .Q(Q[5]), .QN(n272) );
  DFFRX2TS Q_reg_4_ ( .D(n209), .CK(clk), .RN(n128), .Q(Q[4]), .QN(n273) );
  DFFRX2TS Q_reg_3_ ( .D(n210), .CK(clk), .RN(n128), .Q(Q[3]), .QN(n274) );
  DFFRX2TS Q_reg_2_ ( .D(n211), .CK(clk), .RN(n128), .Q(Q[2]), .QN(n275) );
  DFFRX2TS Q_reg_1_ ( .D(n212), .CK(clk), .RN(n128), .Q(Q[1]), .QN(n276) );
  DFFRX2TS Q_reg_0_ ( .D(n213), .CK(clk), .RN(n128), .Q(Q[0]), .QN(n277) );
  CLKBUFX2TS U2 ( .A(n145), .Y(n141) );
  CLKBUFX2TS U3 ( .A(n146), .Y(n140) );
  CLKBUFX2TS U4 ( .A(n147), .Y(n138) );
  CLKBUFX2TS U5 ( .A(n146), .Y(n139) );
  CLKBUFX2TS U6 ( .A(n145), .Y(n142) );
  CLKBUFX2TS U7 ( .A(n144), .Y(n143) );
  CLKBUFX2TS U8 ( .A(n135), .Y(n145) );
  CLKBUFX2TS U9 ( .A(n135), .Y(n147) );
  CLKBUFX2TS U10 ( .A(load), .Y(n144) );
  CLKBUFX2TS U11 ( .A(n135), .Y(n146) );
  CLKBUFX2TS U12 ( .A(load), .Y(n135) );
  CLKBUFX2TS U13 ( .A(n148), .Y(n137) );
  CLKBUFX2TS U14 ( .A(n136), .Y(n148) );
  CLKBUFX2TS U15 ( .A(load), .Y(n136) );
  CLKBUFX2TS U16 ( .A(n149), .Y(n128) );
  CLKBUFX2TS U17 ( .A(n149), .Y(n130) );
  CLKBUFX2TS U18 ( .A(n149), .Y(n131) );
  CLKBUFX2TS U19 ( .A(n149), .Y(n132) );
  CLKBUFX2TS U20 ( .A(n149), .Y(n133) );
  CLKBUFX2TS U21 ( .A(n149), .Y(n134) );
  OAI2BB2XLTS U22 ( .B0(n277), .B1(n142), .A0N(n144), .A1N(D[0]), .Y(n213) );
  OAI2BB2XLTS U23 ( .B0(n276), .B1(n141), .A0N(D[1]), .A1N(n144), .Y(n212) );
  OAI2BB2XLTS U24 ( .B0(n275), .B1(n142), .A0N(D[2]), .A1N(n144), .Y(n211) );
  OAI2BB2XLTS U25 ( .B0(n274), .B1(n141), .A0N(D[3]), .A1N(n144), .Y(n210) );
  OAI2BB2XLTS U26 ( .B0(n273), .B1(n141), .A0N(D[4]), .A1N(n145), .Y(n209) );
  OAI2BB2XLTS U27 ( .B0(n272), .B1(n142), .A0N(D[5]), .A1N(n143), .Y(n208) );
  OAI2BB2XLTS U28 ( .B0(n271), .B1(n142), .A0N(D[6]), .A1N(n148), .Y(n207) );
  OAI2BB2XLTS U29 ( .B0(n270), .B1(n141), .A0N(D[7]), .A1N(n145), .Y(n206) );
  OAI2BB2XLTS U30 ( .B0(n269), .B1(n141), .A0N(D[8]), .A1N(n136), .Y(n205) );
  OAI2BB2XLTS U31 ( .B0(n268), .B1(n140), .A0N(D[9]), .A1N(n143), .Y(n204) );
  OAI2BB2XLTS U32 ( .B0(n267), .B1(n140), .A0N(D[10]), .A1N(n136), .Y(n203) );
  OAI2BB2XLTS U33 ( .B0(n266), .B1(n141), .A0N(D[11]), .A1N(n136), .Y(n202) );
  OAI2BB2XLTS U34 ( .B0(n265), .B1(n141), .A0N(D[12]), .A1N(n144), .Y(n201) );
  OAI2BB2XLTS U35 ( .B0(n264), .B1(n140), .A0N(D[13]), .A1N(load), .Y(n200) );
  OAI2BB2XLTS U36 ( .B0(n263), .B1(n141), .A0N(D[14]), .A1N(n147), .Y(n199) );
  OAI2BB2XLTS U37 ( .B0(n262), .B1(n141), .A0N(D[15]), .A1N(n144), .Y(n198) );
  OAI2BB2XLTS U38 ( .B0(n261), .B1(n140), .A0N(D[16]), .A1N(n135), .Y(n197) );
  OAI2BB2XLTS U39 ( .B0(n260), .B1(n140), .A0N(D[17]), .A1N(n135), .Y(n196) );
  OAI2BB2XLTS U40 ( .B0(n259), .B1(n141), .A0N(D[18]), .A1N(n148), .Y(n195) );
  OAI2BB2XLTS U41 ( .B0(n258), .B1(n140), .A0N(D[19]), .A1N(n136), .Y(n194) );
  OAI2BB2XLTS U42 ( .B0(n257), .B1(n140), .A0N(D[20]), .A1N(n142), .Y(n193) );
  OAI2BB2XLTS U43 ( .B0(n256), .B1(n140), .A0N(D[21]), .A1N(n135), .Y(n192) );
  OAI2BB2XLTS U44 ( .B0(n255), .B1(n140), .A0N(D[22]), .A1N(n142), .Y(n191) );
  OAI2BB2XLTS U45 ( .B0(n254), .B1(n139), .A0N(D[23]), .A1N(n135), .Y(n190) );
  OAI2BB2XLTS U46 ( .B0(n253), .B1(n139), .A0N(D[24]), .A1N(n142), .Y(n189) );
  OAI2BB2XLTS U47 ( .B0(n252), .B1(n139), .A0N(D[25]), .A1N(n136), .Y(n188) );
  OAI2BB2XLTS U48 ( .B0(n251), .B1(n139), .A0N(D[26]), .A1N(n148), .Y(n187) );
  OAI2BB2XLTS U49 ( .B0(n250), .B1(n139), .A0N(D[27]), .A1N(n142), .Y(n186) );
  OAI2BB2XLTS U50 ( .B0(n249), .B1(n139), .A0N(D[28]), .A1N(n142), .Y(n185) );
  OAI2BB2XLTS U51 ( .B0(n248), .B1(n139), .A0N(D[29]), .A1N(n135), .Y(n184) );
  OAI2BB2XLTS U52 ( .B0(n247), .B1(n139), .A0N(D[30]), .A1N(n142), .Y(n183) );
  OAI2BB2XLTS U53 ( .B0(n246), .B1(n140), .A0N(D[31]), .A1N(n136), .Y(n182) );
  OAI2BB2XLTS U54 ( .B0(n245), .B1(n139), .A0N(D[32]), .A1N(n144), .Y(n181) );
  OAI2BB2XLTS U55 ( .B0(n244), .B1(n146), .A0N(D[33]), .A1N(n136), .Y(n180) );
  OAI2BB2XLTS U56 ( .B0(n243), .B1(n147), .A0N(D[34]), .A1N(n136), .Y(n179) );
  OAI2BB2XLTS U57 ( .B0(n242), .B1(n146), .A0N(D[35]), .A1N(load), .Y(n178) );
  OAI2BB2XLTS U58 ( .B0(n241), .B1(n146), .A0N(D[36]), .A1N(n135), .Y(n177) );
  OAI2BB2XLTS U59 ( .B0(n240), .B1(n145), .A0N(D[37]), .A1N(load), .Y(n176) );
  OAI2BB2XLTS U60 ( .B0(n239), .B1(n147), .A0N(D[38]), .A1N(n144), .Y(n175) );
  OAI2BB2XLTS U61 ( .B0(n238), .B1(n148), .A0N(D[39]), .A1N(n146), .Y(n174) );
  OAI2BB2XLTS U62 ( .B0(n237), .B1(n145), .A0N(D[40]), .A1N(n148), .Y(n173) );
  OAI2BB2XLTS U63 ( .B0(n236), .B1(n147), .A0N(D[41]), .A1N(n148), .Y(n172) );
  OAI2BB2XLTS U64 ( .B0(n235), .B1(n147), .A0N(D[42]), .A1N(n135), .Y(n171) );
  OAI2BB2XLTS U65 ( .B0(n234), .B1(n138), .A0N(D[43]), .A1N(n136), .Y(n170) );
  OAI2BB2XLTS U66 ( .B0(n233), .B1(n138), .A0N(D[44]), .A1N(n143), .Y(n169) );
  OAI2BB2XLTS U67 ( .B0(n232), .B1(n138), .A0N(D[45]), .A1N(n147), .Y(n168) );
  OAI2BB2XLTS U68 ( .B0(n231), .B1(n138), .A0N(D[46]), .A1N(n143), .Y(n167) );
  OAI2BB2XLTS U69 ( .B0(n230), .B1(n138), .A0N(D[47]), .A1N(n143), .Y(n166) );
  OAI2BB2XLTS U70 ( .B0(n229), .B1(n138), .A0N(D[48]), .A1N(n143), .Y(n165) );
  OAI2BB2XLTS U71 ( .B0(n228), .B1(n138), .A0N(D[49]), .A1N(n143), .Y(n164) );
  OAI2BB2XLTS U72 ( .B0(n227), .B1(n138), .A0N(D[50]), .A1N(n143), .Y(n163) );
  OAI2BB2XLTS U73 ( .B0(n226), .B1(n138), .A0N(D[51]), .A1N(n143), .Y(n162) );
  OAI2BB2XLTS U74 ( .B0(n225), .B1(n138), .A0N(D[52]), .A1N(n143), .Y(n161) );
  OAI2BB2XLTS U75 ( .B0(n224), .B1(n137), .A0N(D[53]), .A1N(n147), .Y(n160) );
  OAI2BB2XLTS U76 ( .B0(n223), .B1(n137), .A0N(D[54]), .A1N(n148), .Y(n159) );
  OAI2BB2XLTS U77 ( .B0(n222), .B1(n137), .A0N(D[55]), .A1N(n145), .Y(n158) );
  OAI2BB2XLTS U78 ( .B0(n221), .B1(n137), .A0N(D[56]), .A1N(n147), .Y(n157) );
  OAI2BB2XLTS U79 ( .B0(n220), .B1(n137), .A0N(D[57]), .A1N(n148), .Y(n156) );
  OAI2BB2XLTS U80 ( .B0(n219), .B1(n137), .A0N(D[58]), .A1N(n145), .Y(n155) );
  OAI2BB2XLTS U81 ( .B0(n218), .B1(n137), .A0N(D[59]), .A1N(n144), .Y(n154) );
  OAI2BB2XLTS U82 ( .B0(n217), .B1(n137), .A0N(D[60]), .A1N(n146), .Y(n153) );
  OAI2BB2XLTS U83 ( .B0(n216), .B1(n137), .A0N(D[61]), .A1N(n146), .Y(n152) );
  OAI2BB2XLTS U84 ( .B0(n215), .B1(n137), .A0N(D[62]), .A1N(n147), .Y(n151) );
  OAI2BB2XLTS U85 ( .B0(n214), .B1(n139), .A0N(D[63]), .A1N(n146), .Y(n150) );
  INVX2TS U86 ( .A(rst), .Y(n149) );
endmodule


module Tenth_Phase_W64_EW11_SW52 ( clk, rst, load_i, sel_a_i, sel_b_i, sign_i, 
        exp_ieee_i, sgf_ieee_i, final_result_ieee_o );
  input [10:0] exp_ieee_i;
  input [51:0] sgf_ieee_i;
  output [63:0] final_result_ieee_o;
  input clk, rst, load_i, sel_a_i, sel_b_i, sign_i;
  wire   overunder, Sign_S_mux;
  wire   [10:0] Exp_S_mux;
  wire   [51:0] Sgf_S_mux;

  Mux_3x1_W1_1 Sign_Mux ( .ctrl({sel_a_i, sel_b_i}), .D0(sign_i), .D1(1'b1), 
        .D2(1'b0), .S(Sign_S_mux) );
  Multiplexer_AC_W11_0 Exp_Mux ( .ctrl(overunder), .D0(exp_ieee_i), .D1({1'b1, 
        1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1}), .S(
        Exp_S_mux) );
  Multiplexer_AC_W52 Sgf_Mux ( .ctrl(overunder), .D0(sgf_ieee_i), .D1({1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0}), .S(Sgf_S_mux) );
  RegisterAdd_W64_0 Final_Result_IEEE ( .clk(clk), .rst(rst), .load(load_i), 
        .D({Sign_S_mux, Exp_S_mux, Sgf_S_mux}), .Q(final_result_ieee_o) );
  OR2X2TS U3 ( .A(sel_a_i), .B(sel_b_i), .Y(overunder) );
endmodule


module Multiplexer_AC_W1_159 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_158 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_157 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_156 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_155 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_154 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_153 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_152 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_151 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_150 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_149 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_148 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_147 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_146 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_145 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_144 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_143 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_142 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_141 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_140 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_139 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_138 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_137 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_136 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_135 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_134 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_133 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_132 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_131 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_130 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_129 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_128 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_127 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_126 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_125 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_124 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_123 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_122 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_121 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_120 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_119 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_118 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_117 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_116 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_115 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_114 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_113 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_112 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_111 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_110 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_109 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_108 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_107 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_106 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Rotate_Mux_Array_SWR55_1 ( Data_i, select_i, Data_o );
  input [54:0] Data_i;
  output [54:0] Data_o;
  input select_i;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11;
  assign Data_o[27] = Data_i[27];

  Multiplexer_AC_W1_159 MUX_ARRAY_0__MUX_ARRAY12_rotate_mux ( .ctrl(n2), .D0(
        Data_i[0]), .D1(Data_i[54]), .S(Data_o[0]) );
  Multiplexer_AC_W1_158 MUX_ARRAY_1__MUX_ARRAY12_rotate_mux ( .ctrl(n2), .D0(
        Data_i[1]), .D1(Data_i[53]), .S(Data_o[1]) );
  Multiplexer_AC_W1_157 MUX_ARRAY_2__MUX_ARRAY12_rotate_mux ( .ctrl(n2), .D0(
        Data_i[2]), .D1(Data_i[52]), .S(Data_o[2]) );
  Multiplexer_AC_W1_156 MUX_ARRAY_3__MUX_ARRAY12_rotate_mux ( .ctrl(n2), .D0(
        Data_i[3]), .D1(Data_i[51]), .S(Data_o[3]) );
  Multiplexer_AC_W1_155 MUX_ARRAY_4__MUX_ARRAY12_rotate_mux ( .ctrl(n2), .D0(
        Data_i[4]), .D1(Data_i[50]), .S(Data_o[4]) );
  Multiplexer_AC_W1_154 MUX_ARRAY_5__MUX_ARRAY12_rotate_mux ( .ctrl(n3), .D0(
        Data_i[5]), .D1(Data_i[49]), .S(Data_o[5]) );
  Multiplexer_AC_W1_153 MUX_ARRAY_6__MUX_ARRAY12_rotate_mux ( .ctrl(n3), .D0(
        Data_i[6]), .D1(Data_i[48]), .S(Data_o[6]) );
  Multiplexer_AC_W1_152 MUX_ARRAY_7__MUX_ARRAY12_rotate_mux ( .ctrl(n3), .D0(
        Data_i[7]), .D1(Data_i[47]), .S(Data_o[7]) );
  Multiplexer_AC_W1_151 MUX_ARRAY_8__MUX_ARRAY12_rotate_mux ( .ctrl(n3), .D0(
        Data_i[8]), .D1(Data_i[46]), .S(Data_o[8]) );
  Multiplexer_AC_W1_150 MUX_ARRAY_9__MUX_ARRAY12_rotate_mux ( .ctrl(n3), .D0(
        Data_i[9]), .D1(Data_i[45]), .S(Data_o[9]) );
  Multiplexer_AC_W1_149 MUX_ARRAY_10__MUX_ARRAY12_rotate_mux ( .ctrl(n4), .D0(
        Data_i[10]), .D1(Data_i[44]), .S(Data_o[10]) );
  Multiplexer_AC_W1_148 MUX_ARRAY_11__MUX_ARRAY12_rotate_mux ( .ctrl(n4), .D0(
        Data_i[11]), .D1(Data_i[43]), .S(Data_o[11]) );
  Multiplexer_AC_W1_147 MUX_ARRAY_12__MUX_ARRAY12_rotate_mux ( .ctrl(n4), .D0(
        Data_i[12]), .D1(Data_i[42]), .S(Data_o[12]) );
  Multiplexer_AC_W1_146 MUX_ARRAY_13__MUX_ARRAY12_rotate_mux ( .ctrl(n4), .D0(
        Data_i[13]), .D1(Data_i[41]), .S(Data_o[13]) );
  Multiplexer_AC_W1_145 MUX_ARRAY_14__MUX_ARRAY12_rotate_mux ( .ctrl(n4), .D0(
        Data_i[14]), .D1(Data_i[40]), .S(Data_o[14]) );
  Multiplexer_AC_W1_144 MUX_ARRAY_15__MUX_ARRAY12_rotate_mux ( .ctrl(n5), .D0(
        Data_i[15]), .D1(Data_i[39]), .S(Data_o[15]) );
  Multiplexer_AC_W1_143 MUX_ARRAY_16__MUX_ARRAY12_rotate_mux ( .ctrl(n5), .D0(
        Data_i[16]), .D1(Data_i[38]), .S(Data_o[16]) );
  Multiplexer_AC_W1_142 MUX_ARRAY_17__MUX_ARRAY12_rotate_mux ( .ctrl(n5), .D0(
        Data_i[17]), .D1(Data_i[37]), .S(Data_o[17]) );
  Multiplexer_AC_W1_141 MUX_ARRAY_18__MUX_ARRAY12_rotate_mux ( .ctrl(n5), .D0(
        Data_i[18]), .D1(Data_i[36]), .S(Data_o[18]) );
  Multiplexer_AC_W1_140 MUX_ARRAY_19__MUX_ARRAY12_rotate_mux ( .ctrl(n5), .D0(
        Data_i[19]), .D1(Data_i[35]), .S(Data_o[19]) );
  Multiplexer_AC_W1_139 MUX_ARRAY_20__MUX_ARRAY12_rotate_mux ( .ctrl(n6), .D0(
        Data_i[20]), .D1(Data_i[34]), .S(Data_o[20]) );
  Multiplexer_AC_W1_138 MUX_ARRAY_21__MUX_ARRAY12_rotate_mux ( .ctrl(n6), .D0(
        Data_i[21]), .D1(Data_i[33]), .S(Data_o[21]) );
  Multiplexer_AC_W1_137 MUX_ARRAY_22__MUX_ARRAY12_rotate_mux ( .ctrl(n6), .D0(
        Data_i[22]), .D1(Data_i[32]), .S(Data_o[22]) );
  Multiplexer_AC_W1_136 MUX_ARRAY_23__MUX_ARRAY12_rotate_mux ( .ctrl(n6), .D0(
        Data_i[23]), .D1(Data_i[31]), .S(Data_o[23]) );
  Multiplexer_AC_W1_135 MUX_ARRAY_24__MUX_ARRAY12_rotate_mux ( .ctrl(n6), .D0(
        Data_i[24]), .D1(Data_i[30]), .S(Data_o[24]) );
  Multiplexer_AC_W1_134 MUX_ARRAY_25__MUX_ARRAY12_rotate_mux ( .ctrl(n9), .D0(
        Data_i[25]), .D1(Data_i[29]), .S(Data_o[25]) );
  Multiplexer_AC_W1_133 MUX_ARRAY_26__MUX_ARRAY12_rotate_mux ( .ctrl(n10), 
        .D0(Data_i[26]), .D1(Data_i[28]), .S(Data_o[26]) );
  Multiplexer_AC_W1_132 MUX_ARRAY_28__MUX_ARRAY12_rotate_mux ( .ctrl(n10), 
        .D0(Data_i[28]), .D1(Data_i[26]), .S(Data_o[28]) );
  Multiplexer_AC_W1_131 MUX_ARRAY_29__MUX_ARRAY12_rotate_mux ( .ctrl(n11), 
        .D0(Data_i[29]), .D1(Data_i[25]), .S(Data_o[29]) );
  Multiplexer_AC_W1_130 MUX_ARRAY_30__MUX_ARRAY12_rotate_mux ( .ctrl(n11), 
        .D0(Data_i[30]), .D1(Data_i[24]), .S(Data_o[30]) );
  Multiplexer_AC_W1_129 MUX_ARRAY_31__MUX_ARRAY12_rotate_mux ( .ctrl(select_i), 
        .D0(Data_i[31]), .D1(Data_i[23]), .S(Data_o[31]) );
  Multiplexer_AC_W1_128 MUX_ARRAY_32__MUX_ARRAY12_rotate_mux ( .ctrl(select_i), 
        .D0(Data_i[32]), .D1(Data_i[22]), .S(Data_o[32]) );
  Multiplexer_AC_W1_127 MUX_ARRAY_33__MUX_ARRAY12_rotate_mux ( .ctrl(n1), .D0(
        Data_i[33]), .D1(Data_i[21]), .S(Data_o[33]) );
  Multiplexer_AC_W1_126 MUX_ARRAY_34__MUX_ARRAY12_rotate_mux ( .ctrl(n9), .D0(
        Data_i[34]), .D1(Data_i[20]), .S(Data_o[34]) );
  Multiplexer_AC_W1_125 MUX_ARRAY_35__MUX_ARRAY12_rotate_mux ( .ctrl(n8), .D0(
        Data_i[35]), .D1(Data_i[19]), .S(Data_o[35]) );
  Multiplexer_AC_W1_124 MUX_ARRAY_36__MUX_ARRAY12_rotate_mux ( .ctrl(n9), .D0(
        Data_i[36]), .D1(Data_i[18]), .S(Data_o[36]) );
  Multiplexer_AC_W1_123 MUX_ARRAY_37__MUX_ARRAY12_rotate_mux ( .ctrl(n10), 
        .D0(Data_i[37]), .D1(Data_i[17]), .S(Data_o[37]) );
  Multiplexer_AC_W1_122 MUX_ARRAY_38__MUX_ARRAY12_rotate_mux ( .ctrl(n9), .D0(
        Data_i[38]), .D1(Data_i[16]), .S(Data_o[38]) );
  Multiplexer_AC_W1_121 MUX_ARRAY_39__MUX_ARRAY12_rotate_mux ( .ctrl(n11), 
        .D0(Data_i[39]), .D1(Data_i[15]), .S(Data_o[39]) );
  Multiplexer_AC_W1_120 MUX_ARRAY_40__MUX_ARRAY12_rotate_mux ( .ctrl(select_i), 
        .D0(Data_i[40]), .D1(Data_i[14]), .S(Data_o[40]) );
  Multiplexer_AC_W1_119 MUX_ARRAY_41__MUX_ARRAY12_rotate_mux ( .ctrl(n7), .D0(
        Data_i[41]), .D1(Data_i[13]), .S(Data_o[41]) );
  Multiplexer_AC_W1_118 MUX_ARRAY_42__MUX_ARRAY12_rotate_mux ( .ctrl(n7), .D0(
        Data_i[42]), .D1(Data_i[12]), .S(Data_o[42]) );
  Multiplexer_AC_W1_117 MUX_ARRAY_43__MUX_ARRAY12_rotate_mux ( .ctrl(n7), .D0(
        Data_i[43]), .D1(Data_i[11]), .S(Data_o[43]) );
  Multiplexer_AC_W1_116 MUX_ARRAY_44__MUX_ARRAY12_rotate_mux ( .ctrl(n7), .D0(
        Data_i[44]), .D1(Data_i[10]), .S(Data_o[44]) );
  Multiplexer_AC_W1_115 MUX_ARRAY_45__MUX_ARRAY12_rotate_mux ( .ctrl(n7), .D0(
        Data_i[45]), .D1(Data_i[9]), .S(Data_o[45]) );
  Multiplexer_AC_W1_114 MUX_ARRAY_46__MUX_ARRAY12_rotate_mux ( .ctrl(select_i), 
        .D0(Data_i[46]), .D1(Data_i[8]), .S(Data_o[46]) );
  Multiplexer_AC_W1_113 MUX_ARRAY_47__MUX_ARRAY12_rotate_mux ( .ctrl(n1), .D0(
        Data_i[47]), .D1(Data_i[7]), .S(Data_o[47]) );
  Multiplexer_AC_W1_112 MUX_ARRAY_48__MUX_ARRAY12_rotate_mux ( .ctrl(n1), .D0(
        Data_i[48]), .D1(Data_i[6]), .S(Data_o[48]) );
  Multiplexer_AC_W1_111 MUX_ARRAY_49__MUX_ARRAY12_rotate_mux ( .ctrl(n11), 
        .D0(Data_i[49]), .D1(Data_i[5]), .S(Data_o[49]) );
  Multiplexer_AC_W1_110 MUX_ARRAY_50__MUX_ARRAY12_rotate_mux ( .ctrl(n1), .D0(
        Data_i[50]), .D1(Data_i[4]), .S(Data_o[50]) );
  Multiplexer_AC_W1_109 MUX_ARRAY_51__MUX_ARRAY12_rotate_mux ( .ctrl(n8), .D0(
        Data_i[51]), .D1(Data_i[3]), .S(Data_o[51]) );
  Multiplexer_AC_W1_108 MUX_ARRAY_52__MUX_ARRAY12_rotate_mux ( .ctrl(n8), .D0(
        Data_i[52]), .D1(Data_i[2]), .S(Data_o[52]) );
  Multiplexer_AC_W1_107 MUX_ARRAY_53__MUX_ARRAY12_rotate_mux ( .ctrl(n8), .D0(
        Data_i[53]), .D1(Data_i[1]), .S(Data_o[53]) );
  Multiplexer_AC_W1_106 MUX_ARRAY_54__MUX_ARRAY12_rotate_mux ( .ctrl(n8), .D0(
        Data_i[54]), .D1(Data_i[0]), .S(Data_o[54]) );
  CLKBUFX2TS U1 ( .A(n10), .Y(n6) );
  CLKBUFX2TS U2 ( .A(n9), .Y(n7) );
  CLKBUFX2TS U3 ( .A(n10), .Y(n3) );
  CLKBUFX2TS U4 ( .A(n11), .Y(n4) );
  CLKBUFX2TS U5 ( .A(n10), .Y(n5) );
  CLKBUFX2TS U6 ( .A(n9), .Y(n8) );
  CLKBUFX2TS U7 ( .A(n11), .Y(n2) );
  CLKBUFX2TS U8 ( .A(n1), .Y(n11) );
  CLKBUFX2TS U9 ( .A(n1), .Y(n10) );
  CLKBUFX2TS U10 ( .A(n10), .Y(n9) );
  CLKBUFX2TS U11 ( .A(select_i), .Y(n1) );
endmodule


module shift_mux_array_SWR55_LEVEL0 ( Data_i, select_i, bit_shift_i, Data_o );
  input [54:0] Data_i;
  output [54:0] Data_o;
  input select_i, bit_shift_i;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12;

  INVX2TS U1 ( .A(n12), .Y(n4) );
  INVX2TS U2 ( .A(select_i), .Y(n5) );
  INVX2TS U3 ( .A(select_i), .Y(n6) );
  INVX2TS U4 ( .A(n11), .Y(n3) );
  INVX2TS U5 ( .A(n11), .Y(n2) );
  INVX2TS U6 ( .A(n11), .Y(n1) );
  AO22X1TS U7 ( .A0(n8), .A1(Data_i[6]), .B0(n6), .B1(Data_i[5]), .Y(Data_o[5]) );
  AO22X1TS U8 ( .A0(n8), .A1(Data_i[5]), .B0(n5), .B1(Data_i[4]), .Y(Data_o[4]) );
  AO22X1TS U9 ( .A0(n8), .A1(Data_i[7]), .B0(n6), .B1(Data_i[6]), .Y(Data_o[6]) );
  AO22X1TS U10 ( .A0(n8), .A1(Data_i[8]), .B0(n6), .B1(Data_i[7]), .Y(
        Data_o[7]) );
  AO22X1TS U11 ( .A0(n7), .A1(Data_i[18]), .B0(n6), .B1(Data_i[17]), .Y(
        Data_o[17]) );
  AO22X1TS U12 ( .A0(n4), .A1(Data_i[20]), .B0(n11), .B1(Data_i[21]), .Y(
        Data_o[20]) );
  AO22X1TS U13 ( .A0(n4), .A1(Data_i[21]), .B0(select_i), .B1(Data_i[22]), .Y(
        Data_o[21]) );
  AO22X1TS U14 ( .A0(n11), .A1(Data_i[11]), .B0(n5), .B1(Data_i[10]), .Y(
        Data_o[10]) );
  AO22X1TS U15 ( .A0(n7), .A1(Data_i[13]), .B0(n5), .B1(Data_i[12]), .Y(
        Data_o[12]) );
  AO22X1TS U16 ( .A0(n7), .A1(Data_i[14]), .B0(n5), .B1(Data_i[13]), .Y(
        Data_o[13]) );
  AO22X1TS U17 ( .A0(n7), .A1(Data_i[19]), .B0(n5), .B1(Data_i[18]), .Y(
        Data_o[18]) );
  AO22X1TS U18 ( .A0(n7), .A1(Data_i[17]), .B0(n5), .B1(Data_i[16]), .Y(
        Data_o[16]) );
  AO22X1TS U19 ( .A0(n7), .A1(Data_i[15]), .B0(n5), .B1(Data_i[14]), .Y(
        Data_o[14]) );
  AO22X1TS U20 ( .A0(n4), .A1(Data_i[19]), .B0(n8), .B1(Data_i[20]), .Y(
        Data_o[19]) );
  AO22X1TS U21 ( .A0(n7), .A1(Data_i[16]), .B0(n5), .B1(Data_i[15]), .Y(
        Data_o[15]) );
  AO22X1TS U22 ( .A0(n8), .A1(Data_i[3]), .B0(n4), .B1(Data_i[2]), .Y(
        Data_o[2]) );
  AO22X1TS U23 ( .A0(n8), .A1(Data_i[4]), .B0(n4), .B1(Data_i[3]), .Y(
        Data_o[3]) );
  AO22X1TS U24 ( .A0(n7), .A1(Data_i[9]), .B0(n6), .B1(Data_i[8]), .Y(
        Data_o[8]) );
  AO22X1TS U25 ( .A0(Data_i[10]), .A1(n8), .B0(n4), .B1(Data_i[9]), .Y(
        Data_o[9]) );
  AO22X1TS U26 ( .A0(n7), .A1(Data_i[12]), .B0(n5), .B1(Data_i[11]), .Y(
        Data_o[11]) );
  AO22X1TS U27 ( .A0(n4), .A1(Data_i[22]), .B0(select_i), .B1(Data_i[23]), .Y(
        Data_o[22]) );
  AO22X1TS U28 ( .A0(n4), .A1(Data_i[23]), .B0(select_i), .B1(Data_i[24]), .Y(
        Data_o[23]) );
  AO22X1TS U29 ( .A0(n3), .A1(Data_i[24]), .B0(n12), .B1(Data_i[25]), .Y(
        Data_o[24]) );
  AO22X1TS U30 ( .A0(n4), .A1(Data_i[25]), .B0(n12), .B1(Data_i[26]), .Y(
        Data_o[25]) );
  AO22X1TS U31 ( .A0(n3), .A1(Data_i[28]), .B0(n12), .B1(Data_i[29]), .Y(
        Data_o[28]) );
  AO22X1TS U32 ( .A0(n3), .A1(Data_i[29]), .B0(n12), .B1(Data_i[30]), .Y(
        Data_o[29]) );
  AO22X1TS U33 ( .A0(n3), .A1(Data_i[30]), .B0(select_i), .B1(Data_i[31]), .Y(
        Data_o[30]) );
  AO22X1TS U34 ( .A0(n3), .A1(Data_i[31]), .B0(select_i), .B1(Data_i[32]), .Y(
        Data_o[31]) );
  AO22X1TS U35 ( .A0(n3), .A1(Data_i[32]), .B0(n11), .B1(Data_i[33]), .Y(
        Data_o[32]) );
  AO22X1TS U36 ( .A0(n3), .A1(Data_i[33]), .B0(n10), .B1(Data_i[34]), .Y(
        Data_o[33]) );
  AO22X1TS U37 ( .A0(n3), .A1(Data_i[34]), .B0(n10), .B1(Data_i[35]), .Y(
        Data_o[34]) );
  AO22X1TS U38 ( .A0(n2), .A1(Data_i[35]), .B0(n10), .B1(Data_i[36]), .Y(
        Data_o[35]) );
  AO22X1TS U39 ( .A0(n2), .A1(Data_i[36]), .B0(n10), .B1(Data_i[37]), .Y(
        Data_o[36]) );
  AO22X1TS U40 ( .A0(n2), .A1(Data_i[37]), .B0(n10), .B1(Data_i[38]), .Y(
        Data_o[37]) );
  AO22X1TS U41 ( .A0(n2), .A1(Data_i[38]), .B0(n10), .B1(Data_i[39]), .Y(
        Data_o[38]) );
  AO22X1TS U42 ( .A0(n2), .A1(Data_i[39]), .B0(n10), .B1(Data_i[40]), .Y(
        Data_o[39]) );
  AO22X1TS U43 ( .A0(n2), .A1(Data_i[40]), .B0(n10), .B1(Data_i[41]), .Y(
        Data_o[40]) );
  AO22X1TS U44 ( .A0(n2), .A1(Data_i[41]), .B0(n9), .B1(Data_i[42]), .Y(
        Data_o[41]) );
  AO22X1TS U45 ( .A0(n2), .A1(Data_i[42]), .B0(n9), .B1(Data_i[43]), .Y(
        Data_o[42]) );
  AO22X1TS U46 ( .A0(n2), .A1(Data_i[43]), .B0(n9), .B1(Data_i[44]), .Y(
        Data_o[43]) );
  AO22X1TS U47 ( .A0(n2), .A1(Data_i[44]), .B0(n9), .B1(Data_i[45]), .Y(
        Data_o[44]) );
  AO22X1TS U48 ( .A0(n1), .A1(Data_i[45]), .B0(n9), .B1(Data_i[46]), .Y(
        Data_o[45]) );
  AO22X1TS U49 ( .A0(n1), .A1(Data_i[46]), .B0(n10), .B1(Data_i[47]), .Y(
        Data_o[46]) );
  AO22X1TS U50 ( .A0(n1), .A1(Data_i[47]), .B0(n9), .B1(Data_i[48]), .Y(
        Data_o[47]) );
  AO22X1TS U51 ( .A0(n1), .A1(Data_i[48]), .B0(n9), .B1(Data_i[49]), .Y(
        Data_o[48]) );
  AO22X1TS U52 ( .A0(n1), .A1(Data_i[49]), .B0(n9), .B1(Data_i[50]), .Y(
        Data_o[49]) );
  AO22X1TS U53 ( .A0(n1), .A1(Data_i[51]), .B0(n10), .B1(Data_i[52]), .Y(
        Data_o[51]) );
  AO22X1TS U54 ( .A0(n1), .A1(Data_i[52]), .B0(n9), .B1(Data_i[53]), .Y(
        Data_o[52]) );
  AO22X1TS U55 ( .A0(n1), .A1(Data_i[53]), .B0(n8), .B1(Data_i[54]), .Y(
        Data_o[53]) );
  AO22X1TS U56 ( .A0(n1), .A1(Data_i[50]), .B0(n9), .B1(Data_i[51]), .Y(
        Data_o[50]) );
  AO22X1TS U57 ( .A0(n1), .A1(Data_i[54]), .B0(bit_shift_i), .B1(n8), .Y(
        Data_o[54]) );
  CLKBUFX2TS U58 ( .A(n12), .Y(n7) );
  CLKBUFX2TS U59 ( .A(n12), .Y(n8) );
  CLKBUFX2TS U60 ( .A(n11), .Y(n10) );
  CLKBUFX2TS U61 ( .A(n11), .Y(n9) );
  AO22X1TS U62 ( .A0(n3), .A1(Data_i[27]), .B0(n11), .B1(Data_i[28]), .Y(
        Data_o[27]) );
  AO22X1TS U63 ( .A0(n3), .A1(Data_i[26]), .B0(n11), .B1(Data_i[27]), .Y(
        Data_o[26]) );
  CLKBUFX2TS U64 ( .A(select_i), .Y(n11) );
  CLKBUFX2TS U65 ( .A(select_i), .Y(n12) );
  AO22X1TS U66 ( .A0(n7), .A1(Data_i[2]), .B0(n5), .B1(Data_i[1]), .Y(
        Data_o[1]) );
  AO22X1TS U67 ( .A0(select_i), .A1(Data_i[1]), .B0(Data_i[0]), .B1(n4), .Y(
        Data_o[0]) );
endmodule


module shift_mux_array_SWR55_LEVEL1 ( Data_i, select_i, bit_shift_i, Data_o );
  input [54:0] Data_i;
  output [54:0] Data_o;
  input select_i, bit_shift_i;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64;

  OAI22X1TS U1 ( .A0(n7), .A1(n46), .B0(n11), .B1(n42), .Y(Data_o[16]) );
  OAI22X1TS U2 ( .A0(n7), .A1(n48), .B0(n11), .B1(n44), .Y(Data_o[17]) );
  OAI22X1TS U3 ( .A0(n6), .A1(n50), .B0(n10), .B1(n46), .Y(Data_o[18]) );
  OAI22X1TS U4 ( .A0(n7), .A1(n52), .B0(n10), .B1(n48), .Y(Data_o[19]) );
  OAI22X1TS U5 ( .A0(n6), .A1(n54), .B0(n10), .B1(n50), .Y(Data_o[20]) );
  OAI22X1TS U6 ( .A0(n6), .A1(n56), .B0(n10), .B1(n52), .Y(Data_o[21]) );
  OAI22X1TS U7 ( .A0(n6), .A1(n58), .B0(n10), .B1(n54), .Y(Data_o[22]) );
  OAI22X1TS U8 ( .A0(n6), .A1(n60), .B0(n10), .B1(n56), .Y(Data_o[23]) );
  OAI22X1TS U9 ( .A0(n6), .A1(n57), .B0(n9), .B1(n61), .Y(Data_o[28]) );
  OAI22X1TS U10 ( .A0(n6), .A1(n55), .B0(n9), .B1(n59), .Y(Data_o[29]) );
  OAI22X1TS U11 ( .A0(n5), .A1(n53), .B0(n9), .B1(n57), .Y(Data_o[30]) );
  OAI22X1TS U12 ( .A0(n5), .A1(n51), .B0(n9), .B1(n55), .Y(Data_o[31]) );
  OAI22X1TS U13 ( .A0(n5), .A1(n49), .B0(n9), .B1(n53), .Y(Data_o[32]) );
  OAI22X1TS U14 ( .A0(n5), .A1(n47), .B0(n9), .B1(n51), .Y(Data_o[33]) );
  OAI22X1TS U15 ( .A0(n5), .A1(n45), .B0(n12), .B1(n49), .Y(Data_o[34]) );
  OAI22X1TS U16 ( .A0(n5), .A1(n43), .B0(n2), .B1(n47), .Y(Data_o[35]) );
  OAI22X1TS U17 ( .A0(n5), .A1(n41), .B0(n2), .B1(n45), .Y(Data_o[36]) );
  OAI22X1TS U18 ( .A0(n5), .A1(n39), .B0(n2), .B1(n43), .Y(Data_o[37]) );
  OAI22X1TS U19 ( .A0(n4), .A1(n37), .B0(n1), .B1(n41), .Y(Data_o[38]) );
  OAI22X1TS U20 ( .A0(n4), .A1(n35), .B0(n1), .B1(n39), .Y(Data_o[39]) );
  OAI22X1TS U21 ( .A0(n4), .A1(n33), .B0(n1), .B1(n37), .Y(Data_o[40]) );
  OAI22X1TS U22 ( .A0(n4), .A1(n31), .B0(n1), .B1(n35), .Y(Data_o[41]) );
  OAI22X1TS U23 ( .A0(n4), .A1(n29), .B0(select_i), .B1(n33), .Y(Data_o[42])
         );
  OAI22X1TS U24 ( .A0(n4), .A1(n27), .B0(n12), .B1(n31), .Y(Data_o[43]) );
  OAI22X1TS U25 ( .A0(n4), .A1(n25), .B0(n2), .B1(n29), .Y(Data_o[44]) );
  OAI22X1TS U26 ( .A0(n4), .A1(n23), .B0(n1), .B1(n27), .Y(Data_o[45]) );
  OAI22X1TS U27 ( .A0(n4), .A1(n21), .B0(select_i), .B1(n25), .Y(Data_o[46])
         );
  OAI22X1TS U28 ( .A0(n4), .A1(n19), .B0(n11), .B1(n23), .Y(Data_o[47]) );
  OAI22X1TS U29 ( .A0(n5), .A1(n17), .B0(n10), .B1(n21), .Y(Data_o[48]) );
  OAI22X1TS U30 ( .A0(n3), .A1(n16), .B0(n11), .B1(n19), .Y(Data_o[49]) );
  OAI22X1TS U31 ( .A0(n7), .A1(n40), .B0(n11), .B1(n36), .Y(Data_o[13]) );
  OAI22X1TS U32 ( .A0(n3), .A1(n22), .B0(n1), .B1(n18), .Y(Data_o[4]) );
  INVX2TS U33 ( .A(Data_i[4]), .Y(n18) );
  OAI22X1TS U34 ( .A0(n3), .A1(n24), .B0(n9), .B1(n20), .Y(Data_o[5]) );
  INVX2TS U35 ( .A(Data_i[5]), .Y(n20) );
  OAI22X1TS U36 ( .A0(n3), .A1(n26), .B0(n2), .B1(n22), .Y(Data_o[6]) );
  OAI22X1TS U37 ( .A0(n3), .A1(n28), .B0(n9), .B1(n24), .Y(Data_o[7]) );
  OAI22X1TS U38 ( .A0(n1), .A1(n26), .B0(n7), .B1(n30), .Y(Data_o[8]) );
  OAI22X1TS U39 ( .A0(select_i), .A1(n28), .B0(n32), .B1(n8), .Y(Data_o[9]) );
  OAI22X1TS U40 ( .A0(n7), .A1(n34), .B0(n11), .B1(n30), .Y(Data_o[10]) );
  OAI22X1TS U41 ( .A0(n7), .A1(n36), .B0(n11), .B1(n32), .Y(Data_o[11]) );
  OAI22X1TS U42 ( .A0(n7), .A1(n38), .B0(n11), .B1(n34), .Y(Data_o[12]) );
  OAI22X1TS U43 ( .A0(n7), .A1(n42), .B0(n11), .B1(n38), .Y(Data_o[14]) );
  OAI22X1TS U44 ( .A0(n7), .A1(n44), .B0(n11), .B1(n40), .Y(Data_o[15]) );
  OAI22X1TS U45 ( .A0(n3), .A1(n15), .B0(n10), .B1(n17), .Y(Data_o[50]) );
  OAI22X1TS U46 ( .A0(n3), .A1(n13), .B0(n2), .B1(n16), .Y(Data_o[51]) );
  OAI22X1TS U47 ( .A0(n3), .A1(n14), .B0(n2), .B1(n15), .Y(Data_o[52]) );
  OAI22X1TS U48 ( .A0(n3), .A1(n64), .B0(n1), .B1(n13), .Y(Data_o[53]) );
  OAI22X1TS U49 ( .A0(n3), .A1(n64), .B0(n12), .B1(n14), .Y(Data_o[54]) );
  INVX2TS U50 ( .A(n2), .Y(n4) );
  INVX2TS U51 ( .A(n1), .Y(n5) );
  INVX2TS U52 ( .A(select_i), .Y(n3) );
  INVX2TS U53 ( .A(select_i), .Y(n6) );
  INVX2TS U54 ( .A(n1), .Y(n7) );
  INVX2TS U55 ( .A(select_i), .Y(n8) );
  OAI22X1TS U56 ( .A0(n6), .A1(n62), .B0(n10), .B1(n58), .Y(Data_o[24]) );
  OAI22X1TS U57 ( .A0(n6), .A1(n63), .B0(n10), .B1(n60), .Y(Data_o[25]) );
  OAI22X1TS U58 ( .A0(n6), .A1(n59), .B0(n9), .B1(n63), .Y(Data_o[27]) );
  INVX2TS U59 ( .A(Data_i[6]), .Y(n22) );
  INVX2TS U60 ( .A(Data_i[7]), .Y(n24) );
  INVX2TS U61 ( .A(Data_i[17]), .Y(n44) );
  INVX2TS U62 ( .A(Data_i[20]), .Y(n50) );
  INVX2TS U63 ( .A(Data_i[21]), .Y(n52) );
  INVX2TS U64 ( .A(Data_i[10]), .Y(n30) );
  INVX2TS U65 ( .A(Data_i[12]), .Y(n34) );
  INVX2TS U66 ( .A(Data_i[13]), .Y(n36) );
  INVX2TS U67 ( .A(Data_i[18]), .Y(n46) );
  INVX2TS U68 ( .A(Data_i[16]), .Y(n42) );
  INVX2TS U69 ( .A(Data_i[14]), .Y(n38) );
  INVX2TS U70 ( .A(Data_i[19]), .Y(n48) );
  INVX2TS U71 ( .A(Data_i[15]), .Y(n40) );
  INVX2TS U72 ( .A(Data_i[8]), .Y(n26) );
  INVX2TS U73 ( .A(Data_i[9]), .Y(n28) );
  INVX2TS U74 ( .A(Data_i[11]), .Y(n32) );
  INVX2TS U75 ( .A(Data_i[22]), .Y(n54) );
  INVX2TS U76 ( .A(Data_i[23]), .Y(n56) );
  INVX2TS U77 ( .A(Data_i[24]), .Y(n58) );
  INVX2TS U78 ( .A(Data_i[25]), .Y(n60) );
  INVX2TS U79 ( .A(Data_i[28]), .Y(n61) );
  INVX2TS U80 ( .A(Data_i[29]), .Y(n59) );
  INVX2TS U81 ( .A(Data_i[30]), .Y(n57) );
  INVX2TS U82 ( .A(Data_i[31]), .Y(n55) );
  INVX2TS U83 ( .A(Data_i[32]), .Y(n53) );
  INVX2TS U84 ( .A(Data_i[33]), .Y(n51) );
  INVX2TS U85 ( .A(Data_i[34]), .Y(n49) );
  INVX2TS U86 ( .A(Data_i[35]), .Y(n47) );
  INVX2TS U87 ( .A(Data_i[36]), .Y(n45) );
  INVX2TS U88 ( .A(Data_i[37]), .Y(n43) );
  INVX2TS U89 ( .A(Data_i[38]), .Y(n41) );
  INVX2TS U90 ( .A(Data_i[39]), .Y(n39) );
  INVX2TS U91 ( .A(Data_i[40]), .Y(n37) );
  INVX2TS U92 ( .A(Data_i[41]), .Y(n35) );
  INVX2TS U93 ( .A(Data_i[42]), .Y(n33) );
  INVX2TS U94 ( .A(Data_i[43]), .Y(n31) );
  INVX2TS U95 ( .A(Data_i[44]), .Y(n29) );
  INVX2TS U96 ( .A(Data_i[45]), .Y(n27) );
  INVX2TS U97 ( .A(Data_i[46]), .Y(n25) );
  INVX2TS U98 ( .A(Data_i[47]), .Y(n23) );
  INVX2TS U99 ( .A(Data_i[48]), .Y(n21) );
  INVX2TS U100 ( .A(Data_i[49]), .Y(n19) );
  INVX2TS U101 ( .A(bit_shift_i), .Y(n64) );
  INVX2TS U102 ( .A(Data_i[51]), .Y(n16) );
  INVX2TS U103 ( .A(Data_i[52]), .Y(n15) );
  INVX2TS U104 ( .A(Data_i[53]), .Y(n13) );
  OAI22X1TS U105 ( .A0(n5), .A1(n61), .B0(n9), .B1(n62), .Y(Data_o[26]) );
  INVX2TS U106 ( .A(Data_i[50]), .Y(n17) );
  INVX2TS U107 ( .A(Data_i[54]), .Y(n14) );
  CLKBUFX2TS U108 ( .A(select_i), .Y(n9) );
  CLKBUFX2TS U109 ( .A(n2), .Y(n10) );
  CLKBUFX2TS U110 ( .A(select_i), .Y(n11) );
  INVX2TS U111 ( .A(Data_i[27]), .Y(n63) );
  INVX2TS U112 ( .A(Data_i[26]), .Y(n62) );
  CLKBUFX2TS U113 ( .A(select_i), .Y(n1) );
  CLKBUFX2TS U114 ( .A(n2), .Y(n12) );
  CLKBUFX2TS U115 ( .A(select_i), .Y(n2) );
  AO22X1TS U116 ( .A0(n12), .A1(Data_i[3]), .B0(Data_i[1]), .B1(n8), .Y(
        Data_o[1]) );
  AO22X1TS U117 ( .A0(n12), .A1(Data_i[4]), .B0(n8), .B1(Data_i[2]), .Y(
        Data_o[2]) );
  AO22X1TS U118 ( .A0(n12), .A1(Data_i[5]), .B0(n8), .B1(Data_i[3]), .Y(
        Data_o[3]) );
  AO22X1TS U119 ( .A0(n12), .A1(Data_i[2]), .B0(Data_i[0]), .B1(n8), .Y(
        Data_o[0]) );
endmodule


module shift_mux_array_SWR55_LEVEL2 ( Data_i, select_i, bit_shift_i, Data_o );
  input [54:0] Data_i;
  output [54:0] Data_o;
  input select_i, bit_shift_i;
  wire   n41, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15,
         n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52;

  INVX2TS U1 ( .A(Data_i[20]), .Y(n40) );
  INVX2TS U2 ( .A(Data_i[21]), .Y(n43) );
  INVX2TS U3 ( .A(Data_i[22]), .Y(n45) );
  INVX2TS U4 ( .A(Data_i[23]), .Y(n47) );
  INVX2TS U5 ( .A(Data_i[28]), .Y(n48) );
  INVX2TS U6 ( .A(Data_i[29]), .Y(n46) );
  INVX2TS U7 ( .A(Data_i[30]), .Y(n44) );
  INVX2TS U8 ( .A(Data_i[31]), .Y(n42) );
  INVX2TS U9 ( .A(Data_i[32]), .Y(n39) );
  INVX2TS U10 ( .A(Data_i[33]), .Y(n37) );
  INVX2TS U11 ( .A(Data_i[34]), .Y(n35) );
  INVX2TS U12 ( .A(Data_i[35]), .Y(n33) );
  INVX2TS U13 ( .A(Data_i[36]), .Y(n31) );
  INVX2TS U14 ( .A(Data_i[37]), .Y(n30) );
  INVX2TS U15 ( .A(Data_i[38]), .Y(n29) );
  INVX2TS U16 ( .A(Data_i[39]), .Y(n28) );
  INVX2TS U17 ( .A(Data_i[40]), .Y(n27) );
  INVX2TS U18 ( .A(Data_i[41]), .Y(n26) );
  INVX2TS U19 ( .A(Data_i[42]), .Y(n25) );
  INVX2TS U20 ( .A(Data_i[43]), .Y(n24) );
  INVX2TS U21 ( .A(Data_i[44]), .Y(n23) );
  INVX2TS U22 ( .A(Data_i[45]), .Y(n22) );
  INVX2TS U23 ( .A(Data_i[46]), .Y(n21) );
  INVX2TS U24 ( .A(Data_i[47]), .Y(n20) );
  INVX2TS U25 ( .A(Data_i[48]), .Y(n19) );
  INVX2TS U26 ( .A(Data_i[49]), .Y(n18) );
  INVX2TS U27 ( .A(Data_i[50]), .Y(n17) );
  INVX2TS U28 ( .A(Data_i[51]), .Y(n14) );
  INVX2TS U29 ( .A(Data_i[52]), .Y(n16) );
  INVX2TS U30 ( .A(Data_i[53]), .Y(n13) );
  INVX2TS U31 ( .A(Data_i[54]), .Y(n15) );
  INVX2TS U32 ( .A(n11), .Y(n1) );
  INVX2TS U33 ( .A(n10), .Y(n3) );
  INVX2TS U34 ( .A(n10), .Y(n2) );
  INVX2TS U35 ( .A(Data_i[24]), .Y(n49) );
  INVX2TS U36 ( .A(Data_i[25]), .Y(n51) );
  INVX2TS U37 ( .A(Data_i[27]), .Y(n50) );
  INVX2TS U38 ( .A(Data_i[26]), .Y(n52) );
  NAND2X1TS U39 ( .A(bit_shift_i), .B(n1), .Y(n41) );
  CLKBUFX2TS U40 ( .A(n11), .Y(n6) );
  INVX2TS U41 ( .A(n11), .Y(n4) );
  CLKBUFX2TS U42 ( .A(n9), .Y(n7) );
  CLKBUFX2TS U43 ( .A(n9), .Y(n8) );
  INVX2TS U44 ( .A(n11), .Y(n5) );
  CLKBUFX2TS U45 ( .A(n12), .Y(n9) );
  CLKBUFX2TS U46 ( .A(n12), .Y(n10) );
  CLKBUFX2TS U47 ( .A(n12), .Y(n11) );
  OAI22X1TS U48 ( .A0(n7), .A1(n40), .B0(n4), .B1(n32), .Y(Data_o[16]) );
  INVX2TS U49 ( .A(Data_i[16]), .Y(n32) );
  OAI22X1TS U50 ( .A0(n7), .A1(n43), .B0(n4), .B1(n34), .Y(Data_o[17]) );
  INVX2TS U51 ( .A(Data_i[17]), .Y(n34) );
  OAI22X1TS U52 ( .A0(n10), .A1(n47), .B0(n4), .B1(n38), .Y(Data_o[19]) );
  INVX2TS U53 ( .A(Data_i[19]), .Y(n38) );
  OAI22X1TS U54 ( .A0(n10), .A1(n49), .B0(n4), .B1(n40), .Y(Data_o[20]) );
  OAI22X1TS U55 ( .A0(n11), .A1(n51), .B0(n4), .B1(n43), .Y(Data_o[21]) );
  OAI22X1TS U56 ( .A0(n12), .A1(n50), .B0(n4), .B1(n47), .Y(Data_o[23]) );
  AO22X1TS U57 ( .A0(n5), .A1(Data_i[5]), .B0(Data_i[1]), .B1(n7), .Y(
        Data_o[1]) );
  AO22X1TS U58 ( .A0(n5), .A1(Data_i[6]), .B0(Data_i[2]), .B1(n7), .Y(
        Data_o[2]) );
  AO22X1TS U59 ( .A0(n5), .A1(Data_i[7]), .B0(Data_i[3]), .B1(n7), .Y(
        Data_o[3]) );
  AO22X1TS U60 ( .A0(n5), .A1(Data_i[8]), .B0(n8), .B1(Data_i[4]), .Y(
        Data_o[4]) );
  AO22X1TS U61 ( .A0(n5), .A1(Data_i[14]), .B0(n8), .B1(Data_i[10]), .Y(
        Data_o[10]) );
  AO22X1TS U62 ( .A0(n5), .A1(Data_i[15]), .B0(n8), .B1(Data_i[11]), .Y(
        Data_o[11]) );
  AO22X1TS U63 ( .A0(n5), .A1(Data_i[16]), .B0(n8), .B1(Data_i[12]), .Y(
        Data_o[12]) );
  AO22X1TS U64 ( .A0(n5), .A1(Data_i[17]), .B0(n7), .B1(Data_i[13]), .Y(
        Data_o[13]) );
  AO22X1TS U65 ( .A0(n5), .A1(Data_i[18]), .B0(n8), .B1(Data_i[14]), .Y(
        Data_o[14]) );
  AO22X1TS U66 ( .A0(n5), .A1(Data_i[19]), .B0(n7), .B1(Data_i[15]), .Y(
        Data_o[15]) );
  OAI22X1TS U67 ( .A0(n7), .A1(n45), .B0(n3), .B1(n36), .Y(Data_o[18]) );
  INVX2TS U68 ( .A(Data_i[18]), .Y(n36) );
  OAI22X1TS U69 ( .A0(n12), .A1(n52), .B0(n3), .B1(n45), .Y(Data_o[22]) );
  OAI22X1TS U70 ( .A0(n12), .A1(n48), .B0(n3), .B1(n49), .Y(Data_o[24]) );
  OAI22X1TS U71 ( .A0(n12), .A1(n46), .B0(n3), .B1(n51), .Y(Data_o[25]) );
  OAI22X1TS U72 ( .A0(n12), .A1(n42), .B0(n3), .B1(n50), .Y(Data_o[27]) );
  OAI22X1TS U73 ( .A0(n12), .A1(n39), .B0(n3), .B1(n48), .Y(Data_o[28]) );
  OAI22X1TS U74 ( .A0(n10), .A1(n37), .B0(n3), .B1(n46), .Y(Data_o[29]) );
  OAI22X1TS U75 ( .A0(n11), .A1(n35), .B0(n3), .B1(n44), .Y(Data_o[30]) );
  OAI22X1TS U76 ( .A0(n8), .A1(n33), .B0(n3), .B1(n42), .Y(Data_o[31]) );
  OAI22X1TS U77 ( .A0(n10), .A1(n31), .B0(n2), .B1(n39), .Y(Data_o[32]) );
  OAI22X1TS U78 ( .A0(n10), .A1(n30), .B0(n2), .B1(n37), .Y(Data_o[33]) );
  OAI22X1TS U79 ( .A0(n10), .A1(n29), .B0(n2), .B1(n35), .Y(Data_o[34]) );
  OAI22X1TS U80 ( .A0(n10), .A1(n28), .B0(n2), .B1(n33), .Y(Data_o[35]) );
  OAI22X1TS U81 ( .A0(n11), .A1(n27), .B0(n2), .B1(n31), .Y(Data_o[36]) );
  OAI22X1TS U82 ( .A0(n11), .A1(n26), .B0(n2), .B1(n30), .Y(Data_o[37]) );
  OAI22X1TS U83 ( .A0(n6), .A1(n25), .B0(n2), .B1(n29), .Y(Data_o[38]) );
  OAI22X1TS U84 ( .A0(n6), .A1(n24), .B0(n2), .B1(n28), .Y(Data_o[39]) );
  OAI22X1TS U85 ( .A0(n6), .A1(n23), .B0(n2), .B1(n27), .Y(Data_o[40]) );
  OAI22X1TS U86 ( .A0(n6), .A1(n22), .B0(n2), .B1(n26), .Y(Data_o[41]) );
  OAI22X1TS U87 ( .A0(n10), .A1(n21), .B0(n1), .B1(n25), .Y(Data_o[42]) );
  OAI22X1TS U88 ( .A0(n6), .A1(n20), .B0(n1), .B1(n24), .Y(Data_o[43]) );
  OAI22X1TS U89 ( .A0(n6), .A1(n19), .B0(n1), .B1(n23), .Y(Data_o[44]) );
  OAI22X1TS U90 ( .A0(n6), .A1(n18), .B0(n1), .B1(n22), .Y(Data_o[45]) );
  OAI22X1TS U91 ( .A0(n6), .A1(n17), .B0(n1), .B1(n21), .Y(Data_o[46]) );
  OAI22X1TS U92 ( .A0(n6), .A1(n14), .B0(n1), .B1(n20), .Y(Data_o[47]) );
  OAI22X1TS U93 ( .A0(n6), .A1(n16), .B0(n1), .B1(n19), .Y(Data_o[48]) );
  OAI22X1TS U94 ( .A0(n11), .A1(n13), .B0(n1), .B1(n18), .Y(Data_o[49]) );
  AO22X1TS U95 ( .A0(select_i), .A1(Data_i[4]), .B0(Data_i[0]), .B1(n7), .Y(
        Data_o[0]) );
  AO22X1TS U96 ( .A0(select_i), .A1(Data_i[9]), .B0(n8), .B1(Data_i[5]), .Y(
        Data_o[5]) );
  AO22X1TS U97 ( .A0(select_i), .A1(Data_i[10]), .B0(n8), .B1(Data_i[6]), .Y(
        Data_o[6]) );
  AO22X1TS U98 ( .A0(select_i), .A1(Data_i[11]), .B0(n8), .B1(Data_i[7]), .Y(
        Data_o[7]) );
  AO22X1TS U99 ( .A0(select_i), .A1(Data_i[12]), .B0(n8), .B1(Data_i[8]), .Y(
        Data_o[8]) );
  AO22X1TS U100 ( .A0(Data_i[13]), .A1(select_i), .B0(n7), .B1(Data_i[9]), .Y(
        Data_o[9]) );
  OAI22X1TS U101 ( .A0(n12), .A1(n44), .B0(n3), .B1(n52), .Y(Data_o[26]) );
  OAI21X1TS U102 ( .A0(n4), .A1(n14), .B0(n41), .Y(Data_o[51]) );
  OAI21X1TS U103 ( .A0(n4), .A1(n16), .B0(n41), .Y(Data_o[52]) );
  OAI21X1TS U104 ( .A0(n4), .A1(n13), .B0(n41), .Y(Data_o[53]) );
  OAI21X1TS U105 ( .A0(n4), .A1(n15), .B0(n41), .Y(Data_o[54]) );
  OAI22X1TS U106 ( .A0(n11), .A1(n15), .B0(n1), .B1(n17), .Y(Data_o[50]) );
  INVX2TS U107 ( .A(select_i), .Y(n12) );
endmodule


module RegisterAdd_W55_0 ( clk, rst, load, D, Q );
  input [54:0] D;
  output [54:0] Q;
  input clk, rst, load;
  wire   n110, n112, n113, n114, n115, n116, n117, n118, n119, n120, n121,
         n122, n123, n124, n125, n126, n127, n128, n129, n130, n131, n132,
         n133, n134, n135, n136, n137, n138, n139, n140, n141, n142, n143,
         n144, n145, n146, n147, n148, n149, n150, n151, n152, n153, n154,
         n155, n156, n157, n158, n159, n160, n161, n162, n163, n164, n165,
         n166, n167, n168, n169, n170, n171, n172, n173, n174, n175, n176,
         n177, n178, n179, n180, n181, n182, n183, n184, n185, n186, n187,
         n188, n189, n190, n191, n192, n193, n194, n195, n196, n197, n198,
         n199, n200, n201, n202, n203, n204, n205, n206, n207, n208, n209,
         n210, n211, n212, n213, n214, n215, n216, n217, n218, n219, n220,
         n221, n222, n223, n224, n225, n226;

  DFFRX2TS Q_reg_54_ ( .D(n117), .CK(clk), .RN(n115), .Q(Q[54]), .QN(n172) );
  DFFRX2TS Q_reg_53_ ( .D(n118), .CK(clk), .RN(n115), .Q(Q[53]), .QN(n173) );
  DFFRX2TS Q_reg_52_ ( .D(n119), .CK(clk), .RN(n115), .Q(Q[52]), .QN(n174) );
  DFFRX2TS Q_reg_51_ ( .D(n120), .CK(clk), .RN(n115), .Q(Q[51]), .QN(n175) );
  DFFRX2TS Q_reg_50_ ( .D(n121), .CK(clk), .RN(n115), .Q(Q[50]), .QN(n176) );
  DFFRX2TS Q_reg_49_ ( .D(n122), .CK(clk), .RN(n114), .Q(Q[49]), .QN(n177) );
  DFFRX2TS Q_reg_48_ ( .D(n123), .CK(clk), .RN(n114), .Q(Q[48]), .QN(n178) );
  DFFRX2TS Q_reg_47_ ( .D(n124), .CK(clk), .RN(n114), .Q(Q[47]), .QN(n179) );
  DFFRX2TS Q_reg_7_ ( .D(n164), .CK(clk), .RN(n110), .Q(Q[7]), .QN(n219) );
  DFFRX2TS Q_reg_6_ ( .D(n165), .CK(clk), .RN(n110), .Q(Q[6]), .QN(n220) );
  DFFRX2TS Q_reg_5_ ( .D(n166), .CK(clk), .RN(n110), .Q(Q[5]), .QN(n221) );
  DFFRX2TS Q_reg_4_ ( .D(n167), .CK(clk), .RN(n110), .Q(Q[4]), .QN(n222) );
  DFFRX2TS Q_reg_3_ ( .D(n168), .CK(clk), .RN(n110), .Q(Q[3]), .QN(n223) );
  DFFRX2TS Q_reg_2_ ( .D(n169), .CK(clk), .RN(n110), .Q(Q[2]), .QN(n224) );
  DFFRX2TS Q_reg_1_ ( .D(n170), .CK(clk), .RN(n110), .Q(Q[1]), .QN(n225) );
  DFFRX2TS Q_reg_0_ ( .D(n171), .CK(clk), .RN(n110), .Q(Q[0]), .QN(n226) );
  DFFRX2TS Q_reg_31_ ( .D(n140), .CK(clk), .RN(n113), .Q(Q[31]), .QN(n195) );
  DFFRX2TS Q_reg_30_ ( .D(n141), .CK(clk), .RN(n113), .Q(Q[30]), .QN(n196) );
  DFFRX2TS Q_reg_29_ ( .D(n142), .CK(clk), .RN(n112), .Q(Q[29]), .QN(n197) );
  DFFRX2TS Q_reg_28_ ( .D(n143), .CK(clk), .RN(n112), .Q(Q[28]), .QN(n198) );
  DFFRX2TS Q_reg_27_ ( .D(n144), .CK(clk), .RN(n112), .Q(Q[27]), .QN(n199) );
  DFFRX2TS Q_reg_26_ ( .D(n145), .CK(clk), .RN(n112), .Q(Q[26]), .QN(n200) );
  DFFRX2TS Q_reg_25_ ( .D(n146), .CK(clk), .RN(n112), .Q(Q[25]), .QN(n201) );
  DFFRX2TS Q_reg_24_ ( .D(n147), .CK(clk), .RN(n112), .Q(Q[24]), .QN(n202) );
  DFFRX2TS Q_reg_23_ ( .D(n148), .CK(clk), .RN(n112), .Q(Q[23]), .QN(n203) );
  DFFRX2TS Q_reg_22_ ( .D(n149), .CK(clk), .RN(n112), .Q(Q[22]), .QN(n204) );
  DFFRX2TS Q_reg_21_ ( .D(n150), .CK(clk), .RN(n112), .Q(Q[21]), .QN(n205) );
  DFFRX2TS Q_reg_20_ ( .D(n151), .CK(clk), .RN(n112), .Q(Q[20]), .QN(n206) );
  DFFRX2TS Q_reg_19_ ( .D(n152), .CK(clk), .RN(n116), .Q(Q[19]), .QN(n207) );
  DFFRX2TS Q_reg_18_ ( .D(n153), .CK(clk), .RN(n116), .Q(Q[18]), .QN(n208) );
  DFFRX2TS Q_reg_16_ ( .D(n155), .CK(clk), .RN(n116), .Q(Q[16]), .QN(n210) );
  DFFRX2TS Q_reg_15_ ( .D(n156), .CK(clk), .RN(n116), .Q(Q[15]), .QN(n211) );
  DFFRX2TS Q_reg_14_ ( .D(n157), .CK(clk), .RN(n116), .Q(Q[14]), .QN(n212) );
  DFFRX2TS Q_reg_13_ ( .D(n158), .CK(clk), .RN(n115), .Q(Q[13]), .QN(n213) );
  DFFRX2TS Q_reg_12_ ( .D(n159), .CK(clk), .RN(n115), .Q(Q[12]), .QN(n214) );
  DFFRX2TS Q_reg_11_ ( .D(n160), .CK(clk), .RN(n115), .Q(Q[11]), .QN(n215) );
  DFFRX2TS Q_reg_10_ ( .D(n161), .CK(clk), .RN(n115), .Q(Q[10]), .QN(n216) );
  DFFRX2TS Q_reg_9_ ( .D(n162), .CK(clk), .RN(n110), .Q(Q[9]), .QN(n217) );
  DFFRX2TS Q_reg_8_ ( .D(n163), .CK(clk), .RN(n110), .Q(Q[8]), .QN(n218) );
  DFFRX2TS Q_reg_17_ ( .D(n154), .CK(clk), .RN(n115), .Q(Q[17]), .QN(n209) );
  DFFRX2TS Q_reg_46_ ( .D(n125), .CK(clk), .RN(n114), .Q(Q[46]), .QN(n180) );
  DFFRX2TS Q_reg_45_ ( .D(n126), .CK(clk), .RN(n114), .Q(Q[45]), .QN(n181) );
  DFFRX2TS Q_reg_44_ ( .D(n127), .CK(clk), .RN(n114), .Q(Q[44]), .QN(n182) );
  DFFRX2TS Q_reg_43_ ( .D(n128), .CK(clk), .RN(n114), .Q(Q[43]), .QN(n183) );
  DFFRX2TS Q_reg_42_ ( .D(n129), .CK(clk), .RN(n114), .Q(Q[42]), .QN(n184) );
  DFFRX2TS Q_reg_41_ ( .D(n130), .CK(clk), .RN(n114), .Q(Q[41]), .QN(n185) );
  DFFRX2TS Q_reg_40_ ( .D(n131), .CK(clk), .RN(n114), .Q(Q[40]), .QN(n186) );
  DFFRX2TS Q_reg_39_ ( .D(n132), .CK(clk), .RN(n113), .Q(Q[39]), .QN(n187) );
  DFFRX2TS Q_reg_38_ ( .D(n133), .CK(clk), .RN(n113), .Q(Q[38]), .QN(n188) );
  DFFRX2TS Q_reg_37_ ( .D(n134), .CK(clk), .RN(n113), .Q(Q[37]), .QN(n189) );
  DFFRX2TS Q_reg_36_ ( .D(n135), .CK(clk), .RN(n113), .Q(Q[36]), .QN(n190) );
  DFFRX2TS Q_reg_35_ ( .D(n136), .CK(clk), .RN(n113), .Q(Q[35]), .QN(n191) );
  DFFRX2TS Q_reg_34_ ( .D(n137), .CK(clk), .RN(n113), .Q(Q[34]), .QN(n192) );
  DFFRX2TS Q_reg_33_ ( .D(n138), .CK(clk), .RN(n113), .Q(Q[33]), .QN(n193) );
  DFFRX2TS Q_reg_32_ ( .D(n139), .CK(clk), .RN(n113), .Q(Q[32]), .QN(n194) );
  CLKBUFX2TS U2 ( .A(n116), .Y(n110) );
  CLKBUFX2TS U3 ( .A(n116), .Y(n112) );
  CLKBUFX2TS U4 ( .A(n116), .Y(n113) );
  CLKBUFX2TS U5 ( .A(n116), .Y(n114) );
  CLKBUFX2TS U6 ( .A(n116), .Y(n115) );
  OAI2BB2XLTS U7 ( .B0(n210), .B1(load), .A0N(D[16]), .A1N(load), .Y(n155) );
  OAI2BB2XLTS U8 ( .B0(n209), .B1(load), .A0N(D[17]), .A1N(load), .Y(n154) );
  OAI2BB2XLTS U9 ( .B0(n207), .B1(load), .A0N(D[19]), .A1N(load), .Y(n152) );
  OAI2BB2XLTS U10 ( .B0(n206), .B1(load), .A0N(D[20]), .A1N(load), .Y(n151) );
  OAI2BB2XLTS U11 ( .B0(n205), .B1(load), .A0N(D[21]), .A1N(load), .Y(n150) );
  OAI2BB2XLTS U12 ( .B0(n203), .B1(load), .A0N(D[23]), .A1N(load), .Y(n148) );
  OAI2BB2XLTS U13 ( .B0(n225), .B1(load), .A0N(D[1]), .A1N(load), .Y(n170) );
  OAI2BB2XLTS U14 ( .B0(n224), .B1(load), .A0N(D[2]), .A1N(load), .Y(n169) );
  OAI2BB2XLTS U15 ( .B0(n223), .B1(load), .A0N(D[3]), .A1N(load), .Y(n168) );
  OAI2BB2XLTS U16 ( .B0(n222), .B1(load), .A0N(D[4]), .A1N(load), .Y(n167) );
  OAI2BB2XLTS U17 ( .B0(n216), .B1(load), .A0N(D[10]), .A1N(load), .Y(n161) );
  OAI2BB2XLTS U18 ( .B0(n215), .B1(load), .A0N(D[11]), .A1N(load), .Y(n160) );
  OAI2BB2XLTS U19 ( .B0(n214), .B1(load), .A0N(D[12]), .A1N(load), .Y(n159) );
  OAI2BB2XLTS U20 ( .B0(n213), .B1(load), .A0N(D[13]), .A1N(load), .Y(n158) );
  OAI2BB2XLTS U21 ( .B0(n212), .B1(load), .A0N(D[14]), .A1N(load), .Y(n157) );
  OAI2BB2XLTS U22 ( .B0(n211), .B1(load), .A0N(D[15]), .A1N(load), .Y(n156) );
  OAI2BB2XLTS U23 ( .B0(n208), .B1(load), .A0N(D[18]), .A1N(load), .Y(n153) );
  OAI2BB2XLTS U24 ( .B0(n204), .B1(load), .A0N(D[22]), .A1N(load), .Y(n149) );
  OAI2BB2XLTS U25 ( .B0(n202), .B1(load), .A0N(D[24]), .A1N(load), .Y(n147) );
  OAI2BB2XLTS U26 ( .B0(n201), .B1(load), .A0N(D[25]), .A1N(load), .Y(n146) );
  OAI2BB2XLTS U27 ( .B0(n199), .B1(load), .A0N(D[27]), .A1N(load), .Y(n144) );
  OAI2BB2XLTS U28 ( .B0(n198), .B1(load), .A0N(D[28]), .A1N(load), .Y(n143) );
  OAI2BB2XLTS U29 ( .B0(n197), .B1(load), .A0N(D[29]), .A1N(load), .Y(n142) );
  OAI2BB2XLTS U30 ( .B0(n196), .B1(load), .A0N(D[30]), .A1N(load), .Y(n141) );
  OAI2BB2XLTS U31 ( .B0(n195), .B1(load), .A0N(D[31]), .A1N(load), .Y(n140) );
  OAI2BB2XLTS U32 ( .B0(n194), .B1(load), .A0N(D[32]), .A1N(load), .Y(n139) );
  OAI2BB2XLTS U33 ( .B0(n193), .B1(load), .A0N(D[33]), .A1N(load), .Y(n138) );
  OAI2BB2XLTS U34 ( .B0(n192), .B1(load), .A0N(D[34]), .A1N(load), .Y(n137) );
  OAI2BB2XLTS U35 ( .B0(n191), .B1(load), .A0N(D[35]), .A1N(load), .Y(n136) );
  OAI2BB2XLTS U36 ( .B0(n190), .B1(load), .A0N(D[36]), .A1N(load), .Y(n135) );
  OAI2BB2XLTS U37 ( .B0(n189), .B1(load), .A0N(D[37]), .A1N(load), .Y(n134) );
  OAI2BB2XLTS U38 ( .B0(n188), .B1(load), .A0N(D[38]), .A1N(load), .Y(n133) );
  OAI2BB2XLTS U39 ( .B0(n187), .B1(load), .A0N(D[39]), .A1N(load), .Y(n132) );
  OAI2BB2XLTS U40 ( .B0(n186), .B1(load), .A0N(D[40]), .A1N(load), .Y(n131) );
  OAI2BB2XLTS U41 ( .B0(n185), .B1(load), .A0N(D[41]), .A1N(load), .Y(n130) );
  OAI2BB2XLTS U42 ( .B0(n184), .B1(load), .A0N(D[42]), .A1N(load), .Y(n129) );
  OAI2BB2XLTS U43 ( .B0(n183), .B1(load), .A0N(D[43]), .A1N(load), .Y(n128) );
  OAI2BB2XLTS U44 ( .B0(n182), .B1(load), .A0N(D[44]), .A1N(load), .Y(n127) );
  OAI2BB2XLTS U45 ( .B0(n181), .B1(load), .A0N(D[45]), .A1N(load), .Y(n126) );
  OAI2BB2XLTS U46 ( .B0(n180), .B1(load), .A0N(D[46]), .A1N(load), .Y(n125) );
  OAI2BB2XLTS U47 ( .B0(n179), .B1(load), .A0N(D[47]), .A1N(load), .Y(n124) );
  OAI2BB2XLTS U48 ( .B0(n178), .B1(load), .A0N(D[48]), .A1N(load), .Y(n123) );
  OAI2BB2XLTS U49 ( .B0(n177), .B1(load), .A0N(D[49]), .A1N(load), .Y(n122) );
  OAI2BB2XLTS U50 ( .B0(n226), .B1(load), .A0N(load), .A1N(D[0]), .Y(n171) );
  OAI2BB2XLTS U51 ( .B0(n221), .B1(load), .A0N(D[5]), .A1N(load), .Y(n166) );
  OAI2BB2XLTS U52 ( .B0(n220), .B1(load), .A0N(D[6]), .A1N(load), .Y(n165) );
  OAI2BB2XLTS U53 ( .B0(n219), .B1(load), .A0N(D[7]), .A1N(load), .Y(n164) );
  OAI2BB2XLTS U54 ( .B0(n218), .B1(load), .A0N(D[8]), .A1N(load), .Y(n163) );
  OAI2BB2XLTS U55 ( .B0(n217), .B1(load), .A0N(D[9]), .A1N(load), .Y(n162) );
  OAI2BB2XLTS U56 ( .B0(n200), .B1(load), .A0N(D[26]), .A1N(load), .Y(n145) );
  OAI2BB2XLTS U57 ( .B0(n175), .B1(load), .A0N(D[51]), .A1N(load), .Y(n120) );
  OAI2BB2XLTS U58 ( .B0(n174), .B1(load), .A0N(D[52]), .A1N(load), .Y(n119) );
  OAI2BB2XLTS U59 ( .B0(n173), .B1(load), .A0N(D[53]), .A1N(load), .Y(n118) );
  OAI2BB2XLTS U60 ( .B0(n172), .B1(load), .A0N(D[54]), .A1N(load), .Y(n117) );
  OAI2BB2XLTS U61 ( .B0(n176), .B1(load), .A0N(D[50]), .A1N(load), .Y(n121) );
  INVX2TS U62 ( .A(rst), .Y(n116) );
endmodule


module shift_mux_array_SWR55_LEVEL3 ( Data_i, select_i, bit_shift_i, Data_o );
  input [54:0] Data_i;
  output [54:0] Data_o;
  input select_i, bit_shift_i;
  wire   n25, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15,
         n16, n17, n18, n19, n20, n21, n22, n23, n24, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35;

  INVX2TS U1 ( .A(n10), .Y(n1) );
  INVX2TS U2 ( .A(n11), .Y(n2) );
  INVX2TS U3 ( .A(n7), .Y(n3) );
  INVX2TS U4 ( .A(n10), .Y(n4) );
  INVX2TS U5 ( .A(n6), .Y(n5) );
  NAND2X1TS U6 ( .A(bit_shift_i), .B(n1), .Y(n25) );
  CLKBUFX2TS U7 ( .A(n11), .Y(n6) );
  CLKBUFX2TS U8 ( .A(n11), .Y(n7) );
  CLKBUFX2TS U9 ( .A(n11), .Y(n8) );
  CLKBUFX2TS U10 ( .A(n11), .Y(n9) );
  CLKBUFX2TS U11 ( .A(n11), .Y(n10) );
  OAI22X1TS U12 ( .A0(n6), .A1(n14), .B0(n1), .B1(n22), .Y(Data_o[44]) );
  OAI22X1TS U13 ( .A0(n11), .A1(n16), .B0(n1), .B1(n24), .Y(Data_o[42]) );
  OAI22X1TS U14 ( .A0(n6), .A1(n13), .B0(n1), .B1(n21), .Y(Data_o[45]) );
  OAI22X1TS U15 ( .A0(n7), .A1(n17), .B0(n1), .B1(n26), .Y(Data_o[41]) );
  OAI22X1TS U16 ( .A0(n10), .A1(n12), .B0(n1), .B1(n20), .Y(Data_o[46]) );
  OAI22X1TS U17 ( .A0(n6), .A1(n18), .B0(n1), .B1(n27), .Y(Data_o[40]) );
  OAI22X1TS U18 ( .A0(n6), .A1(n15), .B0(n1), .B1(n23), .Y(Data_o[43]) );
  OAI21X1TS U19 ( .A0(n3), .A1(n19), .B0(n25), .Y(Data_o[47]) );
  OAI21X1TS U20 ( .A0(n3), .A1(n15), .B0(n25), .Y(Data_o[51]) );
  OAI21X1TS U21 ( .A0(n3), .A1(n14), .B0(n25), .Y(Data_o[52]) );
  OAI21X1TS U22 ( .A0(n3), .A1(n18), .B0(n25), .Y(Data_o[48]) );
  OAI21X1TS U23 ( .A0(n2), .A1(n16), .B0(n25), .Y(Data_o[50]) );
  OAI21X1TS U24 ( .A0(n2), .A1(n13), .B0(n25), .Y(Data_o[53]) );
  OAI21X1TS U25 ( .A0(n2), .A1(n17), .B0(n25), .Y(Data_o[49]) );
  OAI21X1TS U26 ( .A0(n2), .A1(n12), .B0(n25), .Y(Data_o[54]) );
  INVX2TS U27 ( .A(select_i), .Y(n11) );
  OAI22X1TS U28 ( .A0(n11), .A1(n20), .B0(n2), .B1(n29), .Y(Data_o[38]) );
  INVX2TS U29 ( .A(Data_i[38]), .Y(n29) );
  OAI22X1TS U30 ( .A0(n6), .A1(n21), .B0(n2), .B1(n30), .Y(Data_o[37]) );
  INVX2TS U31 ( .A(Data_i[37]), .Y(n30) );
  OAI22X1TS U32 ( .A0(n7), .A1(n22), .B0(n1), .B1(n31), .Y(Data_o[36]) );
  INVX2TS U33 ( .A(Data_i[36]), .Y(n31) );
  OAI22X1TS U34 ( .A0(n6), .A1(n23), .B0(n2), .B1(n32), .Y(Data_o[35]) );
  INVX2TS U35 ( .A(Data_i[35]), .Y(n32) );
  OAI22X1TS U36 ( .A0(n8), .A1(n24), .B0(n2), .B1(n33), .Y(Data_o[34]) );
  INVX2TS U37 ( .A(Data_i[34]), .Y(n33) );
  OAI22X1TS U38 ( .A0(n8), .A1(n26), .B0(n2), .B1(n34), .Y(Data_o[33]) );
  INVX2TS U39 ( .A(Data_i[33]), .Y(n34) );
  OAI22X1TS U40 ( .A0(n8), .A1(n27), .B0(n1), .B1(n35), .Y(Data_o[32]) );
  INVX2TS U41 ( .A(Data_i[32]), .Y(n35) );
  OAI22X1TS U42 ( .A0(n7), .A1(n19), .B0(n2), .B1(n28), .Y(Data_o[39]) );
  INVX2TS U43 ( .A(Data_i[39]), .Y(n28) );
  AO22X1TS U44 ( .A0(n4), .A1(Data_i[33]), .B0(n8), .B1(Data_i[25]), .Y(
        Data_o[25]) );
  AO22X1TS U45 ( .A0(n5), .A1(Data_i[23]), .B0(n9), .B1(Data_i[15]), .Y(
        Data_o[15]) );
  AO22X1TS U46 ( .A0(n5), .A1(Data_i[22]), .B0(n9), .B1(Data_i[14]), .Y(
        Data_o[14]) );
  AO22X1TS U47 ( .A0(n5), .A1(Data_i[21]), .B0(n9), .B1(Data_i[13]), .Y(
        Data_o[13]) );
  AO22X1TS U48 ( .A0(n5), .A1(Data_i[20]), .B0(n9), .B1(Data_i[12]), .Y(
        Data_o[12]) );
  AO22X1TS U49 ( .A0(n5), .A1(Data_i[19]), .B0(n9), .B1(Data_i[11]), .Y(
        Data_o[11]) );
  AO22X1TS U50 ( .A0(n5), .A1(Data_i[18]), .B0(n10), .B1(Data_i[10]), .Y(
        Data_o[10]) );
  AO22X1TS U51 ( .A0(Data_i[17]), .A1(select_i), .B0(n10), .B1(Data_i[9]), .Y(
        Data_o[9]) );
  AO22X1TS U52 ( .A0(select_i), .A1(Data_i[16]), .B0(n10), .B1(Data_i[8]), .Y(
        Data_o[8]) );
  AO22X1TS U53 ( .A0(select_i), .A1(Data_i[15]), .B0(Data_i[7]), .B1(n6), .Y(
        Data_o[7]) );
  AO22X1TS U54 ( .A0(select_i), .A1(Data_i[14]), .B0(Data_i[6]), .B1(n10), .Y(
        Data_o[6]) );
  AO22X1TS U55 ( .A0(select_i), .A1(Data_i[13]), .B0(Data_i[5]), .B1(n11), .Y(
        Data_o[5]) );
  AO22X1TS U56 ( .A0(n5), .A1(Data_i[12]), .B0(Data_i[4]), .B1(n10), .Y(
        Data_o[4]) );
  AO22X1TS U57 ( .A0(n4), .A1(Data_i[11]), .B0(Data_i[3]), .B1(n6), .Y(
        Data_o[3]) );
  AO22X1TS U58 ( .A0(n3), .A1(Data_i[10]), .B0(Data_i[2]), .B1(n11), .Y(
        Data_o[2]) );
  AO22X1TS U59 ( .A0(n4), .A1(Data_i[9]), .B0(Data_i[1]), .B1(n7), .Y(
        Data_o[1]) );
  AO22X1TS U60 ( .A0(select_i), .A1(Data_i[8]), .B0(Data_i[0]), .B1(n7), .Y(
        Data_o[0]) );
  AO22X1TS U61 ( .A0(n3), .A1(Data_i[39]), .B0(n7), .B1(Data_i[31]), .Y(
        Data_o[31]) );
  AO22X1TS U62 ( .A0(n3), .A1(Data_i[38]), .B0(n7), .B1(Data_i[30]), .Y(
        Data_o[30]) );
  AO22X1TS U63 ( .A0(n3), .A1(Data_i[37]), .B0(n7), .B1(Data_i[29]), .Y(
        Data_o[29]) );
  AO22X1TS U64 ( .A0(n3), .A1(Data_i[36]), .B0(n7), .B1(Data_i[28]), .Y(
        Data_o[28]) );
  AO22X1TS U65 ( .A0(n4), .A1(Data_i[34]), .B0(n8), .B1(Data_i[26]), .Y(
        Data_o[26]) );
  AO22X1TS U66 ( .A0(n4), .A1(Data_i[32]), .B0(n8), .B1(Data_i[24]), .Y(
        Data_o[24]) );
  AO22X1TS U67 ( .A0(n4), .A1(Data_i[31]), .B0(n8), .B1(Data_i[23]), .Y(
        Data_o[23]) );
  AO22X1TS U68 ( .A0(n4), .A1(Data_i[30]), .B0(n8), .B1(Data_i[22]), .Y(
        Data_o[22]) );
  AO22X1TS U69 ( .A0(n4), .A1(Data_i[29]), .B0(n9), .B1(Data_i[21]), .Y(
        Data_o[21]) );
  AO22X1TS U70 ( .A0(n4), .A1(Data_i[28]), .B0(n8), .B1(Data_i[20]), .Y(
        Data_o[20]) );
  AO22X1TS U71 ( .A0(n4), .A1(Data_i[27]), .B0(n9), .B1(Data_i[19]), .Y(
        Data_o[19]) );
  AO22X1TS U72 ( .A0(n5), .A1(Data_i[26]), .B0(n9), .B1(Data_i[18]), .Y(
        Data_o[18]) );
  AO22X1TS U73 ( .A0(n5), .A1(Data_i[25]), .B0(n9), .B1(Data_i[17]), .Y(
        Data_o[17]) );
  AO22X1TS U74 ( .A0(n5), .A1(Data_i[24]), .B0(n9), .B1(Data_i[16]), .Y(
        Data_o[16]) );
  AO22X1TS U75 ( .A0(n3), .A1(Data_i[35]), .B0(n8), .B1(Data_i[27]), .Y(
        Data_o[27]) );
  INVX2TS U76 ( .A(Data_i[46]), .Y(n20) );
  INVX2TS U77 ( .A(Data_i[45]), .Y(n21) );
  INVX2TS U78 ( .A(Data_i[44]), .Y(n22) );
  INVX2TS U79 ( .A(Data_i[43]), .Y(n23) );
  INVX2TS U80 ( .A(Data_i[42]), .Y(n24) );
  INVX2TS U81 ( .A(Data_i[41]), .Y(n26) );
  INVX2TS U82 ( .A(Data_i[40]), .Y(n27) );
  INVX2TS U83 ( .A(Data_i[47]), .Y(n19) );
  INVX2TS U84 ( .A(Data_i[51]), .Y(n15) );
  INVX2TS U85 ( .A(Data_i[52]), .Y(n14) );
  INVX2TS U86 ( .A(Data_i[50]), .Y(n16) );
  INVX2TS U87 ( .A(Data_i[53]), .Y(n13) );
  INVX2TS U88 ( .A(Data_i[49]), .Y(n17) );
  INVX2TS U89 ( .A(Data_i[54]), .Y(n12) );
  INVX2TS U90 ( .A(Data_i[48]), .Y(n18) );
endmodule


module shift_mux_array_SWR55_LEVEL4 ( Data_i, select_i, bit_shift_i, Data_o );
  input [54:0] Data_i;
  output [54:0] Data_o;
  input select_i, bit_shift_i;
  wire   n2, n1, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12;

  CLKBUFX2TS U1 ( .A(n2), .Y(n1) );
  INVX2TS U2 ( .A(n11), .Y(n3) );
  INVX2TS U3 ( .A(n11), .Y(n4) );
  INVX2TS U4 ( .A(n11), .Y(n5) );
  INVX2TS U5 ( .A(n11), .Y(n6) );
  INVX2TS U6 ( .A(n11), .Y(n7) );
  INVX2TS U7 ( .A(n11), .Y(n8) );
  NAND2X1TS U8 ( .A(bit_shift_i), .B(n9), .Y(n2) );
  OAI2BB1X1TS U9 ( .A0N(n6), .A1N(Data_i[41]), .B0(n1), .Y(Data_o[41]) );
  OAI2BB1X1TS U10 ( .A0N(n7), .A1N(Data_i[43]), .B0(n2), .Y(Data_o[43]) );
  OAI2BB1X1TS U11 ( .A0N(n7), .A1N(Data_i[44]), .B0(n2), .Y(Data_o[44]) );
  OAI2BB1X1TS U12 ( .A0N(n7), .A1N(Data_i[42]), .B0(n2), .Y(Data_o[42]) );
  OAI2BB1X1TS U13 ( .A0N(n8), .A1N(Data_i[45]), .B0(n2), .Y(Data_o[45]) );
  OAI2BB1X1TS U14 ( .A0N(n7), .A1N(Data_i[46]), .B0(n2), .Y(Data_o[46]) );
  OAI2BB1X1TS U15 ( .A0N(n7), .A1N(Data_i[40]), .B0(n2), .Y(Data_o[40]) );
  OAI2BB1X1TS U16 ( .A0N(n8), .A1N(Data_i[47]), .B0(n2), .Y(Data_o[47]) );
  OAI2BB1X1TS U17 ( .A0N(n7), .A1N(Data_i[48]), .B0(n2), .Y(Data_o[48]) );
  OAI2BB1X1TS U18 ( .A0N(n7), .A1N(Data_i[49]), .B0(n2), .Y(Data_o[49]) );
  OAI2BB1X1TS U19 ( .A0N(n7), .A1N(Data_i[50]), .B0(n1), .Y(Data_o[50]) );
  OAI2BB1X1TS U20 ( .A0N(n8), .A1N(Data_i[51]), .B0(n1), .Y(Data_o[51]) );
  OAI2BB1X1TS U21 ( .A0N(n7), .A1N(Data_i[52]), .B0(n1), .Y(Data_o[52]) );
  OAI2BB1X1TS U22 ( .A0N(n8), .A1N(Data_i[53]), .B0(n1), .Y(Data_o[53]) );
  OAI2BB1X1TS U23 ( .A0N(n8), .A1N(Data_i[54]), .B0(n1), .Y(Data_o[54]) );
  CLKBUFX2TS U24 ( .A(n12), .Y(n9) );
  CLKBUFX2TS U25 ( .A(n12), .Y(n10) );
  OAI2BB1X1TS U26 ( .A0N(n7), .A1N(Data_i[39]), .B0(n1), .Y(Data_o[39]) );
  AO22X1TS U27 ( .A0(n10), .A1(Data_i[44]), .B0(n5), .B1(Data_i[28]), .Y(
        Data_o[28]) );
  AO22X1TS U28 ( .A0(n10), .A1(Data_i[45]), .B0(n5), .B1(Data_i[29]), .Y(
        Data_o[29]) );
  AO22X1TS U29 ( .A0(n10), .A1(Data_i[46]), .B0(n5), .B1(Data_i[30]), .Y(
        Data_o[30]) );
  AO22X1TS U30 ( .A0(n10), .A1(Data_i[42]), .B0(n5), .B1(Data_i[26]), .Y(
        Data_o[26]) );
  AO22X1TS U31 ( .A0(n12), .A1(Data_i[41]), .B0(n6), .B1(Data_i[25]), .Y(
        Data_o[25]) );
  AO22X1TS U32 ( .A0(n12), .A1(Data_i[40]), .B0(n6), .B1(Data_i[24]), .Y(
        Data_o[24]) );
  AO22X1TS U33 ( .A0(n12), .A1(Data_i[39]), .B0(n6), .B1(Data_i[23]), .Y(
        Data_o[23]) );
  AO22X1TS U34 ( .A0(n11), .A1(Data_i[38]), .B0(n6), .B1(Data_i[22]), .Y(
        Data_o[22]) );
  AO22X1TS U35 ( .A0(n12), .A1(Data_i[37]), .B0(n6), .B1(Data_i[21]), .Y(
        Data_o[21]) );
  AO22X1TS U36 ( .A0(select_i), .A1(Data_i[36]), .B0(n6), .B1(Data_i[20]), .Y(
        Data_o[20]) );
  AO22X1TS U37 ( .A0(select_i), .A1(Data_i[35]), .B0(n6), .B1(Data_i[19]), .Y(
        Data_o[19]) );
  AO22X1TS U38 ( .A0(n12), .A1(Data_i[34]), .B0(n6), .B1(Data_i[18]), .Y(
        Data_o[18]) );
  AO22X1TS U39 ( .A0(n12), .A1(Data_i[33]), .B0(n6), .B1(Data_i[17]), .Y(
        Data_o[17]) );
  AO22X1TS U40 ( .A0(select_i), .A1(Data_i[32]), .B0(n4), .B1(Data_i[16]), .Y(
        Data_o[16]) );
  AO22X1TS U41 ( .A0(n9), .A1(Data_i[54]), .B0(n5), .B1(Data_i[38]), .Y(
        Data_o[38]) );
  AO22X1TS U42 ( .A0(n9), .A1(Data_i[53]), .B0(n4), .B1(Data_i[37]), .Y(
        Data_o[37]) );
  AO22X1TS U43 ( .A0(n10), .A1(Data_i[52]), .B0(n4), .B1(Data_i[36]), .Y(
        Data_o[36]) );
  AO22X1TS U44 ( .A0(n9), .A1(Data_i[51]), .B0(n4), .B1(Data_i[35]), .Y(
        Data_o[35]) );
  AO22X1TS U45 ( .A0(n9), .A1(Data_i[50]), .B0(n5), .B1(Data_i[34]), .Y(
        Data_o[34]) );
  AO22X1TS U46 ( .A0(n10), .A1(Data_i[49]), .B0(n5), .B1(Data_i[33]), .Y(
        Data_o[33]) );
  AO22X1TS U47 ( .A0(n10), .A1(Data_i[48]), .B0(n5), .B1(Data_i[32]), .Y(
        Data_o[32]) );
  AO22X1TS U48 ( .A0(n10), .A1(Data_i[47]), .B0(n5), .B1(Data_i[31]), .Y(
        Data_o[31]) );
  CLKBUFX2TS U49 ( .A(select_i), .Y(n12) );
  CLKBUFX2TS U50 ( .A(select_i), .Y(n11) );
  AO22X1TS U51 ( .A0(n12), .A1(Data_i[31]), .B0(Data_i[15]), .B1(n3), .Y(
        Data_o[15]) );
  AO22X1TS U52 ( .A0(select_i), .A1(Data_i[30]), .B0(Data_i[14]), .B1(n3), .Y(
        Data_o[14]) );
  AO22X1TS U53 ( .A0(select_i), .A1(Data_i[29]), .B0(Data_i[13]), .B1(n3), .Y(
        Data_o[13]) );
  AO22X1TS U54 ( .A0(select_i), .A1(Data_i[28]), .B0(Data_i[12]), .B1(n3), .Y(
        Data_o[12]) );
  AO22X1TS U55 ( .A0(select_i), .A1(Data_i[27]), .B0(Data_i[11]), .B1(n3), .Y(
        Data_o[11]) );
  AO22X1TS U56 ( .A0(select_i), .A1(Data_i[26]), .B0(Data_i[10]), .B1(n3), .Y(
        Data_o[10]) );
  AO22X1TS U57 ( .A0(Data_i[25]), .A1(n11), .B0(Data_i[9]), .B1(n4), .Y(
        Data_o[9]) );
  AO22X1TS U58 ( .A0(n11), .A1(Data_i[24]), .B0(Data_i[8]), .B1(n3), .Y(
        Data_o[8]) );
  AO22X1TS U59 ( .A0(n9), .A1(Data_i[23]), .B0(Data_i[7]), .B1(n3), .Y(
        Data_o[7]) );
  AO22X1TS U60 ( .A0(n9), .A1(Data_i[22]), .B0(Data_i[6]), .B1(n4), .Y(
        Data_o[6]) );
  AO22X1TS U61 ( .A0(n9), .A1(Data_i[21]), .B0(Data_i[5]), .B1(n4), .Y(
        Data_o[5]) );
  AO22X1TS U62 ( .A0(n9), .A1(Data_i[20]), .B0(Data_i[4]), .B1(n4), .Y(
        Data_o[4]) );
  AO22X1TS U63 ( .A0(n9), .A1(Data_i[19]), .B0(Data_i[3]), .B1(n4), .Y(
        Data_o[3]) );
  AO22X1TS U64 ( .A0(n10), .A1(Data_i[18]), .B0(Data_i[2]), .B1(n4), .Y(
        Data_o[2]) );
  AO22X1TS U65 ( .A0(n12), .A1(Data_i[17]), .B0(Data_i[1]), .B1(n3), .Y(
        Data_o[1]) );
  AO22X1TS U66 ( .A0(n11), .A1(Data_i[16]), .B0(Data_i[0]), .B1(n3), .Y(
        Data_o[0]) );
  AO22X1TS U67 ( .A0(n10), .A1(Data_i[43]), .B0(n5), .B1(Data_i[27]), .Y(
        Data_o[27]) );
endmodule


module shift_mux_array_SWR55_LEVEL5 ( Data_i, select_i, bit_shift_i, Data_o );
  input [54:0] Data_i;
  output [54:0] Data_o;
  input select_i, bit_shift_i;
  wire   n2, n1, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13;

  NAND2X1TS U1 ( .A(bit_shift_i), .B(select_i), .Y(n2) );
  OAI2BB1X1TS U2 ( .A0N(n9), .A1N(Data_i[40]), .B0(n3), .Y(Data_o[40]) );
  OAI2BB1X1TS U3 ( .A0N(n9), .A1N(Data_i[41]), .B0(n3), .Y(Data_o[41]) );
  OAI2BB1X1TS U4 ( .A0N(n9), .A1N(Data_i[42]), .B0(n3), .Y(Data_o[42]) );
  OAI2BB1X1TS U5 ( .A0N(n9), .A1N(Data_i[43]), .B0(n4), .Y(Data_o[43]) );
  OAI2BB1X1TS U6 ( .A0N(n9), .A1N(Data_i[44]), .B0(n4), .Y(Data_o[44]) );
  OAI2BB1X1TS U7 ( .A0N(n9), .A1N(Data_i[45]), .B0(n4), .Y(Data_o[45]) );
  OAI2BB1X1TS U8 ( .A0N(n9), .A1N(Data_i[46]), .B0(n4), .Y(Data_o[46]) );
  OAI2BB1X1TS U9 ( .A0N(n8), .A1N(Data_i[47]), .B0(n4), .Y(Data_o[47]) );
  OAI2BB1X1TS U10 ( .A0N(n9), .A1N(Data_i[48]), .B0(n4), .Y(Data_o[48]) );
  OAI2BB1X1TS U11 ( .A0N(n8), .A1N(Data_i[49]), .B0(n4), .Y(Data_o[49]) );
  OAI2BB1X1TS U12 ( .A0N(n8), .A1N(Data_i[50]), .B0(n4), .Y(Data_o[50]) );
  OAI2BB1X1TS U13 ( .A0N(n8), .A1N(Data_i[51]), .B0(n4), .Y(Data_o[51]) );
  OAI2BB1X1TS U14 ( .A0N(n8), .A1N(Data_i[52]), .B0(n4), .Y(Data_o[52]) );
  OAI2BB1X1TS U15 ( .A0N(n8), .A1N(Data_i[53]), .B0(n2), .Y(Data_o[53]) );
  OAI2BB1X1TS U16 ( .A0N(n8), .A1N(Data_i[54]), .B0(n2), .Y(Data_o[54]) );
  CLKBUFX2TS U17 ( .A(n2), .Y(n3) );
  CLKBUFX2TS U18 ( .A(n2), .Y(n4) );
  CLKBUFX2TS U19 ( .A(n2), .Y(n1) );
  INVX2TS U20 ( .A(n5), .Y(n7) );
  INVX2TS U21 ( .A(n5), .Y(n6) );
  INVX2TS U22 ( .A(n5), .Y(n8) );
  INVX2TS U23 ( .A(n5), .Y(n9) );
  INVX2TS U24 ( .A(select_i), .Y(n10) );
  INVX2TS U25 ( .A(select_i), .Y(n11) );
  OAI2BB1X1TS U26 ( .A0N(n9), .A1N(Data_i[39]), .B0(n3), .Y(Data_o[39]) );
  OAI2BB1X1TS U27 ( .A0N(n10), .A1N(Data_i[32]), .B0(n1), .Y(Data_o[32]) );
  OAI2BB1X1TS U28 ( .A0N(n10), .A1N(Data_i[33]), .B0(n3), .Y(Data_o[33]) );
  OAI2BB1X1TS U29 ( .A0N(n10), .A1N(Data_i[34]), .B0(n3), .Y(Data_o[34]) );
  OAI2BB1X1TS U30 ( .A0N(n10), .A1N(Data_i[35]), .B0(n3), .Y(Data_o[35]) );
  OAI2BB1X1TS U31 ( .A0N(n10), .A1N(Data_i[36]), .B0(n3), .Y(Data_o[36]) );
  OAI2BB1X1TS U32 ( .A0N(n10), .A1N(Data_i[37]), .B0(n3), .Y(Data_o[37]) );
  OAI2BB1X1TS U33 ( .A0N(n9), .A1N(Data_i[38]), .B0(n3), .Y(Data_o[38]) );
  CLKBUFX2TS U34 ( .A(select_i), .Y(n12) );
  OAI2BB1X1TS U35 ( .A0N(Data_i[28]), .A1N(n10), .B0(n1), .Y(Data_o[28]) );
  OAI2BB1X1TS U36 ( .A0N(Data_i[29]), .A1N(n10), .B0(n1), .Y(Data_o[29]) );
  OAI2BB1X1TS U37 ( .A0N(Data_i[30]), .A1N(n10), .B0(n1), .Y(Data_o[30]) );
  OAI2BB1X1TS U38 ( .A0N(Data_i[26]), .A1N(n11), .B0(n1), .Y(Data_o[26]) );
  OAI2BB1X1TS U39 ( .A0N(Data_i[25]), .A1N(n11), .B0(n1), .Y(Data_o[25]) );
  OAI2BB1X1TS U40 ( .A0N(Data_i[24]), .A1N(n11), .B0(n1), .Y(Data_o[24]) );
  OAI2BB1X1TS U41 ( .A0N(Data_i[23]), .A1N(n11), .B0(n1), .Y(Data_o[23]) );
  AO22X1TS U42 ( .A0(n13), .A1(Data_i[54]), .B0(Data_i[22]), .B1(n7), .Y(
        Data_o[22]) );
  AO22X1TS U43 ( .A0(n13), .A1(Data_i[53]), .B0(Data_i[21]), .B1(n7), .Y(
        Data_o[21]) );
  AO22X1TS U44 ( .A0(n13), .A1(Data_i[52]), .B0(Data_i[20]), .B1(n7), .Y(
        Data_o[20]) );
  AO22X1TS U45 ( .A0(n12), .A1(Data_i[51]), .B0(Data_i[19]), .B1(n7), .Y(
        Data_o[19]) );
  AO22X1TS U46 ( .A0(n12), .A1(Data_i[50]), .B0(Data_i[18]), .B1(n6), .Y(
        Data_o[18]) );
  AO22X1TS U47 ( .A0(n12), .A1(Data_i[49]), .B0(Data_i[17]), .B1(n6), .Y(
        Data_o[17]) );
  AO22X1TS U48 ( .A0(n12), .A1(Data_i[48]), .B0(Data_i[16]), .B1(n6), .Y(
        Data_o[16]) );
  OAI2BB1X1TS U49 ( .A0N(Data_i[31]), .A1N(n10), .B0(n1), .Y(Data_o[31]) );
  CLKBUFX2TS U50 ( .A(n5), .Y(n13) );
  CLKBUFX2TS U51 ( .A(select_i), .Y(n5) );
  AO22X1TS U52 ( .A0(n12), .A1(Data_i[47]), .B0(Data_i[15]), .B1(n6), .Y(
        Data_o[15]) );
  AO22X1TS U53 ( .A0(n12), .A1(Data_i[46]), .B0(Data_i[14]), .B1(n6), .Y(
        Data_o[14]) );
  AO22X1TS U54 ( .A0(n12), .A1(Data_i[45]), .B0(Data_i[13]), .B1(n6), .Y(
        Data_o[13]) );
  AO22X1TS U55 ( .A0(n12), .A1(Data_i[44]), .B0(Data_i[12]), .B1(n6), .Y(
        Data_o[12]) );
  AO22X1TS U56 ( .A0(n13), .A1(Data_i[43]), .B0(Data_i[11]), .B1(n6), .Y(
        Data_o[11]) );
  AO22X1TS U57 ( .A0(n12), .A1(Data_i[42]), .B0(Data_i[10]), .B1(n6), .Y(
        Data_o[10]) );
  AO22X1TS U58 ( .A0(Data_i[41]), .A1(n13), .B0(Data_i[9]), .B1(n8), .Y(
        Data_o[9]) );
  AO22X1TS U59 ( .A0(select_i), .A1(Data_i[40]), .B0(Data_i[8]), .B1(n7), .Y(
        Data_o[8]) );
  AO22X1TS U60 ( .A0(n13), .A1(Data_i[39]), .B0(Data_i[7]), .B1(n7), .Y(
        Data_o[7]) );
  AO22X1TS U61 ( .A0(select_i), .A1(Data_i[38]), .B0(Data_i[6]), .B1(n7), .Y(
        Data_o[6]) );
  AO22X1TS U62 ( .A0(select_i), .A1(Data_i[37]), .B0(Data_i[5]), .B1(n7), .Y(
        Data_o[5]) );
  AO22X1TS U63 ( .A0(select_i), .A1(Data_i[36]), .B0(Data_i[4]), .B1(n8), .Y(
        Data_o[4]) );
  AO22X1TS U64 ( .A0(select_i), .A1(Data_i[35]), .B0(Data_i[3]), .B1(n8), .Y(
        Data_o[3]) );
  AO22X1TS U65 ( .A0(n13), .A1(Data_i[34]), .B0(Data_i[2]), .B1(n7), .Y(
        Data_o[2]) );
  AO22X1TS U66 ( .A0(n12), .A1(Data_i[33]), .B0(Data_i[1]), .B1(n7), .Y(
        Data_o[1]) );
  AO22X1TS U67 ( .A0(n13), .A1(Data_i[32]), .B0(Data_i[0]), .B1(n6), .Y(
        Data_o[0]) );
  OAI2BB1X1TS U68 ( .A0N(Data_i[27]), .A1N(n11), .B0(n1), .Y(Data_o[27]) );
endmodule


module Multiplexer_AC_W1_105 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_104 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_103 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_102 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_101 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_100 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_99 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_98 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_97 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_96 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_95 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_94 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_93 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_92 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_91 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_90 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_89 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_88 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_87 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_86 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_85 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_84 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_83 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_82 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_81 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_80 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_79 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_78 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_77 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_76 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_75 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_74 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_73 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_72 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_71 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_70 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_69 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_68 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_67 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_66 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_65 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_64 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_63 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_62 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_61 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_60 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_59 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_58 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_57 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_56 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_55 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_54 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_53 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_52 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Rotate_Mux_Array_SWR55_0 ( Data_i, select_i, Data_o );
  input [54:0] Data_i;
  output [54:0] Data_o;
  input select_i;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12;
  assign Data_o[27] = Data_i[27];

  Multiplexer_AC_W1_105 MUX_ARRAY_0__MUX_ARRAY12_rotate_mux ( .ctrl(n2), .D0(
        Data_i[0]), .D1(Data_i[54]), .S(Data_o[0]) );
  Multiplexer_AC_W1_104 MUX_ARRAY_1__MUX_ARRAY12_rotate_mux ( .ctrl(n2), .D0(
        Data_i[1]), .D1(Data_i[53]), .S(Data_o[1]) );
  Multiplexer_AC_W1_103 MUX_ARRAY_2__MUX_ARRAY12_rotate_mux ( .ctrl(n2), .D0(
        Data_i[2]), .D1(Data_i[52]), .S(Data_o[2]) );
  Multiplexer_AC_W1_102 MUX_ARRAY_3__MUX_ARRAY12_rotate_mux ( .ctrl(n2), .D0(
        Data_i[3]), .D1(Data_i[51]), .S(Data_o[3]) );
  Multiplexer_AC_W1_101 MUX_ARRAY_4__MUX_ARRAY12_rotate_mux ( .ctrl(n2), .D0(
        Data_i[4]), .D1(Data_i[50]), .S(Data_o[4]) );
  Multiplexer_AC_W1_100 MUX_ARRAY_5__MUX_ARRAY12_rotate_mux ( .ctrl(n3), .D0(
        Data_i[5]), .D1(Data_i[49]), .S(Data_o[5]) );
  Multiplexer_AC_W1_99 MUX_ARRAY_6__MUX_ARRAY12_rotate_mux ( .ctrl(n3), .D0(
        Data_i[6]), .D1(Data_i[48]), .S(Data_o[6]) );
  Multiplexer_AC_W1_98 MUX_ARRAY_7__MUX_ARRAY12_rotate_mux ( .ctrl(n3), .D0(
        Data_i[7]), .D1(Data_i[47]), .S(Data_o[7]) );
  Multiplexer_AC_W1_97 MUX_ARRAY_8__MUX_ARRAY12_rotate_mux ( .ctrl(n3), .D0(
        Data_i[8]), .D1(Data_i[46]), .S(Data_o[8]) );
  Multiplexer_AC_W1_96 MUX_ARRAY_9__MUX_ARRAY12_rotate_mux ( .ctrl(n3), .D0(
        Data_i[9]), .D1(Data_i[45]), .S(Data_o[9]) );
  Multiplexer_AC_W1_95 MUX_ARRAY_10__MUX_ARRAY12_rotate_mux ( .ctrl(n4), .D0(
        Data_i[10]), .D1(Data_i[44]), .S(Data_o[10]) );
  Multiplexer_AC_W1_94 MUX_ARRAY_11__MUX_ARRAY12_rotate_mux ( .ctrl(n4), .D0(
        Data_i[11]), .D1(Data_i[43]), .S(Data_o[11]) );
  Multiplexer_AC_W1_93 MUX_ARRAY_12__MUX_ARRAY12_rotate_mux ( .ctrl(n4), .D0(
        Data_i[12]), .D1(Data_i[42]), .S(Data_o[12]) );
  Multiplexer_AC_W1_92 MUX_ARRAY_13__MUX_ARRAY12_rotate_mux ( .ctrl(n4), .D0(
        Data_i[13]), .D1(Data_i[41]), .S(Data_o[13]) );
  Multiplexer_AC_W1_91 MUX_ARRAY_14__MUX_ARRAY12_rotate_mux ( .ctrl(n4), .D0(
        Data_i[14]), .D1(Data_i[40]), .S(Data_o[14]) );
  Multiplexer_AC_W1_90 MUX_ARRAY_15__MUX_ARRAY12_rotate_mux ( .ctrl(n5), .D0(
        Data_i[15]), .D1(Data_i[39]), .S(Data_o[15]) );
  Multiplexer_AC_W1_89 MUX_ARRAY_16__MUX_ARRAY12_rotate_mux ( .ctrl(n5), .D0(
        Data_i[16]), .D1(Data_i[38]), .S(Data_o[16]) );
  Multiplexer_AC_W1_88 MUX_ARRAY_17__MUX_ARRAY12_rotate_mux ( .ctrl(n5), .D0(
        Data_i[17]), .D1(Data_i[37]), .S(Data_o[17]) );
  Multiplexer_AC_W1_87 MUX_ARRAY_18__MUX_ARRAY12_rotate_mux ( .ctrl(n5), .D0(
        Data_i[18]), .D1(Data_i[36]), .S(Data_o[18]) );
  Multiplexer_AC_W1_86 MUX_ARRAY_19__MUX_ARRAY12_rotate_mux ( .ctrl(n5), .D0(
        Data_i[19]), .D1(Data_i[35]), .S(Data_o[19]) );
  Multiplexer_AC_W1_85 MUX_ARRAY_20__MUX_ARRAY12_rotate_mux ( .ctrl(n6), .D0(
        Data_i[20]), .D1(Data_i[34]), .S(Data_o[20]) );
  Multiplexer_AC_W1_84 MUX_ARRAY_21__MUX_ARRAY12_rotate_mux ( .ctrl(n6), .D0(
        Data_i[21]), .D1(Data_i[33]), .S(Data_o[21]) );
  Multiplexer_AC_W1_83 MUX_ARRAY_22__MUX_ARRAY12_rotate_mux ( .ctrl(n6), .D0(
        Data_i[22]), .D1(Data_i[32]), .S(Data_o[22]) );
  Multiplexer_AC_W1_82 MUX_ARRAY_23__MUX_ARRAY12_rotate_mux ( .ctrl(n6), .D0(
        Data_i[23]), .D1(Data_i[31]), .S(Data_o[23]) );
  Multiplexer_AC_W1_81 MUX_ARRAY_24__MUX_ARRAY12_rotate_mux ( .ctrl(n6), .D0(
        Data_i[24]), .D1(Data_i[30]), .S(Data_o[24]) );
  Multiplexer_AC_W1_80 MUX_ARRAY_25__MUX_ARRAY12_rotate_mux ( .ctrl(n7), .D0(
        Data_i[25]), .D1(Data_i[29]), .S(Data_o[25]) );
  Multiplexer_AC_W1_79 MUX_ARRAY_26__MUX_ARRAY12_rotate_mux ( .ctrl(n7), .D0(
        Data_i[26]), .D1(Data_i[28]), .S(Data_o[26]) );
  Multiplexer_AC_W1_78 MUX_ARRAY_28__MUX_ARRAY12_rotate_mux ( .ctrl(n7), .D0(
        Data_i[28]), .D1(Data_i[26]), .S(Data_o[28]) );
  Multiplexer_AC_W1_77 MUX_ARRAY_29__MUX_ARRAY12_rotate_mux ( .ctrl(n7), .D0(
        Data_i[29]), .D1(Data_i[25]), .S(Data_o[29]) );
  Multiplexer_AC_W1_76 MUX_ARRAY_30__MUX_ARRAY12_rotate_mux ( .ctrl(n7), .D0(
        Data_i[30]), .D1(Data_i[24]), .S(Data_o[30]) );
  Multiplexer_AC_W1_75 MUX_ARRAY_31__MUX_ARRAY12_rotate_mux ( .ctrl(n8), .D0(
        Data_i[31]), .D1(Data_i[23]), .S(Data_o[31]) );
  Multiplexer_AC_W1_74 MUX_ARRAY_32__MUX_ARRAY12_rotate_mux ( .ctrl(n8), .D0(
        Data_i[32]), .D1(Data_i[22]), .S(Data_o[32]) );
  Multiplexer_AC_W1_73 MUX_ARRAY_33__MUX_ARRAY12_rotate_mux ( .ctrl(n8), .D0(
        Data_i[33]), .D1(Data_i[21]), .S(Data_o[33]) );
  Multiplexer_AC_W1_72 MUX_ARRAY_34__MUX_ARRAY12_rotate_mux ( .ctrl(n8), .D0(
        Data_i[34]), .D1(Data_i[20]), .S(Data_o[34]) );
  Multiplexer_AC_W1_71 MUX_ARRAY_35__MUX_ARRAY12_rotate_mux ( .ctrl(n8), .D0(
        Data_i[35]), .D1(Data_i[19]), .S(Data_o[35]) );
  Multiplexer_AC_W1_70 MUX_ARRAY_36__MUX_ARRAY12_rotate_mux ( .ctrl(n9), .D0(
        Data_i[36]), .D1(Data_i[18]), .S(Data_o[36]) );
  Multiplexer_AC_W1_69 MUX_ARRAY_37__MUX_ARRAY12_rotate_mux ( .ctrl(n9), .D0(
        Data_i[37]), .D1(Data_i[17]), .S(Data_o[37]) );
  Multiplexer_AC_W1_68 MUX_ARRAY_38__MUX_ARRAY12_rotate_mux ( .ctrl(n9), .D0(
        Data_i[38]), .D1(Data_i[16]), .S(Data_o[38]) );
  Multiplexer_AC_W1_67 MUX_ARRAY_39__MUX_ARRAY12_rotate_mux ( .ctrl(n9), .D0(
        Data_i[39]), .D1(Data_i[15]), .S(Data_o[39]) );
  Multiplexer_AC_W1_66 MUX_ARRAY_40__MUX_ARRAY12_rotate_mux ( .ctrl(n9), .D0(
        Data_i[40]), .D1(Data_i[14]), .S(Data_o[40]) );
  Multiplexer_AC_W1_65 MUX_ARRAY_41__MUX_ARRAY12_rotate_mux ( .ctrl(n11), .D0(
        Data_i[41]), .D1(Data_i[13]), .S(Data_o[41]) );
  Multiplexer_AC_W1_64 MUX_ARRAY_42__MUX_ARRAY12_rotate_mux ( .ctrl(n10), .D0(
        Data_i[42]), .D1(Data_i[12]), .S(Data_o[42]) );
  Multiplexer_AC_W1_63 MUX_ARRAY_43__MUX_ARRAY12_rotate_mux ( .ctrl(n10), .D0(
        Data_i[43]), .D1(Data_i[11]), .S(Data_o[43]) );
  Multiplexer_AC_W1_62 MUX_ARRAY_44__MUX_ARRAY12_rotate_mux ( .ctrl(n12), .D0(
        Data_i[44]), .D1(Data_i[10]), .S(Data_o[44]) );
  Multiplexer_AC_W1_61 MUX_ARRAY_45__MUX_ARRAY12_rotate_mux ( .ctrl(n1), .D0(
        Data_i[45]), .D1(Data_i[9]), .S(Data_o[45]) );
  Multiplexer_AC_W1_60 MUX_ARRAY_46__MUX_ARRAY12_rotate_mux ( .ctrl(n12), .D0(
        Data_i[46]), .D1(Data_i[8]), .S(Data_o[46]) );
  Multiplexer_AC_W1_59 MUX_ARRAY_47__MUX_ARRAY12_rotate_mux ( .ctrl(n10), .D0(
        Data_i[47]), .D1(Data_i[7]), .S(Data_o[47]) );
  Multiplexer_AC_W1_58 MUX_ARRAY_48__MUX_ARRAY12_rotate_mux ( .ctrl(n1), .D0(
        Data_i[48]), .D1(Data_i[6]), .S(Data_o[48]) );
  Multiplexer_AC_W1_57 MUX_ARRAY_49__MUX_ARRAY12_rotate_mux ( .ctrl(n12), .D0(
        Data_i[49]), .D1(Data_i[5]), .S(Data_o[49]) );
  Multiplexer_AC_W1_56 MUX_ARRAY_50__MUX_ARRAY12_rotate_mux ( .ctrl(n11), .D0(
        Data_i[50]), .D1(Data_i[4]), .S(Data_o[50]) );
  Multiplexer_AC_W1_55 MUX_ARRAY_51__MUX_ARRAY12_rotate_mux ( .ctrl(n11), .D0(
        Data_i[51]), .D1(Data_i[3]), .S(Data_o[51]) );
  Multiplexer_AC_W1_54 MUX_ARRAY_52__MUX_ARRAY12_rotate_mux ( .ctrl(n10), .D0(
        Data_i[52]), .D1(Data_i[2]), .S(Data_o[52]) );
  Multiplexer_AC_W1_53 MUX_ARRAY_53__MUX_ARRAY12_rotate_mux ( .ctrl(n1), .D0(
        Data_i[53]), .D1(Data_i[1]), .S(Data_o[53]) );
  Multiplexer_AC_W1_52 MUX_ARRAY_54__MUX_ARRAY12_rotate_mux ( .ctrl(n11), .D0(
        Data_i[54]), .D1(Data_i[0]), .S(Data_o[54]) );
  CLKBUFX2TS U1 ( .A(n12), .Y(n9) );
  CLKBUFX2TS U2 ( .A(n12), .Y(n8) );
  CLKBUFX2TS U3 ( .A(n12), .Y(n7) );
  CLKBUFX2TS U4 ( .A(n10), .Y(n6) );
  CLKBUFX2TS U5 ( .A(n10), .Y(n5) );
  CLKBUFX2TS U6 ( .A(n11), .Y(n4) );
  CLKBUFX2TS U7 ( .A(n11), .Y(n3) );
  CLKBUFX2TS U8 ( .A(n12), .Y(n2) );
  CLKBUFX2TS U9 ( .A(n1), .Y(n12) );
  CLKBUFX2TS U10 ( .A(n1), .Y(n10) );
  CLKBUFX2TS U11 ( .A(n1), .Y(n11) );
  CLKBUFX2TS U12 ( .A(select_i), .Y(n1) );
endmodule


module Mux_Array_SWR55_EWR6 ( clk, rst, load_i, Data_i, FSM_left_right_i, 
        Shift_Value_i, bit_shift_i, Data_o );
  input [54:0] Data_i;
  input [5:0] Shift_Value_i;
  output [54:0] Data_o;
  input clk, rst, load_i, FSM_left_right_i, bit_shift_i;

  wire   [439:0] Data_array;

  Rotate_Mux_Array_SWR55_1 first_rotate ( .Data_i(Data_i), .select_i(
        FSM_left_right_i), .Data_o(Data_array[54:0]) );
  shift_mux_array_SWR55_LEVEL0 SHIFT_1LVLS_0__shift_mux_array ( .Data_i(
        Data_array[54:0]), .select_i(Shift_Value_i[0]), .bit_shift_i(
        bit_shift_i), .Data_o(Data_array[109:55]) );
  shift_mux_array_SWR55_LEVEL1 SHIFT_1LVLS_1__shift_mux_array ( .Data_i(
        Data_array[109:55]), .select_i(Shift_Value_i[1]), .bit_shift_i(
        bit_shift_i), .Data_o(Data_array[164:110]) );
  shift_mux_array_SWR55_LEVEL2 SHIFT_1LVLS_2__shift_mux_array ( .Data_i(
        Data_array[164:110]), .select_i(Shift_Value_i[2]), .bit_shift_i(
        bit_shift_i), .Data_o(Data_array[219:165]) );
  RegisterAdd_W55_0 Mid_Reg ( .clk(clk), .rst(rst), .load(1'b1), .D(
        Data_array[219:165]), .Q(Data_array[274:220]) );
  shift_mux_array_SWR55_LEVEL3 SHIFT_2LVLS_3__shift_mux_array ( .Data_i(
        Data_array[274:220]), .select_i(Shift_Value_i[3]), .bit_shift_i(
        bit_shift_i), .Data_o(Data_array[329:275]) );
  shift_mux_array_SWR55_LEVEL4 SHIFT_2LVLS_4__shift_mux_array ( .Data_i(
        Data_array[329:275]), .select_i(Shift_Value_i[4]), .bit_shift_i(
        bit_shift_i), .Data_o(Data_array[384:330]) );
  shift_mux_array_SWR55_LEVEL5 SHIFT_2LVLS_5__shift_mux_array ( .Data_i(
        Data_array[384:330]), .select_i(Shift_Value_i[5]), .bit_shift_i(
        bit_shift_i), .Data_o(Data_array[439:385]) );
  Rotate_Mux_Array_SWR55_0 last_rotate ( .Data_i(Data_array[439:385]), 
        .select_i(FSM_left_right_i), .Data_o(Data_o) );
endmodule


module FPU_Add_Subtract_Function_W64_EW11_SW52_SWR55_EWR6_DW01_sub_0 ( A, B, 
        CI, DIFF, CO );
  input [55:0] A;
  input [55:0] B;
  output [55:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n63, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74,
         n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88,
         n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101,
         n102, n103, n104, n105, n106, n107, n108, n109, n110, n111, n112,
         n113, n114, n115, n116, n117, n118, n119, n120, n121, n122, n123,
         n124, n125, n126, n127, n128, n129, n130, n131, n132, n133, n134,
         n136, n137, n138, n139, n140, n141, n142, n143, n144, n145, n146,
         n147, n148, n149, n151, n152, n153, n154, n155, n156, n157, n158,
         n159, n160, n161, n163, n164, n165, n166, n167, n168, n169, n170,
         n171, n172, n173, n174, n176, n177, n178, n179, n180, n181, n182,
         n183, n184, n185, n186, n187, n188, n189, n190, n191, n192, n193,
         n194, n195, n196, n197, n198, n199, n200, n201, n202, n203, n204,
         n205, n207, n208, n209, n210, n211, n212, n213, n214, n215, n216,
         n217, n218, n219, n220, n221, n222, n223, n225, n226, n227, n229,
         n230, n231, n233, n234, n235, n238, n240, n242, n244, n247, n250,
         n254, n255, n256, n257, n258, n259, n260, n261, n262, n263, n264,
         n265, n266, n267, n268, n269, n270, n271, n272, n273, n274, n275,
         n276, n277, n278, n279, n280, n281, n282, n283, n284, n285, n286,
         n287, n288, n289, n290, n291, n292, n293, n294, n295, n296, n297,
         n298, n299, n300, n301, n302, n303, n304, n305, n306, n307, n308,
         n483;

  CMPR32X2TS U2 ( .A(n254), .B(A[54]), .C(n32), .CO(n31), .S(DIFF[54]) );
  AFHCINX2TS U4 ( .CIN(n34), .B(A[52]), .A(n256), .S(DIFF[52]), .CO(n33) );
  AFHCONX2TS U5 ( .A(n257), .B(A[51]), .CI(n35), .CON(n34), .S(DIFF[51]) );
  AFHCINX2TS U6 ( .CIN(n36), .B(A[50]), .A(n258), .S(DIFF[50]), .CO(n35) );
  AFHCONX2TS U7 ( .A(n259), .B(A[49]), .CI(n37), .CON(n36), .S(DIFF[49]) );
  AFHCINX2TS U8 ( .CIN(n38), .B(A[48]), .A(n260), .S(DIFF[48]), .CO(n37) );
  AFHCONX2TS U9 ( .A(n261), .B(A[47]), .CI(n39), .CON(n38), .S(DIFF[47]) );
  AFHCINX2TS U10 ( .CIN(n40), .B(A[46]), .A(n262), .S(DIFF[46]), .CO(n39) );
  AFHCONX2TS U11 ( .A(n263), .B(A[45]), .CI(n41), .CON(n40), .S(DIFF[45]) );
  AFHCINX2TS U12 ( .CIN(n42), .B(A[44]), .A(n264), .S(DIFF[44]), .CO(n41) );
  AFHCONX2TS U13 ( .A(n265), .B(A[43]), .CI(n43), .CON(n42), .S(DIFF[43]) );
  AFHCINX2TS U14 ( .CIN(n44), .B(A[42]), .A(n266), .S(DIFF[42]), .CO(n43) );
  AFHCONX2TS U15 ( .A(n267), .B(A[41]), .CI(n45), .CON(n44), .S(DIFF[41]) );
  AFHCINX2TS U16 ( .CIN(n46), .B(A[40]), .A(n268), .S(DIFF[40]), .CO(n45) );
  AFHCONX2TS U17 ( .A(n269), .B(A[39]), .CI(n47), .CON(n46), .S(DIFF[39]) );
  AFHCINX2TS U18 ( .CIN(n48), .B(A[38]), .A(n270), .S(DIFF[38]), .CO(n47) );
  AFHCONX2TS U19 ( .A(n271), .B(A[37]), .CI(n49), .CON(n48), .S(DIFF[37]) );
  AFHCINX2TS U20 ( .CIN(n50), .B(A[36]), .A(n272), .S(DIFF[36]), .CO(n49) );
  AFHCONX2TS U21 ( .A(n273), .B(A[35]), .CI(n51), .CON(n50), .S(DIFF[35]) );
  AFHCINX2TS U22 ( .CIN(n52), .B(A[34]), .A(n274), .S(DIFF[34]), .CO(n51) );
  AFHCONX2TS U23 ( .A(n275), .B(A[33]), .CI(n53), .CON(n52), .S(DIFF[33]) );
  AFHCINX2TS U24 ( .CIN(n54), .B(A[32]), .A(n276), .S(DIFF[32]), .CO(n53) );
  AFHCONX2TS U25 ( .A(n277), .B(A[31]), .CI(n55), .CON(n54), .S(DIFF[31]) );
  XOR2X1TS U26 ( .A(n66), .B(n1), .Y(DIFF[30]) );
  XOR2X1TS U67 ( .A(n87), .B(n5), .Y(DIFF[26]) );
  XOR2X1TS U100 ( .A(n108), .B(n9), .Y(DIFF[22]) );
  XOR2X1TS U133 ( .A(n129), .B(n13), .Y(DIFF[18]) );
  XOR2X1TS U139 ( .A(n134), .B(n14), .Y(DIFF[17]) );
  XOR2X1TS U155 ( .A(n149), .B(n16), .Y(DIFF[15]) );
  XOR2X1TS U176 ( .A(n161), .B(n18), .Y(DIFF[13]) );
  XOR2X1TS U186 ( .A(n166), .B(n19), .Y(DIFF[12]) );
  XOR2X1TS U194 ( .A(n174), .B(n20), .Y(DIFF[11]) );
  XOR2X1TS U223 ( .A(n189), .B(n23), .Y(DIFF[8]) );
  XOR2X1TS U240 ( .A(n200), .B(n25), .Y(DIFF[6]) );
  XOR2X1TS U246 ( .A(n205), .B(n26), .Y(DIFF[5]) );
  XOR2X1TS U271 ( .A(n29), .B(n219), .Y(DIFF[2]) );
  XOR2X1TS U277 ( .A(n30), .B(n223), .Y(DIFF[1]) );
  OAI21X1TS U344 ( .A0(n211), .A1(n191), .B0(n192), .Y(n190) );
  AOI21X1TS U345 ( .A0(n122), .A1(n131), .B0(n123), .Y(n121) );
  NOR2X1TS U346 ( .A(A[25]), .B(n283), .Y(n90) );
  NOR2X1TS U347 ( .A(A[11]), .B(n297), .Y(n172) );
  NOR2X1TS U348 ( .A(A[18]), .B(n290), .Y(n127) );
  NOR2X1TS U349 ( .A(A[7]), .B(n301), .Y(n195) );
  NOR2X1TS U350 ( .A(A[6]), .B(n302), .Y(n198) );
  AOI21X1TS U351 ( .A0(n212), .A1(n220), .B0(n213), .Y(n211) );
  CMPR32X2TS U352 ( .A(A[53]), .B(n255), .C(n33), .CO(n32), .S(DIFF[53]) );
  OAI21X1TS U353 ( .A0(n140), .A1(n56), .B0(n57), .Y(n55) );
  CLKINVX2TS U354 ( .A(B[0]), .Y(n308) );
  CLKINVX2TS U355 ( .A(B[7]), .Y(n301) );
  NAND2XLTS U356 ( .A(A[9]), .B(n299), .Y(n185) );
  NOR2XLTS U357 ( .A(A[9]), .B(n299), .Y(n184) );
  NOR2XLTS U358 ( .A(A[13]), .B(n295), .Y(n159) );
  AOI21X1TS U359 ( .A0(n98), .A1(n58), .B0(n59), .Y(n57) );
  NAND2XLTS U360 ( .A(A[16]), .B(n292), .Y(n138) );
  NOR2X1TS U361 ( .A(A[5]), .B(n303), .Y(n203) );
  INVXLTS U362 ( .A(B[13]), .Y(n295) );
  NOR2X1TS U363 ( .A(n217), .B(n214), .Y(n212) );
  AOI21X1TS U364 ( .A0(n193), .A1(n202), .B0(n194), .Y(n192) );
  NAND2BXLTS U365 ( .AN(n106), .B(n107), .Y(n9) );
  NOR2XLTS U366 ( .A(A[17]), .B(n291), .Y(n132) );
  NAND2XLTS U367 ( .A(A[4]), .B(n304), .Y(n209) );
  NAND2XLTS U368 ( .A(A[12]), .B(n296), .Y(n165) );
  NOR2XLTS U369 ( .A(A[24]), .B(n284), .Y(n93) );
  NOR2X1TS U370 ( .A(A[20]), .B(n288), .Y(n114) );
  NAND2XLTS U371 ( .A(A[17]), .B(n291), .Y(n133) );
  NOR2X1TS U372 ( .A(A[21]), .B(n287), .Y(n111) );
  NOR2XLTS U373 ( .A(A[26]), .B(n282), .Y(n85) );
  INVXLTS U374 ( .A(B[3]), .Y(n305) );
  NAND2X1TS U375 ( .A(n88), .B(n80), .Y(n78) );
  INVXLTS U376 ( .A(n121), .Y(n119) );
  NOR2X1TS U377 ( .A(n308), .B(A[0]), .Y(n223) );
  OAI21X1TS U378 ( .A0(n214), .A1(n218), .B0(n215), .Y(n213) );
  NOR2X1TS U379 ( .A(n307), .B(A[1]), .Y(n221) );
  INVXLTS U380 ( .A(n103), .Y(n231) );
  INVXLTS U381 ( .A(n124), .Y(n235) );
  NAND2BXLTS U382 ( .AN(n203), .B(n204), .Y(n26) );
  NAND2BX1TS U383 ( .AN(n214), .B(n215), .Y(n28) );
  NAND2X1TS U384 ( .A(A[8]), .B(n300), .Y(n188) );
  INVXLTS U385 ( .A(n140), .Y(n139) );
  INVXLTS U386 ( .A(n220), .Y(n219) );
  OAI21XLTS U387 ( .A0(n189), .A1(n168), .B0(n169), .Y(n167) );
  AOI21XLTS U388 ( .A0(n139), .A1(n97), .B0(n98), .Y(n96) );
  INVXLTS U389 ( .A(n78), .Y(n76) );
  INVXLTS U390 ( .A(n79), .Y(n77) );
  INVXLTS U391 ( .A(n120), .Y(n118) );
  INVXLTS U392 ( .A(n157), .Y(n155) );
  INVXLTS U393 ( .A(n158), .Y(n156) );
  AOI21XLTS U394 ( .A0(n95), .A1(n88), .B0(n89), .Y(n87) );
  AOI21XLTS U395 ( .A0(n116), .A1(n109), .B0(n110), .Y(n108) );
  AOI21XLTS U396 ( .A0(n139), .A1(n130), .B0(n131), .Y(n129) );
  INVXLTS U397 ( .A(n182), .Y(n180) );
  AOI21XLTS U398 ( .A0(n210), .A1(n201), .B0(n202), .Y(n200) );
  NAND2BX1TS U399 ( .AN(n221), .B(n222), .Y(n30) );
  OAI21XLTS U400 ( .A0(n184), .A1(n188), .B0(n185), .Y(n183) );
  OAI21XLTS U401 ( .A0(n103), .A1(n107), .B0(n104), .Y(n102) );
  OAI21XLTS U402 ( .A0(n195), .A1(n199), .B0(n196), .Y(n194) );
  AOI21X1TS U403 ( .A0(n170), .A1(n183), .B0(n171), .Y(n169) );
  OAI21XLTS U404 ( .A0(n172), .A1(n178), .B0(n173), .Y(n171) );
  NAND2XLTS U405 ( .A(n307), .B(A[1]), .Y(n222) );
  NAND2XLTS U406 ( .A(n226), .B(n73), .Y(n3) );
  NAND2XLTS U407 ( .A(n234), .B(n115), .Y(n11) );
  NAND2BXLTS U408 ( .AN(n85), .B(n86), .Y(n5) );
  NAND2BXLTS U409 ( .AN(n127), .B(n128), .Y(n13) );
  OAI21XLTS U410 ( .A0(n87), .A1(n85), .B0(n86), .Y(n84) );
  OAI21XLTS U411 ( .A0(n108), .A1(n106), .B0(n107), .Y(n105) );
  OAI21XLTS U412 ( .A0(n129), .A1(n127), .B0(n128), .Y(n126) );
  OAI21XLTS U413 ( .A0(n75), .A1(n72), .B0(n73), .Y(n71) );
  OAI21XLTS U414 ( .A0(n117), .A1(n114), .B0(n115), .Y(n113) );
  INVXLTS U415 ( .A(n153), .Y(n151) );
  AOI21XLTS U416 ( .A0(n74), .A1(n67), .B0(n68), .Y(n66) );
  NAND2XLTS U417 ( .A(n483), .B(n65), .Y(n1) );
  OAI21XLTS U418 ( .A0(n200), .A1(n198), .B0(n199), .Y(n197) );
  INVXLTS U419 ( .A(n195), .Y(n247) );
  NAND2BX1TS U420 ( .AN(n132), .B(n133), .Y(n14) );
  NAND2BXLTS U421 ( .AN(n198), .B(n199), .Y(n25) );
  OAI21XLTS U422 ( .A0(n219), .A1(n217), .B0(n218), .Y(n216) );
  INVXLTS U423 ( .A(n178), .Y(n176) );
  NAND2BXLTS U424 ( .AN(n217), .B(n218), .Y(n29) );
  NAND2BXLTS U425 ( .AN(n147), .B(n148), .Y(n16) );
  NAND2XLTS U426 ( .A(n240), .B(n153), .Y(n17) );
  NAND2XLTS U427 ( .A(n244), .B(n178), .Y(n21) );
  NAND2XLTS U428 ( .A(A[24]), .B(n284), .Y(n94) );
  NOR2X1TS U429 ( .A(A[22]), .B(n286), .Y(n106) );
  NOR2X1TS U430 ( .A(A[28]), .B(n280), .Y(n72) );
  NOR2X1TS U431 ( .A(A[27]), .B(n281), .Y(n82) );
  NOR2X1TS U432 ( .A(A[23]), .B(n285), .Y(n103) );
  NOR2X1TS U433 ( .A(A[29]), .B(n279), .Y(n69) );
  NOR2X1TS U434 ( .A(A[19]), .B(n289), .Y(n124) );
  NOR2X1TS U435 ( .A(A[10]), .B(n298), .Y(n177) );
  NOR2X1TS U436 ( .A(A[14]), .B(n294), .Y(n152) );
  NOR2XLTS U437 ( .A(A[4]), .B(n304), .Y(n208) );
  NOR2X1TS U438 ( .A(A[12]), .B(n296), .Y(n164) );
  NOR2XLTS U439 ( .A(A[16]), .B(n292), .Y(n137) );
  NOR2X1TS U440 ( .A(A[2]), .B(n306), .Y(n217) );
  NOR2XLTS U441 ( .A(A[8]), .B(n300), .Y(n187) );
  NAND2XLTS U442 ( .A(A[5]), .B(n303), .Y(n204) );
  NAND2XLTS U443 ( .A(A[7]), .B(n301), .Y(n196) );
  NAND2XLTS U444 ( .A(A[25]), .B(n283), .Y(n91) );
  NAND2XLTS U445 ( .A(A[21]), .B(n287), .Y(n112) );
  NAND2XLTS U446 ( .A(A[19]), .B(n289), .Y(n125) );
  NAND2XLTS U447 ( .A(A[27]), .B(n281), .Y(n83) );
  NAND2XLTS U448 ( .A(A[23]), .B(n285), .Y(n104) );
  NAND2XLTS U449 ( .A(A[29]), .B(n279), .Y(n70) );
  NOR2X1TS U450 ( .A(A[15]), .B(n293), .Y(n147) );
  NOR2X1TS U451 ( .A(A[3]), .B(n305), .Y(n214) );
  NAND2XLTS U452 ( .A(A[13]), .B(n295), .Y(n160) );
  CLKINVX2TS U453 ( .A(B[2]), .Y(n306) );
  NOR2X1TS U454 ( .A(n120), .B(n99), .Y(n97) );
  INVX2TS U455 ( .A(n96), .Y(n95) );
  INVX2TS U456 ( .A(n75), .Y(n74) );
  INVX2TS U457 ( .A(n117), .Y(n116) );
  INVX2TS U458 ( .A(n167), .Y(n166) );
  OAI21X1TS U459 ( .A0(n221), .A1(n223), .B0(n222), .Y(n220) );
  AOI21X1TS U460 ( .A0(n190), .A1(n141), .B0(n142), .Y(n140) );
  NOR2X1TS U461 ( .A(n168), .B(n143), .Y(n141) );
  OAI21X1TS U462 ( .A0(n169), .A1(n143), .B0(n144), .Y(n142) );
  NAND2X1TS U463 ( .A(n157), .B(n145), .Y(n143) );
  NAND2X1TS U464 ( .A(n130), .B(n122), .Y(n120) );
  NAND2X1TS U465 ( .A(n182), .B(n170), .Y(n168) );
  NAND2X1TS U466 ( .A(n109), .B(n101), .Y(n99) );
  NOR2X1TS U467 ( .A(n78), .B(n60), .Y(n58) );
  AOI21X1TS U468 ( .A0(n95), .A1(n76), .B0(n77), .Y(n75) );
  AOI21X1TS U469 ( .A0(n139), .A1(n118), .B0(n119), .Y(n117) );
  OAI21X1TS U470 ( .A0(n189), .A1(n180), .B0(n181), .Y(n179) );
  INVX2TS U471 ( .A(n183), .Y(n181) );
  OAI21X1TS U472 ( .A0(n166), .A1(n155), .B0(n156), .Y(n154) );
  INVX2TS U473 ( .A(n190), .Y(n189) );
  INVX2TS U474 ( .A(n211), .Y(n210) );
  OAI21X1TS U475 ( .A0(n124), .A1(n128), .B0(n125), .Y(n123) );
  AOI21X1TS U476 ( .A0(n80), .A1(n89), .B0(n81), .Y(n79) );
  OAI21X1TS U477 ( .A0(n82), .A1(n86), .B0(n83), .Y(n81) );
  OAI21X1TS U478 ( .A0(n159), .A1(n165), .B0(n160), .Y(n158) );
  NAND2X1TS U479 ( .A(n201), .B(n193), .Y(n191) );
  NOR2X1TS U480 ( .A(n198), .B(n195), .Y(n193) );
  OAI21X1TS U481 ( .A0(n132), .A1(n138), .B0(n133), .Y(n131) );
  OAI21X1TS U482 ( .A0(n203), .A1(n209), .B0(n204), .Y(n202) );
  OAI21X1TS U483 ( .A0(n111), .A1(n115), .B0(n112), .Y(n110) );
  OAI21X1TS U484 ( .A0(n90), .A1(n94), .B0(n91), .Y(n89) );
  OAI21X1TS U485 ( .A0(n69), .A1(n73), .B0(n70), .Y(n68) );
  OAI21X1TS U486 ( .A0(n121), .A1(n99), .B0(n100), .Y(n98) );
  AOI21X1TS U487 ( .A0(n101), .A1(n110), .B0(n102), .Y(n100) );
  NOR2X1TS U488 ( .A(n164), .B(n159), .Y(n157) );
  NOR2X1TS U489 ( .A(n187), .B(n184), .Y(n182) );
  NAND2X1TS U490 ( .A(n67), .B(n483), .Y(n60) );
  AOI21X1TS U491 ( .A0(n145), .A1(n158), .B0(n146), .Y(n144) );
  OAI21X1TS U492 ( .A0(n147), .A1(n153), .B0(n148), .Y(n146) );
  NOR2X1TS U493 ( .A(n208), .B(n203), .Y(n201) );
  NOR2X1TS U494 ( .A(n137), .B(n132), .Y(n130) );
  NOR2X1TS U495 ( .A(n93), .B(n90), .Y(n88) );
  NOR2X1TS U496 ( .A(n72), .B(n69), .Y(n67) );
  NOR2X1TS U497 ( .A(n114), .B(n111), .Y(n109) );
  NOR2X1TS U498 ( .A(n152), .B(n147), .Y(n145) );
  NOR2X1TS U499 ( .A(n177), .B(n172), .Y(n170) );
  NOR2X1TS U500 ( .A(n85), .B(n82), .Y(n80) );
  NOR2X1TS U501 ( .A(n106), .B(n103), .Y(n101) );
  NOR2X1TS U502 ( .A(n127), .B(n124), .Y(n122) );
  OAI21X1TS U503 ( .A0(n79), .A1(n60), .B0(n61), .Y(n59) );
  AOI21X1TS U504 ( .A0(n68), .A1(n483), .B0(n63), .Y(n61) );
  INVX2TS U505 ( .A(n65), .Y(n63) );
  INVX2TS U506 ( .A(B[1]), .Y(n307) );
  XNOR2X1TS U507 ( .A(n71), .B(n2), .Y(DIFF[29]) );
  NAND2X1TS U508 ( .A(n225), .B(n70), .Y(n2) );
  INVX2TS U509 ( .A(n69), .Y(n225) );
  XNOR2X1TS U510 ( .A(n74), .B(n3), .Y(DIFF[28]) );
  INVX2TS U511 ( .A(n72), .Y(n226) );
  AOI21X1TS U512 ( .A0(n139), .A1(n238), .B0(n136), .Y(n134) );
  AOI21X1TS U513 ( .A0(n210), .A1(n250), .B0(n207), .Y(n205) );
  XNOR2X1TS U514 ( .A(n84), .B(n4), .Y(DIFF[27]) );
  NAND2X1TS U515 ( .A(n227), .B(n83), .Y(n4) );
  INVX2TS U516 ( .A(n82), .Y(n227) );
  XNOR2X1TS U517 ( .A(n92), .B(n6), .Y(DIFF[25]) );
  NAND2X1TS U518 ( .A(n229), .B(n91), .Y(n6) );
  OAI21X1TS U519 ( .A0(n96), .A1(n93), .B0(n94), .Y(n92) );
  INVX2TS U520 ( .A(n90), .Y(n229) );
  XNOR2X1TS U521 ( .A(n95), .B(n7), .Y(DIFF[24]) );
  NAND2X1TS U522 ( .A(n230), .B(n94), .Y(n7) );
  INVX2TS U523 ( .A(n93), .Y(n230) );
  XNOR2X1TS U524 ( .A(n105), .B(n8), .Y(DIFF[23]) );
  NAND2X1TS U525 ( .A(n231), .B(n104), .Y(n8) );
  XNOR2X1TS U526 ( .A(n113), .B(n10), .Y(DIFF[21]) );
  NAND2X1TS U527 ( .A(n233), .B(n112), .Y(n10) );
  INVX2TS U528 ( .A(n111), .Y(n233) );
  XNOR2X1TS U529 ( .A(n116), .B(n11), .Y(DIFF[20]) );
  INVX2TS U530 ( .A(n114), .Y(n234) );
  XNOR2X1TS U531 ( .A(n126), .B(n12), .Y(DIFF[19]) );
  NAND2X1TS U532 ( .A(n235), .B(n125), .Y(n12) );
  XNOR2X1TS U533 ( .A(n197), .B(n24), .Y(DIFF[7]) );
  NAND2X1TS U534 ( .A(n247), .B(n196), .Y(n24) );
  XNOR2X1TS U535 ( .A(n139), .B(n15), .Y(DIFF[16]) );
  NAND2X1TS U536 ( .A(n238), .B(n138), .Y(n15) );
  OAI21X1TS U537 ( .A0(n189), .A1(n187), .B0(n188), .Y(n186) );
  AOI21X1TS U538 ( .A0(n154), .A1(n240), .B0(n151), .Y(n149) );
  AOI21X1TS U539 ( .A0(n167), .A1(n242), .B0(n163), .Y(n161) );
  INVX2TS U540 ( .A(n165), .Y(n163) );
  AOI21X1TS U541 ( .A0(n179), .A1(n244), .B0(n176), .Y(n174) );
  XNOR2X1TS U542 ( .A(n210), .B(n27), .Y(DIFF[4]) );
  NAND2X1TS U543 ( .A(n250), .B(n209), .Y(n27) );
  NAND2BX1TS U544 ( .AN(n184), .B(n185), .Y(n22) );
  NAND2X1TS U545 ( .A(n242), .B(n165), .Y(n19) );
  NAND2BX1TS U546 ( .AN(n187), .B(n188), .Y(n23) );
  NAND2BX1TS U547 ( .AN(n159), .B(n160), .Y(n18) );
  NAND2BX1TS U548 ( .AN(n172), .B(n173), .Y(n20) );
  INVX2TS U549 ( .A(n138), .Y(n136) );
  INVX2TS U550 ( .A(n209), .Y(n207) );
  INVX2TS U551 ( .A(n137), .Y(n238) );
  INVX2TS U552 ( .A(n152), .Y(n240) );
  INVX2TS U553 ( .A(n164), .Y(n242) );
  INVX2TS U554 ( .A(n177), .Y(n244) );
  INVX2TS U555 ( .A(n208), .Y(n250) );
  INVX2TS U556 ( .A(B[32]), .Y(n276) );
  INVX2TS U557 ( .A(B[34]), .Y(n274) );
  INVX2TS U558 ( .A(B[36]), .Y(n272) );
  INVX2TS U559 ( .A(B[38]), .Y(n270) );
  INVX2TS U560 ( .A(B[40]), .Y(n268) );
  INVX2TS U561 ( .A(B[42]), .Y(n266) );
  INVX2TS U562 ( .A(B[44]), .Y(n264) );
  INVX2TS U563 ( .A(B[46]), .Y(n262) );
  INVX2TS U564 ( .A(B[48]), .Y(n260) );
  INVX2TS U565 ( .A(B[50]), .Y(n258) );
  INVX2TS U566 ( .A(B[33]), .Y(n275) );
  INVX2TS U567 ( .A(B[35]), .Y(n273) );
  INVX2TS U568 ( .A(B[37]), .Y(n271) );
  INVX2TS U569 ( .A(B[39]), .Y(n269) );
  INVX2TS U570 ( .A(B[41]), .Y(n267) );
  INVX2TS U571 ( .A(B[43]), .Y(n265) );
  INVX2TS U572 ( .A(B[45]), .Y(n263) );
  INVX2TS U573 ( .A(B[47]), .Y(n261) );
  INVX2TS U574 ( .A(B[49]), .Y(n259) );
  INVX2TS U575 ( .A(B[51]), .Y(n257) );
  NAND2X1TS U576 ( .A(A[10]), .B(n298), .Y(n178) );
  NAND2X1TS U577 ( .A(A[14]), .B(n294), .Y(n153) );
  INVX2TS U578 ( .A(B[52]), .Y(n256) );
  INVX2TS U579 ( .A(B[31]), .Y(n277) );
  NAND2X1TS U580 ( .A(n97), .B(n58), .Y(n56) );
  NAND2X1TS U581 ( .A(A[30]), .B(n278), .Y(n65) );
  INVX2TS U582 ( .A(B[54]), .Y(n254) );
  NAND2X1TS U583 ( .A(A[28]), .B(n280), .Y(n73) );
  NAND2X1TS U584 ( .A(A[26]), .B(n282), .Y(n86) );
  NAND2X1TS U585 ( .A(A[22]), .B(n286), .Y(n107) );
  NAND2X1TS U586 ( .A(A[20]), .B(n288), .Y(n115) );
  NAND2X1TS U587 ( .A(A[18]), .B(n290), .Y(n128) );
  NAND2X1TS U588 ( .A(A[6]), .B(n302), .Y(n199) );
  NAND2X1TS U589 ( .A(A[2]), .B(n306), .Y(n218) );
  INVX2TS U590 ( .A(B[53]), .Y(n255) );
  NAND2X1TS U591 ( .A(A[3]), .B(n305), .Y(n215) );
  NAND2X1TS U592 ( .A(A[11]), .B(n297), .Y(n173) );
  NAND2X1TS U593 ( .A(A[15]), .B(n293), .Y(n148) );
  OR2X2TS U594 ( .A(A[30]), .B(n278), .Y(n483) );
  INVX2TS U595 ( .A(B[17]), .Y(n291) );
  INVX2TS U596 ( .A(B[9]), .Y(n299) );
  INVX2TS U597 ( .A(B[8]), .Y(n300) );
  INVX2TS U598 ( .A(B[4]), .Y(n304) );
  INVX2TS U599 ( .A(B[5]), .Y(n303) );
  INVX2TS U600 ( .A(B[12]), .Y(n296) );
  INVX2TS U601 ( .A(B[15]), .Y(n293) );
  INVX2TS U602 ( .A(B[14]), .Y(n294) );
  INVX2TS U603 ( .A(B[11]), .Y(n297) );
  INVX2TS U604 ( .A(B[10]), .Y(n298) );
  INVX2TS U605 ( .A(B[30]), .Y(n278) );
  INVX2TS U606 ( .A(B[16]), .Y(n292) );
  INVX2TS U607 ( .A(B[29]), .Y(n279) );
  INVX2TS U608 ( .A(B[27]), .Y(n281) );
  INVX2TS U609 ( .A(B[25]), .Y(n283) );
  INVX2TS U610 ( .A(B[23]), .Y(n285) );
  INVX2TS U611 ( .A(B[21]), .Y(n287) );
  INVX2TS U612 ( .A(B[19]), .Y(n289) );
  INVX2TS U613 ( .A(B[28]), .Y(n280) );
  INVX2TS U614 ( .A(B[26]), .Y(n282) );
  INVX2TS U615 ( .A(B[24]), .Y(n284) );
  INVX2TS U616 ( .A(B[22]), .Y(n286) );
  INVX2TS U617 ( .A(B[20]), .Y(n288) );
  INVX2TS U618 ( .A(B[18]), .Y(n290) );
  INVX2TS U619 ( .A(B[6]), .Y(n302) );
  INVX2TS U620 ( .A(n31), .Y(DIFF[55]) );
  XNOR2X1TS U621 ( .A(n154), .B(n17), .Y(DIFF[14]) );
  XNOR2X1TS U622 ( .A(n179), .B(n21), .Y(DIFF[10]) );
  XNOR2X1TS U623 ( .A(n186), .B(n22), .Y(DIFF[9]) );
  XNOR2X1TS U624 ( .A(n216), .B(n28), .Y(DIFF[3]) );
  XNOR2X1TS U625 ( .A(n308), .B(A[0]), .Y(DIFF[0]) );
endmodule


module FPU_Add_Subtract_Function_W64_EW11_SW52_SWR55_EWR6_DW01_add_0 ( A, B, 
        CI, SUM, CO );
  input [55:0] A;
  input [55:0] B;
  output [55:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45,
         n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59,
         n60, n61, n62, n64, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75,
         n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89,
         n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102,
         n103, n104, n105, n106, n107, n108, n109, n110, n111, n112, n113,
         n114, n115, n116, n117, n118, n119, n120, n121, n122, n123, n125,
         n126, n127, n128, n129, n130, n131, n132, n133, n134, n135, n137,
         n138, n139, n140, n141, n142, n143, n144, n145, n146, n147, n148,
         n149, n150, n152, n153, n154, n155, n156, n157, n158, n159, n160,
         n161, n162, n164, n165, n166, n167, n168, n169, n170, n171, n172,
         n173, n174, n175, n177, n178, n179, n180, n181, n182, n183, n184,
         n185, n186, n187, n188, n189, n190, n191, n192, n193, n194, n195,
         n196, n197, n198, n199, n200, n201, n202, n203, n204, n205, n206,
         n208, n209, n210, n211, n212, n213, n214, n215, n216, n217, n218,
         n219, n220, n221, n222, n223, n224, n225, n240, n242, n244, n246,
         n247, n252, n253, n431, n432, n433, n434, n435, n436;

  CMPR32X2TS U2 ( .A(A[54]), .B(B[54]), .C(n33), .CO(SUM[55]), .S(SUM[54]) );
  CMPR32X2TS U3 ( .A(A[53]), .B(B[53]), .C(n34), .CO(n33), .S(SUM[53]) );
  AFHCINX2TS U4 ( .CIN(n35), .B(A[52]), .A(B[52]), .S(SUM[52]), .CO(n34) );
  AFHCONX2TS U5 ( .A(B[51]), .B(A[51]), .CI(n36), .CON(n35), .S(SUM[51]) );
  AFHCINX2TS U6 ( .CIN(n37), .B(A[50]), .A(B[50]), .S(SUM[50]), .CO(n36) );
  AFHCONX2TS U7 ( .A(B[49]), .B(A[49]), .CI(n38), .CON(n37), .S(SUM[49]) );
  AFHCINX2TS U8 ( .CIN(n39), .B(A[48]), .A(B[48]), .S(SUM[48]), .CO(n38) );
  AFHCONX2TS U9 ( .A(B[47]), .B(A[47]), .CI(n40), .CON(n39), .S(SUM[47]) );
  AFHCINX2TS U10 ( .CIN(n41), .B(A[46]), .A(B[46]), .S(SUM[46]), .CO(n40) );
  AFHCONX2TS U11 ( .A(B[45]), .B(A[45]), .CI(n42), .CON(n41), .S(SUM[45]) );
  AFHCINX2TS U12 ( .CIN(n43), .B(A[44]), .A(B[44]), .S(SUM[44]), .CO(n42) );
  AFHCONX2TS U13 ( .A(B[43]), .B(A[43]), .CI(n44), .CON(n43), .S(SUM[43]) );
  AFHCINX2TS U14 ( .CIN(n45), .B(A[42]), .A(B[42]), .S(SUM[42]), .CO(n44) );
  AFHCONX2TS U15 ( .A(B[41]), .B(A[41]), .CI(n46), .CON(n45), .S(SUM[41]) );
  AFHCINX2TS U16 ( .CIN(n47), .B(A[40]), .A(B[40]), .S(SUM[40]), .CO(n46) );
  AFHCONX2TS U17 ( .A(B[39]), .B(A[39]), .CI(n48), .CON(n47), .S(SUM[39]) );
  AFHCINX2TS U18 ( .CIN(n49), .B(A[38]), .A(B[38]), .S(SUM[38]), .CO(n48) );
  AFHCONX2TS U19 ( .A(B[37]), .B(A[37]), .CI(n50), .CON(n49), .S(SUM[37]) );
  AFHCINX2TS U20 ( .CIN(n51), .B(A[36]), .A(B[36]), .S(SUM[36]), .CO(n50) );
  AFHCONX2TS U21 ( .A(B[35]), .B(A[35]), .CI(n52), .CON(n51), .S(SUM[35]) );
  AFHCONX2TS U23 ( .A(B[33]), .B(A[33]), .CI(n54), .CON(n53), .S(SUM[33]) );
  AFHCONX2TS U25 ( .A(B[31]), .B(A[31]), .CI(n56), .CON(n55), .S(SUM[31]) );
  XOR2X1TS U26 ( .A(n67), .B(n1), .Y(SUM[30]) );
  XOR2X1TS U67 ( .A(n88), .B(n5), .Y(SUM[26]) );
  XOR2X1TS U100 ( .A(n109), .B(n9), .Y(SUM[22]) );
  XOR2X1TS U133 ( .A(n130), .B(n13), .Y(SUM[18]) );
  XOR2X1TS U139 ( .A(n135), .B(n14), .Y(SUM[17]) );
  XOR2X1TS U155 ( .A(n150), .B(n16), .Y(SUM[15]) );
  XOR2X1TS U176 ( .A(n162), .B(n18), .Y(SUM[13]) );
  XOR2X1TS U186 ( .A(n167), .B(n19), .Y(SUM[12]) );
  XOR2X1TS U194 ( .A(n175), .B(n20), .Y(SUM[11]) );
  XOR2X1TS U223 ( .A(n190), .B(n23), .Y(SUM[8]) );
  XOR2X1TS U240 ( .A(n201), .B(n25), .Y(SUM[6]) );
  XOR2X1TS U246 ( .A(n206), .B(n26), .Y(SUM[5]) );
  XOR2X1TS U271 ( .A(n29), .B(n220), .Y(SUM[2]) );
  XOR2X1TS U277 ( .A(n30), .B(n225), .Y(SUM[1]) );
  NAND2X2TS U292 ( .A(n158), .B(n146), .Y(n144) );
  NOR2X2TS U293 ( .A(n165), .B(n160), .Y(n158) );
  AFHCINX4TS U294 ( .CIN(n53), .B(A[34]), .A(B[34]), .S(SUM[34]), .CO(n52) );
  CLKINVX2TS U295 ( .A(n215), .Y(n253) );
  NOR2X1TS U296 ( .A(A[9]), .B(B[9]), .Y(n185) );
  NAND2X1TS U297 ( .A(A[16]), .B(B[16]), .Y(n139) );
  NOR2X1TS U298 ( .A(A[3]), .B(B[3]), .Y(n215) );
  NAND2X1TS U299 ( .A(A[2]), .B(B[2]), .Y(n219) );
  NOR2X1TS U300 ( .A(A[2]), .B(B[2]), .Y(n218) );
  NOR2X1TS U301 ( .A(n199), .B(n196), .Y(n194) );
  OA21XLTS U302 ( .A0(n125), .A1(n129), .B0(n126), .Y(n431) );
  CLKINVX1TS U303 ( .A(n191), .Y(n190) );
  AND2X2TS U304 ( .A(n191), .B(n142), .Y(n432) );
  NAND2XLTS U305 ( .A(A[7]), .B(B[7]), .Y(n197) );
  NOR2X1TS U306 ( .A(A[17]), .B(B[17]), .Y(n133) );
  NOR2X1TS U307 ( .A(n169), .B(n144), .Y(n142) );
  NOR2X2TS U308 ( .A(n432), .B(n143), .Y(n141) );
  CLKAND2X2TS U309 ( .A(n435), .B(n431), .Y(n122) );
  OAI21X1TS U310 ( .A0(n212), .A1(n192), .B0(n193), .Y(n191) );
  OR2X4TS U311 ( .A(n141), .B(n57), .Y(n433) );
  AOI21X1TS U312 ( .A0(n99), .A1(n59), .B0(n60), .Y(n58) );
  NAND2X2TS U313 ( .A(n433), .B(n58), .Y(n56) );
  OAI21X2TS U314 ( .A0(n170), .A1(n144), .B0(n145), .Y(n143) );
  INVXLTS U315 ( .A(n141), .Y(n140) );
  INVX1TS U316 ( .A(n178), .Y(n246) );
  NOR2X1TS U317 ( .A(A[10]), .B(B[10]), .Y(n178) );
  OAI21X1TS U318 ( .A0(n185), .A1(n189), .B0(n186), .Y(n184) );
  NOR2X1TS U319 ( .A(n178), .B(n173), .Y(n171) );
  OAI21XLTS U320 ( .A0(n173), .A1(n179), .B0(n174), .Y(n172) );
  AND2XLTS U321 ( .A(n171), .B(n184), .Y(n434) );
  NOR2X1TS U322 ( .A(n434), .B(n172), .Y(n170) );
  NOR2XLTS U323 ( .A(A[23]), .B(B[23]), .Y(n104) );
  OAI21XLTS U324 ( .A0(n133), .A1(n139), .B0(n134), .Y(n132) );
  NAND2X1TS U325 ( .A(n98), .B(n59), .Y(n57) );
  NOR2X1TS U326 ( .A(A[21]), .B(B[21]), .Y(n112) );
  NOR2XLTS U327 ( .A(A[22]), .B(B[22]), .Y(n107) );
  NOR2X1TS U328 ( .A(A[11]), .B(B[11]), .Y(n173) );
  OAI21X1TS U329 ( .A0(n80), .A1(n61), .B0(n62), .Y(n60) );
  NOR2XLTS U330 ( .A(A[14]), .B(B[14]), .Y(n153) );
  NOR2XLTS U331 ( .A(A[15]), .B(B[15]), .Y(n148) );
  NOR2XLTS U332 ( .A(A[13]), .B(B[13]), .Y(n160) );
  AFHCINX2TS U333 ( .CIN(n55), .B(A[32]), .A(B[32]), .S(SUM[32]), .CO(n54) );
  NOR2X1TS U334 ( .A(A[20]), .B(B[20]), .Y(n115) );
  NAND2XLTS U335 ( .A(A[3]), .B(B[3]), .Y(n216) );
  NAND2XLTS U336 ( .A(n123), .B(n132), .Y(n435) );
  NAND2BXLTS U337 ( .AN(n160), .B(n161), .Y(n18) );
  NAND2BX1TS U338 ( .AN(n204), .B(n205), .Y(n26) );
  NAND2BX1TS U339 ( .AN(n86), .B(n87), .Y(n5) );
  NAND2BX1TS U340 ( .AN(n91), .B(n92), .Y(n6) );
  NAND2BX1TS U341 ( .AN(n125), .B(n126), .Y(n12) );
  NOR2XLTS U342 ( .A(A[18]), .B(B[18]), .Y(n128) );
  INVXLTS U343 ( .A(n221), .Y(n220) );
  OAI21XLTS U344 ( .A0(n190), .A1(n169), .B0(n170), .Y(n168) );
  AOI21XLTS U345 ( .A0(n140), .A1(n98), .B0(n99), .Y(n97) );
  INVXLTS U346 ( .A(n79), .Y(n77) );
  INVXLTS U347 ( .A(n121), .Y(n119) );
  INVXLTS U348 ( .A(n158), .Y(n156) );
  INVXLTS U349 ( .A(n159), .Y(n157) );
  AOI21XLTS U350 ( .A0(n96), .A1(n89), .B0(n90), .Y(n88) );
  AOI21XLTS U351 ( .A0(n117), .A1(n110), .B0(n111), .Y(n109) );
  AOI21XLTS U352 ( .A0(n140), .A1(n131), .B0(n132), .Y(n130) );
  AOI21XLTS U353 ( .A0(n75), .A1(n68), .B0(n69), .Y(n67) );
  INVXLTS U354 ( .A(n183), .Y(n181) );
  AOI21XLTS U355 ( .A0(n211), .A1(n202), .B0(n203), .Y(n201) );
  AOI21XLTS U356 ( .A0(n81), .A1(n90), .B0(n82), .Y(n80) );
  OAI21XLTS U357 ( .A0(n196), .A1(n200), .B0(n197), .Y(n195) );
  NAND2XLTS U358 ( .A(B[1]), .B(A[1]), .Y(n223) );
  NAND2XLTS U359 ( .A(n242), .B(n154), .Y(n17) );
  NAND2BXLTS U360 ( .AN(n148), .B(n149), .Y(n16) );
  OAI21XLTS U361 ( .A0(n88), .A1(n86), .B0(n87), .Y(n85) );
  OAI21XLTS U362 ( .A0(n109), .A1(n107), .B0(n108), .Y(n106) );
  OAI21XLTS U363 ( .A0(n130), .A1(n128), .B0(n129), .Y(n127) );
  OAI21XLTS U364 ( .A0(n76), .A1(n73), .B0(n74), .Y(n72) );
  OAI21XLTS U365 ( .A0(n97), .A1(n94), .B0(n95), .Y(n93) );
  OAI21XLTS U366 ( .A0(n118), .A1(n115), .B0(n116), .Y(n114) );
  NAND2XLTS U367 ( .A(n247), .B(n186), .Y(n22) );
  OAI21XLTS U368 ( .A0(n220), .A1(n218), .B0(n219), .Y(n217) );
  NAND2XLTS U369 ( .A(n246), .B(n179), .Y(n21) );
  NAND2XLTS U370 ( .A(n244), .B(n166), .Y(n19) );
  NAND2BXLTS U371 ( .AN(n173), .B(n174), .Y(n20) );
  NAND2BX1TS U372 ( .AN(n188), .B(n189), .Y(n23) );
  OAI21XLTS U373 ( .A0(n201), .A1(n199), .B0(n200), .Y(n198) );
  NAND2BXLTS U374 ( .AN(n199), .B(n200), .Y(n25) );
  NAND2BXLTS U375 ( .AN(n104), .B(n105), .Y(n8) );
  NAND2BXLTS U376 ( .AN(n112), .B(n113), .Y(n10) );
  NAND2BXLTS U377 ( .AN(n115), .B(n116), .Y(n11) );
  NAND2BXLTS U378 ( .AN(n196), .B(n197), .Y(n24) );
  NAND2XLTS U379 ( .A(n436), .B(n66), .Y(n1) );
  INVXLTS U380 ( .A(n166), .Y(n164) );
  INVXLTS U381 ( .A(n154), .Y(n152) );
  INVXLTS U382 ( .A(n179), .Y(n177) );
  NAND2BXLTS U383 ( .AN(n218), .B(n219), .Y(n29) );
  NAND2BXLTS U384 ( .AN(n107), .B(n108), .Y(n9) );
  NAND2BXLTS U385 ( .AN(n128), .B(n129), .Y(n13) );
  NAND2BXLTS U386 ( .AN(n133), .B(n134), .Y(n14) );
  NAND2BXLTS U387 ( .AN(n70), .B(n71), .Y(n2) );
  NAND2BXLTS U388 ( .AN(n73), .B(n74), .Y(n3) );
  NAND2BXLTS U389 ( .AN(n83), .B(n84), .Y(n4) );
  NAND2BXLTS U390 ( .AN(n94), .B(n95), .Y(n7) );
  NAND2BX1TS U391 ( .AN(n224), .B(n225), .Y(n31) );
  NAND2XLTS U392 ( .A(A[4]), .B(B[4]), .Y(n210) );
  NAND2XLTS U393 ( .A(A[8]), .B(B[8]), .Y(n189) );
  NOR2XLTS U394 ( .A(A[8]), .B(B[8]), .Y(n188) );
  NOR2XLTS U395 ( .A(A[4]), .B(B[4]), .Y(n209) );
  NOR2X1TS U396 ( .A(A[12]), .B(B[12]), .Y(n165) );
  NOR2XLTS U397 ( .A(A[16]), .B(B[16]), .Y(n138) );
  NOR2X1TS U398 ( .A(A[26]), .B(B[26]), .Y(n86) );
  NOR2XLTS U399 ( .A(A[24]), .B(B[24]), .Y(n94) );
  NOR2X1TS U400 ( .A(A[28]), .B(B[28]), .Y(n73) );
  NOR2X1TS U401 ( .A(A[6]), .B(B[6]), .Y(n199) );
  NAND2XLTS U402 ( .A(A[13]), .B(B[13]), .Y(n161) );
  NOR2X1TS U403 ( .A(A[25]), .B(B[25]), .Y(n91) );
  NOR2X1TS U404 ( .A(A[27]), .B(B[27]), .Y(n83) );
  NOR2X1TS U405 ( .A(A[29]), .B(B[29]), .Y(n70) );
  NOR2X1TS U406 ( .A(A[7]), .B(B[7]), .Y(n196) );
  NOR2X1TS U407 ( .A(A[19]), .B(B[19]), .Y(n125) );
  NOR2X1TS U408 ( .A(A[5]), .B(B[5]), .Y(n204) );
  NOR2X1TS U409 ( .A(n121), .B(n100), .Y(n98) );
  INVX2TS U410 ( .A(n97), .Y(n96) );
  INVX2TS U411 ( .A(n76), .Y(n75) );
  INVX2TS U412 ( .A(n118), .Y(n117) );
  INVX2TS U413 ( .A(n168), .Y(n167) );
  OAI21X1TS U414 ( .A0(n222), .A1(n225), .B0(n223), .Y(n221) );
  NAND2X1TS U415 ( .A(n89), .B(n81), .Y(n79) );
  NAND2X1TS U416 ( .A(n131), .B(n123), .Y(n121) );
  NAND2X1TS U417 ( .A(n183), .B(n171), .Y(n169) );
  NAND2X1TS U418 ( .A(n110), .B(n102), .Y(n100) );
  NOR2X1TS U419 ( .A(n79), .B(n61), .Y(n59) );
  AOI21X1TS U420 ( .A0(n96), .A1(n77), .B0(n78), .Y(n76) );
  INVX2TS U421 ( .A(n80), .Y(n78) );
  AOI21X1TS U422 ( .A0(n140), .A1(n119), .B0(n120), .Y(n118) );
  INVX2TS U423 ( .A(n122), .Y(n120) );
  OAI21X1TS U424 ( .A0(n190), .A1(n181), .B0(n182), .Y(n180) );
  INVX2TS U425 ( .A(n184), .Y(n182) );
  OAI21X1TS U426 ( .A0(n167), .A1(n156), .B0(n157), .Y(n155) );
  INVX2TS U427 ( .A(n212), .Y(n211) );
  NAND2BX1TS U428 ( .AN(n222), .B(n223), .Y(n30) );
  AOI21X1TS U429 ( .A0(n213), .A1(n221), .B0(n214), .Y(n212) );
  NOR2X1TS U430 ( .A(n218), .B(n215), .Y(n213) );
  OAI21X1TS U431 ( .A0(n215), .A1(n219), .B0(n216), .Y(n214) );
  OAI21X1TS U432 ( .A0(n83), .A1(n87), .B0(n84), .Y(n82) );
  OAI21X1TS U433 ( .A0(n160), .A1(n166), .B0(n161), .Y(n159) );
  NAND2X1TS U434 ( .A(n202), .B(n194), .Y(n192) );
  AOI21X1TS U435 ( .A0(n194), .A1(n203), .B0(n195), .Y(n193) );
  OAI21X1TS U436 ( .A0(n204), .A1(n210), .B0(n205), .Y(n203) );
  OAI21X1TS U437 ( .A0(n112), .A1(n116), .B0(n113), .Y(n111) );
  OAI21X1TS U438 ( .A0(n91), .A1(n95), .B0(n92), .Y(n90) );
  OAI21X1TS U439 ( .A0(n70), .A1(n74), .B0(n71), .Y(n69) );
  OAI21X1TS U440 ( .A0(n122), .A1(n100), .B0(n101), .Y(n99) );
  AOI21X1TS U441 ( .A0(n102), .A1(n111), .B0(n103), .Y(n101) );
  OAI21X1TS U442 ( .A0(n104), .A1(n108), .B0(n105), .Y(n103) );
  NOR2X1TS U443 ( .A(B[1]), .B(A[1]), .Y(n222) );
  NOR2X1TS U444 ( .A(n188), .B(n185), .Y(n183) );
  NAND2X1TS U445 ( .A(n68), .B(n436), .Y(n61) );
  AOI21X1TS U446 ( .A0(n146), .A1(n159), .B0(n147), .Y(n145) );
  OAI21X1TS U447 ( .A0(n148), .A1(n154), .B0(n149), .Y(n147) );
  AOI21X1TS U448 ( .A0(n69), .A1(n436), .B0(n64), .Y(n62) );
  INVX2TS U449 ( .A(n66), .Y(n64) );
  NAND2X1TS U450 ( .A(B[0]), .B(A[0]), .Y(n225) );
  NOR2X1TS U451 ( .A(n209), .B(n204), .Y(n202) );
  NOR2X1TS U452 ( .A(n138), .B(n133), .Y(n131) );
  NOR2X1TS U453 ( .A(n94), .B(n91), .Y(n89) );
  NOR2X1TS U454 ( .A(n73), .B(n70), .Y(n68) );
  NOR2X1TS U455 ( .A(n115), .B(n112), .Y(n110) );
  NOR2X1TS U456 ( .A(n153), .B(n148), .Y(n146) );
  NOR2X1TS U457 ( .A(n86), .B(n83), .Y(n81) );
  NOR2X1TS U458 ( .A(n107), .B(n104), .Y(n102) );
  NOR2X1TS U459 ( .A(n128), .B(n125), .Y(n123) );
  AOI21X1TS U460 ( .A0(n155), .A1(n242), .B0(n152), .Y(n150) );
  AOI21X1TS U461 ( .A0(n168), .A1(n244), .B0(n164), .Y(n162) );
  AOI21X1TS U462 ( .A0(n180), .A1(n246), .B0(n177), .Y(n175) );
  XNOR2X1TS U463 ( .A(n155), .B(n17), .Y(SUM[14]) );
  XNOR2X1TS U464 ( .A(n180), .B(n21), .Y(SUM[10]) );
  XNOR2X1TS U465 ( .A(n187), .B(n22), .Y(SUM[9]) );
  OAI21X1TS U466 ( .A0(n190), .A1(n188), .B0(n189), .Y(n187) );
  INVX2TS U467 ( .A(n185), .Y(n247) );
  AOI21X1TS U468 ( .A0(n140), .A1(n240), .B0(n137), .Y(n135) );
  INVX2TS U469 ( .A(n139), .Y(n137) );
  XNOR2X1TS U470 ( .A(n217), .B(n28), .Y(SUM[3]) );
  NAND2X1TS U471 ( .A(n253), .B(n216), .Y(n28) );
  INVX2TS U472 ( .A(n31), .Y(SUM[0]) );
  NOR2X1TS U473 ( .A(B[0]), .B(A[0]), .Y(n224) );
  AOI21X1TS U474 ( .A0(n211), .A1(n252), .B0(n208), .Y(n206) );
  INVX2TS U475 ( .A(n210), .Y(n208) );
  NAND2X1TS U476 ( .A(n240), .B(n139), .Y(n15) );
  NAND2X1TS U477 ( .A(n252), .B(n210), .Y(n27) );
  INVX2TS U478 ( .A(n138), .Y(n240) );
  INVX2TS U479 ( .A(n153), .Y(n242) );
  INVX2TS U480 ( .A(n165), .Y(n244) );
  INVX2TS U481 ( .A(n209), .Y(n252) );
  NAND2X1TS U482 ( .A(A[12]), .B(B[12]), .Y(n166) );
  NAND2X1TS U483 ( .A(A[10]), .B(B[10]), .Y(n179) );
  NAND2X1TS U484 ( .A(A[14]), .B(B[14]), .Y(n154) );
  NAND2X1TS U485 ( .A(A[30]), .B(B[30]), .Y(n66) );
  NAND2X1TS U486 ( .A(A[28]), .B(B[28]), .Y(n74) );
  NAND2X1TS U487 ( .A(A[26]), .B(B[26]), .Y(n87) );
  NAND2X1TS U488 ( .A(A[24]), .B(B[24]), .Y(n95) );
  NAND2X1TS U489 ( .A(A[22]), .B(B[22]), .Y(n108) );
  NAND2X1TS U490 ( .A(A[20]), .B(B[20]), .Y(n116) );
  NAND2X1TS U491 ( .A(A[18]), .B(B[18]), .Y(n129) );
  NAND2X1TS U492 ( .A(A[6]), .B(B[6]), .Y(n200) );
  NAND2X1TS U493 ( .A(A[9]), .B(B[9]), .Y(n186) );
  NAND2X1TS U494 ( .A(A[5]), .B(B[5]), .Y(n205) );
  NAND2X1TS U495 ( .A(A[17]), .B(B[17]), .Y(n134) );
  NAND2X1TS U496 ( .A(A[19]), .B(B[19]), .Y(n126) );
  NAND2X1TS U497 ( .A(A[21]), .B(B[21]), .Y(n113) );
  NAND2X1TS U498 ( .A(A[23]), .B(B[23]), .Y(n105) );
  NAND2X1TS U499 ( .A(A[25]), .B(B[25]), .Y(n92) );
  NAND2X1TS U500 ( .A(A[27]), .B(B[27]), .Y(n84) );
  NAND2X1TS U501 ( .A(A[29]), .B(B[29]), .Y(n71) );
  NAND2X1TS U502 ( .A(A[15]), .B(B[15]), .Y(n149) );
  NAND2X1TS U503 ( .A(A[11]), .B(B[11]), .Y(n174) );
  OR2X2TS U504 ( .A(A[30]), .B(B[30]), .Y(n436) );
  XNOR2X1TS U505 ( .A(n72), .B(n2), .Y(SUM[29]) );
  XNOR2X1TS U506 ( .A(n75), .B(n3), .Y(SUM[28]) );
  XNOR2X1TS U507 ( .A(n85), .B(n4), .Y(SUM[27]) );
  XNOR2X1TS U508 ( .A(n93), .B(n6), .Y(SUM[25]) );
  XNOR2X1TS U509 ( .A(n96), .B(n7), .Y(SUM[24]) );
  XNOR2X1TS U510 ( .A(n106), .B(n8), .Y(SUM[23]) );
  XNOR2X1TS U511 ( .A(n114), .B(n10), .Y(SUM[21]) );
  XNOR2X1TS U512 ( .A(n117), .B(n11), .Y(SUM[20]) );
  XNOR2X1TS U513 ( .A(n127), .B(n12), .Y(SUM[19]) );
  XNOR2X1TS U514 ( .A(n140), .B(n15), .Y(SUM[16]) );
  XNOR2X1TS U515 ( .A(n198), .B(n24), .Y(SUM[7]) );
  XNOR2X1TS U516 ( .A(n211), .B(n27), .Y(SUM[4]) );
endmodule


module FPU_Add_Subtract_Function_W64_EW11_SW52_SWR55_EWR6 ( clk, rst, beg_FSM, 
        ack_FSM, Data_X, Data_Y, add_subt, r_mode, overflow_flag, 
        underflow_flag, ready, final_result_ieee );
  input [63:0] Data_X;
  input [63:0] Data_Y;
  input [1:0] r_mode;
  output [63:0] final_result_ieee;
  input clk, rst, beg_FSM, ack_FSM, add_subt;
  output overflow_flag, underflow_flag, ready;
  wire   zero_flag, FSM_selector_C, add_overflow_flag, round_flag,
         FSM_op_start_in_load_a, FSM_op_start_in_load_b,
         FSM_exp_operation_load_diff, FSM_exp_operation_load_OU,
         FSM_exp_operation_A_S, FSM_barrel_shifter_load,
         FSM_barrel_shifter_L_R, FSM_barrel_shifter_B_S, FSM_Add_Subt_Sgf_load,
         FSM_LZA_load, FSM_Final_Result_load, selector_A, load_b, selector_C,
         selector_D, rst_int, FSM_selector_A, intAS, real_op,
         sign_final_result, S_A_S_Oper_A_54_, Rounding_Decoder_n4,
         Barrel_Shifter_module_Output_Reg_n111,
         Barrel_Shifter_module_Output_Reg_n109,
         Barrel_Shifter_module_Output_Reg_n108,
         Barrel_Shifter_module_Output_Reg_n107,
         Barrel_Shifter_module_Output_Reg_n106,
         Barrel_Shifter_module_Output_Reg_n105,
         Barrel_Shifter_module_Output_Reg_n104,
         Barrel_Shifter_module_Output_Reg_n103,
         Barrel_Shifter_module_Output_Reg_n102,
         Barrel_Shifter_module_Output_Reg_n101,
         Barrel_Shifter_module_Output_Reg_n100,
         Barrel_Shifter_module_Output_Reg_n99,
         Barrel_Shifter_module_Output_Reg_n98,
         Barrel_Shifter_module_Output_Reg_n97,
         Barrel_Shifter_module_Output_Reg_n96,
         Barrel_Shifter_module_Output_Reg_n95,
         Barrel_Shifter_module_Output_Reg_n94,
         Barrel_Shifter_module_Output_Reg_n93,
         Barrel_Shifter_module_Output_Reg_n92,
         Barrel_Shifter_module_Output_Reg_n91,
         Barrel_Shifter_module_Output_Reg_n90,
         Barrel_Shifter_module_Output_Reg_n89,
         Barrel_Shifter_module_Output_Reg_n88,
         Barrel_Shifter_module_Output_Reg_n87,
         Barrel_Shifter_module_Output_Reg_n86,
         Barrel_Shifter_module_Output_Reg_n85,
         Barrel_Shifter_module_Output_Reg_n84,
         Barrel_Shifter_module_Output_Reg_n83,
         Barrel_Shifter_module_Output_Reg_n82,
         Barrel_Shifter_module_Output_Reg_n81,
         Barrel_Shifter_module_Output_Reg_n80,
         Barrel_Shifter_module_Output_Reg_n79,
         Barrel_Shifter_module_Output_Reg_n78,
         Barrel_Shifter_module_Output_Reg_n77,
         Barrel_Shifter_module_Output_Reg_n76,
         Barrel_Shifter_module_Output_Reg_n75,
         Barrel_Shifter_module_Output_Reg_n74,
         Barrel_Shifter_module_Output_Reg_n73,
         Barrel_Shifter_module_Output_Reg_n72,
         Barrel_Shifter_module_Output_Reg_n71,
         Barrel_Shifter_module_Output_Reg_n70,
         Barrel_Shifter_module_Output_Reg_n69,
         Barrel_Shifter_module_Output_Reg_n68,
         Barrel_Shifter_module_Output_Reg_n67,
         Barrel_Shifter_module_Output_Reg_n66,
         Barrel_Shifter_module_Output_Reg_n65,
         Barrel_Shifter_module_Output_Reg_n64,
         Barrel_Shifter_module_Output_Reg_n63,
         Barrel_Shifter_module_Output_Reg_n62,
         Barrel_Shifter_module_Output_Reg_n61,
         Barrel_Shifter_module_Output_Reg_n60,
         Barrel_Shifter_module_Output_Reg_n59,
         Barrel_Shifter_module_Output_Reg_n58,
         Barrel_Shifter_module_Output_Reg_n57,
         Barrel_Shifter_module_Output_Reg_n56, Add_Subt_Sgf_module_Sgf_AS_N114,
         Add_Subt_Sgf_module_Sgf_AS_N113, Add_Subt_Sgf_module_Sgf_AS_N112,
         Add_Subt_Sgf_module_Sgf_AS_N111, Add_Subt_Sgf_module_Sgf_AS_N110,
         Add_Subt_Sgf_module_Sgf_AS_N109, Add_Subt_Sgf_module_Sgf_AS_N108,
         Add_Subt_Sgf_module_Sgf_AS_N107, Add_Subt_Sgf_module_Sgf_AS_N106,
         Add_Subt_Sgf_module_Sgf_AS_N105, Add_Subt_Sgf_module_Sgf_AS_N104,
         Add_Subt_Sgf_module_Sgf_AS_N103, Add_Subt_Sgf_module_Sgf_AS_N102,
         Add_Subt_Sgf_module_Sgf_AS_N101, Add_Subt_Sgf_module_Sgf_AS_N100,
         Add_Subt_Sgf_module_Sgf_AS_N99, Add_Subt_Sgf_module_Sgf_AS_N98,
         Add_Subt_Sgf_module_Sgf_AS_N97, Add_Subt_Sgf_module_Sgf_AS_N96,
         Add_Subt_Sgf_module_Sgf_AS_N95, Add_Subt_Sgf_module_Sgf_AS_N94,
         Add_Subt_Sgf_module_Sgf_AS_N93, Add_Subt_Sgf_module_Sgf_AS_N92,
         Add_Subt_Sgf_module_Sgf_AS_N91, Add_Subt_Sgf_module_Sgf_AS_N90,
         Add_Subt_Sgf_module_Sgf_AS_N89, Add_Subt_Sgf_module_Sgf_AS_N88,
         Add_Subt_Sgf_module_Sgf_AS_N87, Add_Subt_Sgf_module_Sgf_AS_N86,
         Add_Subt_Sgf_module_Sgf_AS_N85, Add_Subt_Sgf_module_Sgf_AS_N84,
         Add_Subt_Sgf_module_Sgf_AS_N83, Add_Subt_Sgf_module_Sgf_AS_N82,
         Add_Subt_Sgf_module_Sgf_AS_N81, Add_Subt_Sgf_module_Sgf_AS_N80,
         Add_Subt_Sgf_module_Sgf_AS_N79, Add_Subt_Sgf_module_Sgf_AS_N78,
         Add_Subt_Sgf_module_Sgf_AS_N77, Add_Subt_Sgf_module_Sgf_AS_N76,
         Add_Subt_Sgf_module_Sgf_AS_N75, Add_Subt_Sgf_module_Sgf_AS_N74,
         Add_Subt_Sgf_module_Sgf_AS_N73, Add_Subt_Sgf_module_Sgf_AS_N72,
         Add_Subt_Sgf_module_Sgf_AS_N71, Add_Subt_Sgf_module_Sgf_AS_N70,
         Add_Subt_Sgf_module_Sgf_AS_N69, Add_Subt_Sgf_module_Sgf_AS_N68,
         Add_Subt_Sgf_module_Sgf_AS_N67, Add_Subt_Sgf_module_Sgf_AS_N66,
         Add_Subt_Sgf_module_Sgf_AS_N65, Add_Subt_Sgf_module_Sgf_AS_N64,
         Add_Subt_Sgf_module_Sgf_AS_N63, Add_Subt_Sgf_module_Sgf_AS_N62,
         Add_Subt_Sgf_module_Sgf_AS_N61, Add_Subt_Sgf_module_Sgf_AS_N60,
         Add_Subt_Sgf_module_Sgf_AS_N59, Add_Subt_Sgf_module_Sgf_AS_N58,
         Add_Subt_Sgf_module_Sgf_AS_N57, Add_Subt_Sgf_module_Sgf_AS_N56,
         Add_Subt_Sgf_module_Sgf_AS_N55, Add_Subt_Sgf_module_Sgf_AS_N54,
         Add_Subt_Sgf_module_Sgf_AS_N53, Add_Subt_Sgf_module_Sgf_AS_N52,
         Add_Subt_Sgf_module_Sgf_AS_N51, Add_Subt_Sgf_module_Sgf_AS_N50,
         Add_Subt_Sgf_module_Sgf_AS_N49, Add_Subt_Sgf_module_Sgf_AS_N48,
         Add_Subt_Sgf_module_Sgf_AS_N47, Add_Subt_Sgf_module_Sgf_AS_N46,
         Add_Subt_Sgf_module_Sgf_AS_N45, Add_Subt_Sgf_module_Sgf_AS_N44,
         Add_Subt_Sgf_module_Sgf_AS_N43, Add_Subt_Sgf_module_Sgf_AS_N42,
         Add_Subt_Sgf_module_Sgf_AS_N41, Add_Subt_Sgf_module_Sgf_AS_N40,
         Add_Subt_Sgf_module_Sgf_AS_N39, Add_Subt_Sgf_module_Sgf_AS_N38,
         Add_Subt_Sgf_module_Sgf_AS_N37, Add_Subt_Sgf_module_Sgf_AS_N36,
         Add_Subt_Sgf_module_Sgf_AS_N35, Add_Subt_Sgf_module_Sgf_AS_N34,
         Add_Subt_Sgf_module_Sgf_AS_N33, Add_Subt_Sgf_module_Sgf_AS_N32,
         Add_Subt_Sgf_module_Sgf_AS_N31, Add_Subt_Sgf_module_Sgf_AS_N30,
         Add_Subt_Sgf_module_Sgf_AS_N29, Add_Subt_Sgf_module_Sgf_AS_N28,
         Add_Subt_Sgf_module_Sgf_AS_N27, Add_Subt_Sgf_module_Sgf_AS_N26,
         Add_Subt_Sgf_module_Sgf_AS_N25, Add_Subt_Sgf_module_Sgf_AS_N24,
         Add_Subt_Sgf_module_Sgf_AS_N23, Add_Subt_Sgf_module_Sgf_AS_N22,
         Add_Subt_Sgf_module_Sgf_AS_N21, Add_Subt_Sgf_module_Sgf_AS_N20,
         Add_Subt_Sgf_module_Sgf_AS_N19, Add_Subt_Sgf_module_Sgf_AS_N18,
         Add_Subt_Sgf_module_Sgf_AS_N17, Add_Subt_Sgf_module_Sgf_AS_N16,
         Add_Subt_Sgf_module_Sgf_AS_N15, Add_Subt_Sgf_module_Sgf_AS_N14,
         Add_Subt_Sgf_module_Sgf_AS_N13, Add_Subt_Sgf_module_Sgf_AS_N12,
         Add_Subt_Sgf_module_Sgf_AS_N11, Add_Subt_Sgf_module_Sgf_AS_N10,
         Add_Subt_Sgf_module_Sgf_AS_N9, Add_Subt_Sgf_module_Sgf_AS_N8,
         Add_Subt_Sgf_module_Sgf_AS_N7, Add_Subt_Sgf_module_Sgf_AS_N6,
         Add_Subt_Sgf_module_Sgf_AS_N5, Add_Subt_Sgf_module_Sgf_AS_N4,
         Add_Subt_Sgf_module_Sgf_AS_N3, n56, n57, n58, n59, n60, n61, n62, n63,
         n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77,
         n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91,
         n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104,
         n105, n106, n107, n108, n109, n110, n111, n112, n113, n114, n115,
         n116, n117, n118, n119, n120, n121, n122, n123, n124, n125, n126,
         n127, n128, n129, n130, n131, n132, n133, n134, n135, n136, n137,
         n138, n139, n140, n141, n142, n143, n144, n145, n146, n147, n148,
         n149, n150, n151, n152, n153, n154, n155, n156, n157, n158, n159,
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
         n424, n425, n426, n427, n428, n429, n430, n431, n432, n433, n434,
         n435, n436, n437, n438, n439, n440, n441, n442, n443, n444, n445,
         n446, n447, n448, n449, n450, n451;
  wire   [1:0] selector_B;
  wire   [1:0] FSM_selector_B;
  wire   [63:0] intDX;
  wire   [63:0] intDY;
  wire   [62:0] DMP;
  wire   [62:0] DmP;
  wire   [10:0] exp_oper_result;
  wire   [10:0] S_Oper_A_exp;
  wire   [10:0] S_Oper_B_exp;
  wire   [5:0] LZA_output;
  wire   [5:0] S_Shift_Value;
  wire   [54:0] Add_Subt_result;
  wire   [54:0] S_Data_Shift;
  wire   [54:0] Sgf_normalized_result;
  wire   [16:2] S_A_S_Oper_B;
  wire   [54:0] Barrel_Shifter_module_Data_Reg;

  FSM_Add_Subtract FS_Module ( .clk(clk), .rst(n178), .rst_FSM(ack_FSM), 
        .beg_FSM(beg_FSM), .zero_flag_i(zero_flag), .norm_iteration_i(
        FSM_selector_C), .add_overflow_i(add_overflow_flag), .round_i(
        round_flag), .load_1_o(FSM_op_start_in_load_a), .load_2_o(
        FSM_op_start_in_load_b), .load_3_o(FSM_exp_operation_load_diff), 
        .load_8_o(FSM_exp_operation_load_OU), .A_S_op_o(FSM_exp_operation_A_S), 
        .load_4_o(FSM_barrel_shifter_load), .left_right_o(
        FSM_barrel_shifter_L_R), .bit_shift_o(FSM_barrel_shifter_B_S), 
        .load_5_o(FSM_Add_Subt_Sgf_load), .load_6_o(FSM_LZA_load), .load_7_o(
        FSM_Final_Result_load), .ctrl_a_o(selector_A), .ctrl_b_o(selector_B), 
        .ctrl_b_load_o(load_b), .ctrl_c_o(selector_C), .ctrl_d_o(selector_D), 
        .rst_int(rst_int), .ready(ready) );
  RegisterAdd_W1_13 Sel_A ( .clk(clk), .rst(rst_int), .load(selector_A), .D(
        1'b1), .Q(FSM_selector_A) );
  RegisterAdd_W1_12 Sel_C ( .clk(clk), .rst(rst_int), .load(selector_C), .D(
        1'b1), .Q(FSM_selector_C) );
  RegisterAdd_W2_1 Sel_B ( .clk(clk), .rst(rst_int), .load(load_b), .D(
        selector_B), .Q(FSM_selector_B) );
  RegisterAdd_W64_2 XRegister ( .clk(clk), .rst(n178), .load(n333), .D(Data_X), 
        .Q(intDX) );
  RegisterAdd_W64_1 YRegister ( .clk(clk), .rst(rst), .load(
        FSM_op_start_in_load_a), .D(Data_Y), .Q(intDY) );
  RegisterAdd_W1_10 ASRegister ( .clk(clk), .rst(rst), .load(n333), .D(
        add_subt), .Q(intAS) );
  Oper_Start_In_2_W64 Oper_Start_in_module ( .clk(clk), .rst(n178), .load_b_i(
        FSM_op_start_in_load_b), .intAS(intAS), .intDX(intDX), .intDY(intDY), 
        .DMP_o(DMP), .DmP_o(DmP), .zero_flag_o(zero_flag), .real_op_o(real_op), 
        .sign_final_result_o(sign_final_result) );
  Multiplexer_AC_W11_1 Exp_Oper_A_mux ( .ctrl(FSM_selector_A), .D0(DMP[62:52]), 
        .D1(exp_oper_result), .S(S_Oper_A_exp) );
  Mux_3x1_W11 Exp_Oper_B_mux ( .ctrl(FSM_selector_B), .D0(DmP[62:52]), .D1({
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, LZA_output}), .D2({1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b1}), .S(S_Oper_B_exp) );
  Exp_Operation_EW11 Exp_Operation_Module ( .clk(clk), .rst(n178), .load_a_i(
        FSM_exp_operation_load_diff), .load_b_i(FSM_exp_operation_load_OU), 
        .Data_A_i(S_Oper_A_exp), .Data_B_i(S_Oper_B_exp), .Add_Subt_i(
        FSM_exp_operation_A_S), .Data_Result_o(exp_oper_result), 
        .Overflow_flag_o(overflow_flag), .Underflow_flag_o(underflow_flag) );
  Mux_3x1_W6 Barrel_Shifter_S_V_mux ( .ctrl(FSM_selector_B), .D0(
        exp_oper_result[5:0]), .D1(LZA_output), .D2({1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b1}), .S(S_Shift_Value) );
  Multiplexer_AC_W55_2 Barrel_Shifter_D_I_mux ( .ctrl(FSM_selector_C), .D0({
        1'b1, DmP[51:0], 1'b0, 1'b0}), .D1(Add_Subt_result), .S(S_Data_Shift)
         );
  LZD_SWR55_EWR6 Leading_Zero_Detector_Module ( .clk(clk), .rst(rst), .load_i(
        FSM_LZA_load), .Add_subt_result_i({n113, n56, n114, n69, n59, n68, 
        n115, n122, n60, n70, n120, n71, n121, n127, n72, n126, n73, n61, n128, 
        n137, n133, n62, n75, n134, n63, n58, n76, n136, n152, n149, n82, n148, 
        n77, n65, n150, n153, n144, n64, n78, n151, n74, n135, n81, n145, n79, 
        n147, n80, n146, n160, n85, n84, n159, n83, n66, n161}), 
        .Shift_Value_o(LZA_output) );
  Tenth_Phase_W64_EW11_SW52 final_result_ieee_Module ( .clk(clk), .rst(rst), 
        .load_i(FSM_Final_Result_load), .sel_a_i(overflow_flag), .sel_b_i(
        underflow_flag), .sign_i(sign_final_result), .exp_ieee_i(
        exp_oper_result), .sgf_ieee_i(Sgf_normalized_result[53:2]), 
        .final_result_ieee_o(final_result_ieee) );
  Mux_Array_SWR55_EWR6 Barrel_Shifter_module_Mux_Array ( .clk(clk), .rst(rst), 
        .load_i(n330), .Data_i(S_Data_Shift), .FSM_left_right_i(
        FSM_barrel_shifter_L_R), .Shift_Value_i(S_Shift_Value), .bit_shift_i(
        FSM_barrel_shifter_B_S), .Data_o(Barrel_Shifter_module_Data_Reg) );
  FPU_Add_Subtract_Function_W64_EW11_SW52_SWR55_EWR6_DW01_sub_0 Add_Subt_Sgf_module_Sgf_AS_sub_34 ( 
        .A({1'b0, S_A_S_Oper_A_54_, n284, n283, n281, n282, n280, n279, n277, 
        n278, n276, n275, n272, n274, n271, n273, n268, n270, n267, n269, n264, 
        n266, n263, n265, n262, n248, n247, n253, n245, n254, n246, n255, n249, 
        n256, n250, n257, n251, n258, n232, n233, n252, n243, n236, n235, n237, 
        n244, n239, n240, n234, n238, n241, n242, n231, n230, n187, n186}), 
        .B({1'b0, n224, n223, n226, n225, n220, n218, n219, n217, n174, n172, 
        n173, n171, n170, n168, n169, n167, n166, n165, n216, n214, n215, n213, 
        n212, n210, n211, n209, n208, n203, n201, n196, n193, n207, n204, n200, 
        n198, n197, n192, n259, S_A_S_Oper_B[16], n206, n199, n202, n194, n205, 
        n195, n163, n260, n191, n190, n164, n261, S_A_S_Oper_B[3:2], n229, 
        n228}), .CI(1'b0), .DIFF({Add_Subt_Sgf_module_Sgf_AS_N58, 
        Add_Subt_Sgf_module_Sgf_AS_N57, Add_Subt_Sgf_module_Sgf_AS_N56, 
        Add_Subt_Sgf_module_Sgf_AS_N55, Add_Subt_Sgf_module_Sgf_AS_N54, 
        Add_Subt_Sgf_module_Sgf_AS_N53, Add_Subt_Sgf_module_Sgf_AS_N52, 
        Add_Subt_Sgf_module_Sgf_AS_N51, Add_Subt_Sgf_module_Sgf_AS_N50, 
        Add_Subt_Sgf_module_Sgf_AS_N49, Add_Subt_Sgf_module_Sgf_AS_N48, 
        Add_Subt_Sgf_module_Sgf_AS_N47, Add_Subt_Sgf_module_Sgf_AS_N46, 
        Add_Subt_Sgf_module_Sgf_AS_N45, Add_Subt_Sgf_module_Sgf_AS_N44, 
        Add_Subt_Sgf_module_Sgf_AS_N43, Add_Subt_Sgf_module_Sgf_AS_N42, 
        Add_Subt_Sgf_module_Sgf_AS_N41, Add_Subt_Sgf_module_Sgf_AS_N40, 
        Add_Subt_Sgf_module_Sgf_AS_N39, Add_Subt_Sgf_module_Sgf_AS_N38, 
        Add_Subt_Sgf_module_Sgf_AS_N37, Add_Subt_Sgf_module_Sgf_AS_N36, 
        Add_Subt_Sgf_module_Sgf_AS_N35, Add_Subt_Sgf_module_Sgf_AS_N34, 
        Add_Subt_Sgf_module_Sgf_AS_N33, Add_Subt_Sgf_module_Sgf_AS_N32, 
        Add_Subt_Sgf_module_Sgf_AS_N31, Add_Subt_Sgf_module_Sgf_AS_N30, 
        Add_Subt_Sgf_module_Sgf_AS_N29, Add_Subt_Sgf_module_Sgf_AS_N28, 
        Add_Subt_Sgf_module_Sgf_AS_N27, Add_Subt_Sgf_module_Sgf_AS_N26, 
        Add_Subt_Sgf_module_Sgf_AS_N25, Add_Subt_Sgf_module_Sgf_AS_N24, 
        Add_Subt_Sgf_module_Sgf_AS_N23, Add_Subt_Sgf_module_Sgf_AS_N22, 
        Add_Subt_Sgf_module_Sgf_AS_N21, Add_Subt_Sgf_module_Sgf_AS_N20, 
        Add_Subt_Sgf_module_Sgf_AS_N19, Add_Subt_Sgf_module_Sgf_AS_N18, 
        Add_Subt_Sgf_module_Sgf_AS_N17, Add_Subt_Sgf_module_Sgf_AS_N16, 
        Add_Subt_Sgf_module_Sgf_AS_N15, Add_Subt_Sgf_module_Sgf_AS_N14, 
        Add_Subt_Sgf_module_Sgf_AS_N13, Add_Subt_Sgf_module_Sgf_AS_N12, 
        Add_Subt_Sgf_module_Sgf_AS_N11, Add_Subt_Sgf_module_Sgf_AS_N10, 
        Add_Subt_Sgf_module_Sgf_AS_N9, Add_Subt_Sgf_module_Sgf_AS_N8, 
        Add_Subt_Sgf_module_Sgf_AS_N7, Add_Subt_Sgf_module_Sgf_AS_N6, 
        Add_Subt_Sgf_module_Sgf_AS_N5, Add_Subt_Sgf_module_Sgf_AS_N4, 
        Add_Subt_Sgf_module_Sgf_AS_N3}) );
  FPU_Add_Subtract_Function_W64_EW11_SW52_SWR55_EWR6_DW01_add_0 Add_Subt_Sgf_module_Sgf_AS_add_36 ( 
        .A({1'b0, S_A_S_Oper_A_54_, n284, n283, n281, n282, n280, n279, n277, 
        n278, n276, n275, n272, n274, n271, n273, n268, n270, n267, n269, n264, 
        n266, n263, n265, n262, n248, n247, n253, n245, n254, n246, n255, n249, 
        n256, n250, n257, n251, n258, n232, n233, n252, n243, n236, n235, n237, 
        n244, n239, n240, n234, n238, n241, n242, n231, n230, n187, n186}), 
        .B({1'b0, n224, n223, n226, n225, n220, n218, n219, n217, n174, n172, 
        n173, n171, n170, n168, n169, n167, n166, n165, n216, n214, n215, n213, 
        n212, n210, n211, n209, n208, n203, n201, n196, n193, n207, n204, n200, 
        n198, n197, n192, n259, S_A_S_Oper_B[16], n206, n199, n202, n194, n205, 
        n195, n163, n260, n191, n190, n164, n261, S_A_S_Oper_B[3:2], n229, 
        n228}), .CI(1'b0), .SUM({Add_Subt_Sgf_module_Sgf_AS_N114, 
        Add_Subt_Sgf_module_Sgf_AS_N113, Add_Subt_Sgf_module_Sgf_AS_N112, 
        Add_Subt_Sgf_module_Sgf_AS_N111, Add_Subt_Sgf_module_Sgf_AS_N110, 
        Add_Subt_Sgf_module_Sgf_AS_N109, Add_Subt_Sgf_module_Sgf_AS_N108, 
        Add_Subt_Sgf_module_Sgf_AS_N107, Add_Subt_Sgf_module_Sgf_AS_N106, 
        Add_Subt_Sgf_module_Sgf_AS_N105, Add_Subt_Sgf_module_Sgf_AS_N104, 
        Add_Subt_Sgf_module_Sgf_AS_N103, Add_Subt_Sgf_module_Sgf_AS_N102, 
        Add_Subt_Sgf_module_Sgf_AS_N101, Add_Subt_Sgf_module_Sgf_AS_N100, 
        Add_Subt_Sgf_module_Sgf_AS_N99, Add_Subt_Sgf_module_Sgf_AS_N98, 
        Add_Subt_Sgf_module_Sgf_AS_N97, Add_Subt_Sgf_module_Sgf_AS_N96, 
        Add_Subt_Sgf_module_Sgf_AS_N95, Add_Subt_Sgf_module_Sgf_AS_N94, 
        Add_Subt_Sgf_module_Sgf_AS_N93, Add_Subt_Sgf_module_Sgf_AS_N92, 
        Add_Subt_Sgf_module_Sgf_AS_N91, Add_Subt_Sgf_module_Sgf_AS_N90, 
        Add_Subt_Sgf_module_Sgf_AS_N89, Add_Subt_Sgf_module_Sgf_AS_N88, 
        Add_Subt_Sgf_module_Sgf_AS_N87, Add_Subt_Sgf_module_Sgf_AS_N86, 
        Add_Subt_Sgf_module_Sgf_AS_N85, Add_Subt_Sgf_module_Sgf_AS_N84, 
        Add_Subt_Sgf_module_Sgf_AS_N83, Add_Subt_Sgf_module_Sgf_AS_N82, 
        Add_Subt_Sgf_module_Sgf_AS_N81, Add_Subt_Sgf_module_Sgf_AS_N80, 
        Add_Subt_Sgf_module_Sgf_AS_N79, Add_Subt_Sgf_module_Sgf_AS_N78, 
        Add_Subt_Sgf_module_Sgf_AS_N77, Add_Subt_Sgf_module_Sgf_AS_N76, 
        Add_Subt_Sgf_module_Sgf_AS_N75, Add_Subt_Sgf_module_Sgf_AS_N74, 
        Add_Subt_Sgf_module_Sgf_AS_N73, Add_Subt_Sgf_module_Sgf_AS_N72, 
        Add_Subt_Sgf_module_Sgf_AS_N71, Add_Subt_Sgf_module_Sgf_AS_N70, 
        Add_Subt_Sgf_module_Sgf_AS_N69, Add_Subt_Sgf_module_Sgf_AS_N68, 
        Add_Subt_Sgf_module_Sgf_AS_N67, Add_Subt_Sgf_module_Sgf_AS_N66, 
        Add_Subt_Sgf_module_Sgf_AS_N65, Add_Subt_Sgf_module_Sgf_AS_N64, 
        Add_Subt_Sgf_module_Sgf_AS_N63, Add_Subt_Sgf_module_Sgf_AS_N62, 
        Add_Subt_Sgf_module_Sgf_AS_N61, Add_Subt_Sgf_module_Sgf_AS_N60, 
        Add_Subt_Sgf_module_Sgf_AS_N59}) );
  DFFRX2TS Barrel_Shifter_module_Output_Reg_Q_reg_54_ ( .D(
        Barrel_Shifter_module_Output_Reg_n111), .CK(clk), .RN(n308), .Q(
        Sgf_normalized_result[54]), .QN(n162) );
  DFFRX2TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_0_ ( .D(n391), .CK(clk), 
        .RN(n303), .Q(Add_Subt_result[0]), .QN(n161) );
  DFFRX2TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_1_ ( .D(n392), .CK(clk), 
        .RN(n303), .Q(Add_Subt_result[1]), .QN(n66) );
  DFFRX2TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_2_ ( .D(n393), .CK(clk), 
        .RN(n303), .Q(Add_Subt_result[2]), .QN(n83) );
  DFFRX2TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_3_ ( .D(n394), .CK(clk), 
        .RN(n303), .Q(Add_Subt_result[3]), .QN(n159) );
  DFFRX2TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_4_ ( .D(n395), .CK(clk), 
        .RN(n303), .Q(Add_Subt_result[4]), .QN(n84) );
  DFFRX2TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_5_ ( .D(n396), .CK(clk), 
        .RN(n303), .Q(Add_Subt_result[5]), .QN(n85) );
  DFFRX2TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_6_ ( .D(n397), .CK(clk), 
        .RN(n303), .Q(Add_Subt_result[6]), .QN(n160) );
  DFFRX2TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_7_ ( .D(n398), .CK(clk), 
        .RN(n303), .Q(Add_Subt_result[7]), .QN(n146) );
  DFFRX2TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_8_ ( .D(n399), .CK(clk), 
        .RN(n303), .Q(Add_Subt_result[8]), .QN(n80) );
  DFFRX2TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_15_ ( .D(n406), .CK(clk), 
        .RN(n304), .Q(Add_Subt_result[15]), .QN(n151) );
  DFFRX2TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_16_ ( .D(n407), .CK(clk), 
        .RN(n304), .Q(Add_Subt_result[16]), .QN(n78) );
  DFFRX2TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_17_ ( .D(n408), .CK(clk), 
        .RN(n304), .Q(Add_Subt_result[17]), .QN(n64) );
  DFFRX2TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_18_ ( .D(n409), .CK(clk), 
        .RN(n304), .Q(Add_Subt_result[18]), .QN(n144) );
  DFFRX2TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_19_ ( .D(n410), .CK(clk), 
        .RN(n305), .Q(Add_Subt_result[19]), .QN(n153) );
  DFFRX2TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_21_ ( .D(n412), .CK(clk), 
        .RN(n305), .Q(Add_Subt_result[21]), .QN(n65) );
  DFFRX2TS Barrel_Shifter_module_Output_Reg_Q_reg_52_ ( .D(
        Barrel_Shifter_module_Output_Reg_n108), .CK(clk), .RN(n313), .Q(
        Sgf_normalized_result[52]), .QN(n158) );
  DFFRX2TS Barrel_Shifter_module_Output_Reg_Q_reg_53_ ( .D(
        Barrel_Shifter_module_Output_Reg_n109), .CK(clk), .RN(n177), .Q(
        Sgf_normalized_result[53]), .QN(n67) );
  DFFRX2TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_26_ ( .D(n417), .CK(clk), 
        .RN(n305), .Q(Add_Subt_result[26]), .QN(n152) );
  DFFRX2TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_27_ ( .D(n418), .CK(clk), 
        .RN(n305), .Q(Add_Subt_result[27]), .QN(n136) );
  DFFRX2TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_28_ ( .D(n419), .CK(clk), 
        .RN(n305), .Q(Add_Subt_result[28]), .QN(n76) );
  DFFRX2TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_29_ ( .D(n420), .CK(clk), 
        .RN(n306), .Q(Add_Subt_result[29]), .QN(n58) );
  DFFRX2TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_30_ ( .D(n421), .CK(clk), 
        .RN(n306), .Q(Add_Subt_result[30]), .QN(n63) );
  DFFRX2TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_31_ ( .D(n422), .CK(clk), 
        .RN(n306), .Q(Add_Subt_result[31]), .QN(n134) );
  DFFRX2TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_32_ ( .D(n423), .CK(clk), 
        .RN(n306), .Q(Add_Subt_result[32]), .QN(n75) );
  DFFRX2TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_33_ ( .D(n424), .CK(clk), 
        .RN(n306), .Q(Add_Subt_result[33]), .QN(n62) );
  DFFRX2TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_34_ ( .D(n425), .CK(clk), 
        .RN(n306), .Q(Add_Subt_result[34]), .QN(n133) );
  DFFRX2TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_9_ ( .D(n400), .CK(clk), 
        .RN(n304), .Q(Add_Subt_result[9]), .QN(n147) );
  DFFRX2TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_10_ ( .D(n401), .CK(clk), 
        .RN(n304), .Q(Add_Subt_result[10]), .QN(n79) );
  DFFRX2TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_11_ ( .D(n402), .CK(clk), 
        .RN(n304), .Q(Add_Subt_result[11]), .QN(n145) );
  DFFRX2TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_12_ ( .D(n403), .CK(clk), 
        .RN(n304), .Q(Add_Subt_result[12]), .QN(n81) );
  DFFRX2TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_13_ ( .D(n404), .CK(clk), 
        .RN(n304), .Q(Add_Subt_result[13]), .QN(n135) );
  DFFRX2TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_14_ ( .D(n405), .CK(clk), 
        .RN(n304), .Q(Add_Subt_result[14]), .QN(n74) );
  DFFRX2TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_20_ ( .D(n411), .CK(clk), 
        .RN(n305), .Q(Add_Subt_result[20]), .QN(n150) );
  DFFRX2TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_22_ ( .D(n413), .CK(clk), 
        .RN(n305), .Q(Add_Subt_result[22]), .QN(n77) );
  DFFRX2TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_23_ ( .D(n414), .CK(clk), 
        .RN(n305), .Q(Add_Subt_result[23]), .QN(n148) );
  DFFRX2TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_24_ ( .D(n415), .CK(clk), 
        .RN(n305), .Q(Add_Subt_result[24]), .QN(n82) );
  DFFRX2TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_25_ ( .D(n416), .CK(clk), 
        .RN(n305), .Q(Add_Subt_result[25]), .QN(n149) );
  DFFRX2TS Barrel_Shifter_module_Output_Reg_Q_reg_48_ ( .D(
        Barrel_Shifter_module_Output_Reg_n104), .CK(clk), .RN(n313), .Q(
        Sgf_normalized_result[48]), .QN(n155) );
  DFFRX2TS Barrel_Shifter_module_Output_Reg_Q_reg_49_ ( .D(
        Barrel_Shifter_module_Output_Reg_n105), .CK(clk), .RN(n312), .Q(
        Sgf_normalized_result[49]), .QN(n154) );
  DFFRX2TS Barrel_Shifter_module_Output_Reg_Q_reg_50_ ( .D(
        Barrel_Shifter_module_Output_Reg_n106), .CK(clk), .RN(n313), .Q(
        Sgf_normalized_result[50]), .QN(n156) );
  DFFRX2TS Barrel_Shifter_module_Output_Reg_Q_reg_51_ ( .D(
        Barrel_Shifter_module_Output_Reg_n107), .CK(clk), .RN(n312), .Q(
        Sgf_normalized_result[51]), .QN(n157) );
  DFFRX2TS Add_Subt_Sgf_module_Add_overflow_Result_Q_reg_0_ ( .D(n448), .CK(
        clk), .RN(n303), .Q(add_overflow_flag) );
  DFFRX2TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_35_ ( .D(n426), .CK(clk), 
        .RN(n306), .Q(Add_Subt_result[35]), .QN(n137) );
  DFFRX2TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_36_ ( .D(n427), .CK(clk), 
        .RN(n306), .Q(Add_Subt_result[36]), .QN(n128) );
  DFFRX2TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_37_ ( .D(n428), .CK(clk), 
        .RN(n306), .Q(Add_Subt_result[37]), .QN(n61) );
  DFFRX2TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_38_ ( .D(n429), .CK(clk), 
        .RN(n306), .Q(Add_Subt_result[38]), .QN(n73) );
  DFFRX2TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_39_ ( .D(n430), .CK(clk), 
        .RN(n307), .Q(Add_Subt_result[39]), .QN(n126) );
  DFFRX2TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_40_ ( .D(n431), .CK(clk), 
        .RN(n307), .Q(Add_Subt_result[40]), .QN(n72) );
  DFFRX2TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_41_ ( .D(n432), .CK(clk), 
        .RN(n307), .Q(Add_Subt_result[41]), .QN(n127) );
  DFFRX2TS Barrel_Shifter_module_Output_Reg_Q_reg_43_ ( .D(
        Barrel_Shifter_module_Output_Reg_n99), .CK(clk), .RN(n312), .Q(
        Sgf_normalized_result[43]), .QN(n138) );
  DFFRX2TS Barrel_Shifter_module_Output_Reg_Q_reg_44_ ( .D(
        Barrel_Shifter_module_Output_Reg_n100), .CK(clk), .RN(n313), .Q(
        Sgf_normalized_result[44]), .QN(n140) );
  DFFRX2TS Barrel_Shifter_module_Output_Reg_Q_reg_45_ ( .D(
        Barrel_Shifter_module_Output_Reg_n101), .CK(clk), .RN(n312), .Q(
        Sgf_normalized_result[45]), .QN(n141) );
  DFFRX2TS Barrel_Shifter_module_Output_Reg_Q_reg_46_ ( .D(
        Barrel_Shifter_module_Output_Reg_n102), .CK(clk), .RN(n313), .Q(
        Sgf_normalized_result[46]), .QN(n142) );
  DFFRX2TS Barrel_Shifter_module_Output_Reg_Q_reg_47_ ( .D(
        Barrel_Shifter_module_Output_Reg_n103), .CK(clk), .RN(n312), .Q(
        Sgf_normalized_result[47]), .QN(n143) );
  DFFRX2TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_42_ ( .D(n433), .CK(clk), 
        .RN(n307), .Q(Add_Subt_result[42]), .QN(n121) );
  DFFRX2TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_43_ ( .D(n434), .CK(clk), 
        .RN(n307), .Q(Add_Subt_result[43]), .QN(n71) );
  DFFRX2TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_44_ ( .D(n435), .CK(clk), 
        .RN(n307), .Q(Add_Subt_result[44]), .QN(n120) );
  DFFRX2TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_45_ ( .D(n436), .CK(clk), 
        .RN(n307), .Q(Add_Subt_result[45]), .QN(n70) );
  DFFRX2TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_46_ ( .D(n437), .CK(clk), 
        .RN(n307), .Q(Add_Subt_result[46]), .QN(n60) );
  DFFRX2TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_47_ ( .D(n438), .CK(clk), 
        .RN(n307), .Q(Add_Subt_result[47]), .QN(n122) );
  DFFRX2TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_48_ ( .D(n439), .CK(clk), 
        .RN(n307), .Q(Add_Subt_result[48]), .QN(n115) );
  DFFRX2TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_49_ ( .D(n440), .CK(clk), 
        .RN(n308), .Q(Add_Subt_result[49]), .QN(n68) );
  DFFRX2TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_50_ ( .D(n441), .CK(clk), 
        .RN(n308), .Q(Add_Subt_result[50]), .QN(n59) );
  DFFRX2TS Barrel_Shifter_module_Output_Reg_Q_reg_39_ ( .D(
        Barrel_Shifter_module_Output_Reg_n95), .CK(clk), .RN(n314), .Q(
        Sgf_normalized_result[39]), .QN(n129) );
  DFFRX2TS Barrel_Shifter_module_Output_Reg_Q_reg_40_ ( .D(
        Barrel_Shifter_module_Output_Reg_n96), .CK(clk), .RN(n314), .Q(
        Sgf_normalized_result[40]), .QN(n132) );
  DFFRX2TS Barrel_Shifter_module_Output_Reg_Q_reg_41_ ( .D(
        Barrel_Shifter_module_Output_Reg_n97), .CK(clk), .RN(n311), .Q(
        Sgf_normalized_result[41]), .QN(n131) );
  DFFRX2TS Barrel_Shifter_module_Output_Reg_Q_reg_42_ ( .D(
        Barrel_Shifter_module_Output_Reg_n98), .CK(clk), .RN(n177), .Q(
        Sgf_normalized_result[42]), .QN(n139) );
  DFFRX2TS Barrel_Shifter_module_Output_Reg_Q_reg_34_ ( .D(
        Barrel_Shifter_module_Output_Reg_n90), .CK(clk), .RN(n177), .Q(
        Sgf_normalized_result[34]), .QN(n116) );
  DFFRX2TS Barrel_Shifter_module_Output_Reg_Q_reg_35_ ( .D(
        Barrel_Shifter_module_Output_Reg_n91), .CK(clk), .RN(n177), .Q(
        Sgf_normalized_result[35]), .QN(n124) );
  DFFRX2TS Barrel_Shifter_module_Output_Reg_Q_reg_36_ ( .D(
        Barrel_Shifter_module_Output_Reg_n92), .CK(clk), .RN(n177), .Q(
        Sgf_normalized_result[36]), .QN(n125) );
  DFFRX2TS Barrel_Shifter_module_Output_Reg_Q_reg_37_ ( .D(
        Barrel_Shifter_module_Output_Reg_n93), .CK(clk), .RN(n314), .Q(
        Sgf_normalized_result[37]), .QN(n123) );
  DFFRX2TS Barrel_Shifter_module_Output_Reg_Q_reg_38_ ( .D(
        Barrel_Shifter_module_Output_Reg_n94), .CK(clk), .RN(n311), .Q(
        Sgf_normalized_result[38]), .QN(n130) );
  DFFRX2TS Barrel_Shifter_module_Output_Reg_Q_reg_31_ ( .D(
        Barrel_Shifter_module_Output_Reg_n87), .CK(clk), .RN(n311), .Q(
        Sgf_normalized_result[31]), .QN(n117) );
  DFFRX2TS Barrel_Shifter_module_Output_Reg_Q_reg_32_ ( .D(
        Barrel_Shifter_module_Output_Reg_n88), .CK(clk), .RN(n311), .Q(
        Sgf_normalized_result[32]), .QN(n118) );
  DFFRX2TS Barrel_Shifter_module_Output_Reg_Q_reg_33_ ( .D(
        Barrel_Shifter_module_Output_Reg_n89), .CK(clk), .RN(n311), .Q(
        Sgf_normalized_result[33]), .QN(n119) );
  DFFRX2TS Barrel_Shifter_module_Output_Reg_Q_reg_2_ ( .D(
        Barrel_Shifter_module_Output_Reg_n58), .CK(clk), .RN(n308), .Q(
        Sgf_normalized_result[2]) );
  DFFRX2TS Barrel_Shifter_module_Output_Reg_Q_reg_3_ ( .D(
        Barrel_Shifter_module_Output_Reg_n59), .CK(clk), .RN(n309), .Q(
        Sgf_normalized_result[3]) );
  DFFRX2TS Barrel_Shifter_module_Output_Reg_Q_reg_4_ ( .D(
        Barrel_Shifter_module_Output_Reg_n60), .CK(clk), .RN(n309), .Q(
        Sgf_normalized_result[4]), .QN(n90) );
  DFFRX2TS Barrel_Shifter_module_Output_Reg_Q_reg_5_ ( .D(
        Barrel_Shifter_module_Output_Reg_n61), .CK(clk), .RN(n309), .Q(
        Sgf_normalized_result[5]), .QN(n96) );
  DFFRX2TS Barrel_Shifter_module_Output_Reg_Q_reg_6_ ( .D(
        Barrel_Shifter_module_Output_Reg_n62), .CK(clk), .RN(n309), .Q(
        Sgf_normalized_result[6]), .QN(n92) );
  DFFRX2TS Barrel_Shifter_module_Output_Reg_Q_reg_8_ ( .D(
        Barrel_Shifter_module_Output_Reg_n64), .CK(clk), .RN(n309), .Q(
        Sgf_normalized_result[8]), .QN(n89) );
  DFFRX2TS Barrel_Shifter_module_Output_Reg_Q_reg_9_ ( .D(
        Barrel_Shifter_module_Output_Reg_n65), .CK(clk), .RN(n309), .Q(
        Sgf_normalized_result[9]), .QN(n97) );
  DFFRX2TS Barrel_Shifter_module_Output_Reg_Q_reg_10_ ( .D(
        Barrel_Shifter_module_Output_Reg_n66), .CK(clk), .RN(n309), .Q(
        Sgf_normalized_result[10]), .QN(n104) );
  DFFRX2TS Barrel_Shifter_module_Output_Reg_Q_reg_11_ ( .D(
        Barrel_Shifter_module_Output_Reg_n67), .CK(clk), .RN(n309), .Q(
        Sgf_normalized_result[11]), .QN(n107) );
  DFFRX2TS Barrel_Shifter_module_Output_Reg_Q_reg_12_ ( .D(
        Barrel_Shifter_module_Output_Reg_n68), .CK(clk), .RN(n309), .Q(
        Sgf_normalized_result[12]), .QN(n112) );
  DFFRX2TS Barrel_Shifter_module_Output_Reg_Q_reg_13_ ( .D(
        Barrel_Shifter_module_Output_Reg_n69), .CK(clk), .RN(n310), .Q(
        Sgf_normalized_result[13]), .QN(n101) );
  DFFRX2TS Barrel_Shifter_module_Output_Reg_Q_reg_14_ ( .D(
        Barrel_Shifter_module_Output_Reg_n70), .CK(clk), .RN(n310), .Q(
        Sgf_normalized_result[14]), .QN(n105) );
  DFFRX2TS Barrel_Shifter_module_Output_Reg_Q_reg_15_ ( .D(
        Barrel_Shifter_module_Output_Reg_n71), .CK(clk), .RN(n310), .Q(
        Sgf_normalized_result[15]), .QN(n108) );
  DFFRX2TS Barrel_Shifter_module_Output_Reg_Q_reg_16_ ( .D(
        Barrel_Shifter_module_Output_Reg_n72), .CK(clk), .RN(n310), .Q(
        Sgf_normalized_result[16]) );
  DFFRX2TS Barrel_Shifter_module_Output_Reg_Q_reg_17_ ( .D(
        Barrel_Shifter_module_Output_Reg_n73), .CK(clk), .RN(n310), .Q(
        Sgf_normalized_result[17]), .QN(n87) );
  DFFRX2TS Barrel_Shifter_module_Output_Reg_Q_reg_18_ ( .D(
        Barrel_Shifter_module_Output_Reg_n74), .CK(clk), .RN(n310), .Q(
        Sgf_normalized_result[18]), .QN(n88) );
  DFFRX2TS Barrel_Shifter_module_Output_Reg_Q_reg_19_ ( .D(
        Barrel_Shifter_module_Output_Reg_n75), .CK(clk), .RN(n310), .Q(
        Sgf_normalized_result[19]), .QN(n110) );
  DFFRX2TS Barrel_Shifter_module_Output_Reg_Q_reg_20_ ( .D(
        Barrel_Shifter_module_Output_Reg_n76), .CK(clk), .RN(n310), .Q(
        Sgf_normalized_result[20]), .QN(n99) );
  DFFRX2TS Barrel_Shifter_module_Output_Reg_Q_reg_21_ ( .D(
        Barrel_Shifter_module_Output_Reg_n77), .CK(clk), .RN(n310), .Q(
        Sgf_normalized_result[21]), .QN(n100) );
  DFFRX2TS Barrel_Shifter_module_Output_Reg_Q_reg_22_ ( .D(
        Barrel_Shifter_module_Output_Reg_n78), .CK(clk), .RN(n310), .Q(
        Sgf_normalized_result[22]), .QN(n106) );
  DFFRX2TS Barrel_Shifter_module_Output_Reg_Q_reg_23_ ( .D(
        Barrel_Shifter_module_Output_Reg_n79), .CK(clk), .RN(n314), .Q(
        Sgf_normalized_result[23]), .QN(n109) );
  DFFRX2TS Barrel_Shifter_module_Output_Reg_Q_reg_24_ ( .D(
        Barrel_Shifter_module_Output_Reg_n80), .CK(clk), .RN(n311), .Q(
        Sgf_normalized_result[24]), .QN(n102) );
  DFFRX2TS Barrel_Shifter_module_Output_Reg_Q_reg_25_ ( .D(
        Barrel_Shifter_module_Output_Reg_n81), .CK(clk), .RN(n313), .Q(
        Sgf_normalized_result[25]), .QN(n103) );
  DFFRX2TS Barrel_Shifter_module_Output_Reg_Q_reg_26_ ( .D(
        Barrel_Shifter_module_Output_Reg_n82), .CK(clk), .RN(n312), .Q(
        Sgf_normalized_result[26]), .QN(n91) );
  DFFRX2TS Barrel_Shifter_module_Output_Reg_Q_reg_27_ ( .D(
        Barrel_Shifter_module_Output_Reg_n83), .CK(clk), .RN(n313), .Q(
        Sgf_normalized_result[27]), .QN(n93) );
  DFFRX2TS Barrel_Shifter_module_Output_Reg_Q_reg_28_ ( .D(
        Barrel_Shifter_module_Output_Reg_n84), .CK(clk), .RN(n312), .Q(
        Sgf_normalized_result[28]), .QN(n94) );
  DFFRX2TS Barrel_Shifter_module_Output_Reg_Q_reg_29_ ( .D(
        Barrel_Shifter_module_Output_Reg_n85), .CK(clk), .RN(n313), .Q(
        Sgf_normalized_result[29]), .QN(n95) );
  DFFRX2TS Barrel_Shifter_module_Output_Reg_Q_reg_30_ ( .D(
        Barrel_Shifter_module_Output_Reg_n86), .CK(clk), .RN(n312), .Q(
        Sgf_normalized_result[30]), .QN(n98) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_51_ ( .D(n442), .CK(clk), 
        .RN(n308), .Q(Add_Subt_result[51]), .QN(n69) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_52_ ( .D(n443), .CK(clk), 
        .RN(n308), .Q(Add_Subt_result[52]), .QN(n114) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_53_ ( .D(n444), .CK(clk), 
        .RN(n308), .Q(Add_Subt_result[53]), .QN(n56) );
  DFFRHQX4TS Sel_D_Q_reg_0_ ( .D(n446), .CK(clk), .RN(n447), .Q(n181) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_54_ ( .D(n445), .CK(clk), 
        .RN(n308), .Q(Add_Subt_result[54]), .QN(n113) );
  DFFRXLTS Barrel_Shifter_module_Output_Reg_Q_reg_7_ ( .D(
        Barrel_Shifter_module_Output_Reg_n63), .CK(clk), .RN(n309), .Q(
        Sgf_normalized_result[7]), .QN(n111) );
  DFFRX1TS Barrel_Shifter_module_Output_Reg_Q_reg_0_ ( .D(
        Barrel_Shifter_module_Output_Reg_n56), .CK(clk), .RN(n308), .Q(
        Sgf_normalized_result[0]), .QN(n86) );
  DFFRX1TS Barrel_Shifter_module_Output_Reg_Q_reg_1_ ( .D(
        Barrel_Shifter_module_Output_Reg_n57), .CK(clk), .RN(n308), .Q(
        Sgf_normalized_result[1]), .QN(n57) );
  INVX2TS U58 ( .A(n324), .Y(n185) );
  BUFX6TS U59 ( .A(n326), .Y(n324) );
  INVX2TS U60 ( .A(n181), .Y(n326) );
  CLKMX2X2TS U61 ( .A(DMP[1]), .B(Sgf_normalized_result[3]), .S0(n318), .Y(
        n231) );
  INVX2TS U62 ( .A(n324), .Y(n317) );
  CLKMX2X2TS U63 ( .A(DMP[11]), .B(Sgf_normalized_result[13]), .S0(n317), .Y(
        n236) );
  NAND2X1TS U64 ( .A(n182), .B(n183), .Y(n239) );
  CLKMX2X2TS U65 ( .A(DMP[16]), .B(Sgf_normalized_result[18]), .S0(n316), .Y(
        n258) );
  NOR2X1TS U66 ( .A(n316), .B(n87), .Y(n259) );
  NOR2X1TS U67 ( .A(n317), .B(n89), .Y(n260) );
  NOR2X1TS U68 ( .A(n317), .B(n90), .Y(n261) );
  INVX2TS U69 ( .A(n335), .Y(S_A_S_Oper_B[3]) );
  OR2X2TS U70 ( .A(n322), .B(Sgf_normalized_result[2]), .Y(S_A_S_Oper_B[2]) );
  NOR2X1TS U71 ( .A(n317), .B(n57), .Y(n229) );
  INVX2TS U72 ( .A(n324), .Y(n227) );
  NOR2X1TS U73 ( .A(n184), .B(n105), .Y(n199) );
  CLKINVX1TS U74 ( .A(n324), .Y(n184) );
  NOR2X1TS U75 ( .A(n227), .B(n86), .Y(n228) );
  NOR2X1TS U76 ( .A(n185), .B(n108), .Y(n206) );
  INVX1TS U77 ( .A(n325), .Y(n321) );
  INVX2TS U78 ( .A(n324), .Y(n316) );
  INVXLTS U79 ( .A(n325), .Y(n320) );
  CLKINVX2TS U80 ( .A(n324), .Y(n322) );
  NOR2X1TS U81 ( .A(n316), .B(n97), .Y(n163) );
  NOR2X1TS U82 ( .A(n316), .B(n96), .Y(n164) );
  NOR2X1TS U83 ( .A(n319), .B(n123), .Y(n165) );
  NOR2X1TS U84 ( .A(n319), .B(n130), .Y(n166) );
  NOR2X1TS U85 ( .A(n319), .B(n129), .Y(n167) );
  NOR2X1TS U86 ( .A(n319), .B(n131), .Y(n168) );
  NOR2X1TS U87 ( .A(n319), .B(n132), .Y(n169) );
  NOR2X1TS U88 ( .A(n319), .B(n139), .Y(n170) );
  NOR2X1TS U89 ( .A(n319), .B(n138), .Y(n171) );
  NOR2X1TS U90 ( .A(n319), .B(n141), .Y(n172) );
  NOR2X1TS U91 ( .A(n319), .B(n140), .Y(n173) );
  NOR2X1TS U92 ( .A(n319), .B(n142), .Y(n174) );
  NOR2X1TS U93 ( .A(n337), .B(n302), .Y(n175) );
  NOR2X1TS U94 ( .A(n302), .B(n336), .Y(n176) );
  INVX2TS U95 ( .A(rst), .Y(n177) );
  INVX2TS U96 ( .A(n177), .Y(n178) );
  CLKMX2X2TS U97 ( .A(DMP[2]), .B(Sgf_normalized_result[4]), .S0(n185), .Y(
        n242) );
  INVXLTS U98 ( .A(n324), .Y(n179) );
  INVXLTS U99 ( .A(n324), .Y(n180) );
  CLKMX2X2TS U100 ( .A(DMP[6]), .B(Sgf_normalized_result[8]), .S0(n317), .Y(
        n240) );
  MX2X1TS U101 ( .A(DMP[3]), .B(Sgf_normalized_result[5]), .S0(n317), .Y(n241)
         );
  NAND2X1TS U102 ( .A(DMP[7]), .B(n323), .Y(n182) );
  NAND2XLTS U103 ( .A(Sgf_normalized_result[9]), .B(n180), .Y(n183) );
  MX2X1TS U104 ( .A(DMP[13]), .B(Sgf_normalized_result[15]), .S0(n317), .Y(
        n252) );
  MX2X1TS U105 ( .A(DMP[12]), .B(Sgf_normalized_result[14]), .S0(n179), .Y(
        n243) );
  NOR2XLTS U106 ( .A(n320), .B(n102), .Y(n193) );
  MX2XLTS U107 ( .A(DMP[17]), .B(Sgf_normalized_result[19]), .S0(n322), .Y(
        n251) );
  NOR2XLTS U108 ( .A(n320), .B(n103), .Y(n196) );
  MX2XLTS U109 ( .A(DMP[18]), .B(Sgf_normalized_result[20]), .S0(n185), .Y(
        n257) );
  CLKMX2X2TS U110 ( .A(DMP[23]), .B(Sgf_normalized_result[25]), .S0(n315), .Y(
        n246) );
  CLKBUFX2TS U111 ( .A(n326), .Y(n325) );
  NOR2XLTS U112 ( .A(n184), .B(n101), .Y(n202) );
  MX2XLTS U113 ( .A(DMP[5]), .B(Sgf_normalized_result[7]), .S0(n227), .Y(n234)
         );
  NOR2X1TS U114 ( .A(n185), .B(n91), .Y(n201) );
  NAND2BX1TS U115 ( .AN(n180), .B(Sgf_normalized_result[3]), .Y(n335) );
  NOR2X1TS U116 ( .A(n86), .B(n323), .Y(n186) );
  NOR2X1TS U117 ( .A(n322), .B(n98), .Y(n211) );
  NOR2XLTS U118 ( .A(n320), .B(n110), .Y(n197) );
  NOR2XLTS U119 ( .A(n180), .B(n111), .Y(n191) );
  NOR2XLTS U120 ( .A(n316), .B(n112), .Y(n194) );
  MX2X1TS U121 ( .A(DMP[9]), .B(Sgf_normalized_result[11]), .S0(n184), .Y(n237) );
  MX2X1TS U122 ( .A(DMP[8]), .B(Sgf_normalized_result[10]), .S0(n322), .Y(n244) );
  MX2XLTS U123 ( .A(DMP[19]), .B(Sgf_normalized_result[21]), .S0(n184), .Y(
        n250) );
  CLKMX2X2TS U124 ( .A(DMP[0]), .B(Sgf_normalized_result[2]), .S0(n318), .Y(
        n230) );
  MX2XLTS U125 ( .A(DMP[15]), .B(Sgf_normalized_result[17]), .S0(n180), .Y(
        n232) );
  MX2XLTS U126 ( .A(DMP[10]), .B(Sgf_normalized_result[12]), .S0(n227), .Y(
        n235) );
  OAI2BB1XLTS U127 ( .A0N(n302), .A1N(Add_Subt_result[54]), .B0(n188), .Y(n445) );
  NAND2BX1TS U128 ( .AN(n321), .B(Sgf_normalized_result[16]), .Y(n334) );
  CLKBUFX2TS U129 ( .A(n326), .Y(n323) );
  NOR2XLTS U130 ( .A(n57), .B(n324), .Y(n187) );
  NAND2XLTS U131 ( .A(real_op), .B(n325), .Y(n336) );
  MX2XLTS U132 ( .A(DMP[29]), .B(Sgf_normalized_result[31]), .S0(n315), .Y(
        n262) );
  MX2XLTS U133 ( .A(DMP[31]), .B(Sgf_normalized_result[33]), .S0(n315), .Y(
        n263) );
  MX2XLTS U134 ( .A(DMP[30]), .B(Sgf_normalized_result[32]), .S0(n315), .Y(
        n265) );
  MX2X1TS U135 ( .A(DMP[20]), .B(Sgf_normalized_result[22]), .S0(n184), .Y(
        n256) );
  MX2X1TS U136 ( .A(DMP[21]), .B(Sgf_normalized_result[23]), .S0(n179), .Y(
        n249) );
  MX2X1TS U137 ( .A(DMP[24]), .B(Sgf_normalized_result[26]), .S0(n315), .Y(
        n254) );
  MX2X1TS U138 ( .A(DMP[26]), .B(Sgf_normalized_result[28]), .S0(n315), .Y(
        n253) );
  MX2X1TS U139 ( .A(DMP[25]), .B(Sgf_normalized_result[27]), .S0(n315), .Y(
        n245) );
  MX2X1TS U140 ( .A(DMP[27]), .B(Sgf_normalized_result[29]), .S0(n315), .Y(
        n247) );
  MX2XLTS U141 ( .A(DMP[28]), .B(Sgf_normalized_result[30]), .S0(n315), .Y(
        n248) );
  CLKMX2X2TS U142 ( .A(DMP[14]), .B(Sgf_normalized_result[16]), .S0(n317), .Y(
        n233) );
  MX2X1TS U143 ( .A(DMP[4]), .B(Sgf_normalized_result[6]), .S0(n227), .Y(n238)
         );
  AOI22X1TS U144 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N57), .A1(n291), .B0(
        Add_Subt_Sgf_module_Sgf_AS_N113), .B1(n285), .Y(n188) );
  OAI2BB1X1TS U145 ( .A0N(n299), .A1N(add_overflow_flag), .B0(n189), .Y(n448)
         );
  AOI22X1TS U146 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N58), .A1(n296), .B0(
        Add_Subt_Sgf_module_Sgf_AS_N114), .B1(n290), .Y(n189) );
  NOR2X1TS U147 ( .A(n227), .B(n92), .Y(n190) );
  NOR2X1TS U148 ( .A(n322), .B(n88), .Y(n192) );
  NOR2XLTS U149 ( .A(n321), .B(n104), .Y(n195) );
  NOR2X1TS U150 ( .A(n185), .B(n99), .Y(n198) );
  NOR2X1TS U151 ( .A(n317), .B(n100), .Y(n200) );
  NOR2X1TS U152 ( .A(n322), .B(n93), .Y(n203) );
  NOR2XLTS U153 ( .A(n320), .B(n106), .Y(n204) );
  NOR2XLTS U154 ( .A(n321), .B(n107), .Y(n205) );
  NOR2XLTS U155 ( .A(n320), .B(n109), .Y(n207) );
  NOR2X1TS U156 ( .A(n321), .B(n94), .Y(n208) );
  NOR2X1TS U157 ( .A(n321), .B(n95), .Y(n209) );
  NOR2XLTS U158 ( .A(n321), .B(n117), .Y(n210) );
  NOR2XLTS U159 ( .A(n322), .B(n118), .Y(n212) );
  NOR2XLTS U160 ( .A(n320), .B(n119), .Y(n213) );
  NOR2XLTS U161 ( .A(n320), .B(n124), .Y(n214) );
  NOR2XLTS U162 ( .A(n321), .B(n116), .Y(n215) );
  NOR2XLTS U163 ( .A(n321), .B(n125), .Y(n216) );
  NOR2XLTS U164 ( .A(n318), .B(n143), .Y(n217) );
  NOR2XLTS U165 ( .A(n318), .B(n154), .Y(n218) );
  NOR2XLTS U166 ( .A(n318), .B(n155), .Y(n219) );
  NOR2XLTS U167 ( .A(n318), .B(n156), .Y(n220) );
  OAI2BB1X1TS U168 ( .A0N(n297), .A1N(Add_Subt_result[1]), .B0(n221), .Y(n392)
         );
  AOI22X1TS U169 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N4), .A1(n296), .B0(
        Add_Subt_Sgf_module_Sgf_AS_N60), .B1(n290), .Y(n221) );
  OAI2BB1X1TS U170 ( .A0N(n297), .A1N(Add_Subt_result[0]), .B0(n222), .Y(n391)
         );
  AOI22X1TS U171 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N3), .A1(n296), .B0(
        Add_Subt_Sgf_module_Sgf_AS_N59), .B1(n290), .Y(n222) );
  NOR2XLTS U172 ( .A(n318), .B(n67), .Y(n223) );
  NOR2XLTS U173 ( .A(n318), .B(n162), .Y(n224) );
  NOR2XLTS U174 ( .A(n318), .B(n157), .Y(n225) );
  NOR2XLTS U175 ( .A(n318), .B(n158), .Y(n226) );
  OR2XLTS U176 ( .A(Sgf_normalized_result[54]), .B(n323), .Y(S_A_S_Oper_A_54_)
         );
  CLKBUFX2TS U177 ( .A(n390), .Y(n301) );
  CLKBUFX2TS U178 ( .A(n390), .Y(n300) );
  CLKBUFX2TS U179 ( .A(n390), .Y(n298) );
  CLKBUFX2TS U180 ( .A(n390), .Y(n297) );
  CLKBUFX2TS U181 ( .A(n390), .Y(n299) );
  CLKBUFX2TS U182 ( .A(n390), .Y(n302) );
  INVX2TS U183 ( .A(FSM_Add_Subt_Sgf_load), .Y(n390) );
  CLKBUFX2TS U184 ( .A(n331), .Y(n329) );
  CLKBUFX2TS U185 ( .A(n332), .Y(n328) );
  CLKBUFX2TS U186 ( .A(n332), .Y(n327) );
  CLKBUFX2TS U187 ( .A(n176), .Y(n291) );
  CLKBUFX2TS U188 ( .A(n176), .Y(n292) );
  CLKBUFX2TS U189 ( .A(n176), .Y(n293) );
  CLKBUFX2TS U190 ( .A(n176), .Y(n294) );
  CLKBUFX2TS U191 ( .A(n176), .Y(n295) );
  CLKBUFX2TS U192 ( .A(n175), .Y(n285) );
  CLKBUFX2TS U193 ( .A(n175), .Y(n286) );
  CLKBUFX2TS U194 ( .A(n175), .Y(n287) );
  CLKBUFX2TS U195 ( .A(n175), .Y(n288) );
  CLKBUFX2TS U196 ( .A(n175), .Y(n289) );
  CLKBUFX2TS U197 ( .A(n331), .Y(n330) );
  CLKBUFX2TS U198 ( .A(n176), .Y(n296) );
  CLKBUFX2TS U199 ( .A(n175), .Y(n290) );
  INVX2TS U200 ( .A(rst_int), .Y(n447) );
  INVX2TS U201 ( .A(n323), .Y(n315) );
  INVX2TS U202 ( .A(n323), .Y(n318) );
  INVX2TS U203 ( .A(n323), .Y(n319) );
  INVX2TS U204 ( .A(n336), .Y(n337) );
  CLKBUFX2TS U205 ( .A(FSM_barrel_shifter_load), .Y(n331) );
  CLKBUFX2TS U206 ( .A(FSM_barrel_shifter_load), .Y(n332) );
  CLKBUFX2TS U207 ( .A(FSM_op_start_in_load_a), .Y(n333) );
  CLKBUFX2TS U208 ( .A(n313), .Y(n307) );
  CLKBUFX2TS U209 ( .A(n311), .Y(n306) );
  CLKBUFX2TS U210 ( .A(n314), .Y(n305) );
  CLKBUFX2TS U211 ( .A(n314), .Y(n304) );
  CLKBUFX2TS U212 ( .A(n314), .Y(n303) );
  CLKBUFX2TS U213 ( .A(n312), .Y(n310) );
  CLKBUFX2TS U214 ( .A(n312), .Y(n309) );
  CLKBUFX2TS U215 ( .A(n313), .Y(n308) );
  CLKBUFX2TS U216 ( .A(n177), .Y(n314) );
  CLKBUFX2TS U217 ( .A(n177), .Y(n311) );
  CLKBUFX2TS U218 ( .A(n177), .Y(n312) );
  CLKBUFX2TS U219 ( .A(n177), .Y(n313) );
  CLKMX2X2TS U220 ( .A(DMP[22]), .B(Sgf_normalized_result[24]), .S0(n315), .Y(
        n255) );
  INVX2TS U221 ( .A(n334), .Y(S_A_S_Oper_B[16]) );
  AO21X1TS U222 ( .A0(n302), .A1(Add_Subt_result[53]), .B0(n338), .Y(n444) );
  AO22X1TS U223 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N56), .A1(n291), .B0(
        Add_Subt_Sgf_module_Sgf_AS_N112), .B1(n285), .Y(n338) );
  AO21X1TS U224 ( .A0(n302), .A1(Add_Subt_result[52]), .B0(n339), .Y(n443) );
  AO22X1TS U225 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N55), .A1(n291), .B0(
        Add_Subt_Sgf_module_Sgf_AS_N111), .B1(n285), .Y(n339) );
  CLKMX2X2TS U226 ( .A(DMP[33]), .B(Sgf_normalized_result[35]), .S0(n321), .Y(
        n264) );
  AO21X1TS U227 ( .A0(n302), .A1(Add_Subt_result[51]), .B0(n340), .Y(n442) );
  AO22X1TS U228 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N54), .A1(n291), .B0(
        Add_Subt_Sgf_module_Sgf_AS_N110), .B1(n285), .Y(n340) );
  AO21X1TS U229 ( .A0(n302), .A1(Add_Subt_result[50]), .B0(n341), .Y(n441) );
  AO22X1TS U230 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N53), .A1(n291), .B0(
        Add_Subt_Sgf_module_Sgf_AS_N109), .B1(n285), .Y(n341) );
  AO21X1TS U231 ( .A0(n302), .A1(Add_Subt_result[49]), .B0(n342), .Y(n440) );
  AO22X1TS U232 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N52), .A1(n291), .B0(
        Add_Subt_Sgf_module_Sgf_AS_N108), .B1(n285), .Y(n342) );
  AO21X1TS U233 ( .A0(n301), .A1(Add_Subt_result[48]), .B0(n343), .Y(n439) );
  AO22X1TS U234 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N51), .A1(n291), .B0(
        Add_Subt_Sgf_module_Sgf_AS_N107), .B1(n285), .Y(n343) );
  AO21X1TS U235 ( .A0(n301), .A1(Add_Subt_result[47]), .B0(n344), .Y(n438) );
  AO22X1TS U236 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N50), .A1(n291), .B0(
        Add_Subt_Sgf_module_Sgf_AS_N106), .B1(n285), .Y(n344) );
  CLKMX2X2TS U237 ( .A(DMP[32]), .B(Sgf_normalized_result[34]), .S0(n184), .Y(
        n266) );
  CLKMX2X2TS U238 ( .A(DMP[35]), .B(Sgf_normalized_result[37]), .S0(n227), .Y(
        n267) );
  CLKMX2X2TS U239 ( .A(DMP[37]), .B(Sgf_normalized_result[39]), .S0(n227), .Y(
        n268) );
  AO21X1TS U240 ( .A0(n301), .A1(Add_Subt_result[46]), .B0(n345), .Y(n437) );
  AO22X1TS U241 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N49), .A1(n291), .B0(
        Add_Subt_Sgf_module_Sgf_AS_N105), .B1(n285), .Y(n345) );
  AO21X1TS U242 ( .A0(n301), .A1(Add_Subt_result[45]), .B0(n346), .Y(n436) );
  AO22X1TS U243 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N48), .A1(n291), .B0(
        Add_Subt_Sgf_module_Sgf_AS_N104), .B1(n285), .Y(n346) );
  AO21X1TS U244 ( .A0(n301), .A1(Add_Subt_result[44]), .B0(n347), .Y(n435) );
  AO22X1TS U245 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N47), .A1(n292), .B0(
        Add_Subt_Sgf_module_Sgf_AS_N103), .B1(n286), .Y(n347) );
  AO21X1TS U246 ( .A0(n301), .A1(Add_Subt_result[43]), .B0(n348), .Y(n434) );
  AO22X1TS U247 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N46), .A1(n292), .B0(
        Add_Subt_Sgf_module_Sgf_AS_N102), .B1(n286), .Y(n348) );
  CLKMX2X2TS U248 ( .A(DMP[34]), .B(Sgf_normalized_result[36]), .S0(n316), .Y(
        n269) );
  CLKMX2X2TS U249 ( .A(DMP[36]), .B(Sgf_normalized_result[38]), .S0(n185), .Y(
        n270) );
  CLKMX2X2TS U250 ( .A(DMP[39]), .B(Sgf_normalized_result[41]), .S0(n317), .Y(
        n271) );
  CLKMX2X2TS U251 ( .A(DMP[41]), .B(Sgf_normalized_result[43]), .S0(n185), .Y(
        n272) );
  AO21X1TS U252 ( .A0(n301), .A1(Add_Subt_result[42]), .B0(n349), .Y(n433) );
  AO22X1TS U253 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N45), .A1(n292), .B0(
        Add_Subt_Sgf_module_Sgf_AS_N101), .B1(n286), .Y(n349) );
  AO21X1TS U254 ( .A0(n301), .A1(Add_Subt_result[41]), .B0(n350), .Y(n432) );
  AO22X1TS U255 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N44), .A1(n292), .B0(
        Add_Subt_Sgf_module_Sgf_AS_N100), .B1(n286), .Y(n350) );
  AO21X1TS U256 ( .A0(n301), .A1(Add_Subt_result[40]), .B0(n351), .Y(n431) );
  AO22X1TS U257 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N43), .A1(n292), .B0(
        Add_Subt_Sgf_module_Sgf_AS_N99), .B1(n286), .Y(n351) );
  AO21X1TS U258 ( .A0(n301), .A1(Add_Subt_result[39]), .B0(n352), .Y(n430) );
  AO22X1TS U259 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N42), .A1(n292), .B0(
        Add_Subt_Sgf_module_Sgf_AS_N98), .B1(n286), .Y(n352) );
  AO21X1TS U260 ( .A0(n300), .A1(Add_Subt_result[38]), .B0(n353), .Y(n429) );
  AO22X1TS U261 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N41), .A1(n292), .B0(
        Add_Subt_Sgf_module_Sgf_AS_N97), .B1(n286), .Y(n353) );
  CLKMX2X2TS U262 ( .A(DMP[38]), .B(Sgf_normalized_result[40]), .S0(n316), .Y(
        n273) );
  CLKMX2X2TS U263 ( .A(DMP[40]), .B(Sgf_normalized_result[42]), .S0(n184), .Y(
        n274) );
  CLKMX2X2TS U264 ( .A(DMP[42]), .B(Sgf_normalized_result[44]), .S0(n227), .Y(
        n275) );
  CLKMX2X2TS U265 ( .A(DMP[43]), .B(Sgf_normalized_result[45]), .S0(n227), .Y(
        n276) );
  CLKMX2X2TS U266 ( .A(DMP[45]), .B(Sgf_normalized_result[47]), .S0(n316), .Y(
        n277) );
  OA21XLTS U267 ( .A0(Sgf_normalized_result[0]), .A1(Sgf_normalized_result[1]), 
        .B0(Rounding_Decoder_n4), .Y(round_flag) );
  OAI33XLTS U268 ( .A0(n451), .A1(r_mode[1]), .A2(n449), .B0(n450), .B1(
        sign_final_result), .B2(r_mode[0]), .Y(Rounding_Decoder_n4) );
  INVX2TS U269 ( .A(sign_final_result), .Y(n451) );
  INVX2TS U270 ( .A(r_mode[0]), .Y(n449) );
  AO21X1TS U271 ( .A0(n300), .A1(Add_Subt_result[37]), .B0(n354), .Y(n428) );
  AO22X1TS U272 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N40), .A1(n292), .B0(
        Add_Subt_Sgf_module_Sgf_AS_N96), .B1(n286), .Y(n354) );
  AO21X1TS U273 ( .A0(n300), .A1(Add_Subt_result[36]), .B0(n355), .Y(n427) );
  AO22X1TS U274 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N39), .A1(n292), .B0(
        Add_Subt_Sgf_module_Sgf_AS_N95), .B1(n286), .Y(n355) );
  AO21X1TS U275 ( .A0(n300), .A1(Add_Subt_result[35]), .B0(n356), .Y(n426) );
  AO22X1TS U276 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N38), .A1(n292), .B0(
        Add_Subt_Sgf_module_Sgf_AS_N94), .B1(n286), .Y(n356) );
  AO21X1TS U277 ( .A0(n300), .A1(Add_Subt_result[34]), .B0(n357), .Y(n425) );
  AO22X1TS U278 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N37), .A1(n293), .B0(
        Add_Subt_Sgf_module_Sgf_AS_N93), .B1(n287), .Y(n357) );
  AO21X1TS U279 ( .A0(n300), .A1(Add_Subt_result[30]), .B0(n361), .Y(n421) );
  AO22X1TS U280 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N33), .A1(n293), .B0(
        Add_Subt_Sgf_module_Sgf_AS_N89), .B1(n287), .Y(n361) );
  AO21X1TS U281 ( .A0(n300), .A1(Add_Subt_result[29]), .B0(n362), .Y(n420) );
  AO22X1TS U282 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N32), .A1(n293), .B0(
        Add_Subt_Sgf_module_Sgf_AS_N88), .B1(n287), .Y(n362) );
  AO21X1TS U283 ( .A0(n299), .A1(Add_Subt_result[28]), .B0(n363), .Y(n419) );
  AO22X1TS U284 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N31), .A1(n293), .B0(
        Add_Subt_Sgf_module_Sgf_AS_N87), .B1(n287), .Y(n363) );
  CLKMX2X2TS U285 ( .A(DMP[44]), .B(Sgf_normalized_result[46]), .S0(n322), .Y(
        n278) );
  CLKMX2X2TS U286 ( .A(DMP[46]), .B(Sgf_normalized_result[48]), .S0(n322), .Y(
        n279) );
  NAND2BX1TS U287 ( .AN(selector_D), .B(n323), .Y(n446) );
  INVX2TS U288 ( .A(r_mode[1]), .Y(n450) );
  CLKMX2X2TS U289 ( .A(DMP[47]), .B(Sgf_normalized_result[49]), .S0(n316), .Y(
        n280) );
  CLKMX2X2TS U290 ( .A(DMP[49]), .B(Sgf_normalized_result[51]), .S0(n227), .Y(
        n281) );
  AO21X1TS U291 ( .A0(n300), .A1(Add_Subt_result[33]), .B0(n358), .Y(n424) );
  AO22X1TS U292 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N36), .A1(n293), .B0(
        Add_Subt_Sgf_module_Sgf_AS_N92), .B1(n287), .Y(n358) );
  AO21X1TS U293 ( .A0(n300), .A1(Add_Subt_result[32]), .B0(n359), .Y(n423) );
  AO22X1TS U294 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N35), .A1(n293), .B0(
        Add_Subt_Sgf_module_Sgf_AS_N91), .B1(n287), .Y(n359) );
  AO21X1TS U295 ( .A0(n300), .A1(Add_Subt_result[31]), .B0(n360), .Y(n422) );
  AO22X1TS U296 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N34), .A1(n293), .B0(
        Add_Subt_Sgf_module_Sgf_AS_N90), .B1(n287), .Y(n360) );
  AO21X1TS U297 ( .A0(n299), .A1(Add_Subt_result[27]), .B0(n364), .Y(n418) );
  AO22X1TS U298 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N30), .A1(n293), .B0(
        Add_Subt_Sgf_module_Sgf_AS_N86), .B1(n287), .Y(n364) );
  AO21X1TS U299 ( .A0(n299), .A1(Add_Subt_result[26]), .B0(n365), .Y(n417) );
  AO22X1TS U300 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N29), .A1(n293), .B0(
        Add_Subt_Sgf_module_Sgf_AS_N85), .B1(n287), .Y(n365) );
  AO21X1TS U301 ( .A0(n299), .A1(Add_Subt_result[25]), .B0(n366), .Y(n416) );
  AO22X1TS U302 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N28), .A1(n293), .B0(
        Add_Subt_Sgf_module_Sgf_AS_N84), .B1(n287), .Y(n366) );
  AO21X1TS U303 ( .A0(n299), .A1(Add_Subt_result[24]), .B0(n367), .Y(n415) );
  AO22X1TS U304 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N27), .A1(n294), .B0(
        Add_Subt_Sgf_module_Sgf_AS_N83), .B1(n288), .Y(n367) );
  AO21X1TS U305 ( .A0(n299), .A1(Add_Subt_result[23]), .B0(n368), .Y(n414) );
  AO22X1TS U306 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N26), .A1(n294), .B0(
        Add_Subt_Sgf_module_Sgf_AS_N82), .B1(n288), .Y(n368) );
  AO21X1TS U307 ( .A0(n299), .A1(Add_Subt_result[22]), .B0(n369), .Y(n413) );
  AO22X1TS U308 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N25), .A1(n294), .B0(
        Add_Subt_Sgf_module_Sgf_AS_N81), .B1(n288), .Y(n369) );
  AO21X1TS U309 ( .A0(n299), .A1(Add_Subt_result[21]), .B0(n370), .Y(n412) );
  AO22X1TS U310 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N24), .A1(n294), .B0(
        Add_Subt_Sgf_module_Sgf_AS_N80), .B1(n288), .Y(n370) );
  AO21X1TS U311 ( .A0(n299), .A1(Add_Subt_result[20]), .B0(n371), .Y(n411) );
  AO22X1TS U312 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N23), .A1(n294), .B0(
        Add_Subt_Sgf_module_Sgf_AS_N79), .B1(n288), .Y(n371) );
  AO21X1TS U313 ( .A0(n298), .A1(Add_Subt_result[19]), .B0(n372), .Y(n410) );
  AO22X1TS U314 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N22), .A1(n294), .B0(
        Add_Subt_Sgf_module_Sgf_AS_N78), .B1(n288), .Y(n372) );
  AO21X1TS U315 ( .A0(n298), .A1(Add_Subt_result[18]), .B0(n373), .Y(n409) );
  AO22X1TS U316 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N21), .A1(n294), .B0(
        Add_Subt_Sgf_module_Sgf_AS_N77), .B1(n288), .Y(n373) );
  AO21X1TS U317 ( .A0(n298), .A1(Add_Subt_result[17]), .B0(n374), .Y(n408) );
  AO22X1TS U318 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N20), .A1(n294), .B0(
        Add_Subt_Sgf_module_Sgf_AS_N76), .B1(n288), .Y(n374) );
  AO21X1TS U319 ( .A0(n298), .A1(Add_Subt_result[16]), .B0(n375), .Y(n407) );
  AO22X1TS U320 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N19), .A1(n294), .B0(
        Add_Subt_Sgf_module_Sgf_AS_N75), .B1(n288), .Y(n375) );
  AO21X1TS U321 ( .A0(n298), .A1(Add_Subt_result[15]), .B0(n376), .Y(n406) );
  AO22X1TS U322 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N18), .A1(n294), .B0(
        Add_Subt_Sgf_module_Sgf_AS_N74), .B1(n288), .Y(n376) );
  AO21X1TS U323 ( .A0(n298), .A1(Add_Subt_result[14]), .B0(n377), .Y(n405) );
  AO22X1TS U324 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N17), .A1(n295), .B0(
        Add_Subt_Sgf_module_Sgf_AS_N73), .B1(n289), .Y(n377) );
  AO21X1TS U325 ( .A0(n298), .A1(Add_Subt_result[13]), .B0(n378), .Y(n404) );
  AO22X1TS U326 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N16), .A1(n295), .B0(
        Add_Subt_Sgf_module_Sgf_AS_N72), .B1(n289), .Y(n378) );
  AO21X1TS U327 ( .A0(n298), .A1(Add_Subt_result[12]), .B0(n379), .Y(n403) );
  AO22X1TS U328 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N15), .A1(n295), .B0(
        Add_Subt_Sgf_module_Sgf_AS_N71), .B1(n289), .Y(n379) );
  AO21X1TS U329 ( .A0(n298), .A1(Add_Subt_result[11]), .B0(n380), .Y(n402) );
  AO22X1TS U330 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N14), .A1(n295), .B0(
        Add_Subt_Sgf_module_Sgf_AS_N70), .B1(n289), .Y(n380) );
  AO21X1TS U331 ( .A0(n298), .A1(Add_Subt_result[10]), .B0(n381), .Y(n401) );
  AO22X1TS U332 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N13), .A1(n295), .B0(
        Add_Subt_Sgf_module_Sgf_AS_N69), .B1(n289), .Y(n381) );
  AO21X1TS U333 ( .A0(n297), .A1(Add_Subt_result[9]), .B0(n382), .Y(n400) );
  AO22X1TS U334 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N12), .A1(n295), .B0(
        Add_Subt_Sgf_module_Sgf_AS_N68), .B1(n289), .Y(n382) );
  AO21X1TS U335 ( .A0(n297), .A1(Add_Subt_result[8]), .B0(n383), .Y(n399) );
  AO22X1TS U336 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N11), .A1(n295), .B0(
        Add_Subt_Sgf_module_Sgf_AS_N67), .B1(n289), .Y(n383) );
  AO21X1TS U337 ( .A0(n297), .A1(Add_Subt_result[7]), .B0(n384), .Y(n398) );
  AO22X1TS U338 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N10), .A1(n295), .B0(
        Add_Subt_Sgf_module_Sgf_AS_N66), .B1(n289), .Y(n384) );
  AO21X1TS U339 ( .A0(n297), .A1(Add_Subt_result[6]), .B0(n385), .Y(n397) );
  AO22X1TS U340 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N9), .A1(n295), .B0(
        Add_Subt_Sgf_module_Sgf_AS_N65), .B1(n289), .Y(n385) );
  AO21X1TS U341 ( .A0(n297), .A1(Add_Subt_result[5]), .B0(n386), .Y(n396) );
  AO22X1TS U342 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N8), .A1(n295), .B0(
        Add_Subt_Sgf_module_Sgf_AS_N64), .B1(n289), .Y(n386) );
  CLKMX2X2TS U343 ( .A(DMP[48]), .B(Sgf_normalized_result[50]), .S0(n316), .Y(
        n282) );
  CLKMX2X2TS U344 ( .A(DMP[50]), .B(Sgf_normalized_result[52]), .S0(n320), .Y(
        n283) );
  CLKMX2X2TS U345 ( .A(Sgf_normalized_result[53]), .B(
        Barrel_Shifter_module_Data_Reg[53]), .S0(n330), .Y(
        Barrel_Shifter_module_Output_Reg_n109) );
  CLKMX2X2TS U346 ( .A(Sgf_normalized_result[52]), .B(
        Barrel_Shifter_module_Data_Reg[52]), .S0(n330), .Y(
        Barrel_Shifter_module_Output_Reg_n108) );
  CLKMX2X2TS U347 ( .A(Sgf_normalized_result[51]), .B(
        Barrel_Shifter_module_Data_Reg[51]), .S0(n330), .Y(
        Barrel_Shifter_module_Output_Reg_n107) );
  CLKMX2X2TS U348 ( .A(Sgf_normalized_result[50]), .B(
        Barrel_Shifter_module_Data_Reg[50]), .S0(n330), .Y(
        Barrel_Shifter_module_Output_Reg_n106) );
  CLKMX2X2TS U349 ( .A(Sgf_normalized_result[49]), .B(
        Barrel_Shifter_module_Data_Reg[49]), .S0(n330), .Y(
        Barrel_Shifter_module_Output_Reg_n105) );
  CLKMX2X2TS U350 ( .A(Sgf_normalized_result[54]), .B(
        Barrel_Shifter_module_Data_Reg[54]), .S0(n330), .Y(
        Barrel_Shifter_module_Output_Reg_n111) );
  CLKMX2X2TS U351 ( .A(Sgf_normalized_result[48]), .B(
        Barrel_Shifter_module_Data_Reg[48]), .S0(n329), .Y(
        Barrel_Shifter_module_Output_Reg_n104) );
  CLKMX2X2TS U352 ( .A(Sgf_normalized_result[47]), .B(
        Barrel_Shifter_module_Data_Reg[47]), .S0(n329), .Y(
        Barrel_Shifter_module_Output_Reg_n103) );
  CLKMX2X2TS U353 ( .A(Sgf_normalized_result[46]), .B(
        Barrel_Shifter_module_Data_Reg[46]), .S0(n329), .Y(
        Barrel_Shifter_module_Output_Reg_n102) );
  CLKMX2X2TS U354 ( .A(Sgf_normalized_result[45]), .B(
        Barrel_Shifter_module_Data_Reg[45]), .S0(n329), .Y(
        Barrel_Shifter_module_Output_Reg_n101) );
  CLKMX2X2TS U355 ( .A(Sgf_normalized_result[44]), .B(
        Barrel_Shifter_module_Data_Reg[44]), .S0(n329), .Y(
        Barrel_Shifter_module_Output_Reg_n100) );
  CLKMX2X2TS U356 ( .A(Sgf_normalized_result[43]), .B(
        Barrel_Shifter_module_Data_Reg[43]), .S0(n329), .Y(
        Barrel_Shifter_module_Output_Reg_n99) );
  CLKMX2X2TS U357 ( .A(Sgf_normalized_result[42]), .B(
        Barrel_Shifter_module_Data_Reg[42]), .S0(n329), .Y(
        Barrel_Shifter_module_Output_Reg_n98) );
  CLKMX2X2TS U358 ( .A(Sgf_normalized_result[41]), .B(
        Barrel_Shifter_module_Data_Reg[41]), .S0(n329), .Y(
        Barrel_Shifter_module_Output_Reg_n97) );
  CLKMX2X2TS U359 ( .A(Sgf_normalized_result[40]), .B(
        Barrel_Shifter_module_Data_Reg[40]), .S0(n329), .Y(
        Barrel_Shifter_module_Output_Reg_n96) );
  CLKMX2X2TS U360 ( .A(Sgf_normalized_result[39]), .B(
        Barrel_Shifter_module_Data_Reg[39]), .S0(n329), .Y(
        Barrel_Shifter_module_Output_Reg_n95) );
  CLKMX2X2TS U361 ( .A(Sgf_normalized_result[38]), .B(
        Barrel_Shifter_module_Data_Reg[38]), .S0(n328), .Y(
        Barrel_Shifter_module_Output_Reg_n94) );
  CLKMX2X2TS U362 ( .A(Sgf_normalized_result[37]), .B(
        Barrel_Shifter_module_Data_Reg[37]), .S0(n328), .Y(
        Barrel_Shifter_module_Output_Reg_n93) );
  CLKMX2X2TS U363 ( .A(Sgf_normalized_result[36]), .B(
        Barrel_Shifter_module_Data_Reg[36]), .S0(n328), .Y(
        Barrel_Shifter_module_Output_Reg_n92) );
  CLKMX2X2TS U364 ( .A(Sgf_normalized_result[35]), .B(
        Barrel_Shifter_module_Data_Reg[35]), .S0(n328), .Y(
        Barrel_Shifter_module_Output_Reg_n91) );
  CLKMX2X2TS U365 ( .A(Sgf_normalized_result[34]), .B(
        Barrel_Shifter_module_Data_Reg[34]), .S0(n328), .Y(
        Barrel_Shifter_module_Output_Reg_n90) );
  CLKMX2X2TS U366 ( .A(Sgf_normalized_result[33]), .B(
        Barrel_Shifter_module_Data_Reg[33]), .S0(n328), .Y(
        Barrel_Shifter_module_Output_Reg_n89) );
  CLKMX2X2TS U367 ( .A(Sgf_normalized_result[32]), .B(
        Barrel_Shifter_module_Data_Reg[32]), .S0(n328), .Y(
        Barrel_Shifter_module_Output_Reg_n88) );
  CLKMX2X2TS U368 ( .A(Sgf_normalized_result[31]), .B(
        Barrel_Shifter_module_Data_Reg[31]), .S0(n328), .Y(
        Barrel_Shifter_module_Output_Reg_n87) );
  CLKMX2X2TS U369 ( .A(Sgf_normalized_result[30]), .B(
        Barrel_Shifter_module_Data_Reg[30]), .S0(n328), .Y(
        Barrel_Shifter_module_Output_Reg_n86) );
  CLKMX2X2TS U370 ( .A(Sgf_normalized_result[29]), .B(
        Barrel_Shifter_module_Data_Reg[29]), .S0(n328), .Y(
        Barrel_Shifter_module_Output_Reg_n85) );
  CLKMX2X2TS U371 ( .A(Sgf_normalized_result[28]), .B(
        Barrel_Shifter_module_Data_Reg[28]), .S0(n327), .Y(
        Barrel_Shifter_module_Output_Reg_n84) );
  CLKMX2X2TS U372 ( .A(Sgf_normalized_result[27]), .B(
        Barrel_Shifter_module_Data_Reg[27]), .S0(n327), .Y(
        Barrel_Shifter_module_Output_Reg_n83) );
  CLKMX2X2TS U373 ( .A(Sgf_normalized_result[26]), .B(
        Barrel_Shifter_module_Data_Reg[26]), .S0(n327), .Y(
        Barrel_Shifter_module_Output_Reg_n82) );
  CLKMX2X2TS U374 ( .A(Sgf_normalized_result[25]), .B(
        Barrel_Shifter_module_Data_Reg[25]), .S0(n327), .Y(
        Barrel_Shifter_module_Output_Reg_n81) );
  CLKMX2X2TS U375 ( .A(Sgf_normalized_result[24]), .B(
        Barrel_Shifter_module_Data_Reg[24]), .S0(n327), .Y(
        Barrel_Shifter_module_Output_Reg_n80) );
  CLKMX2X2TS U376 ( .A(Sgf_normalized_result[23]), .B(
        Barrel_Shifter_module_Data_Reg[23]), .S0(n327), .Y(
        Barrel_Shifter_module_Output_Reg_n79) );
  CLKMX2X2TS U377 ( .A(Sgf_normalized_result[22]), .B(
        Barrel_Shifter_module_Data_Reg[22]), .S0(n327), .Y(
        Barrel_Shifter_module_Output_Reg_n78) );
  CLKMX2X2TS U378 ( .A(Sgf_normalized_result[21]), .B(
        Barrel_Shifter_module_Data_Reg[21]), .S0(n327), .Y(
        Barrel_Shifter_module_Output_Reg_n77) );
  CLKMX2X2TS U379 ( .A(Sgf_normalized_result[20]), .B(
        Barrel_Shifter_module_Data_Reg[20]), .S0(n327), .Y(
        Barrel_Shifter_module_Output_Reg_n76) );
  CLKMX2X2TS U380 ( .A(Sgf_normalized_result[19]), .B(
        Barrel_Shifter_module_Data_Reg[19]), .S0(n327), .Y(
        Barrel_Shifter_module_Output_Reg_n75) );
  CLKMX2X2TS U381 ( .A(Sgf_normalized_result[18]), .B(
        Barrel_Shifter_module_Data_Reg[18]), .S0(n331), .Y(
        Barrel_Shifter_module_Output_Reg_n74) );
  CLKMX2X2TS U382 ( .A(Sgf_normalized_result[17]), .B(
        Barrel_Shifter_module_Data_Reg[17]), .S0(n332), .Y(
        Barrel_Shifter_module_Output_Reg_n73) );
  CLKMX2X2TS U383 ( .A(Sgf_normalized_result[16]), .B(
        Barrel_Shifter_module_Data_Reg[16]), .S0(FSM_barrel_shifter_load), .Y(
        Barrel_Shifter_module_Output_Reg_n72) );
  CLKMX2X2TS U384 ( .A(Sgf_normalized_result[15]), .B(
        Barrel_Shifter_module_Data_Reg[15]), .S0(FSM_barrel_shifter_load), .Y(
        Barrel_Shifter_module_Output_Reg_n71) );
  CLKMX2X2TS U385 ( .A(Sgf_normalized_result[14]), .B(
        Barrel_Shifter_module_Data_Reg[14]), .S0(FSM_barrel_shifter_load), .Y(
        Barrel_Shifter_module_Output_Reg_n70) );
  CLKMX2X2TS U386 ( .A(Sgf_normalized_result[13]), .B(
        Barrel_Shifter_module_Data_Reg[13]), .S0(FSM_barrel_shifter_load), .Y(
        Barrel_Shifter_module_Output_Reg_n69) );
  CLKMX2X2TS U387 ( .A(Sgf_normalized_result[12]), .B(
        Barrel_Shifter_module_Data_Reg[12]), .S0(FSM_barrel_shifter_load), .Y(
        Barrel_Shifter_module_Output_Reg_n68) );
  CLKMX2X2TS U388 ( .A(Sgf_normalized_result[11]), .B(
        Barrel_Shifter_module_Data_Reg[11]), .S0(FSM_barrel_shifter_load), .Y(
        Barrel_Shifter_module_Output_Reg_n67) );
  CLKMX2X2TS U389 ( .A(Sgf_normalized_result[10]), .B(
        Barrel_Shifter_module_Data_Reg[10]), .S0(n331), .Y(
        Barrel_Shifter_module_Output_Reg_n66) );
  CLKMX2X2TS U390 ( .A(Sgf_normalized_result[9]), .B(
        Barrel_Shifter_module_Data_Reg[9]), .S0(n332), .Y(
        Barrel_Shifter_module_Output_Reg_n65) );
  CLKMX2X2TS U391 ( .A(Sgf_normalized_result[8]), .B(
        Barrel_Shifter_module_Data_Reg[8]), .S0(n330), .Y(
        Barrel_Shifter_module_Output_Reg_n64) );
  CLKMX2X2TS U392 ( .A(Sgf_normalized_result[7]), .B(
        Barrel_Shifter_module_Data_Reg[7]), .S0(n332), .Y(
        Barrel_Shifter_module_Output_Reg_n63) );
  CLKMX2X2TS U393 ( .A(Sgf_normalized_result[6]), .B(
        Barrel_Shifter_module_Data_Reg[6]), .S0(n330), .Y(
        Barrel_Shifter_module_Output_Reg_n62) );
  CLKMX2X2TS U394 ( .A(Sgf_normalized_result[5]), .B(
        Barrel_Shifter_module_Data_Reg[5]), .S0(n330), .Y(
        Barrel_Shifter_module_Output_Reg_n61) );
  CLKMX2X2TS U395 ( .A(Sgf_normalized_result[4]), .B(
        Barrel_Shifter_module_Data_Reg[4]), .S0(n330), .Y(
        Barrel_Shifter_module_Output_Reg_n60) );
  CLKMX2X2TS U396 ( .A(Sgf_normalized_result[3]), .B(
        Barrel_Shifter_module_Data_Reg[3]), .S0(n331), .Y(
        Barrel_Shifter_module_Output_Reg_n59) );
  CLKMX2X2TS U397 ( .A(Sgf_normalized_result[2]), .B(
        Barrel_Shifter_module_Data_Reg[2]), .S0(n331), .Y(
        Barrel_Shifter_module_Output_Reg_n58) );
  CLKMX2X2TS U398 ( .A(Sgf_normalized_result[1]), .B(
        Barrel_Shifter_module_Data_Reg[1]), .S0(FSM_barrel_shifter_load), .Y(
        Barrel_Shifter_module_Output_Reg_n57) );
  CLKMX2X2TS U399 ( .A(Sgf_normalized_result[0]), .B(
        Barrel_Shifter_module_Data_Reg[0]), .S0(n332), .Y(
        Barrel_Shifter_module_Output_Reg_n56) );
  CLKMX2X2TS U400 ( .A(DMP[51]), .B(Sgf_normalized_result[53]), .S0(n322), .Y(
        n284) );
  AO21X1TS U401 ( .A0(n297), .A1(Add_Subt_result[4]), .B0(n387), .Y(n395) );
  AO22X1TS U402 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N7), .A1(n296), .B0(
        Add_Subt_Sgf_module_Sgf_AS_N63), .B1(n290), .Y(n387) );
  AO21X1TS U403 ( .A0(n297), .A1(Add_Subt_result[3]), .B0(n388), .Y(n394) );
  AO22X1TS U404 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N6), .A1(n296), .B0(
        Add_Subt_Sgf_module_Sgf_AS_N62), .B1(n290), .Y(n388) );
  AO21X1TS U405 ( .A0(n297), .A1(Add_Subt_result[2]), .B0(n389), .Y(n393) );
  AO22X1TS U406 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N5), .A1(n296), .B0(
        Add_Subt_Sgf_module_Sgf_AS_N61), .B1(n290), .Y(n389) );
endmodule

