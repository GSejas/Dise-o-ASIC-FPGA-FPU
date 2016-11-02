/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : L-2016.03-SP3
// Date      : Wed Nov  2 11:05:47 2016
/////////////////////////////////////////////////////////////


module FSM_Mult_Function ( clk, rst, beg_FSM, ack_FSM, zero_flag_i, 
        Mult_shift_i, round_flag_i, Add_Overflow_i, load_0_o, load_1_o, 
        load_2_o, load_3_o, load_4_o, load_5_o, load_6_o, ctrl_select_a_o, 
        ctrl_select_b_o, selector_b_o, ctrl_select_c_o, exp_op_o, 
        shift_value_o, rst_int, ready );
  output [1:0] selector_b_o;
  input clk, rst, beg_FSM, ack_FSM, zero_flag_i, Mult_shift_i, round_flag_i,
         Add_Overflow_i;
  output load_0_o, load_1_o, load_2_o, load_3_o, load_4_o, load_5_o, load_6_o,
         ctrl_select_a_o, ctrl_select_b_o, ctrl_select_c_o, exp_op_o,
         shift_value_o, rst_int, ready;
  wire   n8, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25,
         n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39,
         n40, n41, n3, load_1_o, n6, n12;
  wire   [3:0] state_reg;
  assign ctrl_select_a_o = load_1_o;

  DFFRX2TS state_reg_reg_3_ ( .D(n40), .CK(clk), .RN(n12), .Q(state_reg[3]), 
        .QN(n8) );
  DFFRX2TS state_reg_reg_0_ ( .D(n41), .CK(clk), .RN(n12), .Q(state_reg[0]), 
        .QN(n14) );
  DFFRX2TS state_reg_reg_2_ ( .D(n38), .CK(clk), .RN(n12), .Q(state_reg[2]) );
  DFFRX2TS state_reg_reg_1_ ( .D(n39), .CK(clk), .RN(n12), .Q(state_reg[1]), 
        .QN(n13) );
  AOI32X1TS U3 ( .A0(n36), .A1(n14), .A2(state_reg[1]), .B0(n27), .B1(
        Add_Overflow_i), .Y(n15) );
  NOR2X2TS U4 ( .A(state_reg[1]), .B(state_reg[0]), .Y(n35) );
  NOR2X2TS U5 ( .A(state_reg[2]), .B(state_reg[3]), .Y(n28) );
  NAND3X1TS U6 ( .A(n37), .B(n13), .C(state_reg[0]), .Y(n29) );
  AOI21X1TS U7 ( .A0(state_reg[1]), .A1(n36), .B0(n27), .Y(n30) );
  NAND3X1TS U8 ( .A(n36), .B(n13), .C(state_reg[0]), .Y(n21) );
  INVX2TS U9 ( .A(n19), .Y(exp_op_o) );
  INVX2TS U10 ( .A(n24), .Y(n6) );
  INVX2TS U11 ( .A(n17), .Y(rst_int) );
  NAND2X2TS U12 ( .A(n35), .B(n36), .Y(n19) );
  NAND2BX1TS U13 ( .AN(load_3_o), .B(n20), .Y(load_2_o) );
  NAND2X1TS U14 ( .A(n19), .B(n15), .Y(load_3_o) );
  INVX2TS U15 ( .A(n15), .Y(shift_value_o) );
  INVX2TS U16 ( .A(n18), .Y(ready) );
  INVX2TS U17 ( .A(n20), .Y(load_1_o) );
  NAND2X1TS U18 ( .A(n35), .B(n37), .Y(n24) );
  NAND2X1TS U19 ( .A(n35), .B(n28), .Y(n17) );
  INVX2TS U20 ( .A(n29), .Y(load_4_o) );
  NAND2X1TS U21 ( .A(n20), .B(n29), .Y(selector_b_o[0]) );
  INVX2TS U22 ( .A(n31), .Y(load_5_o) );
  INVX2TS U23 ( .A(n21), .Y(n3) );
  INVX2TS U24 ( .A(n30), .Y(load_6_o) );
  NOR2BX2TS U25 ( .AN(state_reg[2]), .B(state_reg[3]), .Y(n36) );
  OAI22X2TS U26 ( .A0(beg_FSM), .A1(n17), .B0(ack_FSM), .B1(n18), .Y(n23) );
  NAND4X1TS U27 ( .A(n19), .B(n20), .C(n21), .D(n22), .Y(n38) );
  AOI21X1TS U28 ( .A0(state_reg[2]), .A1(n23), .B0(load_5_o), .Y(n22) );
  NAND4X1TS U29 ( .A(n29), .B(n30), .C(n31), .D(n32), .Y(n40) );
  AOI221X1TS U30 ( .A0(state_reg[3]), .A1(n23), .B0(zero_flag_i), .B1(exp_op_o), .C0(n6), .Y(n32) );
  NOR2X2TS U31 ( .A(n8), .B(state_reg[2]), .Y(n37) );
  NAND3X1TS U32 ( .A(state_reg[2]), .B(state_reg[3]), .C(n35), .Y(n18) );
  AND3X2TS U33 ( .A(n37), .B(n14), .C(state_reg[1]), .Y(n27) );
  AOI21X1TS U34 ( .A0(n33), .A1(n34), .B0(n23), .Y(n41) );
  AOI211X1TS U35 ( .A0(n28), .A1(n14), .B0(n27), .C0(n6), .Y(n34) );
  OA22X1TS U36 ( .A0(n21), .A1(Mult_shift_i), .B0(n19), .B1(zero_flag_i), .Y(
        n33) );
  NAND3X2TS U37 ( .A(state_reg[0]), .B(state_reg[1]), .C(n28), .Y(n20) );
  NOR3BX1TS U38 ( .AN(n28), .B(n14), .C(state_reg[1]), .Y(load_0_o) );
  AO21X1TS U39 ( .A0(Mult_shift_i), .A1(n3), .B0(selector_b_o[0]), .Y(
        ctrl_select_b_o) );
  NAND3X1TS U40 ( .A(state_reg[1]), .B(n37), .C(state_reg[0]), .Y(n31) );
  OAI211X1TS U41 ( .A0(round_flag_i), .A1(n24), .B0(n25), .C0(n26), .Y(n39) );
  NOR3X1TS U42 ( .A(load_4_o), .B(load_0_o), .C(n27), .Y(n26) );
  AOI31X1TS U43 ( .A0(state_reg[1]), .A1(n14), .A2(n28), .B0(n3), .Y(n25) );
  NOR3BX1TS U44 ( .AN(Mult_shift_i), .B(n16), .C(n14), .Y(selector_b_o[1]) );
  NAND3X1TS U45 ( .A(n13), .B(n8), .C(state_reg[2]), .Y(n16) );
  NOR2BX1TS U46 ( .AN(round_flag_i), .B(n24), .Y(ctrl_select_c_o) );
  INVX2TS U47 ( .A(rst), .Y(n12) );
initial $sdf_annotate("FPU_Multiplication_Function_syn.sdf"); 
 endmodule


module RegisterAdd_W1_3 ( clk, rst, load, D, Q );
  input [0:0] D;
  output [0:0] Q;
  input clk, rst, load;
  wire   n1, n3, n2;

  DFFRX4TS Q_reg_0_ ( .D(n3), .CK(clk), .RN(n2), .Q(Q[0]), .QN(n1) );
  INVX2TS U2 ( .A(rst), .Y(n2) );
  OAI2BB2XLTS U3 ( .B0(n1), .B1(load), .A0N(load), .A1N(D[0]), .Y(n3) );
initial $sdf_annotate("FPU_Multiplication_Function_syn.sdf"); 
 endmodule


module RegisterAdd_W1_2 ( clk, rst, load, D, Q );
  input [0:0] D;
  output [0:0] Q;
  input clk, rst, load;
  wire   n2, n4, n5;

  DFFRX2TS Q_reg_0_ ( .D(n4), .CK(clk), .RN(n2), .Q(Q[0]), .QN(n5) );
  INVX2TS U2 ( .A(rst), .Y(n2) );
  OAI2BB2XLTS U3 ( .B0(n5), .B1(load), .A0N(load), .A1N(D[0]), .Y(n4) );
initial $sdf_annotate("FPU_Multiplication_Function_syn.sdf"); 
 endmodule


module RegisterAdd_W2 ( clk, rst, load, D, Q );
  input [1:0] D;
  output [1:0] Q;
  input clk, rst, load;
  wire   n1, n2, n3, n5, n4;

  DFFRX4TS Q_reg_1_ ( .D(n5), .CK(clk), .RN(n4), .Q(Q[1]), .QN(n2) );
  DFFRX4TS Q_reg_0_ ( .D(n3), .CK(clk), .RN(n4), .Q(Q[0]), .QN(n1) );
  INVX2TS U2 ( .A(rst), .Y(n4) );
  OAI2BB2XLTS U3 ( .B0(n1), .B1(load), .A0N(load), .A1N(D[0]), .Y(n3) );
  OAI2BB2XLTS U4 ( .B0(n2), .B1(load), .A0N(D[1]), .A1N(load), .Y(n5) );
initial $sdf_annotate("FPU_Multiplication_Function_syn.sdf"); 
 endmodule


module RegisterMult_W32_1 ( clk, rst, load, D, Q );
  input [31:0] D;
  output [31:0] Q;
  input clk, rst, load;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n65, n64, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76;

  DFFRX2TS Q_reg_11_ ( .D(n44), .CK(clk), .RN(n66), .Q(Q[11]), .QN(n12) );
  DFFRX2TS Q_reg_10_ ( .D(n43), .CK(clk), .RN(n66), .Q(Q[10]), .QN(n11) );
  DFFRX2TS Q_reg_9_ ( .D(n42), .CK(clk), .RN(n64), .Q(Q[9]), .QN(n10) );
  DFFRX2TS Q_reg_7_ ( .D(n40), .CK(clk), .RN(n64), .Q(Q[7]), .QN(n8) );
  DFFRX2TS Q_reg_6_ ( .D(n39), .CK(clk), .RN(n64), .Q(Q[6]), .QN(n7) );
  DFFRX2TS Q_reg_4_ ( .D(n37), .CK(clk), .RN(n64), .Q(Q[4]), .QN(n5) );
  DFFRX2TS Q_reg_0_ ( .D(n33), .CK(clk), .RN(n64), .Q(Q[0]), .QN(n1) );
  DFFRX2TS Q_reg_31_ ( .D(n65), .CK(clk), .RN(n76), .Q(Q[31]), .QN(n32) );
  DFFRX2TS Q_reg_5_ ( .D(n38), .CK(clk), .RN(n64), .Q(Q[5]), .QN(n6) );
  DFFRX2TS Q_reg_22_ ( .D(n55), .CK(clk), .RN(n67), .Q(Q[22]), .QN(n23) );
  DFFRX2TS Q_reg_21_ ( .D(n54), .CK(clk), .RN(n67), .Q(Q[21]), .QN(n22) );
  DFFRX2TS Q_reg_20_ ( .D(n53), .CK(clk), .RN(n67), .Q(Q[20]), .QN(n21) );
  DFFRX2TS Q_reg_19_ ( .D(n52), .CK(clk), .RN(n66), .Q(Q[19]), .QN(n20) );
  DFFRX2TS Q_reg_18_ ( .D(n51), .CK(clk), .RN(n66), .Q(Q[18]), .QN(n19) );
  DFFRX2TS Q_reg_17_ ( .D(n50), .CK(clk), .RN(n66), .Q(Q[17]), .QN(n18) );
  DFFRX2TS Q_reg_16_ ( .D(n49), .CK(clk), .RN(n66), .Q(Q[16]), .QN(n17) );
  DFFRX2TS Q_reg_15_ ( .D(n48), .CK(clk), .RN(n66), .Q(Q[15]), .QN(n16) );
  DFFRX2TS Q_reg_14_ ( .D(n47), .CK(clk), .RN(n66), .Q(Q[14]), .QN(n15) );
  DFFRX2TS Q_reg_13_ ( .D(n46), .CK(clk), .RN(n66), .Q(Q[13]), .QN(n14) );
  DFFRX2TS Q_reg_12_ ( .D(n45), .CK(clk), .RN(n66), .Q(Q[12]), .QN(n13) );
  DFFRX2TS Q_reg_8_ ( .D(n41), .CK(clk), .RN(n64), .Q(Q[8]), .QN(n9) );
  DFFRX2TS Q_reg_3_ ( .D(n36), .CK(clk), .RN(n64), .Q(Q[3]), .QN(n4) );
  DFFRX2TS Q_reg_2_ ( .D(n35), .CK(clk), .RN(n64), .Q(Q[2]), .QN(n3) );
  DFFRX2TS Q_reg_1_ ( .D(n34), .CK(clk), .RN(n64), .Q(Q[1]), .QN(n2) );
  DFFRX2TS Q_reg_30_ ( .D(n63), .CK(clk), .RN(n76), .Q(Q[30]), .QN(n31) );
  DFFRX2TS Q_reg_29_ ( .D(n62), .CK(clk), .RN(n67), .Q(Q[29]), .QN(n30) );
  DFFRX2TS Q_reg_27_ ( .D(n60), .CK(clk), .RN(n67), .Q(Q[27]), .QN(n28) );
  DFFRX2TS Q_reg_26_ ( .D(n59), .CK(clk), .RN(n67), .Q(Q[26]), .QN(n27) );
  DFFRX2TS Q_reg_28_ ( .D(n61), .CK(clk), .RN(n67), .Q(Q[28]), .QN(n29) );
  DFFRX2TS Q_reg_25_ ( .D(n58), .CK(clk), .RN(n67), .Q(Q[25]), .QN(n26) );
  DFFRX2TS Q_reg_24_ ( .D(n57), .CK(clk), .RN(n67), .Q(Q[24]), .QN(n25) );
  DFFRX2TS Q_reg_23_ ( .D(n56), .CK(clk), .RN(n67), .Q(Q[23]), .QN(n24) );
  BUFX3TS U2 ( .A(n75), .Y(n70) );
  BUFX3TS U3 ( .A(n75), .Y(n71) );
  BUFX3TS U4 ( .A(n74), .Y(n72) );
  CLKBUFX2TS U5 ( .A(n74), .Y(n73) );
  BUFX3TS U6 ( .A(n76), .Y(n64) );
  BUFX3TS U7 ( .A(n76), .Y(n66) );
  BUFX3TS U8 ( .A(n76), .Y(n67) );
  CLKBUFX2TS U9 ( .A(n68), .Y(n75) );
  CLKBUFX2TS U10 ( .A(n68), .Y(n74) );
  BUFX3TS U11 ( .A(n74), .Y(n69) );
  INVX2TS U12 ( .A(rst), .Y(n76) );
  CLKBUFX2TS U13 ( .A(load), .Y(n68) );
  OAI2BB2XLTS U14 ( .B0(n1), .B1(n70), .A0N(n73), .A1N(D[0]), .Y(n33) );
  OAI2BB2XLTS U15 ( .B0(n3), .B1(n70), .A0N(D[2]), .A1N(n72), .Y(n35) );
  OAI2BB2XLTS U16 ( .B0(n2), .B1(n75), .A0N(D[1]), .A1N(n73), .Y(n34) );
  OAI2BB2XLTS U17 ( .B0(n4), .B1(n75), .A0N(D[3]), .A1N(n72), .Y(n36) );
  OAI2BB2XLTS U18 ( .B0(n5), .B1(n75), .A0N(D[4]), .A1N(n72), .Y(n37) );
  OAI2BB2XLTS U19 ( .B0(n6), .B1(n68), .A0N(D[5]), .A1N(n71), .Y(n38) );
  OAI2BB2XLTS U20 ( .B0(n7), .B1(load), .A0N(D[6]), .A1N(n71), .Y(n39) );
  OAI2BB2XLTS U21 ( .B0(n8), .B1(n68), .A0N(D[7]), .A1N(n71), .Y(n40) );
  OAI2BB2XLTS U22 ( .B0(n9), .B1(n74), .A0N(D[8]), .A1N(n70), .Y(n41) );
  OAI2BB2XLTS U23 ( .B0(n10), .B1(n74), .A0N(D[9]), .A1N(n71), .Y(n42) );
  OAI2BB2XLTS U24 ( .B0(n11), .B1(n74), .A0N(D[10]), .A1N(n70), .Y(n43) );
  OAI2BB2XLTS U25 ( .B0(n12), .B1(n73), .A0N(D[11]), .A1N(n70), .Y(n44) );
  OAI2BB2XLTS U26 ( .B0(n13), .B1(n75), .A0N(D[12]), .A1N(n70), .Y(n45) );
  OAI2BB2XLTS U27 ( .B0(n14), .B1(n73), .A0N(D[13]), .A1N(n70), .Y(n46) );
  OAI2BB2XLTS U28 ( .B0(n15), .B1(n75), .A0N(D[14]), .A1N(n70), .Y(n47) );
  OAI2BB2XLTS U29 ( .B0(n16), .B1(n74), .A0N(D[15]), .A1N(n71), .Y(n48) );
  OAI2BB2XLTS U30 ( .B0(n17), .B1(load), .A0N(D[16]), .A1N(n70), .Y(n49) );
  OAI2BB2XLTS U31 ( .B0(n18), .B1(load), .A0N(D[17]), .A1N(n70), .Y(n50) );
  OAI2BB2XLTS U32 ( .B0(n19), .B1(load), .A0N(D[18]), .A1N(n71), .Y(n51) );
  OAI2BB2XLTS U33 ( .B0(n20), .B1(n68), .A0N(D[19]), .A1N(n71), .Y(n52) );
  OAI2BB2XLTS U34 ( .B0(n21), .B1(n68), .A0N(D[20]), .A1N(n71), .Y(n53) );
  OAI2BB2XLTS U35 ( .B0(n22), .B1(n69), .A0N(D[21]), .A1N(n72), .Y(n54) );
  OAI2BB2XLTS U36 ( .B0(n23), .B1(n69), .A0N(D[22]), .A1N(n71), .Y(n55) );
  OAI2BB2XLTS U37 ( .B0(n24), .B1(n69), .A0N(D[23]), .A1N(n71), .Y(n56) );
  OAI2BB2XLTS U38 ( .B0(n25), .B1(n69), .A0N(D[24]), .A1N(n72), .Y(n57) );
  OAI2BB2XLTS U39 ( .B0(n26), .B1(n69), .A0N(D[25]), .A1N(n72), .Y(n58) );
  OAI2BB2XLTS U40 ( .B0(n27), .B1(n69), .A0N(D[26]), .A1N(n72), .Y(n59) );
  OAI2BB2XLTS U41 ( .B0(n28), .B1(n69), .A0N(D[27]), .A1N(n72), .Y(n60) );
  OAI2BB2XLTS U42 ( .B0(n29), .B1(n69), .A0N(D[28]), .A1N(n72), .Y(n61) );
  OAI2BB2XLTS U43 ( .B0(n30), .B1(n69), .A0N(D[29]), .A1N(n72), .Y(n62) );
  OAI2BB2XLTS U44 ( .B0(n31), .B1(n69), .A0N(D[30]), .A1N(n73), .Y(n63) );
  OAI2BB2XLTS U45 ( .B0(n32), .B1(n68), .A0N(D[31]), .A1N(n73), .Y(n65) );
