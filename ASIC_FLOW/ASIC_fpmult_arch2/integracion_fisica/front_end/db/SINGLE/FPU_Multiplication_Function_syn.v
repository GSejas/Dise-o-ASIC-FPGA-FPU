/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : L-2016.03-SP3
// Date      : Wed Oct 26 12:27:36 2016
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
         n40, n41, n4, load_1_o, n7, n9, n42;
  wire   [3:0] state_reg;
  assign ctrl_select_a_o = load_1_o;

  DFFRX2TS state_reg_reg_3_ ( .D(n40), .CK(clk), .RN(n42), .Q(state_reg[3]), 
        .QN(n8) );
  DFFRX2TS state_reg_reg_1_ ( .D(n39), .CK(clk), .RN(n42), .Q(state_reg[1]), 
        .QN(n13) );
  DFFRX2TS state_reg_reg_2_ ( .D(n38), .CK(clk), .RN(n42), .Q(state_reg[2]) );
  DFFRX2TS state_reg_reg_0_ ( .D(n41), .CK(clk), .RN(n42), .Q(state_reg[0]), 
        .QN(n14) );
  AOI32X1TS U3 ( .A0(n36), .A1(n14), .A2(state_reg[1]), .B0(n27), .B1(
        Add_Overflow_i), .Y(n15) );
  INVX2TS U4 ( .A(n19), .Y(exp_op_o) );
  NOR2X1TS U5 ( .A(state_reg[1]), .B(state_reg[0]), .Y(n35) );
  NAND3X1TS U6 ( .A(state_reg[0]), .B(state_reg[1]), .C(n28), .Y(n20) );
  NOR3BX1TS U7 ( .AN(n28), .B(n14), .C(state_reg[1]), .Y(load_0_o) );
  NAND3X1TS U8 ( .A(n37), .B(n13), .C(state_reg[0]), .Y(n29) );
  AOI21X1TS U9 ( .A0(state_reg[1]), .A1(n36), .B0(n27), .Y(n30) );
  INVX2TS U10 ( .A(n19), .Y(n9) );
  INVX2TS U11 ( .A(n24), .Y(n7) );
  INVX2TS U12 ( .A(n17), .Y(rst_int) );
  NAND2X1TS U13 ( .A(n35), .B(n36), .Y(n19) );
  INVX2TS U14 ( .A(n18), .Y(ready) );
  NAND2BX1TS U15 ( .AN(load_3_o), .B(n20), .Y(load_2_o) );
  NAND2X1TS U16 ( .A(n19), .B(n15), .Y(load_3_o) );
  NAND2X1TS U17 ( .A(n35), .B(n28), .Y(n17) );
  INVX2TS U18 ( .A(n30), .Y(load_6_o) );
  INVX2TS U19 ( .A(n15), .Y(shift_value_o) );
  INVX2TS U20 ( .A(n21), .Y(n4) );
  NAND2X1TS U21 ( .A(n35), .B(n37), .Y(n24) );
  INVX2TS U22 ( .A(n31), .Y(load_5_o) );
  INVX2TS U23 ( .A(n20), .Y(load_1_o) );
  INVX2TS U24 ( .A(n29), .Y(load_4_o) );
  NAND2X1TS U25 ( .A(n20), .B(n29), .Y(selector_b_o[0]) );
  OAI22X1TS U26 ( .A0(beg_FSM), .A1(n17), .B0(ack_FSM), .B1(n18), .Y(n23) );
  NOR2BX1TS U27 ( .AN(round_flag_i), .B(n24), .Y(ctrl_select_c_o) );
  NAND4X1TS U28 ( .A(n29), .B(n30), .C(n31), .D(n32), .Y(n40) );
  AOI221X1TS U29 ( .A0(state_reg[3]), .A1(n23), .B0(zero_flag_i), .B1(n9), 
        .C0(n7), .Y(n32) );
  OAI211X1TS U30 ( .A0(round_flag_i), .A1(n24), .B0(n25), .C0(n26), .Y(n39) );
  NOR3X1TS U31 ( .A(load_4_o), .B(load_0_o), .C(n27), .Y(n26) );
  AOI31X1TS U32 ( .A0(state_reg[1]), .A1(n14), .A2(n28), .B0(n4), .Y(n25) );
  NOR2BX1TS U33 ( .AN(state_reg[2]), .B(state_reg[3]), .Y(n36) );
  NAND3X1TS U34 ( .A(state_reg[2]), .B(state_reg[3]), .C(n35), .Y(n18) );
  NAND4X1TS U35 ( .A(n19), .B(n20), .C(n21), .D(n22), .Y(n38) );
  AOI21X1TS U36 ( .A0(state_reg[2]), .A1(n23), .B0(load_5_o), .Y(n22) );
  AOI21X1TS U37 ( .A0(n33), .A1(n34), .B0(n23), .Y(n41) );
  AOI211X1TS U38 ( .A0(n28), .A1(n14), .B0(n27), .C0(n7), .Y(n34) );
  OA22X1TS U39 ( .A0(n21), .A1(Mult_shift_i), .B0(n19), .B1(zero_flag_i), .Y(
        n33) );
  NOR2X1TS U40 ( .A(n8), .B(state_reg[2]), .Y(n37) );
  NOR2X1TS U41 ( .A(state_reg[2]), .B(state_reg[3]), .Y(n28) );
  NAND3X1TS U42 ( .A(n36), .B(n13), .C(state_reg[0]), .Y(n21) );
  AND3X2TS U43 ( .A(n37), .B(n14), .C(state_reg[1]), .Y(n27) );
  NAND3X1TS U44 ( .A(state_reg[1]), .B(n37), .C(state_reg[0]), .Y(n31) );
  AO21X1TS U45 ( .A0(Mult_shift_i), .A1(n4), .B0(selector_b_o[0]), .Y(
        ctrl_select_b_o) );
  NOR3BX1TS U46 ( .AN(Mult_shift_i), .B(n16), .C(n14), .Y(selector_b_o[1]) );
  NAND3X1TS U47 ( .A(n13), .B(n8), .C(state_reg[2]), .Y(n16) );
  INVX2TS U48 ( .A(rst), .Y(n42) );
initial $sdf_annotate("FPU_Multiplication_Function_syn.sdf"); 
 endmodule


module RegisterAdd_W1_3 ( clk, rst, load, D, Q );
  input [0:0] D;
  output [0:0] Q;
  input clk, rst, load;
  wire   n1, n3, n2;

  DFFRX2TS Q_reg_0_ ( .D(n3), .CK(clk), .RN(n2), .Q(Q[0]), .QN(n1) );
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

  DFFRX2TS Q_reg_1_ ( .D(n5), .CK(clk), .RN(n4), .Q(Q[1]), .QN(n2) );
  DFFRX2TS Q_reg_0_ ( .D(n3), .CK(clk), .RN(n4), .Q(Q[0]), .QN(n1) );
  INVX2TS U2 ( .A(rst), .Y(n4) );
  OAI2BB2XLTS U3 ( .B0(n1), .B1(load), .A0N(load), .A1N(D[0]), .Y(n3) );
  OAI2BB2XLTS U4 ( .B0(n2), .B1(load), .A0N(D[1]), .A1N(load), .Y(n5) );
initial $sdf_annotate("FPU_Multiplication_Function_syn.sdf"); 
 endmodule


module RegisterMult_W32_1 ( clk, rst, load, D, Q );
  input [31:0] D;
  output [31:0] Q;
  input clk, rst, load;
  wire   n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37,
         n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51,
         n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n65, n1,
         n3, n5, n7, n9, n11, n13, n15, n17, n20, n21, n22, n23, n64, n66, n67,
         n68, n72, n74, n76, n78, n80, n82, n84, n86, n88, n90, n92;

  DFFRX2TS Q_reg_31_ ( .D(n65), .CK(clk), .RN(n20), .Q(Q[31]), .QN(n32) );
  DFFRX2TS Q_reg_30_ ( .D(n63), .CK(clk), .RN(n20), .Q(Q[30]), .QN(n31) );
  DFFRX2TS Q_reg_27_ ( .D(n60), .CK(clk), .RN(n20), .Q(Q[27]), .QN(n28) );
  DFFRX2TS Q_reg_26_ ( .D(n59), .CK(clk), .RN(n20), .Q(Q[26]), .QN(n27) );
  DFFRX2TS Q_reg_29_ ( .D(n62), .CK(clk), .RN(n20), .Q(Q[29]), .QN(n30) );
  DFFRX2TS Q_reg_28_ ( .D(n61), .CK(clk), .RN(n20), .Q(Q[28]), .QN(n29) );
  DFFRX2TS Q_reg_25_ ( .D(n58), .CK(clk), .RN(n20), .Q(Q[25]), .QN(n26) );
  DFFRX2TS Q_reg_24_ ( .D(n57), .CK(clk), .RN(n20), .Q(Q[24]), .QN(n25) );
  DFFRX2TS Q_reg_23_ ( .D(n56), .CK(clk), .RN(n20), .Q(Q[23]), .QN(n24) );
  DFFRX2TS Q_reg_10_ ( .D(n43), .CK(clk), .RN(n22), .Q(Q[10]) );
  DFFRX2TS Q_reg_6_ ( .D(n39), .CK(clk), .RN(n22), .Q(Q[6]) );
  DFFRX2TS Q_reg_4_ ( .D(n37), .CK(clk), .RN(n22), .Q(Q[4]) );
  DFFRX2TS Q_reg_8_ ( .D(n41), .CK(clk), .RN(n22), .Q(Q[8]) );
  DFFRX2TS Q_reg_2_ ( .D(n35), .CK(clk), .RN(n22), .Q(Q[2]) );
  DFFRX2TS Q_reg_22_ ( .D(n55), .CK(clk), .RN(n20), .Q(Q[22]) );
  DFFRX2TS Q_reg_20_ ( .D(n53), .CK(clk), .RN(n21), .Q(Q[20]) );
  DFFRX2TS Q_reg_18_ ( .D(n51), .CK(clk), .RN(n21), .Q(Q[18]) );
  DFFRX2TS Q_reg_16_ ( .D(n49), .CK(clk), .RN(n21), .Q(Q[16]) );
  DFFRX2TS Q_reg_14_ ( .D(n47), .CK(clk), .RN(n21), .Q(Q[14]) );
  DFFRX2TS Q_reg_0_ ( .D(n33), .CK(clk), .RN(n92), .Q(Q[0]) );
  DFFRX2TS Q_reg_12_ ( .D(n45), .CK(clk), .RN(n21), .Q(Q[12]) );
  DFFRX2TS Q_reg_1_ ( .D(n34), .CK(clk), .RN(n92), .Q(Q[1]) );
  DFFRX2TS Q_reg_11_ ( .D(n44), .CK(clk), .RN(n22), .Q(n80), .QN(n1) );
  DFFRX2TS Q_reg_21_ ( .D(n54), .CK(clk), .RN(n21), .Q(n90), .QN(n17) );
  DFFRX2TS Q_reg_19_ ( .D(n52), .CK(clk), .RN(n21), .Q(n88), .QN(n15) );
  DFFRX2TS Q_reg_17_ ( .D(n50), .CK(clk), .RN(n21), .Q(n86), .QN(n13) );
  DFFRX2TS Q_reg_15_ ( .D(n48), .CK(clk), .RN(n21), .Q(n84), .QN(n11) );
  DFFRX2TS Q_reg_9_ ( .D(n42), .CK(clk), .RN(n22), .Q(n78), .QN(n9) );
  DFFRX2TS Q_reg_7_ ( .D(n40), .CK(clk), .RN(n22), .Q(n76), .QN(n7) );
  DFFRX2TS Q_reg_5_ ( .D(n38), .CK(clk), .RN(n22), .Q(n74), .QN(n5) );
  DFFRX2TS Q_reg_3_ ( .D(n36), .CK(clk), .RN(n22), .Q(n72), .QN(n3) );
  DFFRX2TS Q_reg_13_ ( .D(n46), .CK(clk), .RN(n21), .Q(n82) );
  BUFX3TS U2 ( .A(n82), .Y(Q[13]) );
  INVX2TS U3 ( .A(n3), .Y(Q[3]) );
  INVX2TS U4 ( .A(n5), .Y(Q[5]) );
  INVX2TS U5 ( .A(n7), .Y(Q[7]) );
  INVX2TS U6 ( .A(n9), .Y(Q[9]) );
  INVX2TS U7 ( .A(n11), .Y(Q[15]) );
  INVX2TS U8 ( .A(n13), .Y(Q[17]) );
  INVX2TS U9 ( .A(n15), .Y(Q[19]) );
  INVX2TS U10 ( .A(n17), .Y(Q[21]) );
  INVX2TS U11 ( .A(n1), .Y(Q[11]) );
  CLKBUFX2TS U12 ( .A(n92), .Y(n22) );
  CLKBUFX2TS U13 ( .A(n92), .Y(n21) );
  CLKBUFX2TS U14 ( .A(n92), .Y(n20) );
  INVX2TS U15 ( .A(rst), .Y(n92) );
  CLKBUFX2TS U16 ( .A(n23), .Y(n64) );
  CLKBUFX2TS U17 ( .A(load), .Y(n67) );
  CLKBUFX2TS U18 ( .A(n23), .Y(n66) );
  CLKBUFX2TS U19 ( .A(load), .Y(n68) );
  CLKBUFX2TS U20 ( .A(load), .Y(n23) );
  OAI2BB2XLTS U21 ( .B0(n24), .B1(n64), .A0N(D[23]), .A1N(n68), .Y(n56) );
  OAI2BB2XLTS U22 ( .B0(n25), .B1(n64), .A0N(D[24]), .A1N(n68), .Y(n57) );
  OAI2BB2XLTS U23 ( .B0(n26), .B1(n64), .A0N(D[25]), .A1N(n68), .Y(n58) );
  OAI2BB2XLTS U24 ( .B0(n27), .B1(n64), .A0N(D[26]), .A1N(n68), .Y(n59) );
  OAI2BB2XLTS U25 ( .B0(n28), .B1(n64), .A0N(D[27]), .A1N(n68), .Y(n60) );
  OAI2BB2XLTS U26 ( .B0(n29), .B1(n64), .A0N(D[28]), .A1N(n68), .Y(n61) );
  OAI2BB2XLTS U27 ( .B0(n30), .B1(n64), .A0N(D[29]), .A1N(n68), .Y(n62) );
  OAI2BB2XLTS U28 ( .B0(n31), .B1(n64), .A0N(D[30]), .A1N(n68), .Y(n63) );
  OAI2BB2XLTS U29 ( .B0(n32), .B1(n64), .A0N(D[31]), .A1N(load), .Y(n65) );
  CLKMX2X2TS U30 ( .A(Q[2]), .B(D[2]), .S0(n68), .Y(n35) );
  CLKMX2X2TS U31 ( .A(n72), .B(D[3]), .S0(n68), .Y(n36) );
  CLKMX2X2TS U32 ( .A(Q[0]), .B(D[0]), .S0(n66), .Y(n33) );
  CLKMX2X2TS U33 ( .A(Q[1]), .B(D[1]), .S0(n64), .Y(n34) );
  CLKMX2X2TS U34 ( .A(Q[4]), .B(D[4]), .S0(n67), .Y(n37) );
  CLKMX2X2TS U35 ( .A(n74), .B(D[5]), .S0(n67), .Y(n38) );
  CLKMX2X2TS U36 ( .A(Q[6]), .B(D[6]), .S0(n67), .Y(n39) );
  CLKMX2X2TS U37 ( .A(n76), .B(D[7]), .S0(n67), .Y(n40) );
  CLKMX2X2TS U38 ( .A(Q[8]), .B(D[8]), .S0(n67), .Y(n41) );
  CLKMX2X2TS U39 ( .A(n78), .B(D[9]), .S0(n67), .Y(n42) );
  CLKMX2X2TS U40 ( .A(Q[10]), .B(D[10]), .S0(n67), .Y(n43) );
  CLKMX2X2TS U41 ( .A(n80), .B(D[11]), .S0(n67), .Y(n44) );
  CLKMX2X2TS U42 ( .A(Q[12]), .B(D[12]), .S0(n67), .Y(n45) );
  CLKMX2X2TS U43 ( .A(n82), .B(D[13]), .S0(n67), .Y(n46) );
  CLKMX2X2TS U44 ( .A(Q[14]), .B(D[14]), .S0(n66), .Y(n47) );
  CLKMX2X2TS U45 ( .A(n84), .B(D[15]), .S0(n66), .Y(n48) );
  CLKMX2X2TS U46 ( .A(Q[16]), .B(D[16]), .S0(n66), .Y(n49) );
  CLKMX2X2TS U47 ( .A(n86), .B(D[17]), .S0(n66), .Y(n50) );
  CLKMX2X2TS U48 ( .A(Q[18]), .B(D[18]), .S0(n66), .Y(n51) );
  CLKMX2X2TS U49 ( .A(n88), .B(D[19]), .S0(n66), .Y(n52) );
  CLKMX2X2TS U50 ( .A(Q[20]), .B(D[20]), .S0(n66), .Y(n53) );
  CLKMX2X2TS U51 ( .A(n90), .B(D[21]), .S0(n66), .Y(n54) );
  CLKMX2X2TS U52 ( .A(Q[22]), .B(D[22]), .S0(n66), .Y(n55) );
initial $sdf_annotate("FPU_Multiplication_Function_syn.sdf"); 
 endmodule


module RegisterMult_W32_0 ( clk, rst, load, D, Q );
  input [31:0] D;
  output [31:0] Q;
  input clk, rst, load;
  wire   n1, n2, n3, n4, n5, n6, n7, n10, n11, n12, n13, n14, n15, n16, n17,
         n18, n19, n20, n21, n22, n23, n52, n53, n54, n55, n56, n57, n58, n59,
         n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73,
         n74, n75, n76, n77, n78, n79;

  DFFRX2TS Q_reg_31_ ( .D(n11), .CK(clk), .RN(n1), .Q(Q[31]), .QN(n71) );
  DFFRX2TS Q_reg_30_ ( .D(n12), .CK(clk), .RN(n1), .Q(Q[30]), .QN(n72) );
  DFFRX2TS Q_reg_27_ ( .D(n15), .CK(clk), .RN(n1), .Q(Q[27]), .QN(n75) );
  DFFRX2TS Q_reg_26_ ( .D(n16), .CK(clk), .RN(n1), .Q(Q[26]), .QN(n76) );
  DFFRX2TS Q_reg_29_ ( .D(n13), .CK(clk), .RN(n1), .Q(Q[29]), .QN(n73) );
  DFFRX2TS Q_reg_28_ ( .D(n14), .CK(clk), .RN(n1), .Q(Q[28]), .QN(n74) );
  DFFRX2TS Q_reg_25_ ( .D(n17), .CK(clk), .RN(n1), .Q(Q[25]), .QN(n77) );
  DFFRX2TS Q_reg_24_ ( .D(n18), .CK(clk), .RN(n1), .Q(Q[24]), .QN(n78) );
  DFFRX2TS Q_reg_23_ ( .D(n19), .CK(clk), .RN(n1), .Q(Q[23]), .QN(n79) );
  DFFRX2TS Q_reg_11_ ( .D(n59), .CK(clk), .RN(n3), .Q(Q[11]) );
  DFFRX2TS Q_reg_10_ ( .D(n60), .CK(clk), .RN(n3), .Q(Q[10]) );
  DFFRX2TS Q_reg_9_ ( .D(n61), .CK(clk), .RN(n3), .Q(Q[9]) );
  DFFRX2TS Q_reg_22_ ( .D(n20), .CK(clk), .RN(n1), .Q(Q[22]) );
  DFFRX2TS Q_reg_21_ ( .D(n21), .CK(clk), .RN(n2), .Q(Q[21]) );
  DFFRX2TS Q_reg_20_ ( .D(n22), .CK(clk), .RN(n2), .Q(Q[20]) );
  DFFRX2TS Q_reg_8_ ( .D(n62), .CK(clk), .RN(n3), .Q(Q[8]) );
  DFFRX2TS Q_reg_7_ ( .D(n63), .CK(clk), .RN(n3), .Q(Q[7]) );
  DFFRX2TS Q_reg_5_ ( .D(n65), .CK(clk), .RN(n3), .Q(Q[5]) );
  DFFRX2TS Q_reg_6_ ( .D(n64), .CK(clk), .RN(n3), .Q(Q[6]) );
  DFFRX2TS Q_reg_4_ ( .D(n66), .CK(clk), .RN(n3), .Q(Q[4]) );
  DFFRX2TS Q_reg_3_ ( .D(n67), .CK(clk), .RN(n3), .Q(Q[3]) );
  DFFRX2TS Q_reg_19_ ( .D(n23), .CK(clk), .RN(n2), .Q(Q[19]) );
  DFFRX2TS Q_reg_17_ ( .D(n53), .CK(clk), .RN(n2), .Q(Q[17]) );
  DFFRX2TS Q_reg_15_ ( .D(n55), .CK(clk), .RN(n2), .Q(Q[15]) );
  DFFRX2TS Q_reg_18_ ( .D(n52), .CK(clk), .RN(n2), .Q(Q[18]) );
  DFFRX2TS Q_reg_16_ ( .D(n54), .CK(clk), .RN(n2), .Q(Q[16]) );
  DFFRX2TS Q_reg_14_ ( .D(n56), .CK(clk), .RN(n2), .Q(Q[14]) );
  DFFRX2TS Q_reg_2_ ( .D(n68), .CK(clk), .RN(n3), .Q(Q[2]) );
  DFFRX2TS Q_reg_13_ ( .D(n57), .CK(clk), .RN(n2), .Q(Q[13]) );
  DFFRX2TS Q_reg_1_ ( .D(n69), .CK(clk), .RN(n10), .Q(Q[1]) );
  DFFRX2TS Q_reg_12_ ( .D(n58), .CK(clk), .RN(n2), .Q(Q[12]) );
  DFFRX2TS Q_reg_0_ ( .D(n70), .CK(clk), .RN(n10), .Q(Q[0]) );
  CLKBUFX2TS U2 ( .A(n10), .Y(n3) );
  CLKBUFX2TS U3 ( .A(n10), .Y(n2) );
  CLKBUFX2TS U4 ( .A(n10), .Y(n1) );
  INVX2TS U5 ( .A(rst), .Y(n10) );
  CLKBUFX2TS U6 ( .A(n4), .Y(n6) );
  CLKBUFX2TS U7 ( .A(n4), .Y(n5) );
  CLKBUFX2TS U8 ( .A(n4), .Y(n7) );
  CLKBUFX2TS U9 ( .A(load), .Y(n4) );
  OAI2BB2XLTS U10 ( .B0(n79), .B1(n4), .A0N(D[23]), .A1N(n7), .Y(n19) );
  OAI2BB2XLTS U11 ( .B0(n78), .B1(n4), .A0N(D[24]), .A1N(n7), .Y(n18) );
  OAI2BB2XLTS U12 ( .B0(n77), .B1(load), .A0N(D[25]), .A1N(n7), .Y(n17) );
  OAI2BB2XLTS U13 ( .B0(n76), .B1(n4), .A0N(D[26]), .A1N(n7), .Y(n16) );
  OAI2BB2XLTS U14 ( .B0(n75), .B1(n4), .A0N(D[27]), .A1N(n7), .Y(n15) );
  OAI2BB2XLTS U15 ( .B0(n74), .B1(load), .A0N(D[28]), .A1N(n7), .Y(n14) );
  OAI2BB2XLTS U16 ( .B0(n73), .B1(load), .A0N(D[29]), .A1N(n7), .Y(n13) );
  OAI2BB2XLTS U17 ( .B0(n72), .B1(n4), .A0N(D[30]), .A1N(n7), .Y(n12) );
  OAI2BB2XLTS U18 ( .B0(n71), .B1(n4), .A0N(D[31]), .A1N(load), .Y(n11) );
  CLKMX2X2TS U19 ( .A(Q[2]), .B(D[2]), .S0(n7), .Y(n68) );
  CLKMX2X2TS U20 ( .A(Q[3]), .B(D[3]), .S0(n7), .Y(n67) );
  CLKMX2X2TS U21 ( .A(Q[0]), .B(D[0]), .S0(n5), .Y(n70) );
  CLKMX2X2TS U22 ( .A(Q[1]), .B(D[1]), .S0(n4), .Y(n69) );
  CLKMX2X2TS U23 ( .A(Q[4]), .B(D[4]), .S0(n6), .Y(n66) );
  CLKMX2X2TS U24 ( .A(Q[5]), .B(D[5]), .S0(n6), .Y(n65) );
  CLKMX2X2TS U25 ( .A(Q[6]), .B(D[6]), .S0(n6), .Y(n64) );
  CLKMX2X2TS U26 ( .A(Q[7]), .B(D[7]), .S0(n6), .Y(n63) );
  CLKMX2X2TS U27 ( .A(Q[8]), .B(D[8]), .S0(n6), .Y(n62) );
  CLKMX2X2TS U28 ( .A(Q[9]), .B(D[9]), .S0(n6), .Y(n61) );
  CLKMX2X2TS U29 ( .A(Q[10]), .B(D[10]), .S0(n6), .Y(n60) );
  CLKMX2X2TS U30 ( .A(Q[11]), .B(D[11]), .S0(n6), .Y(n59) );
  CLKMX2X2TS U31 ( .A(Q[12]), .B(D[12]), .S0(n6), .Y(n58) );
  CLKMX2X2TS U32 ( .A(Q[13]), .B(D[13]), .S0(n6), .Y(n57) );
  CLKMX2X2TS U33 ( .A(Q[14]), .B(D[14]), .S0(n5), .Y(n56) );
  CLKMX2X2TS U34 ( .A(Q[15]), .B(D[15]), .S0(n5), .Y(n55) );
  CLKMX2X2TS U35 ( .A(Q[16]), .B(D[16]), .S0(n5), .Y(n54) );
  CLKMX2X2TS U36 ( .A(Q[17]), .B(D[17]), .S0(n5), .Y(n53) );
  CLKMX2X2TS U37 ( .A(Q[18]), .B(D[18]), .S0(n5), .Y(n52) );
  CLKMX2X2TS U38 ( .A(Q[19]), .B(D[19]), .S0(n5), .Y(n23) );
  CLKMX2X2TS U39 ( .A(Q[20]), .B(D[20]), .S0(n5), .Y(n22) );
  CLKMX2X2TS U40 ( .A(Q[21]), .B(D[21]), .S0(n5), .Y(n21) );
  CLKMX2X2TS U41 ( .A(Q[22]), .B(D[22]), .S0(n5), .Y(n20) );
initial $sdf_annotate("FPU_Multiplication_Function_syn.sdf"); 
 endmodule


module First_Phase_M_W32 ( clk, rst, load, Data_MX, Data_MY, Op_MX, Op_MY );
  input [31:0] Data_MX;
  input [31:0] Data_MY;
  output [31:0] Op_MX;
  output [31:0] Op_MY;
  input clk, rst, load;


  RegisterMult_W32_1 XMRegister ( .clk(clk), .rst(rst), .load(load), .D(
        Data_MX), .Q(Op_MX) );
  RegisterMult_W32_0 YMRegister ( .clk(clk), .rst(rst), .load(load), .D(
        Data_MY), .Q(Op_MY) );
initial $sdf_annotate("FPU_Multiplication_Function_syn.sdf"); 
 endmodule


module Comparator_Equal_S31_1 ( Data_A, Data_B, equal_sgn );
  input [30:0] Data_A;
  input [30:0] Data_B;
  output equal_sgn;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40;

  XOR2XLTS U1 ( .A(Data_B[1]), .B(Data_A[1]), .Y(n17) );
  NOR4XLTS U2 ( .A(n25), .B(n26), .C(n27), .D(n28), .Y(n24) );
  NAND4X1TS U3 ( .A(n21), .B(n22), .C(n23), .D(n24), .Y(n1) );
  NOR4XLTS U4 ( .A(n33), .B(n34), .C(n35), .D(n36), .Y(n22) );
  NOR4XLTS U5 ( .A(n29), .B(n30), .C(n31), .D(n32), .Y(n23) );
  NOR4XLTS U6 ( .A(n37), .B(n38), .C(n39), .D(n40), .Y(n21) );
  XNOR2X1TS U7 ( .A(Data_B[5]), .B(Data_A[5]), .Y(n8) );
  XNOR2X1TS U8 ( .A(Data_B[9]), .B(Data_A[9]), .Y(n12) );
  NOR4XLTS U9 ( .A(n17), .B(n18), .C(n19), .D(n20), .Y(n16) );
  XOR2X1TS U10 ( .A(Data_B[2]), .B(Data_A[2]), .Y(n18) );
  XOR2X1TS U11 ( .A(Data_B[24]), .B(Data_A[24]), .Y(n20) );
  XOR2X1TS U12 ( .A(Data_B[28]), .B(Data_A[28]), .Y(n25) );
  XOR2X1TS U13 ( .A(Data_B[30]), .B(Data_A[30]), .Y(n26) );
  XOR2X1TS U14 ( .A(Data_B[29]), .B(Data_A[29]), .Y(n27) );
  NOR4XLTS U15 ( .A(n1), .B(n2), .C(n3), .D(n4), .Y(equal_sgn) );
  NAND4X1TS U16 ( .A(n5), .B(n6), .C(n7), .D(n8), .Y(n4) );
  XNOR2X1TS U17 ( .A(Data_B[6]), .B(Data_A[6]), .Y(n7) );
  XNOR2X1TS U18 ( .A(Data_B[0]), .B(Data_A[0]), .Y(n5) );
  XNOR2X1TS U19 ( .A(Data_B[7]), .B(Data_A[7]), .Y(n6) );
  NAND4X1TS U20 ( .A(n9), .B(n10), .C(n11), .D(n12), .Y(n3) );
  XNOR2X1TS U21 ( .A(Data_B[4]), .B(Data_A[4]), .Y(n9) );
  XNOR2X1TS U22 ( .A(Data_B[10]), .B(Data_A[10]), .Y(n11) );
  XNOR2X1TS U23 ( .A(Data_B[11]), .B(Data_A[11]), .Y(n10) );
  NAND4X1TS U24 ( .A(n13), .B(n14), .C(n15), .D(n16), .Y(n2) );
  XNOR2X1TS U25 ( .A(Data_B[25]), .B(Data_A[25]), .Y(n13) );
  XNOR2X1TS U26 ( .A(Data_B[27]), .B(Data_A[27]), .Y(n14) );
  XNOR2X1TS U27 ( .A(Data_B[26]), .B(Data_A[26]), .Y(n15) );
  XOR2X1TS U28 ( .A(Data_B[13]), .B(Data_A[13]), .Y(n37) );
  XOR2X1TS U29 ( .A(Data_B[19]), .B(Data_A[19]), .Y(n28) );
  XOR2X1TS U30 ( .A(Data_B[12]), .B(Data_A[12]), .Y(n36) );
  XOR2X1TS U31 ( .A(Data_B[8]), .B(Data_A[8]), .Y(n40) );
  XOR2X1TS U32 ( .A(Data_B[23]), .B(Data_A[23]), .Y(n32) );
  XOR2X1TS U33 ( .A(Data_B[15]), .B(Data_A[15]), .Y(n39) );
  XOR2X1TS U34 ( .A(Data_B[3]), .B(Data_A[3]), .Y(n19) );
  XOR2X1TS U35 ( .A(Data_B[16]), .B(Data_A[16]), .Y(n31) );
  XOR2X1TS U36 ( .A(Data_B[20]), .B(Data_A[20]), .Y(n35) );
  XOR2X1TS U37 ( .A(Data_B[17]), .B(Data_A[17]), .Y(n30) );
  XOR2X1TS U38 ( .A(Data_B[21]), .B(Data_A[21]), .Y(n34) );
  XOR2X1TS U39 ( .A(Data_B[14]), .B(Data_A[14]), .Y(n38) );
  XOR2X1TS U40 ( .A(Data_B[18]), .B(Data_A[18]), .Y(n29) );
  XOR2X1TS U41 ( .A(Data_B[22]), .B(Data_A[22]), .Y(n33) );
initial $sdf_annotate("FPU_Multiplication_Function_syn.sdf"); 
 endmodule


module Comparator_Equal_S31_0 ( Data_A, Data_B, equal_sgn );
  input [30:0] Data_A;
  input [30:0] Data_B;
  output equal_sgn;
  wire   n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54,
         n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68,
         n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80;

  XOR2XLTS U1 ( .A(Data_B[1]), .B(Data_A[1]), .Y(n64) );
  XOR2XLTS U2 ( .A(Data_B[2]), .B(Data_A[2]), .Y(n63) );
  NOR4XLTS U3 ( .A(n48), .B(n47), .C(n46), .D(n45), .Y(n59) );
  XOR2XLTS U4 ( .A(Data_B[12]), .B(Data_A[12]), .Y(n45) );
  XOR2XLTS U5 ( .A(Data_B[13]), .B(Data_A[13]), .Y(n44) );
  XNOR2XLTS U6 ( .A(Data_B[0]), .B(Data_A[0]), .Y(n76) );
  NAND4X1TS U7 ( .A(n60), .B(n59), .C(n58), .D(n57), .Y(n80) );
  NOR4XLTS U8 ( .A(n44), .B(n43), .C(n42), .D(n41), .Y(n60) );
  NOR4XLTS U9 ( .A(n52), .B(n51), .C(n50), .D(n49), .Y(n58) );
  NOR4XLTS U10 ( .A(n56), .B(n55), .C(n54), .D(n53), .Y(n57) );
  NOR4XLTS U11 ( .A(n64), .B(n63), .C(n62), .D(n61), .Y(n65) );
  XOR2X1TS U12 ( .A(Data_B[24]), .B(Data_A[24]), .Y(n61) );
  XOR2X1TS U13 ( .A(Data_B[22]), .B(Data_A[22]), .Y(n48) );
  XOR2X1TS U14 ( .A(Data_B[21]), .B(Data_A[21]), .Y(n47) );
  XOR2X1TS U15 ( .A(Data_B[20]), .B(Data_A[20]), .Y(n46) );
  NOR4XLTS U16 ( .A(n80), .B(n79), .C(n78), .D(n77), .Y(equal_sgn) );
  NAND4X1TS U17 ( .A(n68), .B(n67), .C(n66), .D(n65), .Y(n79) );
  XNOR2X1TS U18 ( .A(Data_B[25]), .B(Data_A[25]), .Y(n68) );
  XNOR2X1TS U19 ( .A(Data_B[27]), .B(Data_A[27]), .Y(n67) );
  XNOR2X1TS U20 ( .A(Data_B[26]), .B(Data_A[26]), .Y(n66) );
  XOR2X1TS U21 ( .A(Data_B[18]), .B(Data_A[18]), .Y(n52) );
  XOR2X1TS U22 ( .A(Data_B[19]), .B(Data_A[19]), .Y(n53) );
  XOR2X1TS U23 ( .A(Data_B[8]), .B(Data_A[8]), .Y(n41) );
  XOR2X1TS U24 ( .A(Data_B[16]), .B(Data_A[16]), .Y(n50) );
  XOR2X1TS U25 ( .A(Data_B[15]), .B(Data_A[15]), .Y(n42) );
  XOR2X1TS U26 ( .A(Data_B[3]), .B(Data_A[3]), .Y(n62) );
  XOR2X1TS U27 ( .A(Data_B[14]), .B(Data_A[14]), .Y(n43) );
  XOR2X1TS U28 ( .A(Data_B[17]), .B(Data_A[17]), .Y(n51) );
  XNOR2X1TS U29 ( .A(Data_B[9]), .B(Data_A[9]), .Y(n69) );
  NAND4X1TS U30 ( .A(n76), .B(n75), .C(n74), .D(n73), .Y(n77) );
  XNOR2X1TS U31 ( .A(Data_B[7]), .B(Data_A[7]), .Y(n75) );
  XNOR2X1TS U32 ( .A(Data_B[6]), .B(Data_A[6]), .Y(n74) );
  XNOR2X1TS U33 ( .A(Data_B[5]), .B(Data_A[5]), .Y(n73) );
  NAND4X1TS U34 ( .A(n72), .B(n71), .C(n70), .D(n69), .Y(n78) );
  XNOR2X1TS U35 ( .A(Data_B[4]), .B(Data_A[4]), .Y(n72) );
  XNOR2X1TS U36 ( .A(Data_B[11]), .B(Data_A[11]), .Y(n71) );
  XNOR2X1TS U37 ( .A(Data_B[10]), .B(Data_A[10]), .Y(n70) );
  XOR2X1TS U38 ( .A(Data_B[28]), .B(Data_A[28]), .Y(n56) );
  XOR2X1TS U39 ( .A(Data_B[23]), .B(Data_A[23]), .Y(n49) );
  XOR2X1TS U40 ( .A(Data_B[29]), .B(Data_A[29]), .Y(n54) );
  XOR2X1TS U41 ( .A(Data_B[30]), .B(Data_A[30]), .Y(n55) );
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

  AO22X1TS U1 ( .A0(D1[0]), .A1(ctrl), .B0(D0[0]), .B1(n1), .Y(S[0]) );
  AO22X1TS U2 ( .A0(D1[1]), .A1(ctrl), .B0(D0[1]), .B1(n1), .Y(S[1]) );
  AO22X1TS U3 ( .A0(D1[2]), .A1(ctrl), .B0(D0[2]), .B1(n1), .Y(S[2]) );
  AO22X1TS U4 ( .A0(D1[3]), .A1(ctrl), .B0(D0[3]), .B1(n1), .Y(S[3]) );
  INVX2TS U5 ( .A(ctrl), .Y(n1) );
  AO22X1TS U6 ( .A0(D1[4]), .A1(ctrl), .B0(D0[4]), .B1(n1), .Y(S[4]) );
  AO22X1TS U7 ( .A0(D1[5]), .A1(ctrl), .B0(D0[5]), .B1(n1), .Y(S[5]) );
  AO22X1TS U8 ( .A0(D1[6]), .A1(ctrl), .B0(D0[6]), .B1(n1), .Y(S[6]) );
  AO22X1TS U9 ( .A0(D1[7]), .A1(ctrl), .B0(D0[7]), .B1(n1), .Y(S[7]) );
  AO22X1TS U10 ( .A0(ctrl), .A1(D1[8]), .B0(D0[8]), .B1(n1), .Y(S[8]) );
