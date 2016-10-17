/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : L-2016.03-SP3
// Date      : Mon Oct 17 14:00:22 2016
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
  wire   n1, n2, n4, ctrl_a_o, n7, n8, n9, n10, n11, n15, n16, n17, n18, n19,
         n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33,
         n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47,
         n48, n49, n50, n51, n52, n53, n54, n55, n56;
  wire   [3:0] state_reg;
  assign ctrl_d_o = ctrl_a_o;

  INVX2TS U3 ( .A(rst), .Y(n1) );
  DFFRX2TS \state_reg_reg[3]  ( .D(n55), .CK(clk), .RN(n1), .Q(state_reg[3]), 
        .QN(n9) );
  DFFRX2TS \state_reg_reg[1]  ( .D(n54), .CK(clk), .RN(n1), .Q(state_reg[1]), 
        .QN(n16) );
  DFFRX2TS \state_reg_reg[0]  ( .D(n56), .CK(clk), .RN(n1), .Q(state_reg[0]), 
        .QN(n17) );
  DFFRX2TS \state_reg_reg[2]  ( .D(n53), .CK(clk), .RN(n1), .Q(state_reg[2]), 
        .QN(n15) );
  NAND3X1TS U4 ( .A(state_reg[1]), .B(n49), .C(state_reg[3]), .Y(n20) );
  NOR3X1TS U5 ( .A(load_2_o), .B(load_1_o), .C(load_7_o), .Y(n31) );
  NOR2X1TS U6 ( .A(n16), .B(state_reg[3]), .Y(n51) );
  AOI21X1TS U7 ( .A0(load_2_o), .A1(zero_flag_i), .B0(load_7_o), .Y(n22) );
  NOR3BX1TS U8 ( .AN(n45), .B(n17), .C(state_reg[1]), .Y(n25) );
  NAND3X1TS U9 ( .A(n16), .B(n9), .C(n49), .Y(n41) );
  NAND3X1TS U10 ( .A(n16), .B(n9), .C(n50), .Y(n32) );
  NAND3X1TS U11 ( .A(state_reg[1]), .B(n17), .C(n45), .Y(n29) );
  NAND2X1TS U12 ( .A(n43), .B(n27), .Y(load_5_o) );
  NOR2BX1TS U13 ( .AN(ctrl_b_load_o), .B(add_overflow_i), .Y(ctrl_b_o[0]) );
  OA21XLTS U14 ( .A0(n36), .A1(load_8_o), .B0(add_overflow_i), .Y(bit_shift_o)
         );
  INVX2TS U15 ( .A(n43), .Y(ctrl_c_o) );
  INVX2TS U16 ( .A(n20), .Y(ready) );
  OAI21X1TS U17 ( .A0(n32), .A1(n18), .B0(n24), .Y(n36) );
  INVX2TS U18 ( .A(n40), .Y(load_2_o) );
  INVX2TS U19 ( .A(n22), .Y(n10) );
  INVX2TS U20 ( .A(n32), .Y(n8) );
  NAND2X1TS U21 ( .A(n51), .B(n49), .Y(n43) );
  NAND2X1TS U22 ( .A(n50), .B(n51), .Y(n27) );
  INVX2TS U23 ( .A(n41), .Y(n4) );
  INVX2TS U24 ( .A(n29), .Y(n7) );
  INVX2TS U25 ( .A(n39), .Y(rst_int) );
  INVX2TS U26 ( .A(n44), .Y(load_6_o) );
  NOR4XLTS U27 ( .A(n48), .B(ctrl_b_load_o), .C(load_5_o), .D(load_4_o), .Y(
        n47) );
  NAND2X1TS U28 ( .A(n32), .B(n24), .Y(load_4_o) );
  NAND3X1TS U29 ( .A(n20), .B(n39), .C(n42), .Y(n48) );
  AOI211X1TS U30 ( .A0(n4), .A1(n18), .B0(n50), .C0(n25), .Y(n46) );
  NAND2X1TS U31 ( .A(n44), .B(n29), .Y(ctrl_b_load_o) );
  NAND4X1TS U32 ( .A(add_overflow_i), .B(n31), .C(n46), .D(n47), .Y(A_S_op_o)
         );
  OAI21X1TS U33 ( .A0(n18), .A1(n41), .B0(n33), .Y(load_8_o) );
  OAI2BB1X1TS U34 ( .A0N(load_6_o), .A1N(add_overflow_i), .B0(n29), .Y(
        ctrl_b_o[1]) );
  AOI211X1TS U35 ( .A0(n41), .A1(n32), .B0(n18), .C0(add_overflow_i), .Y(
        left_right_o) );
  INVX2TS U36 ( .A(n28), .Y(ctrl_a_o) );
  OAI22X1TS U37 ( .A0(beg_FSM), .A1(n39), .B0(rst_FSM), .B1(n20), .Y(n26) );
  NAND4BX1TS U38 ( .AN(load_5_o), .B(n33), .C(n34), .D(n35), .Y(n55) );
  AOI21X1TS U39 ( .A0(n25), .A1(n19), .B0(n7), .Y(n34) );
  AOI211X1TS U40 ( .A0(state_reg[3]), .A1(n26), .B0(n36), .C0(n10), .Y(n35) );
  INVX2TS U41 ( .A(round_i), .Y(n19) );
  NAND4X1TS U42 ( .A(n27), .B(n28), .C(n29), .D(n30), .Y(n54) );
  AOI221X1TS U43 ( .A0(n8), .A1(n18), .B0(state_reg[1]), .B1(n26), .C0(n11), 
        .Y(n30) );
  INVX2TS U44 ( .A(n31), .Y(n11) );
  NOR2X1TS U45 ( .A(n15), .B(state_reg[0]), .Y(n49) );
  NAND3X1TS U46 ( .A(n21), .B(n22), .C(n23), .Y(n53) );
  NOR4BX1TS U47 ( .AN(n24), .B(load_3_o), .C(load_6_o), .D(n25), .Y(n23) );
  AOI22X1TS U48 ( .A0(n8), .A1(n18), .B0(state_reg[2]), .B1(n26), .Y(n21) );
  NAND3X1TS U49 ( .A(n41), .B(n42), .C(n33), .Y(load_3_o) );
  AOI31X1TS U50 ( .A0(n37), .A1(n2), .A2(n38), .B0(n26), .Y(n56) );
  INVX2TS U51 ( .A(n36), .Y(n2) );
  AOI2BB1X1TS U52 ( .A0N(n40), .A1N(zero_flag_i), .B0(n7), .Y(n37) );
  NOR3X1TS U53 ( .A(n25), .B(rst_int), .C(n4), .Y(n38) );
  AND2X2TS U54 ( .A(n52), .B(state_reg[0]), .Y(load_1_o) );
  NOR2X1TS U55 ( .A(n9), .B(state_reg[2]), .Y(n45) );
  NOR2X1TS U56 ( .A(n17), .B(n15), .Y(n50) );
  NOR3X1TS U57 ( .A(state_reg[2]), .B(state_reg[3]), .C(state_reg[1]), .Y(n52)
         );
  NAND3X1TS U58 ( .A(n51), .B(n15), .C(state_reg[0]), .Y(n42) );
  NAND2X1TS U59 ( .A(n52), .B(n17), .Y(n39) );
  NAND3X1TS U60 ( .A(n17), .B(n15), .C(n51), .Y(n40) );
  NAND3X1TS U61 ( .A(n49), .B(n16), .C(state_reg[3]), .Y(n24) );
  AND3X2TS U62 ( .A(n50), .B(state_reg[3]), .C(n16), .Y(load_7_o) );
  NAND3X1TS U63 ( .A(n17), .B(n16), .C(n45), .Y(n44) );
  NAND3X1TS U64 ( .A(state_reg[0]), .B(state_reg[1]), .C(n45), .Y(n33) );
  NAND2X1TS U65 ( .A(round_i), .B(n25), .Y(n28) );
  INVX2TS U66 ( .A(norm_iteration_i), .Y(n18) );
endmodule


module FPU_Add_Subtract_Function_W32_EW8_SW23_SWR26_EWR5_FSM_Add_Subtract ( 
        clk, rst, beg_FSM, ack_FSM, Data_X, Data_Y, add_subt, r_mode, 
        overflow_flag, underflow_flag, ready, final_result_ieee );
  input [31:0] Data_X;
  input [31:0] Data_Y;
  input [1:0] r_mode;
  output [31:0] final_result_ieee;
  input clk, rst, beg_FSM, ack_FSM, add_subt;
  output overflow_flag, underflow_flag, ready;


  FSM_Add_Subtract FS_Module ( .clk(clk), .rst(rst), .rst_FSM(ack_FSM), 
        .beg_FSM(beg_FSM), .zero_flag_i(1'b0), .norm_iteration_i(1'b0), 
        .add_overflow_i(1'b0), .round_i(1'b0), .ready(ready) );
endmodule