initial $sdf_annotate("FPU_Multiplication_Function_syn.sdf"); 
 endmodule


module RegisterMult_W32_0 ( clk, rst, load, D, Q );
  input [31:0] D;
  output [31:0] Q;
  input clk, rst, load;
  wire   n64, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78,
         n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92,
         n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105,
         n106, n107, n108, n109, n110, n111, n112, n113, n114, n115, n116,
         n117, n118, n119, n120, n121, n122, n123, n124, n125, n126, n127,
         n128, n129, n130, n131, n132, n133, n134, n135, n136, n137, n138,
         n139, n140, n141;

  DFFRX2TS Q_reg_31_ ( .D(n78), .CK(clk), .RN(n77), .Q(Q[31]), .QN(n110) );
  DFFRX2TS Q_reg_11_ ( .D(n98), .CK(clk), .RN(n66), .Q(Q[11]), .QN(n130) );
  DFFRX2TS Q_reg_10_ ( .D(n99), .CK(clk), .RN(n66), .Q(Q[10]), .QN(n131) );
  DFFRX2TS Q_reg_9_ ( .D(n100), .CK(clk), .RN(n64), .Q(Q[9]), .QN(n132) );
  DFFRX2TS Q_reg_7_ ( .D(n102), .CK(clk), .RN(n64), .Q(Q[7]), .QN(n134) );
  DFFRX2TS Q_reg_6_ ( .D(n103), .CK(clk), .RN(n64), .Q(Q[6]), .QN(n135) );
  DFFRX2TS Q_reg_5_ ( .D(n104), .CK(clk), .RN(n64), .Q(Q[5]), .QN(n136) );
  DFFRX2TS Q_reg_4_ ( .D(n105), .CK(clk), .RN(n64), .Q(Q[4]), .QN(n137) );
  DFFRX2TS Q_reg_0_ ( .D(n109), .CK(clk), .RN(n64), .Q(Q[0]), .QN(n141) );
  DFFRX2TS Q_reg_22_ ( .D(n87), .CK(clk), .RN(n67), .Q(Q[22]), .QN(n119) );
  DFFRX2TS Q_reg_21_ ( .D(n88), .CK(clk), .RN(n67), .Q(Q[21]), .QN(n120) );
  DFFRX2TS Q_reg_20_ ( .D(n89), .CK(clk), .RN(n67), .Q(Q[20]), .QN(n121) );
  DFFRX2TS Q_reg_19_ ( .D(n90), .CK(clk), .RN(n66), .Q(Q[19]), .QN(n122) );
  DFFRX2TS Q_reg_18_ ( .D(n91), .CK(clk), .RN(n66), .Q(Q[18]), .QN(n123) );
  DFFRX2TS Q_reg_17_ ( .D(n92), .CK(clk), .RN(n66), .Q(Q[17]), .QN(n124) );
  DFFRX2TS Q_reg_16_ ( .D(n93), .CK(clk), .RN(n66), .Q(Q[16]), .QN(n125) );
  DFFRX2TS Q_reg_15_ ( .D(n94), .CK(clk), .RN(n66), .Q(Q[15]), .QN(n126) );
  DFFRX2TS Q_reg_14_ ( .D(n95), .CK(clk), .RN(n66), .Q(Q[14]), .QN(n127) );
  DFFRX2TS Q_reg_13_ ( .D(n96), .CK(clk), .RN(n66), .Q(Q[13]), .QN(n128) );
  DFFRX2TS Q_reg_12_ ( .D(n97), .CK(clk), .RN(n66), .Q(Q[12]), .QN(n129) );
  DFFRX2TS Q_reg_8_ ( .D(n101), .CK(clk), .RN(n64), .Q(Q[8]), .QN(n133) );
  DFFRX2TS Q_reg_3_ ( .D(n106), .CK(clk), .RN(n64), .Q(Q[3]), .QN(n138) );
  DFFRX2TS Q_reg_2_ ( .D(n107), .CK(clk), .RN(n64), .Q(Q[2]), .QN(n139) );
  DFFRX2TS Q_reg_1_ ( .D(n108), .CK(clk), .RN(n64), .Q(Q[1]), .QN(n140) );
  DFFRX2TS Q_reg_30_ ( .D(n79), .CK(clk), .RN(n77), .Q(Q[30]), .QN(n111) );
  DFFRX2TS Q_reg_29_ ( .D(n80), .CK(clk), .RN(n67), .Q(Q[29]), .QN(n112) );
  DFFRX2TS Q_reg_28_ ( .D(n81), .CK(clk), .RN(n67), .Q(Q[28]), .QN(n113) );
  DFFRX2TS Q_reg_27_ ( .D(n82), .CK(clk), .RN(n67), .Q(Q[27]), .QN(n114) );
  DFFRX2TS Q_reg_26_ ( .D(n83), .CK(clk), .RN(n67), .Q(Q[26]), .QN(n115) );
  DFFRX2TS Q_reg_24_ ( .D(n85), .CK(clk), .RN(n67), .Q(Q[24]), .QN(n117) );
  DFFRX2TS Q_reg_23_ ( .D(n86), .CK(clk), .RN(n67), .Q(Q[23]), .QN(n118) );
  DFFRX2TS Q_reg_25_ ( .D(n84), .CK(clk), .RN(n67), .Q(Q[25]), .QN(n116) );
  BUFX3TS U2 ( .A(n75), .Y(n70) );
  BUFX3TS U3 ( .A(n75), .Y(n71) );
  BUFX3TS U4 ( .A(n74), .Y(n72) );
  CLKBUFX2TS U5 ( .A(n74), .Y(n73) );
  BUFX3TS U6 ( .A(n77), .Y(n64) );
  BUFX3TS U7 ( .A(n77), .Y(n66) );
  BUFX3TS U8 ( .A(n77), .Y(n67) );
  CLKBUFX2TS U9 ( .A(n68), .Y(n75) );
  CLKBUFX2TS U10 ( .A(n68), .Y(n74) );
  BUFX3TS U11 ( .A(n76), .Y(n69) );
  CLKBUFX2TS U12 ( .A(load), .Y(n76) );
  INVX2TS U13 ( .A(rst), .Y(n77) );
  CLKBUFX2TS U14 ( .A(load), .Y(n68) );
  OAI2BB2XLTS U15 ( .B0(n141), .B1(n71), .A0N(n73), .A1N(D[0]), .Y(n109) );
  OAI2BB2XLTS U16 ( .B0(n139), .B1(n71), .A0N(D[2]), .A1N(n72), .Y(n107) );
  OAI2BB2XLTS U17 ( .B0(n140), .B1(n75), .A0N(D[1]), .A1N(n73), .Y(n108) );
  OAI2BB2XLTS U18 ( .B0(n138), .B1(n68), .A0N(D[3]), .A1N(n72), .Y(n106) );
  OAI2BB2XLTS U19 ( .B0(n137), .B1(n68), .A0N(D[4]), .A1N(n72), .Y(n105) );
  OAI2BB2XLTS U20 ( .B0(n136), .B1(n73), .A0N(D[5]), .A1N(n75), .Y(n104) );
  OAI2BB2XLTS U21 ( .B0(n135), .B1(n68), .A0N(D[6]), .A1N(n76), .Y(n103) );
  OAI2BB2XLTS U22 ( .B0(n134), .B1(n73), .A0N(D[7]), .A1N(n74), .Y(n102) );
  OAI2BB2XLTS U23 ( .B0(n133), .B1(n68), .A0N(D[8]), .A1N(n71), .Y(n101) );
  OAI2BB2XLTS U24 ( .B0(n132), .B1(n73), .A0N(D[9]), .A1N(n75), .Y(n100) );
  OAI2BB2XLTS U25 ( .B0(n131), .B1(n74), .A0N(D[10]), .A1N(n71), .Y(n99) );
  OAI2BB2XLTS U26 ( .B0(n130), .B1(n70), .A0N(D[11]), .A1N(n71), .Y(n98) );
  OAI2BB2XLTS U27 ( .B0(n129), .B1(n70), .A0N(D[12]), .A1N(n71), .Y(n97) );
  OAI2BB2XLTS U28 ( .B0(n128), .B1(n70), .A0N(D[13]), .A1N(n71), .Y(n96) );
  OAI2BB2XLTS U29 ( .B0(n127), .B1(n70), .A0N(D[14]), .A1N(n71), .Y(n95) );
  OAI2BB2XLTS U30 ( .B0(n126), .B1(n68), .A0N(D[15]), .A1N(n75), .Y(n94) );
  OAI2BB2XLTS U31 ( .B0(n125), .B1(n70), .A0N(D[16]), .A1N(n71), .Y(n93) );
  OAI2BB2XLTS U32 ( .B0(n124), .B1(n70), .A0N(D[17]), .A1N(n71), .Y(n92) );
  OAI2BB2XLTS U33 ( .B0(n123), .B1(n70), .A0N(D[18]), .A1N(n76), .Y(n91) );
  OAI2BB2XLTS U34 ( .B0(n122), .B1(n70), .A0N(D[19]), .A1N(n76), .Y(n90) );
  OAI2BB2XLTS U35 ( .B0(n121), .B1(n70), .A0N(D[20]), .A1N(n76), .Y(n89) );
  OAI2BB2XLTS U36 ( .B0(n120), .B1(n69), .A0N(D[21]), .A1N(n72), .Y(n88) );
  OAI2BB2XLTS U37 ( .B0(n119), .B1(n69), .A0N(D[22]), .A1N(n76), .Y(n87) );
  OAI2BB2XLTS U38 ( .B0(n118), .B1(n69), .A0N(D[23]), .A1N(n76), .Y(n86) );
  OAI2BB2XLTS U39 ( .B0(n117), .B1(n69), .A0N(D[24]), .A1N(n72), .Y(n85) );
  OAI2BB2XLTS U40 ( .B0(n116), .B1(n69), .A0N(D[25]), .A1N(n72), .Y(n84) );
  OAI2BB2XLTS U41 ( .B0(n115), .B1(n69), .A0N(D[26]), .A1N(n72), .Y(n83) );
  OAI2BB2XLTS U42 ( .B0(n114), .B1(n69), .A0N(D[27]), .A1N(n72), .Y(n82) );
  OAI2BB2XLTS U43 ( .B0(n113), .B1(n69), .A0N(D[28]), .A1N(n72), .Y(n81) );
  OAI2BB2XLTS U44 ( .B0(n112), .B1(n69), .A0N(D[29]), .A1N(n72), .Y(n80) );
  OAI2BB2XLTS U45 ( .B0(n111), .B1(n69), .A0N(D[30]), .A1N(n73), .Y(n79) );
  OAI2BB2XLTS U46 ( .B0(n110), .B1(n70), .A0N(D[31]), .A1N(n73), .Y(n78) );
