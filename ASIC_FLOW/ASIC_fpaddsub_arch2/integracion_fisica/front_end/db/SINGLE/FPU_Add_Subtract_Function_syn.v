/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : L-2016.03-SP3
// Date      : Tue Oct 18 20:31:23 2016
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
  wire   n60, n9, n15, n16, n17, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42,
         n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56,
         n1, n3, n5, n6, n7, n8, ctrl_a_o, n11, n13, n18, n19, n59;
  wire   [3:0] state_reg;
  assign ctrl_d_o = ctrl_a_o;

  DFFRX2TS state_reg_reg_3_ ( .D(n55), .CK(clk), .RN(n59), .Q(state_reg[3]), 
        .QN(n9) );
  DFFRX2TS state_reg_reg_1_ ( .D(n54), .CK(clk), .RN(n59), .Q(state_reg[1]), 
        .QN(n16) );
  DFFRX2TS state_reg_reg_0_ ( .D(n56), .CK(clk), .RN(n59), .Q(state_reg[0]), 
        .QN(n17) );
  DFFRX2TS state_reg_reg_2_ ( .D(n53), .CK(clk), .RN(n59), .Q(state_reg[2]), 
        .QN(n15) );
  INVX2TS U3 ( .A(n44), .Y(n1) );
  INVX2TS U4 ( .A(n44), .Y(load_6_o) );
  INVX2TS U5 ( .A(n60), .Y(n3) );
  INVX2TS U6 ( .A(n3), .Y(load_3_o) );
  NAND4X1TS U7 ( .A(add_overflow_i), .B(n31), .C(n46), .D(n47), .Y(A_S_op_o)
         );
  NOR2X1TS U8 ( .A(n16), .B(state_reg[3]), .Y(n51) );
  NAND3X1TS U9 ( .A(n16), .B(n9), .C(n49), .Y(n41) );
  NAND3X1TS U10 ( .A(n16), .B(n9), .C(n50), .Y(n32) );
  NAND3X1TS U11 ( .A(state_reg[1]), .B(n17), .C(n45), .Y(n29) );
  NAND3X1TS U12 ( .A(state_reg[1]), .B(n49), .C(state_reg[3]), .Y(n20) );
  NOR3BX1TS U13 ( .AN(n45), .B(n17), .C(state_reg[1]), .Y(n25) );
  OA21XLTS U14 ( .A0(n36), .A1(load_8_o), .B0(add_overflow_i), .Y(bit_shift_o)
         );
  INVX2TS U15 ( .A(n28), .Y(ctrl_a_o) );
  NAND2X1TS U16 ( .A(n43), .B(n27), .Y(load_5_o) );
  NAND2X1TS U17 ( .A(round_i), .B(n25), .Y(n28) );
  INVX2TS U18 ( .A(round_i), .Y(n8) );
  AOI21X1TS U19 ( .A0(load_2_o), .A1(zero_flag_i), .B0(load_7_o), .Y(n22) );
  NOR3X1TS U20 ( .A(load_2_o), .B(load_1_o), .C(load_7_o), .Y(n31) );
  OAI21X1TS U21 ( .A0(n32), .A1(n5), .B0(n24), .Y(n36) );
  OAI21X1TS U22 ( .A0(n5), .A1(n41), .B0(n33), .Y(load_8_o) );
  NAND2X1TS U23 ( .A(n44), .B(n29), .Y(ctrl_b_load_o) );
  NAND2X1TS U24 ( .A(n32), .B(n24), .Y(load_4_o) );
  NAND2X1TS U25 ( .A(n51), .B(n49), .Y(n43) );
  NAND2X1TS U26 ( .A(n50), .B(n51), .Y(n27) );
  INVX2TS U27 ( .A(n40), .Y(load_2_o) );
  INVX2TS U28 ( .A(n41), .Y(n19) );
  INVX2TS U29 ( .A(norm_iteration_i), .Y(n5) );
  AOI31X1TS U30 ( .A0(n37), .A1(n7), .A2(n38), .B0(n26), .Y(n56) );
  INVX2TS U31 ( .A(n36), .Y(n7) );
  NOR3X1TS U32 ( .A(n25), .B(rst_int), .C(n19), .Y(n38) );
  AOI2BB1X1TS U33 ( .A0N(n40), .A1N(zero_flag_i), .B0(n18), .Y(n37) );
  INVX2TS U34 ( .A(n20), .Y(ready) );
  NAND3X1TS U35 ( .A(n41), .B(n42), .C(n33), .Y(n60) );
  INVX2TS U36 ( .A(n39), .Y(rst_int) );
  INVX2TS U37 ( .A(n32), .Y(n13) );
  INVX2TS U38 ( .A(n29), .Y(n18) );
  NOR2X1TS U39 ( .A(n9), .B(state_reg[2]), .Y(n45) );
  NOR4XLTS U40 ( .A(n48), .B(ctrl_b_load_o), .C(load_5_o), .D(load_4_o), .Y(
        n47) );
  AOI211X1TS U41 ( .A0(n19), .A1(n5), .B0(n50), .C0(n25), .Y(n46) );
  NAND3X1TS U42 ( .A(n20), .B(n39), .C(n42), .Y(n48) );
  OAI22X1TS U43 ( .A0(beg_FSM), .A1(n39), .B0(rst_FSM), .B1(n20), .Y(n26) );
  NAND4BX1TS U44 ( .AN(load_5_o), .B(n33), .C(n34), .D(n35), .Y(n55) );
  AOI211X1TS U45 ( .A0(state_reg[3]), .A1(n26), .B0(n36), .C0(n6), .Y(n35) );
  AOI21X1TS U46 ( .A0(n25), .A1(n8), .B0(n18), .Y(n34) );
  INVX2TS U47 ( .A(n22), .Y(n6) );
  NAND4X1TS U48 ( .A(n27), .B(n28), .C(n29), .D(n30), .Y(n54) );
  AOI221X1TS U49 ( .A0(n13), .A1(n5), .B0(state_reg[1]), .B1(n26), .C0(n11), 
        .Y(n30) );
  INVX2TS U50 ( .A(n31), .Y(n11) );
  NOR2X1TS U51 ( .A(n15), .B(state_reg[0]), .Y(n49) );
  NAND3X1TS U52 ( .A(n21), .B(n22), .C(n23), .Y(n53) );
  NOR4BX1TS U53 ( .AN(n24), .B(n60), .C(n1), .D(n25), .Y(n23) );
  AOI22X1TS U54 ( .A0(n13), .A1(n5), .B0(state_reg[2]), .B1(n26), .Y(n21) );
  NOR2X1TS U55 ( .A(n17), .B(n15), .Y(n50) );
  NOR3X1TS U56 ( .A(state_reg[2]), .B(state_reg[3]), .C(state_reg[1]), .Y(n52)
         );
  AND3X2TS U57 ( .A(n50), .B(state_reg[3]), .C(n16), .Y(load_7_o) );
  NAND3X1TS U58 ( .A(n17), .B(n16), .C(n45), .Y(n44) );
  NAND3X1TS U59 ( .A(n51), .B(n15), .C(state_reg[0]), .Y(n42) );
  NAND2X1TS U60 ( .A(n52), .B(n17), .Y(n39) );
  NAND3X1TS U61 ( .A(n17), .B(n15), .C(n51), .Y(n40) );
  NAND3X1TS U62 ( .A(n49), .B(n16), .C(state_reg[3]), .Y(n24) );
  AND2X2TS U63 ( .A(n52), .B(state_reg[0]), .Y(load_1_o) );
  AOI211X1TS U64 ( .A0(n41), .A1(n32), .B0(n5), .C0(add_overflow_i), .Y(
        left_right_o) );
  NAND3X1TS U65 ( .A(state_reg[0]), .B(state_reg[1]), .C(n45), .Y(n33) );
  INVX2TS U66 ( .A(n43), .Y(ctrl_c_o) );
  OAI2BB1X1TS U67 ( .A0N(n1), .A1N(add_overflow_i), .B0(n29), .Y(ctrl_b_o[1])
         );
  NOR2BX1TS U68 ( .AN(ctrl_b_load_o), .B(add_overflow_i), .Y(ctrl_b_o[0]) );
  INVX2TS U69 ( .A(rst), .Y(n59) );
endmodule


module RegisterAdd_W1_7 ( clk, rst, load, D, Q );
  input [0:0] D;
  output [0:0] Q;
  input clk, rst, load;
  wire   n1, n3, n2;

  DFFRX2TS Q_reg_0_ ( .D(n3), .CK(clk), .RN(n2), .Q(Q[0]), .QN(n1) );
  INVX2TS U2 ( .A(rst), .Y(n2) );
  OAI2BB2XLTS U3 ( .B0(n1), .B1(load), .A0N(load), .A1N(D[0]), .Y(n3) );
endmodule


module RegisterAdd_W1_6 ( clk, rst, load, D, Q );
  input [0:0] D;
  output [0:0] Q;
  input clk, rst, load;
  wire   n2, n4, n5;

  DFFRX2TS Q_reg_0_ ( .D(n4), .CK(clk), .RN(n2), .Q(Q[0]), .QN(n5) );
  INVX2TS U2 ( .A(rst), .Y(n2) );
  OAI2BB2XLTS U3 ( .B0(n5), .B1(load), .A0N(load), .A1N(D[0]), .Y(n4) );
endmodule


module RegisterAdd_W2 ( clk, rst, load, D, Q );
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


module RegisterAdd_W32_2 ( clk, rst, load, D, Q );
  input [31:0] D;
  output [31:0] Q;
  input clk, rst, load;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n65, n64, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75;

  DFFRX2TS Q_reg_31_ ( .D(n65), .CK(clk), .RN(n75), .Q(Q[31]), .QN(n32) );
  DFFRX2TS Q_reg_25_ ( .D(n58), .CK(clk), .RN(n67), .Q(Q[25]), .QN(n26) );
  DFFRX2TS Q_reg_21_ ( .D(n54), .CK(clk), .RN(n67), .Q(Q[21]), .QN(n22) );
  DFFRX2TS Q_reg_24_ ( .D(n57), .CK(clk), .RN(n67), .Q(Q[24]), .QN(n25) );
  DFFRX2TS Q_reg_20_ ( .D(n53), .CK(clk), .RN(n67), .Q(Q[20]), .QN(n21) );
  DFFRX2TS Q_reg_23_ ( .D(n56), .CK(clk), .RN(n67), .Q(Q[23]), .QN(n24) );
  DFFRX2TS Q_reg_29_ ( .D(n62), .CK(clk), .RN(n67), .Q(Q[29]), .QN(n30) );
  DFFRX2TS Q_reg_18_ ( .D(n51), .CK(clk), .RN(n66), .Q(Q[18]), .QN(n19) );
  DFFRX2TS Q_reg_27_ ( .D(n60), .CK(clk), .RN(n67), .Q(Q[27]), .QN(n28) );
  DFFRX2TS Q_reg_16_ ( .D(n49), .CK(clk), .RN(n66), .Q(Q[16]), .QN(n17) );
  DFFRX2TS Q_reg_22_ ( .D(n55), .CK(clk), .RN(n67), .Q(Q[22]), .QN(n23) );
  DFFRX2TS Q_reg_19_ ( .D(n52), .CK(clk), .RN(n66), .Q(Q[19]), .QN(n20) );
  DFFRX2TS Q_reg_17_ ( .D(n50), .CK(clk), .RN(n66), .Q(Q[17]), .QN(n18) );
  DFFRX2TS Q_reg_30_ ( .D(n63), .CK(clk), .RN(n75), .Q(Q[30]), .QN(n31) );
  DFFRX2TS Q_reg_28_ ( .D(n61), .CK(clk), .RN(n67), .Q(Q[28]), .QN(n29) );
  DFFRX2TS Q_reg_26_ ( .D(n59), .CK(clk), .RN(n67), .Q(Q[26]), .QN(n27) );
  DFFRX2TS Q_reg_14_ ( .D(n47), .CK(clk), .RN(n66), .Q(Q[14]), .QN(n15) );
  DFFRX2TS Q_reg_12_ ( .D(n45), .CK(clk), .RN(n66), .Q(Q[12]), .QN(n13) );
  DFFRX2TS Q_reg_15_ ( .D(n48), .CK(clk), .RN(n66), .Q(Q[15]), .QN(n16) );
  DFFRX2TS Q_reg_13_ ( .D(n46), .CK(clk), .RN(n66), .Q(Q[13]), .QN(n14) );
  DFFRX2TS Q_reg_5_ ( .D(n38), .CK(clk), .RN(n64), .Q(Q[5]), .QN(n6) );
  DFFRX2TS Q_reg_4_ ( .D(n37), .CK(clk), .RN(n64), .Q(Q[4]), .QN(n5) );
  DFFRX2TS Q_reg_7_ ( .D(n40), .CK(clk), .RN(n64), .Q(Q[7]), .QN(n8) );
  DFFRX2TS Q_reg_10_ ( .D(n43), .CK(clk), .RN(n66), .Q(Q[10]), .QN(n11) );
  DFFRX2TS Q_reg_2_ ( .D(n35), .CK(clk), .RN(n64), .Q(Q[2]), .QN(n3) );
  DFFRX2TS Q_reg_6_ ( .D(n39), .CK(clk), .RN(n64), .Q(Q[6]), .QN(n7) );
  DFFRX2TS Q_reg_0_ ( .D(n33), .CK(clk), .RN(n64), .Q(Q[0]), .QN(n1) );
  DFFRX2TS Q_reg_8_ ( .D(n41), .CK(clk), .RN(n64), .Q(Q[8]), .QN(n9) );
  DFFRX2TS Q_reg_11_ ( .D(n44), .CK(clk), .RN(n66), .Q(Q[11]), .QN(n12) );
  DFFRX2TS Q_reg_9_ ( .D(n42), .CK(clk), .RN(n64), .Q(Q[9]), .QN(n10) );
  DFFRX2TS Q_reg_3_ ( .D(n36), .CK(clk), .RN(n64), .Q(Q[3]), .QN(n4) );
  DFFRX2TS Q_reg_1_ ( .D(n34), .CK(clk), .RN(n64), .Q(Q[1]), .QN(n2) );
  CLKBUFX2TS U2 ( .A(n73), .Y(n70) );
  CLKBUFX2TS U3 ( .A(n73), .Y(n69) );
  CLKBUFX2TS U4 ( .A(load), .Y(n71) );
  CLKBUFX2TS U5 ( .A(load), .Y(n72) );
  CLKBUFX2TS U6 ( .A(load), .Y(n73) );
  CLKBUFX2TS U7 ( .A(n74), .Y(n68) );
  CLKBUFX2TS U8 ( .A(load), .Y(n74) );
  CLKBUFX2TS U9 ( .A(n75), .Y(n64) );
  CLKBUFX2TS U10 ( .A(n75), .Y(n66) );
  CLKBUFX2TS U11 ( .A(n75), .Y(n67) );
  OAI2BB2XLTS U12 ( .B0(n1), .B1(n72), .A0N(n72), .A1N(D[0]), .Y(n33) );
  OAI2BB2XLTS U13 ( .B0(n2), .B1(n70), .A0N(D[1]), .A1N(n72), .Y(n34) );
  OAI2BB2XLTS U14 ( .B0(n3), .B1(n73), .A0N(D[2]), .A1N(n71), .Y(n35) );
  OAI2BB2XLTS U15 ( .B0(n4), .B1(n70), .A0N(D[3]), .A1N(n71), .Y(n36) );
  OAI2BB2XLTS U16 ( .B0(n5), .B1(n70), .A0N(D[4]), .A1N(n71), .Y(n37) );
  OAI2BB2XLTS U17 ( .B0(n6), .B1(n70), .A0N(D[5]), .A1N(n74), .Y(n38) );
  OAI2BB2XLTS U18 ( .B0(n7), .B1(n70), .A0N(D[6]), .A1N(n74), .Y(n39) );
  OAI2BB2XLTS U19 ( .B0(n8), .B1(n70), .A0N(D[7]), .A1N(n73), .Y(n40) );
  OAI2BB2XLTS U20 ( .B0(n9), .B1(n70), .A0N(D[8]), .A1N(n73), .Y(n41) );
  OAI2BB2XLTS U21 ( .B0(n10), .B1(n70), .A0N(D[9]), .A1N(n74), .Y(n42) );
  OAI2BB2XLTS U22 ( .B0(n11), .B1(n70), .A0N(D[10]), .A1N(n74), .Y(n43) );
  OAI2BB2XLTS U23 ( .B0(n12), .B1(n69), .A0N(D[11]), .A1N(n72), .Y(n44) );
  OAI2BB2XLTS U24 ( .B0(n13), .B1(n69), .A0N(D[12]), .A1N(n73), .Y(n45) );
  OAI2BB2XLTS U25 ( .B0(n14), .B1(n69), .A0N(D[13]), .A1N(n74), .Y(n46) );
  OAI2BB2XLTS U26 ( .B0(n15), .B1(n69), .A0N(D[14]), .A1N(n72), .Y(n47) );
  OAI2BB2XLTS U27 ( .B0(n16), .B1(n70), .A0N(D[15]), .A1N(n73), .Y(n48) );
  OAI2BB2XLTS U28 ( .B0(n17), .B1(n69), .A0N(D[16]), .A1N(n73), .Y(n49) );
  OAI2BB2XLTS U29 ( .B0(n18), .B1(n69), .A0N(D[17]), .A1N(n74), .Y(n50) );
  OAI2BB2XLTS U30 ( .B0(n19), .B1(n69), .A0N(D[18]), .A1N(n74), .Y(n51) );
  OAI2BB2XLTS U31 ( .B0(n20), .B1(n69), .A0N(D[19]), .A1N(n73), .Y(n52) );
  OAI2BB2XLTS U32 ( .B0(n21), .B1(n69), .A0N(D[20]), .A1N(n74), .Y(n53) );
  OAI2BB2XLTS U33 ( .B0(n22), .B1(n68), .A0N(D[21]), .A1N(n71), .Y(n54) );
  OAI2BB2XLTS U34 ( .B0(n23), .B1(n68), .A0N(D[22]), .A1N(n73), .Y(n55) );
  OAI2BB2XLTS U35 ( .B0(n24), .B1(n68), .A0N(D[23]), .A1N(n74), .Y(n56) );
  OAI2BB2XLTS U36 ( .B0(n25), .B1(n68), .A0N(D[24]), .A1N(n71), .Y(n57) );
  OAI2BB2XLTS U37 ( .B0(n26), .B1(n68), .A0N(D[25]), .A1N(n71), .Y(n58) );
  OAI2BB2XLTS U38 ( .B0(n27), .B1(n68), .A0N(D[26]), .A1N(n71), .Y(n59) );
  OAI2BB2XLTS U39 ( .B0(n28), .B1(n68), .A0N(D[27]), .A1N(n71), .Y(n60) );
  OAI2BB2XLTS U40 ( .B0(n29), .B1(n68), .A0N(D[28]), .A1N(n71), .Y(n61) );
  OAI2BB2XLTS U41 ( .B0(n30), .B1(n68), .A0N(D[29]), .A1N(n71), .Y(n62) );
  OAI2BB2XLTS U42 ( .B0(n31), .B1(n68), .A0N(D[30]), .A1N(n72), .Y(n63) );
  OAI2BB2XLTS U43 ( .B0(n32), .B1(n69), .A0N(D[31]), .A1N(n72), .Y(n65) );
  INVX2TS U44 ( .A(rst), .Y(n75) );
endmodule


module RegisterAdd_W32_1 ( clk, rst, load, D, Q );
  input [31:0] D;
  output [31:0] Q;
  input clk, rst, load;
  wire   n64, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78,
         n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92,
         n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105,
         n106, n107, n108, n109, n110, n111, n112, n113, n114, n115, n116,
         n117, n118, n119, n120, n121, n122, n123, n124, n125, n126, n127,
         n128, n129, n130, n131, n132, n133, n134, n135, n136, n137, n138,
         n139;

  DFFRX2TS Q_reg_31_ ( .D(n76), .CK(clk), .RN(n67), .Q(Q[31]), .QN(n108) );
  DFFRX2TS Q_reg_30_ ( .D(n77), .CK(clk), .RN(n67), .Q(Q[30]), .QN(n109) );
  DFFRX2TS Q_reg_22_ ( .D(n85), .CK(clk), .RN(n66), .Q(Q[22]), .QN(n117) );
  DFFRX2TS Q_reg_19_ ( .D(n88), .CK(clk), .RN(n64), .Q(Q[19]), .QN(n120) );
  DFFRX2TS Q_reg_17_ ( .D(n90), .CK(clk), .RN(n64), .Q(Q[17]), .QN(n122) );
  DFFRX2TS Q_reg_28_ ( .D(n79), .CK(clk), .RN(n66), .Q(Q[28]), .QN(n111) );
  DFFRX2TS Q_reg_26_ ( .D(n81), .CK(clk), .RN(n66), .Q(Q[26]), .QN(n113) );
  DFFRX2TS Q_reg_27_ ( .D(n80), .CK(clk), .RN(n66), .Q(Q[27]), .QN(n112) );
  DFFRX2TS Q_reg_25_ ( .D(n82), .CK(clk), .RN(n66), .Q(Q[25]), .QN(n114) );
  DFFRX2TS Q_reg_24_ ( .D(n83), .CK(clk), .RN(n66), .Q(Q[24]), .QN(n115) );
  DFFRX2TS Q_reg_23_ ( .D(n84), .CK(clk), .RN(n66), .Q(Q[23]), .QN(n116) );
  DFFRX2TS Q_reg_20_ ( .D(n87), .CK(clk), .RN(n66), .Q(Q[20]), .QN(n119) );
  DFFRX2TS Q_reg_29_ ( .D(n78), .CK(clk), .RN(n66), .Q(Q[29]), .QN(n110) );
  DFFRX2TS Q_reg_18_ ( .D(n89), .CK(clk), .RN(n64), .Q(Q[18]), .QN(n121) );
  DFFRX2TS Q_reg_15_ ( .D(n92), .CK(clk), .RN(n64), .Q(Q[15]), .QN(n124) );
  DFFRX2TS Q_reg_13_ ( .D(n94), .CK(clk), .RN(n64), .Q(Q[13]), .QN(n126) );
  DFFRX2TS Q_reg_21_ ( .D(n86), .CK(clk), .RN(n66), .Q(Q[21]), .QN(n118) );
  DFFRX2TS Q_reg_16_ ( .D(n91), .CK(clk), .RN(n64), .Q(Q[16]), .QN(n123) );
  DFFRX2TS Q_reg_14_ ( .D(n93), .CK(clk), .RN(n64), .Q(Q[14]), .QN(n125) );
  DFFRX2TS Q_reg_12_ ( .D(n95), .CK(clk), .RN(n64), .Q(Q[12]), .QN(n127) );
  DFFRX2TS Q_reg_9_ ( .D(n98), .CK(clk), .RN(n67), .Q(Q[9]), .QN(n130) );
  DFFRX2TS Q_reg_1_ ( .D(n106), .CK(clk), .RN(n67), .Q(Q[1]), .QN(n138) );
  DFFRX2TS Q_reg_0_ ( .D(n107), .CK(clk), .RN(n67), .Q(Q[0]), .QN(n139) );
  DFFRX2TS Q_reg_8_ ( .D(n99), .CK(clk), .RN(n75), .Q(Q[8]), .QN(n131) );
  DFFRX2TS Q_reg_6_ ( .D(n101), .CK(clk), .RN(n75), .Q(Q[6]), .QN(n133) );
  DFFRX2TS Q_reg_11_ ( .D(n96), .CK(clk), .RN(n64), .Q(Q[11]), .QN(n128) );
  DFFRX2TS Q_reg_3_ ( .D(n104), .CK(clk), .RN(n75), .Q(Q[3]), .QN(n136) );
  DFFRX2TS Q_reg_7_ ( .D(n100), .CK(clk), .RN(n75), .Q(Q[7]), .QN(n132) );
  DFFRX2TS Q_reg_5_ ( .D(n102), .CK(clk), .RN(n75), .Q(Q[5]), .QN(n134) );
  DFFRX2TS Q_reg_4_ ( .D(n103), .CK(clk), .RN(n75), .Q(Q[4]), .QN(n135) );
  DFFRX2TS Q_reg_10_ ( .D(n97), .CK(clk), .RN(n64), .Q(Q[10]), .QN(n129) );
  DFFRX2TS Q_reg_2_ ( .D(n105), .CK(clk), .RN(n75), .Q(Q[2]), .QN(n137) );
  CLKBUFX2TS U2 ( .A(n73), .Y(n69) );
  CLKBUFX2TS U3 ( .A(n73), .Y(n68) );
  CLKBUFX2TS U4 ( .A(n72), .Y(n70) );
  CLKBUFX2TS U5 ( .A(n72), .Y(n71) );
  CLKBUFX2TS U6 ( .A(load), .Y(n72) );
  CLKBUFX2TS U7 ( .A(load), .Y(n73) );
  CLKBUFX2TS U8 ( .A(load), .Y(n74) );
  CLKBUFX2TS U9 ( .A(n75), .Y(n64) );
  CLKBUFX2TS U10 ( .A(n75), .Y(n66) );
  CLKBUFX2TS U11 ( .A(n75), .Y(n67) );
  OAI2BB2XLTS U12 ( .B0(n139), .B1(n71), .A0N(n71), .A1N(D[0]), .Y(n107) );
  OAI2BB2XLTS U13 ( .B0(n138), .B1(n69), .A0N(D[1]), .A1N(n71), .Y(n106) );
  OAI2BB2XLTS U14 ( .B0(n137), .B1(n73), .A0N(D[2]), .A1N(n70), .Y(n105) );
  OAI2BB2XLTS U15 ( .B0(n136), .B1(n69), .A0N(D[3]), .A1N(n70), .Y(n104) );
  OAI2BB2XLTS U16 ( .B0(n135), .B1(n69), .A0N(D[4]), .A1N(n70), .Y(n103) );
  OAI2BB2XLTS U17 ( .B0(n134), .B1(n69), .A0N(D[5]), .A1N(n74), .Y(n102) );
  OAI2BB2XLTS U18 ( .B0(n133), .B1(n69), .A0N(D[6]), .A1N(n74), .Y(n101) );
  OAI2BB2XLTS U19 ( .B0(n132), .B1(n69), .A0N(D[7]), .A1N(n73), .Y(n100) );
  OAI2BB2XLTS U20 ( .B0(n131), .B1(n69), .A0N(D[8]), .A1N(n73), .Y(n99) );
  OAI2BB2XLTS U21 ( .B0(n130), .B1(n69), .A0N(D[9]), .A1N(n74), .Y(n98) );
  OAI2BB2XLTS U22 ( .B0(n129), .B1(n69), .A0N(D[10]), .A1N(n74), .Y(n97) );
  OAI2BB2XLTS U23 ( .B0(n128), .B1(n68), .A0N(D[11]), .A1N(n71), .Y(n96) );
  OAI2BB2XLTS U24 ( .B0(n127), .B1(n68), .A0N(D[12]), .A1N(n73), .Y(n95) );
  OAI2BB2XLTS U25 ( .B0(n126), .B1(n68), .A0N(D[13]), .A1N(n74), .Y(n94) );
  OAI2BB2XLTS U26 ( .B0(n125), .B1(n68), .A0N(D[14]), .A1N(n71), .Y(n93) );
  OAI2BB2XLTS U27 ( .B0(n124), .B1(n69), .A0N(D[15]), .A1N(n73), .Y(n92) );
  OAI2BB2XLTS U28 ( .B0(n123), .B1(n68), .A0N(D[16]), .A1N(n73), .Y(n91) );
  OAI2BB2XLTS U29 ( .B0(n122), .B1(n68), .A0N(D[17]), .A1N(n74), .Y(n90) );
  OAI2BB2XLTS U30 ( .B0(n121), .B1(n68), .A0N(D[18]), .A1N(n74), .Y(n89) );
  OAI2BB2XLTS U31 ( .B0(n120), .B1(n68), .A0N(D[19]), .A1N(n73), .Y(n88) );
  OAI2BB2XLTS U32 ( .B0(n119), .B1(n68), .A0N(D[20]), .A1N(n74), .Y(n87) );
  OAI2BB2XLTS U33 ( .B0(n118), .B1(n74), .A0N(D[21]), .A1N(n70), .Y(n86) );
  OAI2BB2XLTS U34 ( .B0(n117), .B1(n72), .A0N(D[22]), .A1N(n73), .Y(n85) );
  OAI2BB2XLTS U35 ( .B0(n116), .B1(n72), .A0N(D[23]), .A1N(n74), .Y(n84) );
  OAI2BB2XLTS U36 ( .B0(n115), .B1(n71), .A0N(D[24]), .A1N(n70), .Y(n83) );
  OAI2BB2XLTS U37 ( .B0(n114), .B1(n71), .A0N(D[25]), .A1N(n70), .Y(n82) );
  OAI2BB2XLTS U38 ( .B0(n113), .B1(n71), .A0N(D[26]), .A1N(n70), .Y(n81) );
  OAI2BB2XLTS U39 ( .B0(n112), .B1(n72), .A0N(D[27]), .A1N(n70), .Y(n80) );
  OAI2BB2XLTS U40 ( .B0(n111), .B1(n72), .A0N(D[28]), .A1N(n70), .Y(n79) );
  OAI2BB2XLTS U41 ( .B0(n110), .B1(load), .A0N(D[29]), .A1N(n70), .Y(n78) );
  OAI2BB2XLTS U42 ( .B0(n109), .B1(n72), .A0N(D[30]), .A1N(n71), .Y(n77) );
  OAI2BB2XLTS U43 ( .B0(n108), .B1(n68), .A0N(D[31]), .A1N(n71), .Y(n76) );
  INVX2TS U44 ( .A(rst), .Y(n75) );
endmodule


module RegisterAdd_W1_4 ( clk, rst, load, D, Q );
  input [0:0] D;
  output [0:0] Q;
  input clk, rst, load;
  wire   n2, n4, n5;

  DFFRX2TS Q_reg_0_ ( .D(n4), .CK(clk), .RN(n2), .Q(Q[0]), .QN(n5) );
  OAI2BB2XLTS U2 ( .B0(n5), .B1(load), .A0N(load), .A1N(D[0]), .Y(n4) );
  INVX2TS U3 ( .A(rst), .Y(n2) );
endmodule


