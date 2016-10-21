/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : L-2016.03-SP3
// Date      : Wed Oct 19 14:30:33 2016
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
  wire   n1, n2, n4, ctrl_d_o, n7, n8, n9, n10, n11, n15, n16, n17, n18, n19,
         n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33,
         n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47,
         n48, n49, n50, n51, n52, n53, n54, n55, n56;
  wire   [3:0] state_reg;
  assign ctrl_a_o = ctrl_d_o;

  INVX2TS U3 ( .A(rst), .Y(n1) );
  DFFRX2TS \state_reg_reg[2]  ( .D(n53), .CK(clk), .RN(n1), .Q(state_reg[2]), 
        .QN(n15) );
  DFFRX2TS \state_reg_reg[3]  ( .D(n55), .CK(clk), .RN(n1), .Q(state_reg[3]), 
        .QN(n9) );
  DFFRX2TS \state_reg_reg[1]  ( .D(n54), .CK(clk), .RN(n1), .Q(state_reg[1]), 
        .QN(n16) );
  DFFRX2TS \state_reg_reg[0]  ( .D(n56), .CK(clk), .RN(n1), .Q(state_reg[0]), 
        .QN(n17) );
  NOR3BX1TS U67 ( .AN(n45), .B(n17), .C(state_reg[1]), .Y(n25) );
  NOR2X1TS U68 ( .A(n16), .B(state_reg[3]), .Y(n51) );
  NAND3X1TS U69 ( .A(n16), .B(n9), .C(n49), .Y(n41) );
  NAND3X1TS U70 ( .A(n16), .B(n9), .C(n50), .Y(n32) );
  NAND3X1TS U71 ( .A(state_reg[1]), .B(n17), .C(n45), .Y(n29) );
  NAND3X1TS U72 ( .A(state_reg[1]), .B(n49), .C(state_reg[3]), .Y(n20) );
  NAND2X1TS U73 ( .A(n43), .B(n27), .Y(load_5_o) );
  INVX2TS U74 ( .A(n43), .Y(ctrl_c_o) );
  OAI21X1TS U75 ( .A0(n32), .A1(n18), .B0(n24), .Y(n36) );
  OAI21X1TS U76 ( .A0(n18), .A1(n41), .B0(n33), .Y(load_8_o) );
  INVX2TS U77 ( .A(n28), .Y(ctrl_d_o) );
  INVX2TS U78 ( .A(n22), .Y(n10) );
  NOR3X1TS U79 ( .A(load_2_o), .B(load_1_o), .C(load_7_o), .Y(n31) );
  NAND2X1TS U80 ( .A(n51), .B(n49), .Y(n43) );
  NAND2X1TS U81 ( .A(n50), .B(n51), .Y(n27) );
  NAND2X1TS U82 ( .A(n44), .B(n29), .Y(ctrl_b_load_o) );
  NAND2X1TS U83 ( .A(n32), .B(n24), .Y(load_4_o) );
  NAND3X1TS U84 ( .A(n41), .B(n42), .C(n33), .Y(load_3_o) );
  INVX2TS U85 ( .A(n40), .Y(load_2_o) );
  INVX2TS U86 ( .A(n41), .Y(n4) );
  INVX2TS U87 ( .A(n39), .Y(rst_int) );
  INVX2TS U88 ( .A(n44), .Y(load_6_o) );
  INVX2TS U89 ( .A(n20), .Y(ready) );
  INVX2TS U90 ( .A(n32), .Y(n8) );
  INVX2TS U91 ( .A(n29), .Y(n7) );
  NAND2X1TS U92 ( .A(round_i), .B(n25), .Y(n28) );
  NAND4X1TS U93 ( .A(add_overflow_i), .B(n31), .C(n46), .D(n47), .Y(A_S_op_o)
         );
  NOR4XLTS U94 ( .A(n48), .B(ctrl_b_load_o), .C(load_5_o), .D(load_4_o), .Y(
        n47) );
  AOI211X1TS U95 ( .A0(n4), .A1(n18), .B0(n50), .C0(n25), .Y(n46) );
  NAND3X1TS U96 ( .A(n20), .B(n39), .C(n42), .Y(n48) );
  INVX2TS U97 ( .A(norm_iteration_i), .Y(n18) );
  NOR2BX1TS U98 ( .AN(ctrl_b_load_o), .B(add_overflow_i), .Y(ctrl_b_o[0]) );
  OA21XLTS U99 ( .A0(n36), .A1(load_8_o), .B0(add_overflow_i), .Y(bit_shift_o)
         );
  OAI2BB1X1TS U100 ( .A0N(load_6_o), .A1N(add_overflow_i), .B0(n29), .Y(
        ctrl_b_o[1]) );
  AOI211X1TS U101 ( .A0(n41), .A1(n32), .B0(n18), .C0(add_overflow_i), .Y(
        left_right_o) );
  AOI21X1TS U102 ( .A0(load_2_o), .A1(zero_flag_i), .B0(load_7_o), .Y(n22) );
  OAI22X1TS U103 ( .A0(beg_FSM), .A1(n39), .B0(rst_FSM), .B1(n20), .Y(n26) );
  NAND4BX1TS U104 ( .AN(load_5_o), .B(n33), .C(n34), .D(n35), .Y(n55) );
  AOI21X1TS U105 ( .A0(n25), .A1(n19), .B0(n7), .Y(n34) );
  AOI211X1TS U106 ( .A0(state_reg[3]), .A1(n26), .B0(n36), .C0(n10), .Y(n35)
         );
  INVX2TS U107 ( .A(round_i), .Y(n19) );
  NAND4X1TS U108 ( .A(n27), .B(n28), .C(n29), .D(n30), .Y(n54) );
  AOI221X1TS U109 ( .A0(n8), .A1(n18), .B0(state_reg[1]), .B1(n26), .C0(n11), 
        .Y(n30) );
  INVX2TS U110 ( .A(n31), .Y(n11) );
  AOI31X1TS U111 ( .A0(n37), .A1(n2), .A2(n38), .B0(n26), .Y(n56) );
  NOR3X1TS U112 ( .A(n25), .B(rst_int), .C(n4), .Y(n38) );
  AOI2BB1X1TS U113 ( .A0N(n40), .A1N(zero_flag_i), .B0(n7), .Y(n37) );
  INVX2TS U114 ( .A(n36), .Y(n2) );
  NOR2X1TS U115 ( .A(n15), .B(state_reg[0]), .Y(n49) );
  NOR2X1TS U116 ( .A(n9), .B(state_reg[2]), .Y(n45) );
  NOR2X1TS U117 ( .A(n17), .B(n15), .Y(n50) );
  NOR3X1TS U118 ( .A(state_reg[2]), .B(state_reg[3]), .C(state_reg[1]), .Y(n52) );
  NAND3X1TS U119 ( .A(n17), .B(n16), .C(n45), .Y(n44) );
  NAND3X1TS U120 ( .A(state_reg[0]), .B(state_reg[1]), .C(n45), .Y(n33) );
  NAND3X1TS U121 ( .A(n51), .B(n15), .C(state_reg[0]), .Y(n42) );
  NAND2X1TS U122 ( .A(n52), .B(n17), .Y(n39) );
  NAND3X1TS U123 ( .A(n17), .B(n15), .C(n51), .Y(n40) );
  NAND3X1TS U124 ( .A(n49), .B(n16), .C(state_reg[3]), .Y(n24) );
  AND3X2TS U125 ( .A(n50), .B(state_reg[3]), .C(n16), .Y(load_7_o) );
  NAND3X1TS U126 ( .A(n21), .B(n22), .C(n23), .Y(n53) );
  NOR4BX1TS U127 ( .AN(n24), .B(load_3_o), .C(load_6_o), .D(n25), .Y(n23) );
  AOI22X1TS U128 ( .A0(n8), .A1(n18), .B0(state_reg[2]), .B1(n26), .Y(n21) );
  AND2X2TS U129 ( .A(n52), .B(state_reg[0]), .Y(load_1_o) );
endmodule