initial $sdf_annotate("FPU_Multiplication_Function_syn.sdf"); 
 endmodule


module First_Phase_M_W32 ( clk, rst, load, Data_MX, Data_MY, Op_MX, Op_MY );
  input [31:0] Data_MX;
  input [31:0] Data_MY;
  output [31:0] Op_MX;
  output [31:0] Op_MY;
  input clk, rst, load;
  wire   n1;

  RegisterMult_W32_1 XMRegister ( .clk(clk), .rst(rst), .load(n1), .D(Data_MX), 
        .Q(Op_MX) );
  RegisterMult_W32_0 YMRegister ( .clk(clk), .rst(rst), .load(n1), .D(Data_MY), 
        .Q(Op_MY) );
  CLKBUFX2TS U1 ( .A(load), .Y(n1) );
initial $sdf_annotate("FPU_Multiplication_Function_syn.sdf"); 
 endmodule


module Comparator_Equal_S31_1 ( Data_A, Data_B, equal_sgn );
  input [30:0] Data_A;
  input [30:0] Data_B;
  output equal_sgn;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40;

  NAND4X1TS U1 ( .A(n21), .B(n22), .C(n23), .D(n24), .Y(n1) );
  NOR4X1TS U2 ( .A(n37), .B(n38), .C(n39), .D(n40), .Y(n21) );
  NOR4X1TS U3 ( .A(n33), .B(n34), .C(n35), .D(n36), .Y(n22) );
  NOR4X1TS U4 ( .A(n25), .B(n26), .C(n27), .D(n28), .Y(n24) );
  NOR4X1TS U5 ( .A(n17), .B(n18), .C(n19), .D(n20), .Y(n16) );
  XOR2X1TS U6 ( .A(Data_B[1]), .B(Data_A[1]), .Y(n17) );
  XOR2X1TS U7 ( .A(Data_B[2]), .B(Data_A[2]), .Y(n18) );
  XOR2X1TS U8 ( .A(Data_B[3]), .B(Data_A[3]), .Y(n19) );
  NOR4X1TS U9 ( .A(n29), .B(n30), .C(n31), .D(n32), .Y(n23) );
  XOR2X1TS U10 ( .A(Data_B[18]), .B(Data_A[18]), .Y(n29) );
  XOR2X1TS U11 ( .A(Data_B[17]), .B(Data_A[17]), .Y(n30) );
  XOR2X1TS U12 ( .A(Data_B[16]), .B(Data_A[16]), .Y(n31) );
  XNOR2X1TS U13 ( .A(Data_B[5]), .B(Data_A[5]), .Y(n8) );
  XOR2X1TS U14 ( .A(Data_B[19]), .B(Data_A[19]), .Y(n28) );
  XOR2X1TS U15 ( .A(Data_B[12]), .B(Data_A[12]), .Y(n36) );
  XOR2X1TS U16 ( .A(Data_B[8]), .B(Data_A[8]), .Y(n40) );
  XOR2X1TS U17 ( .A(Data_B[24]), .B(Data_A[24]), .Y(n20) );
  XOR2X1TS U18 ( .A(Data_B[23]), .B(Data_A[23]), .Y(n32) );
  XOR2X1TS U19 ( .A(Data_B[22]), .B(Data_A[22]), .Y(n33) );
  XOR2X1TS U20 ( .A(Data_B[13]), .B(Data_A[13]), .Y(n37) );
  XOR2X1TS U21 ( .A(Data_B[28]), .B(Data_A[28]), .Y(n25) );
  XOR2X1TS U22 ( .A(Data_B[20]), .B(Data_A[20]), .Y(n35) );
  XOR2X1TS U23 ( .A(Data_B[15]), .B(Data_A[15]), .Y(n39) );
  XOR2X1TS U24 ( .A(Data_B[29]), .B(Data_A[29]), .Y(n27) );
  XOR2X1TS U25 ( .A(Data_B[21]), .B(Data_A[21]), .Y(n34) );
  XOR2X1TS U26 ( .A(Data_B[14]), .B(Data_A[14]), .Y(n38) );
  XOR2X1TS U27 ( .A(Data_B[30]), .B(Data_A[30]), .Y(n26) );
  NAND4X1TS U28 ( .A(n5), .B(n6), .C(n7), .D(n8), .Y(n4) );
  XNOR2X1TS U29 ( .A(Data_B[0]), .B(Data_A[0]), .Y(n5) );
  XNOR2X1TS U30 ( .A(Data_B[7]), .B(Data_A[7]), .Y(n6) );
  XNOR2X1TS U31 ( .A(Data_B[6]), .B(Data_A[6]), .Y(n7) );
  NAND4X1TS U32 ( .A(n13), .B(n14), .C(n15), .D(n16), .Y(n2) );
  XNOR2X1TS U33 ( .A(Data_B[25]), .B(Data_A[25]), .Y(n13) );
  XNOR2X1TS U34 ( .A(Data_B[27]), .B(Data_A[27]), .Y(n14) );
  XNOR2X1TS U35 ( .A(Data_B[26]), .B(Data_A[26]), .Y(n15) );
  NOR4X1TS U36 ( .A(n1), .B(n2), .C(n3), .D(n4), .Y(equal_sgn) );
  XNOR2X1TS U37 ( .A(Data_B[9]), .B(Data_A[9]), .Y(n12) );
  NAND4X1TS U38 ( .A(n9), .B(n10), .C(n11), .D(n12), .Y(n3) );
  XNOR2X1TS U39 ( .A(Data_B[4]), .B(Data_A[4]), .Y(n9) );
  XNOR2X1TS U40 ( .A(Data_B[11]), .B(Data_A[11]), .Y(n10) );
  XNOR2X1TS U41 ( .A(Data_B[10]), .B(Data_A[10]), .Y(n11) );
initial $sdf_annotate("FPU_Multiplication_Function_syn.sdf"); 
 endmodule


module Comparator_Equal_S31_0 ( Data_A, Data_B, equal_sgn );
  input [30:0] Data_A;
  input [30:0] Data_B;
  output equal_sgn;
  wire   n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54,
         n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68,
         n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80;

  NAND4X1TS U1 ( .A(n60), .B(n59), .C(n58), .D(n57), .Y(n80) );
  NOR4X1TS U2 ( .A(n44), .B(n43), .C(n42), .D(n41), .Y(n60) );
  NOR4X1TS U3 ( .A(n48), .B(n47), .C(n46), .D(n45), .Y(n59) );
  NOR4X1TS U4 ( .A(n56), .B(n55), .C(n54), .D(n53), .Y(n57) );
  NOR4X1TS U5 ( .A(n64), .B(n63), .C(n62), .D(n61), .Y(n65) );
  XOR2X1TS U6 ( .A(Data_B[1]), .B(Data_A[1]), .Y(n64) );
  XOR2X1TS U7 ( .A(Data_B[2]), .B(Data_A[2]), .Y(n63) );
  XOR2X1TS U8 ( .A(Data_B[3]), .B(Data_A[3]), .Y(n62) );
  NOR4X1TS U9 ( .A(n52), .B(n51), .C(n50), .D(n49), .Y(n58) );
  XOR2X1TS U10 ( .A(Data_B[18]), .B(Data_A[18]), .Y(n52) );
  XOR2X1TS U11 ( .A(Data_B[17]), .B(Data_A[17]), .Y(n51) );
  XOR2X1TS U12 ( .A(Data_B[16]), .B(Data_A[16]), .Y(n50) );
  XOR2X1TS U13 ( .A(Data_B[19]), .B(Data_A[19]), .Y(n53) );
  XOR2X1TS U14 ( .A(Data_B[12]), .B(Data_A[12]), .Y(n45) );
  XOR2X1TS U15 ( .A(Data_B[8]), .B(Data_A[8]), .Y(n41) );
  XOR2X1TS U16 ( .A(Data_B[22]), .B(Data_A[22]), .Y(n48) );
  XOR2X1TS U17 ( .A(Data_B[13]), .B(Data_A[13]), .Y(n44) );
  XOR2X1TS U18 ( .A(Data_B[24]), .B(Data_A[24]), .Y(n61) );
  XOR2X1TS U19 ( .A(Data_B[23]), .B(Data_A[23]), .Y(n49) );
  XOR2X1TS U20 ( .A(Data_B[28]), .B(Data_A[28]), .Y(n56) );
  XOR2X1TS U21 ( .A(Data_B[20]), .B(Data_A[20]), .Y(n46) );
  XOR2X1TS U22 ( .A(Data_B[15]), .B(Data_A[15]), .Y(n42) );
  XOR2X1TS U23 ( .A(Data_B[29]), .B(Data_A[29]), .Y(n54) );
  XOR2X1TS U24 ( .A(Data_B[21]), .B(Data_A[21]), .Y(n47) );
  XOR2X1TS U25 ( .A(Data_B[14]), .B(Data_A[14]), .Y(n43) );
  XOR2X1TS U26 ( .A(Data_B[30]), .B(Data_A[30]), .Y(n55) );
  NAND4X1TS U27 ( .A(n68), .B(n67), .C(n66), .D(n65), .Y(n79) );
  XNOR2X1TS U28 ( .A(Data_B[25]), .B(Data_A[25]), .Y(n68) );
  XNOR2X1TS U29 ( .A(Data_B[27]), .B(Data_A[27]), .Y(n67) );
  XNOR2X1TS U30 ( .A(Data_B[26]), .B(Data_A[26]), .Y(n66) );
  NOR4X1TS U31 ( .A(n80), .B(n79), .C(n78), .D(n77), .Y(equal_sgn) );
  NAND4X1TS U32 ( .A(n76), .B(n75), .C(n74), .D(n73), .Y(n77) );
  XNOR2X1TS U33 ( .A(Data_B[0]), .B(Data_A[0]), .Y(n76) );
  XNOR2X1TS U34 ( .A(Data_B[7]), .B(Data_A[7]), .Y(n75) );
  XNOR2X1TS U35 ( .A(Data_B[6]), .B(Data_A[6]), .Y(n74) );
  NAND4X1TS U36 ( .A(n72), .B(n71), .C(n70), .D(n69), .Y(n78) );
  XNOR2X1TS U37 ( .A(Data_B[4]), .B(Data_A[4]), .Y(n72) );
  XNOR2X1TS U38 ( .A(Data_B[11]), .B(Data_A[11]), .Y(n71) );
  XNOR2X1TS U39 ( .A(Data_B[10]), .B(Data_A[10]), .Y(n70) );
  XNOR2X1TS U40 ( .A(Data_B[5]), .B(Data_A[5]), .Y(n73) );
  XNOR2X1TS U41 ( .A(Data_B[9]), .B(Data_A[9]), .Y(n69) );
initial $sdf_annotate("FPU_Multiplication_Function_syn.sdf"); 
 endmodule


module RegisterAdd_W1_1 ( clk, rst, load, D, Q );
  input [0:0] D;
  output [0:0] Q;
  input clk, rst, load;
  wire   n2, n4, n5;

  DFFRX2TS Q_reg_0_ ( .D(n4), .CK(clk), .RN(n2), .Q(Q[0]), .QN(n5) );
  INVX2TS U2 ( .A(rst), .Y(n2) );
  OAI2BB2XLTS U3 ( .B0(n5), .B1(load), .A0N(load), .A1N(D[0]), .Y(n4) );
initial $sdf_annotate("FPU_Multiplication_Function_syn.sdf"); 
 endmodule