initial $sdf_annotate("FPU_Multiplication_Function_syn.sdf"); 
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
  OAI2BB1X1TS U14 ( .A0N(D0[5]), .A1N(n1), .B0(n6), .Y(S[5]) );
  AOI22X1TS U15 ( .A0(D2[5]), .A1(n3), .B0(D1[5]), .B1(n4), .Y(n6) );
  NOR2X1TS U16 ( .A(ctrl[0]), .B(ctrl[1]), .Y(n1) );
  OAI2BB1X1TS U17 ( .A0N(D0[6]), .A1N(n1), .B0(n5), .Y(S[6]) );
  AOI22X1TS U18 ( .A0(D2[6]), .A1(n3), .B0(D1[6]), .B1(n4), .Y(n5) );
  OAI2BB1X1TS U19 ( .A0N(D0[7]), .A1N(n1), .B0(n2), .Y(S[7]) );
  AOI22X1TS U20 ( .A0(D2[7]), .A1(n3), .B0(D1[7]), .B1(n4), .Y(n2) );
initial $sdf_annotate("FPU_Multiplication_Function_syn.sdf"); 
 endmodule


module add_sub_carry_out_W9_DW01_add_0 ( A, B, CI, SUM, CO );
  input [9:0] A;
  input [9:0] B;
  output [9:0] SUM;
  input CI;
  output CO;
  wire   n1, n2;
  wire   [8:1] carry;

  CMPR32X2TS U1_8 ( .A(A[8]), .B(B[8]), .C(carry[8]), .CO(SUM[9]), .S(SUM[8])
         );
  CMPR32X2TS U1_7 ( .A(A[7]), .B(B[7]), .C(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  CMPR32X2TS U1_1 ( .A(A[1]), .B(B[1]), .C(carry[1]), .CO(carry[2]), .S(SUM[1]) );
  CMPR32X2TS U1_6 ( .A(A[6]), .B(B[6]), .C(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  CMPR32X2TS U1_5 ( .A(A[5]), .B(B[5]), .C(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  CMPR32X2TS U1_4 ( .A(A[4]), .B(B[4]), .C(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  CMPR32X2TS U1_3 ( .A(A[3]), .B(B[3]), .C(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  CMPR32X2TS U1_2 ( .A(A[2]), .B(B[2]), .C(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  NOR2X1TS U1 ( .A(n1), .B(n2), .Y(carry[1]) );
  INVX2TS U2 ( .A(B[0]), .Y(n2) );
  INVX2TS U3 ( .A(A[0]), .Y(n1) );
  XNOR2X1TS U4 ( .A(B[0]), .B(n1), .Y(SUM[0]) );
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
         N18, N19, N20, N21, N22, n1, n2;

  add_sub_carry_out_W9_DW01_add_0 add_36 ( .A({1'b0, Data_A}), .B({1'b0, 
        Data_B}), .CI(1'b0), .SUM({N22, N21, N20, N19, N18, N17, N16, N15, N14, 
        N13}) );
  add_sub_carry_out_W9_DW01_sub_0 sub_34 ( .A({1'b0, Data_A}), .B({1'b0, 
        Data_B}), .CI(1'b0), .DIFF({N12, N11, N10, N9, N8, N7, N6, N5, N4, N3}) );
  CLKBUFX2TS U3 ( .A(op_mode), .Y(n1) );
  INVX2TS U4 ( .A(op_mode), .Y(n2) );
  AO22X1TS U5 ( .A0(N20), .A1(n2), .B0(N10), .B1(op_mode), .Y(Data_S[7]) );
  AO22X1TS U6 ( .A0(N8), .A1(op_mode), .B0(N18), .B1(n2), .Y(Data_S[5]) );
  AO22X1TS U7 ( .A0(N9), .A1(op_mode), .B0(N19), .B1(n2), .Y(Data_S[6]) );
  AO22X1TS U8 ( .A0(N7), .A1(op_mode), .B0(N17), .B1(n2), .Y(Data_S[4]) );
  AO22X1TS U9 ( .A0(N6), .A1(op_mode), .B0(N16), .B1(n2), .Y(Data_S[3]) );
  AO22X1TS U10 ( .A0(N4), .A1(op_mode), .B0(N14), .B1(n2), .Y(Data_S[1]) );
  AO22X1TS U11 ( .A0(N5), .A1(op_mode), .B0(N15), .B1(n2), .Y(Data_S[2]) );
  AO22X1TS U12 ( .A0(N21), .A1(n2), .B0(N11), .B1(n1), .Y(Data_S[8]) );
  AO22X1TS U13 ( .A0(N3), .A1(op_mode), .B0(N13), .B1(n2), .Y(Data_S[0]) );
  AO22X1TS U14 ( .A0(N22), .A1(n2), .B0(n1), .B1(N12), .Y(Data_S[9]) );
initial $sdf_annotate("FPU_Multiplication_Function_syn.sdf"); 
 endmodule


module RegisterMult_W9 ( clk, rst, load, D, Q );
  input [8:0] D;
  output [8:0] Q;
  input clk, rst, load;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n19, n18, n20;

  DFFRX2TS Q_reg_7_ ( .D(n17), .CK(clk), .RN(n20), .Q(Q[7]), .QN(n8) );
  DFFRX2TS Q_reg_8_ ( .D(n19), .CK(clk), .RN(n20), .Q(Q[8]), .QN(n9) );
  DFFRX2TS Q_reg_6_ ( .D(n16), .CK(clk), .RN(n20), .Q(Q[6]), .QN(n7) );
  DFFRX2TS Q_reg_5_ ( .D(n15), .CK(clk), .RN(n20), .Q(Q[5]), .QN(n6) );
  DFFRX2TS Q_reg_4_ ( .D(n14), .CK(clk), .RN(n20), .Q(Q[4]), .QN(n5) );
  DFFRX2TS Q_reg_3_ ( .D(n13), .CK(clk), .RN(n20), .Q(Q[3]), .QN(n4) );
  DFFRX2TS Q_reg_2_ ( .D(n12), .CK(clk), .RN(n20), .Q(Q[2]), .QN(n3) );
  DFFRX2TS Q_reg_1_ ( .D(n11), .CK(clk), .RN(n20), .Q(Q[1]), .QN(n2) );
  DFFRX2TS Q_reg_0_ ( .D(n10), .CK(clk), .RN(n20), .Q(Q[0]), .QN(n1) );
  INVX2TS U2 ( .A(rst), .Y(n20) );
  CLKBUFX2TS U3 ( .A(load), .Y(n18) );
  OAI2BB2XLTS U4 ( .B0(n7), .B1(n18), .A0N(D[6]), .A1N(load), .Y(n16) );
  OAI2BB2XLTS U5 ( .B0(n8), .B1(n18), .A0N(D[7]), .A1N(load), .Y(n17) );
  OAI2BB2XLTS U6 ( .B0(n9), .B1(n18), .A0N(D[8]), .A1N(load), .Y(n19) );
  OAI2BB2XLTS U7 ( .B0(n4), .B1(n18), .A0N(D[3]), .A1N(load), .Y(n13) );
  OAI2BB2XLTS U8 ( .B0(n5), .B1(n18), .A0N(D[4]), .A1N(load), .Y(n14) );
  OAI2BB2XLTS U9 ( .B0(n6), .B1(n18), .A0N(D[5]), .A1N(load), .Y(n15) );
  OAI2BB2XLTS U10 ( .B0(n1), .B1(n18), .A0N(n18), .A1N(D[0]), .Y(n10) );
  OAI2BB2XLTS U11 ( .B0(n2), .B1(n18), .A0N(D[1]), .A1N(load), .Y(n11) );
  OAI2BB2XLTS U12 ( .B0(n3), .B1(n18), .A0N(D[2]), .A1N(load), .Y(n12) );
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
         n17, n18, n19, n20, n21, n22, n23;

  INVX2TS U1 ( .A(Data_A[7]), .Y(n22) );
  INVX2TS U2 ( .A(Data_A[4]), .Y(n19) );
  INVX2TS U3 ( .A(Data_A[6]), .Y(n21) );
  INVX2TS U4 ( .A(Data_A[8]), .Y(n23) );
  INVX2TS U5 ( .A(Data_A[5]), .Y(n20) );
  INVX2TS U6 ( .A(Data_A[0]), .Y(n17) );
  INVX2TS U7 ( .A(Data_A[1]), .Y(n18) );
  INVX2TS U8 ( .A(Data_B[3]), .Y(n15) );
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
initial $sdf_annotate("FPU_Multiplication_Function_syn.sdf"); 
 endmodule


module RegisterMult_W1_0 ( clk, rst, load, D, Q );
  input [0:0] D;
  output [0:0] Q;
  input clk, rst, load;
  wire   n2, n4, n5;

  DFFRX2TS Q_reg_0_ ( .D(n4), .CK(clk), .RN(n2), .Q(Q[0]), .QN(n5) );
  INVX2TS U2 ( .A(rst), .Y(n2) );
  OAI2BB2XLTS U3 ( .B0(n5), .B1(load), .A0N(load), .A1N(D[0]), .Y(n4) );
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


module multiplier_W12_1_DW_mult_uns_1 ( a, b, product );
  input [11:0] a;
  input [11:0] b;
  output [23:0] product;
  wire   n3, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18,
         n19, n20, n21, n22, n23, n24, n25, n26, n28, n30, n31, n32, n33, n34,
         n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48,
         n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62,
         n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76,
         n77, n78, n79, n80, n81, n82, n83, n84, n85, n87, n88, n89, n90, n91,
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
         n237, n238, n239, n240, n241, n242, n244, n246, n248, n250, n251,
         n253, n254, n255, n256, n257, n258, n259, n260, n261, n262, n263,
         n264, n265, n266, n267, n268, n269, n270, n271, n272, n273, n274,
         n275, n276, n277, n278, n279, n280, n281, n282, n283, n284, n285,
         n286, n287, n288, n289, n290, n291, n292, n293, n294, n295, n296,
         n297, n298, n299, n300, n301, n302, n303, n304, n305, n306, n307,
         n308, n309, n310, n311, n312, n313, n314, n315, n316, n317, n318,
         n319, n320, n321, n322, n323, n324, n325, n326, n327, n328, n329,
         n330, n343, n344, n345, n346, n347, n348, n349, n350, n351, n352,
         n353, n356, n357, n358, n359, n360, n362, n363, n364, n365, n366,
         n367, n386, n438, n440, n441, n442, n443, n444, n445, n446, n447,
         n448, n449, n450, n451, n452, n453, n454, n455, n456, n457, n458,
         n459, n460, n461, n462, n463, n464;

  XOR2X1TS U4 ( .A(n31), .B(n30), .Y(n3) );
  CMPR32X2TS U5 ( .A(n36), .B(n32), .C(n6), .CO(n5), .S(product[22]) );
  CMPR32X2TS U6 ( .A(n37), .B(n39), .C(n7), .CO(n6), .S(product[21]) );
  CMPR32X2TS U7 ( .A(n44), .B(n40), .C(n8), .CO(n7), .S(product[20]) );
  AFHCINX2TS U8 ( .CIN(n9), .B(n49), .A(n45), .S(product[19]), .CO(n8) );
  AFHCONX2TS U9 ( .A(n50), .B(n56), .CI(n10), .CON(n9), .S(product[18]) );
  AFHCINX2TS U10 ( .CIN(n11), .B(n57), .A(n62), .S(product[17]), .CO(n10) );
  AFHCONX2TS U11 ( .A(n70), .B(n63), .CI(n12), .CON(n11), .S(product[16]) );
  AFHCINX2TS U12 ( .CIN(n13), .B(n71), .A(n78), .S(product[15]), .CO(n12) );
  AFHCONX2TS U13 ( .A(n88), .B(n79), .CI(n14), .CON(n13), .S(product[14]) );
  AFHCINX2TS U14 ( .CIN(n15), .B(n89), .A(n97), .S(product[13]), .CO(n14) );
  AFHCONX2TS U15 ( .A(n105), .B(n98), .CI(n16), .CON(n15), .S(product[12]) );
  AFHCINX2TS U16 ( .CIN(n17), .B(n106), .A(n113), .S(product[11]), .CO(n16) );
  AFHCONX2TS U17 ( .A(n119), .B(n114), .CI(n18), .CON(n17), .S(product[10]) );
  AFHCINX2TS U18 ( .CIN(n19), .B(n120), .A(n126), .S(product[9]), .CO(n18) );
  AFHCONX2TS U19 ( .A(n131), .B(n127), .CI(n20), .CON(n19), .S(product[8]) );
  AFHCINX2TS U20 ( .CIN(n21), .B(n132), .A(n136), .S(product[7]), .CO(n20) );
  AFHCONX2TS U21 ( .A(n138), .B(n137), .CI(n22), .CON(n21), .S(product[6]) );
  AFHCINX2TS U22 ( .CIN(n23), .B(n139), .A(n142), .S(product[5]), .CO(n22) );
  AFHCONX2TS U23 ( .A(n144), .B(n143), .CI(n24), .CON(n23), .S(product[4]) );
  AFHCINX2TS U24 ( .CIN(n25), .B(n145), .A(n150), .S(product[3]), .CO(n24) );
  AFHCONX2TS U25 ( .A(n228), .B(n240), .CI(n26), .CON(n25), .S(product[2]) );
  XOR2X1TS U308 ( .A(a[10]), .B(a[11]), .Y(n343) );
  XOR2X1TS U311 ( .A(a[8]), .B(a[9]), .Y(n344) );
  XOR2X1TS U314 ( .A(a[6]), .B(a[7]), .Y(n345) );
  XOR2X1TS U317 ( .A(a[4]), .B(a[5]), .Y(n346) );
  XOR2X1TS U320 ( .A(a[2]), .B(a[3]), .Y(n347) );
  XOR2X1TS U323 ( .A(a[1]), .B(a[0]), .Y(n348) );
  OR2X2TS U327 ( .A(n241), .B(n151), .Y(n438) );
  AND2X2TS U328 ( .A(n438), .B(n28), .Y(product[1]) );
  INVX2TS U329 ( .A(n367), .Y(n440) );
  INVX2TS U330 ( .A(n366), .Y(n441) );
  INVX2TS U331 ( .A(n365), .Y(n442) );
  INVX2TS U332 ( .A(n364), .Y(n443) );
  INVX2TS U333 ( .A(n363), .Y(n444) );
  CLKBUFX2TS U334 ( .A(b[0]), .Y(n445) );
  CLKBUFX2TS U335 ( .A(b[0]), .Y(n446) );
  INVX2TS U336 ( .A(n456), .Y(n447) );
  INVX2TS U337 ( .A(n457), .Y(n448) );
  INVX2TS U338 ( .A(n457), .Y(n449) );
  CLKBUFX2TS U339 ( .A(n353), .Y(n450) );
  INVX2TS U340 ( .A(a[0]), .Y(n451) );
  INVX2TS U341 ( .A(n455), .Y(n452) );
  INVX2TS U342 ( .A(n454), .Y(n453) );
  CLKBUFX2TS U343 ( .A(n359), .Y(n459) );
  CLKBUFX2TS U344 ( .A(n358), .Y(n461) );
  CLKBUFX2TS U345 ( .A(n357), .Y(n463) );
  NOR2BXLTS U346 ( .AN(n445), .B(n461), .Y(n200) );
  CLKBUFX2TS U347 ( .A(n352), .Y(n460) );
  CLKBUFX2TS U348 ( .A(n351), .Y(n462) );
  CLKBUFX2TS U349 ( .A(n350), .Y(n464) );
  XNOR2XLTS U350 ( .A(n445), .B(a[3]), .Y(n316) );
  NOR2BXLTS U351 ( .AN(n446), .B(n360), .Y(n228) );
  XNOR2XLTS U352 ( .A(n440), .B(b[1]), .Y(n328) );
  XNOR2XLTS U353 ( .A(a[9]), .B(b[1]), .Y(n276) );
  XNOR2XLTS U354 ( .A(a[3]), .B(b[1]), .Y(n315) );
  XNOR2XLTS U355 ( .A(a[5]), .B(b[1]), .Y(n302) );
  XNOR2XLTS U356 ( .A(a[7]), .B(b[1]), .Y(n289) );
  XNOR2XLTS U357 ( .A(n445), .B(a[9]), .Y(n277) );
  XNOR2XLTS U358 ( .A(n445), .B(a[7]), .Y(n290) );
  XNOR2XLTS U359 ( .A(n446), .B(a[11]), .Y(n264) );
  XNOR2XLTS U360 ( .A(n446), .B(n440), .Y(n329) );
  XNOR2XLTS U361 ( .A(b[1]), .B(a[11]), .Y(n263) );
  NOR2BXLTS U362 ( .AN(n446), .B(n463), .Y(n186) );
  NOR2BXLTS U363 ( .AN(n445), .B(n459), .Y(n214) );
  XNOR2XLTS U364 ( .A(n446), .B(a[5]), .Y(n303) );
  NOR2BXLTS U365 ( .AN(n446), .B(n362), .Y(n158) );
  NOR2BXLTS U366 ( .AN(n445), .B(n356), .Y(n172) );
  NOR2BXLTS U367 ( .AN(b[1]), .B(n362), .Y(n85) );
  NOR2BX1TS U368 ( .AN(b[6]), .B(n458), .Y(n53) );
  NOR2BXLTS U369 ( .AN(n446), .B(n451), .Y(product[0]) );
  CMPR42X1TS U370 ( .A(n218), .B(n182), .C(n206), .D(n110), .ICI(n104), .S(
        n101), .ICO(n99), .CO(n100) );
  OAI22X1TS U371 ( .A0(n460), .A1(n296), .B0(n459), .B1(n295), .Y(n206) );
  OAI22X1TS U372 ( .A0(n464), .A1(n274), .B0(n463), .B1(n273), .Y(n182) );
  OAI22X1TS U373 ( .A0(n353), .A1(n307), .B0(n360), .B1(n306), .Y(n218) );
  CMPR42X1TS U374 ( .A(n193), .B(n181), .C(n217), .D(n229), .ICI(n96), .S(n92), 
        .ICO(n90), .CO(n91) );
  AO21X1TS U375 ( .A0(n449), .A1(n451), .B0(n367), .Y(n229) );
  OAI22X1TS U376 ( .A0(n450), .A1(n306), .B0(n453), .B1(n305), .Y(n217) );
  OAI22X1TS U377 ( .A0(n464), .A1(n273), .B0(n463), .B1(n272), .Y(n181) );
  CMPR42X1TS U378 ( .A(n171), .B(n183), .C(n207), .D(n195), .ICI(n112), .S(
        n109), .ICO(n107), .CO(n108) );
  OAI22X1TS U379 ( .A0(n462), .A1(n286), .B0(n461), .B1(n285), .Y(n195) );
  OAI22X1TS U380 ( .A0(n460), .A1(n297), .B0(n459), .B1(n296), .Y(n207) );
  OAI22X1TS U381 ( .A0(n350), .A1(n275), .B0(n463), .B1(n274), .Y(n183) );
  OAI22X1TS U382 ( .A0(n462), .A1(n284), .B0(n461), .B1(n283), .Y(n193) );
  OAI22X1TS U383 ( .A0(n350), .A1(n276), .B0(n463), .B1(n275), .Y(n184) );
  OAI22X1TS U384 ( .A0(n460), .A1(n302), .B0(n459), .B1(n301), .Y(n212) );
  NAND2X1TS U385 ( .A(n241), .B(n151), .Y(n28) );
  CMPR42X1TS U386 ( .A(n222), .B(n210), .C(n133), .D(n130), .ICI(n129), .S(
        n127), .ICO(n125), .CO(n126) );
  OAI22X1TS U387 ( .A0(n460), .A1(n300), .B0(n459), .B1(n299), .Y(n210) );
  OAI22X1TS U388 ( .A0(n353), .A1(n311), .B0(n360), .B1(n310), .Y(n222) );
  CMPR42X1TS U389 ( .A(n220), .B(n208), .C(n123), .D(n118), .ICI(n117), .S(
        n114), .ICO(n112), .CO(n113) );
  OAI22X1TS U390 ( .A0(n460), .A1(n298), .B0(n359), .B1(n297), .Y(n208) );
  OAI22X1TS U391 ( .A0(n450), .A1(n309), .B0(n453), .B1(n308), .Y(n220) );
  CMPR42X1TS U392 ( .A(n194), .B(n107), .C(n103), .D(n108), .ICI(n101), .S(n98), .ICO(n96), .CO(n97) );
  OAI22X1TS U393 ( .A0(n462), .A1(n285), .B0(n358), .B1(n284), .Y(n194) );
  CMPR42X1TS U394 ( .A(n84), .B(n90), .C(n93), .D(n91), .ICI(n82), .S(n79), 
        .ICO(n77), .CO(n78) );
  CMPR42X1TS U395 ( .A(n223), .B(n199), .C(n211), .D(n134), .ICI(n135), .S(
        n132), .ICO(n130), .CO(n131) );
  OAI22X1TS U396 ( .A0(n460), .A1(n301), .B0(n459), .B1(n300), .Y(n211) );
  OAI22X1TS U397 ( .A0(n462), .A1(n290), .B0(n461), .B1(n289), .Y(n199) );
  OAI22X1TS U398 ( .A0(n353), .A1(n312), .B0(n360), .B1(n311), .Y(n223) );
  CMPR42X1TS U399 ( .A(n221), .B(n124), .C(n128), .D(n122), .ICI(n125), .S(
        n120), .ICO(n118), .CO(n119) );
  OAI22X1TS U400 ( .A0(n353), .A1(n310), .B0(n360), .B1(n309), .Y(n221) );
  CMPR42X1TS U401 ( .A(n231), .B(n111), .C(n115), .D(n116), .ICI(n109), .S(
        n106), .ICO(n104), .CO(n105) );
  OAI22X1TS U402 ( .A0(n449), .A1(n319), .B0(n318), .B1(n451), .Y(n231) );
  CMPR42X1TS U403 ( .A(n99), .B(n102), .C(n94), .D(n100), .ICI(n92), .S(n89), 
        .ICO(n87), .CO(n88) );
  CMPR32X2TS U404 ( .A(n197), .B(n185), .C(n209), .CO(n121), .S(n122) );
  OAI22X1TS U405 ( .A0(n460), .A1(n299), .B0(n459), .B1(n298), .Y(n209) );
  OAI22X1TS U406 ( .A0(n350), .A1(n277), .B0(n463), .B1(n276), .Y(n185) );
  OAI22X1TS U407 ( .A0(n462), .A1(n288), .B0(n461), .B1(n287), .Y(n197) );
  XOR2X1TS U408 ( .A(n5), .B(n3), .Y(product[23]) );
  XOR3X2TS U409 ( .A(n152), .B(n33), .C(n159), .Y(n30) );
  NOR2X1TS U410 ( .A(n458), .B(n242), .Y(n152) );
  CMPR42X1TS U411 ( .A(n192), .B(n216), .C(n204), .D(n180), .ICI(n87), .S(n82), 
        .ICO(n80), .CO(n81) );
  OAI22X1TS U412 ( .A0(n464), .A1(n272), .B0(n463), .B1(n271), .Y(n180) );
  OAI22X1TS U413 ( .A0(n352), .A1(n294), .B0(n359), .B1(n293), .Y(n204) );
  OAI22X1TS U414 ( .A0(n450), .A1(n305), .B0(n453), .B1(n366), .Y(n216) );
  OAI22X1TS U415 ( .A0(n447), .A1(n259), .B0(n356), .B1(n258), .Y(n166) );
  OAI22X1TS U416 ( .A0(n462), .A1(n283), .B0(n461), .B1(n282), .Y(n192) );
  OAI22X1TS U417 ( .A0(n351), .A1(n282), .B0(n358), .B1(n281), .Y(n191) );
  CMPR42X1TS U418 ( .A(n67), .B(n155), .C(n165), .D(n189), .ICI(n64), .S(n60), 
        .ICO(n58), .CO(n59) );
  NOR2X1TS U419 ( .A(n248), .B(n362), .Y(n155) );
  OAI22X1TS U420 ( .A0(n349), .A1(n258), .B0(n356), .B1(n257), .Y(n165) );
  OAI22X1TS U421 ( .A0(n351), .A1(n280), .B0(n358), .B1(n279), .Y(n189) );
  CMPR42X1TS U422 ( .A(n178), .B(n75), .C(n69), .D(n66), .ICI(n73), .S(n63), 
        .ICO(n61), .CO(n62) );
  OAI22X1TS U423 ( .A0(n464), .A1(n270), .B0(n357), .B1(n269), .Y(n178) );
  CMPR42X1TS U424 ( .A(n83), .B(n76), .C(n80), .D(n81), .ICI(n74), .S(n71), 
        .ICO(n69), .CO(n70) );
  CMPR42X1TS U425 ( .A(n177), .B(n201), .C(n60), .D(n65), .ICI(n61), .S(n57), 
        .ICO(n55), .CO(n56) );
  OAI22X1TS U426 ( .A0(n350), .A1(n269), .B0(n357), .B1(n268), .Y(n177) );
  AO21X1TS U427 ( .A0(n352), .A1(n359), .B0(n365), .Y(n201) );
  CMPR42X1TS U428 ( .A(n68), .B(n166), .C(n202), .D(n190), .ICI(n72), .S(n66), 
        .ICO(n64), .CO(n65) );
  INVX2TS U429 ( .A(n67), .Y(n68) );
  OAI22X1TS U430 ( .A0(n462), .A1(n281), .B0(n358), .B1(n280), .Y(n190) );
  OAI22X1TS U431 ( .A0(n352), .A1(n292), .B0(n359), .B1(n365), .Y(n202) );
  CMPR42X1TS U432 ( .A(n176), .B(n58), .C(n52), .D(n59), .ICI(n55), .S(n50), 
        .ICO(n48), .CO(n49) );
  OAI22X1TS U433 ( .A0(n350), .A1(n268), .B0(n357), .B1(n267), .Y(n176) );
  CMPR42X1TS U434 ( .A(n191), .B(n203), .C(n179), .D(n215), .ICI(n77), .S(n74), 
        .ICO(n72), .CO(n73) );
  OAI22X1TS U435 ( .A0(n464), .A1(n271), .B0(n463), .B1(n270), .Y(n179) );
  AO21X1TS U436 ( .A0(n450), .A1(n453), .B0(n366), .Y(n215) );
  OAI22X1TS U437 ( .A0(n352), .A1(n293), .B0(n359), .B1(n292), .Y(n203) );
  CMPR32X2TS U438 ( .A(n95), .B(n169), .C(n205), .CO(n93), .S(n94) );
  OAI22X1TS U439 ( .A0(n460), .A1(n295), .B0(n359), .B1(n294), .Y(n205) );
  OAI22X1TS U440 ( .A0(n447), .A1(n262), .B0(n356), .B1(n261), .Y(n169) );
  CMPR42X1TS U441 ( .A(n175), .B(n187), .C(n47), .D(n51), .ICI(n48), .S(n45), 
        .ICO(n43), .CO(n44) );
  OAI22X1TS U442 ( .A0(n350), .A1(n267), .B0(n357), .B1(n266), .Y(n175) );
  AO21X1TS U443 ( .A0(n351), .A1(n358), .B0(n364), .Y(n187) );
  INVX2TS U444 ( .A(n85), .Y(n95) );
  CMPR32X2TS U445 ( .A(n54), .B(n164), .C(n188), .CO(n51), .S(n52) );
  INVX2TS U446 ( .A(n53), .Y(n54) );
  OAI22X1TS U447 ( .A0(n351), .A1(n279), .B0(n358), .B1(n364), .Y(n188) );
  OAI22X1TS U448 ( .A0(n349), .A1(n257), .B0(n452), .B1(n256), .Y(n164) );
  CMPR42X1TS U449 ( .A(n42), .B(n162), .C(n174), .D(n46), .ICI(n43), .S(n40), 
        .ICO(n38), .CO(n39) );
  INVX2TS U450 ( .A(n41), .Y(n42) );
  OAI22X1TS U451 ( .A0(n350), .A1(n266), .B0(n357), .B1(n363), .Y(n174) );
  OAI22X1TS U452 ( .A0(n349), .A1(n255), .B0(n452), .B1(n254), .Y(n162) );
  CMPR42X1TS U453 ( .A(n41), .B(n153), .C(n161), .D(n173), .ICI(n38), .S(n37), 
        .ICO(n35), .CO(n36) );
  NOR2X1TS U454 ( .A(n244), .B(n362), .Y(n153) );
  OAI22X1TS U455 ( .A0(n349), .A1(n254), .B0(n452), .B1(n253), .Y(n161) );
  AO21X1TS U456 ( .A0(n350), .A1(n357), .B0(n363), .Y(n173) );
  AO21X1TS U457 ( .A0(n349), .A1(n452), .B0(n458), .Y(n159) );
  CMPR32X2TS U458 ( .A(n34), .B(n160), .C(n35), .CO(n31), .S(n32) );
  INVX2TS U459 ( .A(n33), .Y(n34) );
  OAI22X1TS U460 ( .A0(n349), .A1(n253), .B0(n452), .B1(n458), .Y(n160) );
  CLKBUFX2TS U461 ( .A(n362), .Y(n458) );
  CMPR32X2TS U462 ( .A(n186), .B(n234), .C(n198), .CO(n128), .S(n129) );
  OAI22X1TS U463 ( .A0(n462), .A1(n289), .B0(n461), .B1(n288), .Y(n198) );
  OAI22X1TS U464 ( .A0(n449), .A1(n322), .B0(n321), .B1(n386), .Y(n234) );
  OAI22X1TS U465 ( .A0(n449), .A1(n329), .B0(n328), .B1(n451), .Y(n241) );
  XOR2X1TS U466 ( .A(a[2]), .B(a[1]), .Y(n454) );
  INVX2TS U467 ( .A(n454), .Y(n360) );
  XNOR2X1TS U468 ( .A(a[1]), .B(b[4]), .Y(n325) );
  XNOR2X1TS U469 ( .A(a[1]), .B(b[6]), .Y(n323) );
  XNOR2X1TS U470 ( .A(n440), .B(b[2]), .Y(n327) );
  XNOR2X1TS U471 ( .A(a[1]), .B(b[7]), .Y(n322) );
  XNOR2X1TS U472 ( .A(a[1]), .B(b[3]), .Y(n326) );
  XNOR2X1TS U473 ( .A(a[1]), .B(b[5]), .Y(n324) );
  XNOR2X1TS U474 ( .A(n440), .B(b[8]), .Y(n321) );
  XNOR2X1TS U475 ( .A(n440), .B(b[10]), .Y(n319) );
  XNOR2X1TS U476 ( .A(n440), .B(b[9]), .Y(n320) );
  OAI22X1TS U477 ( .A0(n449), .A1(n367), .B0(n330), .B1(n451), .Y(n151) );
  NAND2BX1TS U478 ( .AN(n446), .B(n440), .Y(n330) );
  XNOR2X1TS U479 ( .A(a[7]), .B(b[2]), .Y(n288) );
  XNOR2X1TS U480 ( .A(n441), .B(b[2]), .Y(n314) );
  XNOR2X1TS U481 ( .A(a[3]), .B(b[4]), .Y(n312) );
  XNOR2X1TS U482 ( .A(a[5]), .B(b[2]), .Y(n301) );
  XNOR2X1TS U483 ( .A(a[7]), .B(b[3]), .Y(n287) );
  XNOR2X1TS U484 ( .A(a[3]), .B(b[3]), .Y(n313) );
  XNOR2X1TS U485 ( .A(a[3]), .B(b[5]), .Y(n311) );
  XNOR2X1TS U486 ( .A(a[5]), .B(b[3]), .Y(n300) );
  CMPR42X1TS U487 ( .A(n172), .B(n232), .C(n184), .D(n196), .ICI(n121), .S(
        n117), .ICO(n115), .CO(n116) );
  OAI22X1TS U488 ( .A0(n462), .A1(n287), .B0(n461), .B1(n286), .Y(n196) );
  OAI22X1TS U489 ( .A0(n449), .A1(n320), .B0(n319), .B1(n386), .Y(n232) );
  OAI22X1TS U490 ( .A0(n450), .A1(n366), .B0(n453), .B1(n317), .Y(n150) );
  NAND2BX1TS U491 ( .AN(n446), .B(n441), .Y(n317) );
  ADDHXLTS U492 ( .A(n235), .B(n148), .CO(n133), .S(n134) );
  OAI22X1TS U493 ( .A0(n448), .A1(n323), .B0(n322), .B1(n386), .Y(n235) );
  OAI22X1TS U494 ( .A0(n462), .A1(n364), .B0(n461), .B1(n291), .Y(n148) );
  NAND2BX1TS U495 ( .AN(n445), .B(a[7]), .Y(n291) );
  INVX2TS U496 ( .A(a[0]), .Y(n386) );
  OAI22X1TS U497 ( .A0(n447), .A1(n264), .B0(n356), .B1(n263), .Y(n171) );
  ADDHXLTS U498 ( .A(n146), .B(n219), .CO(n110), .S(n111) );
  OAI22X1TS U499 ( .A0(n353), .A1(n308), .B0(n453), .B1(n307), .Y(n219) );
  OAI22X1TS U500 ( .A0(n447), .A1(n362), .B0(n356), .B1(n265), .Y(n146) );
  NAND2BX1TS U501 ( .AN(n446), .B(a[11]), .Y(n265) );
  ADDHXLTS U502 ( .A(n233), .B(n147), .CO(n123), .S(n124) );
  OAI22X1TS U503 ( .A0(n449), .A1(n321), .B0(n320), .B1(n386), .Y(n233) );
  OAI22X1TS U504 ( .A0(n350), .A1(n363), .B0(n463), .B1(n278), .Y(n147) );
  NAND2BX1TS U505 ( .AN(n445), .B(a[9]), .Y(n278) );
  ADDHXLTS U506 ( .A(n239), .B(n227), .CO(n144), .S(n145) );
  OAI22X1TS U507 ( .A0(n449), .A1(n327), .B0(n326), .B1(n386), .Y(n239) );
  OAI22X1TS U508 ( .A0(n353), .A1(n316), .B0(n360), .B1(n315), .Y(n227) );
  XOR2X1TS U509 ( .A(a[10]), .B(a[9]), .Y(n455) );
  INVX2TS U510 ( .A(n455), .Y(n356) );
  XNOR2X1TS U511 ( .A(a[4]), .B(a[3]), .Y(n359) );
  XNOR2X1TS U512 ( .A(a[6]), .B(a[5]), .Y(n358) );
  XNOR2X1TS U513 ( .A(a[8]), .B(a[7]), .Y(n357) );
  ADDHXLTS U514 ( .A(n237), .B(n149), .CO(n140), .S(n141) );
  OAI22X1TS U515 ( .A0(n448), .A1(n325), .B0(n324), .B1(n386), .Y(n237) );
  OAI22X1TS U516 ( .A0(n460), .A1(n365), .B0(n459), .B1(n304), .Y(n149) );
  NAND2BX1TS U517 ( .AN(n445), .B(a[5]), .Y(n304) );
  CMPR42X1TS U518 ( .A(n200), .B(n236), .C(n212), .D(n224), .ICI(n140), .S(
        n137), .ICO(n135), .CO(n136) );
  OAI22X1TS U519 ( .A0(n448), .A1(n324), .B0(n323), .B1(n386), .Y(n236) );
  OAI22X1TS U520 ( .A0(n353), .A1(n313), .B0(n360), .B1(n312), .Y(n224) );
  NAND2X1TS U521 ( .A(n346), .B(n459), .Y(n352) );
  NAND2X1TS U522 ( .A(n345), .B(n461), .Y(n351) );
  NAND2X1TS U523 ( .A(n344), .B(n463), .Y(n350) );
  NAND2X1TS U524 ( .A(n347), .B(n360), .Y(n353) );
  AND2X2TS U525 ( .A(n356), .B(n343), .Y(n456) );
  INVX2TS U526 ( .A(n456), .Y(n349) );
  AND2X2TS U527 ( .A(n348), .B(n386), .Y(n457) );
  CMPR32X2TS U528 ( .A(n214), .B(n238), .C(n226), .CO(n142), .S(n143) );
  OAI22X1TS U529 ( .A0(n448), .A1(n326), .B0(n325), .B1(n386), .Y(n238) );
  OAI22X1TS U530 ( .A0(n353), .A1(n315), .B0(n360), .B1(n314), .Y(n226) );
  CMPR32X2TS U531 ( .A(n225), .B(n213), .C(n141), .CO(n138), .S(n139) );
  OAI22X1TS U532 ( .A0(n353), .A1(n314), .B0(n360), .B1(n313), .Y(n225) );
  OAI22X1TS U533 ( .A0(n460), .A1(n303), .B0(n459), .B1(n302), .Y(n213) );
  CMPR32X2TS U534 ( .A(n158), .B(n170), .C(n230), .CO(n102), .S(n103) );
  OAI22X1TS U535 ( .A0(n449), .A1(n318), .B0(n367), .B1(n451), .Y(n230) );
  OAI22X1TS U536 ( .A0(n447), .A1(n263), .B0(n356), .B1(n262), .Y(n170) );
  OAI22X1TS U537 ( .A0(n449), .A1(n328), .B0(n327), .B1(n386), .Y(n240) );
  INVX2TS U538 ( .A(n28), .Y(n26) );
  XNOR2X1TS U539 ( .A(n442), .B(b[4]), .Y(n299) );
  XNOR2X1TS U540 ( .A(a[9]), .B(b[2]), .Y(n275) );
  XNOR2X1TS U541 ( .A(n443), .B(b[4]), .Y(n286) );
  XNOR2X1TS U542 ( .A(n443), .B(b[6]), .Y(n284) );
  XNOR2X1TS U543 ( .A(n444), .B(b[4]), .Y(n273) );
  XNOR2X1TS U544 ( .A(n441), .B(b[6]), .Y(n310) );
  XNOR2X1TS U545 ( .A(n442), .B(b[6]), .Y(n297) );
  XNOR2X1TS U546 ( .A(n442), .B(b[5]), .Y(n298) );
  XNOR2X1TS U547 ( .A(n443), .B(b[5]), .Y(n285) );
  XNOR2X1TS U548 ( .A(a[9]), .B(b[3]), .Y(n274) );
  XNOR2X1TS U549 ( .A(n442), .B(b[7]), .Y(n296) );
  XNOR2X1TS U550 ( .A(n443), .B(b[7]), .Y(n283) );
  XNOR2X1TS U551 ( .A(n444), .B(b[5]), .Y(n272) );
  XNOR2X1TS U552 ( .A(n441), .B(b[7]), .Y(n309) );
  XNOR2X1TS U553 ( .A(n441), .B(b[8]), .Y(n308) );
  XNOR2X1TS U554 ( .A(n441), .B(b[9]), .Y(n307) );
  XNOR2X1TS U555 ( .A(n442), .B(b[8]), .Y(n295) );
  XNOR2X1TS U556 ( .A(n441), .B(b[10]), .Y(n306) );
  XNOR2X1TS U557 ( .A(n442), .B(b[9]), .Y(n294) );
  XNOR2X1TS U558 ( .A(n443), .B(b[8]), .Y(n282) );
  XNOR2X1TS U559 ( .A(n442), .B(b[10]), .Y(n293) );
  XNOR2X1TS U560 ( .A(n440), .B(b[11]), .Y(n318) );
  XNOR2X1TS U561 ( .A(b[3]), .B(a[11]), .Y(n261) );
  XNOR2X1TS U562 ( .A(b[2]), .B(a[11]), .Y(n262) );
  XNOR2X1TS U563 ( .A(n441), .B(b[11]), .Y(n305) );
  CMPR32X2TS U564 ( .A(n157), .B(n95), .C(n168), .CO(n83), .S(n84) );
  NOR2X1TS U565 ( .A(n251), .B(n458), .Y(n157) );
  OAI22X1TS U566 ( .A0(n349), .A1(n261), .B0(n356), .B1(n260), .Y(n168) );
  INVX2TS U567 ( .A(b[2]), .Y(n251) );
  INVX2TS U568 ( .A(a[1]), .Y(n367) );
  INVX2TS U569 ( .A(a[3]), .Y(n366) );
  INVX2TS U570 ( .A(a[5]), .Y(n365) );
  INVX2TS U571 ( .A(a[7]), .Y(n364) );
  INVX2TS U572 ( .A(a[9]), .Y(n363) );
  CMPR32X2TS U573 ( .A(n85), .B(n156), .C(n167), .CO(n75), .S(n76) );
  NOR2X1TS U574 ( .A(n250), .B(n362), .Y(n156) );
  OAI22X1TS U575 ( .A0(n349), .A1(n260), .B0(n356), .B1(n259), .Y(n167) );
  INVX2TS U576 ( .A(b[3]), .Y(n250) );
  XNOR2X1TS U577 ( .A(n444), .B(b[6]), .Y(n271) );
  XNOR2X1TS U578 ( .A(n444), .B(b[7]), .Y(n270) );
  XNOR2X1TS U579 ( .A(n443), .B(b[9]), .Y(n281) );
  XNOR2X1TS U580 ( .A(n443), .B(b[10]), .Y(n280) );
  XNOR2X1TS U581 ( .A(n444), .B(b[8]), .Y(n269) );
  XNOR2X1TS U582 ( .A(n444), .B(b[9]), .Y(n268) );
  XNOR2X1TS U583 ( .A(b[8]), .B(a[11]), .Y(n256) );
  XNOR2X1TS U584 ( .A(b[5]), .B(a[11]), .Y(n259) );
  XNOR2X1TS U585 ( .A(b[7]), .B(a[11]), .Y(n257) );
  XNOR2X1TS U586 ( .A(b[4]), .B(a[11]), .Y(n260) );
  XNOR2X1TS U587 ( .A(b[6]), .B(a[11]), .Y(n258) );
  XNOR2X1TS U588 ( .A(n442), .B(b[11]), .Y(n292) );
  XNOR2X1TS U589 ( .A(n443), .B(b[11]), .Y(n279) );
  NOR2BX1TS U590 ( .AN(b[4]), .B(n458), .Y(n67) );
  INVX2TS U591 ( .A(b[5]), .Y(n248) );
  CMPR32X2TS U592 ( .A(n53), .B(n154), .C(n163), .CO(n46), .S(n47) );
  NOR2X1TS U593 ( .A(n246), .B(n362), .Y(n154) );
  OAI22X1TS U594 ( .A0(n349), .A1(n256), .B0(n452), .B1(n255), .Y(n163) );
  INVX2TS U595 ( .A(b[7]), .Y(n246) );
  XNOR2X1TS U596 ( .A(n444), .B(b[10]), .Y(n267) );
  XNOR2X1TS U597 ( .A(b[9]), .B(a[11]), .Y(n255) );
  XNOR2X1TS U598 ( .A(b[10]), .B(a[11]), .Y(n254) );
  XNOR2X1TS U599 ( .A(n444), .B(b[11]), .Y(n266) );
  NOR2BX1TS U600 ( .AN(b[8]), .B(n458), .Y(n41) );
  INVX2TS U601 ( .A(b[9]), .Y(n244) );
  NOR2BX1TS U602 ( .AN(b[10]), .B(n458), .Y(n33) );
  INVX2TS U603 ( .A(a[11]), .Y(n362) );
  XNOR2X1TS U604 ( .A(a[11]), .B(b[11]), .Y(n253) );
  INVX2TS U605 ( .A(b[11]), .Y(n242) );
initial $sdf_annotate("FPU_Multiplication_Function_syn.sdf"); 
 endmodule


module multiplier_W12_1 ( clk, Data_A_i, Data_B_i, Data_S_o );
  input [11:0] Data_A_i;
  input [11:0] Data_B_i;
  output [23:0] Data_S_o;
  input clk;
  wire   N0, N1, N2, N3, N4, N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, N15,
         N16, N17, N18, N19, N20, N21, N22, N23;

  multiplier_W12_1_DW_mult_uns_1 mult_39 ( .a(Data_A_i), .b(Data_B_i), 
        .product({N23, N22, N21, N20, N19, N18, N17, N16, N15, N14, N13, N12, 
        N11, N10, N9, N8, N7, N6, N5, N4, N3, N2, N1, N0}) );
  DFFQX1TS pdt_int_reg_22_ ( .D(N22), .CK(clk), .Q(Data_S_o[22]) );
  DFFQX1TS pdt_int_reg_23_ ( .D(N23), .CK(clk), .Q(Data_S_o[23]) );
  DFFQX1TS pdt_int_reg_20_ ( .D(N20), .CK(clk), .Q(Data_S_o[20]) );
  DFFQX1TS pdt_int_reg_21_ ( .D(N21), .CK(clk), .Q(Data_S_o[21]) );
  DFFQX1TS pdt_int_reg_19_ ( .D(N19), .CK(clk), .Q(Data_S_o[19]) );
  DFFQX1TS pdt_int_reg_18_ ( .D(N18), .CK(clk), .Q(Data_S_o[18]) );
  DFFQX1TS pdt_int_reg_17_ ( .D(N17), .CK(clk), .Q(Data_S_o[17]) );
  DFFQX1TS pdt_int_reg_16_ ( .D(N16), .CK(clk), .Q(Data_S_o[16]) );
  DFFQX1TS pdt_int_reg_15_ ( .D(N15), .CK(clk), .Q(Data_S_o[15]) );
  DFFQX1TS pdt_int_reg_14_ ( .D(N14), .CK(clk), .Q(Data_S_o[14]) );
  DFFQX1TS pdt_int_reg_13_ ( .D(N13), .CK(clk), .Q(Data_S_o[13]) );
  DFFQX1TS pdt_int_reg_12_ ( .D(N12), .CK(clk), .Q(Data_S_o[12]) );
  DFFQX1TS pdt_int_reg_11_ ( .D(N11), .CK(clk), .Q(Data_S_o[11]) );
  DFFQX1TS pdt_int_reg_10_ ( .D(N10), .CK(clk), .Q(Data_S_o[10]) );
  DFFQX1TS pdt_int_reg_9_ ( .D(N9), .CK(clk), .Q(Data_S_o[9]) );
  DFFQX1TS pdt_int_reg_8_ ( .D(N8), .CK(clk), .Q(Data_S_o[8]) );
  DFFQX1TS pdt_int_reg_7_ ( .D(N7), .CK(clk), .Q(Data_S_o[7]) );
  DFFQX1TS pdt_int_reg_6_ ( .D(N6), .CK(clk), .Q(Data_S_o[6]) );
  DFFQX1TS pdt_int_reg_5_ ( .D(N5), .CK(clk), .Q(Data_S_o[5]) );
  DFFQX1TS pdt_int_reg_4_ ( .D(N4), .CK(clk), .Q(Data_S_o[4]) );
  DFFQX1TS pdt_int_reg_3_ ( .D(N3), .CK(clk), .Q(Data_S_o[3]) );
  DFFQX1TS pdt_int_reg_2_ ( .D(N2), .CK(clk), .Q(Data_S_o[2]) );
  DFFQX1TS pdt_int_reg_0_ ( .D(N0), .CK(clk), .Q(Data_S_o[0]) );
  DFFQX1TS pdt_int_reg_1_ ( .D(N1), .CK(clk), .Q(Data_S_o[1]) );
initial $sdf_annotate("FPU_Multiplication_Function_syn.sdf"); 
 endmodule


module multiplier_W12_0_DW_mult_uns_1 ( a, b, product );
  input [11:0] a;
  input [11:0] b;
  output [23:0] product;
  wire   n3, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18,
         n19, n20, n21, n22, n23, n24, n25, n26, n28, n30, n31, n32, n33, n34,
         n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48,
         n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62,
         n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76,
         n77, n78, n79, n80, n81, n82, n83, n84, n85, n87, n88, n89, n90, n91,
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
         n325, n326, n327, n328, n329, n330, n343, n344, n345, n346, n347,
         n348, n349, n350, n351, n352, n353, n356, n357, n358, n359, n360,
         n362, n363, n364, n365, n366, n367, n386, n438, n440, n441, n442,
         n443, n444, n445, n446, n447, n448, n449, n450, n451, n452, n453,
         n454, n455, n456, n457, n458, n459, n460, n461, n462, n463, n464;

  XOR2X1TS U4 ( .A(n31), .B(n30), .Y(n3) );
  CMPR32X2TS U5 ( .A(n36), .B(n32), .C(n6), .CO(n5), .S(product[22]) );
  CMPR32X2TS U6 ( .A(n39), .B(n37), .C(n7), .CO(n6), .S(product[21]) );
  CMPR32X2TS U7 ( .A(n44), .B(n40), .C(n8), .CO(n7), .S(product[20]) );
  AFHCINX2TS U8 ( .CIN(n9), .B(n49), .A(n45), .S(product[19]), .CO(n8) );
  AFHCONX2TS U9 ( .A(n50), .B(n56), .CI(n10), .CON(n9), .S(product[18]) );
  AFHCINX2TS U10 ( .CIN(n11), .B(n57), .A(n62), .S(product[17]), .CO(n10) );
  AFHCONX2TS U11 ( .A(n70), .B(n63), .CI(n12), .CON(n11), .S(product[16]) );
  AFHCINX2TS U12 ( .CIN(n13), .B(n71), .A(n78), .S(product[15]), .CO(n12) );
  AFHCONX2TS U13 ( .A(n88), .B(n79), .CI(n14), .CON(n13), .S(product[14]) );
  AFHCINX2TS U14 ( .CIN(n15), .B(n89), .A(n97), .S(product[13]), .CO(n14) );
  AFHCONX2TS U15 ( .A(n105), .B(n98), .CI(n16), .CON(n15), .S(product[12]) );
  AFHCINX2TS U16 ( .CIN(n17), .B(n106), .A(n113), .S(product[11]), .CO(n16) );
  AFHCONX2TS U17 ( .A(n119), .B(n114), .CI(n18), .CON(n17), .S(product[10]) );
  AFHCINX2TS U18 ( .CIN(n19), .B(n120), .A(n126), .S(product[9]), .CO(n18) );
  AFHCONX2TS U19 ( .A(n131), .B(n127), .CI(n20), .CON(n19), .S(product[8]) );
  AFHCINX2TS U20 ( .CIN(n21), .B(n132), .A(n136), .S(product[7]), .CO(n20) );
  AFHCONX2TS U21 ( .A(n138), .B(n137), .CI(n22), .CON(n21), .S(product[6]) );
  AFHCINX2TS U22 ( .CIN(n23), .B(n139), .A(n142), .S(product[5]), .CO(n22) );
  AFHCONX2TS U23 ( .A(n144), .B(n143), .CI(n24), .CON(n23), .S(product[4]) );
  AFHCINX2TS U24 ( .CIN(n25), .B(n145), .A(n150), .S(product[3]), .CO(n24) );
  AFHCONX2TS U25 ( .A(n228), .B(n240), .CI(n26), .CON(n25), .S(product[2]) );
  XOR2X1TS U308 ( .A(a[11]), .B(a[10]), .Y(n343) );
  XOR2X1TS U311 ( .A(a[8]), .B(a[9]), .Y(n344) );
  XOR2X1TS U314 ( .A(a[6]), .B(a[7]), .Y(n345) );
  XOR2X1TS U317 ( .A(a[4]), .B(a[5]), .Y(n346) );
  XOR2X1TS U320 ( .A(a[2]), .B(a[3]), .Y(n347) );
  XOR2X1TS U323 ( .A(a[1]), .B(a[0]), .Y(n348) );
  OR2X2TS U327 ( .A(n241), .B(n151), .Y(n438) );
  AND2X2TS U328 ( .A(n438), .B(n28), .Y(product[1]) );
  INVX2TS U329 ( .A(n452), .Y(n440) );
  INVX2TS U330 ( .A(n366), .Y(n441) );
  INVX2TS U331 ( .A(n365), .Y(n442) );
  INVX2TS U332 ( .A(n364), .Y(n443) );
  INVX2TS U333 ( .A(n363), .Y(n444) );
  CLKBUFX2TS U334 ( .A(b[0]), .Y(n445) );
  CLKBUFX2TS U335 ( .A(b[0]), .Y(n446) );
  INVX2TS U336 ( .A(n455), .Y(n447) );
  INVX2TS U337 ( .A(n455), .Y(n448) );
  INVX2TS U338 ( .A(n456), .Y(n449) );
  INVX2TS U339 ( .A(a[0]), .Y(n450) );
  INVX2TS U340 ( .A(n454), .Y(n451) );
  CLKBUFX2TS U341 ( .A(n362), .Y(n452) );
  INVX2TS U342 ( .A(n367), .Y(n453) );
  XNOR2XLTS U343 ( .A(a[1]), .B(b[8]), .Y(n321) );
  XNOR2XLTS U344 ( .A(n453), .B(b[9]), .Y(n320) );
  XNOR2XLTS U345 ( .A(a[1]), .B(b[7]), .Y(n322) );
  XNOR2XLTS U346 ( .A(n453), .B(b[10]), .Y(n319) );
  XNOR2XLTS U347 ( .A(n453), .B(b[11]), .Y(n318) );
  XNOR2XLTS U348 ( .A(a[1]), .B(b[4]), .Y(n325) );
  XNOR2XLTS U349 ( .A(a[1]), .B(b[6]), .Y(n323) );
  XNOR2XLTS U350 ( .A(a[1]), .B(b[5]), .Y(n324) );
  XNOR2XLTS U351 ( .A(a[1]), .B(b[3]), .Y(n326) );
  XOR2XLTS U352 ( .A(a[2]), .B(a[1]), .Y(n454) );
  INVXLTS U353 ( .A(a[1]), .Y(n367) );
  CLKBUFX2TS U354 ( .A(n358), .Y(n459) );
  CLKBUFX2TS U355 ( .A(n357), .Y(n461) );
  CLKBUFX2TS U356 ( .A(n351), .Y(n460) );
  CLKBUFX2TS U357 ( .A(n350), .Y(n462) );
  NOR2BXLTS U358 ( .AN(n446), .B(n451), .Y(n228) );
  XNOR2XLTS U359 ( .A(a[1]), .B(b[2]), .Y(n327) );
  XNOR2XLTS U360 ( .A(n453), .B(b[1]), .Y(n328) );
  XNOR2XLTS U361 ( .A(a[7]), .B(b[2]), .Y(n288) );
  XNOR2XLTS U362 ( .A(a[9]), .B(b[1]), .Y(n276) );
  XNOR2XLTS U363 ( .A(a[3]), .B(b[1]), .Y(n315) );
  XNOR2XLTS U364 ( .A(a[3]), .B(b[2]), .Y(n314) );
  XNOR2XLTS U365 ( .A(a[5]), .B(b[1]), .Y(n302) );
  XNOR2XLTS U366 ( .A(a[7]), .B(b[1]), .Y(n289) );
  XNOR2XLTS U367 ( .A(a[5]), .B(b[2]), .Y(n301) );
  XNOR2XLTS U368 ( .A(a[9]), .B(b[2]), .Y(n275) );
  XNOR2XLTS U369 ( .A(n445), .B(a[9]), .Y(n277) );
  XNOR2XLTS U370 ( .A(n445), .B(a[7]), .Y(n290) );
  NOR2BXLTS U371 ( .AN(n445), .B(n459), .Y(n200) );
  CLKBUFX2TS U372 ( .A(n359), .Y(n457) );
  CLKBUFX2TS U373 ( .A(n356), .Y(n463) );
  XNOR2XLTS U374 ( .A(n446), .B(n453), .Y(n329) );
  CLKBUFX2TS U375 ( .A(n352), .Y(n458) );
  CLKBUFX2TS U376 ( .A(n349), .Y(n464) );
  XNOR2XLTS U377 ( .A(n445), .B(a[3]), .Y(n316) );
  XNOR2XLTS U378 ( .A(a[11]), .B(n446), .Y(n264) );
  NOR2BXLTS U379 ( .AN(n445), .B(n457), .Y(n214) );
  XNOR2XLTS U380 ( .A(n446), .B(a[5]), .Y(n303) );
  NOR2BXLTS U381 ( .AN(n446), .B(n362), .Y(n158) );
  NOR2BXLTS U382 ( .AN(n446), .B(n461), .Y(n186) );
  NOR2BXLTS U383 ( .AN(n445), .B(n463), .Y(n172) );
  XNOR2XLTS U384 ( .A(a[11]), .B(b[2]), .Y(n262) );
  XNOR2XLTS U385 ( .A(a[11]), .B(b[1]), .Y(n263) );
  INVXLTS U386 ( .A(b[1]), .Y(n252) );
  INVXLTS U387 ( .A(b[2]), .Y(n251) );
  NOR2BXLTS U388 ( .AN(n446), .B(n450), .Y(product[0]) );
  CMPR42X1TS U389 ( .A(n206), .B(n170), .C(n194), .D(n110), .ICI(n104), .S(
        n101), .ICO(n99), .CO(n100) );
  OAI22X1TS U390 ( .A0(n460), .A1(n285), .B0(n459), .B1(n284), .Y(n194) );
  OAI22X1TS U391 ( .A0(n464), .A1(n263), .B0(n463), .B1(n262), .Y(n170) );
  OAI22X1TS U392 ( .A0(n458), .A1(n296), .B0(n457), .B1(n295), .Y(n206) );
  CMPR42X1TS U393 ( .A(n193), .B(n169), .C(n217), .D(n229), .ICI(n96), .S(n92), 
        .ICO(n90), .CO(n91) );
  AO21X1TS U394 ( .A0(n448), .A1(n450), .B0(n367), .Y(n229) );
  OAI22X1TS U395 ( .A0(n449), .A1(n306), .B0(n451), .B1(n305), .Y(n217) );
  OAI22X1TS U396 ( .A0(n464), .A1(n262), .B0(n463), .B1(n261), .Y(n169) );
  CMPR42X1TS U397 ( .A(n195), .B(n219), .C(n207), .D(n111), .ICI(n112), .S(
        n109), .ICO(n107), .CO(n108) );
  OAI22X1TS U398 ( .A0(n458), .A1(n297), .B0(n457), .B1(n296), .Y(n207) );
  OAI22X1TS U399 ( .A0(n353), .A1(n308), .B0(n360), .B1(n307), .Y(n219) );
  OAI22X1TS U400 ( .A0(n460), .A1(n286), .B0(n459), .B1(n285), .Y(n195) );
  OAI22X1TS U401 ( .A0(n460), .A1(n284), .B0(n459), .B1(n283), .Y(n193) );
  OAI22X1TS U402 ( .A0(n462), .A1(n276), .B0(n461), .B1(n275), .Y(n184) );
  OAI22X1TS U403 ( .A0(n458), .A1(n302), .B0(n457), .B1(n301), .Y(n212) );
  NAND2X1TS U404 ( .A(n241), .B(n151), .Y(n28) );
  CMPR42X1TS U405 ( .A(n222), .B(n210), .C(n133), .D(n130), .ICI(n129), .S(
        n127), .ICO(n125), .CO(n126) );
  OAI22X1TS U406 ( .A0(n458), .A1(n300), .B0(n457), .B1(n299), .Y(n210) );
  OAI22X1TS U407 ( .A0(n353), .A1(n311), .B0(n451), .B1(n310), .Y(n222) );
  CMPR42X1TS U408 ( .A(n220), .B(n208), .C(n123), .D(n118), .ICI(n117), .S(
        n114), .ICO(n112), .CO(n113) );
  OAI22X1TS U409 ( .A0(n458), .A1(n298), .B0(n359), .B1(n297), .Y(n208) );
  OAI22X1TS U410 ( .A0(n449), .A1(n309), .B0(n360), .B1(n308), .Y(n220) );
  CMPR42X1TS U411 ( .A(n182), .B(n107), .C(n103), .D(n108), .ICI(n101), .S(n98), .ICO(n96), .CO(n97) );
  OAI22X1TS U412 ( .A0(n462), .A1(n274), .B0(n461), .B1(n273), .Y(n182) );
  CMPR42X1TS U413 ( .A(n90), .B(n84), .C(n93), .D(n91), .ICI(n82), .S(n79), 
        .ICO(n77), .CO(n78) );
  CMPR42X1TS U414 ( .A(n223), .B(n199), .C(n211), .D(n134), .ICI(n135), .S(
        n132), .ICO(n130), .CO(n131) );
  OAI22X1TS U415 ( .A0(n458), .A1(n301), .B0(n457), .B1(n300), .Y(n211) );
  OAI22X1TS U416 ( .A0(n460), .A1(n290), .B0(n459), .B1(n289), .Y(n199) );
  OAI22X1TS U417 ( .A0(n353), .A1(n312), .B0(n451), .B1(n311), .Y(n223) );
  CMPR42X1TS U418 ( .A(n221), .B(n124), .C(n128), .D(n122), .ICI(n125), .S(
        n120), .ICO(n118), .CO(n119) );
  OAI22X1TS U419 ( .A0(n353), .A1(n310), .B0(n451), .B1(n309), .Y(n221) );
  CMPR42X1TS U420 ( .A(n99), .B(n102), .C(n94), .D(n100), .ICI(n92), .S(n89), 
        .ICO(n87), .CO(n88) );
  CMPR32X2TS U421 ( .A(n197), .B(n185), .C(n209), .CO(n121), .S(n122) );
  OAI22X1TS U422 ( .A0(n458), .A1(n299), .B0(n457), .B1(n298), .Y(n209) );
  OAI22X1TS U423 ( .A0(n462), .A1(n277), .B0(n461), .B1(n276), .Y(n185) );
  OAI22X1TS U424 ( .A0(n460), .A1(n288), .B0(n459), .B1(n287), .Y(n197) );
  XOR2X1TS U425 ( .A(n5), .B(n3), .Y(product[23]) );
  XOR3X2TS U426 ( .A(n33), .B(n152), .C(n159), .Y(n30) );
  NOR2X1TS U427 ( .A(n452), .B(n242), .Y(n152) );
  CMPR42X1TS U428 ( .A(n179), .B(n167), .C(n203), .D(n215), .ICI(n77), .S(n74), 
        .ICO(n72), .CO(n73) );
  AO21X1TS U429 ( .A0(n449), .A1(n451), .B0(n366), .Y(n215) );
  OAI22X1TS U430 ( .A0(n352), .A1(n293), .B0(n359), .B1(n292), .Y(n203) );
  OAI22X1TS U431 ( .A0(n464), .A1(n260), .B0(n463), .B1(n259), .Y(n167) );
  CMPR42X1TS U432 ( .A(n68), .B(n202), .C(n190), .D(n166), .ICI(n72), .S(n66), 
        .ICO(n64), .CO(n65) );
  INVX2TS U433 ( .A(n67), .Y(n68) );
  OAI22X1TS U434 ( .A0(n464), .A1(n259), .B0(n463), .B1(n258), .Y(n166) );
  OAI22X1TS U435 ( .A0(n351), .A1(n281), .B0(n358), .B1(n280), .Y(n190) );
  CMPR42X1TS U436 ( .A(n180), .B(n216), .C(n204), .D(n168), .ICI(n87), .S(n82), 
        .ICO(n80), .CO(n81) );
  OAI22X1TS U437 ( .A0(n464), .A1(n261), .B0(n463), .B1(n260), .Y(n168) );
  OAI22X1TS U438 ( .A0(n352), .A1(n294), .B0(n359), .B1(n293), .Y(n204) );
  OAI22X1TS U439 ( .A0(n449), .A1(n305), .B0(n360), .B1(n366), .Y(n216) );
  OAI22X1TS U440 ( .A0(n352), .A1(n292), .B0(n359), .B1(n365), .Y(n202) );
  OAI22X1TS U441 ( .A0(n462), .A1(n272), .B0(n461), .B1(n271), .Y(n180) );
  OAI22X1TS U442 ( .A0(n462), .A1(n271), .B0(n461), .B1(n270), .Y(n179) );
  CMPR42X1TS U443 ( .A(n178), .B(n75), .C(n69), .D(n73), .ICI(n66), .S(n63), 
        .ICO(n61), .CO(n62) );
  OAI22X1TS U444 ( .A0(n350), .A1(n270), .B0(n357), .B1(n269), .Y(n178) );
  CMPR42X1TS U445 ( .A(n83), .B(n80), .C(n76), .D(n81), .ICI(n74), .S(n71), 
        .ICO(n69), .CO(n70) );
  CMPR42X1TS U446 ( .A(n165), .B(n201), .C(n60), .D(n65), .ICI(n61), .S(n57), 
        .ICO(n55), .CO(n56) );
  OAI22X1TS U447 ( .A0(n464), .A1(n258), .B0(n463), .B1(n257), .Y(n165) );
  AO21X1TS U448 ( .A0(n352), .A1(n359), .B0(n365), .Y(n201) );
  CMPR42X1TS U449 ( .A(n67), .B(n155), .C(n189), .D(n177), .ICI(n64), .S(n60), 
        .ICO(n58), .CO(n59) );
  NOR2X1TS U450 ( .A(n362), .B(n248), .Y(n155) );
  OAI22X1TS U451 ( .A0(n462), .A1(n269), .B0(n357), .B1(n268), .Y(n177) );
  OAI22X1TS U452 ( .A0(n460), .A1(n280), .B0(n358), .B1(n279), .Y(n189) );
  CMPR42X1TS U453 ( .A(n164), .B(n58), .C(n52), .D(n59), .ICI(n55), .S(n50), 
        .ICO(n48), .CO(n49) );
  OAI22X1TS U454 ( .A0(n464), .A1(n257), .B0(n356), .B1(n256), .Y(n164) );
  INVX2TS U455 ( .A(n85), .Y(n95) );
  CMPR32X2TS U456 ( .A(n95), .B(n181), .C(n205), .CO(n93), .S(n94) );
  OAI22X1TS U457 ( .A0(n458), .A1(n295), .B0(n359), .B1(n294), .Y(n205) );
  OAI22X1TS U458 ( .A0(n462), .A1(n273), .B0(n461), .B1(n272), .Y(n181) );
  CMPR42X1TS U459 ( .A(n163), .B(n187), .C(n47), .D(n51), .ICI(n48), .S(n45), 
        .ICO(n43), .CO(n44) );
  OAI22X1TS U460 ( .A0(n464), .A1(n256), .B0(n356), .B1(n255), .Y(n163) );
  AO21X1TS U461 ( .A0(n351), .A1(n358), .B0(n364), .Y(n187) );
  CMPR32X2TS U462 ( .A(n54), .B(n176), .C(n188), .CO(n51), .S(n52) );
  INVX2TS U463 ( .A(n53), .Y(n54) );
  OAI22X1TS U464 ( .A0(n351), .A1(n279), .B0(n358), .B1(n364), .Y(n188) );
  OAI22X1TS U465 ( .A0(n462), .A1(n268), .B0(n357), .B1(n267), .Y(n176) );
  CMPR42X1TS U466 ( .A(n42), .B(n174), .C(n162), .D(n46), .ICI(n43), .S(n40), 
        .ICO(n38), .CO(n39) );
  INVX2TS U467 ( .A(n41), .Y(n42) );
  OAI22X1TS U468 ( .A0(n349), .A1(n255), .B0(n356), .B1(n254), .Y(n162) );
  OAI22X1TS U469 ( .A0(n350), .A1(n266), .B0(n357), .B1(n363), .Y(n174) );
  CMPR42X1TS U470 ( .A(n41), .B(n153), .C(n161), .D(n173), .ICI(n38), .S(n37), 
        .ICO(n35), .CO(n36) );
  NOR2X1TS U471 ( .A(n452), .B(n244), .Y(n153) );
  OAI22X1TS U472 ( .A0(n349), .A1(n254), .B0(n356), .B1(n253), .Y(n161) );
  AO21X1TS U473 ( .A0(n350), .A1(n357), .B0(n363), .Y(n173) );
  AO21X1TS U474 ( .A0(n349), .A1(n356), .B0(n452), .Y(n159) );
  CMPR32X2TS U475 ( .A(n34), .B(n160), .C(n35), .CO(n31), .S(n32) );
  INVX2TS U476 ( .A(n33), .Y(n34) );
  OAI22X1TS U477 ( .A0(n349), .A1(n253), .B0(n356), .B1(n452), .Y(n160) );
  CMPR32X2TS U478 ( .A(n186), .B(n234), .C(n198), .CO(n128), .S(n129) );
  OAI22X1TS U479 ( .A0(n460), .A1(n289), .B0(n459), .B1(n288), .Y(n198) );
  OAI22X1TS U480 ( .A0(n448), .A1(n322), .B0(n321), .B1(n386), .Y(n234) );
  OAI22X1TS U481 ( .A0(n448), .A1(n329), .B0(n328), .B1(n450), .Y(n241) );
  XNOR2X1TS U482 ( .A(a[10]), .B(a[9]), .Y(n356) );
  OAI22X1TS U483 ( .A0(n448), .A1(n367), .B0(n330), .B1(n450), .Y(n151) );
  NAND2BX1TS U484 ( .AN(n446), .B(n453), .Y(n330) );
  XNOR2X1TS U485 ( .A(a[7]), .B(b[3]), .Y(n287) );
  XNOR2X1TS U486 ( .A(n441), .B(b[3]), .Y(n313) );
  XNOR2X1TS U487 ( .A(a[5]), .B(b[3]), .Y(n300) );
  XNOR2X1TS U488 ( .A(a[3]), .B(b[4]), .Y(n312) );
  XNOR2X1TS U489 ( .A(a[3]), .B(b[5]), .Y(n311) );
  CMPR42X1TS U490 ( .A(n172), .B(n232), .C(n184), .D(n196), .ICI(n121), .S(
        n117), .ICO(n115), .CO(n116) );
  OAI22X1TS U491 ( .A0(n460), .A1(n287), .B0(n459), .B1(n286), .Y(n196) );
  OAI22X1TS U492 ( .A0(n448), .A1(n320), .B0(n319), .B1(n386), .Y(n232) );
  OAI22X1TS U493 ( .A0(n353), .A1(n366), .B0(n360), .B1(n317), .Y(n150) );
  NAND2BX1TS U494 ( .AN(n446), .B(n441), .Y(n317) );
  ADDHXLTS U495 ( .A(n235), .B(n148), .CO(n133), .S(n134) );
  OAI22X1TS U496 ( .A0(n447), .A1(n323), .B0(n322), .B1(n386), .Y(n235) );
  OAI22X1TS U497 ( .A0(n460), .A1(n364), .B0(n459), .B1(n291), .Y(n148) );
  NAND2BX1TS U498 ( .AN(n445), .B(a[7]), .Y(n291) );
  INVX2TS U499 ( .A(a[0]), .Y(n386) );
  ADDHXLTS U500 ( .A(n233), .B(n147), .CO(n123), .S(n124) );
  OAI22X1TS U501 ( .A0(n448), .A1(n321), .B0(n320), .B1(n386), .Y(n233) );
  OAI22X1TS U502 ( .A0(n462), .A1(n363), .B0(n461), .B1(n278), .Y(n147) );
  NAND2BX1TS U503 ( .AN(n445), .B(a[9]), .Y(n278) );
  ADDHXLTS U504 ( .A(n239), .B(n227), .CO(n144), .S(n145) );
  OAI22X1TS U505 ( .A0(n448), .A1(n327), .B0(n326), .B1(n386), .Y(n239) );
  OAI22X1TS U506 ( .A0(n353), .A1(n316), .B0(n360), .B1(n315), .Y(n227) );
  XNOR2X1TS U507 ( .A(a[4]), .B(a[3]), .Y(n359) );
  XNOR2X1TS U508 ( .A(a[6]), .B(a[5]), .Y(n358) );
  XNOR2X1TS U509 ( .A(a[8]), .B(a[7]), .Y(n357) );
  INVX2TS U510 ( .A(n454), .Y(n360) );
  ADDHXLTS U511 ( .A(n237), .B(n149), .CO(n140), .S(n141) );
  OAI22X1TS U512 ( .A0(n447), .A1(n325), .B0(n324), .B1(n386), .Y(n237) );
  OAI22X1TS U513 ( .A0(n458), .A1(n365), .B0(n457), .B1(n304), .Y(n149) );
  NAND2BX1TS U514 ( .AN(n445), .B(a[5]), .Y(n304) );
  ADDHXLTS U515 ( .A(n231), .B(n146), .CO(n110), .S(n111) );
  OAI22X1TS U516 ( .A0(n448), .A1(n319), .B0(n318), .B1(n386), .Y(n231) );
  OAI22X1TS U517 ( .A0(n464), .A1(n362), .B0(n463), .B1(n265), .Y(n146) );
  NAND2BX1TS U518 ( .AN(n446), .B(a[11]), .Y(n265) );
  CMPR42X1TS U519 ( .A(n200), .B(n236), .C(n212), .D(n224), .ICI(n140), .S(
        n137), .ICO(n135), .CO(n136) );
  OAI22X1TS U520 ( .A0(n447), .A1(n324), .B0(n323), .B1(n386), .Y(n236) );
  OAI22X1TS U521 ( .A0(n353), .A1(n313), .B0(n451), .B1(n312), .Y(n224) );
  NAND2X1TS U522 ( .A(n346), .B(n457), .Y(n352) );
  NAND2X1TS U523 ( .A(n345), .B(n459), .Y(n351) );
  NAND2X1TS U524 ( .A(n344), .B(n461), .Y(n350) );
  NAND2X1TS U525 ( .A(n343), .B(n463), .Y(n349) );
  AND2X2TS U526 ( .A(n348), .B(n386), .Y(n455) );
  AND2X2TS U527 ( .A(n347), .B(n360), .Y(n456) );
  INVX2TS U528 ( .A(n456), .Y(n353) );
  CMPR42X1TS U529 ( .A(n183), .B(n171), .C(n115), .D(n116), .ICI(n109), .S(
        n106), .ICO(n104), .CO(n105) );
  OAI22X1TS U530 ( .A0(n464), .A1(n264), .B0(n463), .B1(n263), .Y(n171) );
  OAI22X1TS U531 ( .A0(n462), .A1(n275), .B0(n461), .B1(n274), .Y(n183) );
  CMPR32X2TS U532 ( .A(n214), .B(n238), .C(n226), .CO(n142), .S(n143) );
  OAI22X1TS U533 ( .A0(n447), .A1(n326), .B0(n325), .B1(n386), .Y(n238) );
  OAI22X1TS U534 ( .A0(n353), .A1(n315), .B0(n360), .B1(n314), .Y(n226) );
  CMPR32X2TS U535 ( .A(n225), .B(n213), .C(n141), .CO(n138), .S(n139) );
  OAI22X1TS U536 ( .A0(n353), .A1(n314), .B0(n360), .B1(n313), .Y(n225) );
  OAI22X1TS U537 ( .A0(n458), .A1(n303), .B0(n457), .B1(n302), .Y(n213) );
  OAI22X1TS U538 ( .A0(n448), .A1(n328), .B0(n327), .B1(n450), .Y(n240) );
  INVX2TS U539 ( .A(n28), .Y(n26) );
  XNOR2X1TS U540 ( .A(n442), .B(b[8]), .Y(n295) );
  XNOR2X1TS U541 ( .A(n441), .B(b[8]), .Y(n308) );
  XNOR2X1TS U542 ( .A(a[11]), .B(b[3]), .Y(n261) );
  XNOR2X1TS U543 ( .A(n444), .B(b[3]), .Y(n274) );
  XNOR2X1TS U544 ( .A(n441), .B(b[9]), .Y(n307) );
  XNOR2X1TS U545 ( .A(n441), .B(b[10]), .Y(n306) );
  XNOR2X1TS U546 ( .A(n442), .B(b[9]), .Y(n294) );
  XNOR2X1TS U547 ( .A(n442), .B(b[10]), .Y(n293) );
  XNOR2X1TS U548 ( .A(n441), .B(b[11]), .Y(n305) );
  XNOR2X1TS U549 ( .A(n442), .B(b[4]), .Y(n299) );
  XNOR2X1TS U550 ( .A(n443), .B(b[4]), .Y(n286) );
  XNOR2X1TS U551 ( .A(n443), .B(b[6]), .Y(n284) );
  XNOR2X1TS U552 ( .A(n444), .B(b[6]), .Y(n271) );
  XNOR2X1TS U553 ( .A(n441), .B(b[6]), .Y(n310) );
  XNOR2X1TS U554 ( .A(n442), .B(b[6]), .Y(n297) );
  XNOR2X1TS U555 ( .A(n444), .B(b[4]), .Y(n273) );
  XNOR2X1TS U556 ( .A(n442), .B(b[5]), .Y(n298) );
  XNOR2X1TS U557 ( .A(n442), .B(b[7]), .Y(n296) );
  XNOR2X1TS U558 ( .A(n443), .B(b[5]), .Y(n285) );
  XNOR2X1TS U559 ( .A(n443), .B(b[7]), .Y(n283) );
  XNOR2X1TS U560 ( .A(a[9]), .B(b[5]), .Y(n272) );
  XNOR2X1TS U561 ( .A(n444), .B(b[7]), .Y(n270) );
  XNOR2X1TS U562 ( .A(a[11]), .B(b[5]), .Y(n259) );
  XNOR2X1TS U563 ( .A(n441), .B(b[7]), .Y(n309) );
  INVX2TS U564 ( .A(a[11]), .Y(n362) );
  NOR2X1TS U565 ( .A(n362), .B(n252), .Y(n85) );
  INVX2TS U566 ( .A(a[3]), .Y(n366) );
  INVX2TS U567 ( .A(a[5]), .Y(n365) );
  INVX2TS U568 ( .A(a[7]), .Y(n364) );
  INVX2TS U569 ( .A(a[9]), .Y(n363) );
  CMPR32X2TS U570 ( .A(n157), .B(n95), .C(n192), .CO(n83), .S(n84) );
  NOR2X1TS U571 ( .A(n362), .B(n251), .Y(n157) );
  OAI22X1TS U572 ( .A0(n460), .A1(n283), .B0(n358), .B1(n282), .Y(n192) );
  CMPR32X2TS U573 ( .A(n85), .B(n156), .C(n191), .CO(n75), .S(n76) );
  NOR2X1TS U574 ( .A(n362), .B(n250), .Y(n156) );
  OAI22X1TS U575 ( .A0(n351), .A1(n282), .B0(n358), .B1(n281), .Y(n191) );
  INVX2TS U576 ( .A(b[3]), .Y(n250) );
  CMPR32X2TS U577 ( .A(n158), .B(n230), .C(n218), .CO(n102), .S(n103) );
  OAI22X1TS U578 ( .A0(n448), .A1(n318), .B0(n367), .B1(n450), .Y(n230) );
  OAI22X1TS U579 ( .A0(n353), .A1(n307), .B0(n451), .B1(n306), .Y(n218) );
  XNOR2X1TS U580 ( .A(n443), .B(b[8]), .Y(n282) );
  XNOR2X1TS U581 ( .A(n444), .B(b[8]), .Y(n269) );
  XNOR2X1TS U582 ( .A(n443), .B(b[9]), .Y(n281) );
  XNOR2X1TS U583 ( .A(n443), .B(b[10]), .Y(n280) );
  XNOR2X1TS U584 ( .A(n444), .B(b[9]), .Y(n268) );
  XNOR2X1TS U585 ( .A(n444), .B(b[10]), .Y(n267) );
  XNOR2X1TS U586 ( .A(n442), .B(b[11]), .Y(n292) );
  XNOR2X1TS U587 ( .A(n443), .B(b[11]), .Y(n279) );
  XNOR2X1TS U588 ( .A(n440), .B(b[4]), .Y(n260) );
  XNOR2X1TS U589 ( .A(n440), .B(b[6]), .Y(n258) );
  NOR2X1TS U590 ( .A(n362), .B(n247), .Y(n53) );
  INVX2TS U591 ( .A(b[6]), .Y(n247) );
  NOR2X1TS U592 ( .A(n362), .B(n249), .Y(n67) );
  INVX2TS U593 ( .A(b[4]), .Y(n249) );
  INVX2TS U594 ( .A(b[5]), .Y(n248) );
  CMPR32X2TS U595 ( .A(n53), .B(n154), .C(n175), .CO(n46), .S(n47) );
  NOR2X1TS U596 ( .A(n362), .B(n246), .Y(n154) );
  OAI22X1TS U597 ( .A0(n350), .A1(n267), .B0(n357), .B1(n266), .Y(n175) );
  INVX2TS U598 ( .A(b[7]), .Y(n246) );
  XNOR2X1TS U599 ( .A(n440), .B(b[8]), .Y(n256) );
  XNOR2X1TS U600 ( .A(n440), .B(b[9]), .Y(n255) );
  XNOR2X1TS U601 ( .A(n440), .B(b[10]), .Y(n254) );
  XNOR2X1TS U602 ( .A(n444), .B(b[11]), .Y(n266) );
  XNOR2X1TS U603 ( .A(n440), .B(b[7]), .Y(n257) );
  NOR2X1TS U604 ( .A(n452), .B(n245), .Y(n41) );
  INVX2TS U605 ( .A(b[8]), .Y(n245) );
  XNOR2X1TS U606 ( .A(n440), .B(b[11]), .Y(n253) );
  INVX2TS U607 ( .A(b[9]), .Y(n244) );
  NOR2X1TS U608 ( .A(n452), .B(n243), .Y(n33) );
  INVX2TS U609 ( .A(b[10]), .Y(n243) );
  INVX2TS U610 ( .A(b[11]), .Y(n242) );
initial $sdf_annotate("FPU_Multiplication_Function_syn.sdf"); 
 endmodule


module multiplier_W12_0 ( clk, Data_A_i, Data_B_i, Data_S_o );
  input [11:0] Data_A_i;
  input [11:0] Data_B_i;
  output [23:0] Data_S_o;
  input clk;
  wire   N0, N1, N2, N3, N4, N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, N15,
         N16, N17, N18, N19, N20, N21, N22, N23, n1;

  multiplier_W12_0_DW_mult_uns_1 mult_39 ( .a({Data_A_i[11:2], n1, Data_A_i[0]}), .b(Data_B_i), .product({N23, N22, N21, N20, N19, N18, N17, N16, N15, N14, 
        N13, N12, N11, N10, N9, N8, N7, N6, N5, N4, N3, N2, N1, N0}) );
  DFFQX1TS pdt_int_reg_23_ ( .D(N23), .CK(clk), .Q(Data_S_o[23]) );
  DFFQX1TS pdt_int_reg_22_ ( .D(N22), .CK(clk), .Q(Data_S_o[22]) );
  DFFQX1TS pdt_int_reg_21_ ( .D(N21), .CK(clk), .Q(Data_S_o[21]) );
  DFFQX1TS pdt_int_reg_20_ ( .D(N20), .CK(clk), .Q(Data_S_o[20]) );
  DFFQX1TS pdt_int_reg_19_ ( .D(N19), .CK(clk), .Q(Data_S_o[19]) );
  DFFQX1TS pdt_int_reg_18_ ( .D(N18), .CK(clk), .Q(Data_S_o[18]) );
  DFFQX1TS pdt_int_reg_17_ ( .D(N17), .CK(clk), .Q(Data_S_o[17]) );
  DFFQX1TS pdt_int_reg_16_ ( .D(N16), .CK(clk), .Q(Data_S_o[16]) );
  DFFQX1TS pdt_int_reg_15_ ( .D(N15), .CK(clk), .Q(Data_S_o[15]) );
  DFFQX1TS pdt_int_reg_14_ ( .D(N14), .CK(clk), .Q(Data_S_o[14]) );
  DFFQX1TS pdt_int_reg_13_ ( .D(N13), .CK(clk), .Q(Data_S_o[13]) );
  DFFQX1TS pdt_int_reg_11_ ( .D(N11), .CK(clk), .Q(Data_S_o[11]) );
  DFFQX1TS pdt_int_reg_12_ ( .D(N12), .CK(clk), .Q(Data_S_o[12]) );
  DFFQX1TS pdt_int_reg_10_ ( .D(N10), .CK(clk), .Q(Data_S_o[10]) );
  DFFQX1TS pdt_int_reg_9_ ( .D(N9), .CK(clk), .Q(Data_S_o[9]) );
  DFFQX1TS pdt_int_reg_8_ ( .D(N8), .CK(clk), .Q(Data_S_o[8]) );
  DFFQX1TS pdt_int_reg_7_ ( .D(N7), .CK(clk), .Q(Data_S_o[7]) );
  DFFQX1TS pdt_int_reg_6_ ( .D(N6), .CK(clk), .Q(Data_S_o[6]) );
  DFFQX1TS pdt_int_reg_5_ ( .D(N5), .CK(clk), .Q(Data_S_o[5]) );
  DFFQX1TS pdt_int_reg_4_ ( .D(N4), .CK(clk), .Q(Data_S_o[4]) );
  DFFQX1TS pdt_int_reg_3_ ( .D(N3), .CK(clk), .Q(Data_S_o[3]) );
  DFFQX1TS pdt_int_reg_2_ ( .D(N2), .CK(clk), .Q(Data_S_o[2]) );
  DFFQX1TS pdt_int_reg_0_ ( .D(N0), .CK(clk), .Q(Data_S_o[0]) );
  DFFQX1TS pdt_int_reg_1_ ( .D(N1), .CK(clk), .Q(Data_S_o[1]) );
  CLKBUFX2TS U3 ( .A(Data_A_i[1]), .Y(n1) );
initial $sdf_annotate("FPU_Multiplication_Function_syn.sdf"); 
 endmodule


module adder_W12_1_DW01_add_2 ( A, B, CI, SUM, CO );
  input [12:0] A;
  input [12:0] B;
  output [12:0] SUM;
  input CI;
  output CO;
  wire   n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n14, n62;

  CMPR32X2TS U2 ( .A(B[11]), .B(A[11]), .C(n3), .CO(SUM[12]), .S(SUM[11]) );
  CMPR32X2TS U3 ( .A(A[10]), .B(B[10]), .C(n4), .CO(n3), .S(SUM[10]) );
  AFHCINX2TS U4 ( .CIN(n5), .B(A[9]), .A(B[9]), .S(SUM[9]), .CO(n4) );
  AFHCONX2TS U5 ( .A(B[8]), .B(A[8]), .CI(n6), .CON(n5), .S(SUM[8]) );
  AFHCINX2TS U6 ( .CIN(n7), .B(A[7]), .A(B[7]), .S(SUM[7]), .CO(n6) );
  AFHCONX2TS U7 ( .A(B[6]), .B(A[6]), .CI(n8), .CON(n7), .S(SUM[6]) );
  AFHCINX2TS U8 ( .CIN(n9), .B(A[5]), .A(B[5]), .S(SUM[5]), .CO(n8) );
  AFHCONX2TS U9 ( .A(B[4]), .B(A[4]), .CI(n10), .CON(n9), .S(SUM[4]) );
  AFHCINX2TS U10 ( .CIN(n11), .B(A[3]), .A(B[3]), .S(SUM[3]), .CO(n10) );
  AFHCONX2TS U11 ( .A(B[2]), .B(A[2]), .CI(n12), .CON(n11), .S(SUM[2]) );
  AFHCINX2TS U12 ( .CIN(n14), .B(A[1]), .A(B[1]), .S(SUM[1]), .CO(n12) );
  AND2X2TS U21 ( .A(n62), .B(n14), .Y(SUM[0]) );
  OR2X2TS U22 ( .A(A[0]), .B(B[0]), .Y(n62) );
  NAND2X1TS U23 ( .A(A[0]), .B(B[0]), .Y(n14) );
initial $sdf_annotate("FPU_Multiplication_Function_syn.sdf"); 
 endmodule


module adder_W12_1 ( Data_A_i, Data_B_i, Data_S_o );
  input [11:0] Data_A_i;
  input [11:0] Data_B_i;
  output [12:0] Data_S_o;


  adder_W12_1_DW01_add_2 add_31 ( .A({1'b0, Data_A_i}), .B({1'b0, Data_B_i}), 
        .CI(1'b0), .SUM(Data_S_o) );
initial $sdf_annotate("FPU_Multiplication_Function_syn.sdf"); 
 endmodule


module adder_W12_0_DW01_add_2 ( A, B, CI, SUM, CO );
  input [12:0] A;
  input [12:0] B;
  output [12:0] SUM;
  input CI;
  output CO;
  wire   n1, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14;

  CMPR32X2TS U2 ( .A(B[11]), .B(A[11]), .C(n3), .CO(SUM[12]), .S(SUM[11]) );
  CMPR32X2TS U3 ( .A(A[10]), .B(B[10]), .C(n4), .CO(n3), .S(SUM[10]) );
  AFHCINX2TS U6 ( .CIN(n7), .B(A[7]), .A(B[7]), .S(SUM[7]), .CO(n6) );
  AFHCONX2TS U7 ( .A(B[6]), .B(A[6]), .CI(n8), .CON(n7), .S(SUM[6]) );
  AFHCINX2TS U8 ( .CIN(n9), .B(A[5]), .A(B[5]), .S(SUM[5]), .CO(n8) );
  AFHCONX2TS U9 ( .A(B[4]), .B(A[4]), .CI(n10), .CON(n9), .S(SUM[4]) );
  AFHCINX2TS U10 ( .CIN(n11), .B(A[3]), .A(B[3]), .S(SUM[3]), .CO(n10) );
  AFHCONX2TS U11 ( .A(B[2]), .B(A[2]), .CI(n12), .CON(n11), .S(SUM[2]) );
  AFHCINX2TS U12 ( .CIN(n14), .B(A[1]), .A(B[1]), .S(SUM[1]), .CO(n12) );
  CMPR32X2TS U21 ( .A(A[9]), .B(B[9]), .C(n5), .CO(n4), .S(SUM[9]) );
  CMPR32X2TS U22 ( .A(A[8]), .B(B[8]), .C(n6), .CO(n5), .S(SUM[8]) );
  NAND2BXLTS U23 ( .AN(n13), .B(n14), .Y(n1) );
  NOR2XLTS U24 ( .A(A[0]), .B(B[0]), .Y(n13) );
  INVX2TS U25 ( .A(n1), .Y(SUM[0]) );
  NAND2X1TS U26 ( .A(A[0]), .B(B[0]), .Y(n14) );
initial $sdf_annotate("FPU_Multiplication_Function_syn.sdf"); 
 endmodule


module adder_W12_0 ( Data_A_i, Data_B_i, Data_S_o );
  input [11:0] Data_A_i;
  input [11:0] Data_B_i;
  output [12:0] Data_S_o;


  adder_W12_0_DW01_add_2 add_31 ( .A({1'b0, Data_A_i}), .B({1'b0, Data_B_i}), 
        .CI(1'b0), .SUM(Data_S_o) );
initial $sdf_annotate("FPU_Multiplication_Function_syn.sdf"); 
 endmodule


module multiplier_W13_DW_mult_uns_2 ( a, b, product );
  input [12:0] a;
  input [12:0] b;
  output [25:0] product;
  wire   n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18,
         n19, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33,
         n34, n35, n36, n37, n42, n43, n44, n45, n46, n49, n50, n51, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n72, n73, n74,
         n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90,
         n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n103, n105,
         n106, n107, n108, n109, n111, n113, n114, n115, n116, n117, n118,
         n119, n120, n121, n122, n123, n124, n126, n131, n132, n136, n140,
         n142, n145, n146, n147, n148, n149, n150, n151, n152, n153, n154,
         n155, n156, n157, n158, n159, n160, n161, n162, n163, n164, n165,
         n166, n167, n168, n169, n170, n171, n172, n173, n174, n175, n176,
         n177, n178, n179, n180, n181, n182, n183, n184, n185, n186, n187,
         n188, n189, n190, n191, n192, n193, n194, n195, n196, n197, n198,
         n199, n200, n202, n203, n204, n205, n206, n207, n208, n209, n210,
         n211, n212, n213, n214, n215, n216, n217, n218, n219, n220, n221,
         n222, n223, n224, n225, n226, n227, n228, n229, n230, n231, n232,
         n233, n234, n235, n236, n237, n238, n239, n240, n241, n242, n243,
         n244, n245, n246, n247, n248, n249, n250, n251, n252, n253, n254,
         n255, n256, n257, n258, n259, n260, n261, n262, n263, n264, n265,
         n266, n267, n268, n269, n270, n271, n272, n273, n274, n276, n277,
         n278, n279, n280, n281, n282, n283, n284, n285, n286, n287, n288,
         n289, n290, n291, n292, n293, n294, n295, n296, n297, n298, n299,
         n300, n301, n302, n303, n304, n305, n306, n307, n308, n309, n310,
         n311, n312, n313, n314, n315, n316, n317, n318, n319, n320, n321,
         n322, n323, n324, n325, n326, n327, n328, n329, n330, n331, n332,
         n333, n334, n335, n336, n337, n338, n339, n340, n341, n342, n343,
         n344, n345, n346, n347, n348, n349, n350, n351, n352, n353, n354,
         n355, n356, n357, n358, n359, n360, n361, n362, n363, n364, n365,
         n366, n367, n368, n369, n370, n371, n372, n373, n374, n375, n376,
         n377, n378, n379, n380, n381, n382, n383, n384, n385, n387, n388,
         n389, n390, n391, n392, n393, n394, n395, n396, n397, n398, n399,
         n400, n401, n402, n403, n404, n405, n406, n407, n408, n409, n410,
         n411, n412, n413, n414, n415, n416, n417, n418, n419, n420, n421,
         n422, n423, n424, n425, n426, n427, n428, n429, n430, n431, n432,
         n433, n434, n435, n436, n437, n438, n439, n440, n441, n442, n443,
         n444, n445, n446, n447, n448, n449, n450, n451, n452, n453, n454,
         n455, n456, n457, n458, n459, n460, n461, n462, n463, n464, n465,
         n466, n467, n468, n469, n470, n485, n486, n487, n488, n489, n490,
         n495, n496, n497, n498, n499, n500, n501, n502, n503, n504, n510,
         n511, n512, n513, n515, n516, n517, n518, n519, n520, n521, n522,
         n523, n524, n525, n526, n527, n528, n529, n530, n585, n586, n587,
         n588, n590, n591, n592, n593, n594, n595, n596, n597, n598, n599,
         n600, n601, n602, n603, n604, n605, n606, n607;

  AFHCINX2TS U4 ( .CIN(n21), .B(n145), .A(n606), .S(product[25]) );
  XOR2X1TS U5 ( .A(n26), .B(n4), .Y(product[24]) );
  XOR2X1TS U13 ( .A(n35), .B(n5), .Y(product[23]) );
  XOR2X1TS U25 ( .A(n44), .B(n6), .Y(product[22]) );
  XOR2X1TS U37 ( .A(n51), .B(n7), .Y(product[21]) );
  XOR2X1TS U59 ( .A(n67), .B(n9), .Y(product[19]) );
  XOR2X1TS U69 ( .A(n74), .B(n10), .Y(product[18]) );
  XOR2X1TS U79 ( .A(n83), .B(n11), .Y(product[17]) );
  XOR2X1TS U108 ( .A(n14), .B(n97), .Y(product[14]) );
  XOR2X1TS U114 ( .A(n15), .B(n101), .Y(product[13]) );
  XOR2X1TS U129 ( .A(n17), .B(n109), .Y(product[11]) );
  XOR2X1TS U143 ( .A(n19), .B(n117), .Y(product[9]) );
  AFHCONX2TS U149 ( .A(n254), .B(n250), .CI(n118), .CON(n117), .S(product[8])
         );
  AFHCINX2TS U150 ( .CIN(n119), .B(n255), .A(n259), .S(product[7]), .CO(n118)
         );
  AFHCONX2TS U151 ( .A(n261), .B(n120), .CI(n260), .CON(n119), .S(product[6])
         );
  AFHCINX2TS U152 ( .CIN(n121), .B(n262), .A(n272), .S(product[5]), .CO(n120)
         );
  AFHCONX2TS U153 ( .A(n267), .B(n266), .CI(n122), .CON(n121), .S(product[4])
         );
  AFHCINX2TS U154 ( .CIN(n123), .B(n268), .A(n273), .S(product[3]), .CO(n122)
         );
  AFHCONX2TS U155 ( .A(n360), .B(n372), .CI(n124), .CON(n123), .S(product[2])
         );
  XOR2X1TS U461 ( .A(a[11]), .B(a[10]), .Y(n485) );
  XOR2X1TS U464 ( .A(a[9]), .B(a[8]), .Y(n486) );
  XOR2X1TS U467 ( .A(a[7]), .B(a[6]), .Y(n487) );
  XOR2X1TS U470 ( .A(a[5]), .B(a[4]), .Y(n488) );
  XOR2X1TS U473 ( .A(a[3]), .B(a[2]), .Y(n489) );
  XOR2X1TS U476 ( .A(a[1]), .B(a[0]), .Y(n490) );
  XNOR2X1TS U480 ( .A(a[10]), .B(a[9]), .Y(n525) );
  OAI21X1TS U481 ( .A0(n89), .A1(n61), .B0(n62), .Y(n60) );
  OAI22X1TS U482 ( .A0(n417), .A1(n501), .B0(n418), .B1(n520), .Y(n320) );
  CLKINVX2TS U483 ( .A(n512), .Y(n593) );
  NOR2XLTS U484 ( .A(n86), .B(n81), .Y(n79) );
  OR2X2TS U485 ( .A(n237), .B(n242), .Y(n585) );
  OR2X2TS U486 ( .A(n221), .B(n228), .Y(n586) );
  OA21XLTS U487 ( .A0(n50), .A1(n42), .B0(n43), .Y(n587) );
  OR2X2TS U488 ( .A(n373), .B(n274), .Y(n588) );
  AND2X2TS U489 ( .A(n588), .B(n126), .Y(product[1]) );
  INVX2TS U490 ( .A(n519), .Y(n590) );
  CLKINVX1TS U491 ( .A(n590), .Y(n591) );
  INVX2TS U492 ( .A(n511), .Y(n592) );
  INVX2TS U493 ( .A(n513), .Y(n594) );
  INVX2TS U494 ( .A(a[5]), .Y(n595) );
  INVX2TS U495 ( .A(n595), .Y(n596) );
  INVX2TS U496 ( .A(n515), .Y(n597) );
  INVX2TS U497 ( .A(n518), .Y(n598) );
  INVX2TS U498 ( .A(n598), .Y(n599) );
  INVX2TS U499 ( .A(b[0]), .Y(n600) );
  INVX2TS U500 ( .A(n600), .Y(n601) );
  CLKBUFX2TS U501 ( .A(n520), .Y(n602) );
  CLKBUFX2TS U502 ( .A(n517), .Y(n603) );
  CMPR42X2TS U503 ( .A(n283), .B(n334), .C(n206), .D(n197), .ICI(n202), .S(
        n194), .ICO(n192), .CO(n193) );
  NAND2X1TS U504 ( .A(n604), .B(n605), .Y(n335) );
  CMPR42X1TS U505 ( .A(n217), .B(n209), .C(n335), .D(n297), .ICI(n348), .S(
        n207), .ICO(n205), .CO(n206) );
  CLKBUFX2TS U506 ( .A(n528), .Y(n502) );
  CLKBUFX2TS U507 ( .A(n521), .Y(n495) );
  OR2X2TS U508 ( .A(n431), .B(n528), .Y(n604) );
  OR2XLTS U509 ( .A(n432), .B(n495), .Y(n605) );
  NOR2X1TS U510 ( .A(n194), .B(n203), .Y(n92) );
  NOR2X1TS U511 ( .A(n173), .B(n177), .Y(n72) );
  NOR2X1TS U512 ( .A(n178), .B(n185), .Y(n81) );
  AOI21X1TS U513 ( .A0(n60), .A1(n22), .B0(n23), .Y(n21) );
  CMPR32X2TS U514 ( .A(n200), .B(n346), .C(n307), .CO(n190), .S(n191) );
  XNOR2X1TS U515 ( .A(b[9]), .B(n513), .Y(n418) );
  OAI22XLTS U516 ( .A0(n519), .A1(n405), .B0(n404), .B1(n500), .Y(n182) );
  XNOR2XLTS U517 ( .A(b[11]), .B(a[9]), .Y(n402) );
  XNOR2XLTS U518 ( .A(b[12]), .B(a[9]), .Y(n401) );
  XNOR2XLTS U519 ( .A(n512), .B(b[6]), .Y(n407) );
  XNOR2XLTS U520 ( .A(n512), .B(b[5]), .Y(n408) );
  XNOR2XLTS U521 ( .A(n512), .B(b[2]), .Y(n411) );
  XNOR2XLTS U522 ( .A(n512), .B(b[3]), .Y(n410) );
  XNOR2XLTS U523 ( .A(a[9]), .B(b[1]), .Y(n412) );
  XNOR2XLTS U524 ( .A(n512), .B(b[4]), .Y(n409) );
  XNOR2XLTS U525 ( .A(a[9]), .B(b[0]), .Y(n413) );
  NAND2BXLTS U526 ( .AN(b[0]), .B(a[9]), .Y(n414) );
  NAND2XLTS U527 ( .A(n79), .B(n63), .Y(n61) );
  INVXLTS U528 ( .A(n89), .Y(n88) );
  INVXLTS U529 ( .A(n80), .Y(n78) );
  INVXLTS U530 ( .A(n79), .Y(n77) );
  INVXLTS U531 ( .A(n98), .Y(n97) );
  NAND2XLTS U532 ( .A(n84), .B(n87), .Y(n12) );
  XNOR2XLTS U533 ( .A(n60), .B(n8), .Y(product[20]) );
  OAI21XLTS U534 ( .A0(n97), .A1(n95), .B0(n96), .Y(n94) );
  NAND2BX1TS U535 ( .AN(n49), .B(n50), .Y(n7) );
  NAND2BX1TS U536 ( .AN(n42), .B(n43), .Y(n6) );
  NAND2BX1TS U537 ( .AN(n24), .B(n25), .Y(n4) );
  NAND2BX1TS U538 ( .AN(n33), .B(n34), .Y(n5) );
  NAND2BXLTS U539 ( .AN(n81), .B(n82), .Y(n11) );
  NAND2BX1TS U540 ( .AN(n72), .B(n73), .Y(n10) );
  OAI21XLTS U541 ( .A0(n73), .A1(n65), .B0(n66), .Y(n64) );
  INVXLTS U542 ( .A(n87), .Y(n85) );
  NAND2BX1TS U543 ( .AN(n99), .B(n100), .Y(n15) );
  NAND2BXLTS U544 ( .AN(n95), .B(n96), .Y(n14) );
  NOR2X1TS U545 ( .A(n186), .B(n193), .Y(n86) );
  NOR2X1TS U546 ( .A(n165), .B(n161), .Y(n58) );
  NOR2X1TS U547 ( .A(n160), .B(n156), .Y(n49) );
  NOR2X1TS U548 ( .A(n204), .B(n212), .Y(n95) );
  NOR2X1TS U549 ( .A(n166), .B(n172), .Y(n65) );
  NOR2X1TS U550 ( .A(n155), .B(n153), .Y(n42) );
  NAND2XLTS U551 ( .A(n221), .B(n228), .Y(n105) );
  NAND2XLTS U552 ( .A(n194), .B(n203), .Y(n93) );
  OR2X2TS U553 ( .A(n374), .B(n603), .Y(n606) );
  NOR2X1TS U554 ( .A(n147), .B(n146), .Y(n24) );
  XNOR2XLTS U555 ( .A(n513), .B(b[7]), .Y(n420) );
  XNOR2XLTS U556 ( .A(n512), .B(b[8]), .Y(n405) );
  XNOR2XLTS U557 ( .A(n512), .B(b[7]), .Y(n406) );
  XNOR2XLTS U558 ( .A(n511), .B(b[7]), .Y(n392) );
  XNOR2XLTS U559 ( .A(n511), .B(b[8]), .Y(n391) );
  XNOR2XLTS U560 ( .A(b[8]), .B(a[3]), .Y(n447) );
  XNOR2XLTS U561 ( .A(b[9]), .B(a[1]), .Y(n460) );
  XNOR2XLTS U562 ( .A(b[8]), .B(n516), .Y(n461) );
  XNOR2XLTS U563 ( .A(b[9]), .B(n515), .Y(n446) );
  XNOR2XLTS U564 ( .A(b[10]), .B(n515), .Y(n445) );
  XNOR2XLTS U565 ( .A(b[10]), .B(a[1]), .Y(n459) );
  XNOR2XLTS U566 ( .A(b[7]), .B(n516), .Y(n462) );
  XNOR2XLTS U567 ( .A(b[7]), .B(a[5]), .Y(n434) );
  XNOR2XLTS U568 ( .A(b[8]), .B(n596), .Y(n433) );
  XNOR2XLTS U569 ( .A(b[10]), .B(n513), .Y(n417) );
  XNOR2XLTS U570 ( .A(b[10]), .B(n512), .Y(n403) );
  XNOR2XLTS U571 ( .A(b[9]), .B(n512), .Y(n404) );
  XNOR2XLTS U572 ( .A(a[11]), .B(b[10]), .Y(n389) );
  CLKBUFX2TS U573 ( .A(n527), .Y(n501) );
  CLKBUFX2TS U574 ( .A(n526), .Y(n500) );
  CLKBUFX2TS U575 ( .A(n525), .Y(n499) );
  CLKBUFX2TS U576 ( .A(n524), .Y(n498) );
  XNOR2XLTS U577 ( .A(a[11]), .B(b[9]), .Y(n390) );
  CLKBUFX2TS U578 ( .A(n529), .Y(n503) );
  AO21X1TS U579 ( .A0(n497), .A1(n504), .B0(n510), .Y(n200) );
  INVXLTS U580 ( .A(b[10]), .Y(n376) );
  INVXLTS U581 ( .A(b[9]), .Y(n377) );
  CLKBUFX2TS U582 ( .A(n530), .Y(n504) );
  INVXLTS U583 ( .A(b[8]), .Y(n378) );
  INVXLTS U584 ( .A(b[7]), .Y(n379) );
  CLKBUFX2TS U585 ( .A(a[11]), .Y(n511) );
  CLKBUFX2TS U586 ( .A(a[9]), .Y(n512) );
  CLKBUFX2TS U587 ( .A(a[7]), .Y(n513) );
  CLKBUFX2TS U588 ( .A(a[3]), .Y(n515) );
  CLKBUFX2TS U589 ( .A(n522), .Y(n496) );
  CLKBUFX2TS U590 ( .A(a[1]), .Y(n516) );
  CLKBUFX2TS U591 ( .A(n523), .Y(n497) );
  INVX2TS U592 ( .A(n29), .Y(n27) );
  NOR2X1TS U593 ( .A(n77), .B(n72), .Y(n68) );
  AOI21X1TS U594 ( .A0(n80), .A1(n63), .B0(n64), .Y(n62) );
  NAND2X1TS U595 ( .A(n36), .B(n31), .Y(n29) );
  NOR2X1TS U596 ( .A(n58), .B(n49), .Y(n45) );
  INVX2TS U597 ( .A(n30), .Y(n28) );
  AOI21X1TS U598 ( .A0(n88), .A1(n84), .B0(n85), .Y(n83) );
  AOI21X1TS U599 ( .A0(n88), .A1(n79), .B0(n80), .Y(n74) );
  NAND2X1TS U600 ( .A(n132), .B(n66), .Y(n9) );
  AOI21X1TS U601 ( .A0(n88), .A1(n68), .B0(n69), .Y(n67) );
  INVX2TS U602 ( .A(n65), .Y(n132) );
  AOI21X1TS U603 ( .A0(n60), .A1(n131), .B0(n57), .Y(n51) );
  AOI21X1TS U604 ( .A0(n60), .A1(n45), .B0(n46), .Y(n44) );
  AOI21X1TS U605 ( .A0(n60), .A1(n36), .B0(n37), .Y(n35) );
  AOI21X1TS U606 ( .A0(n60), .A1(n27), .B0(n28), .Y(n26) );
  AOI21X1TS U607 ( .A0(n90), .A1(n98), .B0(n91), .Y(n89) );
  NOR2X1TS U608 ( .A(n92), .B(n95), .Y(n90) );
  OAI21X1TS U609 ( .A0(n92), .A1(n96), .B0(n93), .Y(n91) );
  OAI21X1TS U610 ( .A0(n101), .A1(n99), .B0(n100), .Y(n98) );
  OAI21X1TS U611 ( .A0(n81), .A1(n87), .B0(n82), .Y(n80) );
  OAI21X1TS U612 ( .A0(n107), .A1(n109), .B0(n108), .Y(n106) );
  NAND2X1TS U613 ( .A(n131), .B(n59), .Y(n8) );
  INVX2TS U614 ( .A(n58), .Y(n131) );
  AOI21X1TS U615 ( .A0(n106), .A1(n586), .B0(n103), .Y(n101) );
  INVX2TS U616 ( .A(n105), .Y(n103) );
  OAI21X1TS U617 ( .A0(n78), .A1(n72), .B0(n73), .Y(n69) );
  NOR2X1TS U618 ( .A(n72), .B(n65), .Y(n63) );
  AOI21X1TS U619 ( .A0(n37), .A1(n31), .B0(n32), .Y(n30) );
  INVX2TS U620 ( .A(n34), .Y(n32) );
  OAI21X1TS U621 ( .A0(n115), .A1(n117), .B0(n116), .Y(n114) );
  OAI21X1TS U622 ( .A0(n607), .A1(n59), .B0(n587), .Y(n37) );
  XNOR2X1TS U623 ( .A(n16), .B(n106), .Y(product[12]) );
  NAND2X1TS U624 ( .A(n586), .B(n105), .Y(n16) );
  XNOR2X1TS U625 ( .A(n88), .B(n12), .Y(product[16]) );
  XNOR2X1TS U626 ( .A(n13), .B(n94), .Y(product[15]) );
  NAND2X1TS U627 ( .A(n136), .B(n93), .Y(n13) );
  INVX2TS U628 ( .A(n92), .Y(n136) );
  AOI21X1TS U629 ( .A0(n585), .A1(n114), .B0(n111), .Y(n109) );
  INVX2TS U630 ( .A(n113), .Y(n111) );
  OAI21X1TS U631 ( .A0(n59), .A1(n49), .B0(n50), .Y(n46) );
  OAI21X1TS U632 ( .A0(n30), .A1(n24), .B0(n25), .Y(n23) );
  NOR2X1TS U633 ( .A(n58), .B(n607), .Y(n36) );
  OR2X2TS U634 ( .A(n49), .B(n42), .Y(n607) );
  NOR2X1TS U635 ( .A(n29), .B(n24), .Y(n22) );
  INVX2TS U636 ( .A(n59), .Y(n57) );
  INVX2TS U637 ( .A(n33), .Y(n31) );
  INVX2TS U638 ( .A(n86), .Y(n84) );
  NAND2X1TS U639 ( .A(n140), .B(n108), .Y(n17) );
  INVX2TS U640 ( .A(n107), .Y(n140) );
  XNOR2X1TS U641 ( .A(n18), .B(n114), .Y(product[10]) );
  NAND2X1TS U642 ( .A(n585), .B(n113), .Y(n18) );
  NAND2X1TS U643 ( .A(n142), .B(n116), .Y(n19) );
  INVX2TS U644 ( .A(n115), .Y(n142) );
  CMPR42X1TS U645 ( .A(n284), .B(n214), .C(n211), .D(n215), .ICI(n207), .S(
        n204), .ICO(n202), .CO(n203) );
  OAI22X1TS U646 ( .A0(n517), .A1(n385), .B0(n498), .B1(n384), .Y(n284) );
  NAND2X1TS U647 ( .A(n186), .B(n193), .Y(n87) );
  NOR2X1TS U648 ( .A(n229), .B(n236), .Y(n107) );
  NAND2X1TS U649 ( .A(n173), .B(n177), .Y(n73) );
  NOR2X1TS U650 ( .A(n213), .B(n220), .Y(n99) );
  NAND2X1TS U651 ( .A(n204), .B(n212), .Y(n96) );
  NAND2X1TS U652 ( .A(n178), .B(n185), .Y(n82) );
  NAND2X1TS U653 ( .A(n166), .B(n172), .Y(n66) );
  NAND2X1TS U654 ( .A(n229), .B(n236), .Y(n108) );
  OAI22X1TS U655 ( .A0(n603), .A1(n376), .B0(n524), .B1(n375), .Y(n149) );
  OAI22X1TS U656 ( .A0(n517), .A1(n378), .B0(n498), .B1(n377), .Y(n157) );
  NOR2X1TS U657 ( .A(n152), .B(n148), .Y(n33) );
  NOR2X1TS U658 ( .A(n243), .B(n249), .Y(n115) );
  NAND2X1TS U659 ( .A(n165), .B(n161), .Y(n59) );
  NAND2X1TS U660 ( .A(n160), .B(n156), .Y(n50) );
  NAND2X1TS U661 ( .A(n237), .B(n242), .Y(n113) );
  NAND2X1TS U662 ( .A(n155), .B(n153), .Y(n43) );
  NAND2X1TS U663 ( .A(n152), .B(n148), .Y(n34) );
  NAND2X1TS U664 ( .A(n243), .B(n249), .Y(n116) );
  NAND2X1TS U665 ( .A(n213), .B(n220), .Y(n100) );
  NAND2X1TS U666 ( .A(n373), .B(n274), .Y(n126) );
  NAND2X1TS U667 ( .A(n147), .B(n146), .Y(n25) );
  NAND2X1TS U668 ( .A(n524), .B(a[12]), .Y(n517) );
  XNOR2X1TS U669 ( .A(b[10]), .B(n596), .Y(n431) );
  XNOR2X1TS U670 ( .A(b[9]), .B(n596), .Y(n432) );
  XNOR2X1TS U671 ( .A(b[8]), .B(a[7]), .Y(n419) );
  XNOR2X1TS U672 ( .A(a[11]), .B(b[2]), .Y(n397) );
  XNOR2X1TS U673 ( .A(n513), .B(b[4]), .Y(n423) );
  XNOR2X1TS U674 ( .A(n511), .B(b[3]), .Y(n396) );
  XNOR2X1TS U675 ( .A(n511), .B(b[4]), .Y(n395) );
  XNOR2X1TS U676 ( .A(a[7]), .B(b[5]), .Y(n422) );
  XNOR2X1TS U677 ( .A(n513), .B(b[6]), .Y(n421) );
  XNOR2X1TS U678 ( .A(n511), .B(b[5]), .Y(n394) );
  XNOR2X1TS U679 ( .A(n511), .B(b[6]), .Y(n393) );
  ADDHXLTS U680 ( .A(n340), .B(n353), .CO(n246), .S(n247) );
  OAI22X1TS U681 ( .A0(n448), .A1(n503), .B0(n449), .B1(n496), .Y(n353) );
  OAI22X1TS U682 ( .A0(n495), .A1(n437), .B0(n436), .B1(n502), .Y(n340) );
  CMPR42X1TS U683 ( .A(n231), .B(n299), .C(n362), .D(n227), .ICI(n224), .S(
        n221), .ICO(n219), .CO(n220) );
  OAI22X1TS U684 ( .A0(n457), .A1(n530), .B0(n458), .B1(n523), .Y(n362) );
  OAI22X1TS U685 ( .A0(n599), .A1(n398), .B0(n397), .B1(n499), .Y(n299) );
  OAI22X1TS U686 ( .A0(n430), .A1(n528), .B0(n431), .B1(n521), .Y(n334) );
  OAI22X1TS U687 ( .A0(n517), .A1(n384), .B0(n498), .B1(n383), .Y(n283) );
  CMPR42X1TS U688 ( .A(n282), .B(n333), .C(n196), .D(n189), .ICI(n192), .S(
        n186), .ICO(n184), .CO(n185) );
  OAI22X1TS U689 ( .A0(n429), .A1(n528), .B0(n430), .B1(n521), .Y(n333) );
  OAI22X1TS U690 ( .A0(n517), .A1(n383), .B0(n498), .B1(n382), .Y(n282) );
  CMPR42X1TS U691 ( .A(n319), .B(n332), .C(n188), .D(n181), .ICI(n184), .S(
        n178), .ICO(n176), .CO(n177) );
  OAI22X1TS U692 ( .A0(n416), .A1(n527), .B0(n417), .B1(n602), .Y(n319) );
  OAI22X1TS U693 ( .A0(n429), .A1(n521), .B0(n595), .B1(n528), .Y(n332) );
  CMPR42X1TS U694 ( .A(n318), .B(n179), .C(n180), .D(n175), .ICI(n176), .S(
        n173), .ICO(n171), .CO(n172) );
  OAI22X1TS U695 ( .A0(n415), .A1(n527), .B0(n416), .B1(n602), .Y(n318) );
  CMPR42X1TS U696 ( .A(n292), .B(n317), .C(n168), .D(n174), .ICI(n171), .S(
        n166), .ICO(n164), .CO(n165) );
  OAI22X1TS U697 ( .A0(n415), .A1(n602), .B0(n594), .B1(n527), .Y(n317) );
  OAI22X1TS U698 ( .A0(n599), .A1(n391), .B0(n390), .B1(n525), .Y(n292) );
  CMPR42X1TS U699 ( .A(n311), .B(n226), .C(n230), .D(n350), .ICI(n286), .S(
        n224), .ICO(n222), .CO(n223) );
  NOR2BX1TS U700 ( .AN(b[0]), .B(n498), .Y(n286) );
  OAI22X1TS U701 ( .A0(n445), .A1(n529), .B0(n446), .B1(n522), .Y(n350) );
  OAI22X1TS U702 ( .A0(n591), .A1(n410), .B0(n409), .B1(n500), .Y(n311) );
  CMPR42X1TS U703 ( .A(n339), .B(n246), .C(n352), .D(n326), .ICI(n244), .S(
        n240), .ICO(n238), .CO(n239) );
  OAI22X1TS U704 ( .A0(n520), .A1(n424), .B0(n423), .B1(n501), .Y(n326) );
  OAI22X1TS U705 ( .A0(n495), .A1(n436), .B0(n435), .B1(n502), .Y(n339) );
  OAI22X1TS U706 ( .A0(n447), .A1(n503), .B0(n448), .B1(n496), .Y(n352) );
  CMPR42X1TS U707 ( .A(n234), .B(n238), .C(n351), .D(n312), .ICI(n239), .S(
        n232), .ICO(n230), .CO(n231) );
  OAI22X1TS U708 ( .A0(n591), .A1(n411), .B0(n410), .B1(n500), .Y(n312) );
  OAI22X1TS U709 ( .A0(n446), .A1(n529), .B0(n447), .B1(n496), .Y(n351) );
  CMPR42X1TS U710 ( .A(n225), .B(n218), .C(n222), .D(n298), .ICI(n285), .S(
        n216), .ICO(n214), .CO(n215) );
  OAI22X1TS U711 ( .A0(n603), .A1(n600), .B0(n524), .B1(n385), .Y(n285) );
  OAI22X1TS U712 ( .A0(n599), .A1(n397), .B0(n396), .B1(n499), .Y(n298) );
  OAI22X1TS U713 ( .A0(n518), .A1(n392), .B0(n391), .B1(n499), .Y(n293) );
  CMPR42X1TS U714 ( .A(n313), .B(n301), .C(n241), .D(n364), .ICI(n240), .S(
        n237), .ICO(n235), .CO(n236) );
  OAI22X1TS U715 ( .A0(n459), .A1(n530), .B0(n460), .B1(n523), .Y(n364) );
  OAI22X1TS U716 ( .A0(n591), .A1(n412), .B0(n411), .B1(n500), .Y(n313) );
  NOR2BX1TS U717 ( .AN(b[0]), .B(n499), .Y(n301) );
  CMPR42X1TS U718 ( .A(n349), .B(n361), .C(n223), .D(n219), .ICI(n216), .S(
        n213), .ICO(n211), .CO(n212) );
  OAI22X1TS U719 ( .A0(n444), .A1(n529), .B0(n445), .B1(n522), .Y(n349) );
  OAI22X1TS U720 ( .A0(n457), .A1(n523), .B0(n510), .B1(n530), .Y(n361) );
  OAI22X1TS U721 ( .A0(n443), .A1(n529), .B0(n444), .B1(n522), .Y(n348) );
  OAI22X1TS U722 ( .A0(n518), .A1(n396), .B0(n395), .B1(n499), .Y(n297) );
  CMPR42X1TS U723 ( .A(n248), .B(n365), .C(n245), .D(n270), .ICI(n314), .S(
        n243), .ICO(n241), .CO(n242) );
  OAI22X1TS U724 ( .A0(n591), .A1(n413), .B0(n412), .B1(n526), .Y(n314) );
  OAI22X1TS U725 ( .A0(n591), .A1(n593), .B0(n414), .B1(n526), .Y(n270) );
  OAI22X1TS U726 ( .A0(n460), .A1(n530), .B0(n461), .B1(n523), .Y(n365) );
  CMPR42X1TS U727 ( .A(n235), .B(n269), .C(n300), .D(n363), .ICI(n232), .S(
        n229), .ICO(n227), .CO(n228) );
  OAI22X1TS U728 ( .A0(n458), .A1(n530), .B0(n459), .B1(n523), .Y(n363) );
  OAI22X1TS U729 ( .A0(n599), .A1(n399), .B0(n398), .B1(n499), .Y(n300) );
  OAI22X1TS U730 ( .A0(n599), .A1(n592), .B0(n400), .B1(n499), .Y(n269) );
  CMPR42X1TS U731 ( .A(n331), .B(n182), .C(n306), .D(n293), .ICI(n280), .S(
        n175), .ICO(n169), .CO(n174) );
  AO21X1TS U732 ( .A0(n495), .A1(n502), .B0(n595), .Y(n331) );
  OAI22X1TS U733 ( .A0(n517), .A1(n381), .B0(n498), .B1(n380), .Y(n280) );
  OAI22X1TS U734 ( .A0(n403), .A1(n500), .B0(n591), .B1(n404), .Y(n306) );
  CMPR42X1TS U735 ( .A(n208), .B(n199), .C(n205), .D(n296), .ICI(n347), .S(
        n197), .ICO(n195), .CO(n196) );
  OAI22X1TS U736 ( .A0(n443), .A1(n522), .B0(n597), .B1(n529), .Y(n347) );
  OAI22X1TS U737 ( .A0(n518), .A1(n395), .B0(n394), .B1(n499), .Y(n296) );
  CMPR42X1TS U738 ( .A(n198), .B(n191), .C(n320), .D(n295), .ICI(n195), .S(
        n189), .ICO(n187), .CO(n188) );
  OAI22X1TS U739 ( .A0(n518), .A1(n394), .B0(n393), .B1(n499), .Y(n295) );
  CMPR42X1TS U740 ( .A(n183), .B(n190), .C(n187), .D(n294), .ICI(n281), .S(
        n181), .ICO(n179), .CO(n180) );
  OAI22X1TS U741 ( .A0(n517), .A1(n382), .B0(n498), .B1(n381), .Y(n281) );
  INVX2TS U742 ( .A(n182), .Y(n183) );
  OAI22X1TS U743 ( .A0(n518), .A1(n393), .B0(n392), .B1(n499), .Y(n294) );
  CMPR32X2TS U744 ( .A(n210), .B(n322), .C(n309), .CO(n208), .S(n209) );
  INVX2TS U745 ( .A(n200), .Y(n210) );
  OAI22X1TS U746 ( .A0(n520), .A1(n420), .B0(n419), .B1(n501), .Y(n322) );
  OAI22X1TS U747 ( .A0(n519), .A1(n408), .B0(n407), .B1(n500), .Y(n309) );
  CMPR32X2TS U748 ( .A(n210), .B(n321), .C(n308), .CO(n198), .S(n199) );
  OAI22X1TS U749 ( .A0(n418), .A1(n501), .B0(n520), .B1(n419), .Y(n321) );
  OAI22X1TS U750 ( .A0(n519), .A1(n407), .B0(n406), .B1(n500), .Y(n308) );
  CMPR32X2TS U751 ( .A(n337), .B(n324), .C(n233), .CO(n225), .S(n226) );
  OAI22X1TS U752 ( .A0(n433), .A1(n502), .B0(n434), .B1(n495), .Y(n337) );
  OAI22X1TS U753 ( .A0(n520), .A1(n422), .B0(n421), .B1(n501), .Y(n324) );
  AO21X1TS U754 ( .A0(n496), .A1(n503), .B0(n597), .Y(n346) );
  OAI22X1TS U755 ( .A0(n519), .A1(n406), .B0(n405), .B1(n500), .Y(n307) );
  CMPR32X2TS U756 ( .A(n323), .B(n336), .C(n310), .CO(n217), .S(n218) );
  OAI22X1TS U757 ( .A0(n520), .A1(n421), .B0(n420), .B1(n501), .Y(n323) );
  OAI22X1TS U758 ( .A0(n432), .A1(n502), .B0(n433), .B1(n495), .Y(n336) );
  OAI22X1TS U759 ( .A0(n519), .A1(n409), .B0(n408), .B1(n500), .Y(n310) );
  CMPR32X2TS U760 ( .A(n247), .B(n327), .C(n251), .CO(n244), .S(n245) );
  OAI22X1TS U761 ( .A0(n520), .A1(n425), .B0(n424), .B1(n501), .Y(n327) );
  CMPR32X2TS U762 ( .A(n170), .B(n279), .C(n305), .CO(n167), .S(n168) );
  OAI22X1TS U763 ( .A0(n402), .A1(n526), .B0(n403), .B1(n591), .Y(n305) );
  INVX2TS U764 ( .A(n169), .Y(n170) );
  OAI22X1TS U765 ( .A0(n517), .A1(n380), .B0(n498), .B1(n379), .Y(n279) );
  ADDHXLTS U766 ( .A(n338), .B(n325), .CO(n233), .S(n234) );
  OAI22X1TS U767 ( .A0(n434), .A1(n502), .B0(n495), .B1(n435), .Y(n338) );
  OAI22X1TS U768 ( .A0(n520), .A1(n423), .B0(n422), .B1(n501), .Y(n325) );
  OAI22X1TS U769 ( .A0(n521), .A1(n595), .B0(n442), .B1(n528), .Y(n272) );
  NAND2BX1TS U770 ( .AN(b[0]), .B(n596), .Y(n442) );
  CMPR42X1TS U771 ( .A(n278), .B(n304), .C(n163), .D(n167), .ICI(n164), .S(
        n161), .ICO(n159), .CO(n160) );
  OAI22X1TS U772 ( .A0(n401), .A1(n526), .B0(n402), .B1(n591), .Y(n304) );
  OAI22X1TS U773 ( .A0(n517), .A1(n379), .B0(n498), .B1(n378), .Y(n278) );
  XNOR2X1TS U774 ( .A(b[12]), .B(a[1]), .Y(n457) );
  XNOR2X1TS U775 ( .A(b[12]), .B(a[3]), .Y(n443) );
  XNOR2X1TS U776 ( .A(b[11]), .B(a[1]), .Y(n458) );
  XNOR2X1TS U777 ( .A(b[5]), .B(n516), .Y(n464) );
  XNOR2X1TS U778 ( .A(b[6]), .B(n516), .Y(n463) );
  XNOR2X1TS U779 ( .A(b[12]), .B(n596), .Y(n429) );
  XNOR2X1TS U780 ( .A(b[12]), .B(a[7]), .Y(n415) );
  XNOR2X1TS U781 ( .A(b[5]), .B(n515), .Y(n450) );
  XNOR2X1TS U782 ( .A(b[6]), .B(n515), .Y(n449) );
  XNOR2X1TS U783 ( .A(b[7]), .B(a[3]), .Y(n448) );
  XNOR2X1TS U784 ( .A(b[11]), .B(n515), .Y(n444) );
  XNOR2X1TS U785 ( .A(b[11]), .B(n596), .Y(n430) );
  XNOR2X1TS U786 ( .A(b[12]), .B(n511), .Y(n387) );
  XNOR2X1TS U787 ( .A(b[11]), .B(a[7]), .Y(n416) );
  XNOR2X1TS U788 ( .A(b[11]), .B(a[11]), .Y(n388) );
  XNOR2X1TS U789 ( .A(n513), .B(b[2]), .Y(n425) );
  XNOR2X1TS U790 ( .A(a[11]), .B(b[1]), .Y(n398) );
  XNOR2X1TS U791 ( .A(a[3]), .B(b[2]), .Y(n453) );
  XNOR2X1TS U792 ( .A(a[5]), .B(b[2]), .Y(n439) );
  XNOR2X1TS U793 ( .A(n596), .B(b[1]), .Y(n440) );
  XNOR2X1TS U794 ( .A(n513), .B(b[1]), .Y(n426) );
  XNOR2X1TS U795 ( .A(a[5]), .B(b[3]), .Y(n438) );
  XNOR2X1TS U796 ( .A(n596), .B(b[4]), .Y(n437) );
  XNOR2X1TS U797 ( .A(a[7]), .B(b[3]), .Y(n424) );
  XNOR2X1TS U798 ( .A(a[3]), .B(b[3]), .Y(n452) );
  XNOR2X1TS U799 ( .A(a[5]), .B(b[5]), .Y(n436) );
  XNOR2X1TS U800 ( .A(n515), .B(b[4]), .Y(n451) );
  XNOR2X1TS U801 ( .A(n596), .B(b[6]), .Y(n435) );
  OAI22X1TS U802 ( .A0(n522), .A1(n597), .B0(n456), .B1(n529), .Y(n273) );
  NAND2BX1TS U803 ( .AN(n601), .B(n515), .Y(n456) );
  CMPR42X1TS U804 ( .A(n290), .B(n158), .C(n303), .D(n162), .ICI(n159), .S(
        n156), .ICO(n154), .CO(n155) );
  OAI22X1TS U805 ( .A0(n401), .A1(n591), .B0(n593), .B1(n526), .Y(n303) );
  INVX2TS U806 ( .A(n157), .Y(n158) );
  OAI22X1TS U807 ( .A0(n388), .A1(n525), .B0(n599), .B1(n389), .Y(n290) );
  CMPR42X1TS U808 ( .A(n302), .B(n157), .C(n277), .D(n289), .ICI(n154), .S(
        n153), .ICO(n151), .CO(n152) );
  AO21X1TS U809 ( .A0(n591), .A1(n526), .B0(n593), .Y(n302) );
  OAI22X1TS U810 ( .A0(n517), .A1(n377), .B0(n498), .B1(n376), .Y(n277) );
  OAI22X1TS U811 ( .A0(n387), .A1(n525), .B0(n388), .B1(n599), .Y(n289) );
  XNOR2X1TS U812 ( .A(a[11]), .B(b[0]), .Y(n399) );
  XNOR2X1TS U813 ( .A(n513), .B(n601), .Y(n427) );
  OAI22X1TS U814 ( .A0(n463), .A1(n504), .B0(n464), .B1(n497), .Y(n368) );
  ADDHXLTS U815 ( .A(n371), .B(n359), .CO(n267), .S(n268) );
  OAI22X1TS U816 ( .A0(n466), .A1(n504), .B0(n497), .B1(n467), .Y(n371) );
  OAI22X1TS U817 ( .A0(n496), .A1(n455), .B0(n454), .B1(n503), .Y(n359) );
  XNOR2X1TS U818 ( .A(n515), .B(n601), .Y(n455) );
  CMPR32X2TS U819 ( .A(n370), .B(n345), .C(n358), .CO(n265), .S(n266) );
  OAI22X1TS U820 ( .A0(n465), .A1(n504), .B0(n466), .B1(n497), .Y(n370) );
  OAI22X1TS U821 ( .A0(n496), .A1(n454), .B0(n453), .B1(n503), .Y(n358) );
  NOR2BX1TS U822 ( .AN(n601), .B(n502), .Y(n345) );
  CMPR32X2TS U823 ( .A(n150), .B(n288), .C(n151), .CO(n147), .S(n148) );
  OAI22X1TS U824 ( .A0(n387), .A1(n599), .B0(n592), .B1(n525), .Y(n288) );
  INVX2TS U825 ( .A(n149), .Y(n150) );
  NAND2BX1TS U826 ( .AN(b[0]), .B(a[11]), .Y(n400) );
  CMPR42X1TS U827 ( .A(n356), .B(n368), .C(n263), .D(n330), .ICI(n343), .S(
        n260), .ICO(n258), .CO(n259) );
  OAI22X1TS U828 ( .A0(n521), .A1(n440), .B0(n439), .B1(n528), .Y(n343) );
  NOR2BX1TS U829 ( .AN(n601), .B(n527), .Y(n330) );
  OAI22X1TS U830 ( .A0(n496), .A1(n452), .B0(n451), .B1(n503), .Y(n356) );
  CMPR42X1TS U831 ( .A(n366), .B(n315), .C(n328), .D(n253), .ICI(n252), .S(
        n250), .ICO(n248), .CO(n249) );
  OAI22X1TS U832 ( .A0(n461), .A1(n504), .B0(n462), .B1(n497), .Y(n366) );
  NOR2BX1TS U833 ( .AN(n601), .B(n500), .Y(n315) );
  OAI22X1TS U834 ( .A0(n520), .A1(n426), .B0(n425), .B1(n501), .Y(n328) );
  CMPR42X1TS U835 ( .A(n367), .B(n258), .C(n257), .D(n329), .ICI(n271), .S(
        n255), .ICO(n253), .CO(n254) );
  OAI22X1TS U836 ( .A0(n602), .A1(n594), .B0(n428), .B1(n527), .Y(n271) );
  OAI22X1TS U837 ( .A0(n462), .A1(n504), .B0(n463), .B1(n497), .Y(n367) );
  OAI22X1TS U838 ( .A0(n602), .A1(n427), .B0(n426), .B1(n501), .Y(n329) );
  CMPR32X2TS U839 ( .A(n264), .B(n265), .C(n344), .CO(n261), .S(n262) );
  OAI22X1TS U840 ( .A0(n495), .A1(n441), .B0(n440), .B1(n502), .Y(n344) );
  XNOR2X1TS U841 ( .A(n596), .B(n601), .Y(n441) );
  CMPR32X2TS U842 ( .A(n316), .B(n169), .C(n291), .CO(n162), .S(n163) );
  AO21X1TS U843 ( .A0(n602), .A1(n527), .B0(n594), .Y(n316) );
  OAI22X1TS U844 ( .A0(n599), .A1(n390), .B0(n389), .B1(n525), .Y(n291) );
  CMPR32X2TS U845 ( .A(n354), .B(n341), .C(n256), .CO(n251), .S(n252) );
  OAI22X1TS U846 ( .A0(n449), .A1(n503), .B0(n450), .B1(n496), .Y(n354) );
  OAI22X1TS U847 ( .A0(n495), .A1(n438), .B0(n437), .B1(n502), .Y(n341) );
  ADDHXLTS U848 ( .A(n357), .B(n369), .CO(n263), .S(n264) );
  OAI22X1TS U849 ( .A0(n464), .A1(n504), .B0(n465), .B1(n497), .Y(n369) );
  OAI22X1TS U850 ( .A0(n496), .A1(n453), .B0(n452), .B1(n503), .Y(n357) );
  ADDHXLTS U851 ( .A(n355), .B(n342), .CO(n256), .S(n257) );
  OAI22X1TS U852 ( .A0(n450), .A1(n503), .B0(n496), .B1(n451), .Y(n355) );
  OAI22X1TS U853 ( .A0(n495), .A1(n439), .B0(n438), .B1(n502), .Y(n342) );
  OAI22X1TS U854 ( .A0(n497), .A1(n469), .B0(n468), .B1(n504), .Y(n373) );
  XNOR2X1TS U855 ( .A(n516), .B(n601), .Y(n469) );
  XNOR2X1TS U856 ( .A(b[4]), .B(n516), .Y(n465) );
  XNOR2X1TS U857 ( .A(b[3]), .B(n516), .Y(n466) );
  OAI22X1TS U858 ( .A0(n497), .A1(n510), .B0(n470), .B1(n504), .Y(n274) );
  NAND2BX1TS U859 ( .AN(n601), .B(a[1]), .Y(n470) );
  XNOR2X1TS U860 ( .A(n515), .B(b[1]), .Y(n454) );
  XNOR2X1TS U861 ( .A(n516), .B(b[1]), .Y(n468) );
  XNOR2X1TS U862 ( .A(n516), .B(b[2]), .Y(n467) );
  OAI22X1TS U863 ( .A0(n497), .A1(n468), .B0(n467), .B1(n504), .Y(n372) );
  NOR2BX1TS U864 ( .AN(n601), .B(n503), .Y(n360) );
  INVX2TS U865 ( .A(n126), .Y(n124) );
  CMPR32X2TS U866 ( .A(n149), .B(n276), .C(n287), .CO(n145), .S(n146) );
  OAI22X1TS U867 ( .A0(n374), .A1(n524), .B0(n603), .B1(n375), .Y(n276) );
  AO21X1TS U868 ( .A0(n599), .A1(n525), .B0(n592), .Y(n287) );
  NAND2BX1TS U869 ( .AN(b[0]), .B(n513), .Y(n428) );
  INVX2TS U870 ( .A(n516), .Y(n510) );
  INVX2TS U871 ( .A(b[12]), .Y(n374) );
  INVX2TS U872 ( .A(b[11]), .Y(n375) );
  INVX2TS U873 ( .A(b[4]), .Y(n382) );
  INVX2TS U874 ( .A(b[5]), .Y(n381) );
  INVX2TS U875 ( .A(b[6]), .Y(n380) );
  INVX2TS U876 ( .A(b[1]), .Y(n385) );
  INVX2TS U877 ( .A(b[2]), .Y(n384) );
  INVX2TS U878 ( .A(b[3]), .Y(n383) );
  NOR2BX1TS U879 ( .AN(b[0]), .B(n530), .Y(product[0]) );
  NAND2X1TS U880 ( .A(n486), .B(n526), .Y(n519) );
  NAND2X1TS U881 ( .A(n487), .B(n527), .Y(n520) );
  NAND2X1TS U882 ( .A(n488), .B(n528), .Y(n521) );
  NAND2X1TS U883 ( .A(n485), .B(n525), .Y(n518) );
  XNOR2X1TS U884 ( .A(a[12]), .B(a[11]), .Y(n524) );
  XNOR2X1TS U885 ( .A(a[8]), .B(a[7]), .Y(n526) );
  NAND2X1TS U886 ( .A(n489), .B(n529), .Y(n522) );
  XNOR2X1TS U887 ( .A(a[2]), .B(a[1]), .Y(n529) );
  XNOR2X1TS U888 ( .A(a[4]), .B(a[3]), .Y(n528) );
  XNOR2X1TS U889 ( .A(a[6]), .B(a[5]), .Y(n527) );
  NAND2X1TS U890 ( .A(n490), .B(n530), .Y(n523) );
  INVX2TS U891 ( .A(a[0]), .Y(n530) );
initial $sdf_annotate("FPU_Multiplication_Function_syn.sdf"); 
 endmodule


module multiplier_W13 ( clk, Data_A_i, Data_B_i, Data_S_o );
  input [12:0] Data_A_i;
  input [12:0] Data_B_i;
  output [25:0] Data_S_o;
  input clk;
  wire   N0, N1, N2, N3, N4, N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, N15,
         N16, N17, N18, N19, N20, N21, N22, N23, N24, N25;

  multiplier_W13_DW_mult_uns_2 mult_39 ( .a(Data_A_i), .b(Data_B_i), .product(
        {N25, N24, N23, N22, N21, N20, N19, N18, N17, N16, N15, N14, N13, N12, 
        N11, N10, N9, N8, N7, N6, N5, N4, N3, N2, N1, N0}) );
  DFFQX1TS pdt_int_reg_23_ ( .D(N23), .CK(clk), .Q(Data_S_o[23]) );
  DFFQX1TS pdt_int_reg_25_ ( .D(N25), .CK(clk), .Q(Data_S_o[25]) );
  DFFQX1TS pdt_int_reg_24_ ( .D(N24), .CK(clk), .Q(Data_S_o[24]) );
  DFFQX1TS pdt_int_reg_21_ ( .D(N21), .CK(clk), .Q(Data_S_o[21]) );
  DFFQX1TS pdt_int_reg_19_ ( .D(N19), .CK(clk), .Q(Data_S_o[19]) );
  DFFQX1TS pdt_int_reg_22_ ( .D(N22), .CK(clk), .Q(Data_S_o[22]) );
  DFFQX1TS pdt_int_reg_20_ ( .D(N20), .CK(clk), .Q(Data_S_o[20]) );
  DFFQX1TS pdt_int_reg_18_ ( .D(N18), .CK(clk), .Q(Data_S_o[18]) );
  DFFQX1TS pdt_int_reg_17_ ( .D(N17), .CK(clk), .Q(Data_S_o[17]) );
  DFFQX1TS pdt_int_reg_15_ ( .D(N15), .CK(clk), .Q(Data_S_o[15]) );
  DFFQX1TS pdt_int_reg_16_ ( .D(N16), .CK(clk), .Q(Data_S_o[16]) );
  DFFQX1TS pdt_int_reg_14_ ( .D(N14), .CK(clk), .Q(Data_S_o[14]) );
  DFFQX1TS pdt_int_reg_13_ ( .D(N13), .CK(clk), .Q(Data_S_o[13]) );
  DFFQX1TS pdt_int_reg_11_ ( .D(N11), .CK(clk), .Q(Data_S_o[11]) );
  DFFQX1TS pdt_int_reg_9_ ( .D(N9), .CK(clk), .Q(Data_S_o[9]) );
  DFFQX1TS pdt_int_reg_12_ ( .D(N12), .CK(clk), .Q(Data_S_o[12]) );
  DFFQX1TS pdt_int_reg_10_ ( .D(N10), .CK(clk), .Q(Data_S_o[10]) );
  DFFQX1TS pdt_int_reg_7_ ( .D(N7), .CK(clk), .Q(Data_S_o[7]) );
  DFFQX1TS pdt_int_reg_5_ ( .D(N5), .CK(clk), .Q(Data_S_o[5]) );
  DFFQX1TS pdt_int_reg_8_ ( .D(N8), .CK(clk), .Q(Data_S_o[8]) );
  DFFQX1TS pdt_int_reg_6_ ( .D(N6), .CK(clk), .Q(Data_S_o[6]) );
  DFFQX1TS pdt_int_reg_3_ ( .D(N3), .CK(clk), .Q(Data_S_o[3]) );
  DFFQX1TS pdt_int_reg_4_ ( .D(N4), .CK(clk), .Q(Data_S_o[4]) );
  DFFQXLTS pdt_int_reg_2_ ( .D(N2), .CK(clk), .Q(Data_S_o[2]) );
  DFFQXLTS pdt_int_reg_0_ ( .D(N0), .CK(clk), .Q(Data_S_o[0]) );
  DFFHQX1TS pdt_int_reg_1_ ( .D(N1), .CK(clk), .Q(Data_S_o[1]) );
initial $sdf_annotate("FPU_Multiplication_Function_syn.sdf"); 
 endmodule


module substractor_W26_1_DW01_sub_2 ( A, B, CI, DIFF, CO );
  input [25:0] A;
  input [25:0] B;
  output [25:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51;

  AFHCINX2TS U1 ( .CIN(n1), .B(A[25]), .A(n26), .S(DIFF[25]) );
  AFHCONX2TS U2 ( .A(n27), .B(A[24]), .CI(n2), .CON(n1), .S(DIFF[24]) );
  AFHCINX2TS U3 ( .CIN(n3), .B(n28), .A(A[23]), .S(DIFF[23]), .CO(n2) );
  AFHCONX2TS U4 ( .A(A[22]), .B(n29), .CI(n4), .CON(n3), .S(DIFF[22]) );
  AFHCINX2TS U5 ( .CIN(n5), .B(n30), .A(A[21]), .S(DIFF[21]), .CO(n4) );
  AFHCONX2TS U6 ( .A(A[20]), .B(n31), .CI(n6), .CON(n5), .S(DIFF[20]) );
  AFHCINX2TS U7 ( .CIN(n7), .B(n32), .A(A[19]), .S(DIFF[19]), .CO(n6) );
  AFHCONX2TS U8 ( .A(A[18]), .B(n33), .CI(n8), .CON(n7), .S(DIFF[18]) );
  AFHCINX2TS U9 ( .CIN(n9), .B(n34), .A(A[17]), .S(DIFF[17]), .CO(n8) );
  AFHCONX2TS U10 ( .A(A[16]), .B(n35), .CI(n10), .CON(n9), .S(DIFF[16]) );
  AFHCINX2TS U11 ( .CIN(n11), .B(n36), .A(A[15]), .S(DIFF[15]), .CO(n10) );
  AFHCONX2TS U12 ( .A(A[14]), .B(n37), .CI(n12), .CON(n11), .S(DIFF[14]) );
  AFHCINX2TS U13 ( .CIN(n13), .B(n38), .A(A[13]), .S(DIFF[13]), .CO(n12) );
  AFHCONX2TS U14 ( .A(A[12]), .B(n39), .CI(n14), .CON(n13), .S(DIFF[12]) );
  AFHCINX2TS U15 ( .CIN(n15), .B(n40), .A(A[11]), .S(DIFF[11]), .CO(n14) );
  AFHCONX2TS U16 ( .A(A[10]), .B(n41), .CI(n16), .CON(n15), .S(DIFF[10]) );
  AFHCINX2TS U17 ( .CIN(n17), .B(n42), .A(A[9]), .S(DIFF[9]), .CO(n16) );
  AFHCONX2TS U18 ( .A(A[8]), .B(n43), .CI(n18), .CON(n17), .S(DIFF[8]) );
  AFHCINX2TS U19 ( .CIN(n19), .B(n44), .A(A[7]), .S(DIFF[7]), .CO(n18) );
  AFHCONX2TS U20 ( .A(A[6]), .B(n45), .CI(n20), .CON(n19), .S(DIFF[6]) );
  AFHCINX2TS U21 ( .CIN(n21), .B(n46), .A(A[5]), .S(DIFF[5]), .CO(n20) );
  AFHCONX2TS U22 ( .A(A[4]), .B(n47), .CI(n22), .CON(n21), .S(DIFF[4]) );
  AFHCINX2TS U23 ( .CIN(n23), .B(n48), .A(A[3]), .S(DIFF[3]), .CO(n22) );
  AFHCONX2TS U24 ( .A(A[2]), .B(n49), .CI(n24), .CON(n23), .S(DIFF[2]) );
  AFHCINX2TS U25 ( .CIN(n25), .B(n50), .A(A[1]), .S(DIFF[1]), .CO(n24) );
  NOR2X2TS U57 ( .A(A[0]), .B(n51), .Y(n25) );
  INVX2TS U58 ( .A(B[0]), .Y(n51) );
  CLKINVX2TS U59 ( .A(B[2]), .Y(n49) );
  XNOR2X1TS U60 ( .A(n51), .B(A[0]), .Y(DIFF[0]) );
  INVX2TS U61 ( .A(B[25]), .Y(n26) );
  INVX2TS U62 ( .A(B[3]), .Y(n48) );
  INVX2TS U63 ( .A(B[5]), .Y(n46) );
  INVX2TS U64 ( .A(B[7]), .Y(n44) );
  INVX2TS U65 ( .A(B[9]), .Y(n42) );
  INVX2TS U66 ( .A(B[11]), .Y(n40) );
  INVX2TS U67 ( .A(B[13]), .Y(n38) );
  INVX2TS U68 ( .A(B[15]), .Y(n36) );
  INVX2TS U69 ( .A(B[17]), .Y(n34) );
  INVX2TS U70 ( .A(B[19]), .Y(n32) );
  INVX2TS U71 ( .A(B[21]), .Y(n30) );
  INVX2TS U72 ( .A(B[1]), .Y(n50) );
  INVX2TS U73 ( .A(B[4]), .Y(n47) );
  INVX2TS U74 ( .A(B[6]), .Y(n45) );
  INVX2TS U75 ( .A(B[8]), .Y(n43) );
  INVX2TS U76 ( .A(B[10]), .Y(n41) );
  INVX2TS U77 ( .A(B[12]), .Y(n39) );
  INVX2TS U78 ( .A(B[14]), .Y(n37) );
  INVX2TS U79 ( .A(B[16]), .Y(n35) );
  INVX2TS U80 ( .A(B[18]), .Y(n33) );
  INVX2TS U81 ( .A(B[20]), .Y(n31) );
  INVX2TS U82 ( .A(B[22]), .Y(n29) );
  INVX2TS U83 ( .A(B[24]), .Y(n27) );
  INVX2TS U84 ( .A(B[23]), .Y(n28) );
initial $sdf_annotate("FPU_Multiplication_Function_syn.sdf"); 
 endmodule


module substractor_W26_1 ( Data_A_i, Data_B_i, Data_S_o );
  input [25:0] Data_A_i;
  input [25:0] Data_B_i;
  output [25:0] Data_S_o;


  substractor_W26_1_DW01_sub_2 sub_31 ( .A(Data_A_i), .B(Data_B_i), .CI(1'b0), 
        .DIFF(Data_S_o) );
initial $sdf_annotate("FPU_Multiplication_Function_syn.sdf"); 
 endmodule


module substractor_W26_0_DW01_sub_2 ( A, B, CI, DIFF, CO );
  input [25:0] A;
  input [25:0] B;
  output [25:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51;

  AFHCINX2TS U1 ( .CIN(n1), .B(A[25]), .A(n26), .S(DIFF[25]) );
  AFHCONX2TS U2 ( .A(n27), .B(A[24]), .CI(n2), .CON(n1), .S(DIFF[24]) );
  AFHCINX2TS U3 ( .CIN(n3), .B(A[23]), .A(n28), .S(DIFF[23]), .CO(n2) );
  AFHCONX2TS U4 ( .A(n29), .B(A[22]), .CI(n4), .CON(n3), .S(DIFF[22]) );
  AFHCINX2TS U5 ( .CIN(n5), .B(A[21]), .A(n30), .S(DIFF[21]), .CO(n4) );
  AFHCONX2TS U6 ( .A(n31), .B(A[20]), .CI(n6), .CON(n5), .S(DIFF[20]) );
  AFHCINX2TS U7 ( .CIN(n7), .B(A[19]), .A(n32), .S(DIFF[19]), .CO(n6) );
  AFHCONX2TS U8 ( .A(n33), .B(A[18]), .CI(n8), .CON(n7), .S(DIFF[18]) );
  AFHCINX2TS U9 ( .CIN(n9), .B(A[17]), .A(n34), .S(DIFF[17]), .CO(n8) );
  AFHCONX2TS U10 ( .A(n35), .B(A[16]), .CI(n10), .CON(n9), .S(DIFF[16]) );
  AFHCINX2TS U11 ( .CIN(n11), .B(A[15]), .A(n36), .S(DIFF[15]), .CO(n10) );
  AFHCONX2TS U12 ( .A(n37), .B(A[14]), .CI(n12), .CON(n11), .S(DIFF[14]) );
  AFHCINX2TS U13 ( .CIN(n13), .B(A[13]), .A(n38), .S(DIFF[13]), .CO(n12) );
  AFHCONX2TS U14 ( .A(n39), .B(A[12]), .CI(n14), .CON(n13), .S(DIFF[12]) );
  AFHCINX2TS U15 ( .CIN(n15), .B(A[11]), .A(n40), .S(DIFF[11]), .CO(n14) );
  AFHCONX2TS U16 ( .A(n41), .B(A[10]), .CI(n16), .CON(n15), .S(DIFF[10]) );
  AFHCINX2TS U17 ( .CIN(n17), .B(A[9]), .A(n42), .S(DIFF[9]), .CO(n16) );
  AFHCONX2TS U18 ( .A(n43), .B(A[8]), .CI(n18), .CON(n17), .S(DIFF[8]) );
  AFHCINX2TS U19 ( .CIN(n19), .B(A[7]), .A(n44), .S(DIFF[7]), .CO(n18) );
  AFHCONX2TS U20 ( .A(n45), .B(A[6]), .CI(n20), .CON(n19), .S(DIFF[6]) );
  AFHCINX2TS U21 ( .CIN(n21), .B(A[5]), .A(n46), .S(DIFF[5]), .CO(n20) );
  AFHCONX2TS U22 ( .A(n47), .B(A[4]), .CI(n22), .CON(n21), .S(DIFF[4]) );
  AFHCINX2TS U23 ( .CIN(n23), .B(A[3]), .A(n48), .S(DIFF[3]), .CO(n22) );
  AFHCONX2TS U24 ( .A(n49), .B(A[2]), .CI(n24), .CON(n23), .S(DIFF[2]) );
  AFHCINX2TS U25 ( .CIN(n25), .B(A[1]), .A(n50), .S(DIFF[1]), .CO(n24) );
  XNOR2XLTS U57 ( .A(A[0]), .B(n51), .Y(DIFF[0]) );
  INVX2TS U58 ( .A(B[25]), .Y(n26) );
  INVX2TS U59 ( .A(B[24]), .Y(n27) );
  INVX2TS U60 ( .A(B[3]), .Y(n48) );
  INVX2TS U61 ( .A(B[5]), .Y(n46) );
  INVX2TS U62 ( .A(B[7]), .Y(n44) );
  INVX2TS U63 ( .A(B[9]), .Y(n42) );
  INVX2TS U64 ( .A(B[11]), .Y(n40) );
  INVX2TS U65 ( .A(B[13]), .Y(n38) );
  INVX2TS U66 ( .A(B[15]), .Y(n36) );
  INVX2TS U67 ( .A(B[17]), .Y(n34) );
  INVX2TS U68 ( .A(B[19]), .Y(n32) );
  INVX2TS U69 ( .A(B[21]), .Y(n30) );
  INVX2TS U70 ( .A(B[23]), .Y(n28) );
  INVX2TS U71 ( .A(B[1]), .Y(n50) );
  NOR2X1TS U72 ( .A(A[0]), .B(n51), .Y(n25) );
  INVX2TS U73 ( .A(B[2]), .Y(n49) );
  INVX2TS U74 ( .A(B[4]), .Y(n47) );
  INVX2TS U75 ( .A(B[6]), .Y(n45) );
  INVX2TS U76 ( .A(B[8]), .Y(n43) );
  INVX2TS U77 ( .A(B[10]), .Y(n41) );
  INVX2TS U78 ( .A(B[12]), .Y(n39) );
  INVX2TS U79 ( .A(B[14]), .Y(n37) );
  INVX2TS U80 ( .A(B[16]), .Y(n35) );
  INVX2TS U81 ( .A(B[18]), .Y(n33) );
  INVX2TS U82 ( .A(B[20]), .Y(n31) );
  INVX2TS U83 ( .A(B[22]), .Y(n29) );
  INVX2TS U84 ( .A(B[0]), .Y(n51) );
initial $sdf_annotate("FPU_Multiplication_Function_syn.sdf"); 
 endmodule


module substractor_W26_0 ( Data_A_i, Data_B_i, Data_S_o );
  input [25:0] Data_A_i;
  input [25:0] Data_B_i;
  output [25:0] Data_S_o;


  substractor_W26_0_DW01_sub_2 sub_31 ( .A(Data_A_i), .B(Data_B_i), .CI(1'b0), 
        .DIFF(Data_S_o) );
initial $sdf_annotate("FPU_Multiplication_Function_syn.sdf"); 
 endmodule


module adder_W48_DW01_add_2 ( A, B, CI, SUM, CO );
  input [48:0] A;
  input [48:0] B;
  output [48:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n45,
         n46, n47, n48, n49, n50, n51, n52, n53, n55, n57, n58, n59, n60, n61,
         n62, n63, n64, n65, n66, n67, n69, n71, n72, n73, n74, n75, n76, n77,
         n78, n79, n80, n81, n83, n85, n86, n88, n90, n91, n92, n93, n94, n95,
         n96, n97, n98, n100, n102, n103, n105, n107, n108, n109, n111, n113,
         n114, n115, n116, n117, n119, n121, n122, n123, n124, n125, n127,
         n129, n130, n131, n132, n133, n135, n137, n138, n139, n140, n141,
         n143, n145, n146, n147, n148, n149, n151, n153, n154, n155, n156,
         n157, n159, n161, n162, n163, n164, n165, n167, n169, n170, n171,
         n172, n173, n175, n177, n178, n179, n180, n181, n183, n185, n186,
         n187, n188, n189, n191, n193, n194, n195, n196, n197, n199, n201,
         n202, n203, n204, n206, n208, n209, n210, n211, n212, n213, n214,
         n215, n216, n217, n218, n220, n222, n223, n225, n227, n228, n229,
         n230, n231, n232, n233, n235, n237, n238, n240, n242, n243, n244,
         n245, n247, n249, n250, n253, n254, n255, n256, n257, n258, n259,
         n260, n262, n264, n265, n267, n269, n270, n271, n273, n275, n276,
         n278, n280, n282, n289, n291, n293, n295, n297, n299, n301, n303,
         n305, n307, n309, n312, n476, n477, n478, n479, n480, n481, n482,
         n483, n484, n485, n486, n487, n488, n489, n490, n491, n492, n493,
         n494, n495, n496, n497, n498, n499, n500, n501, n502, n503, n505;

  AFHCONX2TS U2 ( .A(B[47]), .B(A[47]), .CI(n46), .CON(n45), .S(SUM[47]) );
  AFHCINX2TS U3 ( .CIN(n47), .B(A[46]), .A(B[46]), .S(SUM[46]), .CO(n46) );
  AFHCONX2TS U4 ( .A(B[45]), .B(A[45]), .CI(n48), .CON(n47), .S(SUM[45]) );
  XOR2X1TS U48 ( .A(n86), .B(n5), .Y(SUM[39]) );
  XOR2X1TS U58 ( .A(n91), .B(n6), .Y(SUM[38]) );
  XOR2X1TS U66 ( .A(n7), .B(n95), .Y(SUM[37]) );
  XOR2X1TS U73 ( .A(n8), .B(n103), .Y(SUM[36]) );
  XOR2X1TS U101 ( .A(n11), .B(n117), .Y(SUM[33]) );
  XOR2X1TS U115 ( .A(n13), .B(n125), .Y(SUM[31]) );
  XOR2X1TS U129 ( .A(n15), .B(n133), .Y(SUM[29]) );
  XOR2X1TS U143 ( .A(n17), .B(n141), .Y(SUM[27]) );
  XOR2X1TS U157 ( .A(n19), .B(n149), .Y(SUM[25]) );
  XOR2X1TS U171 ( .A(n21), .B(n157), .Y(SUM[23]) );
  XOR2X1TS U185 ( .A(n23), .B(n165), .Y(SUM[21]) );
  XOR2X1TS U199 ( .A(n25), .B(n173), .Y(SUM[19]) );
  XOR2X1TS U213 ( .A(n27), .B(n181), .Y(SUM[17]) );
  XOR2X1TS U227 ( .A(n29), .B(n189), .Y(SUM[15]) );
  XOR2X1TS U241 ( .A(n31), .B(n197), .Y(SUM[13]) );
  XOR2X1TS U255 ( .A(n209), .B(n33), .Y(SUM[11]) );
  XOR2X1TS U265 ( .A(n214), .B(n34), .Y(SUM[10]) );
  XOR2X1TS U273 ( .A(n223), .B(n35), .Y(SUM[9]) );
  XOR2X1TS U293 ( .A(n238), .B(n37), .Y(SUM[7]) );
  XOR2X1TS U324 ( .A(n257), .B(n40), .Y(SUM[4]) );
  XOR2X1TS U334 ( .A(n265), .B(n41), .Y(SUM[3]) );
  OR2X2TS U371 ( .A(B[36]), .B(A[36]), .Y(n476) );
  NOR2X4TS U372 ( .A(n505), .B(n51), .Y(n49) );
  INVX1TS U373 ( .A(n102), .Y(n100) );
  NAND2XLTS U374 ( .A(n476), .B(n102), .Y(n8) );
  AND2X4TS U375 ( .A(n50), .B(n96), .Y(n505) );
  OR2X2TS U376 ( .A(A[39]), .B(B[39]), .Y(n477) );
  OR2X2TS U377 ( .A(A[9]), .B(B[9]), .Y(n478) );
  OR2X2TS U378 ( .A(A[3]), .B(B[3]), .Y(n479) );
  OR2X2TS U379 ( .A(A[7]), .B(B[7]), .Y(n480) );
  OR2X2TS U380 ( .A(B[35]), .B(A[35]), .Y(n481) );
  OR2X2TS U381 ( .A(B[14]), .B(A[14]), .Y(n482) );
  OR2X2TS U382 ( .A(B[16]), .B(A[16]), .Y(n483) );
  OR2X2TS U383 ( .A(B[34]), .B(A[34]), .Y(n484) );
  OR2X2TS U384 ( .A(B[28]), .B(A[28]), .Y(n485) );
  OR2X2TS U385 ( .A(B[30]), .B(A[30]), .Y(n486) );
  OR2X2TS U386 ( .A(B[32]), .B(A[32]), .Y(n487) );
  OR2X2TS U387 ( .A(B[18]), .B(A[18]), .Y(n488) );
  OR2X2TS U388 ( .A(B[20]), .B(A[20]), .Y(n489) );
  OR2X2TS U389 ( .A(B[22]), .B(A[22]), .Y(n490) );
  OR2X2TS U390 ( .A(B[24]), .B(A[24]), .Y(n491) );
  OR2X2TS U391 ( .A(B[26]), .B(A[26]), .Y(n492) );
  OR2X2TS U392 ( .A(A[41]), .B(B[41]), .Y(n493) );
  OR2X2TS U393 ( .A(A[38]), .B(B[38]), .Y(n494) );
  OR2X2TS U394 ( .A(A[43]), .B(B[43]), .Y(n495) );
  OR2X2TS U395 ( .A(B[12]), .B(A[12]), .Y(n496) );
  OR2X2TS U396 ( .A(A[5]), .B(B[5]), .Y(n497) );
  OR2X2TS U397 ( .A(A[11]), .B(B[11]), .Y(n498) );
  OR2X2TS U398 ( .A(A[2]), .B(B[2]), .Y(n499) );
  OR2X2TS U399 ( .A(A[6]), .B(B[6]), .Y(n500) );
  OR2X2TS U400 ( .A(A[8]), .B(B[8]), .Y(n501) );
  OR2X2TS U401 ( .A(A[1]), .B(B[1]), .Y(n502) );
  OR2X2TS U402 ( .A(A[0]), .B(B[0]), .Y(n503) );
  AND2X2TS U403 ( .A(n503), .B(n278), .Y(SUM[0]) );
  AOI21X2TS U404 ( .A0(n476), .A1(n105), .B0(n100), .Y(n98) );
  OAI21X2TS U405 ( .A0(n97), .A1(n109), .B0(n98), .Y(n96) );
  OAI21X1TS U406 ( .A0(n94), .A1(n52), .B0(n53), .Y(n51) );
  AFHCINX2TS U407 ( .CIN(n49), .B(A[44]), .A(B[44]), .S(SUM[44]), .CO(n48) );
  NAND2BX1TS U408 ( .AN(n93), .B(n94), .Y(n7) );
  NAND2XLTS U409 ( .A(B[36]), .B(A[36]), .Y(n102) );
  INVX1TS U410 ( .A(n92), .Y(n91) );
  NAND2X1TS U411 ( .A(n476), .B(n481), .Y(n97) );
  NAND2X1TS U412 ( .A(B[37]), .B(A[37]), .Y(n94) );
  XNOR2XLTS U413 ( .A(n12), .B(n122), .Y(SUM[32]) );
  XNOR2XLTS U414 ( .A(n10), .B(n114), .Y(SUM[34]) );
  XNOR2XLTS U415 ( .A(n16), .B(n138), .Y(SUM[28]) );
  XNOR2XLTS U416 ( .A(n14), .B(n130), .Y(SUM[30]) );
  CLKINVX2TS U417 ( .A(n147), .Y(n297) );
  XNOR2XLTS U418 ( .A(n18), .B(n146), .Y(SUM[26]) );
  INVXLTS U419 ( .A(n96), .Y(n95) );
  OAI21XLTS U420 ( .A0(n95), .A1(n93), .B0(n94), .Y(n92) );
  NOR2XLTS U421 ( .A(B[25]), .B(A[25]), .Y(n147) );
  AOI21XLTS U422 ( .A0(n481), .A1(n108), .B0(n105), .Y(n103) );
  NAND2XLTS U423 ( .A(B[26]), .B(A[26]), .Y(n145) );
  NAND2XLTS U424 ( .A(B[25]), .B(A[25]), .Y(n148) );
  NAND2XLTS U425 ( .A(n481), .B(n107), .Y(n9) );
  NOR2X1TS U426 ( .A(A[40]), .B(B[40]), .Y(n77) );
  NOR2X1TS U427 ( .A(A[42]), .B(B[42]), .Y(n63) );
  NOR2X1TS U428 ( .A(A[10]), .B(B[10]), .Y(n212) );
  INVX2TS U429 ( .A(n229), .Y(n228) );
  INVX2TS U430 ( .A(n217), .Y(n215) );
  OAI21X1TS U431 ( .A0(n91), .A1(n80), .B0(n81), .Y(n79) );
  OAI21X1TS U432 ( .A0(n91), .A1(n73), .B0(n74), .Y(n72) );
  INVX2TS U433 ( .A(n76), .Y(n74) );
  INVX2TS U434 ( .A(n75), .Y(n73) );
  OAI21X1TS U435 ( .A0(n91), .A1(n66), .B0(n67), .Y(n65) );
  OAI21X1TS U436 ( .A0(n91), .A1(n59), .B0(n60), .Y(n58) );
  INVX2TS U437 ( .A(n62), .Y(n60) );
  INVX2TS U438 ( .A(n61), .Y(n59) );
  AOI21X1TS U439 ( .A0(n92), .A1(n494), .B0(n88), .Y(n86) );
  INVX2TS U440 ( .A(n109), .Y(n108) );
  NAND2X1TS U441 ( .A(n494), .B(n477), .Y(n80) );
  NAND2X1TS U442 ( .A(n75), .B(n493), .Y(n66) );
  NAND2X1TS U443 ( .A(n61), .B(n495), .Y(n52) );
  AOI21X1TS U444 ( .A0(n258), .A1(n230), .B0(n231), .Y(n229) );
  NOR2X1TS U445 ( .A(n244), .B(n232), .Y(n230) );
  OAI21X1TS U446 ( .A0(n245), .A1(n232), .B0(n233), .Y(n231) );
  NAND2X1TS U447 ( .A(n500), .B(n480), .Y(n232) );
  OAI21X1TS U448 ( .A0(n257), .A1(n244), .B0(n245), .Y(n243) );
  NAND2X1TS U449 ( .A(n501), .B(n478), .Y(n217) );
  NAND2X1TS U450 ( .A(n253), .B(n497), .Y(n244) );
  INVX2TS U451 ( .A(n258), .Y(n257) );
  INVX2TS U452 ( .A(n271), .Y(n270) );
  INVX2TS U453 ( .A(n218), .Y(n216) );
  AOI21X1TS U454 ( .A0(n114), .A1(n484), .B0(n111), .Y(n109) );
  INVX2TS U455 ( .A(n113), .Y(n111) );
  OAI21X1TS U456 ( .A0(n131), .A1(n133), .B0(n132), .Y(n130) );
  OAI21X1TS U457 ( .A0(n123), .A1(n125), .B0(n124), .Y(n122) );
  OAI21X1TS U458 ( .A0(n115), .A1(n117), .B0(n116), .Y(n114) );
  AOI21X1TS U459 ( .A0(n138), .A1(n485), .B0(n135), .Y(n133) );
  INVX2TS U460 ( .A(n137), .Y(n135) );
  AOI21X1TS U461 ( .A0(n130), .A1(n486), .B0(n127), .Y(n125) );
  INVX2TS U462 ( .A(n129), .Y(n127) );
  AOI21X1TS U463 ( .A0(n122), .A1(n487), .B0(n119), .Y(n117) );
  INVX2TS U464 ( .A(n121), .Y(n119) );
  INVX2TS U465 ( .A(n107), .Y(n105) );
  OAI21X1TS U466 ( .A0(n195), .A1(n197), .B0(n196), .Y(n194) );
  OAI21X1TS U467 ( .A0(n187), .A1(n189), .B0(n188), .Y(n186) );
  OAI21X1TS U468 ( .A0(n179), .A1(n181), .B0(n180), .Y(n178) );
  OAI21X1TS U469 ( .A0(n171), .A1(n173), .B0(n172), .Y(n170) );
  OAI21X1TS U470 ( .A0(n163), .A1(n165), .B0(n164), .Y(n162) );
  OAI21X1TS U471 ( .A0(n155), .A1(n157), .B0(n156), .Y(n154) );
  OAI21X1TS U472 ( .A0(n147), .A1(n149), .B0(n148), .Y(n146) );
  OAI21X1TS U473 ( .A0(n139), .A1(n141), .B0(n140), .Y(n138) );
  AOI21X1TS U474 ( .A0(n482), .A1(n194), .B0(n191), .Y(n189) );
  INVX2TS U475 ( .A(n193), .Y(n191) );
  AOI21X1TS U476 ( .A0(n178), .A1(n488), .B0(n175), .Y(n173) );
  INVX2TS U477 ( .A(n177), .Y(n175) );
  AOI21X1TS U478 ( .A0(n170), .A1(n489), .B0(n167), .Y(n165) );
  INVX2TS U479 ( .A(n169), .Y(n167) );
  AOI21X1TS U480 ( .A0(n162), .A1(n490), .B0(n159), .Y(n157) );
  INVX2TS U481 ( .A(n161), .Y(n159) );
  AOI21X1TS U482 ( .A0(n154), .A1(n491), .B0(n151), .Y(n149) );
  INVX2TS U483 ( .A(n153), .Y(n151) );
  AOI21X1TS U484 ( .A0(n146), .A1(n492), .B0(n143), .Y(n141) );
  INVX2TS U485 ( .A(n145), .Y(n143) );
  AOI21X1TS U486 ( .A0(n483), .A1(n186), .B0(n183), .Y(n181) );
  INVX2TS U487 ( .A(n185), .Y(n183) );
  AOI21X1TS U488 ( .A0(n202), .A1(n496), .B0(n199), .Y(n197) );
  INVX2TS U489 ( .A(n201), .Y(n199) );
  NOR2X1TS U490 ( .A(n80), .B(n77), .Y(n75) );
  NOR2X1TS U491 ( .A(n66), .B(n63), .Y(n61) );
  INVX2TS U492 ( .A(n212), .Y(n312) );
  INVX2TS U493 ( .A(n77), .Y(n282) );
  INVX2TS U494 ( .A(n63), .Y(n280) );
  AOI21X1TS U495 ( .A0(n502), .A1(n276), .B0(n273), .Y(n271) );
  INVX2TS U496 ( .A(n275), .Y(n273) );
  AOI21X1TS U497 ( .A0(n478), .A1(n225), .B0(n220), .Y(n218) );
  INVX2TS U498 ( .A(n222), .Y(n220) );
  OAI21X1TS U499 ( .A0(n271), .A1(n259), .B0(n260), .Y(n258) );
  NAND2X1TS U500 ( .A(n499), .B(n479), .Y(n259) );
  AOI21X1TS U501 ( .A0(n479), .A1(n267), .B0(n262), .Y(n260) );
  OAI21X1TS U502 ( .A0(n81), .A1(n77), .B0(n78), .Y(n76) );
  OAI21X1TS U503 ( .A0(n67), .A1(n63), .B0(n64), .Y(n62) );
  AOI21X1TS U504 ( .A0(n497), .A1(n254), .B0(n247), .Y(n245) );
  INVX2TS U505 ( .A(n249), .Y(n247) );
  AOI21X1TS U506 ( .A0(n477), .A1(n88), .B0(n83), .Y(n81) );
  INVX2TS U507 ( .A(n85), .Y(n83) );
  AOI21X1TS U508 ( .A0(n76), .A1(n493), .B0(n69), .Y(n67) );
  INVX2TS U509 ( .A(n71), .Y(n69) );
  OAI21X1TS U510 ( .A0(n218), .A1(n212), .B0(n213), .Y(n211) );
  OAI21X1TS U511 ( .A0(n229), .A1(n203), .B0(n204), .Y(n202) );
  NAND2X1TS U512 ( .A(n210), .B(n498), .Y(n203) );
  AOI21X1TS U513 ( .A0(n211), .A1(n498), .B0(n206), .Y(n204) );
  AOI21X1TS U514 ( .A0(n480), .A1(n240), .B0(n235), .Y(n233) );
  INVX2TS U515 ( .A(n237), .Y(n235) );
  AOI21X1TS U516 ( .A0(n62), .A1(n495), .B0(n55), .Y(n53) );
  INVX2TS U517 ( .A(n57), .Y(n55) );
  NOR2X1TS U518 ( .A(n217), .B(n212), .Y(n210) );
  INVX2TS U519 ( .A(n45), .Y(SUM[48]) );
  INVX2TS U520 ( .A(n256), .Y(n254) );
  INVX2TS U521 ( .A(n255), .Y(n253) );
  INVX2TS U522 ( .A(n278), .Y(n276) );
  INVX2TS U523 ( .A(n90), .Y(n88) );
  INVX2TS U524 ( .A(n269), .Y(n267) );
  INVX2TS U525 ( .A(n242), .Y(n240) );
  INVX2TS U526 ( .A(n227), .Y(n225) );
  INVX2TS U527 ( .A(n264), .Y(n262) );
  INVX2TS U528 ( .A(n208), .Y(n206) );
  NAND2X1TS U529 ( .A(n477), .B(n85), .Y(n5) );
  NOR2X1TS U530 ( .A(n93), .B(n52), .Y(n50) );
  NOR2X1TS U531 ( .A(B[37]), .B(A[37]), .Y(n93) );
  NOR2X1TS U532 ( .A(B[29]), .B(A[29]), .Y(n131) );
  NOR2X1TS U533 ( .A(B[31]), .B(A[31]), .Y(n123) );
  NOR2X1TS U534 ( .A(B[33]), .B(A[33]), .Y(n115) );
  NAND2X1TS U535 ( .A(B[30]), .B(A[30]), .Y(n129) );
  NAND2X1TS U536 ( .A(B[32]), .B(A[32]), .Y(n121) );
  NAND2X1TS U537 ( .A(B[34]), .B(A[34]), .Y(n113) );
  NAND2X1TS U538 ( .A(B[35]), .B(A[35]), .Y(n107) );
  NAND2X1TS U539 ( .A(B[29]), .B(A[29]), .Y(n132) );
  NAND2X1TS U540 ( .A(B[31]), .B(A[31]), .Y(n124) );
  NAND2X1TS U541 ( .A(B[33]), .B(A[33]), .Y(n116) );
  NAND2X1TS U542 ( .A(n494), .B(n90), .Y(n6) );
  XNOR2X1TS U543 ( .A(n79), .B(n4), .Y(SUM[40]) );
  NAND2X1TS U544 ( .A(n282), .B(n78), .Y(n4) );
  XNOR2X1TS U545 ( .A(n72), .B(n3), .Y(SUM[41]) );
  NAND2X1TS U546 ( .A(n493), .B(n71), .Y(n3) );
  XNOR2X1TS U547 ( .A(n65), .B(n2), .Y(SUM[42]) );
  NAND2X1TS U548 ( .A(n280), .B(n64), .Y(n2) );
  XNOR2X1TS U549 ( .A(n58), .B(n1), .Y(SUM[43]) );
  NAND2X1TS U550 ( .A(n495), .B(n57), .Y(n1) );
  NOR2X1TS U551 ( .A(B[13]), .B(A[13]), .Y(n195) );
  NOR2X1TS U552 ( .A(B[15]), .B(A[15]), .Y(n187) );
  NOR2X1TS U553 ( .A(B[17]), .B(A[17]), .Y(n179) );
  NOR2X1TS U554 ( .A(B[19]), .B(A[19]), .Y(n171) );
  NOR2X1TS U555 ( .A(B[21]), .B(A[21]), .Y(n163) );
  NOR2X1TS U556 ( .A(B[23]), .B(A[23]), .Y(n155) );
  NOR2X1TS U557 ( .A(B[27]), .B(A[27]), .Y(n139) );
  NAND2X1TS U558 ( .A(B[14]), .B(A[14]), .Y(n193) );
  NAND2X1TS U559 ( .A(B[16]), .B(A[16]), .Y(n185) );
  NAND2X1TS U560 ( .A(B[18]), .B(A[18]), .Y(n177) );
  NAND2X1TS U561 ( .A(B[20]), .B(A[20]), .Y(n169) );
  NAND2X1TS U562 ( .A(B[22]), .B(A[22]), .Y(n161) );
  NAND2X1TS U563 ( .A(B[24]), .B(A[24]), .Y(n153) );
  NAND2X1TS U564 ( .A(B[28]), .B(A[28]), .Y(n137) );
  NAND2X1TS U565 ( .A(B[13]), .B(A[13]), .Y(n196) );
  NAND2X1TS U566 ( .A(B[15]), .B(A[15]), .Y(n188) );
  NAND2X1TS U567 ( .A(B[17]), .B(A[17]), .Y(n180) );
  NAND2X1TS U568 ( .A(B[19]), .B(A[19]), .Y(n172) );
  NAND2X1TS U569 ( .A(B[21]), .B(A[21]), .Y(n164) );
  NAND2X1TS U570 ( .A(B[23]), .B(A[23]), .Y(n156) );
  NAND2X1TS U571 ( .A(B[27]), .B(A[27]), .Y(n140) );
  XNOR2X1TS U572 ( .A(n9), .B(n108), .Y(SUM[35]) );
  NAND2X1TS U573 ( .A(n291), .B(n124), .Y(n13) );
  INVX2TS U574 ( .A(n123), .Y(n291) );
  NAND2X1TS U575 ( .A(n289), .B(n116), .Y(n11) );
  INVX2TS U576 ( .A(n115), .Y(n289) );
  NAND2X1TS U577 ( .A(B[12]), .B(A[12]), .Y(n201) );
  NAND2X1TS U578 ( .A(n486), .B(n129), .Y(n14) );
  NAND2X1TS U579 ( .A(n487), .B(n121), .Y(n12) );
  NAND2X1TS U580 ( .A(n484), .B(n113), .Y(n10) );
  NAND2X1TS U581 ( .A(n297), .B(n148), .Y(n19) );
  NAND2X1TS U582 ( .A(n295), .B(n140), .Y(n17) );
  INVX2TS U583 ( .A(n139), .Y(n295) );
  NAND2X1TS U584 ( .A(n293), .B(n132), .Y(n15) );
  INVX2TS U585 ( .A(n131), .Y(n293) );
  NAND2X1TS U586 ( .A(n492), .B(n145), .Y(n18) );
  NAND2X1TS U587 ( .A(n485), .B(n137), .Y(n16) );
  NAND2X1TS U588 ( .A(n301), .B(n164), .Y(n23) );
  INVX2TS U589 ( .A(n163), .Y(n301) );
  NAND2X1TS U590 ( .A(n299), .B(n156), .Y(n21) );
  INVX2TS U591 ( .A(n155), .Y(n299) );
  XNOR2X1TS U592 ( .A(n22), .B(n162), .Y(SUM[22]) );
  NAND2X1TS U593 ( .A(n490), .B(n161), .Y(n22) );
  XNOR2X1TS U594 ( .A(n20), .B(n154), .Y(SUM[24]) );
  NAND2X1TS U595 ( .A(n491), .B(n153), .Y(n20) );
  NAND2X1TS U596 ( .A(n305), .B(n180), .Y(n27) );
  INVX2TS U597 ( .A(n179), .Y(n305) );
  NAND2X1TS U598 ( .A(n303), .B(n172), .Y(n25) );
  INVX2TS U599 ( .A(n171), .Y(n303) );
  XNOR2X1TS U600 ( .A(n26), .B(n178), .Y(SUM[18]) );
  NAND2X1TS U601 ( .A(n488), .B(n177), .Y(n26) );
  XNOR2X1TS U602 ( .A(n24), .B(n170), .Y(SUM[20]) );
  NAND2X1TS U603 ( .A(n489), .B(n169), .Y(n24) );
  XNOR2X1TS U604 ( .A(n43), .B(n276), .Y(SUM[1]) );
  NAND2X1TS U605 ( .A(n502), .B(n275), .Y(n43) );
  XNOR2X1TS U606 ( .A(n270), .B(n42), .Y(SUM[2]) );
  NAND2X1TS U607 ( .A(n499), .B(n269), .Y(n42) );
  AOI21X1TS U608 ( .A0(n270), .A1(n499), .B0(n267), .Y(n265) );
  NAND2X1TS U609 ( .A(n479), .B(n264), .Y(n41) );
  NAND2X1TS U610 ( .A(n253), .B(n256), .Y(n40) );
  XNOR2X1TS U611 ( .A(n250), .B(n39), .Y(SUM[5]) );
  OAI21X1TS U612 ( .A0(n257), .A1(n255), .B0(n256), .Y(n250) );
  NAND2X1TS U613 ( .A(n497), .B(n249), .Y(n39) );
  XNOR2X1TS U614 ( .A(n243), .B(n38), .Y(SUM[6]) );
  NAND2X1TS U615 ( .A(n500), .B(n242), .Y(n38) );
  AOI21X1TS U616 ( .A0(n243), .A1(n500), .B0(n240), .Y(n238) );
  NAND2X1TS U617 ( .A(n480), .B(n237), .Y(n37) );
  XNOR2X1TS U618 ( .A(n228), .B(n36), .Y(SUM[8]) );
  NAND2X1TS U619 ( .A(n501), .B(n227), .Y(n36) );
  AOI21X1TS U620 ( .A0(n228), .A1(n501), .B0(n225), .Y(n223) );
  NAND2X1TS U621 ( .A(n478), .B(n222), .Y(n35) );
  AOI21X1TS U622 ( .A0(n228), .A1(n215), .B0(n216), .Y(n214) );
  NAND2X1TS U623 ( .A(n312), .B(n213), .Y(n34) );
  AOI21X1TS U624 ( .A0(n228), .A1(n210), .B0(n211), .Y(n209) );
  NAND2X1TS U625 ( .A(n498), .B(n208), .Y(n33) );
  XNOR2X1TS U626 ( .A(n202), .B(n32), .Y(SUM[12]) );
  NAND2X1TS U627 ( .A(n496), .B(n201), .Y(n32) );
  NAND2X1TS U628 ( .A(n309), .B(n196), .Y(n31) );
  INVX2TS U629 ( .A(n195), .Y(n309) );
  XNOR2X1TS U630 ( .A(n30), .B(n194), .Y(SUM[14]) );
  NAND2X1TS U631 ( .A(n482), .B(n193), .Y(n30) );
  NAND2X1TS U632 ( .A(n307), .B(n188), .Y(n29) );
  INVX2TS U633 ( .A(n187), .Y(n307) );
  XNOR2X1TS U634 ( .A(n28), .B(n186), .Y(SUM[16]) );
  NAND2X1TS U635 ( .A(n483), .B(n185), .Y(n28) );
  NOR2X1TS U636 ( .A(A[4]), .B(B[4]), .Y(n255) );
  NAND2X1TS U637 ( .A(A[0]), .B(B[0]), .Y(n278) );
  NAND2X1TS U638 ( .A(A[1]), .B(B[1]), .Y(n275) );
  NAND2X1TS U639 ( .A(A[4]), .B(B[4]), .Y(n256) );
  NAND2X1TS U640 ( .A(A[38]), .B(B[38]), .Y(n90) );
  NAND2X1TS U641 ( .A(A[2]), .B(B[2]), .Y(n269) );
  NAND2X1TS U642 ( .A(A[6]), .B(B[6]), .Y(n242) );
  NAND2X1TS U643 ( .A(A[8]), .B(B[8]), .Y(n227) );
  NAND2X1TS U644 ( .A(A[3]), .B(B[3]), .Y(n264) );
  NAND2X1TS U645 ( .A(A[5]), .B(B[5]), .Y(n249) );
  NAND2X1TS U646 ( .A(A[7]), .B(B[7]), .Y(n237) );
  NAND2X1TS U647 ( .A(A[9]), .B(B[9]), .Y(n222) );
  NAND2X1TS U648 ( .A(A[11]), .B(B[11]), .Y(n208) );
  NAND2X1TS U649 ( .A(A[39]), .B(B[39]), .Y(n85) );
  NAND2X1TS U650 ( .A(A[41]), .B(B[41]), .Y(n71) );
  NAND2X1TS U651 ( .A(A[43]), .B(B[43]), .Y(n57) );
  NAND2X1TS U652 ( .A(A[10]), .B(B[10]), .Y(n213) );
  NAND2X1TS U653 ( .A(A[40]), .B(B[40]), .Y(n78) );
  NAND2X1TS U654 ( .A(A[42]), .B(B[42]), .Y(n64) );
initial $sdf_annotate("FPU_Multiplication_Function_syn.sdf"); 
 endmodule


module adder_W48 ( Data_A_i, Data_B_i, Data_S_o );
  input [47:0] Data_A_i;
  input [47:0] Data_B_i;
  output [48:0] Data_S_o;


  adder_W48_DW01_add_2 add_31 ( .A({1'b0, Data_A_i}), .B({1'b0, Data_B_i}), 
        .CI(1'b0), .SUM(Data_S_o) );
initial $sdf_annotate("FPU_Multiplication_Function_syn.sdf"); 
 endmodule


module RegisterAdd_W48 ( clk, rst, load, D, Q );
  input [47:0] D;
  output [47:0] Q;
  input clk, rst, load;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n49, n50, n51, n52, n53,
         n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67,
         n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81,
         n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95,
         n97, n40, n41, n42, n43, n44, n45, n46, n47, n48, n96, n98, n99, n100,
         n101, n111;

  DFFRX2TS Q_reg_46_ ( .D(n95), .CK(clk), .RN(n44), .Q(Q[46]) );
  DFFRX2TS Q_reg_45_ ( .D(n94), .CK(clk), .RN(n44), .Q(Q[45]) );
  DFFRX2TS Q_reg_44_ ( .D(n93), .CK(clk), .RN(n44), .Q(Q[44]) );
  DFFRX2TS Q_reg_39_ ( .D(n88), .CK(clk), .RN(n44), .Q(Q[39]) );
  DFFRX2TS Q_reg_38_ ( .D(n87), .CK(clk), .RN(n40), .Q(Q[38]), .QN(n39) );
  DFFRX2TS Q_reg_37_ ( .D(n86), .CK(clk), .RN(n40), .Q(Q[37]), .QN(n38) );
  DFFRX2TS Q_reg_36_ ( .D(n85), .CK(clk), .RN(n40), .Q(Q[36]), .QN(n37) );
  DFFRX2TS Q_reg_35_ ( .D(n84), .CK(clk), .RN(n40), .Q(Q[35]), .QN(n36) );
  DFFRX2TS Q_reg_34_ ( .D(n83), .CK(clk), .RN(n40), .Q(Q[34]), .QN(n35) );
  DFFRX2TS Q_reg_33_ ( .D(n82), .CK(clk), .RN(n40), .Q(Q[33]), .QN(n34) );
  DFFRX2TS Q_reg_32_ ( .D(n81), .CK(clk), .RN(n40), .Q(Q[32]), .QN(n33) );
  DFFRX2TS Q_reg_31_ ( .D(n80), .CK(clk), .RN(n40), .Q(Q[31]), .QN(n32) );
  DFFRX2TS Q_reg_30_ ( .D(n79), .CK(clk), .RN(n40), .Q(Q[30]), .QN(n31) );
  DFFRX2TS Q_reg_29_ ( .D(n78), .CK(clk), .RN(n40), .Q(Q[29]), .QN(n30) );
  DFFRX2TS Q_reg_28_ ( .D(n77), .CK(clk), .RN(n41), .Q(Q[28]), .QN(n29) );
  DFFRX2TS Q_reg_27_ ( .D(n76), .CK(clk), .RN(n41), .Q(Q[27]), .QN(n28) );
  DFFRX2TS Q_reg_26_ ( .D(n75), .CK(clk), .RN(n41), .Q(Q[26]), .QN(n27) );
  DFFRX2TS Q_reg_25_ ( .D(n74), .CK(clk), .RN(n41), .Q(Q[25]), .QN(n26) );
  DFFRX2TS Q_reg_24_ ( .D(n73), .CK(clk), .RN(n41), .Q(Q[24]), .QN(n25) );
  DFFRX2TS Q_reg_23_ ( .D(n72), .CK(clk), .RN(n41), .Q(Q[23]), .QN(n24) );
  DFFRX2TS Q_reg_21_ ( .D(n70), .CK(clk), .RN(n41), .Q(Q[21]), .QN(n22) );
  DFFRX2TS Q_reg_16_ ( .D(n65), .CK(clk), .RN(n42), .Q(Q[16]), .QN(n17) );
  DFFRX2TS Q_reg_10_ ( .D(n59), .CK(clk), .RN(n42), .Q(Q[10]), .QN(n11) );
  DFFRX2TS Q_reg_6_ ( .D(n55), .CK(clk), .RN(n43), .Q(Q[6]), .QN(n7) );
  DFFRX2TS Q_reg_14_ ( .D(n63), .CK(clk), .RN(n42), .Q(Q[14]), .QN(n15) );
  DFFRX2TS Q_reg_4_ ( .D(n53), .CK(clk), .RN(n43), .Q(Q[4]), .QN(n5) );
  DFFRX2TS Q_reg_1_ ( .D(n50), .CK(clk), .RN(n43), .Q(Q[1]), .QN(n2) );
  DFFRX2TS Q_reg_0_ ( .D(n49), .CK(clk), .RN(n43), .Q(Q[0]), .QN(n1) );
  DFFRX2TS Q_reg_20_ ( .D(n69), .CK(clk), .RN(n41), .Q(Q[20]), .QN(n21) );
  DFFRX2TS Q_reg_15_ ( .D(n64), .CK(clk), .RN(n42), .Q(Q[15]), .QN(n16) );
  DFFRX2TS Q_reg_11_ ( .D(n60), .CK(clk), .RN(n42), .Q(Q[11]), .QN(n12) );
  DFFRX2TS Q_reg_5_ ( .D(n54), .CK(clk), .RN(n43), .Q(Q[5]), .QN(n6) );
  DFFRX2TS Q_reg_12_ ( .D(n61), .CK(clk), .RN(n42), .Q(Q[12]), .QN(n13) );
  DFFRX2TS Q_reg_13_ ( .D(n62), .CK(clk), .RN(n42), .Q(Q[13]), .QN(n14) );
  DFFRX2TS Q_reg_17_ ( .D(n66), .CK(clk), .RN(n42), .Q(Q[17]), .QN(n18) );
  DFFRX2TS Q_reg_19_ ( .D(n68), .CK(clk), .RN(n41), .Q(Q[19]), .QN(n20) );
  DFFRX2TS Q_reg_9_ ( .D(n58), .CK(clk), .RN(n42), .Q(Q[9]), .QN(n10) );
  DFFRX2TS Q_reg_3_ ( .D(n52), .CK(clk), .RN(n43), .Q(Q[3]), .QN(n4) );
  DFFRX2TS Q_reg_18_ ( .D(n67), .CK(clk), .RN(n42), .Q(Q[18]), .QN(n19) );
  DFFRX2TS Q_reg_8_ ( .D(n57), .CK(clk), .RN(n43), .Q(Q[8]), .QN(n9) );
  DFFRX2TS Q_reg_2_ ( .D(n51), .CK(clk), .RN(n43), .Q(Q[2]), .QN(n3) );
  DFFRX2TS Q_reg_22_ ( .D(n71), .CK(clk), .RN(n41), .Q(Q[22]), .QN(n23) );
  DFFRX2TS Q_reg_7_ ( .D(n56), .CK(clk), .RN(n43), .Q(Q[7]), .QN(n8) );
  DFFRXLTS Q_reg_43_ ( .D(n92), .CK(clk), .RN(n44), .Q(Q[43]) );
  DFFRXLTS Q_reg_42_ ( .D(n91), .CK(clk), .RN(n44), .Q(Q[42]) );
  DFFRXLTS Q_reg_41_ ( .D(n90), .CK(clk), .RN(n44), .Q(Q[41]) );
  DFFRXLTS Q_reg_40_ ( .D(n89), .CK(clk), .RN(n44), .Q(Q[40]) );
  DFFRXLTS Q_reg_47_ ( .D(n97), .CK(clk), .RN(n43), .Q(Q[47]) );
  CLKMX2X3TS U2 ( .A(Q[47]), .B(D[47]), .S0(n98), .Y(n97) );
  CLKBUFX2TS U3 ( .A(n100), .Y(n48) );
  CLKBUFX2TS U4 ( .A(n100), .Y(n96) );
  CLKBUFX2TS U5 ( .A(n101), .Y(n47) );
  CLKBUFX2TS U6 ( .A(n46), .Y(n101) );
  CLKBUFX2TS U7 ( .A(n45), .Y(n99) );
  CLKBUFX2TS U8 ( .A(n45), .Y(n98) );
  CLKBUFX2TS U9 ( .A(n46), .Y(n100) );
  CLKBUFX2TS U10 ( .A(load), .Y(n45) );
  CLKBUFX2TS U11 ( .A(load), .Y(n46) );
  CLKBUFX2TS U12 ( .A(n111), .Y(n42) );
  CLKBUFX2TS U13 ( .A(n111), .Y(n41) );
  CLKBUFX2TS U14 ( .A(n111), .Y(n40) );
  CLKBUFX2TS U15 ( .A(n111), .Y(n43) );
  CLKBUFX2TS U16 ( .A(n111), .Y(n44) );
  CLKMX2X2TS U17 ( .A(Q[39]), .B(D[39]), .S0(n99), .Y(n88) );
  OAI2BB2XLTS U18 ( .B0(n39), .B1(n96), .A0N(D[38]), .A1N(n98), .Y(n87) );
  CLKMX2X2TS U19 ( .A(Q[44]), .B(D[44]), .S0(n100), .Y(n93) );
  CLKMX2X2TS U20 ( .A(Q[45]), .B(D[45]), .S0(n98), .Y(n94) );
  CLKMX2X2TS U21 ( .A(Q[46]), .B(D[46]), .S0(n99), .Y(n95) );
  CLKMX2X2TS U22 ( .A(Q[40]), .B(D[40]), .S0(n98), .Y(n89) );
  CLKMX2X2TS U23 ( .A(Q[41]), .B(D[41]), .S0(n101), .Y(n90) );
  CLKMX2X2TS U24 ( .A(Q[42]), .B(D[42]), .S0(n46), .Y(n91) );
  CLKMX2X2TS U25 ( .A(Q[43]), .B(D[43]), .S0(n99), .Y(n92) );
  OAI2BB2XLTS U26 ( .B0(n36), .B1(n47), .A0N(D[35]), .A1N(n100), .Y(n84) );
  OAI2BB2XLTS U27 ( .B0(n37), .B1(n47), .A0N(D[36]), .A1N(n99), .Y(n85) );
  OAI2BB2XLTS U28 ( .B0(n38), .B1(n47), .A0N(D[37]), .A1N(n45), .Y(n86) );
  OAI2BB2XLTS U29 ( .B0(n32), .B1(n47), .A0N(D[31]), .A1N(n46), .Y(n80) );
  OAI2BB2XLTS U30 ( .B0(n34), .B1(n47), .A0N(D[33]), .A1N(n100), .Y(n82) );
  OAI2BB2XLTS U31 ( .B0(n31), .B1(n47), .A0N(D[30]), .A1N(n45), .Y(n79) );
  OAI2BB2XLTS U32 ( .B0(n33), .B1(n47), .A0N(D[32]), .A1N(n46), .Y(n81) );
  OAI2BB2XLTS U33 ( .B0(n35), .B1(n47), .A0N(D[34]), .A1N(n99), .Y(n83) );
  OAI2BB2XLTS U34 ( .B0(n26), .B1(n48), .A0N(D[25]), .A1N(n45), .Y(n74) );
  OAI2BB2XLTS U35 ( .B0(n28), .B1(n48), .A0N(D[27]), .A1N(n101), .Y(n76) );
  OAI2BB2XLTS U36 ( .B0(n30), .B1(n47), .A0N(D[29]), .A1N(n45), .Y(n78) );
  OAI2BB2XLTS U37 ( .B0(n27), .B1(n48), .A0N(D[26]), .A1N(n45), .Y(n75) );
  OAI2BB2XLTS U38 ( .B0(n29), .B1(n47), .A0N(D[28]), .A1N(n101), .Y(n77) );
  OAI2BB2XLTS U39 ( .B0(n22), .B1(n48), .A0N(D[21]), .A1N(n45), .Y(n70) );
  OAI2BB2XLTS U40 ( .B0(n24), .B1(n48), .A0N(D[23]), .A1N(n99), .Y(n72) );
  OAI2BB2XLTS U41 ( .B0(n23), .B1(n48), .A0N(D[22]), .A1N(n45), .Y(n71) );
  OAI2BB2XLTS U42 ( .B0(n25), .B1(n48), .A0N(D[24]), .A1N(n101), .Y(n73) );
  OAI2BB2XLTS U43 ( .B0(n18), .B1(n96), .A0N(D[17]), .A1N(n100), .Y(n66) );
  OAI2BB2XLTS U44 ( .B0(n20), .B1(n48), .A0N(D[19]), .A1N(n100), .Y(n68) );
  OAI2BB2XLTS U45 ( .B0(n19), .B1(n48), .A0N(D[18]), .A1N(n101), .Y(n67) );
  OAI2BB2XLTS U46 ( .B0(n21), .B1(n48), .A0N(D[20]), .A1N(n46), .Y(n69) );
  OAI2BB2XLTS U47 ( .B0(n1), .B1(load), .A0N(n101), .A1N(D[0]), .Y(n49) );
  OAI2BB2XLTS U48 ( .B0(n2), .B1(n99), .A0N(D[1]), .A1N(n98), .Y(n50) );
  OAI2BB2XLTS U49 ( .B0(n3), .B1(load), .A0N(D[2]), .A1N(n98), .Y(n51) );
  OAI2BB2XLTS U50 ( .B0(n4), .B1(load), .A0N(D[3]), .A1N(n101), .Y(n52) );
  OAI2BB2XLTS U51 ( .B0(n5), .B1(n45), .A0N(D[4]), .A1N(n98), .Y(n53) );
  OAI2BB2XLTS U52 ( .B0(n6), .B1(n46), .A0N(D[5]), .A1N(load), .Y(n54) );
  OAI2BB2XLTS U53 ( .B0(n7), .B1(load), .A0N(D[6]), .A1N(n98), .Y(n55) );
  OAI2BB2XLTS U54 ( .B0(n8), .B1(n98), .A0N(D[7]), .A1N(n99), .Y(n56) );
  OAI2BB2XLTS U55 ( .B0(n9), .B1(n98), .A0N(D[8]), .A1N(n99), .Y(n57) );
  OAI2BB2XLTS U56 ( .B0(n10), .B1(n96), .A0N(D[9]), .A1N(n100), .Y(n58) );
  OAI2BB2XLTS U57 ( .B0(n11), .B1(n96), .A0N(D[10]), .A1N(n46), .Y(n59) );
  OAI2BB2XLTS U58 ( .B0(n12), .B1(n96), .A0N(D[11]), .A1N(n46), .Y(n60) );
  OAI2BB2XLTS U59 ( .B0(n13), .B1(n96), .A0N(D[12]), .A1N(n99), .Y(n61) );
  OAI2BB2XLTS U60 ( .B0(n14), .B1(n96), .A0N(D[13]), .A1N(n100), .Y(n62) );
  OAI2BB2XLTS U61 ( .B0(n15), .B1(n96), .A0N(D[14]), .A1N(n101), .Y(n63) );
  OAI2BB2XLTS U62 ( .B0(n16), .B1(n96), .A0N(D[15]), .A1N(n100), .Y(n64) );
  OAI2BB2XLTS U63 ( .B0(n17), .B1(n96), .A0N(D[16]), .A1N(n46), .Y(n65) );
  INVX2TS U64 ( .A(rst), .Y(n111) );
initial $sdf_annotate("FPU_Multiplication_Function_syn.sdf"); 
 endmodule


module Sgf_Multiplication_SW24 ( clk, rst, load_b_i, Data_A_i, Data_B_i, 
        sgf_result_o );
  input [23:0] Data_A_i;
  input [23:0] Data_B_i;
  output [47:0] sgf_result_o;
  input clk, rst, load_b_i;
  wire   SYNOPSYS_UNCONNECTED_1;
  wire   [23:0] Q_left;
  wire   [23:0] Q_right;
  wire   [12:0] result_A_adder;
  wire   [12:0] result_B_adder;
  wire   [25:0] Q_middle;
  wire   [25:0] S_A;
  wire   [25:0] S_B;
  wire   [47:0] Result;

  multiplier_W12_1 genblk1_left ( .clk(clk), .Data_A_i(Data_A_i[23:12]), 
        .Data_B_i(Data_B_i[23:12]), .Data_S_o(Q_left) );
  multiplier_W12_0 genblk1_right ( .clk(clk), .Data_A_i(Data_A_i[11:0]), 
        .Data_B_i(Data_B_i[11:0]), .Data_S_o(Q_right) );
  adder_W12_1 genblk1_A_operation ( .Data_A_i(Data_A_i[23:12]), .Data_B_i(
        Data_A_i[11:0]), .Data_S_o(result_A_adder) );
  adder_W12_0 genblk1_B_operation ( .Data_A_i(Data_B_i[23:12]), .Data_B_i(
        Data_B_i[11:0]), .Data_S_o(result_B_adder) );
  multiplier_W13 genblk1_middle ( .clk(clk), .Data_A_i(result_A_adder), 
        .Data_B_i(result_B_adder), .Data_S_o(Q_middle) );
  substractor_W26_1 genblk1_Subtr_1 ( .Data_A_i(Q_middle), .Data_B_i({1'b0, 
        1'b0, Q_left}), .Data_S_o(S_A) );
  substractor_W26_0 genblk1_Subtr_2 ( .Data_A_i(S_A), .Data_B_i({1'b0, 1'b0, 
        Q_right}), .Data_S_o(S_B) );
  adder_W48 genblk1_Final ( .Data_A_i({Q_left, Q_right}), .Data_B_i({1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, S_B, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), 
        .Data_S_o({SYNOPSYS_UNCONNECTED_1, Result}) );
  RegisterAdd_W48 genblk1_finalreg ( .clk(clk), .rst(rst), .load(load_b_i), 
        .D(Result), .Q(sgf_result_o) );
initial $sdf_annotate("FPU_Multiplication_Function_syn.sdf"); 
 endmodule


module Multiplexer_AC_W24 ( ctrl, D0, D1, S );
  input [23:0] D0;
  input [23:0] D1;
  output [23:0] S;
  input ctrl;
  wire   n1, n2, n3, n4, n5;

  CLKBUFX2TS U1 ( .A(n5), .Y(n3) );
  INVX2TS U2 ( .A(n3), .Y(n2) );
  CLKBUFX2TS U3 ( .A(n5), .Y(n4) );
  INVX2TS U4 ( .A(n1), .Y(n5) );
  AO22X1TS U5 ( .A0(D1[0]), .A1(ctrl), .B0(D0[0]), .B1(n3), .Y(S[0]) );
  AO22X1TS U6 ( .A0(n2), .A1(D1[9]), .B0(D0[9]), .B1(n5), .Y(S[9]) );
  AO22X1TS U7 ( .A0(D1[1]), .A1(n1), .B0(D0[1]), .B1(n5), .Y(S[1]) );
  AO22X1TS U8 ( .A0(D1[2]), .A1(n2), .B0(D0[2]), .B1(n5), .Y(S[2]) );
  AO22X1TS U9 ( .A0(D1[3]), .A1(n2), .B0(D0[3]), .B1(n5), .Y(S[3]) );
  AO22X1TS U10 ( .A0(D1[4]), .A1(n2), .B0(D0[4]), .B1(n3), .Y(S[4]) );
  AO22X1TS U11 ( .A0(D1[5]), .A1(n2), .B0(D0[5]), .B1(n3), .Y(S[5]) );
  AO22X1TS U12 ( .A0(D1[6]), .A1(n2), .B0(D0[6]), .B1(n3), .Y(S[6]) );
  AO22X1TS U13 ( .A0(D1[7]), .A1(n2), .B0(D0[7]), .B1(n5), .Y(S[7]) );
  AO22X1TS U14 ( .A0(D1[8]), .A1(n2), .B0(D0[8]), .B1(n5), .Y(S[8]) );
  AO22X1TS U15 ( .A0(D1[11]), .A1(n1), .B0(D0[11]), .B1(n4), .Y(S[11]) );
  AO22X1TS U16 ( .A0(D1[12]), .A1(ctrl), .B0(D0[12]), .B1(n4), .Y(S[12]) );
  AO22X1TS U17 ( .A0(D1[13]), .A1(ctrl), .B0(D0[13]), .B1(n4), .Y(S[13]) );
  AO22X1TS U18 ( .A0(D1[14]), .A1(ctrl), .B0(D0[14]), .B1(n4), .Y(S[14]) );
  AO22X1TS U19 ( .A0(D1[15]), .A1(ctrl), .B0(D0[15]), .B1(n4), .Y(S[15]) );
  AO22X1TS U20 ( .A0(D1[16]), .A1(ctrl), .B0(D0[16]), .B1(n4), .Y(S[16]) );
  AO22X1TS U21 ( .A0(D1[17]), .A1(ctrl), .B0(D0[17]), .B1(n4), .Y(S[17]) );
  AO22X1TS U22 ( .A0(D1[18]), .A1(ctrl), .B0(D0[18]), .B1(n4), .Y(S[18]) );
  AO22X1TS U23 ( .A0(D1[19]), .A1(n1), .B0(D0[19]), .B1(n4), .Y(S[19]) );
  AO22X1TS U24 ( .A0(D1[20]), .A1(n1), .B0(D0[20]), .B1(n5), .Y(S[20]) );
  AO22X1TS U25 ( .A0(D1[21]), .A1(n1), .B0(D0[21]), .B1(n5), .Y(S[21]) );
  AO22X1TS U26 ( .A0(D1[22]), .A1(n2), .B0(D0[22]), .B1(n3), .Y(S[22]) );
  AO22X1TS U27 ( .A0(D1[23]), .A1(n2), .B0(D0[23]), .B1(n3), .Y(S[23]) );
  AO22X1TS U28 ( .A0(D1[10]), .A1(ctrl), .B0(D0[10]), .B1(n4), .Y(S[10]) );
  CLKBUFX2TS U29 ( .A(ctrl), .Y(n1) );
initial $sdf_annotate("FPU_Multiplication_Function_syn.sdf"); 
 endmodule


module shift_mux_array_SWR24_LEVEL0 ( Data_i, select_i, bit_shift_i, Data_o );
  input [23:0] Data_i;
  output [23:0] Data_o;
  input select_i, bit_shift_i;
  wire   n1, n2, n3, n4, n5;

  CLKBUFX2TS U1 ( .A(select_i), .Y(n4) );
  INVX2TS U2 ( .A(n4), .Y(n1) );
  INVX2TS U3 ( .A(n4), .Y(n2) );
  INVX2TS U4 ( .A(n4), .Y(n3) );
  CLKBUFX2TS U5 ( .A(select_i), .Y(n5) );
  AO22X1TS U6 ( .A0(n4), .A1(Data_i[1]), .B0(Data_i[0]), .B1(n2), .Y(Data_o[0]) );
  AO22X1TS U7 ( .A0(n5), .A1(Data_i[2]), .B0(n2), .B1(Data_i[1]), .Y(Data_o[1]) );
  AO22X1TS U8 ( .A0(n5), .A1(Data_i[3]), .B0(n3), .B1(Data_i[2]), .Y(Data_o[2]) );
  AO22X1TS U9 ( .A0(n5), .A1(Data_i[4]), .B0(n2), .B1(Data_i[3]), .Y(Data_o[3]) );
  AO22X1TS U10 ( .A0(n5), .A1(Data_i[5]), .B0(n2), .B1(Data_i[4]), .Y(
        Data_o[4]) );
  AO22X1TS U11 ( .A0(n5), .A1(Data_i[6]), .B0(n2), .B1(Data_i[5]), .Y(
        Data_o[5]) );
  AO22X1TS U12 ( .A0(n5), .A1(Data_i[7]), .B0(n3), .B1(Data_i[6]), .Y(
        Data_o[6]) );
  AO22X1TS U13 ( .A0(n5), .A1(Data_i[8]), .B0(n3), .B1(Data_i[7]), .Y(
        Data_o[7]) );
  AO22X1TS U14 ( .A0(n5), .A1(Data_i[9]), .B0(n3), .B1(Data_i[8]), .Y(
        Data_o[8]) );
  AO22X1TS U15 ( .A0(n1), .A1(Data_i[9]), .B0(Data_i[10]), .B1(n5), .Y(
        Data_o[9]) );
  AO22X1TS U16 ( .A0(n2), .A1(Data_i[10]), .B0(n4), .B1(Data_i[11]), .Y(
        Data_o[10]) );
  AO22X1TS U17 ( .A0(n2), .A1(Data_i[11]), .B0(n4), .B1(Data_i[12]), .Y(
        Data_o[11]) );
  AO22X1TS U18 ( .A0(n2), .A1(Data_i[12]), .B0(n4), .B1(Data_i[13]), .Y(
        Data_o[12]) );
  AO22X1TS U19 ( .A0(n2), .A1(Data_i[13]), .B0(select_i), .B1(Data_i[14]), .Y(
        Data_o[13]) );
  AO22X1TS U20 ( .A0(n2), .A1(Data_i[14]), .B0(n4), .B1(Data_i[15]), .Y(
        Data_o[14]) );
  AO22X1TS U21 ( .A0(n1), .A1(Data_i[15]), .B0(n4), .B1(Data_i[16]), .Y(
        Data_o[15]) );
  AO22X1TS U22 ( .A0(n1), .A1(Data_i[16]), .B0(select_i), .B1(Data_i[17]), .Y(
        Data_o[16]) );
  AO22X1TS U23 ( .A0(n1), .A1(Data_i[17]), .B0(select_i), .B1(Data_i[18]), .Y(
        Data_o[17]) );
  AO22X1TS U24 ( .A0(n1), .A1(Data_i[18]), .B0(select_i), .B1(Data_i[19]), .Y(
        Data_o[18]) );
  AO22X1TS U25 ( .A0(n1), .A1(Data_i[19]), .B0(select_i), .B1(Data_i[20]), .Y(
        Data_o[19]) );
  AO22X1TS U26 ( .A0(n1), .A1(Data_i[20]), .B0(select_i), .B1(Data_i[21]), .Y(
        Data_o[20]) );
  AO22X1TS U27 ( .A0(n1), .A1(Data_i[21]), .B0(select_i), .B1(Data_i[22]), .Y(
        Data_o[21]) );
  AO22X1TS U28 ( .A0(n1), .A1(Data_i[22]), .B0(select_i), .B1(Data_i[23]), .Y(
        Data_o[22]) );
  AO22X1TS U29 ( .A0(n1), .A1(Data_i[23]), .B0(bit_shift_i), .B1(n5), .Y(
        Data_o[23]) );
initial $sdf_annotate("FPU_Multiplication_Function_syn.sdf"); 
 endmodule


module RegisterMult_W24 ( clk, rst, load, D, Q );
  input [23:0] D;
  output [23:0] Q;
  input clk, rst, load;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n49, n48, n50, n51, n52, n53, n54, n55, n56;

  DFFRX2TS Q_reg_23_ ( .D(n49), .CK(clk), .RN(n56), .Q(Q[23]), .QN(n24) );
  DFFRX2TS Q_reg_22_ ( .D(n47), .CK(clk), .RN(n56), .Q(Q[22]), .QN(n23) );
  DFFRX2TS Q_reg_21_ ( .D(n46), .CK(clk), .RN(n56), .Q(Q[21]), .QN(n22) );
  DFFRX2TS Q_reg_20_ ( .D(n45), .CK(clk), .RN(n56), .Q(Q[20]), .QN(n21) );
  DFFRX2TS Q_reg_19_ ( .D(n44), .CK(clk), .RN(n50), .Q(Q[19]), .QN(n20) );
  DFFRX2TS Q_reg_18_ ( .D(n43), .CK(clk), .RN(n50), .Q(Q[18]), .QN(n19) );
  DFFRX2TS Q_reg_17_ ( .D(n42), .CK(clk), .RN(n50), .Q(Q[17]), .QN(n18) );
  DFFRX2TS Q_reg_16_ ( .D(n41), .CK(clk), .RN(n50), .Q(Q[16]), .QN(n17) );
  DFFRX2TS Q_reg_15_ ( .D(n40), .CK(clk), .RN(n50), .Q(Q[15]), .QN(n16) );
  DFFRX2TS Q_reg_14_ ( .D(n39), .CK(clk), .RN(n50), .Q(Q[14]), .QN(n15) );
  DFFRX2TS Q_reg_13_ ( .D(n38), .CK(clk), .RN(n50), .Q(Q[13]), .QN(n14) );
  DFFRX2TS Q_reg_12_ ( .D(n37), .CK(clk), .RN(n50), .Q(Q[12]), .QN(n13) );
  DFFRX2TS Q_reg_11_ ( .D(n36), .CK(clk), .RN(n50), .Q(Q[11]), .QN(n12) );
  DFFRX2TS Q_reg_10_ ( .D(n35), .CK(clk), .RN(n50), .Q(Q[10]), .QN(n11) );
  DFFRX2TS Q_reg_9_ ( .D(n34), .CK(clk), .RN(n48), .Q(Q[9]), .QN(n10) );
  DFFRX2TS Q_reg_8_ ( .D(n33), .CK(clk), .RN(n48), .Q(Q[8]), .QN(n9) );
  DFFRX2TS Q_reg_7_ ( .D(n32), .CK(clk), .RN(n48), .Q(Q[7]), .QN(n8) );
  DFFRX2TS Q_reg_6_ ( .D(n31), .CK(clk), .RN(n48), .Q(Q[6]), .QN(n7) );
  DFFRX2TS Q_reg_5_ ( .D(n30), .CK(clk), .RN(n48), .Q(Q[5]), .QN(n6) );
  DFFRX2TS Q_reg_4_ ( .D(n29), .CK(clk), .RN(n48), .Q(Q[4]), .QN(n5) );
  DFFRX2TS Q_reg_3_ ( .D(n28), .CK(clk), .RN(n48), .Q(Q[3]), .QN(n4) );
  DFFRX2TS Q_reg_2_ ( .D(n27), .CK(clk), .RN(n48), .Q(Q[2]), .QN(n3) );
  DFFRX4TS Q_reg_1_ ( .D(n26), .CK(clk), .RN(n48), .Q(Q[1]), .QN(n2) );
  DFFRX2TS Q_reg_0_ ( .D(n25), .CK(clk), .RN(n48), .Q(Q[0]), .QN(n1) );
  CLKBUFX2TS U2 ( .A(n56), .Y(n48) );
  CLKBUFX2TS U3 ( .A(n56), .Y(n50) );
  INVX2TS U4 ( .A(rst), .Y(n56) );
  CLKBUFX2TS U5 ( .A(n51), .Y(n53) );
  CLKBUFX2TS U6 ( .A(n51), .Y(n54) );
  CLKBUFX2TS U7 ( .A(n52), .Y(n55) );
  CLKBUFX2TS U8 ( .A(load), .Y(n51) );
  CLKBUFX2TS U9 ( .A(load), .Y(n52) );
  OAI2BB2XLTS U10 ( .B0(n1), .B1(n55), .A0N(n52), .A1N(D[0]), .Y(n25) );
  OAI2BB2XLTS U11 ( .B0(n2), .B1(n55), .A0N(D[1]), .A1N(load), .Y(n26) );
  OAI2BB2XLTS U12 ( .B0(n3), .B1(n55), .A0N(D[2]), .A1N(load), .Y(n27) );
  OAI2BB2XLTS U13 ( .B0(n4), .B1(n54), .A0N(D[3]), .A1N(load), .Y(n28) );
  OAI2BB2XLTS U14 ( .B0(n5), .B1(n54), .A0N(D[4]), .A1N(n52), .Y(n29) );
  OAI2BB2XLTS U15 ( .B0(n6), .B1(n55), .A0N(D[5]), .A1N(n52), .Y(n30) );
  OAI2BB2XLTS U16 ( .B0(n7), .B1(n54), .A0N(D[6]), .A1N(load), .Y(n31) );
  OAI2BB2XLTS U17 ( .B0(n8), .B1(n54), .A0N(D[7]), .A1N(n51), .Y(n32) );
  OAI2BB2XLTS U18 ( .B0(n9), .B1(n54), .A0N(D[8]), .A1N(n55), .Y(n33) );
  OAI2BB2XLTS U19 ( .B0(n10), .B1(n54), .A0N(D[9]), .A1N(n55), .Y(n34) );
  OAI2BB2XLTS U20 ( .B0(n11), .B1(n54), .A0N(D[10]), .A1N(n55), .Y(n35) );
  OAI2BB2XLTS U21 ( .B0(n12), .B1(n54), .A0N(D[11]), .A1N(n55), .Y(n36) );
  OAI2BB2XLTS U22 ( .B0(n13), .B1(n54), .A0N(D[12]), .A1N(n55), .Y(n37) );
  OAI2BB2XLTS U23 ( .B0(n14), .B1(n53), .A0N(D[13]), .A1N(n55), .Y(n38) );
  OAI2BB2XLTS U24 ( .B0(n15), .B1(n53), .A0N(D[14]), .A1N(n52), .Y(n39) );
  OAI2BB2XLTS U25 ( .B0(n16), .B1(n53), .A0N(D[15]), .A1N(n51), .Y(n40) );
  OAI2BB2XLTS U26 ( .B0(n17), .B1(n53), .A0N(D[16]), .A1N(n52), .Y(n41) );
  OAI2BB2XLTS U27 ( .B0(n18), .B1(n53), .A0N(D[17]), .A1N(n51), .Y(n42) );
  OAI2BB2XLTS U28 ( .B0(n19), .B1(n53), .A0N(D[18]), .A1N(n52), .Y(n43) );
  OAI2BB2XLTS U29 ( .B0(n20), .B1(n53), .A0N(D[19]), .A1N(n51), .Y(n44) );
  OAI2BB2XLTS U30 ( .B0(n21), .B1(n53), .A0N(D[20]), .A1N(load), .Y(n45) );
  OAI2BB2XLTS U31 ( .B0(n22), .B1(n53), .A0N(D[21]), .A1N(load), .Y(n46) );
  OAI2BB2XLTS U32 ( .B0(n23), .B1(n53), .A0N(D[22]), .A1N(load), .Y(n47) );
  OAI2BB2XLTS U33 ( .B0(n24), .B1(n54), .A0N(D[23]), .A1N(load), .Y(n49) );
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

  NAND4X1TS U1 ( .A(n1), .B(n2), .C(n3), .D(n4), .Y(round_ok) );
  NOR4BX1TS U2 ( .AN(n5), .B(Sgf_Round_Part[6]), .C(Sgf_Round_Part[4]), .D(
        Sgf_Round_Part[5]), .Y(n4) );
  NOR3X1TS U3 ( .A(Sgf_Round_Part[7]), .B(Sgf_Round_Part[9]), .C(
        Sgf_Round_Part[8]), .Y(n5) );
  NOR4BX1TS U4 ( .AN(n7), .B(Sgf_Round_Part[16]), .C(Sgf_Round_Part[14]), .D(
        Sgf_Round_Part[15]), .Y(n2) );
  NOR3X1TS U5 ( .A(Sgf_Round_Part[17]), .B(Sgf_Round_Part[19]), .C(
        Sgf_Round_Part[18]), .Y(n7) );
  NOR4BX1TS U6 ( .AN(n6), .B(Sgf_Round_Part[21]), .C(Sgf_Round_Part[1]), .D(
        Sgf_Round_Part[20]), .Y(n3) );
  NOR3X1TS U7 ( .A(Sgf_Round_Part[22]), .B(Sgf_Round_Part[3]), .C(
        Sgf_Round_Part[2]), .Y(n6) );
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
  XNOR2X1TS U4 ( .A(round_mode[0]), .B(round_mode[1]), .Y(n2) );
  XOR2X1TS U5 ( .A(xor_info), .B(round_mode[0]), .Y(n1) );
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
  wire   n1, n2;
  wire   [23:1] carry;

  CMPR32X2TS U1_16 ( .A(A[16]), .B(B[16]), .C(carry[16]), .CO(carry[17]), .S(
        SUM[16]) );
  CMPR32X2TS U1_13 ( .A(A[13]), .B(B[13]), .C(carry[13]), .CO(carry[14]), .S(
        SUM[13]) );
  CMPR32X2TS U1_10 ( .A(A[10]), .B(B[10]), .C(carry[10]), .CO(carry[11]), .S(
        SUM[10]) );
  CMPR32X2TS U1_7 ( .A(A[7]), .B(B[7]), .C(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  CMPR32X2TS U1_4 ( .A(A[4]), .B(B[4]), .C(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDFHX2TS U1_1 ( .A(A[1]), .B(B[1]), .CI(carry[1]), .CO(carry[2]), .S(SUM[1]) );
  ADDFHX2TS U1_23 ( .A(A[23]), .B(B[23]), .CI(carry[23]), .CO(SUM[24]), .S(
        SUM[23]) );
  ADDFHX2TS U1_20 ( .A(A[20]), .B(B[20]), .CI(carry[20]), .CO(carry[21]), .S(
        SUM[20]) );
  ADDFHX2TS U1_21 ( .A(A[21]), .B(B[21]), .CI(carry[21]), .CO(carry[22]), .S(
        SUM[21]) );
  ADDFHX2TS U1_17 ( .A(A[17]), .B(B[17]), .CI(carry[17]), .CO(carry[18]), .S(
        SUM[17]) );
  ADDFHX2TS U1_18 ( .A(A[18]), .B(B[18]), .CI(carry[18]), .CO(carry[19]), .S(
        SUM[18]) );
  ADDFHX2TS U1_14 ( .A(A[14]), .B(B[14]), .CI(carry[14]), .CO(carry[15]), .S(
        SUM[14]) );
  ADDFHX2TS U1_15 ( .A(A[15]), .B(B[15]), .CI(carry[15]), .CO(carry[16]), .S(
        SUM[15]) );
  ADDFHX2TS U1_11 ( .A(A[11]), .B(B[11]), .CI(carry[11]), .CO(carry[12]), .S(
        SUM[11]) );
  ADDFHX2TS U1_12 ( .A(A[12]), .B(B[12]), .CI(carry[12]), .CO(carry[13]), .S(
        SUM[12]) );
  ADDFHX2TS U1_8 ( .A(A[8]), .B(B[8]), .CI(carry[8]), .CO(carry[9]), .S(SUM[8]) );
  ADDFHX2TS U1_9 ( .A(A[9]), .B(B[9]), .CI(carry[9]), .CO(carry[10]), .S(
        SUM[9]) );
  ADDFHX2TS U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDFHX2TS U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDFHX2TS U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDFHX2TS U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDFHX2TS U1_22 ( .A(A[22]), .B(B[22]), .CI(carry[22]), .CO(carry[23]), .S(
        SUM[22]) );
  ADDFHX1TS U1_19 ( .A(A[19]), .B(B[19]), .CI(carry[19]), .CO(carry[20]), .S(
        SUM[19]) );
  NOR2X2TS U1 ( .A(n1), .B(n2), .Y(carry[1]) );
  CLKINVX4TS U2 ( .A(A[0]), .Y(n1) );
  XNOR2XLTS U3 ( .A(B[0]), .B(n1), .Y(SUM[0]) );
  INVX2TS U4 ( .A(B[0]), .Y(n2) );
initial $sdf_annotate("FPU_Multiplication_Function_syn.sdf"); 
 endmodule


module adder_W24 ( Data_A_i, Data_B_i, Data_S_o );
  input [23:0] Data_A_i;
  input [23:0] Data_B_i;
  output [24:0] Data_S_o;


  adder_W24_DW01_add_0 add_31 ( .A({1'b0, Data_A_i}), .B({1'b0, Data_B_i}), 
        .CI(1'b0), .SUM(Data_S_o) );
initial $sdf_annotate("FPU_Multiplication_Function_syn.sdf"); 
 endmodule


module RegisterAdd_W24 ( clk, rst, load, D, Q );
  input [23:0] D;
  output [23:0] Q;
  input clk, rst, load;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n23, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46,
         n47, n49, n22, n24, n48, n50, n51, n52, n53, n54, n55;

  DFFRX2TS Q_reg_9_ ( .D(n34), .CK(clk), .RN(n24), .Q(Q[9]), .QN(n10) );
  DFFRX2TS Q_reg_18_ ( .D(n43), .CK(clk), .RN(n48), .Q(Q[18]), .QN(n19) );
  DFFRX2TS Q_reg_17_ ( .D(n42), .CK(clk), .RN(n48), .Q(Q[17]), .QN(n18) );
  DFFRX2TS Q_reg_16_ ( .D(n41), .CK(clk), .RN(n48), .Q(Q[16]), .QN(n17) );
  DFFRX2TS Q_reg_15_ ( .D(n40), .CK(clk), .RN(n48), .Q(Q[15]), .QN(n16) );
  DFFRX2TS Q_reg_14_ ( .D(n39), .CK(clk), .RN(n48), .Q(Q[14]), .QN(n15) );
  DFFRX2TS Q_reg_13_ ( .D(n38), .CK(clk), .RN(n48), .Q(Q[13]), .QN(n14) );
  DFFRX2TS Q_reg_12_ ( .D(n37), .CK(clk), .RN(n48), .Q(Q[12]), .QN(n13) );
  DFFRX2TS Q_reg_11_ ( .D(n36), .CK(clk), .RN(n48), .Q(Q[11]), .QN(n12) );
  DFFRX2TS Q_reg_10_ ( .D(n35), .CK(clk), .RN(n48), .Q(Q[10]), .QN(n11) );
  DFFRX2TS Q_reg_8_ ( .D(n33), .CK(clk), .RN(n24), .Q(Q[8]), .QN(n9) );
  DFFRX2TS Q_reg_7_ ( .D(n32), .CK(clk), .RN(n24), .Q(Q[7]), .QN(n8) );
  DFFRX2TS Q_reg_6_ ( .D(n31), .CK(clk), .RN(n24), .Q(Q[6]), .QN(n7) );
  DFFRX2TS Q_reg_5_ ( .D(n30), .CK(clk), .RN(n24), .Q(Q[5]), .QN(n6) );
  DFFRX2TS Q_reg_4_ ( .D(n29), .CK(clk), .RN(n24), .Q(Q[4]), .QN(n5) );
  DFFRX2TS Q_reg_3_ ( .D(n28), .CK(clk), .RN(n24), .Q(Q[3]), .QN(n4) );
  DFFRX2TS Q_reg_2_ ( .D(n27), .CK(clk), .RN(n24), .Q(Q[2]), .QN(n3) );
  DFFRX2TS Q_reg_1_ ( .D(n26), .CK(clk), .RN(n24), .Q(Q[1]), .QN(n2) );
  DFFRX2TS Q_reg_0_ ( .D(n25), .CK(clk), .RN(n24), .Q(Q[0]), .QN(n1) );
  DFFRX1TS Q_reg_21_ ( .D(n46), .CK(clk), .RN(n55), .Q(Q[21]) );
  DFFRXLTS Q_reg_20_ ( .D(n45), .CK(clk), .RN(n55), .Q(Q[20]), .QN(n21) );
  DFFRXLTS Q_reg_19_ ( .D(n44), .CK(clk), .RN(n48), .Q(Q[19]), .QN(n20) );
  DFFRXLTS Q_reg_22_ ( .D(n47), .CK(clk), .RN(n55), .Q(Q[22]), .QN(n23) );
  DFFRX1TS Q_reg_23_ ( .D(n49), .CK(clk), .RN(n55), .Q(Q[23]) );
  AO22X1TS U2 ( .A0(Q[23]), .A1(n22), .B0(D[23]), .B1(n54), .Y(n49) );
  INVX2TS U3 ( .A(n53), .Y(n22) );
  AO22X1TS U4 ( .A0(Q[21]), .A1(n22), .B0(D[21]), .B1(n54), .Y(n46) );
  CLKBUFX2TS U5 ( .A(n55), .Y(n24) );
  CLKBUFX2TS U6 ( .A(n55), .Y(n48) );
  CLKBUFX2TS U7 ( .A(n50), .Y(n53) );
  INVX2TS U8 ( .A(rst), .Y(n55) );
  CLKBUFX2TS U9 ( .A(load), .Y(n51) );
  CLKBUFX2TS U10 ( .A(load), .Y(n50) );
  CLKBUFX2TS U11 ( .A(n52), .Y(n54) );
  CLKBUFX2TS U12 ( .A(load), .Y(n52) );
  OAI2BB2XLTS U13 ( .B0(n23), .B1(n54), .A0N(D[22]), .A1N(n54), .Y(n47) );
  OAI2BB2XLTS U14 ( .B0(n19), .B1(n51), .A0N(D[18]), .A1N(n52), .Y(n43) );
  OAI2BB2XLTS U15 ( .B0(n20), .B1(n51), .A0N(D[19]), .A1N(load), .Y(n44) );
  OAI2BB2XLTS U16 ( .B0(n21), .B1(n51), .A0N(D[20]), .A1N(n54), .Y(n45) );
  OAI2BB2XLTS U17 ( .B0(n15), .B1(n51), .A0N(D[14]), .A1N(n52), .Y(n39) );
  OAI2BB2XLTS U18 ( .B0(n16), .B1(n51), .A0N(D[15]), .A1N(n52), .Y(n40) );
  OAI2BB2XLTS U19 ( .B0(n17), .B1(n51), .A0N(D[16]), .A1N(n50), .Y(n41) );
  OAI2BB2XLTS U20 ( .B0(n18), .B1(n51), .A0N(D[17]), .A1N(n52), .Y(n42) );
  OAI2BB2XLTS U21 ( .B0(n12), .B1(n53), .A0N(D[11]), .A1N(n50), .Y(n36) );
  OAI2BB2XLTS U22 ( .B0(n13), .B1(n53), .A0N(D[12]), .A1N(load), .Y(n37) );
  OAI2BB2XLTS U23 ( .B0(n14), .B1(n51), .A0N(D[13]), .A1N(load), .Y(n38) );
  OAI2BB2XLTS U24 ( .B0(n8), .B1(n53), .A0N(D[7]), .A1N(n50), .Y(n32) );
  OAI2BB2XLTS U25 ( .B0(n9), .B1(n53), .A0N(D[8]), .A1N(load), .Y(n33) );
  OAI2BB2XLTS U26 ( .B0(n10), .B1(n53), .A0N(D[9]), .A1N(n50), .Y(n34) );
  OAI2BB2XLTS U27 ( .B0(n11), .B1(n53), .A0N(D[10]), .A1N(n50), .Y(n35) );
  OAI2BB2XLTS U28 ( .B0(n5), .B1(n53), .A0N(D[4]), .A1N(n51), .Y(n29) );
  OAI2BB2XLTS U29 ( .B0(n6), .B1(n51), .A0N(D[5]), .A1N(n54), .Y(n30) );
  OAI2BB2XLTS U30 ( .B0(n7), .B1(n53), .A0N(D[6]), .A1N(load), .Y(n31) );
  OAI2BB2XLTS U31 ( .B0(n1), .B1(n50), .A0N(n54), .A1N(D[0]), .Y(n25) );
  OAI2BB2XLTS U32 ( .B0(n2), .B1(n50), .A0N(D[1]), .A1N(n54), .Y(n26) );
  OAI2BB2XLTS U33 ( .B0(n3), .B1(n50), .A0N(D[2]), .A1N(n54), .Y(n27) );
  OAI2BB2XLTS U34 ( .B0(n4), .B1(n53), .A0N(D[3]), .A1N(n54), .Y(n28) );
initial $sdf_annotate("FPU_Multiplication_Function_syn.sdf"); 
 endmodule


module RegisterAdd_W1_0 ( clk, rst, load, D, Q );
  input [0:0] D;
  output [0:0] Q;
  input clk, rst, load;
  wire   n2, n4, n5;

  DFFRX1TS Q_reg_0_ ( .D(n4), .CK(clk), .RN(n2), .Q(Q[0]), .QN(n5) );
  OAI2BB2XLTS U2 ( .B0(n5), .B1(load), .A0N(load), .A1N(D[0]), .Y(n4) );
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
  wire   n1;
  wire   [24:0] result_A_adder;

  adder_W24 A_operation ( .Data_A_i(Data_A_i), .Data_B_i(Data_B_i), .Data_S_o(
        result_A_adder) );
  RegisterAdd_W24 Add_Subt_Result ( .clk(clk), .rst(rst), .load(n1), .D(
        result_A_adder[23:0]), .Q(Data_Result_o) );
  RegisterAdd_W1_0 Add_overflow_Result ( .clk(clk), .rst(rst), .load(n1), .D(
        result_A_adder[24]), .Q(FSM_C_o) );
  CLKBUFX2TS U1 ( .A(load_i), .Y(n1) );
initial $sdf_annotate("FPU_Multiplication_Function_syn.sdf"); 
 endmodule


module Mux_3x1_W1 ( ctrl, D0, D1, D2, S );
  input [1:0] ctrl;
  input [0:0] D0;
  input [0:0] D1;
  input [0:0] D2;
  output [0:0] S;
  wire   n3, n4, n1, n2;

  AOI22X1TS U2 ( .A0(D0[0]), .A1(n1), .B0(ctrl[0]), .B1(D1[0]), .Y(n3) );
  OAI22X1TS U3 ( .A0(ctrl[1]), .A1(n3), .B0(n2), .B1(n4), .Y(S[0]) );
  INVX2TS U4 ( .A(ctrl[1]), .Y(n2) );
  NAND2X1TS U5 ( .A(D2[0]), .B(n1), .Y(n4) );
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

  CLKBUFX2TS U1 ( .A(n5), .Y(n3) );
  AO22XLTS U2 ( .A0(D1[1]), .A1(n1), .B0(D0[1]), .B1(n4), .Y(S[1]) );
  AO22XLTS U3 ( .A0(D1[2]), .A1(n2), .B0(D0[2]), .B1(n4), .Y(S[2]) );
  AO22XLTS U4 ( .A0(D1[3]), .A1(n2), .B0(D0[3]), .B1(n3), .Y(S[3]) );
  AO22XLTS U5 ( .A0(D1[4]), .A1(n2), .B0(D0[4]), .B1(n4), .Y(S[4]) );
  AO22XLTS U6 ( .A0(D1[5]), .A1(n2), .B0(D0[5]), .B1(n3), .Y(S[5]) );
  AO22XLTS U7 ( .A0(D1[6]), .A1(n2), .B0(D0[6]), .B1(n4), .Y(S[6]) );
  AO22XLTS U8 ( .A0(D1[7]), .A1(n2), .B0(D0[7]), .B1(n3), .Y(S[7]) );
  AO22XLTS U9 ( .A0(D1[0]), .A1(ctrl), .B0(D0[0]), .B1(n3), .Y(S[0]) );
  INVX2TS U10 ( .A(n3), .Y(n2) );
  CLKBUFX2TS U11 ( .A(n5), .Y(n4) );
  INVX2TS U12 ( .A(n1), .Y(n5) );
  CLKBUFX2TS U13 ( .A(ctrl), .Y(n1) );
  AO22X1TS U14 ( .A0(D1[8]), .A1(n2), .B0(D0[8]), .B1(n4), .Y(S[8]) );
  AO22X1TS U15 ( .A0(n2), .A1(D1[9]), .B0(D0[9]), .B1(n4), .Y(S[9]) );
  AO22X1TS U16 ( .A0(D1[10]), .A1(ctrl), .B0(D0[10]), .B1(n5), .Y(S[10]) );
  AO22X1TS U17 ( .A0(D1[11]), .A1(ctrl), .B0(D0[11]), .B1(n5), .Y(S[11]) );
  AO22X1TS U18 ( .A0(D1[12]), .A1(ctrl), .B0(D0[12]), .B1(n5), .Y(S[12]) );
  AO22X1TS U19 ( .A0(D1[13]), .A1(ctrl), .B0(D0[13]), .B1(n5), .Y(S[13]) );
  AO22X1TS U20 ( .A0(D1[14]), .A1(ctrl), .B0(D0[14]), .B1(n5), .Y(S[14]) );
  AO22X1TS U21 ( .A0(D1[15]), .A1(ctrl), .B0(D0[15]), .B1(n5), .Y(S[15]) );
  AO22X1TS U22 ( .A0(D1[16]), .A1(ctrl), .B0(D0[16]), .B1(n5), .Y(S[16]) );
  AO22X1TS U23 ( .A0(D1[17]), .A1(n1), .B0(D0[17]), .B1(n5), .Y(S[17]) );
  AO22X1TS U24 ( .A0(D1[18]), .A1(n1), .B0(D0[18]), .B1(n4), .Y(S[18]) );
  AO22X1TS U25 ( .A0(D1[19]), .A1(n1), .B0(D0[19]), .B1(n3), .Y(S[19]) );
  AO22X1TS U26 ( .A0(D1[20]), .A1(n1), .B0(D0[20]), .B1(n4), .Y(S[20]) );
  AO22X1TS U27 ( .A0(D1[21]), .A1(n2), .B0(D0[21]), .B1(n4), .Y(S[21]) );
  AO22X1TS U28 ( .A0(D1[22]), .A1(n2), .B0(D0[22]), .B1(n3), .Y(S[22]) );
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
         n73, n74, n75;

  DFFRX2TS Q_reg_31_ ( .D(n65), .CK(clk), .RN(n75), .Q(Q[31]), .QN(n32) );
  DFFRX2TS Q_reg_30_ ( .D(n63), .CK(clk), .RN(n75), .Q(Q[30]), .QN(n31) );
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
  CLKBUFX2TS U2 ( .A(n75), .Y(n64) );
  CLKBUFX2TS U3 ( .A(n75), .Y(n66) );
  CLKBUFX2TS U4 ( .A(n75), .Y(n67) );
  INVX2TS U5 ( .A(rst), .Y(n75) );
  CLKBUFX2TS U6 ( .A(n73), .Y(n70) );
  CLKBUFX2TS U7 ( .A(n73), .Y(n69) );
  CLKBUFX2TS U8 ( .A(n72), .Y(n71) );
  CLKBUFX2TS U9 ( .A(n74), .Y(n68) );
  CLKBUFX2TS U10 ( .A(load), .Y(n74) );
  CLKBUFX2TS U11 ( .A(load), .Y(n72) );
  CLKBUFX2TS U12 ( .A(load), .Y(n73) );
  OAI2BB2XLTS U13 ( .B0(n1), .B1(n71), .A0N(n74), .A1N(D[0]), .Y(n33) );
  OAI2BB2XLTS U14 ( .B0(n2), .B1(n70), .A0N(D[1]), .A1N(n73), .Y(n34) );
  OAI2BB2XLTS U15 ( .B0(n3), .B1(n71), .A0N(D[2]), .A1N(load), .Y(n35) );
  OAI2BB2XLTS U16 ( .B0(n4), .B1(n70), .A0N(D[3]), .A1N(load), .Y(n36) );
  OAI2BB2XLTS U17 ( .B0(n5), .B1(n70), .A0N(D[4]), .A1N(n73), .Y(n37) );
  OAI2BB2XLTS U18 ( .B0(n6), .B1(n70), .A0N(D[5]), .A1N(n72), .Y(n38) );
  OAI2BB2XLTS U19 ( .B0(n7), .B1(n70), .A0N(D[6]), .A1N(n74), .Y(n39) );
  OAI2BB2XLTS U20 ( .B0(n8), .B1(n70), .A0N(D[7]), .A1N(n72), .Y(n40) );
  OAI2BB2XLTS U21 ( .B0(n9), .B1(n70), .A0N(D[8]), .A1N(n71), .Y(n41) );
  OAI2BB2XLTS U22 ( .B0(n10), .B1(n70), .A0N(D[9]), .A1N(n74), .Y(n42) );
  OAI2BB2XLTS U23 ( .B0(n11), .B1(n70), .A0N(D[10]), .A1N(n71), .Y(n43) );
  OAI2BB2XLTS U24 ( .B0(n12), .B1(n69), .A0N(D[11]), .A1N(n71), .Y(n44) );
  OAI2BB2XLTS U25 ( .B0(n13), .B1(n69), .A0N(D[12]), .A1N(n71), .Y(n45) );
  OAI2BB2XLTS U26 ( .B0(n14), .B1(n69), .A0N(D[13]), .A1N(n71), .Y(n46) );
  OAI2BB2XLTS U27 ( .B0(n15), .B1(n69), .A0N(D[14]), .A1N(n71), .Y(n47) );
  OAI2BB2XLTS U28 ( .B0(n16), .B1(n70), .A0N(D[15]), .A1N(n73), .Y(n48) );
  OAI2BB2XLTS U29 ( .B0(n17), .B1(n69), .A0N(D[16]), .A1N(n71), .Y(n49) );
  OAI2BB2XLTS U30 ( .B0(n18), .B1(n69), .A0N(D[17]), .A1N(n71), .Y(n50) );
  OAI2BB2XLTS U31 ( .B0(n19), .B1(n69), .A0N(D[18]), .A1N(n72), .Y(n51) );
  OAI2BB2XLTS U32 ( .B0(n20), .B1(n69), .A0N(D[19]), .A1N(n74), .Y(n52) );
  OAI2BB2XLTS U33 ( .B0(n21), .B1(n69), .A0N(D[20]), .A1N(n73), .Y(n53) );
  OAI2BB2XLTS U34 ( .B0(n22), .B1(n68), .A0N(D[21]), .A1N(n73), .Y(n54) );
  OAI2BB2XLTS U35 ( .B0(n23), .B1(n68), .A0N(D[22]), .A1N(n72), .Y(n55) );
  OAI2BB2XLTS U36 ( .B0(n24), .B1(n68), .A0N(D[23]), .A1N(n74), .Y(n56) );
  OAI2BB2XLTS U37 ( .B0(n25), .B1(n68), .A0N(D[24]), .A1N(n73), .Y(n57) );
  OAI2BB2XLTS U38 ( .B0(n26), .B1(n68), .A0N(D[25]), .A1N(n74), .Y(n58) );
  OAI2BB2XLTS U39 ( .B0(n27), .B1(n68), .A0N(D[26]), .A1N(load), .Y(n59) );
  OAI2BB2XLTS U40 ( .B0(n28), .B1(n68), .A0N(D[27]), .A1N(load), .Y(n60) );
  OAI2BB2XLTS U41 ( .B0(n29), .B1(n68), .A0N(D[28]), .A1N(load), .Y(n61) );
  OAI2BB2XLTS U42 ( .B0(n30), .B1(n68), .A0N(D[29]), .A1N(load), .Y(n62) );
  OAI2BB2XLTS U43 ( .B0(n31), .B1(n68), .A0N(D[30]), .A1N(n74), .Y(n63) );
  OAI2BB2XLTS U44 ( .B0(n32), .B1(n69), .A0N(D[31]), .A1N(n74), .Y(n65) );
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
  wire   [47:0] P_Sgf;
  wire   [1:0] selector_B;
  wire   [1:0] FSM_selector_B;
  wire   [31:0] Op_MX;
  wire   [31:0] Op_MY;
  wire   [8:0] exp_oper_result;
  wire   [8:0] S_Oper_A_exp;
  wire   [7:0] S_Oper_B_exp;
  wire   [23:0] Add_result;
  wire   [23:0] S_Data_Shift;
  wire   [23:0] Sgf_normalized_result;

  FSM_Mult_Function FS_Module ( .clk(clk), .rst(rst), .beg_FSM(beg_FSM), 
        .ack_FSM(ack_FSM), .zero_flag_i(zero_flag), .Mult_shift_i(P_Sgf[47]), 
        .round_flag_i(FSM_round_flag), .Add_Overflow_i(FSM_add_overflow_flag), 
        .load_0_o(FSM_first_phase_load), .load_1_o(FSM_load_first_step), 
        .load_2_o(FSM_exp_operation_load_result), .load_3_o(
        FSM_load_second_step), .load_4_o(FSM_adder_round_norm_load), 
        .load_5_o(FSM_final_result_load), .load_6_o(FSM_barrel_shifter_load), 
        .ctrl_select_a_o(selector_A), .ctrl_select_b_o(load_b), .selector_b_o(
        selector_B), .ctrl_select_c_o(selector_C), .exp_op_o(
        FSM_exp_operation_A_S), .shift_value_o(FSM_Shift_Value), .rst_int(
        rst_int), .ready(ready) );
  RegisterAdd_W1_3 Sel_A ( .clk(clk), .rst(n1), .load(selector_A), .D(1'b1), 
        .Q(FSM_selector_A) );
  RegisterAdd_W1_2 Sel_C ( .clk(clk), .rst(n1), .load(selector_C), .D(1'b1), 
        .Q(FSM_selector_C) );
  RegisterAdd_W2 Sel_B ( .clk(clk), .rst(n1), .load(load_b), .D(selector_B), 
        .Q(FSM_selector_B) );
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
  Sgf_Multiplication_SW24 Sgf_operation ( .clk(clk), .rst(rst), .load_b_i(
        FSM_load_second_step), .Data_A_i({1'b1, Op_MX[22:0]}), .Data_B_i({1'b1, 
        Op_MY[22:0]}), .sgf_result_o(P_Sgf) );
  Multiplexer_AC_W24 Barrel_Shifter_D_I_mux ( .ctrl(FSM_selector_C), .D0(
        P_Sgf[46:23]), .D1(Add_result), .S(S_Data_Shift) );
  Barrel_Shifter_M_SW24 Barrel_Shifter_module ( .clk(clk), .rst(n1), .load_i(
        FSM_barrel_shifter_load), .Shift_Value_i(FSM_Shift_Value), 
        .Shift_Data_i(S_Data_Shift), .N_mant_o(Sgf_normalized_result) );
  Round_decoder_M_SW23 Round_Decoder ( .Round_Bits_i(P_Sgf[22:0]), 
        .Round_Mode_i(round_mode), .Sign_Result_i(sign_final_result), 
        .Round_Flag_o(FSM_round_flag) );
  Adder_Round_SW24 Adder_M ( .clk(clk), .rst(rst_int), .load_i(
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
  CLKBUFX2TS U3 ( .A(rst_int), .Y(n1) );
initial $sdf_annotate("FPU_Multiplication_Function_syn.sdf"); 
 endmodule