module Comparator_W31 ( Data_X_i, Data_Y_i, gtXY_o, eqXY_o );
  input [30:0] Data_X_i;
  input [30:0] Data_Y_i;
  output gtXY_o, eqXY_o;
  wire   n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47,
         n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61,
         n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75,
         n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89,
         n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n1, n2, n3,
         n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18,
         n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33;

  OAI222X1TS U1 ( .A0(n50), .A1(n36), .B0(n51), .B1(n52), .C0(Data_Y_i[30]), 
        .C1(n19), .Y(gtXY_o) );
  XOR2X1TS U2 ( .A(Data_X_i[27]), .B(n2), .Y(n57) );
  NOR2X1TS U3 ( .A(n34), .B(n35), .Y(eqXY_o) );
  NAND4BBX1TS U4 ( .AN(n43), .BN(n44), .C(n45), .D(n46), .Y(n34) );
  NAND4BBX1TS U5 ( .AN(n36), .BN(n37), .C(n38), .D(n39), .Y(n35) );
  NOR3BX1TS U6 ( .AN(n47), .B(n48), .C(n49), .Y(n46) );
  AND3X2TS U7 ( .A(n40), .B(n41), .C(n42), .Y(n39) );
  XNOR2X1TS U8 ( .A(n30), .B(Data_Y_i[6]), .Y(n90) );
  XNOR2X1TS U9 ( .A(Data_X_i[10]), .B(Data_Y_i[10]), .Y(n83) );
  XNOR2X1TS U10 ( .A(Data_X_i[2]), .B(Data_Y_i[2]), .Y(n47) );
  OAI22X1TS U11 ( .A0(Data_Y_i[11]), .A1(n27), .B0(n98), .B1(n79), .Y(n97) );
  INVX2TS U12 ( .A(Data_X_i[11]), .Y(n27) );
  AOI22X1TS U13 ( .A0(n83), .A1(n99), .B0(Data_X_i[10]), .B1(n13), .Y(n98) );
  INVX2TS U14 ( .A(Data_Y_i[10]), .Y(n13) );
  OAI22X1TS U15 ( .A0(Data_Y_i[13]), .A1(n26), .B0(n96), .B1(n80), .Y(n95) );
  INVX2TS U16 ( .A(Data_X_i[13]), .Y(n26) );
  AOI22X1TS U17 ( .A0(n84), .A1(n97), .B0(Data_X_i[12]), .B1(n12), .Y(n96) );
  INVX2TS U18 ( .A(Data_Y_i[12]), .Y(n12) );
  AOI22X1TS U19 ( .A0(n45), .A1(n73), .B0(Data_X_i[16]), .B1(n10), .Y(n72) );
  OAI222X1TS U20 ( .A0(Data_Y_i[15]), .A1(n25), .B0(n74), .B1(n75), .C0(n76), 
        .C1(n37), .Y(n73) );
  INVX2TS U21 ( .A(Data_X_i[15]), .Y(n25) );
  AOI22X1TS U22 ( .A0(n85), .A1(n95), .B0(Data_X_i[14]), .B1(n11), .Y(n74) );
  XOR2X1TS U23 ( .A(Data_X_i[11]), .B(Data_Y_i[11]), .Y(n79) );
  OAI22X1TS U24 ( .A0(Data_Y_i[19]), .A1(n23), .B0(n70), .B1(n43), .Y(n64) );
  AOI22X1TS U25 ( .A0(n42), .A1(n71), .B0(Data_X_i[18]), .B1(n9), .Y(n70) );
  INVX2TS U26 ( .A(Data_Y_i[18]), .Y(n9) );
  OAI22X1TS U27 ( .A0(Data_Y_i[17]), .A1(n24), .B0(n72), .B1(n44), .Y(n71) );
  AOI222XLTS U28 ( .A0(Data_X_i[7]), .A1(n14), .B0(n41), .B1(n86), .C0(n87), 
        .C1(n88), .Y(n76) );
  OAI22X1TS U29 ( .A0(Data_Y_i[3]), .A1(n31), .B0(n92), .B1(n48), .Y(n86) );
  OAI22X1TS U30 ( .A0(Data_Y_i[6]), .A1(n30), .B0(n89), .B1(n90), .Y(n88) );
  INVX2TS U31 ( .A(Data_X_i[3]), .Y(n31) );
  XOR2X1TS U32 ( .A(Data_X_i[3]), .B(Data_Y_i[3]), .Y(n48) );
  OAI32X1TS U33 ( .A0(n82), .A1(Data_Y_i[8]), .A2(n29), .B0(Data_Y_i[9]), .B1(
        n28), .Y(n99) );
  INVX2TS U34 ( .A(Data_X_i[9]), .Y(n28) );
  INVX2TS U35 ( .A(Data_X_i[8]), .Y(n29) );
  AOI22X1TS U36 ( .A0(n47), .A1(n93), .B0(Data_X_i[2]), .B1(n18), .Y(n92) );
  INVX2TS U37 ( .A(Data_Y_i[2]), .Y(n18) );
  OAI32X1TS U38 ( .A0(n49), .A1(Data_Y_i[0]), .A2(n33), .B0(Data_Y_i[1]), .B1(
        n32), .Y(n93) );
  INVX2TS U39 ( .A(Data_X_i[1]), .Y(n32) );
  XOR2X1TS U40 ( .A(Data_X_i[1]), .B(Data_Y_i[1]), .Y(n49) );
  XOR2X1TS U41 ( .A(Data_X_i[5]), .B(n16), .Y(n91) );
  XOR2X1TS U42 ( .A(Data_X_i[7]), .B(n14), .Y(n87) );
  AOI32X1TS U43 ( .A0(Data_X_i[4]), .A1(n17), .A2(n91), .B0(Data_X_i[5]), .B1(
        n16), .Y(n89) );
  XOR2X1TS U44 ( .A(Data_X_i[9]), .B(Data_Y_i[9]), .Y(n82) );
  AND4X1TS U45 ( .A(n15), .B(n94), .C(n87), .D(n91), .Y(n41) );
  XOR2X1TS U46 ( .A(Data_X_i[4]), .B(n17), .Y(n94) );
  INVX2TS U47 ( .A(n90), .Y(n15) );
  INVX2TS U48 ( .A(Data_X_i[6]), .Y(n30) );
  INVX2TS U49 ( .A(Data_X_i[30]), .Y(n19) );
  AOI22X1TS U50 ( .A0(n53), .A1(n54), .B0(Data_X_i[29]), .B1(n1), .Y(n51) );
  AOI222XLTS U51 ( .A0(Data_X_i[23]), .A1(n5), .B0(n40), .B1(n64), .C0(n65), 
        .C1(n66), .Y(n50) );
  INVX2TS U52 ( .A(Data_X_i[0]), .Y(n33) );
  INVX2TS U53 ( .A(Data_Y_i[7]), .Y(n14) );
  INVX2TS U54 ( .A(Data_Y_i[4]), .Y(n17) );
  INVX2TS U55 ( .A(Data_Y_i[5]), .Y(n16) );
  XNOR2X1TS U56 ( .A(Data_X_i[14]), .B(Data_Y_i[14]), .Y(n85) );
  XNOR2X1TS U57 ( .A(Data_X_i[12]), .B(Data_Y_i[12]), .Y(n84) );
  OAI22X1TS U58 ( .A0(Data_Y_i[22]), .A1(n22), .B0(n67), .B1(n68), .Y(n66) );
  AOI32X1TS U59 ( .A0(Data_X_i[20]), .A1(n8), .A2(n69), .B0(Data_X_i[21]), 
        .B1(n7), .Y(n67) );
  XOR2X1TS U60 ( .A(Data_X_i[13]), .B(Data_Y_i[13]), .Y(n80) );
  XOR2X1TS U61 ( .A(Data_X_i[15]), .B(Data_Y_i[15]), .Y(n75) );
  XOR2X1TS U62 ( .A(Data_X_i[16]), .B(n10), .Y(n45) );
  XOR2X1TS U63 ( .A(Data_X_i[21]), .B(n7), .Y(n69) );
  NAND2BX1TS U64 ( .AN(n77), .B(n78), .Y(n37) );
  NAND4BX1TS U65 ( .AN(n82), .B(n83), .C(n84), .D(n85), .Y(n77) );
  NOR4XLTS U66 ( .A(n79), .B(n75), .C(n80), .D(n81), .Y(n78) );
  XOR2X1TS U67 ( .A(Data_Y_i[8]), .B(Data_X_i[8]), .Y(n81) );
  INVX2TS U68 ( .A(Data_Y_i[16]), .Y(n10) );
  INVX2TS U69 ( .A(Data_Y_i[14]), .Y(n11) );
  INVX2TS U70 ( .A(Data_Y_i[21]), .Y(n7) );
  NAND4X1TS U71 ( .A(n57), .B(n61), .C(n62), .D(n63), .Y(n36) );
  XOR2X1TS U72 ( .A(Data_X_i[24]), .B(n4), .Y(n62) );
  NOR4BX1TS U73 ( .AN(n53), .B(n52), .C(n60), .D(n56), .Y(n63) );
  XNOR2X1TS U74 ( .A(n22), .B(Data_Y_i[22]), .Y(n68) );
  XNOR2X1TS U75 ( .A(Data_X_i[18]), .B(Data_Y_i[18]), .Y(n42) );
  XNOR2X1TS U76 ( .A(Data_X_i[29]), .B(Data_Y_i[29]), .Y(n53) );
  XNOR2X1TS U77 ( .A(n23), .B(Data_Y_i[19]), .Y(n43) );
  XNOR2X1TS U78 ( .A(n24), .B(Data_Y_i[17]), .Y(n44) );
  OAI22X1TS U79 ( .A0(Data_Y_i[28]), .A1(n20), .B0(n55), .B1(n56), .Y(n54) );
  INVX2TS U80 ( .A(Data_X_i[28]), .Y(n20) );
  AOI22X1TS U81 ( .A0(n57), .A1(n58), .B0(Data_X_i[27]), .B1(n2), .Y(n55) );
  OAI22X1TS U82 ( .A0(Data_Y_i[26]), .A1(n21), .B0(n59), .B1(n60), .Y(n58) );
  XOR2X1TS U83 ( .A(Data_X_i[25]), .B(n3), .Y(n61) );
  XOR2X1TS U84 ( .A(Data_X_i[28]), .B(Data_Y_i[28]), .Y(n56) );
  XOR2X1TS U85 ( .A(Data_X_i[26]), .B(Data_Y_i[26]), .Y(n60) );
  XOR2X1TS U86 ( .A(Data_X_i[30]), .B(Data_Y_i[30]), .Y(n52) );
  XOR2X1TS U87 ( .A(Data_X_i[23]), .B(n5), .Y(n65) );
  AOI32X1TS U88 ( .A0(Data_X_i[24]), .A1(n4), .A2(n61), .B0(Data_X_i[25]), 
        .B1(n3), .Y(n59) );
  AND4X1TS U89 ( .A(n6), .B(n100), .C(n69), .D(n65), .Y(n40) );
  XOR2X1TS U90 ( .A(Data_X_i[20]), .B(n8), .Y(n100) );
  INVX2TS U91 ( .A(n68), .Y(n6) );
  INVX2TS U92 ( .A(Data_Y_i[27]), .Y(n2) );
  INVX2TS U93 ( .A(Data_X_i[17]), .Y(n24) );
  INVX2TS U94 ( .A(Data_X_i[22]), .Y(n22) );
  INVX2TS U95 ( .A(Data_X_i[19]), .Y(n23) );
  INVX2TS U96 ( .A(Data_X_i[26]), .Y(n21) );
  INVX2TS U97 ( .A(Data_Y_i[23]), .Y(n5) );
  INVX2TS U98 ( .A(Data_Y_i[24]), .Y(n4) );
  INVX2TS U99 ( .A(Data_Y_i[20]), .Y(n8) );
  INVX2TS U100 ( .A(Data_Y_i[25]), .Y(n3) );
  XOR2X1TS U101 ( .A(n33), .B(Data_Y_i[0]), .Y(n38) );
  INVX2TS U102 ( .A(Data_Y_i[29]), .Y(n1) );
endmodule


module xor_tri_W32 ( A_i, B_i, C_i, Z_o );
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
  wire   n2, n3, n1;

  OAI31X1TS U1 ( .A0(n2), .A1(gtXY_i), .A2(eqXY_i), .B0(n3), .Y(sgn_result_o)
         );
  OAI21X1TS U2 ( .A0(gtXY_i), .A1(n1), .B0(sgn_X_i), .Y(n3) );
  INVX2TS U3 ( .A(n2), .Y(n1) );
  XNOR2X1TS U4 ( .A(sgn_Y_i), .B(Add_Subt_i), .Y(n2) );
endmodule


module MultiplexTxT_W31 ( select, D0_i, D1_i, S0_o, S1_o );
  input [30:0] D0_i;
  input [30:0] D1_i;
  output [30:0] S0_o;
  output [30:0] S1_o;
  input select;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76;

  INVX2TS U1 ( .A(n7), .Y(n1) );
  INVX2TS U2 ( .A(n12), .Y(n2) );
  INVX2TS U3 ( .A(n14), .Y(n3) );
  INVX2TS U4 ( .A(n12), .Y(n4) );
  INVX2TS U5 ( .A(n12), .Y(n5) );
  INVX2TS U6 ( .A(n13), .Y(n6) );
  CLKBUFX2TS U7 ( .A(n12), .Y(n9) );
  CLKBUFX2TS U8 ( .A(n13), .Y(n8) );
  CLKBUFX2TS U9 ( .A(n12), .Y(n10) );
  CLKBUFX2TS U10 ( .A(n13), .Y(n11) );
  CLKBUFX2TS U11 ( .A(n13), .Y(n7) );
  CLKBUFX2TS U12 ( .A(n14), .Y(n13) );
  CLKBUFX2TS U13 ( .A(n14), .Y(n12) );
  INVX2TS U14 ( .A(select), .Y(n14) );
  OAI22X1TS U15 ( .A0(n2), .A1(n44), .B0(n12), .B1(n75), .Y(S0_o[1]) );
  OAI22X1TS U16 ( .A0(n3), .A1(n43), .B0(n11), .B1(n74), .Y(S0_o[2]) );
  OAI22X1TS U17 ( .A0(n3), .A1(n42), .B0(n11), .B1(n73), .Y(S0_o[3]) );
  OAI22X1TS U18 ( .A0(n3), .A1(n41), .B0(n11), .B1(n72), .Y(S0_o[4]) );
  OAI22X1TS U19 ( .A0(n3), .A1(n40), .B0(n11), .B1(n71), .Y(S0_o[5]) );
  OAI22X1TS U20 ( .A0(n3), .A1(n39), .B0(n11), .B1(n70), .Y(S0_o[6]) );
  OAI22X1TS U21 ( .A0(n3), .A1(n38), .B0(n11), .B1(n69), .Y(S0_o[7]) );
  OAI22X1TS U22 ( .A0(n1), .A1(n35), .B0(n12), .B1(n66), .Y(S0_o[10]) );
  OAI22X1TS U23 ( .A0(n1), .A1(n34), .B0(n12), .B1(n65), .Y(S0_o[11]) );
  OAI22X1TS U24 ( .A0(n1), .A1(n33), .B0(n7), .B1(n64), .Y(S0_o[12]) );
  OAI22X1TS U25 ( .A0(n1), .A1(n32), .B0(n13), .B1(n63), .Y(S0_o[13]) );
  OAI22X1TS U26 ( .A0(n1), .A1(n31), .B0(n14), .B1(n62), .Y(S0_o[14]) );
  OAI22X1TS U27 ( .A0(n1), .A1(n30), .B0(n14), .B1(n61), .Y(S0_o[15]) );
  OAI22X1TS U28 ( .A0(n1), .A1(n29), .B0(n14), .B1(n60), .Y(S0_o[16]) );
  OAI22X1TS U29 ( .A0(n1), .A1(n28), .B0(n14), .B1(n59), .Y(S0_o[17]) );
  OAI22X1TS U30 ( .A0(n2), .A1(n26), .B0(n14), .B1(n57), .Y(S0_o[19]) );
  OAI22X1TS U31 ( .A0(n2), .A1(n25), .B0(n8), .B1(n56), .Y(S0_o[20]) );
  OAI22X1TS U32 ( .A0(n2), .A1(n24), .B0(n9), .B1(n55), .Y(S0_o[21]) );
  OAI22X1TS U33 ( .A0(n2), .A1(n23), .B0(n10), .B1(n54), .Y(S0_o[22]) );
  OAI22X1TS U34 ( .A0(n2), .A1(n22), .B0(n11), .B1(n53), .Y(S0_o[23]) );
  OAI22X1TS U35 ( .A0(n2), .A1(n21), .B0(n14), .B1(n52), .Y(S0_o[24]) );
  OAI22X1TS U36 ( .A0(n2), .A1(n20), .B0(n12), .B1(n51), .Y(S0_o[25]) );
  OAI22X1TS U37 ( .A0(n2), .A1(n19), .B0(n12), .B1(n50), .Y(S0_o[26]) );
  OAI22X1TS U38 ( .A0(n2), .A1(n18), .B0(n7), .B1(n49), .Y(S0_o[27]) );
  OAI22X1TS U39 ( .A0(n3), .A1(n17), .B0(n11), .B1(n48), .Y(S0_o[28]) );
  OAI22X1TS U40 ( .A0(n3), .A1(n16), .B0(n11), .B1(n47), .Y(S0_o[29]) );
  OAI22X1TS U41 ( .A0(n3), .A1(n15), .B0(n11), .B1(n46), .Y(S0_o[30]) );
  OAI22X1TS U42 ( .A0(n10), .A1(n34), .B0(n4), .B1(n65), .Y(S1_o[11]) );
  OAI22X1TS U43 ( .A0(n10), .A1(n32), .B0(n4), .B1(n63), .Y(S1_o[13]) );
  OAI22X1TS U44 ( .A0(n9), .A1(n30), .B0(n4), .B1(n61), .Y(S1_o[15]) );
  OAI22X1TS U45 ( .A0(n10), .A1(n45), .B0(n4), .B1(n76), .Y(S1_o[0]) );
  OAI22X1TS U46 ( .A0(n9), .A1(n44), .B0(n5), .B1(n75), .Y(S1_o[1]) );
  OAI22X1TS U47 ( .A0(n8), .A1(n43), .B0(n6), .B1(n74), .Y(S1_o[2]) );
  OAI22X1TS U48 ( .A0(n7), .A1(n42), .B0(n6), .B1(n73), .Y(S1_o[3]) );
  OAI22X1TS U49 ( .A0(n7), .A1(n41), .B0(n6), .B1(n72), .Y(S1_o[4]) );
  OAI22X1TS U50 ( .A0(n7), .A1(n40), .B0(n6), .B1(n71), .Y(S1_o[5]) );
  OAI22X1TS U51 ( .A0(n7), .A1(n39), .B0(n6), .B1(n70), .Y(S1_o[6]) );
  OAI22X1TS U52 ( .A0(n7), .A1(n38), .B0(n6), .B1(n69), .Y(S1_o[7]) );
  OAI22X1TS U53 ( .A0(n7), .A1(n37), .B0(select), .B1(n68), .Y(S1_o[8]) );
  OAI22X1TS U54 ( .A0(n36), .A1(n14), .B0(select), .B1(n67), .Y(S1_o[9]) );
  OAI22X1TS U55 ( .A0(n10), .A1(n35), .B0(n4), .B1(n66), .Y(S1_o[10]) );
  OAI22X1TS U56 ( .A0(n10), .A1(n33), .B0(n4), .B1(n64), .Y(S1_o[12]) );
  OAI22X1TS U57 ( .A0(n10), .A1(n31), .B0(n4), .B1(n62), .Y(S1_o[14]) );
  OAI22X1TS U58 ( .A0(n9), .A1(n29), .B0(n4), .B1(n60), .Y(S1_o[16]) );
  OAI22X1TS U59 ( .A0(n9), .A1(n28), .B0(n4), .B1(n59), .Y(S1_o[17]) );
  OAI22X1TS U60 ( .A0(n9), .A1(n27), .B0(n5), .B1(n58), .Y(S1_o[18]) );
  OAI22X1TS U61 ( .A0(n9), .A1(n26), .B0(n5), .B1(n57), .Y(S1_o[19]) );
  OAI22X1TS U62 ( .A0(n9), .A1(n25), .B0(n5), .B1(n56), .Y(S1_o[20]) );
  OAI22X1TS U63 ( .A0(n9), .A1(n24), .B0(n5), .B1(n55), .Y(S1_o[21]) );
  OAI22X1TS U64 ( .A0(n9), .A1(n23), .B0(n5), .B1(n54), .Y(S1_o[22]) );
  OAI22X1TS U65 ( .A0(n8), .A1(n22), .B0(n5), .B1(n53), .Y(S1_o[23]) );
  OAI22X1TS U66 ( .A0(n8), .A1(n21), .B0(n5), .B1(n52), .Y(S1_o[24]) );
  OAI22X1TS U67 ( .A0(n8), .A1(n20), .B0(n5), .B1(n51), .Y(S1_o[25]) );
  OAI22X1TS U68 ( .A0(n8), .A1(n19), .B0(n5), .B1(n50), .Y(S1_o[26]) );
  OAI22X1TS U69 ( .A0(n8), .A1(n18), .B0(n6), .B1(n49), .Y(S1_o[27]) );
  OAI22X1TS U70 ( .A0(n8), .A1(n17), .B0(n6), .B1(n48), .Y(S1_o[28]) );
  OAI22X1TS U71 ( .A0(n8), .A1(n16), .B0(n6), .B1(n47), .Y(S1_o[29]) );
  OAI22X1TS U72 ( .A0(n8), .A1(n15), .B0(n6), .B1(n46), .Y(S1_o[30]) );
  OAI22X1TS U73 ( .A0(n1), .A1(n45), .B0(n10), .B1(n76), .Y(S0_o[0]) );
  OAI22X1TS U74 ( .A0(n3), .A1(n37), .B0(n10), .B1(n68), .Y(S0_o[8]) );
  OAI22X1TS U75 ( .A0(n4), .A1(n36), .B0(n67), .B1(n13), .Y(S0_o[9]) );
  OAI22X1TS U76 ( .A0(n1), .A1(n27), .B0(n10), .B1(n58), .Y(S0_o[18]) );
  INVX2TS U77 ( .A(D0_i[9]), .Y(n67) );
  INVX2TS U78 ( .A(D1_i[2]), .Y(n43) );
  INVX2TS U79 ( .A(D1_i[10]), .Y(n35) );
  INVX2TS U80 ( .A(D1_i[12]), .Y(n33) );
  INVX2TS U81 ( .A(D1_i[14]), .Y(n31) );
  INVX2TS U82 ( .A(D1_i[18]), .Y(n27) );
  INVX2TS U83 ( .A(D1_i[29]), .Y(n16) );
  INVX2TS U84 ( .A(D0_i[1]), .Y(n75) );
  INVX2TS U85 ( .A(D0_i[3]), .Y(n73) );
  INVX2TS U86 ( .A(D0_i[11]), .Y(n65) );
  INVX2TS U87 ( .A(D0_i[13]), .Y(n63) );
  INVX2TS U88 ( .A(D0_i[15]), .Y(n61) );
  INVX2TS U89 ( .A(D0_i[26]), .Y(n50) );
  INVX2TS U90 ( .A(D0_i[28]), .Y(n48) );
  INVX2TS U91 ( .A(D0_i[30]), .Y(n46) );
  INVX2TS U92 ( .A(D0_i[8]), .Y(n68) );
  INVX2TS U93 ( .A(D1_i[4]), .Y(n41) );
  INVX2TS U94 ( .A(D1_i[5]), .Y(n40) );
  INVX2TS U95 ( .A(D1_i[7]), .Y(n38) );
  INVX2TS U96 ( .A(D1_i[16]), .Y(n29) );
  INVX2TS U97 ( .A(D1_i[20]), .Y(n25) );
  INVX2TS U98 ( .A(D1_i[21]), .Y(n24) );
  INVX2TS U99 ( .A(D1_i[23]), .Y(n22) );
  INVX2TS U100 ( .A(D1_i[24]), .Y(n21) );
  INVX2TS U101 ( .A(D1_i[25]), .Y(n20) );
  INVX2TS U102 ( .A(D1_i[27]), .Y(n18) );
  INVX2TS U103 ( .A(D1_i[3]), .Y(n42) );
  INVX2TS U104 ( .A(D1_i[11]), .Y(n34) );
  INVX2TS U105 ( .A(D1_i[13]), .Y(n32) );
  INVX2TS U106 ( .A(D1_i[26]), .Y(n19) );
  INVX2TS U107 ( .A(D1_i[28]), .Y(n17) );
  INVX2TS U108 ( .A(D1_i[6]), .Y(n39) );
  INVX2TS U109 ( .A(D1_i[17]), .Y(n28) );
  INVX2TS U110 ( .A(D1_i[19]), .Y(n26) );
  INVX2TS U111 ( .A(D1_i[22]), .Y(n23) );
  INVX2TS U112 ( .A(D0_i[0]), .Y(n76) );
  INVX2TS U113 ( .A(D0_i[6]), .Y(n70) );
  INVX2TS U114 ( .A(D0_i[17]), .Y(n59) );
  INVX2TS U115 ( .A(D0_i[19]), .Y(n57) );
  INVX2TS U116 ( .A(D0_i[22]), .Y(n54) );
  INVX2TS U117 ( .A(D0_i[16]), .Y(n60) );
  INVX2TS U118 ( .A(D0_i[27]), .Y(n49) );
  INVX2TS U119 ( .A(D0_i[2]), .Y(n74) );
  INVX2TS U120 ( .A(D0_i[10]), .Y(n66) );
  INVX2TS U121 ( .A(D0_i[12]), .Y(n64) );
  INVX2TS U122 ( .A(D0_i[14]), .Y(n62) );
  INVX2TS U123 ( .A(D0_i[18]), .Y(n58) );
  INVX2TS U124 ( .A(D0_i[29]), .Y(n47) );
  INVX2TS U125 ( .A(D1_i[8]), .Y(n37) );
  INVX2TS U126 ( .A(D1_i[9]), .Y(n36) );
  INVX2TS U127 ( .A(D1_i[30]), .Y(n15) );
  INVX2TS U128 ( .A(D1_i[15]), .Y(n30) );
  INVX2TS U129 ( .A(D1_i[0]), .Y(n45) );
  INVX2TS U130 ( .A(D1_i[1]), .Y(n44) );
  INVX2TS U131 ( .A(D0_i[7]), .Y(n69) );
  INVX2TS U132 ( .A(D0_i[23]), .Y(n53) );
  INVX2TS U133 ( .A(D0_i[4]), .Y(n72) );
  INVX2TS U134 ( .A(D0_i[20]), .Y(n56) );
  INVX2TS U135 ( .A(D0_i[24]), .Y(n52) );
  INVX2TS U136 ( .A(D0_i[5]), .Y(n71) );
  INVX2TS U137 ( .A(D0_i[21]), .Y(n55) );
  INVX2TS U138 ( .A(D0_i[25]), .Y(n51) );
endmodule


