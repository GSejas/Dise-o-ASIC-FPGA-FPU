/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : L-2016.03-SP3
// Date      : Mon Oct 17 14:34:20 2016
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
  wire   n53, n54, n55, n56, n5, n7, n8, n13, n14, n15, n17, n19, n20, n21,
         n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35,
         n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49,
         n50, n51, n52, n57, n58, n59, n60, n61, ctrl_a_o, n1;
  wire   [3:0] state_reg;
  assign ctrl_d_o = ctrl_a_o;

  DFFRX2TS \state_reg_reg[1]  ( .D(n54), .CK(clk), .RN(n20), .Q(state_reg[1]), 
        .QN(n1) );
  DFFRX2TS \state_reg_reg[0]  ( .D(n56), .CK(clk), .RN(n20), .Q(state_reg[0])
         );
  DFFRX2TS \state_reg_reg[2]  ( .D(n53), .CK(clk), .RN(n20), .Q(state_reg[2])
         );
  DFFRXLTS \state_reg_reg[3]  ( .D(n55), .CK(clk), .RN(n20), .Q(state_reg[3]), 
        .QN(n14) );
  NOR4XLTS U3 ( .A(n52), .B(ctrl_b_load_o), .C(load_5_o), .D(load_4_o), .Y(n51) );
  NOR2BX1TS U4 ( .AN(state_reg[2]), .B(state_reg[0]), .Y(n57) );
  NOR2X1TS U5 ( .A(state_reg[2]), .B(state_reg[0]), .Y(n61) );
  NOR2BX1TS U6 ( .AN(state_reg[0]), .B(state_reg[2]), .Y(n48) );
  NOR2X1TS U7 ( .A(n1), .B(state_reg[3]), .Y(n59) );
  NOR2X1TS U8 ( .A(state_reg[3]), .B(state_reg[1]), .Y(n58) );
  NAND3X1TS U9 ( .A(n48), .B(n1), .C(state_reg[3]), .Y(n32) );
  NAND3X1TS U10 ( .A(state_reg[3]), .B(n1), .C(n61), .Y(n39) );
  NAND2X1TS U11 ( .A(state_reg[2]), .B(state_reg[0]), .Y(n60) );
  INVX2TS U12 ( .A(n40), .Y(ready) );
  INVX2TS U13 ( .A(n43), .Y(n15) );
  INVX2TS U14 ( .A(n28), .Y(load_2_o) );
  INVX2TS U15 ( .A(n46), .Y(n17) );
  NAND3X1TS U16 ( .A(n43), .B(n44), .C(n45), .Y(load_3_o) );
  NAND2X1TS U17 ( .A(n23), .B(n34), .Y(load_5_o) );
  INVX2TS U18 ( .A(n41), .Y(rst_int) );
  INVX2TS U19 ( .A(n45), .Y(n13) );
  NAND4X1TS U20 ( .A(add_overflow_i), .B(n36), .C(n50), .D(n51), .Y(A_S_op_o)
         );
  INVX2TS U21 ( .A(n23), .Y(ctrl_c_o) );
  NOR2X1TS U22 ( .A(n1), .B(n14), .Y(n47) );
  NAND2X1TS U23 ( .A(n47), .B(n57), .Y(n40) );
  NOR3X1TS U24 ( .A(load_1_o), .B(load_7_o), .C(load_2_o), .Y(n36) );
  AND2X2TS U25 ( .A(n58), .B(n48), .Y(load_1_o) );
  NAND2X1TS U26 ( .A(n58), .B(n57), .Y(n43) );
  NAND2X1TS U27 ( .A(n19), .B(n58), .Y(n46) );
  NAND2X1TS U28 ( .A(n58), .B(n61), .Y(n41) );
  NAND2X1TS U29 ( .A(n59), .B(n61), .Y(n28) );
  INVX2TS U30 ( .A(n32), .Y(n7) );
  INVX2TS U31 ( .A(n49), .Y(n5) );
  NAND2X1TS U32 ( .A(n47), .B(n61), .Y(n29) );
  NAND2X1TS U33 ( .A(n59), .B(n57), .Y(n23) );
  NAND2X1TS U34 ( .A(n47), .B(n48), .Y(n45) );
  NAND2X1TS U35 ( .A(n59), .B(n48), .Y(n44) );
  NAND2X1TS U36 ( .A(n19), .B(n59), .Y(n34) );
  INVX2TS U37 ( .A(n60), .Y(n19) );
  NAND2X1TS U38 ( .A(n46), .B(n49), .Y(load_4_o) );
  NAND3X1TS U39 ( .A(n32), .B(n60), .C(n44), .Y(n52) );
  AOI211X1TS U40 ( .A0(n15), .A1(n21), .B0(ready), .C0(rst_int), .Y(n50) );
  NAND2X1TS U41 ( .A(n39), .B(n29), .Y(ctrl_b_load_o) );
  AOI21X1TS U42 ( .A0(n25), .A1(n42), .B0(n22), .Y(bit_shift_o) );
  INVX2TS U43 ( .A(n42), .Y(load_8_o) );
  OAI21X1TS U44 ( .A0(n39), .A1(n22), .B0(n29), .Y(ctrl_b_o[1]) );
  AOI211X1TS U45 ( .A0(n43), .A1(n46), .B0(n21), .C0(add_overflow_i), .Y(
        left_right_o) );
  AND2X2TS U46 ( .A(ctrl_b_load_o), .B(n22), .Y(ctrl_b_o[0]) );
  OAI22X1TS U47 ( .A0(rst_FSM), .A1(n40), .B0(beg_FSM), .B1(n41), .Y(n27) );
  NAND4BX1TS U48 ( .AN(ctrl_a_o), .B(n34), .C(n29), .D(n35), .Y(n54) );
  NOR2BX1TS U49 ( .AN(round_i), .B(n32), .Y(ctrl_a_o) );
  AOI221X1TS U50 ( .A0(state_reg[1]), .A1(n27), .B0(n17), .B1(n21), .C0(n8), 
        .Y(n35) );
  INVX2TS U51 ( .A(n36), .Y(n8) );
  NAND3X1TS U52 ( .A(n37), .B(n33), .C(n38), .Y(n53) );
  NOR4XLTS U53 ( .A(load_3_o), .B(n7), .C(load_6_o), .D(n5), .Y(n38) );
  AOI22X1TS U54 ( .A0(state_reg[2]), .A1(n27), .B0(n17), .B1(n21), .Y(n37) );
  INVX2TS U55 ( .A(n39), .Y(load_6_o) );
  NAND4BBX1TS U56 ( .AN(n30), .BN(load_5_o), .C(n29), .D(n31), .Y(n55) );
  OAI211X1TS U57 ( .A0(n32), .A1(round_i), .B0(n33), .C0(n25), .Y(n30) );
  AOI21X1TS U58 ( .A0(state_reg[3]), .A1(n27), .B0(n13), .Y(n31) );
  AOI31X1TS U59 ( .A0(n24), .A1(n25), .A2(n26), .B0(n27), .Y(n56) );
  OA21XLTS U60 ( .A0(n28), .A1(zero_flag_i), .B0(n29), .Y(n24) );
  NOR3X1TS U61 ( .A(n15), .B(n7), .C(rst_int), .Y(n26) );
  NOR3X1TS U62 ( .A(n14), .B(state_reg[1]), .C(n60), .Y(load_7_o) );
  NAND3X1TS U63 ( .A(state_reg[3]), .B(n1), .C(n57), .Y(n49) );
  AOI21X1TS U64 ( .A0(n17), .A1(norm_iteration_i), .B0(n5), .Y(n25) );
  AOI21X1TS U65 ( .A0(load_2_o), .A1(zero_flag_i), .B0(load_7_o), .Y(n33) );
  AOI21X1TS U66 ( .A0(norm_iteration_i), .A1(n15), .B0(n13), .Y(n42) );
  INVX2TS U67 ( .A(rst), .Y(n20) );
  INVX2TS U68 ( .A(add_overflow_i), .Y(n22) );
  INVX2TS U69 ( .A(norm_iteration_i), .Y(n21) );
endmodule


module FPU_Add_Subtract_Function_W64_EW11_SW52_SWR55_EWR6_FSM_Add_Subtract ( 
        clk, rst, beg_FSM, ack_FSM, Data_X, Data_Y, add_subt, r_mode, 
        overflow_flag, underflow_flag, ready, final_result_ieee );
  input [63:0] Data_X;
  input [63:0] Data_Y;
  input [1:0] r_mode;
  output [63:0] final_result_ieee;
  input clk, rst, beg_FSM, ack_FSM, add_subt;
  output overflow_flag, underflow_flag, ready;


  FSM_Add_Subtract FS_Module ( .clk(clk), .rst(rst), .rst_FSM(ack_FSM), 
        .beg_FSM(beg_FSM), .zero_flag_i(1'b0), .norm_iteration_i(1'b0), 
        .add_overflow_i(1'b0), .round_i(1'b0), .ready(ready) );
endmodule