module Zero_InfMult_Unit_W32 ( clk, rst, load, Data_A, Data_B, zero_m_flag );
  input [30:0] Data_A;
  input [30:0] Data_B;
  input clk, rst, load;
  output zero_m_flag;
  wire   or_1, or_2, zero_reg;

  Comparator_Equal_S31_1 Data_A_Comp ( .Data_A(Data_A), .Data_B({1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .equal_sgn(or_1) );
  Comparator_Equal_S31_0 Data_B_Comp ( .Data_A({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0}), .Data_B(Data_B), .equal_sgn(or_2) );
  RegisterAdd_W1_1 Zero_Info_Mult ( .clk(clk), .rst(rst), .load(load), .D(
        zero_reg), .Q(zero_m_flag) );
  OR2X2TS U2 ( .A(or_1), .B(or_2), .Y(zero_reg) );
initial $sdf_annotate("FPU_Multiplication_Function_syn.sdf"); 
 endmodule


module Multiplexer_AC_W9 ( ctrl, D0, D1, S );
  input [8:0] D0;
  input [8:0] D1;
  output [8:0] S;
  input ctrl;
  wire   n1;

  INVX4TS U1 ( .A(ctrl), .Y(n1) );
  AO22XLTS U2 ( .A0(D1[1]), .A1(ctrl), .B0(D0[1]), .B1(n1), .Y(S[1]) );
  AO22XLTS U3 ( .A0(D1[2]), .A1(ctrl), .B0(D0[2]), .B1(n1), .Y(S[2]) );
  AO22XLTS U4 ( .A0(D1[3]), .A1(ctrl), .B0(D0[3]), .B1(n1), .Y(S[3]) );
  AO22XLTS U5 ( .A0(D1[4]), .A1(ctrl), .B0(D0[4]), .B1(n1), .Y(S[4]) );
  AO22XLTS U6 ( .A0(D1[5]), .A1(ctrl), .B0(D0[5]), .B1(n1), .Y(S[5]) );
  AO22XLTS U7 ( .A0(D1[6]), .A1(ctrl), .B0(D0[6]), .B1(n1), .Y(S[6]) );
  AO22XLTS U8 ( .A0(D1[7]), .A1(ctrl), .B0(D0[7]), .B1(n1), .Y(S[7]) );
  AO22XLTS U9 ( .A0(ctrl), .A1(D1[8]), .B0(D0[8]), .B1(n1), .Y(S[8]) );
  AO22X2TS U10 ( .A0(D1[0]), .A1(ctrl), .B0(D0[0]), .B1(n1), .Y(S[0]) );
initial $sdf_annotate("FPU_Multiplication_Function_syn.sdf"); 
 endmodule


module Mux_3x1_W8 ( ctrl, D0, D1, D2, S );
  input [1:0] ctrl;
  input [7:0] D0;
  input [7:0] D1;
  input [7:0] D2;
  output [7:0] S;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13;

  NOR2BX4TS U18 ( .AN(ctrl[0]), .B(ctrl[1]), .Y(n4) );
  NOR2BX4TS U19 ( .AN(ctrl[1]), .B(ctrl[0]), .Y(n3) );
  AND2X2TS U2 ( .A(D1[2]), .B(n4), .Y(n13) );
  AOI22X2TS U3 ( .A0(D2[0]), .A1(n3), .B0(D1[0]), .B1(n4), .Y(n11) );
  OAI2BB1X1TS U4 ( .A0N(D0[2]), .A1N(n1), .B0(n9), .Y(S[2]) );
  NOR2X1TS U5 ( .A(n12), .B(n13), .Y(n9) );
  AOI22X1TS U6 ( .A0(D2[1]), .A1(n3), .B0(D1[1]), .B1(n4), .Y(n10) );
  AND2X1TS U7 ( .A(D2[2]), .B(n3), .Y(n12) );
  OAI2BB1X2TS U8 ( .A0N(D0[1]), .A1N(n1), .B0(n10), .Y(S[1]) );
  OAI2BB1XLTS U9 ( .A0N(D0[4]), .A1N(n1), .B0(n7), .Y(S[4]) );
  AOI22XLTS U10 ( .A0(D2[4]), .A1(n3), .B0(D1[4]), .B1(n4), .Y(n7) );
  OAI2BB1XLTS U11 ( .A0N(D0[3]), .A1N(n1), .B0(n8), .Y(S[3]) );
  AOI22XLTS U12 ( .A0(D2[3]), .A1(n3), .B0(D1[3]), .B1(n4), .Y(n8) );
  OAI2BB1XLTS U13 ( .A0N(D0[5]), .A1N(n1), .B0(n6), .Y(S[5]) );
  OAI2BB1XLTS U14 ( .A0N(D0[6]), .A1N(n1), .B0(n5), .Y(S[6]) );
  OAI2BB1XLTS U15 ( .A0N(D0[7]), .A1N(n1), .B0(n2), .Y(S[7]) );
  NOR2X4TS U16 ( .A(ctrl[0]), .B(ctrl[1]), .Y(n1) );
  OAI2BB1X2TS U17 ( .A0N(D0[0]), .A1N(n1), .B0(n11), .Y(S[0]) );
  AOI22XLTS U20 ( .A0(D2[5]), .A1(n3), .B0(D1[5]), .B1(n4), .Y(n6) );
  AOI22XLTS U21 ( .A0(D2[6]), .A1(n3), .B0(D1[6]), .B1(n4), .Y(n5) );
  AOI22XLTS U22 ( .A0(D2[7]), .A1(n3), .B0(D1[7]), .B1(n4), .Y(n2) );
initial $sdf_annotate("FPU_Multiplication_Function_syn.sdf"); 
 endmodule


module add_sub_carry_out_W9_DW01_add_0 ( A, B, CI, SUM, CO );
  input [9:0] A;
  input [9:0] B;
  output [9:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [8:2] carry;

  CMPR32X2TS U1_8 ( .A(A[8]), .B(B[8]), .C(carry[8]), .CO(SUM[9]), .S(SUM[8])
         );
  CMPR32X2TS U1_4 ( .A(A[4]), .B(B[4]), .C(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  CMPR32X2TS U1_7 ( .A(A[7]), .B(B[7]), .C(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  CMPR32X2TS U1_6 ( .A(A[6]), .B(B[6]), .C(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  CMPR32X2TS U1_5 ( .A(A[5]), .B(B[5]), .C(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  CMPR32X2TS U1_3 ( .A(A[3]), .B(B[3]), .C(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  CMPR32X2TS U1_2 ( .A(A[2]), .B(B[2]), .C(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDFHX2TS U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  AND2X2TS U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2XLTS U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
initial $sdf_annotate("FPU_Multiplication_Function_syn.sdf"); 
 endmodule


module add_sub_carry_out_W9_DW01_sub_0 ( A, B, CI, DIFF, CO );
  input [9:0] A;
  input [9:0] B;
  output [9:0] DIFF;
  input CI;
  output CO;
  wire   n1, n3, n4, n5, n6, n7, n8, n9, n10, n11;
  wire   [9:1] carry;

  CMPR32X2TS U2_8 ( .A(A[8]), .B(n11), .C(carry[8]), .CO(carry[9]), .S(DIFF[8]) );
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
  ADDFHX2TS U2_7 ( .A(A[7]), .B(n3), .CI(carry[7]), .CO(carry[8]), .S(DIFF[7])
         );
  ADDFHX1TS U2_1 ( .A(A[1]), .B(n9), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1])
         );
  NAND2X1TS U1 ( .A(B[0]), .B(n1), .Y(carry[1]) );
  CLKINVX1TS U2 ( .A(A[0]), .Y(n1) );
  XNOR2XLTS U3 ( .A(n10), .B(A[0]), .Y(DIFF[0]) );
  INVX2TS U4 ( .A(B[0]), .Y(n10) );
  INVX2TS U5 ( .A(B[1]), .Y(n9) );
  INVX2TS U6 ( .A(B[2]), .Y(n8) );
  INVX2TS U7 ( .A(B[3]), .Y(n7) );
  INVX2TS U8 ( .A(B[4]), .Y(n6) );
  INVX2TS U9 ( .A(B[5]), .Y(n5) );
  INVX2TS U10 ( .A(B[6]), .Y(n4) );
  INVX2TS U11 ( .A(B[7]), .Y(n3) );
  INVX2TS U12 ( .A(B[8]), .Y(n11) );
  INVX2TS U13 ( .A(carry[9]), .Y(DIFF[9]) );
initial $sdf_annotate("FPU_Multiplication_Function_syn.sdf"); 
 endmodule


module add_sub_carry_out_W9 ( op_mode, Data_A, Data_B, Data_S );
  input [8:0] Data_A;
  input [8:0] Data_B;
  output [9:0] Data_S;
  input op_mode;
  wire   N3, N4, N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, N15, N16, N17,
         N18, N19, N20, N21, N22, n1, n2, n3;

  add_sub_carry_out_W9_DW01_add_0 add_36 ( .A({1'b0, Data_A[8:2], n1, 
        Data_A[0]}), .B({1'b0, Data_B}), .CI(1'b0), .SUM({N22, N21, N20, N19, 
        N18, N17, N16, N15, N14, N13}) );
  add_sub_carry_out_W9_DW01_sub_0 sub_34 ( .A({1'b0, Data_A[8:2], n1, 
        Data_A[0]}), .B({1'b0, Data_B}), .CI(1'b0), .DIFF({N12, N11, N10, N9, 
        N8, N7, N6, N5, N4, N3}) );
  BUFX3TS U3 ( .A(Data_A[1]), .Y(n1) );
  AO22XLTS U4 ( .A0(N22), .A1(n3), .B0(n2), .B1(N12), .Y(Data_S[9]) );
  AO22X2TS U5 ( .A0(N21), .A1(n3), .B0(N11), .B1(n2), .Y(Data_S[8]) );
  INVX2TS U6 ( .A(op_mode), .Y(n3) );
  BUFX3TS U7 ( .A(op_mode), .Y(n2) );
  AO22X1TS U8 ( .A0(N6), .A1(n2), .B0(N16), .B1(n3), .Y(Data_S[3]) );
  AO22X1TS U9 ( .A0(N9), .A1(n2), .B0(N19), .B1(n3), .Y(Data_S[6]) );
  AO22X1TS U10 ( .A0(N20), .A1(n3), .B0(N10), .B1(n2), .Y(Data_S[7]) );
  AO22X1TS U11 ( .A0(N7), .A1(n2), .B0(N17), .B1(n3), .Y(Data_S[4]) );
  AO22X1TS U12 ( .A0(N5), .A1(n2), .B0(N15), .B1(n3), .Y(Data_S[2]) );
  AO22X1TS U13 ( .A0(N4), .A1(n2), .B0(N14), .B1(n3), .Y(Data_S[1]) );
  AO22X1TS U14 ( .A0(N8), .A1(n2), .B0(N18), .B1(n3), .Y(Data_S[5]) );
  AO22X1TS U15 ( .A0(N3), .A1(n2), .B0(N13), .B1(n3), .Y(Data_S[0]) );
initial $sdf_annotate("FPU_Multiplication_Function_syn.sdf"); 
 endmodule


module RegisterMult_W9 ( clk, rst, load, D, Q );
  input [8:0] D;
  output [8:0] Q;
  input clk, rst, load;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n19, n18, n20, n21;

  DFFRX2TS Q_reg_7_ ( .D(n17), .CK(clk), .RN(n21), .Q(Q[7]), .QN(n8) );
  DFFRX2TS Q_reg_6_ ( .D(n16), .CK(clk), .RN(n21), .Q(Q[6]), .QN(n7) );
  DFFRX2TS Q_reg_8_ ( .D(n19), .CK(clk), .RN(n21), .Q(Q[8]), .QN(n9) );
  DFFRX2TS Q_reg_5_ ( .D(n15), .CK(clk), .RN(n21), .Q(Q[5]), .QN(n6) );
  DFFRX2TS Q_reg_4_ ( .D(n14), .CK(clk), .RN(n21), .Q(Q[4]), .QN(n5) );
  DFFRX2TS Q_reg_3_ ( .D(n13), .CK(clk), .RN(n21), .Q(Q[3]), .QN(n4) );
  DFFRX2TS Q_reg_2_ ( .D(n12), .CK(clk), .RN(n21), .Q(Q[2]), .QN(n3) );
  DFFRX2TS Q_reg_1_ ( .D(n11), .CK(clk), .RN(n21), .Q(Q[1]), .QN(n2) );
  DFFRX2TS Q_reg_0_ ( .D(n10), .CK(clk), .RN(n21), .Q(Q[0]), .QN(n1) );
  BUFX3TS U2 ( .A(n20), .Y(n18) );
  BUFX3TS U3 ( .A(load), .Y(n20) );
  INVX4TS U4 ( .A(rst), .Y(n21) );
  OAI2BB2XLTS U5 ( .B0(n7), .B1(n20), .A0N(D[6]), .A1N(n18), .Y(n16) );
  OAI2BB2XLTS U6 ( .B0(n8), .B1(n20), .A0N(D[7]), .A1N(n18), .Y(n17) );
  OAI2BB2XLTS U7 ( .B0(n9), .B1(n20), .A0N(D[8]), .A1N(n18), .Y(n19) );
  OAI2BB2XLTS U8 ( .B0(n4), .B1(n20), .A0N(D[3]), .A1N(n18), .Y(n13) );
  OAI2BB2XLTS U9 ( .B0(n5), .B1(n20), .A0N(D[4]), .A1N(n18), .Y(n14) );
  OAI2BB2XLTS U10 ( .B0(n6), .B1(n20), .A0N(D[5]), .A1N(n18), .Y(n15) );
  OAI2BB2XLTS U11 ( .B0(n1), .B1(n20), .A0N(n18), .A1N(D[0]), .Y(n10) );
  OAI2BB2XLTS U12 ( .B0(n2), .B1(n20), .A0N(D[1]), .A1N(n18), .Y(n11) );
  OAI2BB2XLTS U13 ( .B0(n3), .B1(n20), .A0N(D[2]), .A1N(n18), .Y(n12) );
initial $sdf_annotate("FPU_Multiplication_Function_syn.sdf"); 
 endmodule


module RegisterMult_W1_1 ( clk, rst, load, D, Q );
  input [0:0] D;
  output [0:0] Q;
  input clk, rst, load;
  wire   n1, n3, n2;

  DFFRX2TS Q_reg_0_ ( .D(n3), .CK(clk), .RN(n2), .Q(Q[0]), .QN(n1) );
  INVX2TS U2 ( .A(rst), .Y(n2) );
  OAI2BB2XLTS U3 ( .B0(n1), .B1(load), .A0N(load), .A1N(D[0]), .Y(n3) );
initial $sdf_annotate("FPU_Multiplication_Function_syn.sdf"); 
 endmodule


module Comparator_Less_W9 ( Data_A, Data_B, less );
  input [8:0] Data_A;
  input [8:0] Data_B;
  output less;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28;

  CLKINVX4TS U1 ( .A(Data_A[8]), .Y(n28) );
  OAI22X2TS U2 ( .A0(Data_B[8]), .A1(n28), .B0(Data_B[7]), .B1(n27), .Y(n18)
         );
  OAI222X1TS U3 ( .A0(Data_B[8]), .A1(n28), .B0(Data_B[8]), .B1(n14), .C0(n14), 
        .C1(n28), .Y(n15) );
  OR3X1TS U4 ( .A(n18), .B(n17), .C(n16), .Y(n1) );
  NAND2X1TS U5 ( .A(n1), .B(n15), .Y(less) );
  CLKINVX2TS U6 ( .A(Data_A[6]), .Y(n26) );
  CLKINVX2TS U7 ( .A(Data_A[7]), .Y(n27) );
  INVX2TS U8 ( .A(Data_A[5]), .Y(n25) );
  INVX2TS U9 ( .A(Data_A[3]), .Y(n24) );
  INVX2TS U10 ( .A(n4), .Y(n23) );
  INVX2TS U11 ( .A(Data_A[0]), .Y(n21) );
  INVX2TS U12 ( .A(Data_A[1]), .Y(n22) );
  INVX2TS U13 ( .A(Data_B[6]), .Y(n19) );
  INVX2TS U14 ( .A(Data_B[4]), .Y(n20) );
  NAND2BX1TS U15 ( .AN(Data_B[2]), .B(Data_A[2]), .Y(n4) );
  AO22X1TS U16 ( .A0(n21), .A1(Data_B[0]), .B0(n22), .B1(Data_B[1]), .Y(n2) );
  OAI21X1TS U17 ( .A0(Data_B[1]), .A1(n22), .B0(n2), .Y(n7) );
  NOR2BX1TS U18 ( .AN(Data_B[2]), .B(Data_A[2]), .Y(n3) );
  OAI22X1TS U19 ( .A0(n3), .A1(n24), .B0(Data_B[3]), .B1(n3), .Y(n6) );
  OAI22X1TS U20 ( .A0(Data_B[3]), .A1(n24), .B0(Data_B[3]), .B1(n4), .Y(n5) );
  AOI221X1TS U21 ( .A0(Data_A[3]), .A1(n23), .B0(n7), .B1(n6), .C0(n5), .Y(n10) );
  NOR2X1TS U22 ( .A(n20), .B(Data_A[4]), .Y(n8) );
  OA22X1TS U23 ( .A0(n8), .A1(Data_B[5]), .B0(n8), .B1(n25), .Y(n9) );
  AOI211X1TS U24 ( .A0(Data_B[6]), .A1(n26), .B0(n10), .C0(n9), .Y(n17) );
  NAND2X1TS U25 ( .A(Data_A[4]), .B(n20), .Y(n11) );
  OAI222X1TS U26 ( .A0(Data_B[5]), .A1(n25), .B0(Data_B[5]), .B1(n11), .C0(n25), .C1(n11), .Y(n12) );
  OAI22X1TS U27 ( .A0(Data_A[6]), .A1(n12), .B0(n19), .B1(n12), .Y(n13) );
  AOI21X1TS U28 ( .A0(Data_B[6]), .A1(n26), .B0(n13), .Y(n16) );
  NOR2BX1TS U29 ( .AN(Data_B[7]), .B(Data_A[7]), .Y(n14) );
initial $sdf_annotate("FPU_Multiplication_Function_syn.sdf"); 
 endmodule


module RegisterMult_W1_0 ( clk, rst, load, D, Q );
  input [0:0] D;
  output [0:0] Q;
  input clk, rst, load;
  wire   n1, n2, n4;

  DFFRX2TS Q_reg_0_ ( .D(n4), .CK(clk), .RN(n2), .Q(Q[0]) );
  INVX2TS U2 ( .A(load), .Y(n1) );
  AO22X1TS U3 ( .A0(Q[0]), .A1(n1), .B0(load), .B1(D[0]), .Y(n4) );
  INVX2TS U4 ( .A(rst), .Y(n2) );
initial $sdf_annotate("FPU_Multiplication_Function_syn.sdf"); 
 endmodule


module Exp_Operation_m_EW8 ( clk, rst, load_a_i, load_b_i, load_c_i, Data_A_i, 
        Data_B_i, Add_Subt_i, Data_Result_o, Overflow_flag_o, Underflow_flag_o
 );
  input [8:0] Data_A_i;
  input [8:0] Data_B_i;
  output [8:0] Data_Result_o;
  input clk, rst, load_a_i, load_b_i, load_c_i, Add_Subt_i;
  output Overflow_flag_o, Underflow_flag_o;
  wire   Overflow_A, Overflow_flag_A, underflow_exp_reg;
  wire   [8:0] Data_S;

  add_sub_carry_out_W9 exp_add_subt_m ( .op_mode(Add_Subt_i), .Data_A(Data_A_i), .Data_B(Data_B_i), .Data_S({Overflow_A, Data_S}) );
  RegisterMult_W9 exp_result_m ( .clk(clk), .rst(rst), .load(load_c_i), .D(
        Data_S), .Q(Data_Result_o) );
  RegisterMult_W1_1 Oflow_A_m ( .clk(clk), .rst(rst), .load(load_b_i), .D(
        Overflow_A), .Q(Overflow_flag_A) );
  Comparator_Less_W9 Exp_unflow_Comparator_m ( .Data_A(Data_S), .Data_B({1'b0, 
        1'b0, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1}), .less(
        underflow_exp_reg) );
  RegisterMult_W1_0 Underflow_m ( .clk(clk), .rst(rst), .load(load_a_i), .D(
        underflow_exp_reg), .Q(Underflow_flag_o) );
  OR2X2TS U3 ( .A(Data_Result_o[8]), .B(Overflow_flag_A), .Y(Overflow_flag_o)
         );
initial $sdf_annotate("FPU_Multiplication_Function_syn.sdf"); 
 endmodule


module XOR_M ( Sgn_X, Sgn_Y, Sgn_Info );
  input Sgn_X, Sgn_Y;
  output Sgn_Info;


  XOR2X1TS U1 ( .A(Sgn_Y), .B(Sgn_X), .Y(Sgn_Info) );
initial $sdf_annotate("FPU_Multiplication_Function_syn.sdf"); 
 endmodule


module Multiplexer_AC_W24 ( ctrl, D0, D1, S );
  input [23:0] D0;
  input [23:0] D1;
  output [23:0] S;
  input ctrl;
  wire   n1, n2, n3, n4, n5, n6;

  CLKBUFX2TS U1 ( .A(n5), .Y(n3) );
  INVX2TS U2 ( .A(n3), .Y(n1) );
  INVX2TS U3 ( .A(n3), .Y(n2) );
  BUFX3TS U4 ( .A(n5), .Y(n4) );
  CLKBUFX2TS U5 ( .A(n6), .Y(n5) );
  AO22X1TS U6 ( .A0(D1[0]), .A1(ctrl), .B0(D0[0]), .B1(n3), .Y(S[0]) );
  AO22X1TS U7 ( .A0(n1), .A1(D1[9]), .B0(D0[9]), .B1(n6), .Y(S[9]) );
  AO22X1TS U8 ( .A0(D1[1]), .A1(n2), .B0(D0[1]), .B1(n6), .Y(S[1]) );
  AO22X1TS U9 ( .A0(D1[2]), .A1(n1), .B0(D0[2]), .B1(n6), .Y(S[2]) );
  AO22X1TS U10 ( .A0(D1[3]), .A1(n1), .B0(D0[3]), .B1(n6), .Y(S[3]) );
  AO22X1TS U11 ( .A0(D1[4]), .A1(n1), .B0(D0[4]), .B1(n5), .Y(S[4]) );
  AO22X1TS U12 ( .A0(D1[5]), .A1(n1), .B0(D0[5]), .B1(n5), .Y(S[5]) );
  AO22X1TS U13 ( .A0(D1[6]), .A1(n1), .B0(D0[6]), .B1(n6), .Y(S[6]) );
  AO22X1TS U14 ( .A0(D1[7]), .A1(n1), .B0(D0[7]), .B1(n6), .Y(S[7]) );
  AO22X1TS U15 ( .A0(D1[8]), .A1(n1), .B0(D0[8]), .B1(n6), .Y(S[8]) );
  AO22X1TS U16 ( .A0(D1[11]), .A1(ctrl), .B0(D0[11]), .B1(n4), .Y(S[11]) );
  AO22X1TS U17 ( .A0(D1[12]), .A1(ctrl), .B0(D0[12]), .B1(n4), .Y(S[12]) );
  AO22X1TS U18 ( .A0(D1[13]), .A1(n2), .B0(D0[13]), .B1(n4), .Y(S[13]) );
  AO22X1TS U19 ( .A0(D1[14]), .A1(n2), .B0(D0[14]), .B1(n4), .Y(S[14]) );
  AO22X1TS U20 ( .A0(D1[15]), .A1(n2), .B0(D0[15]), .B1(n4), .Y(S[15]) );
  AO22X1TS U21 ( .A0(D1[16]), .A1(n2), .B0(D0[16]), .B1(n4), .Y(S[16]) );
  AO22X1TS U22 ( .A0(D1[17]), .A1(n2), .B0(D0[17]), .B1(n4), .Y(S[17]) );
  AO22X1TS U23 ( .A0(D1[18]), .A1(n2), .B0(D0[18]), .B1(n4), .Y(S[18]) );
  AO22X1TS U24 ( .A0(D1[19]), .A1(n2), .B0(D0[19]), .B1(n4), .Y(S[19]) );
  AO22X1TS U25 ( .A0(D1[20]), .A1(n2), .B0(D0[20]), .B1(n6), .Y(S[20]) );
  AO22X1TS U26 ( .A0(D1[21]), .A1(n2), .B0(D0[21]), .B1(n6), .Y(S[21]) );
  AO22X1TS U27 ( .A0(D1[22]), .A1(n1), .B0(D0[22]), .B1(n5), .Y(S[22]) );
  AO22X1TS U28 ( .A0(D1[23]), .A1(n1), .B0(D0[23]), .B1(n5), .Y(S[23]) );
  AO22X1TS U29 ( .A0(D1[10]), .A1(ctrl), .B0(D0[10]), .B1(n4), .Y(S[10]) );
  INVX2TS U30 ( .A(ctrl), .Y(n6) );
initial $sdf_annotate("FPU_Multiplication_Function_syn.sdf"); 
 endmodule


module shift_mux_array_SWR24_LEVEL0 ( Data_i, select_i, bit_shift_i, Data_o );
  input [23:0] Data_i;
  output [23:0] Data_o;
  input select_i, bit_shift_i;
  wire   n1, n2, n3, n4, n5;

  INVX2TS U1 ( .A(select_i), .Y(n1) );
  INVX2TS U2 ( .A(select_i), .Y(n2) );
  INVX2TS U3 ( .A(select_i), .Y(n3) );
  BUFX3TS U4 ( .A(select_i), .Y(n4) );
  BUFX3TS U5 ( .A(select_i), .Y(n5) );
  AO22X1TS U6 ( .A0(select_i), .A1(Data_i[1]), .B0(Data_i[0]), .B1(n2), .Y(
        Data_o[0]) );
  AO22X1TS U7 ( .A0(n4), .A1(Data_i[2]), .B0(n2), .B1(Data_i[1]), .Y(Data_o[1]) );
  AO22X1TS U8 ( .A0(n4), .A1(Data_i[3]), .B0(n3), .B1(Data_i[2]), .Y(Data_o[2]) );
  AO22X1TS U9 ( .A0(n4), .A1(Data_i[6]), .B0(n2), .B1(Data_i[5]), .Y(Data_o[5]) );
  AO22X1TS U10 ( .A0(n4), .A1(Data_i[4]), .B0(n2), .B1(Data_i[3]), .Y(
        Data_o[3]) );
  AO22X1TS U11 ( .A0(n4), .A1(Data_i[5]), .B0(n2), .B1(Data_i[4]), .Y(
        Data_o[4]) );
  AO22X1TS U12 ( .A0(n4), .A1(Data_i[7]), .B0(n3), .B1(Data_i[6]), .Y(
        Data_o[6]) );
  AO22X1TS U13 ( .A0(n4), .A1(Data_i[8]), .B0(n3), .B1(Data_i[7]), .Y(
        Data_o[7]) );
  AO22X1TS U14 ( .A0(n4), .A1(Data_i[9]), .B0(n3), .B1(Data_i[8]), .Y(
        Data_o[8]) );
  AO22X1TS U15 ( .A0(n1), .A1(Data_i[9]), .B0(Data_i[10]), .B1(n4), .Y(
        Data_o[9]) );
  AO22X1TS U16 ( .A0(n2), .A1(Data_i[10]), .B0(select_i), .B1(Data_i[11]), .Y(
        Data_o[10]) );
  AO22X1TS U17 ( .A0(n2), .A1(Data_i[11]), .B0(select_i), .B1(Data_i[12]), .Y(
        Data_o[11]) );
  AO22X1TS U18 ( .A0(n2), .A1(Data_i[12]), .B0(select_i), .B1(Data_i[13]), .Y(
        Data_o[12]) );
  AO22X1TS U19 ( .A0(n2), .A1(Data_i[13]), .B0(n5), .B1(Data_i[14]), .Y(
        Data_o[13]) );
  AO22X1TS U20 ( .A0(n2), .A1(Data_i[14]), .B0(n5), .B1(Data_i[15]), .Y(
        Data_o[14]) );
  AO22X1TS U21 ( .A0(n1), .A1(Data_i[15]), .B0(n5), .B1(Data_i[16]), .Y(
        Data_o[15]) );
  AO22X1TS U22 ( .A0(n1), .A1(Data_i[16]), .B0(n5), .B1(Data_i[17]), .Y(
        Data_o[16]) );
  AO22X1TS U23 ( .A0(n1), .A1(Data_i[17]), .B0(n5), .B1(Data_i[18]), .Y(
        Data_o[17]) );
  AO22X1TS U24 ( .A0(n1), .A1(Data_i[18]), .B0(n5), .B1(Data_i[19]), .Y(
        Data_o[18]) );
  AO22X1TS U25 ( .A0(n1), .A1(Data_i[19]), .B0(n5), .B1(Data_i[20]), .Y(
        Data_o[19]) );
  AO22X1TS U26 ( .A0(n1), .A1(Data_i[20]), .B0(n5), .B1(Data_i[21]), .Y(
        Data_o[20]) );
  AO22X1TS U27 ( .A0(n1), .A1(Data_i[21]), .B0(n5), .B1(Data_i[22]), .Y(
        Data_o[21]) );
  AO22X1TS U28 ( .A0(n1), .A1(Data_i[22]), .B0(n5), .B1(Data_i[23]), .Y(
        Data_o[22]) );
  AO22X1TS U29 ( .A0(n1), .A1(Data_i[23]), .B0(bit_shift_i), .B1(n4), .Y(
        Data_o[23]) );
initial $sdf_annotate("FPU_Multiplication_Function_syn.sdf"); 
 endmodule


module RegisterMult_W24 ( clk, rst, load, D, Q );
  input [23:0] D;
  output [23:0] Q;
  input clk, rst, load;
  wire   n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n49, n48, n50, n51, n52, n53, n54, n55, n56, n57;

  DFFRX2TS Q_reg_23_ ( .D(n49), .CK(clk), .RN(n57), .Q(Q[23]), .QN(n24) );
  DFFRX2TS Q_reg_22_ ( .D(n47), .CK(clk), .RN(n57), .Q(Q[22]), .QN(n23) );
  DFFRX2TS Q_reg_21_ ( .D(n46), .CK(clk), .RN(n57), .Q(Q[21]), .QN(n22) );
  DFFRX2TS Q_reg_20_ ( .D(n45), .CK(clk), .RN(n57), .Q(Q[20]), .QN(n21) );
  DFFRX2TS Q_reg_19_ ( .D(n44), .CK(clk), .RN(n51), .Q(Q[19]), .QN(n20) );
  DFFRX2TS Q_reg_18_ ( .D(n43), .CK(clk), .RN(n51), .Q(Q[18]), .QN(n19) );
  DFFRX2TS Q_reg_17_ ( .D(n42), .CK(clk), .RN(n51), .Q(Q[17]), .QN(n18) );
  DFFRX2TS Q_reg_16_ ( .D(n41), .CK(clk), .RN(n51), .Q(Q[16]), .QN(n17) );
  DFFRX2TS Q_reg_15_ ( .D(n40), .CK(clk), .RN(n51), .Q(Q[15]), .QN(n16) );
  DFFRX2TS Q_reg_14_ ( .D(n39), .CK(clk), .RN(n51), .Q(Q[14]), .QN(n15) );
  DFFRX2TS Q_reg_13_ ( .D(n38), .CK(clk), .RN(n51), .Q(Q[13]), .QN(n14) );
  DFFRX2TS Q_reg_12_ ( .D(n37), .CK(clk), .RN(n51), .Q(Q[12]), .QN(n13) );
  DFFRX2TS Q_reg_11_ ( .D(n36), .CK(clk), .RN(n51), .Q(Q[11]), .QN(n12) );
  DFFRX2TS Q_reg_10_ ( .D(n35), .CK(clk), .RN(n51), .Q(Q[10]), .QN(n11) );
  DFFRX4TS Q_reg_1_ ( .D(n26), .CK(clk), .RN(n50), .Q(Q[1]), .QN(n2) );
  DFFRX2TS Q_reg_9_ ( .D(n34), .CK(clk), .RN(n50), .Q(Q[9]), .QN(n10) );
  DFFRX2TS Q_reg_8_ ( .D(n33), .CK(clk), .RN(n50), .Q(Q[8]), .QN(n9) );
  DFFRX2TS Q_reg_7_ ( .D(n32), .CK(clk), .RN(n50), .Q(Q[7]), .QN(n8) );
  DFFRX2TS Q_reg_4_ ( .D(n29), .CK(clk), .RN(n50), .Q(Q[4]), .QN(n5) );
  DFFRX2TS Q_reg_5_ ( .D(n30), .CK(clk), .RN(n50), .Q(Q[5]), .QN(n6) );
  DFFRX4TS Q_reg_0_ ( .D(n25), .CK(clk), .RN(n50), .Q(Q[0]), .QN(n48) );
  DFFRX2TS Q_reg_6_ ( .D(n31), .CK(clk), .RN(n50), .Q(Q[6]), .QN(n7) );
  DFFRX2TS Q_reg_3_ ( .D(n28), .CK(clk), .RN(n50), .Q(Q[3]), .QN(n4) );
  DFFRX2TS Q_reg_2_ ( .D(n27), .CK(clk), .RN(n50), .Q(Q[2]), .QN(n3) );
  BUFX3TS U2 ( .A(n57), .Y(n50) );
  BUFX3TS U3 ( .A(n57), .Y(n51) );
  BUFX3TS U4 ( .A(n56), .Y(n53) );
  BUFX3TS U5 ( .A(n56), .Y(n54) );
  BUFX3TS U6 ( .A(n56), .Y(n55) );
  INVX2TS U7 ( .A(rst), .Y(n57) );
  BUFX3TS U8 ( .A(load), .Y(n52) );
  CLKBUFX2TS U9 ( .A(load), .Y(n56) );
  OAI2BB2XLTS U10 ( .B0(n48), .B1(n53), .A0N(n55), .A1N(D[0]), .Y(n25) );
  OAI2BB2XLTS U11 ( .B0(n2), .B1(n53), .A0N(D[1]), .A1N(n55), .Y(n26) );
  OAI2BB2XLTS U12 ( .B0(n3), .B1(n53), .A0N(D[2]), .A1N(n55), .Y(n27) );
  OAI2BB2XLTS U13 ( .B0(n6), .B1(n53), .A0N(D[5]), .A1N(n54), .Y(n30) );
  OAI2BB2XLTS U14 ( .B0(n4), .B1(load), .A0N(D[3]), .A1N(n55), .Y(n28) );
  OAI2BB2XLTS U15 ( .B0(n5), .B1(n55), .A0N(D[4]), .A1N(n54), .Y(n29) );
  OAI2BB2XLTS U16 ( .B0(n7), .B1(load), .A0N(D[6]), .A1N(n54), .Y(n31) );
  OAI2BB2XLTS U17 ( .B0(n8), .B1(n55), .A0N(D[7]), .A1N(n54), .Y(n32) );
  OAI2BB2XLTS U18 ( .B0(n9), .B1(n56), .A0N(D[8]), .A1N(n53), .Y(n33) );
  OAI2BB2XLTS U19 ( .B0(n10), .B1(load), .A0N(D[9]), .A1N(n53), .Y(n34) );
  OAI2BB2XLTS U20 ( .B0(n11), .B1(load), .A0N(D[10]), .A1N(n53), .Y(n35) );
  OAI2BB2XLTS U21 ( .B0(n12), .B1(load), .A0N(D[11]), .A1N(n53), .Y(n36) );
  OAI2BB2XLTS U22 ( .B0(n13), .B1(load), .A0N(D[12]), .A1N(n53), .Y(n37) );
  OAI2BB2XLTS U23 ( .B0(n14), .B1(n52), .A0N(D[13]), .A1N(n53), .Y(n38) );
  OAI2BB2XLTS U24 ( .B0(n15), .B1(n52), .A0N(D[14]), .A1N(n54), .Y(n39) );
  OAI2BB2XLTS U25 ( .B0(n16), .B1(n52), .A0N(D[15]), .A1N(n54), .Y(n40) );
  OAI2BB2XLTS U26 ( .B0(n17), .B1(n52), .A0N(D[16]), .A1N(n54), .Y(n41) );
  OAI2BB2XLTS U27 ( .B0(n18), .B1(n52), .A0N(D[17]), .A1N(n54), .Y(n42) );
  OAI2BB2XLTS U28 ( .B0(n19), .B1(n52), .A0N(D[18]), .A1N(n54), .Y(n43) );
  OAI2BB2XLTS U29 ( .B0(n20), .B1(n52), .A0N(D[19]), .A1N(n54), .Y(n44) );
  OAI2BB2XLTS U30 ( .B0(n21), .B1(n52), .A0N(D[20]), .A1N(n55), .Y(n45) );
  OAI2BB2XLTS U31 ( .B0(n22), .B1(n52), .A0N(D[21]), .A1N(n55), .Y(n46) );
  OAI2BB2XLTS U32 ( .B0(n23), .B1(n52), .A0N(D[22]), .A1N(n55), .Y(n47) );
  OAI2BB2XLTS U33 ( .B0(n24), .B1(load), .A0N(D[23]), .A1N(n55), .Y(n49) );
initial $sdf_annotate("FPU_Multiplication_Function_syn.sdf"); 
 endmodule


module Barrel_Shifter_M_SW24 ( clk, rst, load_i, Shift_Value_i, Shift_Data_i, 
        N_mant_o );
  input [23:0] Shift_Data_i;
  output [23:0] N_mant_o;
  input clk, rst, load_i, Shift_Value_i;

  wire   [23:0] Data_Reg;

  shift_mux_array_SWR24_LEVEL0 shift_mux_array ( .Data_i(Shift_Data_i), 
        .select_i(Shift_Value_i), .bit_shift_i(1'b1), .Data_o(Data_Reg) );
  RegisterMult_W24 Output_Reg ( .clk(clk), .rst(rst), .load(load_i), .D(
        Data_Reg), .Q(N_mant_o) );
initial $sdf_annotate("FPU_Multiplication_Function_syn.sdf"); 
 endmodule


module OR_Module_W23 ( Sgf_Round_Part, round_ok );
  input [22:0] Sgf_Round_Part;
  output round_ok;
  wire   n1, n2, n3, n4, n5, n6, n7, n8;

  NOR4BX1TS U1 ( .AN(n5), .B(Sgf_Round_Part[6]), .C(Sgf_Round_Part[4]), .D(
        Sgf_Round_Part[5]), .Y(n4) );
  NOR3X1TS U2 ( .A(Sgf_Round_Part[7]), .B(Sgf_Round_Part[9]), .C(
        Sgf_Round_Part[8]), .Y(n5) );
  NAND4X1TS U3 ( .A(n1), .B(n2), .C(n3), .D(n4), .Y(round_ok) );
  NOR4BX1TS U4 ( .AN(n6), .B(Sgf_Round_Part[21]), .C(Sgf_Round_Part[1]), .D(
        Sgf_Round_Part[20]), .Y(n3) );
  NOR3X1TS U5 ( .A(Sgf_Round_Part[22]), .B(Sgf_Round_Part[3]), .C(
        Sgf_Round_Part[2]), .Y(n6) );
  NOR4BX1TS U6 ( .AN(n7), .B(Sgf_Round_Part[16]), .C(Sgf_Round_Part[14]), .D(
        Sgf_Round_Part[15]), .Y(n2) );
  NOR3X1TS U7 ( .A(Sgf_Round_Part[17]), .B(Sgf_Round_Part[19]), .C(
        Sgf_Round_Part[18]), .Y(n7) );
  NOR4BX1TS U8 ( .AN(n8), .B(Sgf_Round_Part[10]), .C(Sgf_Round_Part[0]), .D(
        Sgf_Round_Part[11]), .Y(n1) );
  NOR2X1TS U9 ( .A(Sgf_Round_Part[13]), .B(Sgf_Round_Part[12]), .Y(n8) );
initial $sdf_annotate("FPU_Multiplication_Function_syn.sdf"); 
 endmodule


module Deco_Round_Mult ( round_mode, or_info, xor_info, ctrl );
  input [1:0] round_mode;
  input or_info, xor_info;
  output ctrl;
  wire   n1, n2;

  NOR3BX1TS U3 ( .AN(or_info), .B(n1), .C(n2), .Y(ctrl) );
  XOR2X1TS U4 ( .A(xor_info), .B(round_mode[0]), .Y(n1) );
  XNOR2X1TS U5 ( .A(round_mode[0]), .B(round_mode[1]), .Y(n2) );
initial $sdf_annotate("FPU_Multiplication_Function_syn.sdf"); 
 endmodule


module Round_decoder_M_SW23 ( Round_Bits_i, Round_Mode_i, Sign_Result_i, 
        Round_Flag_o );
  input [22:0] Round_Bits_i;
  input [1:0] Round_Mode_i;
  input Sign_Result_i;
  output Round_Flag_o;
  wire   round_ok;

  OR_Module_W23 OR_info_reg ( .Sgf_Round_Part(Round_Bits_i), .round_ok(
        round_ok) );
  Deco_Round_Mult Rounding_Deco ( .round_mode(Round_Mode_i), .or_info(round_ok), .xor_info(Sign_Result_i), .ctrl(Round_Flag_o) );
initial $sdf_annotate("FPU_Multiplication_Function_syn.sdf"); 
 endmodule


module adder_W24_DW01_add_0 ( A, B, CI, SUM, CO );
  input [24:0] A;
  input [24:0] B;
  output [24:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3;
  wire   [23:2] carry;

  ADDFHX2TS U1_20 ( .A(A[20]), .B(B[20]), .CI(carry[20]), .CO(carry[21]), .S(
        SUM[20]) );
  ADDFHX2TS U1_9 ( .A(A[9]), .B(B[9]), .CI(carry[9]), .CO(carry[10]), .S(
        SUM[9]) );
  ADDFHX2TS U1_15 ( .A(A[15]), .B(B[15]), .CI(carry[15]), .CO(carry[16]), .S(
        SUM[15]) );
  CMPR32X2TS U1_8 ( .A(A[8]), .B(B[8]), .C(carry[8]), .CO(carry[9]), .S(SUM[8]) );
  ADDFHX2TS U1_23 ( .A(A[23]), .B(B[23]), .CI(carry[23]), .CO(SUM[24]), .S(
        SUM[23]) );
  ADDFHX4TS U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  ADDFHX4TS U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDFHX4TS U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  ADDFHX4TS U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDFHX4TS U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDFHX4TS U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDFHX4TS U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDFHX4TS U1_12 ( .A(A[12]), .B(B[12]), .CI(carry[12]), .CO(carry[13]), .S(
        SUM[12]) );
  ADDFHX4TS U1_10 ( .A(A[10]), .B(B[10]), .CI(carry[10]), .CO(carry[11]), .S(
        SUM[10]) );
  ADDFHX4TS U1_11 ( .A(A[11]), .B(B[11]), .CI(carry[11]), .CO(carry[12]), .S(
        SUM[11]) );
  ADDFHX4TS U1_21 ( .A(A[21]), .B(B[21]), .CI(carry[21]), .CO(carry[22]), .S(
        SUM[21]) );
  ADDFHX4TS U1_22 ( .A(A[22]), .B(B[22]), .CI(carry[22]), .CO(carry[23]), .S(
        SUM[22]) );
  ADDFHX4TS U1_16 ( .A(A[16]), .B(B[16]), .CI(carry[16]), .CO(carry[17]), .S(
        SUM[16]) );
  ADDFHX4TS U1_17 ( .A(A[17]), .B(B[17]), .CI(carry[17]), .CO(carry[18]), .S(
        SUM[17]) );
  ADDFHX4TS U1_18 ( .A(A[18]), .B(B[18]), .CI(carry[18]), .CO(carry[19]), .S(
        SUM[18]) );
  ADDFHX4TS U1_19 ( .A(A[19]), .B(B[19]), .CI(carry[19]), .CO(carry[20]), .S(
        SUM[19]) );
  ADDFHX2TS U1_13 ( .A(A[13]), .B(B[13]), .CI(carry[13]), .CO(carry[14]), .S(
        SUM[13]) );
  ADDFHX2TS U1_14 ( .A(A[14]), .B(B[14]), .CI(carry[14]), .CO(carry[15]), .S(
        SUM[14]) );
  CLKINVX8TS U1 ( .A(A[0]), .Y(n3) );
  NOR2X4TS U2 ( .A(n2), .B(n3), .Y(n1) );
  XOR2XLTS U3 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
  INVX2TS U4 ( .A(B[0]), .Y(n2) );
initial $sdf_annotate("FPU_Multiplication_Function_syn.sdf"); 
 endmodule


module adder_W24 ( Data_A_i, Data_B_i, Data_S_o );
  input [23:0] Data_A_i;
  input [23:0] Data_B_i;
  output [24:0] Data_S_o;


  adder_W24_DW01_add_0 add_9 ( .A({1'b0, Data_A_i}), .B({1'b0, Data_B_i}), 
        .CI(1'b0), .SUM(Data_S_o) );
initial $sdf_annotate("FPU_Multiplication_Function_syn.sdf"); 
 endmodule


module RegisterAdd_W24 ( clk, rst, load, D, Q );
  input [23:0] D;
  output [23:0] Q;
  input clk, rst, load;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n49, n48, n50, n51, n52, n53, n54, n55, n56;

  DFFRX2TS Q_reg_9_ ( .D(n34), .CK(clk), .RN(n48), .Q(Q[9]), .QN(n10) );
  DFFRX2TS Q_reg_23_ ( .D(n49), .CK(clk), .RN(n56), .Q(Q[23]), .QN(n24) );
  DFFRX2TS Q_reg_15_ ( .D(n40), .CK(clk), .RN(n50), .Q(Q[15]), .QN(n16) );
  DFFRX2TS Q_reg_14_ ( .D(n39), .CK(clk), .RN(n50), .Q(Q[14]), .QN(n15) );
  DFFRX2TS Q_reg_13_ ( .D(n38), .CK(clk), .RN(n50), .Q(Q[13]), .QN(n14) );
  DFFRX2TS Q_reg_12_ ( .D(n37), .CK(clk), .RN(n50), .Q(Q[12]), .QN(n13) );
  DFFRX2TS Q_reg_11_ ( .D(n36), .CK(clk), .RN(n50), .Q(Q[11]), .QN(n12) );
  DFFRX2TS Q_reg_10_ ( .D(n35), .CK(clk), .RN(n50), .Q(Q[10]), .QN(n11) );
  DFFRX2TS Q_reg_8_ ( .D(n33), .CK(clk), .RN(n48), .Q(Q[8]), .QN(n9) );
  DFFRX2TS Q_reg_7_ ( .D(n32), .CK(clk), .RN(n48), .Q(Q[7]), .QN(n8) );
  DFFRX2TS Q_reg_6_ ( .D(n31), .CK(clk), .RN(n48), .Q(Q[6]), .QN(n7) );
  DFFRX2TS Q_reg_5_ ( .D(n30), .CK(clk), .RN(n48), .Q(Q[5]), .QN(n6) );
  DFFRX2TS Q_reg_4_ ( .D(n29), .CK(clk), .RN(n48), .Q(Q[4]), .QN(n5) );
  DFFRX2TS Q_reg_3_ ( .D(n28), .CK(clk), .RN(n48), .Q(Q[3]), .QN(n4) );
  DFFRX2TS Q_reg_2_ ( .D(n27), .CK(clk), .RN(n48), .Q(Q[2]), .QN(n3) );
  DFFRX2TS Q_reg_1_ ( .D(n26), .CK(clk), .RN(n48), .Q(Q[1]), .QN(n2) );
  DFFRX2TS Q_reg_0_ ( .D(n25), .CK(clk), .RN(n48), .Q(Q[0]), .QN(n1) );
  DFFRXLTS Q_reg_22_ ( .D(n47), .CK(clk), .RN(n56), .Q(Q[22]), .QN(n23) );
  DFFRXLTS Q_reg_20_ ( .D(n45), .CK(clk), .RN(n56), .Q(Q[20]), .QN(n21) );
  DFFRXLTS Q_reg_19_ ( .D(n44), .CK(clk), .RN(n50), .Q(Q[19]), .QN(n20) );
  DFFRXLTS Q_reg_18_ ( .D(n43), .CK(clk), .RN(n50), .Q(Q[18]), .QN(n19) );
  DFFRXLTS Q_reg_17_ ( .D(n42), .CK(clk), .RN(n50), .Q(Q[17]), .QN(n18) );
  DFFRXLTS Q_reg_16_ ( .D(n41), .CK(clk), .RN(n50), .Q(Q[16]), .QN(n17) );
  DFFRXLTS Q_reg_21_ ( .D(n46), .CK(clk), .RN(n56), .Q(Q[21]), .QN(n22) );
  OAI2BB2X4TS U2 ( .B0(n24), .B1(n53), .A0N(D[23]), .A1N(n55), .Y(n49) );
  OAI2BB2XLTS U3 ( .B0(n16), .B1(n52), .A0N(D[15]), .A1N(n54), .Y(n40) );
  OAI2BB2XLTS U4 ( .B0(n22), .B1(n52), .A0N(D[21]), .A1N(n55), .Y(n46) );
  BUFX3TS U5 ( .A(n51), .Y(n53) );
  BUFX3TS U6 ( .A(n51), .Y(n54) );
  BUFX3TS U7 ( .A(load), .Y(n55) );
  BUFX3TS U8 ( .A(n51), .Y(n52) );
  BUFX3TS U9 ( .A(n56), .Y(n48) );
  BUFX3TS U10 ( .A(n56), .Y(n50) );
  CLKBUFX2TS U11 ( .A(load), .Y(n51) );
  INVX2TS U12 ( .A(rst), .Y(n56) );
  OAI2BB2XLTS U13 ( .B0(n23), .B1(n52), .A0N(D[22]), .A1N(n55), .Y(n47) );
  OAI2BB2XLTS U14 ( .B0(n20), .B1(n52), .A0N(D[19]), .A1N(n54), .Y(n44) );
  OAI2BB2XLTS U15 ( .B0(n21), .B1(n52), .A0N(D[20]), .A1N(n55), .Y(n45) );
  OAI2BB2XLTS U16 ( .B0(n17), .B1(n52), .A0N(D[16]), .A1N(n54), .Y(n41) );
  OAI2BB2XLTS U17 ( .B0(n18), .B1(n52), .A0N(D[17]), .A1N(n54), .Y(n42) );
  OAI2BB2XLTS U18 ( .B0(n19), .B1(n52), .A0N(D[18]), .A1N(n54), .Y(n43) );
  OAI2BB2XLTS U19 ( .B0(n13), .B1(n53), .A0N(D[12]), .A1N(load), .Y(n37) );
  OAI2BB2XLTS U20 ( .B0(n14), .B1(n52), .A0N(D[13]), .A1N(load), .Y(n38) );
  OAI2BB2XLTS U21 ( .B0(n15), .B1(n52), .A0N(D[14]), .A1N(n54), .Y(n39) );
  OAI2BB2XLTS U22 ( .B0(n10), .B1(n53), .A0N(D[9]), .A1N(load), .Y(n34) );
  OAI2BB2XLTS U23 ( .B0(n11), .B1(n53), .A0N(D[10]), .A1N(load), .Y(n35) );
  OAI2BB2XLTS U24 ( .B0(n12), .B1(n53), .A0N(D[11]), .A1N(n51), .Y(n36) );
  OAI2BB2XLTS U25 ( .B0(n7), .B1(n53), .A0N(D[6]), .A1N(n54), .Y(n31) );
  OAI2BB2XLTS U26 ( .B0(n8), .B1(n53), .A0N(D[7]), .A1N(n54), .Y(n32) );
  OAI2BB2XLTS U27 ( .B0(n9), .B1(n53), .A0N(D[8]), .A1N(n51), .Y(n33) );
  OAI2BB2XLTS U28 ( .B0(n1), .B1(n51), .A0N(n55), .A1N(D[0]), .Y(n25) );
  OAI2BB2XLTS U29 ( .B0(n2), .B1(n55), .A0N(D[1]), .A1N(n55), .Y(n26) );
  OAI2BB2XLTS U30 ( .B0(n3), .B1(n55), .A0N(D[2]), .A1N(n55), .Y(n27) );
  OAI2BB2XLTS U31 ( .B0(n6), .B1(n51), .A0N(D[5]), .A1N(n54), .Y(n30) );
  OAI2BB2XLTS U32 ( .B0(n4), .B1(n53), .A0N(D[3]), .A1N(n55), .Y(n28) );
  OAI2BB2XLTS U33 ( .B0(n5), .B1(n53), .A0N(D[4]), .A1N(n54), .Y(n29) );
initial $sdf_annotate("FPU_Multiplication_Function_syn.sdf"); 
 endmodule


module RegisterAdd_W1_0 ( clk, rst, load, D, Q );
  input [0:0] D;
  output [0:0] Q;
  input clk, rst, load;
  wire   n2, n4, n5;

  DFFRX1TS Q_reg_0_ ( .D(n4), .CK(clk), .RN(n2), .Q(Q[0]), .QN(n5) );
  OAI2BB2X4TS U2 ( .B0(n5), .B1(load), .A0N(load), .A1N(D[0]), .Y(n4) );
  INVX2TS U3 ( .A(rst), .Y(n2) );
initial $sdf_annotate("FPU_Multiplication_Function_syn.sdf"); 
 endmodule


module Adder_Round_SW24 ( clk, rst, load_i, Data_A_i, Data_B_i, Data_Result_o, 
        FSM_C_o );
  input [23:0] Data_A_i;
  input [23:0] Data_B_i;
  output [23:0] Data_Result_o;
  input clk, rst, load_i;
  output FSM_C_o;

  wire   [24:0] result_A_adder;

  adder_W24 A_operation ( .Data_A_i(Data_A_i), .Data_B_i(Data_B_i), .Data_S_o(
        result_A_adder) );
  RegisterAdd_W24 Add_Subt_Result ( .clk(clk), .rst(rst), .load(load_i), .D(
        result_A_adder[23:0]), .Q(Data_Result_o) );
  RegisterAdd_W1_0 Add_overflow_Result ( .clk(clk), .rst(rst), .load(load_i), 
        .D(result_A_adder[24]), .Q(FSM_C_o) );
initial $sdf_annotate("FPU_Multiplication_Function_syn.sdf"); 
 endmodule


module Mux_3x1_W1 ( ctrl, D0, D1, D2, S );
  input [1:0] ctrl;
  input [0:0] D0;
  input [0:0] D1;
  input [0:0] D2;
  output [0:0] S;
  wire   n3, n4, n1, n2;

  OAI22X1TS U2 ( .A0(ctrl[1]), .A1(n3), .B0(n2), .B1(n4), .Y(S[0]) );
  INVX2TS U3 ( .A(ctrl[1]), .Y(n2) );
  NAND2X1TS U4 ( .A(D2[0]), .B(n1), .Y(n4) );
  AOI22X1TS U5 ( .A0(D0[0]), .A1(n1), .B0(ctrl[0]), .B1(D1[0]), .Y(n3) );
  INVX2TS U6 ( .A(ctrl[0]), .Y(n1) );
initial $sdf_annotate("FPU_Multiplication_Function_syn.sdf"); 
 endmodule


module Multiplexer_AC_W8 ( ctrl, D0, D1, S );
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
initial $sdf_annotate("FPU_Multiplication_Function_syn.sdf"); 
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
  AO22XLTS U4 ( .A0(D1[3]), .A1(n1), .B0(D0[3]), .B1(n3), .Y(S[3]) );
  AO22XLTS U5 ( .A0(D1[4]), .A1(n1), .B0(D0[4]), .B1(n3), .Y(S[4]) );
  AO22XLTS U6 ( .A0(D1[5]), .A1(n1), .B0(D0[5]), .B1(n3), .Y(S[5]) );
  AO22XLTS U7 ( .A0(D1[6]), .A1(n1), .B0(D0[6]), .B1(n3), .Y(S[6]) );
  AO22XLTS U8 ( .A0(D1[7]), .A1(n1), .B0(D0[7]), .B1(n3), .Y(S[7]) );
  AO22XLTS U9 ( .A0(D1[8]), .A1(n1), .B0(D0[8]), .B1(n4), .Y(S[8]) );
  AO22XLTS U10 ( .A0(n1), .A1(D1[9]), .B0(D0[9]), .B1(n4), .Y(S[9]) );
  AO22XLTS U11 ( .A0(D1[10]), .A1(ctrl), .B0(D0[10]), .B1(n4), .Y(S[10]) );
  INVX2TS U12 ( .A(n4), .Y(n1) );
  INVX2TS U13 ( .A(n4), .Y(n2) );
  BUFX3TS U14 ( .A(n5), .Y(n3) );
  CLKBUFX2TS U15 ( .A(n5), .Y(n4) );
  INVX2TS U16 ( .A(ctrl), .Y(n5) );
  AO22X1TS U17 ( .A0(D1[11]), .A1(ctrl), .B0(D0[11]), .B1(n4), .Y(S[11]) );
  AO22X1TS U18 ( .A0(D1[12]), .A1(n2), .B0(D0[12]), .B1(n5), .Y(S[12]) );
  AO22X1TS U19 ( .A0(D1[13]), .A1(n2), .B0(D0[13]), .B1(n5), .Y(S[13]) );
  AO22X1TS U20 ( .A0(D1[14]), .A1(n2), .B0(D0[14]), .B1(n5), .Y(S[14]) );
  AO22X1TS U21 ( .A0(D1[15]), .A1(n2), .B0(D0[15]), .B1(n5), .Y(S[15]) );
  AO22X1TS U22 ( .A0(D1[16]), .A1(n2), .B0(D0[16]), .B1(n5), .Y(S[16]) );
  AO22X1TS U23 ( .A0(D1[17]), .A1(n2), .B0(D0[17]), .B1(n5), .Y(S[17]) );
  AO22X1TS U24 ( .A0(D1[18]), .A1(n2), .B0(D0[18]), .B1(n5), .Y(S[18]) );
  AO22X1TS U25 ( .A0(D1[19]), .A1(n2), .B0(D0[19]), .B1(n5), .Y(S[19]) );
  AO22X1TS U26 ( .A0(D1[20]), .A1(n2), .B0(D0[20]), .B1(n3), .Y(S[20]) );
  AO22X1TS U27 ( .A0(D1[21]), .A1(n1), .B0(D0[21]), .B1(n3), .Y(S[21]) );
  AO22X1TS U28 ( .A0(D1[22]), .A1(n1), .B0(D0[22]), .B1(n3), .Y(S[22]) );
initial $sdf_annotate("FPU_Multiplication_Function_syn.sdf"); 
 endmodule


module RegisterAdd_W32 ( clk, rst, load, D, Q );
  input [31:0] D;
  output [31:0] Q;
  input clk, rst, load;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n65, n64, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76;

  DFFRX2TS Q_reg_31_ ( .D(n65), .CK(clk), .RN(n76), .Q(Q[31]), .QN(n32) );
  DFFRX2TS Q_reg_30_ ( .D(n63), .CK(clk), .RN(n76), .Q(Q[30]), .QN(n31) );
  DFFRX2TS Q_reg_29_ ( .D(n62), .CK(clk), .RN(n67), .Q(Q[29]), .QN(n30) );
  DFFRX2TS Q_reg_28_ ( .D(n61), .CK(clk), .RN(n67), .Q(Q[28]), .QN(n29) );
  DFFRX2TS Q_reg_27_ ( .D(n60), .CK(clk), .RN(n67), .Q(Q[27]), .QN(n28) );
  DFFRX2TS Q_reg_26_ ( .D(n59), .CK(clk), .RN(n67), .Q(Q[26]), .QN(n27) );
  DFFRX2TS Q_reg_25_ ( .D(n58), .CK(clk), .RN(n67), .Q(Q[25]), .QN(n26) );
  DFFRX2TS Q_reg_24_ ( .D(n57), .CK(clk), .RN(n67), .Q(Q[24]), .QN(n25) );
  DFFRX2TS Q_reg_23_ ( .D(n56), .CK(clk), .RN(n67), .Q(Q[23]), .QN(n24) );
  DFFRX2TS Q_reg_22_ ( .D(n55), .CK(clk), .RN(n67), .Q(Q[22]), .QN(n23) );
  DFFRX2TS Q_reg_21_ ( .D(n54), .CK(clk), .RN(n67), .Q(Q[21]), .QN(n22) );
  DFFRX2TS Q_reg_20_ ( .D(n53), .CK(clk), .RN(n67), .Q(Q[20]), .QN(n21) );
  DFFRX2TS Q_reg_19_ ( .D(n52), .CK(clk), .RN(n66), .Q(Q[19]), .QN(n20) );
  DFFRX2TS Q_reg_18_ ( .D(n51), .CK(clk), .RN(n66), .Q(Q[18]), .QN(n19) );
  DFFRX2TS Q_reg_17_ ( .D(n50), .CK(clk), .RN(n66), .Q(Q[17]), .QN(n18) );
  DFFRX2TS Q_reg_16_ ( .D(n49), .CK(clk), .RN(n66), .Q(Q[16]), .QN(n17) );
  DFFRX2TS Q_reg_15_ ( .D(n48), .CK(clk), .RN(n66), .Q(Q[15]), .QN(n16) );
  DFFRX2TS Q_reg_14_ ( .D(n47), .CK(clk), .RN(n66), .Q(Q[14]), .QN(n15) );
  DFFRX2TS Q_reg_13_ ( .D(n46), .CK(clk), .RN(n66), .Q(Q[13]), .QN(n14) );
  DFFRX2TS Q_reg_12_ ( .D(n45), .CK(clk), .RN(n66), .Q(Q[12]), .QN(n13) );
  DFFRX2TS Q_reg_11_ ( .D(n44), .CK(clk), .RN(n66), .Q(Q[11]), .QN(n12) );
  DFFRX2TS Q_reg_10_ ( .D(n43), .CK(clk), .RN(n66), .Q(Q[10]), .QN(n11) );
  DFFRX2TS Q_reg_9_ ( .D(n42), .CK(clk), .RN(n64), .Q(Q[9]), .QN(n10) );
  DFFRX2TS Q_reg_8_ ( .D(n41), .CK(clk), .RN(n64), .Q(Q[8]), .QN(n9) );
  DFFRX2TS Q_reg_7_ ( .D(n40), .CK(clk), .RN(n64), .Q(Q[7]), .QN(n8) );
  DFFRX2TS Q_reg_6_ ( .D(n39), .CK(clk), .RN(n64), .Q(Q[6]), .QN(n7) );
  DFFRX2TS Q_reg_5_ ( .D(n38), .CK(clk), .RN(n64), .Q(Q[5]), .QN(n6) );
  DFFRX2TS Q_reg_4_ ( .D(n37), .CK(clk), .RN(n64), .Q(Q[4]), .QN(n5) );
  DFFRX2TS Q_reg_3_ ( .D(n36), .CK(clk), .RN(n64), .Q(Q[3]), .QN(n4) );
  DFFRX2TS Q_reg_2_ ( .D(n35), .CK(clk), .RN(n64), .Q(Q[2]), .QN(n3) );
  DFFRX2TS Q_reg_1_ ( .D(n34), .CK(clk), .RN(n64), .Q(Q[1]), .QN(n2) );
  DFFRX2TS Q_reg_0_ ( .D(n33), .CK(clk), .RN(n64), .Q(Q[0]), .QN(n1) );
  BUFX3TS U2 ( .A(n75), .Y(n70) );
  BUFX3TS U3 ( .A(n75), .Y(n71) );
  BUFX3TS U4 ( .A(n74), .Y(n72) );
  CLKBUFX2TS U5 ( .A(n74), .Y(n73) );
  CLKBUFX2TS U6 ( .A(n68), .Y(n75) );
  CLKBUFX2TS U7 ( .A(n68), .Y(n74) );
  BUFX3TS U8 ( .A(n74), .Y(n69) );
  BUFX3TS U9 ( .A(n76), .Y(n64) );
  BUFX3TS U10 ( .A(n76), .Y(n66) );
  BUFX3TS U11 ( .A(n76), .Y(n67) );
  CLKBUFX2TS U12 ( .A(load), .Y(n68) );
  INVX2TS U13 ( .A(rst), .Y(n76) );
  OAI2BB2XLTS U14 ( .B0(n1), .B1(n70), .A0N(n73), .A1N(D[0]), .Y(n33) );
  OAI2BB2XLTS U15 ( .B0(n3), .B1(n70), .A0N(D[2]), .A1N(n72), .Y(n35) );
  OAI2BB2XLTS U16 ( .B0(n2), .B1(n73), .A0N(D[1]), .A1N(n73), .Y(n34) );
  OAI2BB2XLTS U17 ( .B0(n4), .B1(n75), .A0N(D[3]), .A1N(n72), .Y(n36) );
  OAI2BB2XLTS U18 ( .B0(n5), .B1(n75), .A0N(D[4]), .A1N(n72), .Y(n37) );
  OAI2BB2XLTS U19 ( .B0(n6), .B1(n73), .A0N(D[5]), .A1N(n71), .Y(n38) );
  OAI2BB2XLTS U20 ( .B0(n7), .B1(n74), .A0N(D[6]), .A1N(n71), .Y(n39) );
  OAI2BB2XLTS U21 ( .B0(n8), .B1(n68), .A0N(D[7]), .A1N(n71), .Y(n40) );
  OAI2BB2XLTS U22 ( .B0(n9), .B1(load), .A0N(D[8]), .A1N(n70), .Y(n41) );
  OAI2BB2XLTS U23 ( .B0(n10), .B1(load), .A0N(D[9]), .A1N(n71), .Y(n42) );
  OAI2BB2XLTS U24 ( .B0(n11), .B1(load), .A0N(D[10]), .A1N(n70), .Y(n43) );
  OAI2BB2XLTS U25 ( .B0(n12), .B1(n75), .A0N(D[11]), .A1N(n70), .Y(n44) );
  OAI2BB2XLTS U26 ( .B0(n13), .B1(n75), .A0N(D[12]), .A1N(n70), .Y(n45) );
  OAI2BB2XLTS U27 ( .B0(n14), .B1(n75), .A0N(D[13]), .A1N(n70), .Y(n46) );
  OAI2BB2XLTS U28 ( .B0(n15), .B1(load), .A0N(D[14]), .A1N(n70), .Y(n47) );
  OAI2BB2XLTS U29 ( .B0(n16), .B1(load), .A0N(D[15]), .A1N(n71), .Y(n48) );
  OAI2BB2XLTS U30 ( .B0(n17), .B1(load), .A0N(D[16]), .A1N(n70), .Y(n49) );
  OAI2BB2XLTS U31 ( .B0(n18), .B1(n68), .A0N(D[17]), .A1N(n70), .Y(n50) );
  OAI2BB2XLTS U32 ( .B0(n19), .B1(n68), .A0N(D[18]), .A1N(n71), .Y(n51) );
  OAI2BB2XLTS U33 ( .B0(n20), .B1(n68), .A0N(D[19]), .A1N(n71), .Y(n52) );
  OAI2BB2XLTS U34 ( .B0(n21), .B1(n68), .A0N(D[20]), .A1N(n71), .Y(n53) );
  OAI2BB2XLTS U35 ( .B0(n22), .B1(n69), .A0N(D[21]), .A1N(n72), .Y(n54) );
  OAI2BB2XLTS U36 ( .B0(n23), .B1(n69), .A0N(D[22]), .A1N(n71), .Y(n55) );
  OAI2BB2XLTS U37 ( .B0(n24), .B1(n69), .A0N(D[23]), .A1N(n71), .Y(n56) );
  OAI2BB2XLTS U38 ( .B0(n25), .B1(n69), .A0N(D[24]), .A1N(n72), .Y(n57) );
  OAI2BB2XLTS U39 ( .B0(n26), .B1(n69), .A0N(D[25]), .A1N(n72), .Y(n58) );
  OAI2BB2XLTS U40 ( .B0(n27), .B1(n69), .A0N(D[26]), .A1N(n72), .Y(n59) );
  OAI2BB2XLTS U41 ( .B0(n28), .B1(n69), .A0N(D[27]), .A1N(n72), .Y(n60) );
  OAI2BB2XLTS U42 ( .B0(n29), .B1(n69), .A0N(D[28]), .A1N(n72), .Y(n61) );
  OAI2BB2XLTS U43 ( .B0(n30), .B1(n69), .A0N(D[29]), .A1N(n72), .Y(n62) );
  OAI2BB2XLTS U44 ( .B0(n31), .B1(n69), .A0N(D[30]), .A1N(n73), .Y(n63) );
  OAI2BB2XLTS U45 ( .B0(n32), .B1(n74), .A0N(D[31]), .A1N(n73), .Y(n65) );
initial $sdf_annotate("FPU_Multiplication_Function_syn.sdf"); 
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
  Multiplexer_AC_W8 Exp_Mux ( .ctrl(overunder), .D0(exp_ieee_i), .D1({1'b1, 
        1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1}), .S(Exp_S_mux) );
  Multiplexer_AC_W23 Sgf_Mux ( .ctrl(overunder), .D0(sgf_ieee_i), .D1({1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .S(
        Sgf_S_mux) );
  RegisterAdd_W32 Final_Result_IEEE ( .clk(clk), .rst(rst), .load(load_i), .D(
        {Sign_S_mux, Exp_S_mux, Sgf_S_mux}), .Q(final_result_ieee_o) );
  OR2X2TS U3 ( .A(sel_a_i), .B(sel_b_i), .Y(overunder) );
initial $sdf_annotate("FPU_Multiplication_Function_syn.sdf"); 
 endmodule


module FPU_Multiplication_Function_W32_EW8_SW23 ( clk, rst, beg_FSM, ack_FSM, 
        Data_MX, Data_MY, round_mode, overflow_flag, underflow_flag, ready, 
        final_result_ieee );
  input [31:0] Data_MX;
  input [31:0] Data_MY;
  input [1:0] round_mode;
  output [31:0] final_result_ieee;
  input clk, rst, beg_FSM, ack_FSM;
  output overflow_flag, underflow_flag, ready;
  wire   zero_flag, FSM_round_flag, FSM_add_overflow_flag,
         FSM_first_phase_load, FSM_load_first_step,
         FSM_exp_operation_load_result, FSM_load_second_step,
         FSM_adder_round_norm_load, FSM_final_result_load,
         FSM_barrel_shifter_load, selector_A, load_b, selector_C,
         FSM_exp_operation_A_S, FSM_Shift_Value, rst_int, FSM_selector_A,
         FSM_selector_C, sign_final_result, n1;
  wire   [1:0] selector_B;
  wire   [1:0] FSM_selector_B;
  wire   [31:0] Op_MX;
  wire   [31:0] Op_MY;
  wire   [8:0] exp_oper_result;
  wire   [8:0] S_Oper_A_exp;
  wire   [7:0] S_Oper_B_exp;
  wire   [23:0] significand;
  wire   [22:0] non_significand;
  wire   [23:0] Add_result;
  wire   [23:0] S_Data_Shift;
  wire   [23:0] Sgf_normalized_result;

  FSM_Mult_Function FS_Module ( .clk(clk), .rst(rst), .beg_FSM(beg_FSM), 
        .ack_FSM(ack_FSM), .zero_flag_i(zero_flag), .Mult_shift_i(1'b0), 
        .round_flag_i(FSM_round_flag), .Add_Overflow_i(FSM_add_overflow_flag), 
        .load_0_o(FSM_first_phase_load), .load_1_o(FSM_load_first_step), 
        .load_2_o(FSM_exp_operation_load_result), .load_3_o(
        FSM_load_second_step), .load_4_o(FSM_adder_round_norm_load), 
        .load_5_o(FSM_final_result_load), .load_6_o(FSM_barrel_shifter_load), 
        .ctrl_select_a_o(selector_A), .ctrl_select_b_o(load_b), .selector_b_o(
        selector_B), .ctrl_select_c_o(selector_C), .exp_op_o(
        FSM_exp_operation_A_S), .shift_value_o(FSM_Shift_Value), .rst_int(
        rst_int), .ready(ready) );
  RegisterAdd_W1_3 Sel_A ( .clk(clk), .rst(rst_int), .load(selector_A), .D(
        1'b1), .Q(FSM_selector_A) );
  RegisterAdd_W1_2 Sel_C ( .clk(clk), .rst(n1), .load(selector_C), .D(1'b1), 
        .Q(FSM_selector_C) );
  RegisterAdd_W2 Sel_B ( .clk(clk), .rst(rst_int), .load(load_b), .D(
        selector_B), .Q(FSM_selector_B) );
  First_Phase_M_W32 Operands_load_reg ( .clk(clk), .rst(rst_int), .load(
        FSM_first_phase_load), .Data_MX(Data_MX), .Data_MY(Data_MY), .Op_MX(
        Op_MX), .Op_MY(Op_MY) );
  Zero_InfMult_Unit_W32 Zero_Result_Detect ( .clk(clk), .rst(n1), .load(
        FSM_load_first_step), .Data_A(Op_MX[30:0]), .Data_B(Op_MY[30:0]), 
        .zero_m_flag(zero_flag) );
  Multiplexer_AC_W9 Exp_Oper_A_mux ( .ctrl(FSM_selector_A), .D0({1'b0, 
        Op_MX[30:23]}), .D1(exp_oper_result), .S(S_Oper_A_exp) );
  Mux_3x1_W8 Exp_Oper_B_mux ( .ctrl(FSM_selector_B), .D0(Op_MY[30:23]), .D1({
        1'b0, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1}), .D2({1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b1}), .S(S_Oper_B_exp) );
  Exp_Operation_m_EW8 Exp_module ( .clk(clk), .rst(n1), .load_a_i(
        FSM_load_first_step), .load_b_i(FSM_load_second_step), .load_c_i(
        FSM_exp_operation_load_result), .Data_A_i(S_Oper_A_exp), .Data_B_i({
        1'b0, S_Oper_B_exp}), .Add_Subt_i(FSM_exp_operation_A_S), 
        .Data_Result_o(exp_oper_result), .Overflow_flag_o(overflow_flag), 
        .Underflow_flag_o(underflow_flag) );
  XOR_M Sign_operation ( .Sgn_X(Op_MX[31]), .Sgn_Y(Op_MY[31]), .Sgn_Info(
        sign_final_result) );
  Multiplexer_AC_W24 Barrel_Shifter_D_I_mux ( .ctrl(FSM_selector_C), .D0({1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), 
        .D1(Add_result), .S(S_Data_Shift) );
  Barrel_Shifter_M_SW24 Barrel_Shifter_module ( .clk(clk), .rst(n1), .load_i(
        FSM_barrel_shifter_load), .Shift_Value_i(FSM_Shift_Value), 
        .Shift_Data_i(S_Data_Shift), .N_mant_o(Sgf_normalized_result) );
  Round_decoder_M_SW23 Round_Decoder ( .Round_Bits_i({1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .Round_Mode_i(round_mode), 
        .Sign_Result_i(sign_final_result), .Round_Flag_o(FSM_round_flag) );
  Adder_Round_SW24 Adder_M ( .clk(clk), .rst(n1), .load_i(
        FSM_adder_round_norm_load), .Data_A_i(Sgf_normalized_result), 
        .Data_B_i({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b1, 1'b0, 1'b1, 
        1'b1, 1'b1}), .Data_Result_o(Add_result), .FSM_C_o(
        FSM_add_overflow_flag) );
  Tenth_Phase_W32_EW8_SW23 final_result_ieee_Module ( .clk(clk), .rst(n1), 
        .load_i(FSM_final_result_load), .sel_a_i(overflow_flag), .sel_b_i(
        underflow_flag), .sign_i(sign_final_result), .exp_ieee_i(
        exp_oper_result[7:0]), .sgf_ieee_i(Sgf_normalized_result[22:0]), 
        .final_result_ieee_o(final_result_ieee) );
  BUFX3TS U3 ( .A(rst_int), .Y(n1) );
initial $sdf_annotate("FPU_Multiplication_Function_syn.sdf"); 
 endmodule