module RegisterAdd_W31_1 ( clk, rst, load, D, Q );
  input [30:0] D;
  output [30:0] Q;
  input clk, rst, load;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n63, n62, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73;

  DFFRX2TS Q_reg_30_ ( .D(n63), .CK(clk), .RN(n73), .Q(Q[30]), .QN(n31) );
  DFFRX2TS Q_reg_22_ ( .D(n54), .CK(clk), .RN(n65), .Q(Q[22]), .QN(n23) );
  DFFRX2TS Q_reg_21_ ( .D(n53), .CK(clk), .RN(n65), .Q(Q[21]), .QN(n22) );
  DFFRX2TS Q_reg_20_ ( .D(n52), .CK(clk), .RN(n65), .Q(Q[20]), .QN(n21) );
  DFFRX2TS Q_reg_29_ ( .D(n61), .CK(clk), .RN(n65), .Q(Q[29]), .QN(n30) );
  DFFRX2TS Q_reg_28_ ( .D(n60), .CK(clk), .RN(n65), .Q(Q[28]), .QN(n29) );
  DFFRX2TS Q_reg_27_ ( .D(n59), .CK(clk), .RN(n65), .Q(Q[27]), .QN(n28) );
  DFFRX2TS Q_reg_26_ ( .D(n58), .CK(clk), .RN(n65), .Q(Q[26]), .QN(n27) );
  DFFRX2TS Q_reg_19_ ( .D(n51), .CK(clk), .RN(n64), .Q(Q[19]), .QN(n20) );
  DFFRX2TS Q_reg_18_ ( .D(n50), .CK(clk), .RN(n64), .Q(Q[18]), .QN(n19) );
  DFFRX2TS Q_reg_17_ ( .D(n49), .CK(clk), .RN(n64), .Q(Q[17]), .QN(n18) );
  DFFRX2TS Q_reg_16_ ( .D(n48), .CK(clk), .RN(n64), .Q(Q[16]), .QN(n17) );
  DFFRX2TS Q_reg_25_ ( .D(n57), .CK(clk), .RN(n65), .Q(Q[25]), .QN(n26) );
  DFFRX2TS Q_reg_24_ ( .D(n56), .CK(clk), .RN(n65), .Q(Q[24]), .QN(n25) );
  DFFRX2TS Q_reg_23_ ( .D(n55), .CK(clk), .RN(n65), .Q(Q[23]), .QN(n24) );
  DFFRX2TS Q_reg_15_ ( .D(n47), .CK(clk), .RN(n64), .Q(Q[15]), .QN(n16) );
  DFFRX2TS Q_reg_14_ ( .D(n46), .CK(clk), .RN(n64), .Q(Q[14]), .QN(n15) );
  DFFRX2TS Q_reg_13_ ( .D(n45), .CK(clk), .RN(n64), .Q(Q[13]), .QN(n14) );
  DFFRX2TS Q_reg_12_ ( .D(n44), .CK(clk), .RN(n64), .Q(Q[12]), .QN(n13) );
  DFFRX2TS Q_reg_11_ ( .D(n43), .CK(clk), .RN(n64), .Q(Q[11]), .QN(n12) );
  DFFRX2TS Q_reg_10_ ( .D(n42), .CK(clk), .RN(n64), .Q(Q[10]), .QN(n11) );
  DFFRXLTS Q_reg_9_ ( .D(n41), .CK(clk), .RN(n62), .Q(Q[9]), .QN(n10) );
  DFFRXLTS Q_reg_8_ ( .D(n40), .CK(clk), .RN(n62), .Q(Q[8]), .QN(n9) );
  DFFRXLTS Q_reg_6_ ( .D(n38), .CK(clk), .RN(n62), .Q(Q[6]), .QN(n7) );
  DFFRXLTS Q_reg_7_ ( .D(n39), .CK(clk), .RN(n62), .Q(Q[7]), .QN(n8) );
  DFFRXLTS Q_reg_5_ ( .D(n37), .CK(clk), .RN(n62), .Q(Q[5]), .QN(n6) );
  DFFRXLTS Q_reg_4_ ( .D(n36), .CK(clk), .RN(n62), .Q(Q[4]), .QN(n5) );
  DFFRXLTS Q_reg_3_ ( .D(n35), .CK(clk), .RN(n62), .Q(Q[3]), .QN(n4) );
  DFFRXLTS Q_reg_2_ ( .D(n34), .CK(clk), .RN(n62), .Q(Q[2]), .QN(n3) );
  DFFRXLTS Q_reg_1_ ( .D(n33), .CK(clk), .RN(n62), .Q(Q[1]), .QN(n2) );
  DFFRXLTS Q_reg_0_ ( .D(n32), .CK(clk), .RN(n62), .Q(Q[0]), .QN(n1) );
  CLKBUFX2TS U2 ( .A(n71), .Y(n66) );
  CLKBUFX2TS U3 ( .A(n71), .Y(n67) );
  CLKBUFX2TS U4 ( .A(n70), .Y(n68) );
  CLKBUFX2TS U5 ( .A(n70), .Y(n69) );
  CLKBUFX2TS U6 ( .A(load), .Y(n71) );
  CLKBUFX2TS U7 ( .A(load), .Y(n70) );
  CLKBUFX2TS U8 ( .A(load), .Y(n72) );
  CLKBUFX2TS U9 ( .A(n73), .Y(n62) );
  CLKBUFX2TS U10 ( .A(n73), .Y(n64) );
  CLKBUFX2TS U11 ( .A(n73), .Y(n65) );
  OAI2BB2XLTS U12 ( .B0(n2), .B1(n70), .A0N(D[1]), .A1N(n68), .Y(n33) );
  OAI2BB2XLTS U13 ( .B0(n3), .B1(n71), .A0N(D[2]), .A1N(n68), .Y(n34) );
  OAI2BB2XLTS U14 ( .B0(n4), .B1(n70), .A0N(D[3]), .A1N(n68), .Y(n35) );
  OAI2BB2XLTS U15 ( .B0(n5), .B1(n72), .A0N(D[4]), .A1N(n67), .Y(n36) );
  OAI2BB2XLTS U16 ( .B0(n6), .B1(n72), .A0N(D[5]), .A1N(n67), .Y(n37) );
  OAI2BB2XLTS U17 ( .B0(n7), .B1(n72), .A0N(D[6]), .A1N(n67), .Y(n38) );
  OAI2BB2XLTS U18 ( .B0(n8), .B1(n72), .A0N(D[7]), .A1N(n66), .Y(n39) );
  OAI2BB2XLTS U19 ( .B0(n11), .B1(n72), .A0N(D[10]), .A1N(n66), .Y(n42) );
  OAI2BB2XLTS U20 ( .B0(n12), .B1(n72), .A0N(D[11]), .A1N(n66), .Y(n43) );
  OAI2BB2XLTS U21 ( .B0(n13), .B1(n71), .A0N(D[12]), .A1N(n66), .Y(n44) );
  OAI2BB2XLTS U22 ( .B0(n14), .B1(n70), .A0N(D[13]), .A1N(n66), .Y(n45) );
  OAI2BB2XLTS U23 ( .B0(n15), .B1(load), .A0N(D[14]), .A1N(n66), .Y(n46) );
  OAI2BB2XLTS U24 ( .B0(n16), .B1(load), .A0N(D[15]), .A1N(n66), .Y(n47) );
  OAI2BB2XLTS U25 ( .B0(n17), .B1(n72), .A0N(D[16]), .A1N(n66), .Y(n48) );
  OAI2BB2XLTS U26 ( .B0(n18), .B1(n71), .A0N(D[17]), .A1N(n67), .Y(n49) );
  OAI2BB2XLTS U27 ( .B0(n20), .B1(n70), .A0N(D[19]), .A1N(n67), .Y(n51) );
  OAI2BB2XLTS U28 ( .B0(n21), .B1(n69), .A0N(D[20]), .A1N(n67), .Y(n52) );
  OAI2BB2XLTS U29 ( .B0(n22), .B1(n69), .A0N(D[21]), .A1N(n67), .Y(n53) );
  OAI2BB2XLTS U30 ( .B0(n23), .B1(n69), .A0N(D[22]), .A1N(n67), .Y(n54) );
  OAI2BB2XLTS U31 ( .B0(n24), .B1(n69), .A0N(D[23]), .A1N(n68), .Y(n55) );
  OAI2BB2XLTS U32 ( .B0(n25), .B1(n70), .A0N(D[24]), .A1N(n68), .Y(n56) );
  OAI2BB2XLTS U33 ( .B0(n26), .B1(n70), .A0N(D[25]), .A1N(n68), .Y(n57) );
  OAI2BB2XLTS U34 ( .B0(n27), .B1(n70), .A0N(D[26]), .A1N(n68), .Y(n58) );
  OAI2BB2XLTS U35 ( .B0(n28), .B1(n71), .A0N(D[27]), .A1N(n68), .Y(n59) );
  OAI2BB2XLTS U36 ( .B0(n29), .B1(n70), .A0N(D[28]), .A1N(n68), .Y(n60) );
  OAI2BB2XLTS U37 ( .B0(n30), .B1(n71), .A0N(D[29]), .A1N(n68), .Y(n61) );
  OAI2BB2XLTS U38 ( .B0(n31), .B1(n72), .A0N(D[30]), .A1N(n69), .Y(n63) );
  OAI2BB2XLTS U39 ( .B0(n1), .B1(n66), .A0N(n69), .A1N(D[0]), .Y(n32) );
  OAI2BB2XLTS U40 ( .B0(n9), .B1(n72), .A0N(D[8]), .A1N(n66), .Y(n40) );
  OAI2BB2XLTS U41 ( .B0(n10), .B1(n71), .A0N(D[9]), .A1N(n67), .Y(n41) );
  OAI2BB2XLTS U42 ( .B0(n19), .B1(n72), .A0N(D[18]), .A1N(n67), .Y(n50) );
  INVX2TS U43 ( .A(rst), .Y(n73) );
endmodule


module RegisterAdd_W31_0 ( clk, rst, load, D, Q );
  input [30:0] D;
  output [30:0] Q;
  input clk, rst, load;
  wire   n62, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76,
         n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90,
         n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103,
         n104, n105, n106, n107, n108, n109, n110, n111, n112, n113, n114,
         n115, n116, n117, n118, n119, n120, n121, n122, n123, n124, n125,
         n126, n127, n128, n129, n130, n131, n132, n133, n134, n135;

  DFFRX2TS Q_reg_30_ ( .D(n74), .CK(clk), .RN(n73), .Q(Q[30]), .QN(n105) );
  DFFRX2TS Q_reg_22_ ( .D(n82), .CK(clk), .RN(n65), .Q(Q[22]), .QN(n113) );
  DFFRX2TS Q_reg_21_ ( .D(n83), .CK(clk), .RN(n65), .Q(Q[21]), .QN(n114) );
  DFFRX2TS Q_reg_20_ ( .D(n84), .CK(clk), .RN(n65), .Q(Q[20]), .QN(n115) );
  DFFRX2TS Q_reg_19_ ( .D(n85), .CK(clk), .RN(n64), .Q(Q[19]), .QN(n116) );
  DFFRX2TS Q_reg_18_ ( .D(n86), .CK(clk), .RN(n64), .Q(Q[18]), .QN(n117) );
  DFFRX2TS Q_reg_17_ ( .D(n87), .CK(clk), .RN(n64), .Q(Q[17]), .QN(n118) );
  DFFRX2TS Q_reg_16_ ( .D(n88), .CK(clk), .RN(n64), .Q(Q[16]), .QN(n119) );
  DFFRX2TS Q_reg_15_ ( .D(n89), .CK(clk), .RN(n64), .Q(Q[15]), .QN(n120) );
  DFFRX2TS Q_reg_14_ ( .D(n90), .CK(clk), .RN(n64), .Q(Q[14]), .QN(n121) );
  DFFRX2TS Q_reg_13_ ( .D(n91), .CK(clk), .RN(n64), .Q(Q[13]), .QN(n122) );
  DFFRX2TS Q_reg_12_ ( .D(n92), .CK(clk), .RN(n64), .Q(Q[12]), .QN(n123) );
  DFFRX2TS Q_reg_11_ ( .D(n93), .CK(clk), .RN(n64), .Q(Q[11]), .QN(n124) );
  DFFRX2TS Q_reg_10_ ( .D(n94), .CK(clk), .RN(n64), .Q(Q[10]), .QN(n125) );
  DFFRX2TS Q_reg_9_ ( .D(n95), .CK(clk), .RN(n62), .Q(Q[9]), .QN(n126) );
  DFFRX2TS Q_reg_8_ ( .D(n96), .CK(clk), .RN(n62), .Q(Q[8]), .QN(n127) );
  DFFRX2TS Q_reg_7_ ( .D(n97), .CK(clk), .RN(n62), .Q(Q[7]), .QN(n128) );
  DFFRX2TS Q_reg_6_ ( .D(n98), .CK(clk), .RN(n62), .Q(Q[6]), .QN(n129) );
  DFFRX2TS Q_reg_5_ ( .D(n99), .CK(clk), .RN(n62), .Q(Q[5]), .QN(n130) );
  DFFRX2TS Q_reg_4_ ( .D(n100), .CK(clk), .RN(n62), .Q(Q[4]), .QN(n131) );
  DFFRX2TS Q_reg_3_ ( .D(n101), .CK(clk), .RN(n62), .Q(Q[3]), .QN(n132) );
  DFFRX2TS Q_reg_2_ ( .D(n102), .CK(clk), .RN(n62), .Q(Q[2]), .QN(n133) );
  DFFRX2TS Q_reg_1_ ( .D(n103), .CK(clk), .RN(n62), .Q(Q[1]), .QN(n134) );
  DFFRX2TS Q_reg_0_ ( .D(n104), .CK(clk), .RN(n62), .Q(Q[0]), .QN(n135) );
  DFFRX2TS Q_reg_29_ ( .D(n75), .CK(clk), .RN(n65), .Q(Q[29]), .QN(n106) );
  DFFRX2TS Q_reg_28_ ( .D(n76), .CK(clk), .RN(n65), .Q(Q[28]), .QN(n107) );
  DFFRX2TS Q_reg_27_ ( .D(n77), .CK(clk), .RN(n65), .Q(Q[27]), .QN(n108) );
  DFFRX2TS Q_reg_26_ ( .D(n78), .CK(clk), .RN(n65), .Q(Q[26]), .QN(n109) );
  DFFRX2TS Q_reg_25_ ( .D(n79), .CK(clk), .RN(n65), .Q(Q[25]), .QN(n110) );
  DFFRX2TS Q_reg_24_ ( .D(n80), .CK(clk), .RN(n65), .Q(Q[24]), .QN(n111) );
  DFFRX2TS Q_reg_23_ ( .D(n81), .CK(clk), .RN(n65), .Q(Q[23]), .QN(n112) );
  CLKBUFX2TS U2 ( .A(n72), .Y(n67) );
  CLKBUFX2TS U3 ( .A(n70), .Y(n68) );
  CLKBUFX2TS U4 ( .A(n70), .Y(n69) );
  CLKBUFX2TS U5 ( .A(n71), .Y(n66) );
  CLKBUFX2TS U6 ( .A(load), .Y(n71) );
  CLKBUFX2TS U7 ( .A(load), .Y(n70) );
  CLKBUFX2TS U8 ( .A(load), .Y(n72) );
  CLKBUFX2TS U9 ( .A(n73), .Y(n62) );
  CLKBUFX2TS U10 ( .A(n73), .Y(n64) );
  CLKBUFX2TS U11 ( .A(n73), .Y(n65) );
  OAI2BB2XLTS U12 ( .B0(n124), .B1(n72), .A0N(D[11]), .A1N(n71), .Y(n93) );
  OAI2BB2XLTS U13 ( .B0(n122), .B1(n72), .A0N(D[13]), .A1N(n70), .Y(n91) );
  OAI2BB2XLTS U14 ( .B0(n120), .B1(n72), .A0N(D[15]), .A1N(n71), .Y(n89) );
  OAI2BB2XLTS U15 ( .B0(n135), .B1(n70), .A0N(n69), .A1N(D[0]), .Y(n104) );
  OAI2BB2XLTS U16 ( .B0(n134), .B1(n67), .A0N(D[1]), .A1N(n68), .Y(n103) );
  OAI2BB2XLTS U17 ( .B0(n133), .B1(n67), .A0N(D[2]), .A1N(n68), .Y(n102) );
  OAI2BB2XLTS U18 ( .B0(n132), .B1(n67), .A0N(D[3]), .A1N(n68), .Y(n101) );
  OAI2BB2XLTS U19 ( .B0(n131), .B1(n67), .A0N(D[4]), .A1N(n69), .Y(n100) );
  OAI2BB2XLTS U20 ( .B0(n130), .B1(n67), .A0N(D[5]), .A1N(n69), .Y(n99) );
  OAI2BB2XLTS U21 ( .B0(n129), .B1(n67), .A0N(D[6]), .A1N(n69), .Y(n98) );
  OAI2BB2XLTS U22 ( .B0(n128), .B1(n67), .A0N(D[7]), .A1N(n70), .Y(n97) );
  OAI2BB2XLTS U23 ( .B0(n127), .B1(n67), .A0N(D[8]), .A1N(n72), .Y(n96) );
  OAI2BB2XLTS U24 ( .B0(n126), .B1(n67), .A0N(D[9]), .A1N(n69), .Y(n95) );
  OAI2BB2XLTS U25 ( .B0(n125), .B1(n70), .A0N(D[10]), .A1N(n71), .Y(n94) );
  OAI2BB2XLTS U26 ( .B0(n123), .B1(n71), .A0N(D[12]), .A1N(n70), .Y(n92) );
  OAI2BB2XLTS U27 ( .B0(n121), .B1(n72), .A0N(D[14]), .A1N(n72), .Y(n90) );
  OAI2BB2XLTS U28 ( .B0(n119), .B1(n70), .A0N(D[16]), .A1N(n71), .Y(n88) );
  OAI2BB2XLTS U29 ( .B0(n118), .B1(n71), .A0N(D[17]), .A1N(n69), .Y(n87) );
  OAI2BB2XLTS U30 ( .B0(n117), .B1(n67), .A0N(D[18]), .A1N(n70), .Y(n86) );
  OAI2BB2XLTS U31 ( .B0(n116), .B1(n72), .A0N(D[19]), .A1N(n70), .Y(n85) );
  OAI2BB2XLTS U32 ( .B0(n115), .B1(n66), .A0N(D[20]), .A1N(n69), .Y(n84) );
  OAI2BB2XLTS U33 ( .B0(n114), .B1(n66), .A0N(D[21]), .A1N(n69), .Y(n83) );
  OAI2BB2XLTS U34 ( .B0(n113), .B1(n66), .A0N(D[22]), .A1N(n69), .Y(n82) );
  OAI2BB2XLTS U35 ( .B0(n112), .B1(n66), .A0N(D[23]), .A1N(n68), .Y(n81) );
  OAI2BB2XLTS U36 ( .B0(n111), .B1(n66), .A0N(D[24]), .A1N(n68), .Y(n80) );
  OAI2BB2XLTS U37 ( .B0(n110), .B1(n66), .A0N(D[25]), .A1N(n68), .Y(n79) );
  OAI2BB2XLTS U38 ( .B0(n109), .B1(n66), .A0N(D[26]), .A1N(n68), .Y(n78) );
  OAI2BB2XLTS U39 ( .B0(n108), .B1(n66), .A0N(D[27]), .A1N(n68), .Y(n77) );
  OAI2BB2XLTS U40 ( .B0(n107), .B1(n66), .A0N(D[28]), .A1N(n68), .Y(n76) );
  OAI2BB2XLTS U41 ( .B0(n106), .B1(n66), .A0N(D[29]), .A1N(n68), .Y(n75) );
  OAI2BB2XLTS U42 ( .B0(n105), .B1(n71), .A0N(D[30]), .A1N(n69), .Y(n74) );
  INVX2TS U43 ( .A(rst), .Y(n73) );
endmodule


module RegisterAdd_W1_3 ( clk, rst, load, D, Q );
  input [0:0] D;
  output [0:0] Q;
  input clk, rst, load;
  wire   n2, n4, n5;

  DFFRX2TS Q_reg_0_ ( .D(n4), .CK(clk), .RN(n2), .Q(Q[0]), .QN(n5) );
  OAI2BB2XLTS U2 ( .B0(n5), .B1(load), .A0N(load), .A1N(D[0]), .Y(n4) );
  INVX2TS U3 ( .A(rst), .Y(n2) );
endmodule


module Oper_Start_In_2_W32 ( clk, rst, load_b_i, intAS, intDX, intDY, DMP_o, 
        DmP_o, zero_flag_o, real_op_o, sign_final_result_o );
  input [31:0] intDX;
  input [31:0] intDY;
  output [30:0] DMP_o;
  output [30:0] DmP_o;
  input clk, rst, load_b_i, intAS;
  output zero_flag_o, real_op_o, sign_final_result_o;
  wire   gtXY, eqXY, sign_result, n1;
  wire   [30:0] intM;
  wire   [30:0] intm;

  Comparator_W31 Magnitude_Comparator ( .Data_X_i(intDX[30:0]), .Data_Y_i(
        intDY[30:0]), .gtXY_o(gtXY), .eqXY_o(eqXY) );
  xor_tri_W32 Op_verification ( .A_i(intDX[31]), .B_i(intDY[31]), .C_i(intAS), 
        .Z_o(real_op_o) );
  sgn_result result_sign_bit ( .Add_Subt_i(intAS), .sgn_X_i(intDX[31]), 
        .sgn_Y_i(intDY[31]), .gtXY_i(gtXY), .eqXY_i(eqXY), .sgn_result_o(
        sign_result) );
  MultiplexTxT_W31 MuxXY ( .select(gtXY), .D0_i(intDX[30:0]), .D1_i(
        intDY[30:0]), .S0_o(intM), .S1_o(intm) );
  RegisterAdd_W31_1 MRegister ( .clk(clk), .rst(rst), .load(n1), .D(intM), .Q(
        DMP_o) );
  RegisterAdd_W31_0 mRegister ( .clk(clk), .rst(rst), .load(n1), .D(intm), .Q(
        DmP_o) );
  RegisterAdd_W1_3 SignRegister ( .clk(clk), .rst(rst), .load(n1), .D(
        sign_result), .Q(sign_final_result_o) );
  CLKBUFX2TS U1 ( .A(load_b_i), .Y(n1) );
  AND2X2TS U2 ( .A(real_op_o), .B(eqXY), .Y(zero_flag_o) );
endmodule


module Multiplexer_AC_W8_1 ( ctrl, D0, D1, S );
  input [7:0] D0;
  input [7:0] D1;
  output [7:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D1[0]), .A1(ctrl), .B0(D0[0]), .B1(n1), .Y(S[0]) );
  AO22X1TS U2 ( .A0(D1[1]), .A1(ctrl), .B0(D0[1]), .B1(n1), .Y(S[1]) );
  AO22X1TS U3 ( .A0(D1[2]), .A1(ctrl), .B0(D0[2]), .B1(n1), .Y(S[2]) );
  AO22X1TS U4 ( .A0(D1[3]), .A1(ctrl), .B0(D0[3]), .B1(n1), .Y(S[3]) );
  INVX2TS U5 ( .A(ctrl), .Y(n1) );
  AO22X1TS U6 ( .A0(D1[4]), .A1(ctrl), .B0(D0[4]), .B1(n1), .Y(S[4]) );
  AO22X1TS U7 ( .A0(D1[5]), .A1(ctrl), .B0(D0[5]), .B1(n1), .Y(S[5]) );
  AO22X1TS U8 ( .A0(D1[6]), .A1(ctrl), .B0(D0[6]), .B1(n1), .Y(S[6]) );
  AO22X1TS U9 ( .A0(ctrl), .A1(D1[7]), .B0(D0[7]), .B1(n1), .Y(S[7]) );
endmodule


module Mux_3x1_W8 ( ctrl, D0, D1, D2, S );
  input [1:0] ctrl;
  input [7:0] D0;
  input [7:0] D1;
  input [7:0] D2;
  output [7:0] S;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11;

  NOR2BX1TS U2 ( .AN(ctrl[1]), .B(ctrl[0]), .Y(n3) );
  NOR2BX1TS U3 ( .AN(ctrl[0]), .B(ctrl[1]), .Y(n4) );
  AO21X1TS U4 ( .A0(D0[0]), .A1(n1), .B0(n11), .Y(S[0]) );
  AO22X1TS U5 ( .A0(D2[0]), .A1(n3), .B0(D1[0]), .B1(n4), .Y(n11) );
  OAI2BB1X1TS U6 ( .A0N(D0[1]), .A1N(n1), .B0(n10), .Y(S[1]) );
  AOI22X1TS U7 ( .A0(D2[1]), .A1(n3), .B0(D1[1]), .B1(n4), .Y(n10) );
  OAI2BB1X1TS U8 ( .A0N(D0[2]), .A1N(n1), .B0(n9), .Y(S[2]) );
  AOI22X1TS U9 ( .A0(D2[2]), .A1(n3), .B0(D1[2]), .B1(n4), .Y(n9) );
  OAI2BB1X1TS U10 ( .A0N(D0[3]), .A1N(n1), .B0(n8), .Y(S[3]) );
  AOI22X1TS U11 ( .A0(D2[3]), .A1(n3), .B0(D1[3]), .B1(n4), .Y(n8) );
  OAI2BB1X1TS U12 ( .A0N(D0[4]), .A1N(n1), .B0(n7), .Y(S[4]) );
  AOI22X1TS U13 ( .A0(D2[4]), .A1(n3), .B0(D1[4]), .B1(n4), .Y(n7) );
  NOR2X1TS U14 ( .A(ctrl[0]), .B(ctrl[1]), .Y(n1) );
  OAI2BB1X1TS U15 ( .A0N(D0[5]), .A1N(n1), .B0(n6), .Y(S[5]) );
  AOI22X1TS U16 ( .A0(D2[5]), .A1(n3), .B0(D1[5]), .B1(n4), .Y(n6) );
  OAI2BB1X1TS U17 ( .A0N(D0[6]), .A1N(n1), .B0(n5), .Y(S[6]) );
  AOI22X1TS U18 ( .A0(D2[6]), .A1(n3), .B0(D1[6]), .B1(n4), .Y(n5) );
  OAI2BB1X1TS U19 ( .A0N(D0[7]), .A1N(n1), .B0(n2), .Y(S[7]) );
  AOI22X1TS U20 ( .A0(D2[7]), .A1(n3), .B0(D1[7]), .B1(n4), .Y(n2) );
endmodule


module add_sub_carry_out_W8_DW01_add_0 ( A, B, CI, SUM, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] SUM;
  input CI;
  output CO;
  wire   n1, n2;
  wire   [7:1] carry;

  CMPR32X2TS U1_7 ( .A(A[7]), .B(B[7]), .C(carry[7]), .CO(SUM[8]), .S(SUM[7])
         );
  CMPR32X2TS U1_1 ( .A(A[1]), .B(B[1]), .C(carry[1]), .CO(carry[2]), .S(SUM[1]) );
  CMPR32X2TS U1_6 ( .A(A[6]), .B(B[6]), .C(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  CMPR32X2TS U1_5 ( .A(A[5]), .B(B[5]), .C(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  CMPR32X2TS U1_4 ( .A(A[4]), .B(B[4]), .C(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  CMPR32X2TS U1_3 ( .A(A[3]), .B(B[3]), .C(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  CMPR32X2TS U1_2 ( .A(A[2]), .B(B[2]), .C(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  XNOR2X1TS U1 ( .A(B[0]), .B(n1), .Y(SUM[0]) );
  NOR2X1TS U2 ( .A(n1), .B(n2), .Y(carry[1]) );
  INVX2TS U3 ( .A(B[0]), .Y(n2) );
  INVX2TS U4 ( .A(A[0]), .Y(n1) );
endmodule


module add_sub_carry_out_W8_DW01_sub_0 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n1, n3, n4, n5, n6, n7, n8, n9, n10;
  wire   [8:1] carry;

  CMPR32X2TS U2_7 ( .A(A[7]), .B(n3), .C(carry[7]), .CO(carry[8]), .S(DIFF[7])
         );
  CMPR32X2TS U2_1 ( .A(A[1]), .B(n9), .C(carry[1]), .CO(carry[2]), .S(DIFF[1])
         );
  CMPR32X2TS U2_6 ( .A(A[6]), .B(n4), .C(carry[6]), .CO(carry[7]), .S(DIFF[6])
         );
  CMPR32X2TS U2_5 ( .A(A[5]), .B(n5), .C(carry[5]), .CO(carry[6]), .S(DIFF[5])
         );
  CMPR32X2TS U2_4 ( .A(A[4]), .B(n6), .C(carry[4]), .CO(carry[5]), .S(DIFF[4])
         );
  CMPR32X2TS U2_3 ( .A(A[3]), .B(n7), .C(carry[3]), .CO(carry[4]), .S(DIFF[3])
         );
  CMPR32X2TS U2_2 ( .A(A[2]), .B(n8), .C(carry[2]), .CO(carry[3]), .S(DIFF[2])
         );
  INVX2TS U1 ( .A(B[0]), .Y(n10) );
  INVX2TS U2 ( .A(B[2]), .Y(n8) );
  INVX2TS U3 ( .A(B[3]), .Y(n7) );
  INVX2TS U4 ( .A(B[4]), .Y(n6) );
  INVX2TS U5 ( .A(B[5]), .Y(n5) );
  INVX2TS U6 ( .A(B[6]), .Y(n4) );
  INVX2TS U7 ( .A(B[1]), .Y(n9) );
  NAND2X1TS U8 ( .A(B[0]), .B(n1), .Y(carry[1]) );
  INVX2TS U9 ( .A(A[0]), .Y(n1) );
  INVX2TS U10 ( .A(B[7]), .Y(n3) );
  XNOR2X1TS U11 ( .A(n10), .B(A[0]), .Y(DIFF[0]) );
  INVX2TS U12 ( .A(carry[8]), .Y(DIFF[8]) );
endmodule


module add_sub_carry_out_W8 ( op_mode, Data_A, Data_B, Data_S );
  input [7:0] Data_A;
  input [7:0] Data_B;
  output [8:0] Data_S;
  input op_mode;
  wire   N3, N4, N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, N15, N16, N17,
         N18, N19, N20, n1;

  add_sub_carry_out_W8_DW01_add_0 add_36 ( .A({1'b0, Data_A}), .B({1'b0, 
        Data_B}), .CI(1'b0), .SUM({N20, N19, N18, N17, N16, N15, N14, N13, N12}) );
  add_sub_carry_out_W8_DW01_sub_0 sub_34 ( .A({1'b0, Data_A}), .B({1'b0, 
        Data_B}), .CI(1'b0), .DIFF({N11, N10, N9, N8, N7, N6, N5, N4, N3}) );
  AO22X1TS U3 ( .A0(N9), .A1(op_mode), .B0(N18), .B1(n1), .Y(Data_S[6]) );
  AO22X1TS U4 ( .A0(N19), .A1(n1), .B0(N10), .B1(op_mode), .Y(Data_S[7]) );
  AO22X1TS U5 ( .A0(N8), .A1(op_mode), .B0(N17), .B1(n1), .Y(Data_S[5]) );
  AO22X1TS U6 ( .A0(N6), .A1(op_mode), .B0(N15), .B1(n1), .Y(Data_S[3]) );
  AO22X1TS U7 ( .A0(N7), .A1(op_mode), .B0(N16), .B1(n1), .Y(Data_S[4]) );
  AO22X1TS U8 ( .A0(N5), .A1(op_mode), .B0(N14), .B1(n1), .Y(Data_S[2]) );
  AO22X1TS U9 ( .A0(N3), .A1(op_mode), .B0(N12), .B1(n1), .Y(Data_S[0]) );
  AO22X1TS U10 ( .A0(N20), .A1(n1), .B0(op_mode), .B1(N11), .Y(Data_S[8]) );
  INVX2TS U11 ( .A(op_mode), .Y(n1) );
  AO22X1TS U12 ( .A0(N4), .A1(op_mode), .B0(N13), .B1(n1), .Y(Data_S[1]) );
endmodule


module Greater_Comparator_W9 ( Data_A, Data_B, gthan );
  input [8:0] Data_A;
  input [8:0] Data_B;
  output gthan;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23;

  INVX2TS U1 ( .A(Data_A[2]), .Y(n22) );
  INVX2TS U2 ( .A(Data_B[5]), .Y(n19) );
  INVX2TS U3 ( .A(Data_B[8]), .Y(n15) );
  INVX2TS U4 ( .A(Data_B[0]), .Y(n16) );
  INVX2TS U5 ( .A(Data_A[3]), .Y(n23) );
  INVX2TS U6 ( .A(Data_B[4]), .Y(n20) );
  INVX2TS U7 ( .A(Data_B[6]), .Y(n18) );
  INVX2TS U8 ( .A(Data_B[7]), .Y(n17) );
  INVX2TS U9 ( .A(Data_B[1]), .Y(n21) );
  AND2X1TS U10 ( .A(Data_A[7]), .B(n17), .Y(n7) );
  AOI21X1TS U11 ( .A0(n18), .A1(Data_A[6]), .B0(n7), .Y(n11) );
  AO22X1TS U12 ( .A0(n16), .A1(Data_A[0]), .B0(n21), .B1(Data_A[1]), .Y(n1) );
  NAND2BX1TS U13 ( .AN(Data_B[3]), .B(Data_A[3]), .Y(n2) );
  AOI32X1TS U14 ( .A0(Data_B[2]), .A1(n22), .A2(n2), .B0(n23), .B1(Data_B[3]), 
        .Y(n4) );
  OAI211X1TS U15 ( .A0(Data_A[1]), .A1(n21), .B0(n1), .C0(n4), .Y(n6) );
  OAI21X1TS U16 ( .A0(Data_B[2]), .A1(n22), .B0(n2), .Y(n3) );
  NOR2BX1TS U17 ( .AN(Data_A[5]), .B(Data_B[5]), .Y(n8) );
  AOI221X1TS U18 ( .A0(n4), .A1(n3), .B0(Data_A[4]), .B1(n20), .C0(n8), .Y(n5)
         );
  NAND3X1TS U19 ( .A(n11), .B(n6), .C(n5), .Y(n13) );
  OAI32X1TS U20 ( .A0(n18), .A1(Data_A[6]), .A2(n7), .B0(Data_A[7]), .B1(n17), 
        .Y(n10) );
  OAI32X1TS U21 ( .A0(n20), .A1(Data_A[4]), .A2(n8), .B0(Data_A[5]), .B1(n19), 
        .Y(n9) );
  OAI22X1TS U22 ( .A0(n11), .A1(n10), .B0(n10), .B1(n9), .Y(n12) );
  OAI211X1TS U23 ( .A0(Data_A[8]), .A1(n15), .B0(n13), .C0(n12), .Y(n14) );
  OAI2BB1X1TS U24 ( .A0N(n15), .A1N(Data_A[8]), .B0(n14), .Y(gthan) );
endmodule


module Comparator_Less_W9 ( Data_A, Data_B, less );
  input [8:0] Data_A;
  input [8:0] Data_B;
  output less;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23;

  INVX2TS U1 ( .A(Data_A[6]), .Y(n21) );
  INVX2TS U2 ( .A(Data_A[7]), .Y(n22) );
  INVX2TS U3 ( .A(Data_A[4]), .Y(n19) );
  INVX2TS U4 ( .A(Data_A[8]), .Y(n23) );
  INVX2TS U5 ( .A(Data_A[5]), .Y(n20) );
  INVX2TS U6 ( .A(Data_B[3]), .Y(n15) );
  INVX2TS U7 ( .A(Data_A[1]), .Y(n18) );
  INVX2TS U8 ( .A(Data_A[0]), .Y(n17) );
  INVX2TS U9 ( .A(Data_B[2]), .Y(n16) );
  AND2X1TS U10 ( .A(Data_B[7]), .B(n22), .Y(n7) );
  AOI21X1TS U11 ( .A0(n21), .A1(Data_B[6]), .B0(n7), .Y(n11) );
  AO22X1TS U12 ( .A0(n17), .A1(Data_B[0]), .B0(n18), .B1(Data_B[1]), .Y(n1) );
  NAND2BX1TS U13 ( .AN(Data_A[3]), .B(Data_B[3]), .Y(n2) );
  AOI32X1TS U14 ( .A0(Data_A[2]), .A1(n16), .A2(n2), .B0(n15), .B1(Data_A[3]), 
        .Y(n4) );
  OAI211X1TS U15 ( .A0(Data_B[1]), .A1(n18), .B0(n1), .C0(n4), .Y(n6) );
  OAI21X1TS U16 ( .A0(Data_A[2]), .A1(n16), .B0(n2), .Y(n3) );
  NOR2BX1TS U17 ( .AN(Data_B[5]), .B(Data_A[5]), .Y(n8) );
  AOI221X1TS U18 ( .A0(n4), .A1(n3), .B0(Data_B[4]), .B1(n19), .C0(n8), .Y(n5)
         );
  NAND3X1TS U19 ( .A(n11), .B(n6), .C(n5), .Y(n13) );
  OAI32X1TS U20 ( .A0(n21), .A1(Data_B[6]), .A2(n7), .B0(Data_B[7]), .B1(n22), 
        .Y(n10) );
  OAI32X1TS U21 ( .A0(n19), .A1(Data_B[4]), .A2(n8), .B0(Data_B[5]), .B1(n20), 
        .Y(n9) );
  OAI22X1TS U22 ( .A0(n11), .A1(n10), .B0(n10), .B1(n9), .Y(n12) );
  OAI211X1TS U23 ( .A0(Data_B[8]), .A1(n23), .B0(n13), .C0(n12), .Y(n14) );
  OAI2BB1X1TS U24 ( .A0N(n23), .A1N(Data_B[8]), .B0(n14), .Y(less) );
endmodule


module Comparators_W_Exp9 ( exp, overflow, underflow );
  input [8:0] exp;
  output overflow, underflow;


  Greater_Comparator_W9 GTComparator ( .Data_A(exp), .Data_B({1'b0, 1'b1, 1'b1, 
        1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b0}), .gthan(overflow) );
  Comparator_Less_W9 LTComparator ( .Data_A(exp), .Data_B({1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b1}), .less(underflow) );
endmodule


module RegisterAdd_W8 ( clk, rst, load, D, Q );
  input [7:0] D;
  output [7:0] Q;
  input clk, rst, load;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n17,
         n16, n18;

  DFFRX2TS Q_reg_7_ ( .D(n17), .CK(clk), .RN(n18), .Q(Q[7]), .QN(n8) );
  DFFRX2TS Q_reg_6_ ( .D(n15), .CK(clk), .RN(n18), .Q(Q[6]), .QN(n7) );
  DFFRX2TS Q_reg_5_ ( .D(n14), .CK(clk), .RN(n18), .Q(Q[5]), .QN(n6) );
  DFFRX2TS Q_reg_4_ ( .D(n13), .CK(clk), .RN(n18), .Q(Q[4]), .QN(n5) );
  DFFRX2TS Q_reg_3_ ( .D(n12), .CK(clk), .RN(n18), .Q(Q[3]), .QN(n4) );
  DFFRX2TS Q_reg_2_ ( .D(n11), .CK(clk), .RN(n18), .Q(Q[2]), .QN(n3) );
  DFFRX2TS Q_reg_1_ ( .D(n10), .CK(clk), .RN(n18), .Q(Q[1]), .QN(n2) );
  DFFRX2TS Q_reg_0_ ( .D(n9), .CK(clk), .RN(n18), .Q(Q[0]), .QN(n1) );
  CLKBUFX2TS U2 ( .A(load), .Y(n16) );
  OAI2BB2XLTS U3 ( .B0(n7), .B1(n16), .A0N(D[6]), .A1N(load), .Y(n15) );
  OAI2BB2XLTS U4 ( .B0(n8), .B1(n16), .A0N(D[7]), .A1N(load), .Y(n17) );
  OAI2BB2XLTS U5 ( .B0(n1), .B1(n16), .A0N(load), .A1N(D[0]), .Y(n9) );
  OAI2BB2XLTS U6 ( .B0(n2), .B1(n16), .A0N(D[1]), .A1N(load), .Y(n10) );
  OAI2BB2XLTS U7 ( .B0(n3), .B1(n16), .A0N(D[2]), .A1N(load), .Y(n11) );
  OAI2BB2XLTS U8 ( .B0(n4), .B1(n16), .A0N(D[3]), .A1N(load), .Y(n12) );
  OAI2BB2XLTS U9 ( .B0(n5), .B1(n16), .A0N(D[4]), .A1N(load), .Y(n13) );
  OAI2BB2XLTS U10 ( .B0(n6), .B1(n16), .A0N(D[5]), .A1N(n16), .Y(n14) );
  INVX2TS U11 ( .A(rst), .Y(n18) );
endmodule


module RegisterAdd_W1_2 ( clk, rst, load, D, Q );
  input [0:0] D;
  output [0:0] Q;
  input clk, rst, load;
  wire   n2, n4, n5;

  DFFRX2TS Q_reg_0_ ( .D(n4), .CK(clk), .RN(n2), .Q(Q[0]), .QN(n5) );
  OAI2BB2XLTS U2 ( .B0(n5), .B1(load), .A0N(load), .A1N(D[0]), .Y(n4) );
  INVX2TS U3 ( .A(rst), .Y(n2) );
endmodule


module RegisterAdd_W1_1 ( clk, rst, load, D, Q );
  input [0:0] D;
  output [0:0] Q;
  input clk, rst, load;
  wire   n2, n4, n5;

  DFFRX2TS Q_reg_0_ ( .D(n4), .CK(clk), .RN(n2), .Q(Q[0]), .QN(n5) );
  OAI2BB2XLTS U2 ( .B0(n5), .B1(load), .A0N(load), .A1N(D[0]), .Y(n4) );
  INVX2TS U3 ( .A(rst), .Y(n2) );
endmodule


module Exp_Operation_EW8 ( clk, rst, load_a_i, load_b_i, Data_A_i, Data_B_i, 
        Add_Subt_i, Data_Result_o, Overflow_flag_o, Underflow_flag_o );
  input [7:0] Data_A_i;
  input [7:0] Data_B_i;
  output [7:0] Data_Result_o;
  input clk, rst, load_a_i, load_b_i, Add_Subt_i;
  output Overflow_flag_o, Underflow_flag_o;
  wire   Overflow_flag, Underflow_flag;
  wire   [8:0] Data_S;

  add_sub_carry_out_W8 exp_add_subt ( .op_mode(Add_Subt_i), .Data_A(Data_A_i), 
        .Data_B(Data_B_i), .Data_S(Data_S) );
  Comparators_W_Exp9 array_comparators ( .exp(Data_S), .overflow(Overflow_flag), .underflow(Underflow_flag) );
  RegisterAdd_W8 exp_result ( .clk(clk), .rst(rst), .load(load_a_i), .D(
        Data_S[7:0]), .Q(Data_Result_o) );
  RegisterAdd_W1_2 Overflow ( .clk(clk), .rst(rst), .load(load_a_i), .D(
        Overflow_flag), .Q(Overflow_flag_o) );
  RegisterAdd_W1_1 Underflow ( .clk(clk), .rst(rst), .load(load_b_i), .D(
        Underflow_flag), .Q(Underflow_flag_o) );
endmodule


module Mux_3x1_W5 ( ctrl, D0, D1, D2, S );
  input [1:0] ctrl;
  input [4:0] D0;
  input [4:0] D1;
  input [4:0] D2;
  output [4:0] S;
  wire   n1, n2, n3, n4, n5, n6, n7, n8;

  OAI2BB1X1TS U2 ( .A0N(D0[4]), .A1N(n1), .B0(n2), .Y(S[4]) );
  NOR2BX1TS U3 ( .AN(ctrl[1]), .B(ctrl[0]), .Y(n3) );
  NOR2BX1TS U4 ( .AN(ctrl[0]), .B(ctrl[1]), .Y(n4) );
  AOI22X1TS U5 ( .A0(D2[4]), .A1(n3), .B0(D1[4]), .B1(n4), .Y(n2) );
  OAI2BB1X1TS U6 ( .A0N(D0[2]), .A1N(n1), .B0(n6), .Y(S[2]) );
  AOI22X1TS U7 ( .A0(D2[2]), .A1(n3), .B0(D1[2]), .B1(n4), .Y(n6) );
  OAI2BB1X1TS U8 ( .A0N(D0[0]), .A1N(n1), .B0(n8), .Y(S[0]) );
  AOI22X1TS U9 ( .A0(D2[0]), .A1(n3), .B0(D1[0]), .B1(n4), .Y(n8) );
  OAI2BB1X1TS U10 ( .A0N(D0[1]), .A1N(n1), .B0(n7), .Y(S[1]) );
  AOI22X1TS U11 ( .A0(D2[1]), .A1(n3), .B0(D1[1]), .B1(n4), .Y(n7) );
  OAI2BB1X1TS U12 ( .A0N(D0[3]), .A1N(n1), .B0(n5), .Y(S[3]) );
  AOI22X1TS U13 ( .A0(D2[3]), .A1(n3), .B0(D1[3]), .B1(n4), .Y(n5) );
  NOR2X1TS U14 ( .A(ctrl[0]), .B(ctrl[1]), .Y(n1) );
endmodule


module Multiplexer_AC_W26_2 ( ctrl, D0, D1, S );
  input [25:0] D0;
  input [25:0] D1;
  output [25:0] S;
  input ctrl;
  wire   n1, n2, n3, n4, n5;

  INVX2TS U1 ( .A(n5), .Y(n1) );
  INVX2TS U2 ( .A(n5), .Y(n2) );
  CLKBUFX2TS U3 ( .A(n5), .Y(n3) );
  CLKBUFX2TS U4 ( .A(n5), .Y(n4) );
  INVX2TS U5 ( .A(ctrl), .Y(n5) );
  AO22X1TS U6 ( .A0(D1[25]), .A1(n1), .B0(D0[25]), .B1(n3), .Y(S[25]) );
  AO22X1TS U7 ( .A0(D1[23]), .A1(n2), .B0(D0[23]), .B1(n3), .Y(S[23]) );
  AO22X1TS U8 ( .A0(D1[2]), .A1(n1), .B0(D0[2]), .B1(n3), .Y(S[2]) );
  AO22X1TS U9 ( .A0(D1[24]), .A1(n1), .B0(D0[24]), .B1(n3), .Y(S[24]) );
  AO22X1TS U10 ( .A0(D1[13]), .A1(ctrl), .B0(D0[13]), .B1(n4), .Y(S[13]) );
  AO22X1TS U11 ( .A0(D1[12]), .A1(ctrl), .B0(D0[12]), .B1(n5), .Y(S[12]) );
  AO22X1TS U12 ( .A0(D1[11]), .A1(ctrl), .B0(D0[11]), .B1(n4), .Y(S[11]) );
  AO22X1TS U13 ( .A0(D1[14]), .A1(ctrl), .B0(D0[14]), .B1(n4), .Y(S[14]) );
  AO22X1TS U14 ( .A0(D1[20]), .A1(n2), .B0(D0[20]), .B1(n3), .Y(S[20]) );
  AO22X1TS U15 ( .A0(D1[5]), .A1(n1), .B0(D0[5]), .B1(n4), .Y(S[5]) );
  AO22X1TS U16 ( .A0(D1[19]), .A1(n2), .B0(D0[19]), .B1(n4), .Y(S[19]) );
  AO22X1TS U17 ( .A0(D1[6]), .A1(n1), .B0(D0[6]), .B1(n4), .Y(S[6]) );
  AO22X1TS U18 ( .A0(D1[22]), .A1(n2), .B0(D0[22]), .B1(n3), .Y(S[22]) );
  AO22X1TS U19 ( .A0(D1[3]), .A1(n1), .B0(D0[3]), .B1(n3), .Y(S[3]) );
  AO22X1TS U20 ( .A0(D1[21]), .A1(n2), .B0(D0[21]), .B1(n3), .Y(S[21]) );
  AO22X1TS U21 ( .A0(D1[4]), .A1(n1), .B0(D0[4]), .B1(n3), .Y(S[4]) );
  AO22X1TS U22 ( .A0(D1[7]), .A1(n1), .B0(D0[7]), .B1(n4), .Y(S[7]) );
  AO22X1TS U23 ( .A0(D1[18]), .A1(n2), .B0(D0[18]), .B1(n4), .Y(S[18]) );
  AO22X1TS U24 ( .A0(D1[8]), .A1(n1), .B0(D0[8]), .B1(n4), .Y(S[8]) );
  AO22X1TS U25 ( .A0(D1[17]), .A1(n2), .B0(D0[17]), .B1(n5), .Y(S[17]) );
  AO22X1TS U26 ( .A0(n1), .A1(D1[9]), .B0(D0[9]), .B1(n4), .Y(S[9]) );
  AO22X1TS U27 ( .A0(D1[16]), .A1(n2), .B0(D0[16]), .B1(n5), .Y(S[16]) );
  AO22X1TS U28 ( .A0(D1[10]), .A1(ctrl), .B0(D0[10]), .B1(n5), .Y(S[10]) );
  AO22X1TS U29 ( .A0(D1[15]), .A1(n2), .B0(D0[15]), .B1(n5), .Y(S[15]) );
  AO22X1TS U30 ( .A0(D1[1]), .A1(n2), .B0(D0[1]), .B1(n3), .Y(S[1]) );
  AO22X1TS U31 ( .A0(D1[0]), .A1(ctrl), .B0(D0[0]), .B1(n5), .Y(S[0]) );
endmodule


module Multiplexer_AC_W1_51 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_50 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_49 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_48 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_47 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_46 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_45 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_44 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_43 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_42 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_41 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_40 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_39 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_38 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_37 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_36 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_35 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_34 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_33 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_32 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_31 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_30 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_29 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_28 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_27 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_26 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Rotate_Mux_Array_SWR26_1 ( Data_i, select_i, Data_o );
  input [25:0] Data_i;
  output [25:0] Data_o;
  input select_i;
  wire   n1, n2, n3, n4, n5, n6;

  Multiplexer_AC_W1_51 MUX_ARRAY_0__MUX_ARRAY12_rotate_mux ( .ctrl(n1), .D0(
        Data_i[0]), .D1(Data_i[25]), .S(Data_o[0]) );
  Multiplexer_AC_W1_50 MUX_ARRAY_1__MUX_ARRAY12_rotate_mux ( .ctrl(n1), .D0(
        Data_i[1]), .D1(Data_i[24]), .S(Data_o[1]) );
  Multiplexer_AC_W1_49 MUX_ARRAY_2__MUX_ARRAY12_rotate_mux ( .ctrl(n1), .D0(
        Data_i[2]), .D1(Data_i[23]), .S(Data_o[2]) );
  Multiplexer_AC_W1_48 MUX_ARRAY_3__MUX_ARRAY12_rotate_mux ( .ctrl(n1), .D0(
        Data_i[3]), .D1(Data_i[22]), .S(Data_o[3]) );
  Multiplexer_AC_W1_47 MUX_ARRAY_4__MUX_ARRAY12_rotate_mux ( .ctrl(n1), .D0(
        Data_i[4]), .D1(Data_i[21]), .S(Data_o[4]) );
  Multiplexer_AC_W1_46 MUX_ARRAY_5__MUX_ARRAY12_rotate_mux ( .ctrl(n2), .D0(
        Data_i[5]), .D1(Data_i[20]), .S(Data_o[5]) );
  Multiplexer_AC_W1_45 MUX_ARRAY_6__MUX_ARRAY12_rotate_mux ( .ctrl(n2), .D0(
        Data_i[6]), .D1(Data_i[19]), .S(Data_o[6]) );
  Multiplexer_AC_W1_44 MUX_ARRAY_7__MUX_ARRAY12_rotate_mux ( .ctrl(n2), .D0(
        Data_i[7]), .D1(Data_i[18]), .S(Data_o[7]) );
  Multiplexer_AC_W1_43 MUX_ARRAY_8__MUX_ARRAY12_rotate_mux ( .ctrl(n2), .D0(
        Data_i[8]), .D1(Data_i[17]), .S(Data_o[8]) );
  Multiplexer_AC_W1_42 MUX_ARRAY_9__MUX_ARRAY12_rotate_mux ( .ctrl(n2), .D0(
        Data_i[9]), .D1(Data_i[16]), .S(Data_o[9]) );
  Multiplexer_AC_W1_41 MUX_ARRAY_10__MUX_ARRAY12_rotate_mux ( .ctrl(n3), .D0(
        Data_i[10]), .D1(Data_i[15]), .S(Data_o[10]) );
  Multiplexer_AC_W1_40 MUX_ARRAY_11__MUX_ARRAY12_rotate_mux ( .ctrl(n3), .D0(
        Data_i[11]), .D1(Data_i[14]), .S(Data_o[11]) );
  Multiplexer_AC_W1_39 MUX_ARRAY_12__MUX_ARRAY12_rotate_mux ( .ctrl(n3), .D0(
        Data_i[12]), .D1(Data_i[13]), .S(Data_o[12]) );
  Multiplexer_AC_W1_38 MUX_ARRAY_13__MUX_ARRAY12_rotate_mux ( .ctrl(n3), .D0(
        Data_i[13]), .D1(Data_i[12]), .S(Data_o[13]) );
  Multiplexer_AC_W1_37 MUX_ARRAY_14__MUX_ARRAY12_rotate_mux ( .ctrl(n3), .D0(
        Data_i[14]), .D1(Data_i[11]), .S(Data_o[14]) );
  Multiplexer_AC_W1_36 MUX_ARRAY_15__MUX_ARRAY12_rotate_mux ( .ctrl(n4), .D0(
        Data_i[15]), .D1(Data_i[10]), .S(Data_o[15]) );
  Multiplexer_AC_W1_35 MUX_ARRAY_16__MUX_ARRAY12_rotate_mux ( .ctrl(n4), .D0(
        Data_i[16]), .D1(Data_i[9]), .S(Data_o[16]) );
  Multiplexer_AC_W1_34 MUX_ARRAY_17__MUX_ARRAY12_rotate_mux ( .ctrl(n4), .D0(
        Data_i[17]), .D1(Data_i[8]), .S(Data_o[17]) );
  Multiplexer_AC_W1_33 MUX_ARRAY_18__MUX_ARRAY12_rotate_mux ( .ctrl(n4), .D0(
        Data_i[18]), .D1(Data_i[7]), .S(Data_o[18]) );
  Multiplexer_AC_W1_32 MUX_ARRAY_19__MUX_ARRAY12_rotate_mux ( .ctrl(n4), .D0(
        Data_i[19]), .D1(Data_i[6]), .S(Data_o[19]) );
  Multiplexer_AC_W1_31 MUX_ARRAY_20__MUX_ARRAY12_rotate_mux ( .ctrl(n5), .D0(
        Data_i[20]), .D1(Data_i[5]), .S(Data_o[20]) );
  Multiplexer_AC_W1_30 MUX_ARRAY_21__MUX_ARRAY12_rotate_mux ( .ctrl(n5), .D0(
        Data_i[21]), .D1(Data_i[4]), .S(Data_o[21]) );
  Multiplexer_AC_W1_29 MUX_ARRAY_22__MUX_ARRAY12_rotate_mux ( .ctrl(n5), .D0(
        Data_i[22]), .D1(Data_i[3]), .S(Data_o[22]) );
  Multiplexer_AC_W1_28 MUX_ARRAY_23__MUX_ARRAY12_rotate_mux ( .ctrl(n5), .D0(
        Data_i[23]), .D1(Data_i[2]), .S(Data_o[23]) );
  Multiplexer_AC_W1_27 MUX_ARRAY_24__MUX_ARRAY12_rotate_mux ( .ctrl(n6), .D0(
        Data_i[24]), .D1(Data_i[1]), .S(Data_o[24]) );
  Multiplexer_AC_W1_26 MUX_ARRAY_25__MUX_ARRAY12_rotate_mux ( .ctrl(n6), .D0(
        Data_i[25]), .D1(Data_i[0]), .S(Data_o[25]) );
  CLKBUFX2TS U1 ( .A(n6), .Y(n2) );
  CLKBUFX2TS U2 ( .A(n5), .Y(n3) );
  CLKBUFX2TS U3 ( .A(n5), .Y(n4) );
  CLKBUFX2TS U4 ( .A(n6), .Y(n1) );
  CLKBUFX2TS U5 ( .A(select_i), .Y(n6) );
  CLKBUFX2TS U6 ( .A(select_i), .Y(n5) );
endmodule


module shift_mux_array_SWR26_LEVEL0 ( Data_i, select_i, bit_shift_i, Data_o );
  input [25:0] Data_i;
  output [25:0] Data_o;
  input select_i, bit_shift_i;
  wire   n1, n2, n3, n4, n5, n6;

  CLKBUFX2TS U1 ( .A(select_i), .Y(n5) );
  INVX2TS U2 ( .A(n5), .Y(n2) );
  INVX2TS U3 ( .A(n5), .Y(n3) );
  INVX2TS U4 ( .A(n5), .Y(n4) );
  AO22X1TS U5 ( .A0(n6), .A1(Data_i[5]), .B0(n4), .B1(Data_i[4]), .Y(Data_o[4]) );
  AO22X1TS U6 ( .A0(n6), .A1(Data_i[6]), .B0(n4), .B1(Data_i[5]), .Y(Data_o[5]) );
  AO22X1TS U7 ( .A0(n6), .A1(Data_i[7]), .B0(n4), .B1(Data_i[6]), .Y(Data_o[6]) );
  AO22X1TS U8 ( .A0(n6), .A1(Data_i[8]), .B0(n4), .B1(Data_i[7]), .Y(Data_o[7]) );
  AO22X1TS U9 ( .A0(n6), .A1(Data_i[9]), .B0(n4), .B1(Data_i[8]), .Y(Data_o[8]) );
  AO22X1TS U10 ( .A0(n2), .A1(Data_i[22]), .B0(n5), .B1(Data_i[23]), .Y(
        Data_o[22]) );
  AO22X1TS U11 ( .A0(n2), .A1(Data_i[23]), .B0(select_i), .B1(Data_i[24]), .Y(
        Data_o[23]) );
  AO22X1TS U12 ( .A0(n2), .A1(Data_i[24]), .B0(select_i), .B1(Data_i[25]), .Y(
        Data_o[24]) );
  AO22X1TS U13 ( .A0(n3), .A1(Data_i[9]), .B0(Data_i[10]), .B1(n6), .Y(
        Data_o[9]) );
  AO22X1TS U14 ( .A0(n3), .A1(Data_i[12]), .B0(n1), .B1(Data_i[13]), .Y(
        Data_o[12]) );
  AO22X1TS U15 ( .A0(n3), .A1(Data_i[13]), .B0(n1), .B1(Data_i[14]), .Y(
        Data_o[13]) );
  AO22X1TS U16 ( .A0(n2), .A1(Data_i[18]), .B0(n1), .B1(Data_i[19]), .Y(
        Data_o[18]) );
  AO22X1TS U17 ( .A0(n2), .A1(Data_i[20]), .B0(n1), .B1(Data_i[21]), .Y(
        Data_o[20]) );
  AO22X1TS U18 ( .A0(n3), .A1(Data_i[16]), .B0(n1), .B1(Data_i[17]), .Y(
        Data_o[16]) );
  AO22X1TS U19 ( .A0(n3), .A1(Data_i[14]), .B0(n1), .B1(Data_i[15]), .Y(
        Data_o[14]) );
  AO22X1TS U20 ( .A0(n2), .A1(Data_i[19]), .B0(n1), .B1(Data_i[20]), .Y(
        Data_o[19]) );
  AO22X1TS U21 ( .A0(n2), .A1(Data_i[21]), .B0(n5), .B1(Data_i[22]), .Y(
        Data_o[21]) );
  AO22X1TS U22 ( .A0(n2), .A1(Data_i[17]), .B0(n1), .B1(Data_i[18]), .Y(
        Data_o[17]) );
  AO22X1TS U23 ( .A0(n2), .A1(Data_i[15]), .B0(n1), .B1(Data_i[16]), .Y(
        Data_o[15]) );
  AO22X1TS U24 ( .A0(n6), .A1(Data_i[3]), .B0(n4), .B1(Data_i[2]), .Y(
        Data_o[2]) );
  AO22X1TS U25 ( .A0(n6), .A1(Data_i[4]), .B0(n3), .B1(Data_i[3]), .Y(
        Data_o[3]) );
  AO22X1TS U26 ( .A0(n3), .A1(Data_i[11]), .B0(n1), .B1(Data_i[12]), .Y(
        Data_o[11]) );
  AO22X1TS U27 ( .A0(n3), .A1(Data_i[10]), .B0(n5), .B1(Data_i[11]), .Y(
        Data_o[10]) );
  CLKBUFX2TS U28 ( .A(select_i), .Y(n6) );
  AO22X1TS U29 ( .A0(n2), .A1(Data_i[25]), .B0(bit_shift_i), .B1(n6), .Y(
        Data_o[25]) );
  CLKBUFX2TS U30 ( .A(select_i), .Y(n1) );
  AO22X1TS U31 ( .A0(n6), .A1(Data_i[2]), .B0(n3), .B1(Data_i[1]), .Y(
        Data_o[1]) );
  AO22X1TS U32 ( .A0(n5), .A1(Data_i[1]), .B0(Data_i[0]), .B1(n3), .Y(
        Data_o[0]) );
endmodule


module shift_mux_array_SWR26_LEVEL1 ( Data_i, select_i, bit_shift_i, Data_o );
  input [25:0] Data_i;
  output [25:0] Data_o;
  input select_i, bit_shift_i;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29;

  CLKBUFX2TS U1 ( .A(n1), .Y(n6) );
  CLKBUFX2TS U2 ( .A(n1), .Y(n5) );
  OAI22X1TS U3 ( .A0(n3), .A1(n17), .B0(n6), .B1(n21), .Y(Data_o[16]) );
  OAI22X1TS U4 ( .A0(n3), .A1(n15), .B0(n6), .B1(n19), .Y(Data_o[17]) );
  OAI22X1TS U5 ( .A0(n3), .A1(n13), .B0(n6), .B1(n17), .Y(Data_o[18]) );
  OAI22X1TS U6 ( .A0(n3), .A1(n11), .B0(n6), .B1(n15), .Y(Data_o[19]) );
  OAI22X1TS U7 ( .A0(n2), .A1(n10), .B0(n5), .B1(n13), .Y(Data_o[20]) );
  OAI22X1TS U8 ( .A0(n2), .A1(n9), .B0(n5), .B1(n11), .Y(Data_o[21]) );
  OAI22X1TS U9 ( .A0(n3), .A1(n23), .B0(n6), .B1(n27), .Y(Data_o[13]) );
  OAI22X1TS U10 ( .A0(n2), .A1(n20), .B0(n6), .B1(n16), .Y(Data_o[6]) );
  OAI22X1TS U11 ( .A0(n2), .A1(n22), .B0(n5), .B1(n18), .Y(Data_o[7]) );
  OAI22X1TS U12 ( .A0(n3), .A1(n27), .B0(n6), .B1(n26), .Y(Data_o[11]) );
  OAI22X1TS U13 ( .A0(n3), .A1(n25), .B0(n6), .B1(n28), .Y(Data_o[12]) );
  OAI22X1TS U14 ( .A0(n3), .A1(n21), .B0(n6), .B1(n25), .Y(Data_o[14]) );
  OAI22X1TS U15 ( .A0(n3), .A1(n19), .B0(n6), .B1(n23), .Y(Data_o[15]) );
  OAI22X1TS U16 ( .A0(select_i), .A1(n20), .B0(n4), .B1(n24), .Y(Data_o[8]) );
  OAI22X1TS U17 ( .A0(n5), .A1(n22), .B0(n26), .B1(n4), .Y(Data_o[9]) );
  OAI22X1TS U18 ( .A0(n3), .A1(n28), .B0(select_i), .B1(n24), .Y(Data_o[10])
         );
  OAI22X1TS U19 ( .A0(n2), .A1(n7), .B0(n5), .B1(n10), .Y(Data_o[22]) );
  OAI22X1TS U20 ( .A0(n2), .A1(n16), .B0(n5), .B1(n12), .Y(Data_o[4]) );
  INVX2TS U21 ( .A(Data_i[4]), .Y(n12) );
  OAI22X1TS U22 ( .A0(n2), .A1(n18), .B0(n5), .B1(n14), .Y(Data_o[5]) );
  INVX2TS U23 ( .A(Data_i[5]), .Y(n14) );
  INVX2TS U24 ( .A(select_i), .Y(n2) );
  INVX2TS U25 ( .A(select_i), .Y(n3) );
  INVX2TS U26 ( .A(n1), .Y(n4) );
  INVX2TS U27 ( .A(Data_i[6]), .Y(n16) );
  INVX2TS U28 ( .A(Data_i[7]), .Y(n18) );
  INVX2TS U29 ( .A(Data_i[8]), .Y(n20) );
  INVX2TS U30 ( .A(Data_i[22]), .Y(n10) );
  INVX2TS U31 ( .A(Data_i[23]), .Y(n9) );
  INVX2TS U32 ( .A(Data_i[24]), .Y(n7) );
  INVX2TS U33 ( .A(Data_i[9]), .Y(n22) );
  INVX2TS U34 ( .A(Data_i[12]), .Y(n28) );
  INVX2TS U35 ( .A(Data_i[13]), .Y(n27) );
  INVX2TS U36 ( .A(Data_i[18]), .Y(n17) );
  INVX2TS U37 ( .A(Data_i[20]), .Y(n13) );
  INVX2TS U38 ( .A(Data_i[16]), .Y(n21) );
  INVX2TS U39 ( .A(Data_i[14]), .Y(n25) );
  INVX2TS U40 ( .A(Data_i[19]), .Y(n15) );
  INVX2TS U41 ( .A(Data_i[21]), .Y(n11) );
  INVX2TS U42 ( .A(Data_i[17]), .Y(n19) );
  INVX2TS U43 ( .A(Data_i[15]), .Y(n23) );
  OAI22X1TS U44 ( .A0(n2), .A1(n8), .B0(n5), .B1(n9), .Y(Data_o[23]) );
  OAI22X1TS U45 ( .A0(n2), .A1(n29), .B0(n5), .B1(n7), .Y(Data_o[24]) );
  OAI22X1TS U46 ( .A0(n2), .A1(n29), .B0(n5), .B1(n8), .Y(Data_o[25]) );
  INVX2TS U47 ( .A(Data_i[11]), .Y(n26) );
  INVX2TS U48 ( .A(Data_i[10]), .Y(n24) );
  INVX2TS U49 ( .A(Data_i[25]), .Y(n8) );
  INVX2TS U50 ( .A(bit_shift_i), .Y(n29) );
  CLKBUFX2TS U51 ( .A(select_i), .Y(n1) );
  AO22X1TS U52 ( .A0(n1), .A1(Data_i[3]), .B0(Data_i[1]), .B1(n4), .Y(
        Data_o[1]) );
  AO22X1TS U53 ( .A0(select_i), .A1(Data_i[4]), .B0(n4), .B1(Data_i[2]), .Y(
        Data_o[2]) );
  AO22X1TS U54 ( .A0(select_i), .A1(Data_i[5]), .B0(n4), .B1(Data_i[3]), .Y(
        Data_o[3]) );
  AO22X1TS U55 ( .A0(select_i), .A1(Data_i[2]), .B0(Data_i[0]), .B1(n4), .Y(
        Data_o[0]) );
endmodule


module shift_mux_array_SWR26_LEVEL2 ( Data_i, select_i, bit_shift_i, Data_o );
  input [25:0] Data_i;
  output [25:0] Data_o;
  input select_i, bit_shift_i;
  wire   n12, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n13, n14, n15, n16
;

  INVX2TS U1 ( .A(Data_i[20]), .Y(n11) );
  INVX2TS U2 ( .A(Data_i[21]), .Y(n10) );
  INVX2TS U3 ( .A(Data_i[22]), .Y(n7) );
  INVX2TS U4 ( .A(Data_i[23]), .Y(n9) );
  INVX2TS U5 ( .A(Data_i[24]), .Y(n6) );
  INVX2TS U6 ( .A(Data_i[25]), .Y(n8) );
  INVX2TS U7 ( .A(n3), .Y(n1) );
  INVX2TS U8 ( .A(n4), .Y(n2) );
  CLKBUFX2TS U9 ( .A(n5), .Y(n3) );
  NAND2X1TS U10 ( .A(bit_shift_i), .B(n1), .Y(n12) );
  CLKBUFX2TS U11 ( .A(n5), .Y(n4) );
  OAI22X1TS U12 ( .A0(n5), .A1(n11), .B0(n1), .B1(n16), .Y(Data_o[16]) );
  INVX2TS U13 ( .A(Data_i[16]), .Y(n16) );
  OAI22X1TS U14 ( .A0(n3), .A1(n10), .B0(n1), .B1(n15), .Y(Data_o[17]) );
  INVX2TS U15 ( .A(Data_i[17]), .Y(n15) );
  OAI22X1TS U16 ( .A0(n3), .A1(n7), .B0(n1), .B1(n14), .Y(Data_o[18]) );
  INVX2TS U17 ( .A(Data_i[18]), .Y(n14) );
  OAI22X1TS U18 ( .A0(n3), .A1(n9), .B0(n1), .B1(n13), .Y(Data_o[19]) );
  INVX2TS U19 ( .A(Data_i[19]), .Y(n13) );
  OAI22X1TS U20 ( .A0(n3), .A1(n6), .B0(n1), .B1(n11), .Y(Data_o[20]) );
  OAI22X1TS U21 ( .A0(n4), .A1(n8), .B0(n1), .B1(n10), .Y(Data_o[21]) );
  AO22X1TS U22 ( .A0(select_i), .A1(Data_i[14]), .B0(n5), .B1(Data_i[10]), .Y(
        Data_o[10]) );
  AO22X1TS U23 ( .A0(select_i), .A1(Data_i[15]), .B0(n5), .B1(Data_i[11]), .Y(
        Data_o[11]) );
  AO22X1TS U24 ( .A0(select_i), .A1(Data_i[16]), .B0(n5), .B1(Data_i[12]), .Y(
        Data_o[12]) );
  AO22X1TS U25 ( .A0(select_i), .A1(Data_i[17]), .B0(n5), .B1(Data_i[13]), .Y(
        Data_o[13]) );
  AO22X1TS U26 ( .A0(select_i), .A1(Data_i[18]), .B0(n5), .B1(Data_i[14]), .Y(
        Data_o[14]) );
  AO22X1TS U27 ( .A0(select_i), .A1(Data_i[19]), .B0(n5), .B1(Data_i[15]), .Y(
        Data_o[15]) );
  OAI21X1TS U28 ( .A0(n1), .A1(n7), .B0(n12), .Y(Data_o[22]) );
  OAI21X1TS U29 ( .A0(n2), .A1(n9), .B0(n12), .Y(Data_o[23]) );
  OAI21X1TS U30 ( .A0(n1), .A1(n6), .B0(n12), .Y(Data_o[24]) );
  OAI21X1TS U31 ( .A0(n1), .A1(n8), .B0(n12), .Y(Data_o[25]) );
  AO22X1TS U32 ( .A0(n2), .A1(Data_i[5]), .B0(Data_i[1]), .B1(n4), .Y(
        Data_o[1]) );
  AO22X1TS U33 ( .A0(n2), .A1(Data_i[6]), .B0(Data_i[2]), .B1(n3), .Y(
        Data_o[2]) );
  AO22X1TS U34 ( .A0(n2), .A1(Data_i[7]), .B0(Data_i[3]), .B1(n4), .Y(
        Data_o[3]) );
  AO22X1TS U35 ( .A0(n2), .A1(Data_i[8]), .B0(n4), .B1(Data_i[4]), .Y(
        Data_o[4]) );
  AO22X1TS U36 ( .A0(n2), .A1(Data_i[9]), .B0(n4), .B1(Data_i[5]), .Y(
        Data_o[5]) );
  AO22X1TS U37 ( .A0(n2), .A1(Data_i[10]), .B0(n4), .B1(Data_i[6]), .Y(
        Data_o[6]) );
  AO22X1TS U38 ( .A0(n2), .A1(Data_i[11]), .B0(n4), .B1(Data_i[7]), .Y(
        Data_o[7]) );
  AO22X1TS U39 ( .A0(n2), .A1(Data_i[12]), .B0(n4), .B1(Data_i[8]), .Y(
        Data_o[8]) );
  AO22X1TS U40 ( .A0(Data_i[13]), .A1(select_i), .B0(n4), .B1(Data_i[9]), .Y(
        Data_o[9]) );
  AO22X1TS U41 ( .A0(n2), .A1(Data_i[4]), .B0(Data_i[0]), .B1(n5), .Y(
        Data_o[0]) );
  INVX2TS U42 ( .A(select_i), .Y(n5) );
endmodule


module RegisterAdd_W26_0 ( clk, rst, load, D, Q );
  input [25:0] D;
  output [25:0] Q;
  input clk, rst, load;
  wire   n52, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66,
         n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80,
         n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94,
         n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106,
         n107;

  DFFRX2TS Q_reg_7_ ( .D(n74), .CK(clk), .RN(n52), .Q(Q[7]), .QN(n100) );
  DFFRX2TS Q_reg_6_ ( .D(n75), .CK(clk), .RN(n52), .Q(Q[6]), .QN(n101) );
  DFFRX2TS Q_reg_5_ ( .D(n76), .CK(clk), .RN(n52), .Q(Q[5]), .QN(n102) );
  DFFRX2TS Q_reg_4_ ( .D(n77), .CK(clk), .RN(n52), .Q(Q[4]), .QN(n103) );
  DFFRX2TS Q_reg_3_ ( .D(n78), .CK(clk), .RN(n52), .Q(Q[3]), .QN(n104) );
  DFFRX2TS Q_reg_2_ ( .D(n79), .CK(clk), .RN(n52), .Q(Q[2]), .QN(n105) );
  DFFRX2TS Q_reg_1_ ( .D(n80), .CK(clk), .RN(n52), .Q(Q[1]), .QN(n106) );
  DFFRX2TS Q_reg_0_ ( .D(n81), .CK(clk), .RN(n52), .Q(Q[0]), .QN(n107) );
  DFFRX2TS Q_reg_25_ ( .D(n56), .CK(clk), .RN(n55), .Q(Q[25]), .QN(n82) );
  DFFRX2TS Q_reg_24_ ( .D(n57), .CK(clk), .RN(n55), .Q(Q[24]), .QN(n83) );
  DFFRX2TS Q_reg_23_ ( .D(n58), .CK(clk), .RN(n55), .Q(Q[23]), .QN(n84) );
  DFFRX2TS Q_reg_22_ ( .D(n59), .CK(clk), .RN(n55), .Q(Q[22]), .QN(n85) );
  DFFRX2TS Q_reg_21_ ( .D(n60), .CK(clk), .RN(n55), .Q(Q[21]), .QN(n86) );
  DFFRX2TS Q_reg_20_ ( .D(n61), .CK(clk), .RN(n55), .Q(Q[20]), .QN(n87) );
  DFFRX2TS Q_reg_19_ ( .D(n62), .CK(clk), .RN(n54), .Q(Q[19]), .QN(n88) );
  DFFRX2TS Q_reg_18_ ( .D(n63), .CK(clk), .RN(n54), .Q(Q[18]), .QN(n89) );
  DFFRX2TS Q_reg_16_ ( .D(n65), .CK(clk), .RN(n54), .Q(Q[16]), .QN(n91) );
  DFFRX2TS Q_reg_15_ ( .D(n66), .CK(clk), .RN(n54), .Q(Q[15]), .QN(n92) );
  DFFRX2TS Q_reg_14_ ( .D(n67), .CK(clk), .RN(n54), .Q(Q[14]), .QN(n93) );
  DFFRX2TS Q_reg_13_ ( .D(n68), .CK(clk), .RN(n54), .Q(Q[13]), .QN(n94) );
  DFFRX2TS Q_reg_12_ ( .D(n69), .CK(clk), .RN(n54), .Q(Q[12]), .QN(n95) );
  DFFRX2TS Q_reg_11_ ( .D(n70), .CK(clk), .RN(n54), .Q(Q[11]), .QN(n96) );
  DFFRX2TS Q_reg_10_ ( .D(n71), .CK(clk), .RN(n54), .Q(Q[10]), .QN(n97) );
  DFFRX2TS Q_reg_9_ ( .D(n72), .CK(clk), .RN(n52), .Q(Q[9]), .QN(n98) );
  DFFRX2TS Q_reg_8_ ( .D(n73), .CK(clk), .RN(n52), .Q(Q[8]), .QN(n99) );
  DFFRX2TS Q_reg_17_ ( .D(n64), .CK(clk), .RN(n54), .Q(Q[17]), .QN(n90) );
  CLKBUFX2TS U2 ( .A(n55), .Y(n52) );
  CLKBUFX2TS U3 ( .A(n55), .Y(n54) );
  OAI2BB2XLTS U4 ( .B0(n91), .B1(load), .A0N(D[16]), .A1N(load), .Y(n65) );
  OAI2BB2XLTS U5 ( .B0(n90), .B1(load), .A0N(D[17]), .A1N(load), .Y(n64) );
  OAI2BB2XLTS U6 ( .B0(n89), .B1(load), .A0N(D[18]), .A1N(load), .Y(n63) );
  OAI2BB2XLTS U7 ( .B0(n88), .B1(load), .A0N(D[19]), .A1N(load), .Y(n62) );
  OAI2BB2XLTS U8 ( .B0(n87), .B1(load), .A0N(D[20]), .A1N(load), .Y(n61) );
  OAI2BB2XLTS U9 ( .B0(n86), .B1(load), .A0N(D[21]), .A1N(load), .Y(n60) );
  OAI2BB2XLTS U10 ( .B0(n97), .B1(load), .A0N(D[10]), .A1N(load), .Y(n71) );
  OAI2BB2XLTS U11 ( .B0(n96), .B1(load), .A0N(D[11]), .A1N(load), .Y(n70) );
  OAI2BB2XLTS U12 ( .B0(n95), .B1(load), .A0N(D[12]), .A1N(load), .Y(n69) );
  OAI2BB2XLTS U13 ( .B0(n94), .B1(load), .A0N(D[13]), .A1N(load), .Y(n68) );
  OAI2BB2XLTS U14 ( .B0(n93), .B1(load), .A0N(D[14]), .A1N(load), .Y(n67) );
  OAI2BB2XLTS U15 ( .B0(n92), .B1(load), .A0N(D[15]), .A1N(load), .Y(n66) );
  OAI2BB2XLTS U16 ( .B0(n85), .B1(load), .A0N(D[22]), .A1N(load), .Y(n59) );
  OAI2BB2XLTS U17 ( .B0(n84), .B1(load), .A0N(D[23]), .A1N(load), .Y(n58) );
  OAI2BB2XLTS U18 ( .B0(n83), .B1(load), .A0N(D[24]), .A1N(load), .Y(n57) );
  OAI2BB2XLTS U19 ( .B0(n82), .B1(load), .A0N(D[25]), .A1N(load), .Y(n56) );
  OAI2BB2XLTS U20 ( .B0(n106), .B1(load), .A0N(D[1]), .A1N(load), .Y(n80) );
  OAI2BB2XLTS U21 ( .B0(n105), .B1(load), .A0N(D[2]), .A1N(load), .Y(n79) );
  OAI2BB2XLTS U22 ( .B0(n104), .B1(load), .A0N(D[3]), .A1N(load), .Y(n78) );
  OAI2BB2XLTS U23 ( .B0(n103), .B1(load), .A0N(D[4]), .A1N(load), .Y(n77) );
  OAI2BB2XLTS U24 ( .B0(n102), .B1(load), .A0N(D[5]), .A1N(load), .Y(n76) );
  OAI2BB2XLTS U25 ( .B0(n101), .B1(load), .A0N(D[6]), .A1N(load), .Y(n75) );
  OAI2BB2XLTS U26 ( .B0(n100), .B1(load), .A0N(D[7]), .A1N(load), .Y(n74) );
  OAI2BB2XLTS U27 ( .B0(n99), .B1(load), .A0N(D[8]), .A1N(load), .Y(n73) );
  OAI2BB2XLTS U28 ( .B0(n98), .B1(load), .A0N(D[9]), .A1N(load), .Y(n72) );
  OAI2BB2XLTS U29 ( .B0(n107), .B1(load), .A0N(load), .A1N(D[0]), .Y(n81) );
  INVX2TS U30 ( .A(rst), .Y(n55) );
endmodule


module shift_mux_array_SWR26_LEVEL3 ( Data_i, select_i, bit_shift_i, Data_o );
  input [25:0] Data_i;
  output [25:0] Data_o;
  input select_i, bit_shift_i;
  wire   n2, n1, n3, n4, n5, n6;

  CLKBUFX2TS U1 ( .A(select_i), .Y(n1) );
  CLKBUFX2TS U2 ( .A(n6), .Y(n4) );
  CLKBUFX2TS U3 ( .A(n6), .Y(n5) );
  NAND2X1TS U4 ( .A(bit_shift_i), .B(n3), .Y(n2) );
  INVX2TS U5 ( .A(n3), .Y(n6) );
  OAI2BB1X1TS U6 ( .A0N(n6), .A1N(Data_i[25]), .B0(n2), .Y(Data_o[25]) );
  OAI2BB1X1TS U7 ( .A0N(n5), .A1N(Data_i[20]), .B0(n2), .Y(Data_o[20]) );
  OAI2BB1X1TS U8 ( .A0N(n6), .A1N(Data_i[21]), .B0(n2), .Y(Data_o[21]) );
  OAI2BB1X1TS U9 ( .A0N(n6), .A1N(Data_i[19]), .B0(n2), .Y(Data_o[19]) );
  OAI2BB1X1TS U10 ( .A0N(n5), .A1N(Data_i[22]), .B0(n2), .Y(Data_o[22]) );
  OAI2BB1X1TS U11 ( .A0N(n6), .A1N(Data_i[18]), .B0(n2), .Y(Data_o[18]) );
  OAI2BB1X1TS U12 ( .A0N(n6), .A1N(Data_i[23]), .B0(n2), .Y(Data_o[23]) );
  OAI2BB1X1TS U13 ( .A0N(n6), .A1N(Data_i[24]), .B0(n2), .Y(Data_o[24]) );
  AO22X1TS U14 ( .A0(Data_i[17]), .A1(n1), .B0(n5), .B1(Data_i[9]), .Y(
        Data_o[9]) );
  AO22X1TS U15 ( .A0(n3), .A1(Data_i[16]), .B0(n4), .B1(Data_i[8]), .Y(
        Data_o[8]) );
  AO22X1TS U16 ( .A0(n1), .A1(Data_i[15]), .B0(Data_i[7]), .B1(n4), .Y(
        Data_o[7]) );
  AO22X1TS U17 ( .A0(n3), .A1(Data_i[14]), .B0(Data_i[6]), .B1(n4), .Y(
        Data_o[6]) );
  AO22X1TS U18 ( .A0(n1), .A1(Data_i[13]), .B0(Data_i[5]), .B1(n4), .Y(
        Data_o[5]) );
  AO22X1TS U19 ( .A0(n3), .A1(Data_i[12]), .B0(Data_i[4]), .B1(n4), .Y(
        Data_o[4]) );
  AO22X1TS U20 ( .A0(n1), .A1(Data_i[11]), .B0(Data_i[3]), .B1(n4), .Y(
        Data_o[3]) );
  AO22X1TS U21 ( .A0(n3), .A1(Data_i[10]), .B0(Data_i[2]), .B1(n4), .Y(
        Data_o[2]) );
  CLKBUFX2TS U22 ( .A(select_i), .Y(n3) );
  AO22X1TS U23 ( .A0(n3), .A1(Data_i[20]), .B0(n5), .B1(Data_i[12]), .Y(
        Data_o[12]) );
  AO22X1TS U24 ( .A0(n1), .A1(Data_i[21]), .B0(n5), .B1(Data_i[13]), .Y(
        Data_o[13]) );
  AO22X1TS U25 ( .A0(n3), .A1(Data_i[19]), .B0(n5), .B1(Data_i[11]), .Y(
        Data_o[11]) );
  AO22X1TS U26 ( .A0(n1), .A1(Data_i[22]), .B0(n5), .B1(Data_i[14]), .Y(
        Data_o[14]) );
  AO22X1TS U27 ( .A0(n3), .A1(Data_i[18]), .B0(n4), .B1(Data_i[10]), .Y(
        Data_o[10]) );
  AO22X1TS U28 ( .A0(n1), .A1(Data_i[23]), .B0(n5), .B1(Data_i[15]), .Y(
        Data_o[15]) );
  AO22X1TS U29 ( .A0(n1), .A1(Data_i[25]), .B0(n5), .B1(Data_i[17]), .Y(
        Data_o[17]) );
  AO22X1TS U30 ( .A0(n3), .A1(Data_i[24]), .B0(n5), .B1(Data_i[16]), .Y(
        Data_o[16]) );
  AO22X1TS U31 ( .A0(n1), .A1(Data_i[9]), .B0(Data_i[1]), .B1(n4), .Y(
        Data_o[1]) );
  AO22X1TS U32 ( .A0(n1), .A1(Data_i[8]), .B0(Data_i[0]), .B1(n4), .Y(
        Data_o[0]) );
endmodule


module shift_mux_array_SWR26_LEVEL4 ( Data_i, select_i, bit_shift_i, Data_o );
  input [25:0] Data_i;
  output [25:0] Data_o;
  input select_i, bit_shift_i;
  wire   n2, n1, n3, n4, n5, n6;

  INVX2TS U1 ( .A(n6), .Y(n1) );
  CLKBUFX2TS U2 ( .A(n2), .Y(n3) );
  NAND2X1TS U3 ( .A(bit_shift_i), .B(select_i), .Y(n2) );
  CLKBUFX2TS U4 ( .A(n6), .Y(n4) );
  CLKBUFX2TS U5 ( .A(n6), .Y(n5) );
  OAI2BB1X1TS U6 ( .A0N(n5), .A1N(Data_i[18]), .B0(n2), .Y(Data_o[18]) );
  OAI2BB1X1TS U7 ( .A0N(n5), .A1N(Data_i[19]), .B0(n2), .Y(Data_o[19]) );
  OAI2BB1X1TS U8 ( .A0N(n5), .A1N(Data_i[20]), .B0(n2), .Y(Data_o[20]) );
  OAI2BB1X1TS U9 ( .A0N(n5), .A1N(Data_i[21]), .B0(n2), .Y(Data_o[21]) );
  OAI2BB1X1TS U10 ( .A0N(n5), .A1N(Data_i[22]), .B0(n2), .Y(Data_o[22]) );
  OAI2BB1X1TS U11 ( .A0N(n5), .A1N(Data_i[23]), .B0(n2), .Y(Data_o[23]) );
  OAI2BB1X1TS U12 ( .A0N(n5), .A1N(Data_i[24]), .B0(n2), .Y(Data_o[24]) );
  OAI2BB1X1TS U13 ( .A0N(n5), .A1N(Data_i[25]), .B0(n3), .Y(Data_o[25]) );
  INVX2TS U14 ( .A(select_i), .Y(n6) );
  OAI2BB1X1TS U15 ( .A0N(n5), .A1N(Data_i[16]), .B0(n2), .Y(Data_o[16]) );
  OAI2BB1X1TS U16 ( .A0N(n5), .A1N(Data_i[17]), .B0(n2), .Y(Data_o[17]) );
  AO22X1TS U17 ( .A0(Data_i[25]), .A1(select_i), .B0(Data_i[9]), .B1(n4), .Y(
        Data_o[9]) );
  AO22X1TS U18 ( .A0(select_i), .A1(Data_i[24]), .B0(Data_i[8]), .B1(n4), .Y(
        Data_o[8]) );
  AO22X1TS U19 ( .A0(select_i), .A1(Data_i[23]), .B0(Data_i[7]), .B1(n4), .Y(
        Data_o[7]) );
  AO22X1TS U20 ( .A0(select_i), .A1(Data_i[22]), .B0(Data_i[6]), .B1(n4), .Y(
        Data_o[6]) );
  AO22X1TS U21 ( .A0(select_i), .A1(Data_i[21]), .B0(Data_i[5]), .B1(n4), .Y(
        Data_o[5]) );
  AO22X1TS U22 ( .A0(select_i), .A1(Data_i[20]), .B0(Data_i[4]), .B1(n4), .Y(
        Data_o[4]) );
  AO22X1TS U23 ( .A0(select_i), .A1(Data_i[19]), .B0(Data_i[3]), .B1(n4), .Y(
        Data_o[3]) );
  AO22X1TS U24 ( .A0(n1), .A1(Data_i[18]), .B0(Data_i[2]), .B1(n4), .Y(
        Data_o[2]) );
  OAI2BB1X1TS U25 ( .A0N(Data_i[12]), .A1N(n6), .B0(n3), .Y(Data_o[12]) );
  OAI2BB1X1TS U26 ( .A0N(Data_i[13]), .A1N(n6), .B0(n3), .Y(Data_o[13]) );
  OAI2BB1X1TS U27 ( .A0N(Data_i[11]), .A1N(n6), .B0(n3), .Y(Data_o[11]) );
  OAI2BB1X1TS U28 ( .A0N(Data_i[14]), .A1N(n6), .B0(n3), .Y(Data_o[14]) );
  OAI2BB1X1TS U29 ( .A0N(Data_i[10]), .A1N(n6), .B0(n3), .Y(Data_o[10]) );
  OAI2BB1X1TS U30 ( .A0N(Data_i[15]), .A1N(n6), .B0(n3), .Y(Data_o[15]) );
  AO22X1TS U31 ( .A0(n1), .A1(Data_i[17]), .B0(Data_i[1]), .B1(n4), .Y(
        Data_o[1]) );
  AO22X1TS U32 ( .A0(select_i), .A1(Data_i[16]), .B0(Data_i[0]), .B1(n4), .Y(
        Data_o[0]) );
endmodule


module Multiplexer_AC_W1_25 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_24 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_23 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_22 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_21 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_20 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_19 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_18 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_17 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_16 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_15 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_14 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_13 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_12 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_11 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_10 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_9 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_8 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_7 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_6 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_5 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_4 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_3 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_2 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_1 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Multiplexer_AC_W1_0 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n1), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  INVX2TS U2 ( .A(ctrl), .Y(n1) );
endmodule


module Rotate_Mux_Array_SWR26_0 ( Data_i, select_i, Data_o );
  input [25:0] Data_i;
  output [25:0] Data_o;
  input select_i;
  wire   n1, n2, n3, n4, n5;

  Multiplexer_AC_W1_25 MUX_ARRAY_0__MUX_ARRAY12_rotate_mux ( .ctrl(n5), .D0(
        Data_i[0]), .D1(Data_i[25]), .S(Data_o[0]) );
  Multiplexer_AC_W1_24 MUX_ARRAY_1__MUX_ARRAY12_rotate_mux ( .ctrl(n5), .D0(
        Data_i[1]), .D1(Data_i[24]), .S(Data_o[1]) );
  Multiplexer_AC_W1_23 MUX_ARRAY_2__MUX_ARRAY12_rotate_mux ( .ctrl(n5), .D0(
        Data_i[2]), .D1(Data_i[23]), .S(Data_o[2]) );
  Multiplexer_AC_W1_22 MUX_ARRAY_3__MUX_ARRAY12_rotate_mux ( .ctrl(n5), .D0(
        Data_i[3]), .D1(Data_i[22]), .S(Data_o[3]) );
  Multiplexer_AC_W1_21 MUX_ARRAY_4__MUX_ARRAY12_rotate_mux ( .ctrl(n5), .D0(
        Data_i[4]), .D1(Data_i[21]), .S(Data_o[4]) );
  Multiplexer_AC_W1_20 MUX_ARRAY_5__MUX_ARRAY12_rotate_mux ( .ctrl(n3), .D0(
        Data_i[5]), .D1(Data_i[20]), .S(Data_o[5]) );
  Multiplexer_AC_W1_19 MUX_ARRAY_6__MUX_ARRAY12_rotate_mux ( .ctrl(n4), .D0(
        Data_i[6]), .D1(Data_i[19]), .S(Data_o[6]) );
  Multiplexer_AC_W1_18 MUX_ARRAY_7__MUX_ARRAY12_rotate_mux ( .ctrl(n3), .D0(
        Data_i[7]), .D1(Data_i[18]), .S(Data_o[7]) );
  Multiplexer_AC_W1_17 MUX_ARRAY_8__MUX_ARRAY12_rotate_mux ( .ctrl(n4), .D0(
        Data_i[8]), .D1(Data_i[17]), .S(Data_o[8]) );
  Multiplexer_AC_W1_16 MUX_ARRAY_9__MUX_ARRAY12_rotate_mux ( .ctrl(n4), .D0(
        Data_i[9]), .D1(Data_i[16]), .S(Data_o[9]) );
  Multiplexer_AC_W1_15 MUX_ARRAY_10__MUX_ARRAY12_rotate_mux ( .ctrl(n1), .D0(
        Data_i[10]), .D1(Data_i[15]), .S(Data_o[10]) );
  Multiplexer_AC_W1_14 MUX_ARRAY_11__MUX_ARRAY12_rotate_mux ( .ctrl(n1), .D0(
        Data_i[11]), .D1(Data_i[14]), .S(Data_o[11]) );
  Multiplexer_AC_W1_13 MUX_ARRAY_12__MUX_ARRAY12_rotate_mux ( .ctrl(n1), .D0(
        Data_i[12]), .D1(Data_i[13]), .S(Data_o[12]) );
  Multiplexer_AC_W1_12 MUX_ARRAY_13__MUX_ARRAY12_rotate_mux ( .ctrl(n1), .D0(
        Data_i[13]), .D1(Data_i[12]), .S(Data_o[13]) );
  Multiplexer_AC_W1_11 MUX_ARRAY_14__MUX_ARRAY12_rotate_mux ( .ctrl(n1), .D0(
        Data_i[14]), .D1(Data_i[11]), .S(Data_o[14]) );
  Multiplexer_AC_W1_10 MUX_ARRAY_15__MUX_ARRAY12_rotate_mux ( .ctrl(n2), .D0(
        Data_i[15]), .D1(Data_i[10]), .S(Data_o[15]) );
  Multiplexer_AC_W1_9 MUX_ARRAY_16__MUX_ARRAY12_rotate_mux ( .ctrl(n2), .D0(
        Data_i[16]), .D1(Data_i[9]), .S(Data_o[16]) );
  Multiplexer_AC_W1_8 MUX_ARRAY_17__MUX_ARRAY12_rotate_mux ( .ctrl(n2), .D0(
        Data_i[17]), .D1(Data_i[8]), .S(Data_o[17]) );
  Multiplexer_AC_W1_7 MUX_ARRAY_18__MUX_ARRAY12_rotate_mux ( .ctrl(n2), .D0(
        Data_i[18]), .D1(Data_i[7]), .S(Data_o[18]) );
  Multiplexer_AC_W1_6 MUX_ARRAY_19__MUX_ARRAY12_rotate_mux ( .ctrl(n2), .D0(
        Data_i[19]), .D1(Data_i[6]), .S(Data_o[19]) );
  Multiplexer_AC_W1_5 MUX_ARRAY_20__MUX_ARRAY12_rotate_mux ( .ctrl(select_i), 
        .D0(Data_i[20]), .D1(Data_i[5]), .S(Data_o[20]) );
  Multiplexer_AC_W1_4 MUX_ARRAY_21__MUX_ARRAY12_rotate_mux ( .ctrl(select_i), 
        .D0(Data_i[21]), .D1(Data_i[4]), .S(Data_o[21]) );
  Multiplexer_AC_W1_3 MUX_ARRAY_22__MUX_ARRAY12_rotate_mux ( .ctrl(n4), .D0(
        Data_i[22]), .D1(Data_i[3]), .S(Data_o[22]) );
  Multiplexer_AC_W1_2 MUX_ARRAY_23__MUX_ARRAY12_rotate_mux ( .ctrl(n3), .D0(
        Data_i[23]), .D1(Data_i[2]), .S(Data_o[23]) );
  Multiplexer_AC_W1_1 MUX_ARRAY_24__MUX_ARRAY12_rotate_mux ( .ctrl(n3), .D0(
        Data_i[24]), .D1(Data_i[1]), .S(Data_o[24]) );
  Multiplexer_AC_W1_0 MUX_ARRAY_25__MUX_ARRAY12_rotate_mux ( .ctrl(n3), .D0(
        Data_i[25]), .D1(Data_i[0]), .S(Data_o[25]) );
  CLKBUFX2TS U1 ( .A(n4), .Y(n1) );
  CLKBUFX2TS U2 ( .A(n4), .Y(n2) );
  CLKBUFX2TS U3 ( .A(select_i), .Y(n5) );
  CLKBUFX2TS U4 ( .A(select_i), .Y(n4) );
  CLKBUFX2TS U5 ( .A(select_i), .Y(n3) );
endmodule


module Mux_Array_SWR26_EWR5 ( clk, rst, load_i, Data_i, FSM_left_right_i, 
        Shift_Value_i, bit_shift_i, Data_o );
  input [25:0] Data_i;
  input [4:0] Shift_Value_i;
  output [25:0] Data_o;
  input clk, rst, load_i, FSM_left_right_i, bit_shift_i;

  wire   [181:0] Data_array;

  Rotate_Mux_Array_SWR26_1 first_rotate ( .Data_i(Data_i), .select_i(
        FSM_left_right_i), .Data_o(Data_array[25:0]) );
  shift_mux_array_SWR26_LEVEL0 SHIFT_1LVLS_0__shift_mux_array ( .Data_i(
        Data_array[25:0]), .select_i(Shift_Value_i[0]), .bit_shift_i(
        bit_shift_i), .Data_o(Data_array[51:26]) );
  shift_mux_array_SWR26_LEVEL1 SHIFT_1LVLS_1__shift_mux_array ( .Data_i(
        Data_array[51:26]), .select_i(Shift_Value_i[1]), .bit_shift_i(
        bit_shift_i), .Data_o(Data_array[77:52]) );
  shift_mux_array_SWR26_LEVEL2 SHIFT_1LVLS_2__shift_mux_array ( .Data_i(
        Data_array[77:52]), .select_i(Shift_Value_i[2]), .bit_shift_i(
        bit_shift_i), .Data_o(Data_array[103:78]) );
  RegisterAdd_W26_0 Mid_Reg ( .clk(clk), .rst(rst), .load(1'b1), .D(
        Data_array[103:78]), .Q(Data_array[129:104]) );
  shift_mux_array_SWR26_LEVEL3 SHIFT_2LVLS_3__shift_mux_array ( .Data_i(
        Data_array[129:104]), .select_i(Shift_Value_i[3]), .bit_shift_i(
        bit_shift_i), .Data_o(Data_array[155:130]) );
  shift_mux_array_SWR26_LEVEL4 SHIFT_2LVLS_4__shift_mux_array ( .Data_i(
        Data_array[155:130]), .select_i(Shift_Value_i[4]), .bit_shift_i(
        bit_shift_i), .Data_o(Data_array[181:156]) );
  Rotate_Mux_Array_SWR26_0 last_rotate ( .Data_i(Data_array[181:156]), 
        .select_i(FSM_left_right_i), .Data_o(Data_o) );
endmodule


module RegisterAdd_W26_2 ( clk, rst, load, D, Q );
  input [25:0] D;
  output [25:0] Q;
  input clk, rst, load;
  wire   n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n53, n52, n54, n55, n56, n57, n58,
         n59, n60, n61;

  DFFRX2TS Q_reg_25_ ( .D(n53), .CK(clk), .RN(n61), .Q(Q[25]), .QN(n26) );
  DFFRX2TS Q_reg_24_ ( .D(n51), .CK(clk), .RN(n61), .Q(Q[24]), .QN(n25) );
  DFFRX2TS Q_reg_23_ ( .D(n50), .CK(clk), .RN(n61), .Q(Q[23]), .QN(n24) );
  DFFRX2TS Q_reg_22_ ( .D(n49), .CK(clk), .RN(n61), .Q(Q[22]), .QN(n23) );
  DFFRX2TS Q_reg_21_ ( .D(n48), .CK(clk), .RN(n61), .Q(Q[21]), .QN(n22) );
  DFFRX2TS Q_reg_20_ ( .D(n47), .CK(clk), .RN(n61), .Q(Q[20]), .QN(n21) );
  DFFRX2TS Q_reg_19_ ( .D(n46), .CK(clk), .RN(n55), .Q(Q[19]), .QN(n20) );
  DFFRX2TS Q_reg_18_ ( .D(n45), .CK(clk), .RN(n55), .Q(Q[18]), .QN(n19) );
  DFFRX2TS Q_reg_17_ ( .D(n44), .CK(clk), .RN(n55), .Q(Q[17]), .QN(n18) );
  DFFRX2TS Q_reg_16_ ( .D(n43), .CK(clk), .RN(n55), .Q(Q[16]), .QN(n17) );
  DFFRX2TS Q_reg_15_ ( .D(n42), .CK(clk), .RN(n55), .Q(Q[15]), .QN(n16) );
  DFFRX2TS Q_reg_14_ ( .D(n41), .CK(clk), .RN(n55), .Q(Q[14]), .QN(n15) );
  DFFRX2TS Q_reg_13_ ( .D(n40), .CK(clk), .RN(n55), .Q(Q[13]), .QN(n14) );
  DFFRX2TS Q_reg_12_ ( .D(n39), .CK(clk), .RN(n55), .Q(Q[12]), .QN(n13) );
  DFFRX2TS Q_reg_11_ ( .D(n38), .CK(clk), .RN(n55), .Q(Q[11]), .QN(n12) );
  DFFRX2TS Q_reg_9_ ( .D(n36), .CK(clk), .RN(n54), .Q(Q[9]), .QN(n10) );
  DFFRX2TS Q_reg_10_ ( .D(n37), .CK(clk), .RN(n55), .Q(Q[10]), .QN(n11) );
  DFFRX2TS Q_reg_7_ ( .D(n34), .CK(clk), .RN(n54), .Q(Q[7]), .QN(n8) );
  DFFRX2TS Q_reg_8_ ( .D(n35), .CK(clk), .RN(n54), .Q(Q[8]), .QN(n9) );
  DFFRX2TS Q_reg_6_ ( .D(n33), .CK(clk), .RN(n54), .Q(Q[6]), .QN(n7) );
  DFFRX4TS Q_reg_1_ ( .D(n28), .CK(clk), .RN(n54), .Q(Q[1]), .QN(n2) );
  DFFRX2TS Q_reg_5_ ( .D(n32), .CK(clk), .RN(n54), .Q(Q[5]), .QN(n6) );
  DFFRX2TS Q_reg_4_ ( .D(n31), .CK(clk), .RN(n54), .Q(Q[4]), .QN(n5) );
  DFFRX2TS Q_reg_3_ ( .D(n30), .CK(clk), .RN(n54), .Q(Q[3]), .QN(n4) );
  DFFRX2TS Q_reg_2_ ( .D(n29), .CK(clk), .RN(n54), .Q(Q[2]), .QN(n3) );
  DFFRHQX2TS Q_reg_0_ ( .D(n27), .CK(clk), .RN(n54), .Q(Q[0]) );
  INVXLTS U2 ( .A(Q[0]), .Y(n52) );
  CLKBUFX2TS U3 ( .A(n60), .Y(n56) );
  CLKBUFX2TS U4 ( .A(n60), .Y(n57) );
  CLKBUFX2TS U5 ( .A(n59), .Y(n58) );
  CLKBUFX2TS U6 ( .A(load), .Y(n60) );
  CLKBUFX2TS U7 ( .A(load), .Y(n59) );
  CLKBUFX2TS U8 ( .A(n61), .Y(n54) );
  CLKBUFX2TS U9 ( .A(n61), .Y(n55) );
  OAI2BB2XLTS U10 ( .B0(n52), .B1(n56), .A0N(n59), .A1N(D[0]), .Y(n27) );
  OAI2BB2XLTS U11 ( .B0(n2), .B1(n56), .A0N(D[1]), .A1N(n58), .Y(n28) );
  OAI2BB2XLTS U12 ( .B0(n3), .B1(n56), .A0N(D[2]), .A1N(n58), .Y(n29) );
  OAI2BB2XLTS U13 ( .B0(n4), .B1(n56), .A0N(D[3]), .A1N(n58), .Y(n30) );
  OAI2BB2XLTS U14 ( .B0(n5), .B1(n56), .A0N(D[4]), .A1N(n58), .Y(n31) );
  OAI2BB2XLTS U15 ( .B0(n6), .B1(n56), .A0N(D[5]), .A1N(n57), .Y(n32) );
  OAI2BB2XLTS U16 ( .B0(n7), .B1(n59), .A0N(D[6]), .A1N(n58), .Y(n33) );
  OAI2BB2XLTS U17 ( .B0(n8), .B1(n59), .A0N(D[7]), .A1N(n57), .Y(n34) );
  OAI2BB2XLTS U18 ( .B0(n9), .B1(n60), .A0N(D[8]), .A1N(n57), .Y(n35) );
  OAI2BB2XLTS U19 ( .B0(n10), .B1(n59), .A0N(D[9]), .A1N(n56), .Y(n36) );
  OAI2BB2XLTS U20 ( .B0(n17), .B1(n60), .A0N(D[16]), .A1N(n57), .Y(n43) );
  OAI2BB2XLTS U21 ( .B0(n18), .B1(n59), .A0N(D[17]), .A1N(n57), .Y(n44) );
  OAI2BB2XLTS U22 ( .B0(n19), .B1(n60), .A0N(D[18]), .A1N(n57), .Y(n45) );
  OAI2BB2XLTS U23 ( .B0(n20), .B1(n59), .A0N(D[19]), .A1N(n57), .Y(n46) );
  OAI2BB2XLTS U24 ( .B0(n21), .B1(load), .A0N(D[20]), .A1N(n58), .Y(n47) );
  OAI2BB2XLTS U25 ( .B0(n22), .B1(load), .A0N(D[21]), .A1N(n58), .Y(n48) );
  OAI2BB2XLTS U26 ( .B0(n23), .B1(load), .A0N(D[22]), .A1N(n58), .Y(n49) );
  OAI2BB2XLTS U27 ( .B0(n24), .B1(n60), .A0N(D[23]), .A1N(n58), .Y(n50) );
  OAI2BB2XLTS U28 ( .B0(n11), .B1(n59), .A0N(D[10]), .A1N(n56), .Y(n37) );
  OAI2BB2XLTS U29 ( .B0(n12), .B1(n59), .A0N(D[11]), .A1N(n56), .Y(n38) );
  OAI2BB2XLTS U30 ( .B0(n13), .B1(n60), .A0N(D[12]), .A1N(n56), .Y(n39) );
  OAI2BB2XLTS U31 ( .B0(n14), .B1(load), .A0N(D[13]), .A1N(n57), .Y(n40) );
  OAI2BB2XLTS U32 ( .B0(n15), .B1(load), .A0N(D[14]), .A1N(n57), .Y(n41) );
  OAI2BB2XLTS U33 ( .B0(n16), .B1(load), .A0N(D[15]), .A1N(n57), .Y(n42) );
  OAI2BB2XLTS U34 ( .B0(n25), .B1(n59), .A0N(D[24]), .A1N(n58), .Y(n51) );
  OAI2BB2XLTS U35 ( .B0(n26), .B1(load), .A0N(D[25]), .A1N(n60), .Y(n53) );
  INVX2TS U36 ( .A(rst), .Y(n61) );
endmodule


module Barrel_Shifter_SWR26_EWR5 ( clk, rst, load_i, Shift_Value_i, 
        Shift_Data_i, Left_Right_i, Bit_Shift_i, N_mant_o );
  input [4:0] Shift_Value_i;
  input [25:0] Shift_Data_i;
  output [25:0] N_mant_o;
  input clk, rst, load_i, Left_Right_i, Bit_Shift_i;

  wire   [25:0] Data_Reg;

  Mux_Array_SWR26_EWR5 Mux_Array ( .clk(clk), .rst(rst), .load_i(load_i), 
        .Data_i(Shift_Data_i), .FSM_left_right_i(Left_Right_i), 
        .Shift_Value_i(Shift_Value_i), .bit_shift_i(Bit_Shift_i), .Data_o(
        Data_Reg) );
  RegisterAdd_W26_2 Output_Reg ( .clk(clk), .rst(rst), .load(load_i), .D(
        Data_Reg), .Q(N_mant_o) );
endmodule


module Priority_Codec_32 ( Data_Dec_i, Data_Bin_o );
  input [25:0] Data_Dec_i;
  output [4:0] Data_Bin_o;
  wire   n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26,
         n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40,
         n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n1, n2, n3, n4, n5,
         n6, n7, n8, n9, n10, n11, n12;

  NOR3BX1TS U3 ( .AN(n25), .B(Data_Dec_i[18]), .C(n6), .Y(n31) );
  NOR3BX1TS U4 ( .AN(n39), .B(Data_Dec_i[10]), .C(Data_Dec_i[11]), .Y(
        Data_Bin_o[4]) );
  INVX2TS U5 ( .A(n31), .Y(n5) );
  AOI31X1TS U6 ( .A0(n7), .A1(n1), .A2(n40), .B0(n41), .Y(n34) );
  INVX2TS U7 ( .A(Data_Bin_o[4]), .Y(n4) );
  INVX2TS U8 ( .A(n42), .Y(n6) );
  INVX2TS U9 ( .A(n16), .Y(n3) );
  NOR2X1TS U10 ( .A(n22), .B(n23), .Y(n21) );
  NOR4BX1TS U11 ( .AN(n13), .B(n5), .C(Data_Dec_i[13]), .D(Data_Dec_i[14]), 
        .Y(n50) );
  NOR3X1TS U12 ( .A(Data_Dec_i[24]), .B(Data_Dec_i[25]), .C(n40), .Y(n42) );
  NOR4BX1TS U13 ( .AN(n24), .B(n4), .C(Data_Dec_i[5]), .D(Data_Dec_i[6]), .Y(
        n49) );
  NOR2BX1TS U14 ( .AN(n50), .B(Data_Dec_i[12]), .Y(n39) );
  NAND2BX1TS U15 ( .AN(Data_Dec_i[3]), .B(n38), .Y(n16) );
  NOR2BX1TS U16 ( .AN(n49), .B(Data_Dec_i[4]), .Y(n38) );
  NAND2X1TS U17 ( .A(Data_Dec_i[2]), .B(n3), .Y(n20) );
  NAND4X1TS U18 ( .A(n26), .B(n28), .C(n48), .D(n17), .Y(n41) );
  AOI31X1TS U19 ( .A0(Data_Bin_o[4]), .A1(n24), .A2(Data_Dec_i[6]), .B0(n2), 
        .Y(n48) );
  INVX2TS U20 ( .A(n20), .Y(n2) );
  NOR4BX1TS U21 ( .AN(n29), .B(n36), .C(n23), .D(n37), .Y(n35) );
  NOR4BX1TS U22 ( .AN(Data_Dec_i[7]), .B(Data_Dec_i[9]), .C(Data_Dec_i[8]), 
        .D(n4), .Y(n37) );
  NOR3X1TS U23 ( .A(n16), .B(Data_Dec_i[1]), .C(Data_Dec_i[0]), .Y(n36) );
  NAND2BX1TS U24 ( .AN(Data_Dec_i[23]), .B(n8), .Y(n40) );
  AND2X2TS U25 ( .A(Data_Dec_i[3]), .B(n38), .Y(n23) );
  AND2X2TS U26 ( .A(Data_Dec_i[4]), .B(n49), .Y(n22) );
  AOI211X1TS U27 ( .A0(n46), .A1(n1), .B0(n47), .C0(n41), .Y(n45) );
  OAI21X1TS U28 ( .A0(Data_Dec_i[23]), .A1(n8), .B0(n7), .Y(n46) );
  OAI33XLTS U29 ( .A0(n9), .A1(Data_Dec_i[21]), .A2(n6), .B0(n10), .B1(
        Data_Dec_i[17]), .B2(n5), .Y(n47) );
  NOR3X1TS U30 ( .A(Data_Dec_i[16]), .B(Data_Dec_i[17]), .C(Data_Dec_i[15]), 
        .Y(n13) );
  NAND3BX1TS U31 ( .AN(Data_Dec_i[11]), .B(n39), .C(Data_Dec_i[10]), .Y(n28)
         );
  NOR3X1TS U32 ( .A(Data_Dec_i[20]), .B(Data_Dec_i[21]), .C(Data_Dec_i[19]), 
        .Y(n25) );
  NAND2X1TS U33 ( .A(Data_Dec_i[12]), .B(n50), .Y(n30) );
  NAND2X1TS U34 ( .A(Data_Dec_i[11]), .B(n39), .Y(n29) );
  AND4X1TS U35 ( .A(n27), .B(n28), .C(n29), .D(n30), .Y(n14) );
  NAND4BX1TS U36 ( .AN(Data_Dec_i[14]), .B(Data_Dec_i[13]), .C(n31), .D(n13), 
        .Y(n27) );
  NAND3X1TS U37 ( .A(n31), .B(n13), .C(Data_Dec_i[14]), .Y(n17) );
  NOR3X1TS U38 ( .A(Data_Dec_i[8]), .B(Data_Dec_i[9]), .C(Data_Dec_i[7]), .Y(
        n24) );
  NAND3X1TS U39 ( .A(n42), .B(n25), .C(Data_Dec_i[18]), .Y(n26) );
  INVX2TS U40 ( .A(Data_Dec_i[25]), .Y(n1) );
  INVX2TS U41 ( .A(Data_Dec_i[20]), .Y(n9) );
  INVX2TS U42 ( .A(Data_Dec_i[16]), .Y(n10) );
  INVX2TS U43 ( .A(Data_Dec_i[24]), .Y(n7) );
  INVX2TS U44 ( .A(Data_Dec_i[8]), .Y(n11) );
  INVX2TS U45 ( .A(Data_Dec_i[1]), .Y(n12) );
  NAND4X1TS U46 ( .A(n32), .B(n33), .C(n34), .D(n35), .Y(Data_Bin_o[1]) );
  NAND4BX1TS U47 ( .AN(Data_Dec_i[21]), .B(Data_Dec_i[19]), .C(n42), .D(n9), 
        .Y(n32) );
  NAND4BX1TS U48 ( .AN(Data_Dec_i[17]), .B(Data_Dec_i[15]), .C(n31), .D(n10), 
        .Y(n33) );
  NAND4BX1TS U49 ( .AN(n18), .B(n19), .C(n20), .D(n21), .Y(Data_Bin_o[2]) );
  NAND4BX1TS U50 ( .AN(Data_Dec_i[6]), .B(Data_Dec_i[5]), .C(Data_Bin_o[4]), 
        .D(n24), .Y(n19) );
  OAI211X1TS U51 ( .A0(n6), .A1(n25), .B0(n14), .C0(n26), .Y(n18) );
  NAND3BX1TS U52 ( .AN(n43), .B(n44), .C(n45), .Y(Data_Bin_o[0]) );
  OAI31X1TS U53 ( .A0(n4), .A1(Data_Dec_i[9]), .A2(n11), .B0(n30), .Y(n43) );
  AOI31X1TS U54 ( .A0(n3), .A1(n12), .A2(Data_Dec_i[0]), .B0(n22), .Y(n44) );
  OAI211X1TS U55 ( .A0(n13), .A1(n5), .B0(n14), .C0(n15), .Y(Data_Bin_o[3]) );
  OA21XLTS U56 ( .A0(n16), .A1(Data_Dec_i[2]), .B0(n17), .Y(n15) );
  INVX2TS U57 ( .A(Data_Dec_i[22]), .Y(n8) );
endmodule


module RegisterAdd_W5 ( clk, rst, load, D, Q );
  input [4:0] D;
  output [4:0] Q;
  input clk, rst, load;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n11, n10;

  DFFRX2TS Q_reg_4_ ( .D(n11), .CK(clk), .RN(n10), .Q(Q[4]), .QN(n5) );
  DFFRX2TS Q_reg_3_ ( .D(n9), .CK(clk), .RN(n10), .Q(Q[3]), .QN(n4) );
  DFFRX2TS Q_reg_2_ ( .D(n8), .CK(clk), .RN(n10), .Q(Q[2]), .QN(n3) );
  DFFRX2TS Q_reg_1_ ( .D(n7), .CK(clk), .RN(n10), .Q(Q[1]), .QN(n2) );
  DFFRX2TS Q_reg_0_ ( .D(n6), .CK(clk), .RN(n10), .Q(Q[0]), .QN(n1) );
  OAI2BB2XLTS U2 ( .B0(n2), .B1(load), .A0N(D[1]), .A1N(load), .Y(n7) );
  OAI2BB2XLTS U3 ( .B0(n3), .B1(load), .A0N(D[2]), .A1N(load), .Y(n8) );
  OAI2BB2XLTS U4 ( .B0(n1), .B1(load), .A0N(load), .A1N(D[0]), .Y(n6) );
  OAI2BB2XLTS U5 ( .B0(n4), .B1(load), .A0N(D[3]), .A1N(load), .Y(n9) );
  OAI2BB2XLTS U6 ( .B0(n5), .B1(load), .A0N(D[4]), .A1N(load), .Y(n11) );
  INVX2TS U7 ( .A(rst), .Y(n10) );
endmodule


module LZD_SWR26_EWR5 ( clk, rst, load_i, Add_subt_result_i, Shift_Value_o );
  input [25:0] Add_subt_result_i;
  output [4:0] Shift_Value_o;
  input clk, rst, load_i;

  wire   [4:0] Codec_to_Reg;

  Priority_Codec_32 LZD_SINGLEBLK_Codec_32 ( .Data_Dec_i(Add_subt_result_i), 
        .Data_Bin_o(Codec_to_Reg) );
  RegisterAdd_W5 Output_Reg ( .clk(clk), .rst(rst), .load(load_i), .D(
        Codec_to_Reg), .Q(Shift_Value_o) );
endmodule


module Round_Sgf_Dec ( Data_i, Round_Type_i, Sign_Result_i, Round_Flag_o );
  input [1:0] Data_i;
  input [1:0] Round_Type_i;
  input Sign_Result_i;
  output Round_Flag_o;
  wire   n4, n1, n2, n3;

  OA21XLTS U3 ( .A0(Data_i[1]), .A1(Data_i[0]), .B0(n4), .Y(Round_Flag_o) );
  OAI33XLTS U4 ( .A0(n1), .A1(Round_Type_i[1]), .A2(n3), .B0(n2), .B1(
        Sign_Result_i), .B2(Round_Type_i[0]), .Y(n4) );
  INVX2TS U5 ( .A(Sign_Result_i), .Y(n1) );
  INVX2TS U6 ( .A(Round_Type_i[0]), .Y(n3) );
  INVX2TS U7 ( .A(Round_Type_i[1]), .Y(n2) );
endmodule


module Mux_3x1_W1 ( ctrl, D0, D1, D2, S );
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


module Multiplexer_AC_W8_0 ( ctrl, D0, D1, S );
  input [7:0] D0;
  input [7:0] D1;
  output [7:0] S;
  input ctrl;
  wire   n1, n2;

  INVX2TS U1 ( .A(n2), .Y(n1) );
  INVX2TS U2 ( .A(ctrl), .Y(n2) );
  AO22X1TS U3 ( .A0(D1[0]), .A1(n1), .B0(D0[0]), .B1(n2), .Y(S[0]) );
  AO22X1TS U4 ( .A0(D1[1]), .A1(n1), .B0(D0[1]), .B1(n2), .Y(S[1]) );
  AO22X1TS U5 ( .A0(D1[2]), .A1(n1), .B0(D0[2]), .B1(n2), .Y(S[2]) );
  AO22X1TS U6 ( .A0(D1[3]), .A1(n1), .B0(D0[3]), .B1(n2), .Y(S[3]) );
  AO22X1TS U7 ( .A0(D1[4]), .A1(n1), .B0(D0[4]), .B1(n2), .Y(S[4]) );
  AO22X1TS U8 ( .A0(D1[5]), .A1(n1), .B0(D0[5]), .B1(n2), .Y(S[5]) );
  AO22X1TS U9 ( .A0(D1[6]), .A1(n1), .B0(D0[6]), .B1(n2), .Y(S[6]) );
  AO22X1TS U10 ( .A0(n1), .A1(D1[7]), .B0(D0[7]), .B1(n2), .Y(S[7]) );
endmodule


module Multiplexer_AC_W23 ( ctrl, D0, D1, S );
  input [22:0] D0;
  input [22:0] D1;
  output [22:0] S;
  input ctrl;
  wire   n1, n2, n3, n4, n5;

  AO22XLTS U1 ( .A0(D1[0]), .A1(ctrl), .B0(D0[0]), .B1(n4), .Y(S[0]) );
  AO22XLTS U2 ( .A0(D1[1]), .A1(n2), .B0(D0[1]), .B1(n3), .Y(S[1]) );
  AO22XLTS U3 ( .A0(D1[2]), .A1(n1), .B0(D0[2]), .B1(n3), .Y(S[2]) );
  AO22XLTS U4 ( .A0(D1[3]), .A1(ctrl), .B0(D0[3]), .B1(n3), .Y(S[3]) );
  AO22XLTS U5 ( .A0(D1[4]), .A1(n1), .B0(D0[4]), .B1(n3), .Y(S[4]) );
  AO22XLTS U6 ( .A0(D1[5]), .A1(n1), .B0(D0[5]), .B1(n3), .Y(S[5]) );
  AO22XLTS U7 ( .A0(D1[6]), .A1(n1), .B0(D0[6]), .B1(n3), .Y(S[6]) );
  AO22XLTS U8 ( .A0(D1[7]), .A1(ctrl), .B0(D0[7]), .B1(n3), .Y(S[7]) );
  AO22XLTS U9 ( .A0(D1[8]), .A1(ctrl), .B0(D0[8]), .B1(n4), .Y(S[8]) );
  AO22XLTS U10 ( .A0(n1), .A1(D1[9]), .B0(D0[9]), .B1(n4), .Y(S[9]) );
  INVX2TS U11 ( .A(n4), .Y(n2) );
  CLKBUFX2TS U12 ( .A(n5), .Y(n3) );
  CLKBUFX2TS U13 ( .A(n5), .Y(n4) );
  INVX2TS U14 ( .A(n1), .Y(n5) );
  CLKBUFX2TS U15 ( .A(ctrl), .Y(n1) );
  AO22X1TS U16 ( .A0(D1[10]), .A1(ctrl), .B0(D0[10]), .B1(n4), .Y(S[10]) );
  AO22X1TS U17 ( .A0(D1[11]), .A1(ctrl), .B0(D0[11]), .B1(n4), .Y(S[11]) );
  AO22X1TS U18 ( .A0(D1[12]), .A1(n2), .B0(D0[12]), .B1(n4), .Y(S[12]) );
  AO22X1TS U19 ( .A0(D1[13]), .A1(n2), .B0(D0[13]), .B1(n5), .Y(S[13]) );
  AO22X1TS U20 ( .A0(D1[14]), .A1(n2), .B0(D0[14]), .B1(n4), .Y(S[14]) );
  AO22X1TS U21 ( .A0(D1[15]), .A1(n2), .B0(D0[15]), .B1(n5), .Y(S[15]) );
  AO22X1TS U22 ( .A0(D1[16]), .A1(n2), .B0(D0[16]), .B1(n4), .Y(S[16]) );
  AO22X1TS U23 ( .A0(D1[17]), .A1(n2), .B0(D0[17]), .B1(n5), .Y(S[17]) );
  AO22X1TS U24 ( .A0(D1[18]), .A1(n2), .B0(D0[18]), .B1(n4), .Y(S[18]) );
  AO22X1TS U25 ( .A0(D1[19]), .A1(n2), .B0(D0[19]), .B1(n5), .Y(S[19]) );
  AO22X1TS U26 ( .A0(D1[20]), .A1(n2), .B0(D0[20]), .B1(n3), .Y(S[20]) );
  AO22X1TS U27 ( .A0(D1[21]), .A1(ctrl), .B0(D0[21]), .B1(n3), .Y(S[21]) );
  AO22X1TS U28 ( .A0(D1[22]), .A1(ctrl), .B0(D0[22]), .B1(n3), .Y(S[22]) );
endmodule


module RegisterAdd_W32_0 ( clk, rst, load, D, Q );
  input [31:0] D;
  output [31:0] Q;
  input clk, rst, load;
  wire   n64, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78,
         n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92,
         n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105,
         n106, n107, n108, n109, n110, n111, n112, n113, n114, n115, n116,
         n117, n118, n119, n120, n121, n122, n123, n124, n125, n126, n127,
         n128, n129, n130, n131, n132, n133, n134, n135, n136, n137, n138,
         n139;

  DFFRX2TS Q_reg_31_ ( .D(n76), .CK(clk), .RN(n75), .Q(Q[31]), .QN(n108) );
  DFFRX2TS Q_reg_30_ ( .D(n77), .CK(clk), .RN(n75), .Q(Q[30]), .QN(n109) );
  DFFRX2TS Q_reg_29_ ( .D(n78), .CK(clk), .RN(n67), .Q(Q[29]), .QN(n110) );
  DFFRX2TS Q_reg_28_ ( .D(n79), .CK(clk), .RN(n67), .Q(Q[28]), .QN(n111) );
  DFFRX2TS Q_reg_27_ ( .D(n80), .CK(clk), .RN(n67), .Q(Q[27]), .QN(n112) );
  DFFRX2TS Q_reg_26_ ( .D(n81), .CK(clk), .RN(n67), .Q(Q[26]), .QN(n113) );
  DFFRX2TS Q_reg_25_ ( .D(n82), .CK(clk), .RN(n67), .Q(Q[25]), .QN(n114) );
  DFFRX2TS Q_reg_24_ ( .D(n83), .CK(clk), .RN(n67), .Q(Q[24]), .QN(n115) );
  DFFRX2TS Q_reg_23_ ( .D(n84), .CK(clk), .RN(n67), .Q(Q[23]), .QN(n116) );
  DFFRX2TS Q_reg_22_ ( .D(n85), .CK(clk), .RN(n67), .Q(Q[22]), .QN(n117) );
  DFFRX2TS Q_reg_21_ ( .D(n86), .CK(clk), .RN(n67), .Q(Q[21]), .QN(n118) );
  DFFRX2TS Q_reg_20_ ( .D(n87), .CK(clk), .RN(n67), .Q(Q[20]), .QN(n119) );
  DFFRX2TS Q_reg_19_ ( .D(n88), .CK(clk), .RN(n66), .Q(Q[19]), .QN(n120) );
  DFFRX2TS Q_reg_18_ ( .D(n89), .CK(clk), .RN(n66), .Q(Q[18]), .QN(n121) );
  DFFRX2TS Q_reg_17_ ( .D(n90), .CK(clk), .RN(n66), .Q(Q[17]), .QN(n122) );
  DFFRX2TS Q_reg_16_ ( .D(n91), .CK(clk), .RN(n66), .Q(Q[16]), .QN(n123) );
  DFFRX2TS Q_reg_15_ ( .D(n92), .CK(clk), .RN(n66), .Q(Q[15]), .QN(n124) );
  DFFRX2TS Q_reg_14_ ( .D(n93), .CK(clk), .RN(n66), .Q(Q[14]), .QN(n125) );
  DFFRX2TS Q_reg_13_ ( .D(n94), .CK(clk), .RN(n66), .Q(Q[13]), .QN(n126) );
  DFFRX2TS Q_reg_12_ ( .D(n95), .CK(clk), .RN(n66), .Q(Q[12]), .QN(n127) );
  DFFRX2TS Q_reg_11_ ( .D(n96), .CK(clk), .RN(n66), .Q(Q[11]), .QN(n128) );
  DFFRX2TS Q_reg_10_ ( .D(n97), .CK(clk), .RN(n66), .Q(Q[10]), .QN(n129) );
  DFFRX2TS Q_reg_9_ ( .D(n98), .CK(clk), .RN(n64), .Q(Q[9]), .QN(n130) );
  DFFRX2TS Q_reg_8_ ( .D(n99), .CK(clk), .RN(n64), .Q(Q[8]), .QN(n131) );
  DFFRX2TS Q_reg_7_ ( .D(n100), .CK(clk), .RN(n64), .Q(Q[7]), .QN(n132) );
  DFFRX2TS Q_reg_6_ ( .D(n101), .CK(clk), .RN(n64), .Q(Q[6]), .QN(n133) );
  DFFRX2TS Q_reg_5_ ( .D(n102), .CK(clk), .RN(n64), .Q(Q[5]), .QN(n134) );
  DFFRX2TS Q_reg_4_ ( .D(n103), .CK(clk), .RN(n64), .Q(Q[4]), .QN(n135) );
  DFFRX2TS Q_reg_3_ ( .D(n104), .CK(clk), .RN(n64), .Q(Q[3]), .QN(n136) );
  DFFRX2TS Q_reg_2_ ( .D(n105), .CK(clk), .RN(n64), .Q(Q[2]), .QN(n137) );
  DFFRX2TS Q_reg_1_ ( .D(n106), .CK(clk), .RN(n64), .Q(Q[1]), .QN(n138) );
  DFFRX2TS Q_reg_0_ ( .D(n107), .CK(clk), .RN(n64), .Q(Q[0]), .QN(n139) );
  CLKBUFX2TS U2 ( .A(n73), .Y(n68) );
  CLKBUFX2TS U3 ( .A(n73), .Y(n69) );
  CLKBUFX2TS U4 ( .A(n72), .Y(n70) );
  CLKBUFX2TS U5 ( .A(n72), .Y(n71) );
  CLKBUFX2TS U6 ( .A(load), .Y(n73) );
  CLKBUFX2TS U7 ( .A(load), .Y(n72) );
  CLKBUFX2TS U8 ( .A(load), .Y(n74) );
  CLKBUFX2TS U9 ( .A(n75), .Y(n64) );
  CLKBUFX2TS U10 ( .A(n75), .Y(n66) );
  CLKBUFX2TS U11 ( .A(n75), .Y(n67) );
  OAI2BB2XLTS U12 ( .B0(n139), .B1(n68), .A0N(n71), .A1N(D[0]), .Y(n107) );
  OAI2BB2XLTS U13 ( .B0(n138), .B1(n73), .A0N(D[1]), .A1N(n71), .Y(n106) );
  OAI2BB2XLTS U14 ( .B0(n137), .B1(n68), .A0N(D[2]), .A1N(n70), .Y(n105) );
  OAI2BB2XLTS U15 ( .B0(n136), .B1(n72), .A0N(D[3]), .A1N(n70), .Y(n104) );
  OAI2BB2XLTS U16 ( .B0(n135), .B1(n72), .A0N(D[4]), .A1N(n70), .Y(n103) );
  OAI2BB2XLTS U17 ( .B0(n134), .B1(n74), .A0N(D[5]), .A1N(n69), .Y(n102) );
  OAI2BB2XLTS U18 ( .B0(n133), .B1(n74), .A0N(D[6]), .A1N(n69), .Y(n101) );
  OAI2BB2XLTS U19 ( .B0(n132), .B1(n74), .A0N(D[7]), .A1N(n69), .Y(n100) );
  OAI2BB2XLTS U20 ( .B0(n131), .B1(n74), .A0N(D[8]), .A1N(n68), .Y(n99) );
  OAI2BB2XLTS U21 ( .B0(n130), .B1(n72), .A0N(D[9]), .A1N(n69), .Y(n98) );
  OAI2BB2XLTS U22 ( .B0(n129), .B1(n74), .A0N(D[10]), .A1N(n68), .Y(n97) );
  OAI2BB2XLTS U23 ( .B0(n128), .B1(n74), .A0N(D[11]), .A1N(n68), .Y(n96) );
  OAI2BB2XLTS U24 ( .B0(n127), .B1(n74), .A0N(D[12]), .A1N(n68), .Y(n95) );
  OAI2BB2XLTS U25 ( .B0(n126), .B1(n73), .A0N(D[13]), .A1N(n68), .Y(n94) );
  OAI2BB2XLTS U26 ( .B0(n125), .B1(n74), .A0N(D[14]), .A1N(n68), .Y(n93) );
  OAI2BB2XLTS U27 ( .B0(n124), .B1(n72), .A0N(D[15]), .A1N(n69), .Y(n92) );
  OAI2BB2XLTS U28 ( .B0(n123), .B1(n73), .A0N(D[16]), .A1N(n68), .Y(n91) );
  OAI2BB2XLTS U29 ( .B0(n122), .B1(n74), .A0N(D[17]), .A1N(n68), .Y(n90) );
  OAI2BB2XLTS U30 ( .B0(n121), .B1(n73), .A0N(D[18]), .A1N(n69), .Y(n89) );
  OAI2BB2XLTS U31 ( .B0(n120), .B1(n73), .A0N(D[19]), .A1N(n69), .Y(n88) );
  OAI2BB2XLTS U32 ( .B0(n119), .B1(load), .A0N(D[20]), .A1N(n69), .Y(n87) );
  OAI2BB2XLTS U33 ( .B0(n118), .B1(n71), .A0N(D[21]), .A1N(n70), .Y(n86) );
  OAI2BB2XLTS U34 ( .B0(n117), .B1(n71), .A0N(D[22]), .A1N(n69), .Y(n85) );
  OAI2BB2XLTS U35 ( .B0(n116), .B1(n71), .A0N(D[23]), .A1N(n69), .Y(n84) );
  OAI2BB2XLTS U36 ( .B0(n115), .B1(n71), .A0N(D[24]), .A1N(n70), .Y(n83) );
  OAI2BB2XLTS U37 ( .B0(n114), .B1(n71), .A0N(D[25]), .A1N(n70), .Y(n82) );
  OAI2BB2XLTS U38 ( .B0(n113), .B1(n71), .A0N(D[26]), .A1N(n70), .Y(n81) );
  OAI2BB2XLTS U39 ( .B0(n112), .B1(n74), .A0N(D[27]), .A1N(n70), .Y(n80) );
  OAI2BB2XLTS U40 ( .B0(n111), .B1(n72), .A0N(D[28]), .A1N(n70), .Y(n79) );
  OAI2BB2XLTS U41 ( .B0(n110), .B1(load), .A0N(D[29]), .A1N(n70), .Y(n78) );
  OAI2BB2XLTS U42 ( .B0(n109), .B1(load), .A0N(D[30]), .A1N(n71), .Y(n77) );
  OAI2BB2XLTS U43 ( .B0(n108), .B1(load), .A0N(D[31]), .A1N(n71), .Y(n76) );
  INVX2TS U44 ( .A(rst), .Y(n75) );
endmodule


module Tenth_Phase_W32_EW8_SW23 ( clk, rst, load_i, sel_a_i, sel_b_i, sign_i, 
        exp_ieee_i, sgf_ieee_i, final_result_ieee_o );
  input [7:0] exp_ieee_i;
  input [22:0] sgf_ieee_i;
  output [31:0] final_result_ieee_o;
  input clk, rst, load_i, sel_a_i, sel_b_i, sign_i;
  wire   overunder, Sign_S_mux;
  wire   [7:0] Exp_S_mux;
  wire   [22:0] Sgf_S_mux;

  Mux_3x1_W1 Sign_Mux ( .ctrl({sel_a_i, sel_b_i}), .D0(sign_i), .D1(1'b1), 
        .D2(1'b0), .S(Sign_S_mux) );
  Multiplexer_AC_W8_0 Exp_Mux ( .ctrl(overunder), .D0(exp_ieee_i), .D1({1'b1, 
        1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1}), .S(Exp_S_mux) );
  Multiplexer_AC_W23 Sgf_Mux ( .ctrl(overunder), .D0(sgf_ieee_i), .D1({1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .S(
        Sgf_S_mux) );
  RegisterAdd_W32_0 Final_Result_IEEE ( .clk(clk), .rst(rst), .load(load_i), 
        .D({Sign_S_mux, Exp_S_mux, Sgf_S_mux}), .Q(final_result_ieee_o) );
  OR2X2TS U3 ( .A(sel_a_i), .B(sel_b_i), .Y(overunder) );
endmodule


module add_sub_carry_out_W26_DW01_sub_0 ( A, B, CI, DIFF, CO );
  input [26:0] A;
  input [26:0] B;
  output [26:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n51, n52, n53, n54, n55, n56, n57, n58, n59,
         n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73,
         n74, n75, n76;
  wire   [26:1] carry;

  CMPR32X2TS U2_6 ( .A(A[6]), .B(n54), .C(carry[6]), .CO(carry[7]), .S(DIFF[6]) );
  ADDFHX2TS U2_4 ( .A(A[4]), .B(n56), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4]) );
  ADDFHX2TS U2_7 ( .A(A[7]), .B(n53), .CI(carry[7]), .CO(carry[8]), .S(DIFF[7]) );
  ADDFHX2TS U2_17 ( .A(A[17]), .B(n68), .CI(carry[17]), .CO(carry[18]), .S(
        DIFF[17]) );
  ADDFHX2TS U2_16 ( .A(A[16]), .B(n69), .CI(carry[16]), .CO(carry[17]), .S(
        DIFF[16]) );
  ADDFHX2TS U2_15 ( .A(A[15]), .B(n70), .CI(carry[15]), .CO(carry[16]), .S(
        DIFF[15]) );
  ADDFHX2TS U2_25 ( .A(A[25]), .B(n59), .CI(carry[25]), .CO(carry[26]), .S(
        DIFF[25]) );
  ADDFHX2TS U2_5 ( .A(A[5]), .B(n55), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5]) );
  ADDFHX2TS U2_24 ( .A(A[24]), .B(n60), .CI(carry[24]), .CO(carry[25]), .S(
        DIFF[24]) );
  ADDFHX2TS U2_18 ( .A(A[18]), .B(n67), .CI(carry[18]), .CO(carry[19]), .S(
        DIFF[18]) );
  ADDFHX2TS U2_8 ( .A(A[8]), .B(n52), .CI(carry[8]), .CO(carry[9]), .S(DIFF[8]) );
  ADDFHX4TS U2_1 ( .A(A[1]), .B(n65), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1]) );
  NAND2X2TS U1 ( .A(n71), .B(carry[14]), .Y(n21) );
  NAND3X4TS U2 ( .A(n18), .B(n17), .C(n19), .Y(carry[3]) );
  NAND2X4TS U3 ( .A(A[2]), .B(carry[2]), .Y(n17) );
  NAND2X2TS U4 ( .A(A[11]), .B(carry[11]), .Y(n8) );
  NAND2X2TS U5 ( .A(A[13]), .B(carry[13]), .Y(n14) );
  NAND2X4TS U6 ( .A(n1), .B(n11), .Y(carry[13]) );
  NAND3X4TS U7 ( .A(n29), .B(n28), .C(n30), .Y(carry[20]) );
  NAND2X2TS U8 ( .A(A[19]), .B(carry[19]), .Y(n29) );
  NAND2X2TS U9 ( .A(n66), .B(carry[19]), .Y(n28) );
  NAND3X2TS U10 ( .A(n21), .B(n20), .C(n22), .Y(carry[15]) );
  NAND2X2TS U11 ( .A(A[14]), .B(carry[14]), .Y(n20) );
  NAND3X2TS U12 ( .A(n24), .B(n23), .C(n25), .Y(carry[4]) );
  NAND2X2TS U13 ( .A(n57), .B(carry[3]), .Y(n23) );
  AND2X4TS U14 ( .A(n13), .B(n12), .Y(n1) );
  INVX3TS U15 ( .A(B[1]), .Y(n65) );
  NAND3X2TS U16 ( .A(n6), .B(n5), .C(n7), .Y(carry[11]) );
  NAND2X2TS U17 ( .A(A[10]), .B(carry[10]), .Y(n5) );
  NAND3X2TS U18 ( .A(n39), .B(n38), .C(n40), .Y(carry[23]) );
  NAND2X2TS U19 ( .A(n62), .B(carry[22]), .Y(n38) );
  NAND2X2TS U20 ( .A(n64), .B(carry[20]), .Y(n35) );
  NAND2X1TS U21 ( .A(A[23]), .B(carry[23]), .Y(n46) );
  NAND3X4TS U22 ( .A(n3), .B(n2), .C(n4), .Y(carry[10]) );
  NAND2X2TS U23 ( .A(n51), .B(carry[9]), .Y(n3) );
  NAND2X2TS U24 ( .A(A[9]), .B(carry[9]), .Y(n2) );
  NAND2X1TS U25 ( .A(n63), .B(carry[21]), .Y(n43) );
  NAND2X1TS U26 ( .A(A[22]), .B(carry[22]), .Y(n39) );
  NAND2X2TS U27 ( .A(n32), .B(n42), .Y(carry[22]) );
  NAND2X1TS U28 ( .A(A[21]), .B(carry[21]), .Y(n42) );
  INVX2TS U29 ( .A(n31), .Y(n32) );
  NAND2X1TS U30 ( .A(n44), .B(n43), .Y(n31) );
  NAND2X1TS U31 ( .A(n75), .B(carry[10]), .Y(n6) );
  NAND2X2TS U32 ( .A(n58), .B(carry[2]), .Y(n18) );
  NAND2X1TS U33 ( .A(A[3]), .B(carry[3]), .Y(n24) );
  NAND3X2TS U34 ( .A(n9), .B(n8), .C(n10), .Y(carry[12]) );
  NAND3X2TS U35 ( .A(n15), .B(n14), .C(n16), .Y(carry[14]) );
  NAND2XLTS U36 ( .A(A[3]), .B(n57), .Y(n25) );
  NAND2X1TS U37 ( .A(n63), .B(A[21]), .Y(n44) );
  NAND2X1TS U38 ( .A(n64), .B(A[20]), .Y(n36) );
  NAND2X1TS U39 ( .A(n61), .B(carry[23]), .Y(n47) );
  NAND2X1TS U40 ( .A(n73), .B(carry[12]), .Y(n12) );
  NAND2X1TS U41 ( .A(n73), .B(A[12]), .Y(n13) );
  NAND2X1TS U42 ( .A(n72), .B(carry[13]), .Y(n15) );
  NAND2X1TS U43 ( .A(A[12]), .B(carry[12]), .Y(n11) );
  NAND2X1TS U44 ( .A(n74), .B(A[11]), .Y(n10) );
  NAND2X1TS U45 ( .A(n74), .B(carry[11]), .Y(n9) );
  NAND2X1TS U46 ( .A(n75), .B(A[10]), .Y(n7) );
  XOR3XLTS U47 ( .A(carry[9]), .B(n51), .C(A[9]), .Y(DIFF[9]) );
  NAND2X1TS U48 ( .A(n51), .B(A[9]), .Y(n4) );
  CLKINVX1TS U49 ( .A(A[0]), .Y(n49) );
  XOR3XLTS U50 ( .A(carry[10]), .B(n75), .C(A[10]), .Y(DIFF[10]) );
  NAND2X1TS U51 ( .A(n58), .B(A[2]), .Y(n19) );
  XOR3XLTS U52 ( .A(carry[11]), .B(n74), .C(A[11]), .Y(DIFF[11]) );
  NAND2X1TS U53 ( .A(n72), .B(A[13]), .Y(n16) );
  NAND3X2TS U54 ( .A(n47), .B(n46), .C(n48), .Y(carry[24]) );
  XOR3XLTS U55 ( .A(carry[12]), .B(n73), .C(A[12]), .Y(DIFF[12]) );
  NAND2X1TS U56 ( .A(n71), .B(A[14]), .Y(n22) );
  XOR3XLTS U57 ( .A(carry[13]), .B(n72), .C(A[13]), .Y(DIFF[13]) );
  XOR3XLTS U58 ( .A(carry[2]), .B(n58), .C(A[2]), .Y(DIFF[2]) );
  INVX2TS U59 ( .A(B[3]), .Y(n57) );
  XOR3XLTS U60 ( .A(carry[14]), .B(n71), .C(A[14]), .Y(DIFF[14]) );
  XOR3XLTS U61 ( .A(carry[3]), .B(A[3]), .C(n57), .Y(DIFF[3]) );
  NAND2X2TS U62 ( .A(n36), .B(n35), .Y(n26) );
  NAND2X4TS U63 ( .A(n27), .B(n34), .Y(carry[21]) );
  CLKINVX4TS U64 ( .A(n26), .Y(n27) );
  NAND2X1TS U65 ( .A(A[22]), .B(n62), .Y(n40) );
  NAND2X1TS U66 ( .A(A[20]), .B(carry[20]), .Y(n34) );
  XOR2XLTS U67 ( .A(n41), .B(carry[21]), .Y(DIFF[21]) );
  NAND2X1TS U68 ( .A(A[19]), .B(n66), .Y(n30) );
  XOR3XLTS U69 ( .A(carry[19]), .B(A[19]), .C(n66), .Y(DIFF[19]) );
  CLKINVX2TS U70 ( .A(B[19]), .Y(n66) );
  INVX2TS U71 ( .A(B[24]), .Y(n60) );
  NAND2X1TS U72 ( .A(n61), .B(A[23]), .Y(n48) );
  XOR2XLTS U73 ( .A(n64), .B(A[20]), .Y(n33) );
  XOR2XLTS U74 ( .A(n33), .B(carry[20]), .Y(DIFF[20]) );
  XOR2XLTS U75 ( .A(A[22]), .B(n62), .Y(n37) );
  XOR2XLTS U76 ( .A(n37), .B(carry[22]), .Y(DIFF[22]) );
  INVXLTS U77 ( .A(B[9]), .Y(n51) );
  INVXLTS U78 ( .A(B[0]), .Y(n76) );
  XNOR2XLTS U79 ( .A(n76), .B(A[0]), .Y(DIFF[0]) );
  XOR2XLTS U80 ( .A(n63), .B(A[21]), .Y(n41) );
  XOR2XLTS U81 ( .A(n61), .B(A[23]), .Y(n45) );
  XOR2XLTS U82 ( .A(n45), .B(carry[23]), .Y(DIFF[23]) );
  INVX2TS U83 ( .A(B[2]), .Y(n58) );
  INVX2TS U84 ( .A(B[4]), .Y(n56) );
  INVX2TS U85 ( .A(B[5]), .Y(n55) );
  INVX2TS U86 ( .A(B[6]), .Y(n54) );
  INVX2TS U87 ( .A(B[7]), .Y(n53) );
  INVX2TS U88 ( .A(B[8]), .Y(n52) );
  INVX2TS U89 ( .A(B[10]), .Y(n75) );
  INVX2TS U90 ( .A(B[11]), .Y(n74) );
  INVX2TS U91 ( .A(B[12]), .Y(n73) );
  INVX2TS U92 ( .A(B[13]), .Y(n72) );
  INVX2TS U93 ( .A(B[14]), .Y(n71) );
  INVX2TS U94 ( .A(B[15]), .Y(n70) );
  INVX2TS U95 ( .A(B[16]), .Y(n69) );
  INVX2TS U96 ( .A(B[17]), .Y(n68) );
  INVX2TS U97 ( .A(B[18]), .Y(n67) );
  INVX2TS U98 ( .A(B[20]), .Y(n64) );
  INVX2TS U99 ( .A(B[21]), .Y(n63) );
  INVX2TS U100 ( .A(B[22]), .Y(n62) );
  INVX2TS U101 ( .A(B[23]), .Y(n61) );
  NAND2X1TS U102 ( .A(B[0]), .B(n49), .Y(carry[1]) );
  INVX2TS U103 ( .A(B[25]), .Y(n59) );
  INVX2TS U104 ( .A(carry[26]), .Y(DIFF[26]) );
endmodule


module add_sub_carry_out_W26_DW01_add_0 ( A, B, CI, SUM, CO );
  input [26:0] A;
  input [26:0] B;
  output [26:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20;
  wire   [25:1] carry;

  CMPR32X2TS U1_4 ( .A(A[4]), .B(B[4]), .C(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDFHX2TS U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDFHX2TS U1_16 ( .A(A[16]), .B(B[16]), .CI(carry[16]), .CO(carry[17]), .S(
        SUM[16]) );
  ADDFHX2TS U1_24 ( .A(A[24]), .B(B[24]), .CI(carry[24]), .CO(carry[25]), .S(
        SUM[24]) );
  CMPR32X2TS U1_10 ( .A(A[10]), .B(B[10]), .C(carry[10]), .CO(carry[11]), .S(
        SUM[10]) );
  ADDFHX2TS U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  ADDFHX2TS U1_15 ( .A(A[15]), .B(B[15]), .CI(carry[15]), .CO(carry[16]), .S(
        SUM[15]) );
  ADDFHX2TS U1_13 ( .A(A[13]), .B(B[13]), .CI(carry[13]), .CO(carry[14]), .S(
        SUM[13]) );
  ADDFHX2TS U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDFHX2TS U1_11 ( .A(A[11]), .B(B[11]), .CI(carry[11]), .CO(carry[12]), .S(
        SUM[11]) );
  ADDFHX2TS U1_25 ( .A(A[25]), .B(B[25]), .CI(carry[25]), .CO(SUM[26]), .S(
        SUM[25]) );
  ADDFHX2TS U1_17 ( .A(A[17]), .B(B[17]), .CI(carry[17]), .CO(carry[18]), .S(
        SUM[17]) );
  ADDFHX2TS U1_18 ( .A(A[18]), .B(B[18]), .CI(carry[18]), .CO(carry[19]), .S(
        SUM[18]) );
  ADDFHX2TS U1_21 ( .A(A[21]), .B(B[21]), .CI(carry[21]), .CO(carry[22]), .S(
        SUM[21]) );
  ADDFHX2TS U1_22 ( .A(A[22]), .B(B[22]), .CI(carry[22]), .CO(carry[23]), .S(
        SUM[22]) );
  ADDFHX2TS U1_19 ( .A(A[19]), .B(B[19]), .CI(carry[19]), .CO(carry[20]), .S(
        SUM[19]) );
  ADDFHX2TS U1_20 ( .A(A[20]), .B(B[20]), .CI(carry[20]), .CO(carry[21]), .S(
        SUM[20]) );
  ADDFHX2TS U1_8 ( .A(A[8]), .B(B[8]), .CI(carry[8]), .CO(carry[9]), .S(SUM[8]) );
  ADDFHX2TS U1_9 ( .A(A[9]), .B(B[9]), .CI(carry[9]), .CO(carry[10]), .S(
        SUM[9]) );
  ADDFHX2TS U1_23 ( .A(A[23]), .B(B[23]), .CI(carry[23]), .CO(carry[24]), .S(
        SUM[23]) );
  NAND2X2TS U1 ( .A(B[14]), .B(carry[14]), .Y(n10) );
  NAND3X2TS U2 ( .A(n10), .B(n9), .C(n11), .Y(carry[15]) );
  NAND2X2TS U3 ( .A(A[14]), .B(carry[14]), .Y(n9) );
  NAND2XLTS U4 ( .A(carry[1]), .B(A[1]), .Y(n14) );
  NAND2XLTS U5 ( .A(A[1]), .B(B[1]), .Y(n12) );
  NAND2X2TS U6 ( .A(B[6]), .B(carry[6]), .Y(n3) );
  NAND2X2TS U7 ( .A(B[12]), .B(carry[12]), .Y(n6) );
  NAND2X2TS U8 ( .A(A[12]), .B(carry[12]), .Y(n5) );
  NAND2X2TS U9 ( .A(A[6]), .B(carry[6]), .Y(n2) );
  NAND3X2TS U10 ( .A(n17), .B(n16), .C(n18), .Y(carry[3]) );
  NAND2X2TS U11 ( .A(A[2]), .B(carry[2]), .Y(n17) );
  NAND3X2TS U12 ( .A(n6), .B(n5), .C(n7), .Y(carry[13]) );
  NAND3X2TS U13 ( .A(n3), .B(n2), .C(n4), .Y(carry[7]) );
  NAND2X1TS U14 ( .A(A[2]), .B(B[2]), .Y(n18) );
  NAND2X2TS U15 ( .A(B[2]), .B(carry[2]), .Y(n16) );
  NOR2X1TS U16 ( .A(n19), .B(n20), .Y(n8) );
  CLKINVX2TS U17 ( .A(B[0]), .Y(n20) );
  NAND2X2TS U18 ( .A(n1), .B(n13), .Y(carry[2]) );
  NAND2XLTS U19 ( .A(n8), .B(B[1]), .Y(n13) );
  AND2X4TS U20 ( .A(n12), .B(n14), .Y(n1) );
  NOR2X1TS U21 ( .A(n19), .B(n20), .Y(carry[1]) );
  NAND2X1TS U22 ( .A(B[12]), .B(A[12]), .Y(n7) );
  NAND2X1TS U23 ( .A(B[6]), .B(A[6]), .Y(n4) );
  XOR3XLTS U24 ( .A(carry[6]), .B(B[6]), .C(A[6]), .Y(SUM[6]) );
  XOR3XLTS U25 ( .A(carry[12]), .B(B[12]), .C(A[12]), .Y(SUM[12]) );
  CLKINVX2TS U26 ( .A(A[0]), .Y(n19) );
  NAND2X1TS U27 ( .A(B[14]), .B(A[14]), .Y(n11) );
  XOR3XLTS U28 ( .A(carry[14]), .B(B[14]), .C(A[14]), .Y(SUM[14]) );
  XOR3XLTS U29 ( .A(B[1]), .B(n8), .C(A[1]), .Y(SUM[1]) );
  XNOR2XLTS U30 ( .A(B[0]), .B(n19), .Y(SUM[0]) );
  XOR2XLTS U31 ( .A(A[2]), .B(B[2]), .Y(n15) );
  XOR2XLTS U32 ( .A(n15), .B(carry[2]), .Y(SUM[2]) );
endmodule


module FPU_Add_Subtract_Function_W32_EW8_SW23_SWR26_EWR5 ( clk, rst, beg_FSM, 
        ack_FSM, Data_X, Data_Y, add_subt, r_mode, overflow_flag, 
        underflow_flag, ready, final_result_ieee );
  input [31:0] Data_X;
  input [31:0] Data_Y;
  input [1:0] r_mode;
  output [31:0] final_result_ieee;
  input clk, rst, beg_FSM, ack_FSM, add_subt;
  output overflow_flag, underflow_flag, ready;
  wire   zero_flag, FSM_selector_C, add_overflow_flag, round_flag,
         FSM_op_start_in_load_a, FSM_op_start_in_load_b,
         FSM_exp_operation_load_diff, FSM_exp_operation_load_OU,
         FSM_exp_operation_A_S, FSM_barrel_shifter_load,
         FSM_barrel_shifter_L_R, FSM_barrel_shifter_B_S, FSM_Add_Subt_Sgf_load,
         FSM_LZA_load, FSM_Final_Result_load, selector_A, load_b, selector_C,
         selector_D, rst_int, FSM_selector_A, intAS, real_op,
         sign_final_result, S_A_S_Oper_B_2_, Add_Subt_Sgf_module_Sgf_AS_N56,
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
         Add_Subt_Sgf_module_Sgf_AS_N3, n27, n28, n29, n30, n31, n32, n33, n34,
         n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48,
         n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62,
         n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76,
         n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90,
         n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103,
         n104, n105, n106, n107, n108, n109, n110, n111, n112, n113, n114,
         n115, n116, n117, n118, n119, n120, n121, n122, n123, n124, n125,
         n126, n127, n128, n129, n130, n131, n132, n133, n134, n135, n136,
         n137, n138, n139, n140, n141, n142, n143, n144;
  wire   [1:0] selector_B;
  wire   [1:0] FSM_selector_B;
  wire   [31:0] intDX;
  wire   [31:0] intDY;
  wire   [30:0] DMP;
  wire   [30:0] DmP;
  wire   [7:0] exp_oper_result;
  wire   [7:0] S_Oper_A_exp;
  wire   [7:0] S_Oper_B_exp;
  wire   [4:0] LZA_output;
  wire   [4:0] S_Shift_Value;
  wire   [25:0] Add_Subt_result;
  wire   [25:0] S_Data_Shift;
  wire   [25:0] Sgf_normalized_result;
  wire   [25:2] S_A_S_Oper_A;
  wire   [24:0] Add_Subt_Sgf_module_S_to_D;

  FSM_Add_Subtract FS_Module ( .clk(clk), .rst(n34), .rst_FSM(ack_FSM), 
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
  RegisterAdd_W1_7 Sel_A ( .clk(clk), .rst(rst_int), .load(selector_A), .D(
        1'b1), .Q(FSM_selector_A) );
  RegisterAdd_W1_6 Sel_C ( .clk(clk), .rst(rst_int), .load(selector_C), .D(
        1'b1), .Q(FSM_selector_C) );
  RegisterAdd_W2 Sel_B ( .clk(clk), .rst(rst_int), .load(load_b), .D(
        selector_B), .Q(FSM_selector_B) );
  RegisterAdd_W32_2 XRegister ( .clk(clk), .rst(n34), .load(n90), .D(Data_X), 
        .Q(intDX) );
  RegisterAdd_W32_1 YRegister ( .clk(clk), .rst(rst), .load(n90), .D(Data_Y), 
        .Q(intDY) );
  RegisterAdd_W1_4 ASRegister ( .clk(clk), .rst(rst), .load(n90), .D(add_subt), 
        .Q(intAS) );
  Oper_Start_In_2_W32 Oper_Start_in_module ( .clk(clk), .rst(n34), .load_b_i(
        FSM_op_start_in_load_b), .intAS(intAS), .intDX(intDX), .intDY(intDY), 
        .DMP_o(DMP), .DmP_o(DmP), .zero_flag_o(zero_flag), .real_op_o(real_op), 
        .sign_final_result_o(sign_final_result) );
  Multiplexer_AC_W8_1 Exp_Oper_A_mux ( .ctrl(FSM_selector_A), .D0(DMP[30:23]), 
        .D1(exp_oper_result), .S(S_Oper_A_exp) );
  Mux_3x1_W8 Exp_Oper_B_mux ( .ctrl(FSM_selector_B), .D0(DmP[30:23]), .D1({
        1'b0, 1'b0, 1'b0, LZA_output}), .D2({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b1}), .S(S_Oper_B_exp) );
  Exp_Operation_EW8 Exp_Operation_Module ( .clk(clk), .rst(n34), .load_a_i(
        FSM_exp_operation_load_diff), .load_b_i(FSM_exp_operation_load_OU), 
        .Data_A_i(S_Oper_A_exp), .Data_B_i(S_Oper_B_exp), .Add_Subt_i(
        FSM_exp_operation_A_S), .Data_Result_o(exp_oper_result), 
        .Overflow_flag_o(overflow_flag), .Underflow_flag_o(underflow_flag) );
  Mux_3x1_W5 Barrel_Shifter_S_V_mux ( .ctrl(FSM_selector_B), .D0(
        exp_oper_result[4:0]), .D1(LZA_output), .D2({1'b0, 1'b0, 1'b0, 1'b0, 
        1'b1}), .S(S_Shift_Value) );
  Multiplexer_AC_W26_2 Barrel_Shifter_D_I_mux ( .ctrl(FSM_selector_C), .D0({
        1'b1, DmP[22:0], 1'b0, 1'b0}), .D1(Add_Subt_result), .S(S_Data_Shift)
         );
  Barrel_Shifter_SWR26_EWR5 Barrel_Shifter_module ( .clk(clk), .rst(rst), 
        .load_i(FSM_barrel_shifter_load), .Shift_Value_i(S_Shift_Value), 
        .Shift_Data_i(S_Data_Shift), .Left_Right_i(FSM_barrel_shifter_L_R), 
        .Bit_Shift_i(FSM_barrel_shifter_B_S), .N_mant_o(Sgf_normalized_result)
         );
  LZD_SWR26_EWR5 Leading_Zero_Detector_Module ( .clk(clk), .rst(rst), .load_i(
        FSM_LZA_load), .Add_subt_result_i({n27, n115, n114, n113, n112, n111, 
        n110, n109, n108, n107, n106, n105, n104, n103, n102, n101, n100, n99, 
        n98, n97, n96, n95, n94, n93, n92, n91}), .Shift_Value_o(LZA_output)
         );
  Round_Sgf_Dec Rounding_Decoder ( .Data_i(Sgf_normalized_result[1:0]), 
        .Round_Type_i(r_mode), .Sign_Result_i(sign_final_result), 
        .Round_Flag_o(round_flag) );
  Tenth_Phase_W32_EW8_SW23 final_result_ieee_Module ( .clk(clk), .rst(rst), 
        .load_i(FSM_Final_Result_load), .sel_a_i(overflow_flag), .sel_b_i(
        underflow_flag), .sign_i(sign_final_result), .exp_ieee_i(
        exp_oper_result), .sgf_ieee_i(Sgf_normalized_result[24:2]), 
        .final_result_ieee_o(final_result_ieee) );
  add_sub_carry_out_W26_DW01_sub_0 Add_Subt_Sgf_module_Sgf_AS_sub_34 ( .A({
        1'b0, S_A_S_Oper_A, n46, n42}), .B({1'b0, n63, n62, n61, n60, n56, n55, 
        n59, n58, n57, n54, n53, n52, n51, n50, n48, n49, n32, n31, n30, n47, 
        n29, n28, n44, S_A_S_Oper_B_2_, n43, n45}), .CI(1'b0), .DIFF({
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
  add_sub_carry_out_W26_DW01_add_0 Add_Subt_Sgf_module_Sgf_AS_add_36 ( .A({
        1'b0, S_A_S_Oper_A, n46, n42}), .B({1'b0, n63, n62, n61, n60, n56, n55, 
        n59, n58, n57, n54, n53, n52, n51, n50, n48, n49, n32, n31, n30, n47, 
        n29, n28, n44, S_A_S_Oper_B_2_, n43, n45}), .CI(1'b0), .SUM({
        Add_Subt_Sgf_module_Sgf_AS_N56, Add_Subt_Sgf_module_Sgf_AS_N55, 
        Add_Subt_Sgf_module_Sgf_AS_N54, Add_Subt_Sgf_module_Sgf_AS_N53, 
        Add_Subt_Sgf_module_Sgf_AS_N52, Add_Subt_Sgf_module_Sgf_AS_N51, 
        Add_Subt_Sgf_module_Sgf_AS_N50, Add_Subt_Sgf_module_Sgf_AS_N49, 
        Add_Subt_Sgf_module_Sgf_AS_N48, Add_Subt_Sgf_module_Sgf_AS_N47, 
        Add_Subt_Sgf_module_Sgf_AS_N46, Add_Subt_Sgf_module_Sgf_AS_N45, 
        Add_Subt_Sgf_module_Sgf_AS_N44, Add_Subt_Sgf_module_Sgf_AS_N43, 
        Add_Subt_Sgf_module_Sgf_AS_N42, Add_Subt_Sgf_module_Sgf_AS_N41, 
        Add_Subt_Sgf_module_Sgf_AS_N40, Add_Subt_Sgf_module_Sgf_AS_N39, 
        Add_Subt_Sgf_module_Sgf_AS_N38, Add_Subt_Sgf_module_Sgf_AS_N37, 
        Add_Subt_Sgf_module_Sgf_AS_N36, Add_Subt_Sgf_module_Sgf_AS_N35, 
        Add_Subt_Sgf_module_Sgf_AS_N34, Add_Subt_Sgf_module_Sgf_AS_N33, 
        Add_Subt_Sgf_module_Sgf_AS_N32, Add_Subt_Sgf_module_Sgf_AS_N31, 
        Add_Subt_Sgf_module_Sgf_AS_N30}) );
  DFFRX2TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_0_ ( .D(n116), .CK(clk), 
        .RN(n70), .Q(Add_Subt_result[0]), .QN(n91) );
  DFFRX2TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_1_ ( .D(n117), .CK(clk), 
        .RN(n70), .Q(Add_Subt_result[1]), .QN(n92) );
  DFFRX2TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_2_ ( .D(n118), .CK(clk), 
        .RN(n70), .Q(Add_Subt_result[2]), .QN(n93) );
  DFFRX2TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_3_ ( .D(n119), .CK(clk), 
        .RN(n70), .Q(Add_Subt_result[3]), .QN(n94) );
  DFFRX2TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_4_ ( .D(n120), .CK(clk), 
        .RN(n70), .Q(Add_Subt_result[4]), .QN(n95) );
  DFFRX2TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_5_ ( .D(n121), .CK(clk), 
        .RN(n70), .Q(Add_Subt_result[5]), .QN(n96) );
  DFFRX2TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_6_ ( .D(n122), .CK(clk), 
        .RN(n70), .Q(Add_Subt_result[6]), .QN(n97) );
  DFFRX2TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_9_ ( .D(n125), .CK(clk), 
        .RN(n70), .Q(Add_Subt_result[9]), .QN(n100) );
  DFFRX2TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_7_ ( .D(n123), .CK(clk), 
        .RN(n70), .Q(Add_Subt_result[7]), .QN(n98) );
  DFFRX2TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_8_ ( .D(n124), .CK(clk), 
        .RN(n70), .Q(Add_Subt_result[8]), .QN(n99) );
  DFFRX2TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_10_ ( .D(n126), .CK(clk), 
        .RN(n71), .Q(Add_Subt_result[10]), .QN(n101) );
  DFFRX2TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_11_ ( .D(n127), .CK(clk), 
        .RN(n71), .Q(Add_Subt_result[11]), .QN(n102) );
  DFFRX2TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_12_ ( .D(n128), .CK(clk), 
        .RN(n71), .Q(Add_Subt_result[12]), .QN(n103) );
  DFFRX2TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_13_ ( .D(n129), .CK(clk), 
        .RN(n71), .Q(Add_Subt_result[13]), .QN(n104) );
  DFFRX1TS Add_Subt_Sgf_module_Add_overflow_Result_Q_reg_0_ ( .D(n144), .CK(
        clk), .RN(n33), .Q(add_overflow_flag) );
  DFFRX2TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_14_ ( .D(n130), .CK(clk), 
        .RN(n71), .Q(Add_Subt_result[14]), .QN(n105) );
  DFFRX2TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_15_ ( .D(n131), .CK(clk), 
        .RN(n71), .Q(Add_Subt_result[15]), .QN(n106) );
  DFFRX2TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_16_ ( .D(n132), .CK(clk), 
        .RN(n71), .Q(Add_Subt_result[16]), .QN(n107) );
  DFFRX2TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_17_ ( .D(n133), .CK(clk), 
        .RN(n71), .Q(Add_Subt_result[17]), .QN(n108) );
  DFFRX2TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_18_ ( .D(n134), .CK(clk), 
        .RN(n71), .Q(Add_Subt_result[18]), .QN(n109) );
  DFFRX2TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_24_ ( .D(n140), .CK(clk), 
        .RN(n33), .Q(Add_Subt_result[24]), .QN(n115) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_25_ ( .D(n141), .CK(clk), 
        .RN(n33), .Q(Add_Subt_result[25]), .QN(n27) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_20_ ( .D(n136), .CK(clk), 
        .RN(n33), .Q(Add_Subt_result[20]), .QN(n111) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_21_ ( .D(n137), .CK(clk), 
        .RN(n33), .Q(Add_Subt_result[21]), .QN(n112) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_22_ ( .D(n138), .CK(clk), 
        .RN(n33), .Q(Add_Subt_result[22]), .QN(n113) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_23_ ( .D(n139), .CK(clk), 
        .RN(n33), .Q(Add_Subt_result[23]), .QN(n114) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_19_ ( .D(n135), .CK(clk), 
        .RN(n71), .Q(Add_Subt_result[19]), .QN(n110) );
  DFFRHQX2TS Sel_D_Q_reg_0_ ( .D(n142), .CK(clk), .RN(n143), .Q(n35) );
  AND2X2TS U29 ( .A(Sgf_normalized_result[1]), .B(n84), .Y(n43) );
  OAI2BB2X1TS U30 ( .B0(n68), .B1(n39), .A0N(add_overflow_flag), .A1N(n68), 
        .Y(n144) );
  AOI22X2TS U31 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N56), .A1(n72), .B0(
        Add_Subt_Sgf_module_Sgf_AS_N29), .B1(n77), .Y(n39) );
  OAI2BB2X4TS U32 ( .B0(n115), .B1(n89), .A0N(Add_Subt_Sgf_module_S_to_D[24]), 
        .A1N(n87), .Y(n140) );
  AO22X4TS U33 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N54), .A1(n72), .B0(
        Add_Subt_Sgf_module_Sgf_AS_N27), .B1(n77), .Y(
        Add_Subt_Sgf_module_S_to_D[24]) );
  AND2X2TS U34 ( .A(Sgf_normalized_result[4]), .B(n81), .Y(n28) );
  CLKAND2X2TS U35 ( .A(Sgf_normalized_result[3]), .B(n79), .Y(n44) );
  NAND2BX1TS U36 ( .AN(Sgf_normalized_result[2]), .B(n67), .Y(S_A_S_Oper_B_2_)
         );
  INVX2TS U37 ( .A(n35), .Y(n84) );
  CLKBUFX2TS U38 ( .A(n83), .Y(n81) );
  NOR2X2TS U39 ( .A(n36), .B(n37), .Y(n69) );
  AND2X4TS U40 ( .A(Add_Subt_Sgf_module_Sgf_AS_N55), .B(n72), .Y(n36) );
  AO22X4TS U41 ( .A0(Sgf_normalized_result[3]), .A1(n78), .B0(DMP[1]), .B1(n67), .Y(S_A_S_Oper_A[3]) );
  OAI2BB2X2TS U42 ( .B0(n41), .B1(n83), .A0N(DMP[0]), .A1N(n67), .Y(
        S_A_S_Oper_A[2]) );
  AO22X1TS U43 ( .A0(Sgf_normalized_result[12]), .A1(n66), .B0(DMP[10]), .B1(
        n83), .Y(S_A_S_Oper_A[12]) );
  AO22X1TS U44 ( .A0(Sgf_normalized_result[10]), .A1(n66), .B0(DMP[8]), .B1(
        n80), .Y(S_A_S_Oper_A[10]) );
  AO22X1TS U45 ( .A0(Sgf_normalized_result[6]), .A1(n78), .B0(DMP[4]), .B1(n83), .Y(S_A_S_Oper_A[6]) );
  INVX2TS U46 ( .A(Sgf_normalized_result[2]), .Y(n41) );
  AND2X2TS U47 ( .A(Sgf_normalized_result[0]), .B(n35), .Y(n42) );
  AND2X2TS U48 ( .A(Sgf_normalized_result[0]), .B(n84), .Y(n45) );
  AND2X2TS U49 ( .A(Add_Subt_Sgf_module_Sgf_AS_N28), .B(n77), .Y(n37) );
  AND2X2TS U50 ( .A(Sgf_normalized_result[5]), .B(n81), .Y(n29) );
  AND2X2TS U51 ( .A(Sgf_normalized_result[7]), .B(n79), .Y(n30) );
  AND2X2TS U52 ( .A(Sgf_normalized_result[8]), .B(n81), .Y(n31) );
  AND2X2TS U53 ( .A(Sgf_normalized_result[9]), .B(n67), .Y(n32) );
  INVX2TS U54 ( .A(rst), .Y(n33) );
  INVX2TS U55 ( .A(n33), .Y(n34) );
  AND2X2TS U56 ( .A(Sgf_normalized_result[6]), .B(n82), .Y(n47) );
  NOR2BX4TS U57 ( .AN(Sgf_normalized_result[1]), .B(n84), .Y(n46) );
  AO22X1TS U58 ( .A0(Sgf_normalized_result[11]), .A1(n66), .B0(DMP[9]), .B1(
        n81), .Y(S_A_S_Oper_A[11]) );
  AO22X1TS U59 ( .A0(Sgf_normalized_result[13]), .A1(n66), .B0(DMP[11]), .B1(
        n81), .Y(S_A_S_Oper_A[13]) );
  AO22X1TS U60 ( .A0(Sgf_normalized_result[14]), .A1(n66), .B0(DMP[12]), .B1(
        n82), .Y(S_A_S_Oper_A[14]) );
  CLKBUFX2TS U61 ( .A(n40), .Y(n77) );
  AO22X1TS U62 ( .A0(Sgf_normalized_result[7]), .A1(n78), .B0(DMP[5]), .B1(n79), .Y(S_A_S_Oper_A[7]) );
  OAI2BB2X2TS U63 ( .B0(n38), .B1(n80), .A0N(DMP[2]), .A1N(n82), .Y(
        S_A_S_Oper_A[4]) );
  AO22X1TS U64 ( .A0(Sgf_normalized_result[19]), .A1(n78), .B0(DMP[17]), .B1(
        n83), .Y(S_A_S_Oper_A[19]) );
  CLKINVX2TS U65 ( .A(Sgf_normalized_result[4]), .Y(n38) );
  AO22XLTS U66 ( .A0(Sgf_normalized_result[8]), .A1(n78), .B0(DMP[6]), .B1(n79), .Y(S_A_S_Oper_A[8]) );
  AO22X1TS U67 ( .A0(Sgf_normalized_result[20]), .A1(n78), .B0(DMP[18]), .B1(
        n81), .Y(S_A_S_Oper_A[20]) );
  AO22X1TS U68 ( .A0(Sgf_normalized_result[22]), .A1(n78), .B0(DMP[20]), .B1(
        n81), .Y(S_A_S_Oper_A[22]) );
  INVX1TS U69 ( .A(n79), .Y(n78) );
  CLKBUFX2TS U70 ( .A(n40), .Y(n75) );
  AND2XLTS U71 ( .A(real_op), .B(n67), .Y(n40) );
  AND2XLTS U72 ( .A(Sgf_normalized_result[12]), .B(n82), .Y(n50) );
  AND2XLTS U73 ( .A(Sgf_normalized_result[13]), .B(n81), .Y(n51) );
  AND2XLTS U74 ( .A(Sgf_normalized_result[14]), .B(n82), .Y(n52) );
  AND2XLTS U75 ( .A(Sgf_normalized_result[11]), .B(n82), .Y(n48) );
  AND2XLTS U76 ( .A(Sgf_normalized_result[10]), .B(n82), .Y(n49) );
  AND2XLTS U77 ( .A(Sgf_normalized_result[15]), .B(n81), .Y(n53) );
  AND2XLTS U78 ( .A(Sgf_normalized_result[16]), .B(n80), .Y(n54) );
  AND2XLTS U79 ( .A(Sgf_normalized_result[17]), .B(n80), .Y(n57) );
  AND2XLTS U80 ( .A(Sgf_normalized_result[18]), .B(n80), .Y(n58) );
  AND2XLTS U81 ( .A(Sgf_normalized_result[20]), .B(n79), .Y(n55) );
  AND2XLTS U82 ( .A(Sgf_normalized_result[19]), .B(n80), .Y(n59) );
  AND2XLTS U83 ( .A(Sgf_normalized_result[21]), .B(n79), .Y(n56) );
  AND2XLTS U84 ( .A(Sgf_normalized_result[22]), .B(n67), .Y(n60) );
  AND2XLTS U85 ( .A(Sgf_normalized_result[23]), .B(n79), .Y(n61) );
  AO22X1TS U86 ( .A0(Sgf_normalized_result[21]), .A1(n78), .B0(DMP[19]), .B1(
        n81), .Y(S_A_S_Oper_A[21]) );
  AO22X1TS U87 ( .A0(Sgf_normalized_result[23]), .A1(n78), .B0(DMP[21]), .B1(
        n83), .Y(S_A_S_Oper_A[23]) );
  INVX2TS U88 ( .A(n82), .Y(n66) );
  CLKBUFX2TS U89 ( .A(n89), .Y(n85) );
  CLKBUFX2TS U90 ( .A(n89), .Y(n86) );
  CLKBUFX2TS U91 ( .A(n88), .Y(n87) );
  NAND2X1TS U92 ( .A(n80), .B(n65), .Y(n142) );
  INVX2TS U93 ( .A(selector_D), .Y(n65) );
  INVX2TS U94 ( .A(n75), .Y(n72) );
  INVX2TS U95 ( .A(n75), .Y(n74) );
  INVX2TS U96 ( .A(n75), .Y(n73) );
  CLKBUFX2TS U97 ( .A(FSM_Add_Subt_Sgf_load), .Y(n88) );
  CLKBUFX2TS U98 ( .A(FSM_Add_Subt_Sgf_load), .Y(n89) );
  CLKBUFX2TS U99 ( .A(n40), .Y(n76) );
  INVX2TS U100 ( .A(rst_int), .Y(n143) );
  CLKBUFX2TS U101 ( .A(FSM_op_start_in_load_a), .Y(n90) );
  CLKBUFX2TS U102 ( .A(n33), .Y(n71) );
  CLKBUFX2TS U103 ( .A(n33), .Y(n70) );
  INVX2TS U104 ( .A(n86), .Y(n68) );
  OAI2BB2XLTS U105 ( .B0(n114), .B1(n88), .A0N(Add_Subt_Sgf_module_S_to_D[23]), 
        .A1N(n87), .Y(n139) );
  AO22X1TS U106 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N53), .A1(n72), .B0(
        Add_Subt_Sgf_module_Sgf_AS_N26), .B1(n76), .Y(
        Add_Subt_Sgf_module_S_to_D[23]) );
  OAI2BB2XLTS U107 ( .B0(n113), .B1(n88), .A0N(Add_Subt_Sgf_module_S_to_D[22]), 
        .A1N(n87), .Y(n138) );
  AO22X1TS U108 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N52), .A1(n72), .B0(
        Add_Subt_Sgf_module_Sgf_AS_N25), .B1(n76), .Y(
        Add_Subt_Sgf_module_S_to_D[22]) );
  OAI2BB2XLTS U109 ( .B0(n112), .B1(n86), .A0N(Add_Subt_Sgf_module_S_to_D[21]), 
        .A1N(n89), .Y(n137) );
  AO22X1TS U110 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N51), .A1(n72), .B0(
        Add_Subt_Sgf_module_Sgf_AS_N24), .B1(n76), .Y(
        Add_Subt_Sgf_module_S_to_D[21]) );
  AO22X1TS U111 ( .A0(n66), .A1(Sgf_normalized_result[9]), .B0(DMP[7]), .B1(
        n79), .Y(S_A_S_Oper_A[9]) );
  OAI2BB2XLTS U112 ( .B0(n111), .B1(n88), .A0N(Add_Subt_Sgf_module_S_to_D[20]), 
        .A1N(FSM_Add_Subt_Sgf_load), .Y(n136) );
  AO22X1TS U113 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N50), .A1(n72), .B0(
        Add_Subt_Sgf_module_Sgf_AS_N23), .B1(n76), .Y(
        Add_Subt_Sgf_module_S_to_D[20]) );
  OAI2BB2XLTS U114 ( .B0(n110), .B1(n88), .A0N(Add_Subt_Sgf_module_S_to_D[19]), 
        .A1N(FSM_Add_Subt_Sgf_load), .Y(n135) );
  OAI2BB2XLTS U115 ( .B0(n108), .B1(n88), .A0N(Add_Subt_Sgf_module_S_to_D[17]), 
        .A1N(n89), .Y(n133) );
  OAI2BB2XLTS U116 ( .B0(n106), .B1(n86), .A0N(Add_Subt_Sgf_module_S_to_D[15]), 
        .A1N(n89), .Y(n131) );
  AO22X1TS U117 ( .A0(Sgf_normalized_result[15]), .A1(n66), .B0(DMP[13]), .B1(
        n82), .Y(S_A_S_Oper_A[15]) );
  AO22X1TS U118 ( .A0(Sgf_normalized_result[16]), .A1(n66), .B0(DMP[14]), .B1(
        n82), .Y(S_A_S_Oper_A[16]) );
  AO22X1TS U119 ( .A0(Sgf_normalized_result[17]), .A1(n66), .B0(DMP[15]), .B1(
        n80), .Y(S_A_S_Oper_A[17]) );
  OAI2BB2XLTS U120 ( .B0(n103), .B1(n86), .A0N(Add_Subt_Sgf_module_S_to_D[12]), 
        .A1N(n89), .Y(n128) );
  OAI2BB2XLTS U121 ( .B0(n101), .B1(n86), .A0N(Add_Subt_Sgf_module_S_to_D[10]), 
        .A1N(n88), .Y(n126) );
  AO22X1TS U122 ( .A0(Sgf_normalized_result[18]), .A1(n66), .B0(DMP[16]), .B1(
        n80), .Y(S_A_S_Oper_A[18]) );
  OAI2BB2XLTS U123 ( .B0(n99), .B1(n85), .A0N(Add_Subt_Sgf_module_S_to_D[8]), 
        .A1N(FSM_Add_Subt_Sgf_load), .Y(n124) );
  AO22X1TS U124 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N38), .A1(n72), .B0(
        Add_Subt_Sgf_module_Sgf_AS_N11), .B1(n77), .Y(
        Add_Subt_Sgf_module_S_to_D[8]) );
  OAI2BB2XLTS U125 ( .B0(n98), .B1(n85), .A0N(Add_Subt_Sgf_module_S_to_D[7]), 
        .A1N(n87), .Y(n123) );
  AO22X1TS U126 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N37), .A1(n72), .B0(
        Add_Subt_Sgf_module_Sgf_AS_N10), .B1(n77), .Y(
        Add_Subt_Sgf_module_S_to_D[7]) );
  AO22X1TS U127 ( .A0(Sgf_normalized_result[24]), .A1(n35), .B0(DMP[22]), .B1(
        n83), .Y(S_A_S_Oper_A[24]) );
  OAI2BB2XLTS U128 ( .B0(n93), .B1(n85), .A0N(Add_Subt_Sgf_module_S_to_D[2]), 
        .A1N(n87), .Y(n118) );
  OAI2BB2XLTS U129 ( .B0(n97), .B1(n85), .A0N(Add_Subt_Sgf_module_S_to_D[6]), 
        .A1N(n87), .Y(n122) );
  AO22X1TS U130 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N9), .A1(n75), .B0(
        Add_Subt_Sgf_module_Sgf_AS_N36), .B1(n74), .Y(
        Add_Subt_Sgf_module_S_to_D[6]) );
  OAI2BB2XLTS U131 ( .B0(n96), .B1(n85), .A0N(Add_Subt_Sgf_module_S_to_D[5]), 
        .A1N(n87), .Y(n121) );
  AO22X1TS U132 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N8), .A1(n75), .B0(
        Add_Subt_Sgf_module_Sgf_AS_N35), .B1(n74), .Y(
        Add_Subt_Sgf_module_S_to_D[5]) );
  OAI2BB2XLTS U133 ( .B0(n95), .B1(n85), .A0N(Add_Subt_Sgf_module_S_to_D[4]), 
        .A1N(n87), .Y(n120) );
  AO22X1TS U134 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N7), .A1(n75), .B0(
        Add_Subt_Sgf_module_Sgf_AS_N34), .B1(n74), .Y(
        Add_Subt_Sgf_module_S_to_D[4]) );
  OAI2BB2XLTS U135 ( .B0(n94), .B1(n85), .A0N(Add_Subt_Sgf_module_S_to_D[3]), 
        .A1N(n87), .Y(n119) );
  AO22X1TS U136 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N6), .A1(n40), .B0(
        Add_Subt_Sgf_module_Sgf_AS_N33), .B1(n74), .Y(
        Add_Subt_Sgf_module_S_to_D[3]) );
  NAND2X1TS U137 ( .A(n35), .B(n64), .Y(S_A_S_Oper_A[25]) );
  INVX2TS U138 ( .A(Sgf_normalized_result[25]), .Y(n64) );
  AND2X2TS U139 ( .A(Sgf_normalized_result[24]), .B(n79), .Y(n62) );
  AND2X2TS U140 ( .A(Sgf_normalized_result[25]), .B(n80), .Y(n63) );
  OAI2BB2XLTS U141 ( .B0(n91), .B1(n85), .A0N(n85), .A1N(
        Add_Subt_Sgf_module_S_to_D[0]), .Y(n116) );
  AO22X1TS U142 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N30), .A1(n73), .B0(
        Add_Subt_Sgf_module_Sgf_AS_N3), .B1(n76), .Y(
        Add_Subt_Sgf_module_S_to_D[0]) );
  CLKBUFX2TS U143 ( .A(n84), .Y(n67) );
  CLKBUFX2TS U144 ( .A(n84), .Y(n83) );
  CLKBUFX2TS U145 ( .A(n83), .Y(n82) );
  CLKBUFX2TS U146 ( .A(n84), .Y(n79) );
  CLKBUFX2TS U147 ( .A(n83), .Y(n80) );
  AO22X1TS U148 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N4), .A1(n40), .B0(
        Add_Subt_Sgf_module_Sgf_AS_N31), .B1(n74), .Y(
        Add_Subt_Sgf_module_S_to_D[1]) );
  AO22X1TS U149 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N5), .A1(n40), .B0(
        Add_Subt_Sgf_module_Sgf_AS_N32), .B1(n74), .Y(
        Add_Subt_Sgf_module_S_to_D[2]) );
  OAI2BB2XLTS U150 ( .B0(n92), .B1(n85), .A0N(Add_Subt_Sgf_module_S_to_D[1]), 
        .A1N(n88), .Y(n117) );
  AO22X1TS U151 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N39), .A1(n72), .B0(n77), 
        .B1(Add_Subt_Sgf_module_Sgf_AS_N12), .Y(Add_Subt_Sgf_module_S_to_D[9])
         );
  AO22X1TS U152 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N40), .A1(n73), .B0(
        Add_Subt_Sgf_module_Sgf_AS_N13), .B1(n77), .Y(
        Add_Subt_Sgf_module_S_to_D[10]) );
  OAI2BB2XLTS U153 ( .B0(n100), .B1(n86), .A0N(Add_Subt_Sgf_module_S_to_D[9]), 
        .A1N(FSM_Add_Subt_Sgf_load), .Y(n125) );
  AO22X1TS U154 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N41), .A1(n74), .B0(
        Add_Subt_Sgf_module_Sgf_AS_N14), .B1(n77), .Y(
        Add_Subt_Sgf_module_S_to_D[11]) );
  AO22X1TS U155 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N42), .A1(n73), .B0(
        Add_Subt_Sgf_module_Sgf_AS_N15), .B1(n77), .Y(
        Add_Subt_Sgf_module_S_to_D[12]) );
  OAI2BB2XLTS U156 ( .B0(n102), .B1(n86), .A0N(Add_Subt_Sgf_module_S_to_D[11]), 
        .A1N(FSM_Add_Subt_Sgf_load), .Y(n127) );
  AO22X1TS U157 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N43), .A1(n73), .B0(
        Add_Subt_Sgf_module_Sgf_AS_N16), .B1(n77), .Y(
        Add_Subt_Sgf_module_S_to_D[13]) );
  OAI2BB2XLTS U158 ( .B0(n104), .B1(n86), .A0N(Add_Subt_Sgf_module_S_to_D[13]), 
        .A1N(FSM_Add_Subt_Sgf_load), .Y(n129) );
  AO22X1TS U159 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N44), .A1(n73), .B0(
        Add_Subt_Sgf_module_Sgf_AS_N17), .B1(n76), .Y(
        Add_Subt_Sgf_module_S_to_D[14]) );
  AO22X1TS U160 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N45), .A1(n73), .B0(
        Add_Subt_Sgf_module_Sgf_AS_N18), .B1(n75), .Y(
        Add_Subt_Sgf_module_S_to_D[15]) );
  OAI2BB2XLTS U161 ( .B0(n105), .B1(n86), .A0N(Add_Subt_Sgf_module_S_to_D[14]), 
        .A1N(n87), .Y(n130) );
  AO22X1TS U162 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N46), .A1(n73), .B0(
        Add_Subt_Sgf_module_Sgf_AS_N19), .B1(n76), .Y(
        Add_Subt_Sgf_module_S_to_D[16]) );
  AO22X1TS U163 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N47), .A1(n73), .B0(
        Add_Subt_Sgf_module_Sgf_AS_N20), .B1(n76), .Y(
        Add_Subt_Sgf_module_S_to_D[17]) );
  OAI2BB2XLTS U164 ( .B0(n107), .B1(n86), .A0N(Add_Subt_Sgf_module_S_to_D[16]), 
        .A1N(n89), .Y(n132) );
  AO22X1TS U165 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N48), .A1(n73), .B0(
        Add_Subt_Sgf_module_Sgf_AS_N21), .B1(n76), .Y(
        Add_Subt_Sgf_module_S_to_D[18]) );
  AO22X1TS U166 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N49), .A1(n73), .B0(
        Add_Subt_Sgf_module_Sgf_AS_N22), .B1(n76), .Y(
        Add_Subt_Sgf_module_S_to_D[19]) );
  OAI2BB2XLTS U167 ( .B0(n109), .B1(n88), .A0N(Add_Subt_Sgf_module_S_to_D[18]), 
        .A1N(n88), .Y(n134) );
  AO22XLTS U168 ( .A0(Sgf_normalized_result[5]), .A1(n78), .B0(DMP[3]), .B1(
        n83), .Y(S_A_S_Oper_A[5]) );
  OAI2BB2X1TS U169 ( .B0(n69), .B1(n68), .A0N(Add_Subt_result[25]), .A1N(n68), 
        .Y(n141) );
endmodule

