/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : L-2016.03-SP3
// Date      : Thu Oct 13 20:12:55 2016
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
  wire   ctrl_a_o, N18, N19, N20, N21, N23, N24, N25, N26, N27, N28, N29, N30,
         N31, N32, N33, N34, N35, N36, N37, N38, N39, N40, N41, N42, N43, N44,
         N45, N47, N48, N49, N51, N52, N53, N54, N55, N56, N57, N58, N59, N60,
         N61, N62, N63, N64, N65, N66, N67, N68, N69, N70, N71, N72, N73, N75,
         N76, N77, N79, N80, N82, N90, N94, N95, N96, N97, N98, N100, N101,
         N102, N103, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13,
         n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27,
         n28, n29;
  wire   [3:0] state_reg;
  wire   [3:0] state_next;
  assign ctrl_d_o = ctrl_a_o;

  INVX12TS I_25 ( .A(rst_FSM), .Y(N90) );
  INVX12TS I_20 ( .A(beg_FSM), .Y(N82) );
  INVX12TS I_19 ( .A(N77), .Y(ready) );
  INVX12TS I_18 ( .A(N73), .Y(load_7_o) );
  INVX12TS I_17 ( .A(N69), .Y(N70) );
  INVX12TS I_16 ( .A(N65), .Y(N66) );
  INVX12TS I_15 ( .A(N61), .Y(N62) );
  INVX12TS I_14 ( .A(N57), .Y(N58) );
  INVX12TS I_13 ( .A(N53), .Y(N54) );
  INVX12TS I_12 ( .A(N49), .Y(load_6_o) );
  INVX12TS I_11 ( .A(N45), .Y(ctrl_c_o) );
  INVX12TS I_10 ( .A(N41), .Y(N42) );
  INVX12TS I_9 ( .A(N37), .Y(N38) );
  INVX12TS I_8 ( .A(N33), .Y(N34) );
  INVX12TS I_7 ( .A(N29), .Y(N30) );
  INVX12TS I_6 ( .A(N25), .Y(N26) );
  INVX12TS I_3 ( .A(N103), .Y(load_2_o) );
  OR2X8TS C285 ( .A(state_reg[0]), .B(N102), .Y(N103) );
  OR2X8TS C284 ( .A(N100), .B(N101), .Y(N102) );
  OR2X8TS C283 ( .A(state_reg[2]), .B(state_reg[3]), .Y(N101) );
  INVX12TS I_1 ( .A(N98), .Y(load_1_o) );
  OR2X8TS C280 ( .A(N95), .B(N97), .Y(N98) );
  OR2X8TS C279 ( .A(state_reg[1]), .B(N96), .Y(N97) );
  OR2X8TS C278 ( .A(state_reg[2]), .B(state_reg[3]), .Y(N96) );
  AND2X8TS C109 ( .A(state_reg[1]), .B(state_reg[0]), .Y(N80) );
  AND2X8TS C108 ( .A(state_reg[3]), .B(state_reg[2]), .Y(N79) );
  OR2X8TS C105 ( .A(N100), .B(state_reg[0]), .Y(N76) );
  OR2X8TS C104 ( .A(N18), .B(N19), .Y(N75) );
  OR2X8TS C98 ( .A(state_reg[1]), .B(N95), .Y(N72) );
  OR2X8TS C97 ( .A(N18), .B(N19), .Y(N71) );
  OR2X8TS C91 ( .A(state_reg[1]), .B(state_reg[0]), .Y(N68) );
  OR2X8TS C90 ( .A(N18), .B(N19), .Y(N67) );
  OR2X8TS C85 ( .A(N100), .B(N95), .Y(N64) );
  OR2X8TS C84 ( .A(N18), .B(state_reg[2]), .Y(N63) );
  OR2X8TS C78 ( .A(N100), .B(state_reg[0]), .Y(N60) );
  OR2X8TS C77 ( .A(N18), .B(state_reg[2]), .Y(N59) );
  OR2X8TS C72 ( .A(N100), .B(N95), .Y(N56) );
  OR2X8TS C71 ( .A(state_reg[3]), .B(N19), .Y(N55) );
  OR2X8TS C65 ( .A(state_reg[1]), .B(N95), .Y(N52) );
  OR2X8TS C64 ( .A(N18), .B(state_reg[2]), .Y(N51) );
  OR2X8TS C59 ( .A(state_reg[1]), .B(state_reg[0]), .Y(N48) );
  OR2X8TS C58 ( .A(N18), .B(state_reg[2]), .Y(N47) );
  OR2X8TS C54 ( .A(N100), .B(state_reg[0]), .Y(N44) );
  OR2X8TS C53 ( .A(state_reg[3]), .B(N19), .Y(N43) );
  OR2X8TS C48 ( .A(state_reg[1]), .B(N95), .Y(N40) );
  OR2X8TS C47 ( .A(state_reg[3]), .B(N19), .Y(N39) );
  OR2X8TS C42 ( .A(state_reg[1]), .B(state_reg[0]), .Y(N36) );
  OR2X8TS C41 ( .A(state_reg[3]), .B(N19), .Y(N35) );
  OR2X8TS C37 ( .A(N100), .B(N95), .Y(N32) );
  OR2X8TS C36 ( .A(state_reg[3]), .B(state_reg[2]), .Y(N31) );
  OR2X8TS C31 ( .A(N100), .B(state_reg[0]), .Y(N28) );
  OR2X8TS C30 ( .A(state_reg[3]), .B(state_reg[2]), .Y(N27) );
  OR2X8TS C26 ( .A(state_reg[1]), .B(N95), .Y(N24) );
  OR2X8TS C25 ( .A(state_reg[3]), .B(state_reg[2]), .Y(N23) );
  AND2X8TS C22 ( .A(N100), .B(N95), .Y(N21) );
  AND2X8TS C21 ( .A(N18), .B(N19), .Y(N20) );
  DFFRX4TS state_reg_reg_0_ ( .D(n29), .CK(clk), .RN(n1), .Q(state_reg[0]), 
        .QN(N95) );
  DFFRX4TS state_reg_reg_2_ ( .D(n26), .CK(clk), .RN(n1), .Q(state_reg[2]), 
        .QN(N19) );
  DFFRX4TS state_reg_reg_1_ ( .D(n27), .CK(clk), .RN(n1), .Q(state_reg[1]), 
        .QN(N100) );
  DFFRX4TS state_reg_reg_3_ ( .D(n28), .CK(clk), .RN(n1), .Q(state_reg[3]), 
        .QN(N18) );
  INVX2TS U3 ( .A(rst), .Y(n1) );
  NAND4BX1TS U4 ( .AN(N66), .B(n2), .C(n3), .D(n4), .Y(state_next[3]) );
  AOI211X1TS U5 ( .A0(N54), .A1(n5), .B0(n6), .C0(n7), .Y(n4) );
  NAND4X1TS U6 ( .A(n8), .B(n9), .C(n10), .D(n11), .Y(state_next[2]) );
  AOI211X1TS U7 ( .A0(N42), .A1(n12), .B0(n7), .C0(load_3_o), .Y(n11) );
  AO21X1TS U8 ( .A0(N30), .A1(zero_flag_i), .B0(load_7_o), .Y(n7) );
  OAI211X1TS U9 ( .A0(norm_iteration_i), .A1(n13), .B0(n14), .C0(n15), .Y(
        state_next[1]) );
  NOR3X1TS U10 ( .A(ctrl_a_o), .B(N62), .C(N58), .Y(n15) );
  NAND4X1TS U11 ( .A(n8), .B(n2), .C(n16), .D(n17), .Y(state_next[0]) );
  AOI211X1TS U12 ( .A0(N30), .A1(n18), .B0(n6), .C0(rst_int), .Y(n17) );
  CLKINVX1TS U13 ( .A(zero_flag_i), .Y(n18) );
  OR2X1TS U14 ( .A(N34), .B(n19), .Y(load_3_o) );
  AOI211X1TS U15 ( .A0(n13), .A1(n16), .B0(n12), .C0(add_overflow_i), .Y(
        left_right_o) );
  NOR2X1TS U16 ( .A(n5), .B(n8), .Y(ctrl_a_o) );
  CLKINVX1TS U17 ( .A(N54), .Y(n8) );
  CLKINVX1TS U18 ( .A(round_i), .Y(n5) );
  OAI21X1TS U19 ( .A0(n10), .A1(n20), .B0(n2), .Y(ctrl_b_o[1]) );
  NOR2BX1TS U20 ( .AN(ctrl_b_load_o), .B(add_overflow_i), .Y(ctrl_b_o[0]) );
  AOI2BB1X1TS U21 ( .A0N(n6), .A1N(load_8_o), .B0(n20), .Y(bit_shift_o) );
  AO21X1TS U22 ( .A0(norm_iteration_i), .A1(N38), .B0(N66), .Y(load_8_o) );
  OAI21X1TS U23 ( .A0(n13), .A1(n12), .B0(n9), .Y(n6) );
  AOI22X1TS U24 ( .A0(ready), .A1(N90), .B0(rst_int), .B1(N82), .Y(N94) );
  OR2X1TS U25 ( .A(N75), .B(N76), .Y(N77) );
  OR2X1TS U26 ( .A(N71), .B(N72), .Y(N73) );
  OR2X1TS U27 ( .A(N67), .B(N68), .Y(N69) );
  OR2X1TS U28 ( .A(N63), .B(N64), .Y(N65) );
  OR2X1TS U29 ( .A(N59), .B(N60), .Y(N61) );
  OR2X1TS U30 ( .A(N55), .B(N56), .Y(N57) );
  OR2X1TS U31 ( .A(N51), .B(N52), .Y(N53) );
  OR2X1TS U32 ( .A(N47), .B(N48), .Y(N49) );
  OR2X1TS U33 ( .A(N43), .B(N44), .Y(N45) );
  OR2X1TS U34 ( .A(N39), .B(N40), .Y(N41) );
  OR2X1TS U35 ( .A(N35), .B(N36), .Y(N37) );
  OR2X1TS U36 ( .A(N31), .B(N32), .Y(N33) );
  OR2X1TS U37 ( .A(N27), .B(N28), .Y(N29) );
  OR2X1TS U38 ( .A(N23), .B(N24), .Y(N25) );
  NAND4X1TS U39 ( .A(n21), .B(n22), .C(n23), .D(n24), .Y(A_S_op_o) );
  NOR3X1TS U40 ( .A(N34), .B(ready), .C(N54), .Y(n24) );
  NOR3X1TS U41 ( .A(ctrl_b_load_o), .B(load_5_o), .C(load_4_o), .Y(n23) );
  NAND2X1TS U42 ( .A(n9), .B(n13), .Y(load_4_o) );
  CLKINVX1TS U43 ( .A(N42), .Y(n13) );
  CLKINVX1TS U44 ( .A(N70), .Y(n9) );
  CLKINVX1TS U45 ( .A(n3), .Y(load_5_o) );
  NOR2X1TS U46 ( .A(N58), .B(ctrl_c_o), .Y(n3) );
  NAND2X1TS U47 ( .A(n2), .B(n10), .Y(ctrl_b_load_o) );
  CLKINVX1TS U48 ( .A(load_6_o), .Y(n10) );
  CLKINVX1TS U49 ( .A(N62), .Y(n2) );
  AOI221X1TS U50 ( .A0(N38), .A1(n12), .B0(n19), .B1(n20), .C0(rst_int), .Y(
        n22) );
  AND2X1TS U51 ( .A(N21), .B(N20), .Y(rst_int) );
  CLKINVX1TS U52 ( .A(add_overflow_i), .Y(n20) );
  NAND2BX1TS U53 ( .AN(N66), .B(n16), .Y(n19) );
  CLKINVX1TS U54 ( .A(N38), .Y(n16) );
  CLKINVX1TS U55 ( .A(norm_iteration_i), .Y(n12) );
  AOI21X1TS U56 ( .A0(N80), .A1(N79), .B0(n25), .Y(n21) );
  CLKINVX1TS U57 ( .A(n14), .Y(n25) );
  NOR3X1TS U58 ( .A(N26), .B(load_7_o), .C(N30), .Y(n14) );
  MX2X6TS U59 ( .A(state_reg[0]), .B(state_next[0]), .S0(N94), .Y(n29) );
  MX2X6TS U60 ( .A(state_reg[3]), .B(state_next[3]), .S0(N94), .Y(n28) );
  MX2X6TS U61 ( .A(state_reg[1]), .B(state_next[1]), .S0(N94), .Y(n27) );
  MX2X6TS U62 ( .A(state_reg[2]), .B(state_next[2]), .S0(N94), .Y(n26) );
endmodule


module RegisterAdd_W1_0 ( clk, rst, load, D, Q );
  input [0:0] D;
  output [0:0] Q;
  input clk, rst, load;
  wire   n1, n2, n3;

  OAI2BB2XLTS U2 ( .B0(n1), .B1(load), .A0N(load), .A1N(D[0]), .Y(n3) );
  INVX2TS U3 ( .A(rst), .Y(n2) );
  DFFRXLTS Q_reg_0_ ( .D(n3), .CK(clk), .RN(n2), .Q(Q[0]), .QN(n1) );
endmodule


module RegisterAdd_W1_7 ( clk, rst, load, D, Q );
  input [0:0] D;
  output [0:0] Q;
  input clk, rst, load;
  wire   n4, n5, n6;

  OAI2BB2XLTS U2 ( .B0(n6), .B1(load), .A0N(load), .A1N(D[0]), .Y(n4) );
  INVX2TS U3 ( .A(rst), .Y(n5) );
  DFFRX2TS Q_reg_0_ ( .D(n4), .CK(clk), .RN(n5), .Q(Q[0]), .QN(n6) );
endmodule


module RegisterAdd_W2 ( clk, rst, load, D, Q );
  input [1:0] D;
  output [1:0] Q;
  input clk, rst, load;
  wire   n1, n2, n3, n4, n5;

  OAI2BB2XLTS U2 ( .B0(n1), .B1(load), .A0N(load), .A1N(D[0]), .Y(n3) );
  OAI2BB2XLTS U3 ( .B0(n2), .B1(load), .A0N(D[1]), .A1N(load), .Y(n5) );
  INVX2TS U4 ( .A(rst), .Y(n4) );
  DFFRXLTS Q_reg_1_ ( .D(n5), .CK(clk), .RN(n4), .Q(Q[1]), .QN(n2) );
  DFFRXLTS Q_reg_0_ ( .D(n3), .CK(clk), .RN(n4), .Q(Q[0]), .QN(n1) );
endmodule


module RegisterAdd_W32_0 ( clk, rst, load, D, Q );
  input [31:0] D;
  output [31:0] Q;
  input clk, rst, load;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76;

  OAI2BB2XLTS U2 ( .B0(n1), .B1(n66), .A0N(n72), .A1N(D[0]), .Y(n33) );
  OAI2BB2XLTS U3 ( .B0(n2), .B1(n66), .A0N(D[1]), .A1N(n72), .Y(n34) );
  OAI2BB2XLTS U4 ( .B0(n3), .B1(n66), .A0N(D[2]), .A1N(n72), .Y(n35) );
  OAI2BB2XLTS U5 ( .B0(n4), .B1(n66), .A0N(D[3]), .A1N(n72), .Y(n36) );
  OAI2BB2XLTS U6 ( .B0(n5), .B1(n66), .A0N(D[4]), .A1N(n71), .Y(n37) );
  OAI2BB2XLTS U7 ( .B0(n6), .B1(n66), .A0N(D[5]), .A1N(n71), .Y(n38) );
  OAI2BB2XLTS U8 ( .B0(n7), .B1(n67), .A0N(D[6]), .A1N(n71), .Y(n39) );
  OAI2BB2XLTS U9 ( .B0(n8), .B1(n66), .A0N(D[7]), .A1N(n71), .Y(n40) );
  OAI2BB2XLTS U10 ( .B0(n9), .B1(n67), .A0N(D[8]), .A1N(n71), .Y(n41) );
  OAI2BB2XLTS U11 ( .B0(n10), .B1(n67), .A0N(D[9]), .A1N(n71), .Y(n42) );
  OAI2BB2XLTS U12 ( .B0(n11), .B1(n67), .A0N(D[10]), .A1N(n71), .Y(n43) );
  OAI2BB2XLTS U13 ( .B0(n12), .B1(n67), .A0N(D[11]), .A1N(n71), .Y(n44) );
  OAI2BB2XLTS U14 ( .B0(n13), .B1(n68), .A0N(D[12]), .A1N(n71), .Y(n45) );
  OAI2BB2XLTS U15 ( .B0(n14), .B1(n67), .A0N(D[13]), .A1N(n71), .Y(n46) );
  OAI2BB2XLTS U16 ( .B0(n15), .B1(n68), .A0N(D[14]), .A1N(n70), .Y(n47) );
  OAI2BB2XLTS U17 ( .B0(n16), .B1(n68), .A0N(D[15]), .A1N(n70), .Y(n48) );
  OAI2BB2XLTS U18 ( .B0(n17), .B1(n68), .A0N(D[16]), .A1N(n70), .Y(n49) );
  OAI2BB2XLTS U19 ( .B0(n18), .B1(n68), .A0N(D[17]), .A1N(n70), .Y(n50) );
  OAI2BB2XLTS U20 ( .B0(n19), .B1(n68), .A0N(D[18]), .A1N(n70), .Y(n51) );
  OAI2BB2XLTS U21 ( .B0(n20), .B1(n68), .A0N(D[19]), .A1N(n70), .Y(n52) );
  OAI2BB2XLTS U22 ( .B0(n21), .B1(n69), .A0N(D[20]), .A1N(n70), .Y(n53) );
  OAI2BB2XLTS U23 ( .B0(n22), .B1(n67), .A0N(D[21]), .A1N(n70), .Y(n54) );
  OAI2BB2XLTS U24 ( .B0(n23), .B1(n69), .A0N(D[22]), .A1N(n69), .Y(n55) );
  OAI2BB2XLTS U25 ( .B0(n24), .B1(n68), .A0N(D[23]), .A1N(n69), .Y(n56) );
  OAI2BB2XLTS U26 ( .B0(n25), .B1(n68), .A0N(D[24]), .A1N(n69), .Y(n57) );
  OAI2BB2XLTS U27 ( .B0(n26), .B1(n68), .A0N(D[25]), .A1N(n70), .Y(n58) );
  OAI2BB2XLTS U28 ( .B0(n27), .B1(n67), .A0N(D[26]), .A1N(n69), .Y(n59) );
  OAI2BB2XLTS U29 ( .B0(n28), .B1(n67), .A0N(D[27]), .A1N(n69), .Y(n60) );
  OAI2BB2XLTS U30 ( .B0(n29), .B1(n67), .A0N(D[28]), .A1N(n69), .Y(n61) );
  OAI2BB2XLTS U31 ( .B0(n30), .B1(n66), .A0N(D[29]), .A1N(n69), .Y(n62) );
  OAI2BB2XLTS U32 ( .B0(n31), .B1(n66), .A0N(D[30]), .A1N(n69), .Y(n63) );
  OAI2BB2XLTS U33 ( .B0(n32), .B1(n66), .A0N(D[31]), .A1N(n70), .Y(n65) );
  INVX2TS U34 ( .A(rst), .Y(n64) );
  DFFRXLTS Q_reg_0_ ( .D(n33), .CK(clk), .RN(n64), .Q(Q[0]), .QN(n1) );
  DFFRXLTS Q_reg_31_ ( .D(n65), .CK(clk), .RN(n64), .Q(Q[31]), .QN(n32) );
  DFFRXLTS Q_reg_30_ ( .D(n63), .CK(clk), .RN(n64), .Q(Q[30]), .QN(n31) );
  DFFRXLTS Q_reg_29_ ( .D(n62), .CK(clk), .RN(n64), .Q(Q[29]), .QN(n30) );
  DFFRXLTS Q_reg_28_ ( .D(n61), .CK(clk), .RN(n64), .Q(Q[28]), .QN(n29) );
  DFFRXLTS Q_reg_27_ ( .D(n60), .CK(clk), .RN(n64), .Q(Q[27]), .QN(n28) );
  DFFRXLTS Q_reg_26_ ( .D(n59), .CK(clk), .RN(n64), .Q(Q[26]), .QN(n27) );
  DFFRXLTS Q_reg_25_ ( .D(n58), .CK(clk), .RN(n64), .Q(Q[25]), .QN(n26) );
  DFFRXLTS Q_reg_24_ ( .D(n57), .CK(clk), .RN(n64), .Q(Q[24]), .QN(n25) );
  DFFRXLTS Q_reg_23_ ( .D(n56), .CK(clk), .RN(n64), .Q(Q[23]), .QN(n24) );
  DFFRXLTS Q_reg_22_ ( .D(n55), .CK(clk), .RN(n64), .Q(Q[22]), .QN(n23) );
  DFFRXLTS Q_reg_21_ ( .D(n54), .CK(clk), .RN(n64), .Q(Q[21]), .QN(n22) );
  DFFRXLTS Q_reg_20_ ( .D(n53), .CK(clk), .RN(n64), .Q(Q[20]), .QN(n21) );
  DFFRXLTS Q_reg_19_ ( .D(n52), .CK(clk), .RN(n64), .Q(Q[19]), .QN(n20) );
  DFFRXLTS Q_reg_18_ ( .D(n51), .CK(clk), .RN(n64), .Q(Q[18]), .QN(n19) );
  DFFRXLTS Q_reg_17_ ( .D(n50), .CK(clk), .RN(n64), .Q(Q[17]), .QN(n18) );
  DFFRXLTS Q_reg_16_ ( .D(n49), .CK(clk), .RN(n64), .Q(Q[16]), .QN(n17) );
  DFFRXLTS Q_reg_15_ ( .D(n48), .CK(clk), .RN(n64), .Q(Q[15]), .QN(n16) );
  DFFRXLTS Q_reg_14_ ( .D(n47), .CK(clk), .RN(n64), .Q(Q[14]), .QN(n15) );
  DFFRXLTS Q_reg_13_ ( .D(n46), .CK(clk), .RN(n64), .Q(Q[13]), .QN(n14) );
  DFFRXLTS Q_reg_12_ ( .D(n45), .CK(clk), .RN(n64), .Q(Q[12]), .QN(n13) );
  DFFRXLTS Q_reg_11_ ( .D(n44), .CK(clk), .RN(n64), .Q(Q[11]), .QN(n12) );
  DFFRXLTS Q_reg_10_ ( .D(n43), .CK(clk), .RN(n64), .Q(Q[10]), .QN(n11) );
  DFFRXLTS Q_reg_9_ ( .D(n42), .CK(clk), .RN(n64), .Q(Q[9]), .QN(n10) );
  DFFRXLTS Q_reg_8_ ( .D(n41), .CK(clk), .RN(n64), .Q(Q[8]), .QN(n9) );
  DFFRXLTS Q_reg_7_ ( .D(n40), .CK(clk), .RN(n64), .Q(Q[7]), .QN(n8) );
  DFFRXLTS Q_reg_6_ ( .D(n39), .CK(clk), .RN(n64), .Q(Q[6]), .QN(n7) );
  DFFRXLTS Q_reg_5_ ( .D(n38), .CK(clk), .RN(n64), .Q(Q[5]), .QN(n6) );
  DFFRXLTS Q_reg_4_ ( .D(n37), .CK(clk), .RN(n64), .Q(Q[4]), .QN(n5) );
  DFFRXLTS Q_reg_3_ ( .D(n36), .CK(clk), .RN(n64), .Q(Q[3]), .QN(n4) );
  DFFRXLTS Q_reg_2_ ( .D(n35), .CK(clk), .RN(n64), .Q(Q[2]), .QN(n3) );
  DFFRXLTS Q_reg_1_ ( .D(n34), .CK(clk), .RN(n64), .Q(Q[1]), .QN(n2) );
  BUFX20TS U35 ( .A(n76), .Y(n66) );
  BUFX20TS U36 ( .A(n75), .Y(n67) );
  BUFX20TS U37 ( .A(n75), .Y(n68) );
  BUFX20TS U38 ( .A(n74), .Y(n69) );
  BUFX20TS U39 ( .A(n74), .Y(n70) );
  BUFX20TS U40 ( .A(n73), .Y(n71) );
  BUFX20TS U41 ( .A(n73), .Y(n72) );
  CLKBUFX20TS U42 ( .A(load), .Y(n73) );
  CLKBUFX20TS U43 ( .A(load), .Y(n74) );
  CLKBUFX20TS U44 ( .A(load), .Y(n75) );
  CLKBUFX20TS U45 ( .A(load), .Y(n76) );
endmodule


module RegisterAdd_W32_2 ( clk, rst, load, D, Q );
  input [31:0] D;
  output [31:0] Q;
  input clk, rst, load;
  wire   n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79,
         n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93,
         n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105,
         n106, n107, n108, n109, n110, n111, n112, n113, n114, n115, n116,
         n117, n118, n119, n120, n121, n122, n123, n124, n125, n126, n127,
         n128, n129, n130, n131, n132, n133, n134, n135, n136, n137, n138,
         n139, n140, n141;

  OAI2BB2XLTS U2 ( .B0(n141), .B1(n66), .A0N(n72), .A1N(D[0]), .Y(n109) );
  OAI2BB2XLTS U3 ( .B0(n140), .B1(n66), .A0N(D[1]), .A1N(n72), .Y(n108) );
  OAI2BB2XLTS U4 ( .B0(n139), .B1(n66), .A0N(D[2]), .A1N(n72), .Y(n107) );
  OAI2BB2XLTS U5 ( .B0(n138), .B1(n66), .A0N(D[3]), .A1N(n72), .Y(n106) );
  OAI2BB2XLTS U6 ( .B0(n137), .B1(n66), .A0N(D[4]), .A1N(n71), .Y(n105) );
  OAI2BB2XLTS U7 ( .B0(n136), .B1(n66), .A0N(D[5]), .A1N(n71), .Y(n104) );
  OAI2BB2XLTS U8 ( .B0(n135), .B1(n67), .A0N(D[6]), .A1N(n71), .Y(n103) );
  OAI2BB2XLTS U9 ( .B0(n134), .B1(n66), .A0N(D[7]), .A1N(n71), .Y(n102) );
  OAI2BB2XLTS U10 ( .B0(n133), .B1(n67), .A0N(D[8]), .A1N(n71), .Y(n101) );
  OAI2BB2XLTS U11 ( .B0(n132), .B1(n67), .A0N(D[9]), .A1N(n71), .Y(n100) );
  OAI2BB2XLTS U12 ( .B0(n131), .B1(n67), .A0N(D[10]), .A1N(n71), .Y(n99) );
  OAI2BB2XLTS U13 ( .B0(n130), .B1(n67), .A0N(D[11]), .A1N(n71), .Y(n98) );
  OAI2BB2XLTS U14 ( .B0(n129), .B1(n68), .A0N(D[12]), .A1N(n71), .Y(n97) );
  OAI2BB2XLTS U15 ( .B0(n128), .B1(n67), .A0N(D[13]), .A1N(n71), .Y(n96) );
  OAI2BB2XLTS U16 ( .B0(n127), .B1(n68), .A0N(D[14]), .A1N(n70), .Y(n95) );
  OAI2BB2XLTS U17 ( .B0(n126), .B1(n68), .A0N(D[15]), .A1N(n70), .Y(n94) );
  OAI2BB2XLTS U18 ( .B0(n125), .B1(n68), .A0N(D[16]), .A1N(n70), .Y(n93) );
  OAI2BB2XLTS U19 ( .B0(n124), .B1(n68), .A0N(D[17]), .A1N(n70), .Y(n92) );
  OAI2BB2XLTS U20 ( .B0(n123), .B1(n68), .A0N(D[18]), .A1N(n70), .Y(n91) );
  OAI2BB2XLTS U21 ( .B0(n122), .B1(n68), .A0N(D[19]), .A1N(n70), .Y(n90) );
  OAI2BB2XLTS U22 ( .B0(n121), .B1(n69), .A0N(D[20]), .A1N(n70), .Y(n89) );
  OAI2BB2XLTS U23 ( .B0(n120), .B1(n67), .A0N(D[21]), .A1N(n70), .Y(n88) );
  OAI2BB2XLTS U24 ( .B0(n119), .B1(n69), .A0N(D[22]), .A1N(n69), .Y(n87) );
  OAI2BB2XLTS U25 ( .B0(n118), .B1(n68), .A0N(D[23]), .A1N(n69), .Y(n86) );
  OAI2BB2XLTS U26 ( .B0(n117), .B1(n68), .A0N(D[24]), .A1N(n69), .Y(n85) );
  OAI2BB2XLTS U27 ( .B0(n116), .B1(n68), .A0N(D[25]), .A1N(n70), .Y(n84) );
  OAI2BB2XLTS U28 ( .B0(n115), .B1(n67), .A0N(D[26]), .A1N(n69), .Y(n83) );
  OAI2BB2XLTS U29 ( .B0(n114), .B1(n67), .A0N(D[27]), .A1N(n69), .Y(n82) );
  OAI2BB2XLTS U30 ( .B0(n113), .B1(n67), .A0N(D[28]), .A1N(n69), .Y(n81) );
  OAI2BB2XLTS U31 ( .B0(n112), .B1(n66), .A0N(D[29]), .A1N(n69), .Y(n80) );
  OAI2BB2XLTS U32 ( .B0(n111), .B1(n66), .A0N(D[30]), .A1N(n69), .Y(n79) );
  OAI2BB2XLTS U33 ( .B0(n110), .B1(n66), .A0N(D[31]), .A1N(n70), .Y(n77) );
  INVX2TS U34 ( .A(rst), .Y(n78) );
  DFFRX2TS Q_reg_0_ ( .D(n109), .CK(clk), .RN(n78), .Q(Q[0]), .QN(n141) );
  DFFRX2TS Q_reg_31_ ( .D(n77), .CK(clk), .RN(n78), .Q(Q[31]), .QN(n110) );
  DFFRX2TS Q_reg_30_ ( .D(n79), .CK(clk), .RN(n78), .Q(Q[30]), .QN(n111) );
  DFFRX2TS Q_reg_29_ ( .D(n80), .CK(clk), .RN(n78), .Q(Q[29]), .QN(n112) );
  DFFRX2TS Q_reg_28_ ( .D(n81), .CK(clk), .RN(n78), .Q(Q[28]), .QN(n113) );
  DFFRX2TS Q_reg_27_ ( .D(n82), .CK(clk), .RN(n78), .Q(Q[27]), .QN(n114) );
  DFFRX2TS Q_reg_26_ ( .D(n83), .CK(clk), .RN(n78), .Q(Q[26]), .QN(n115) );
  DFFRX2TS Q_reg_25_ ( .D(n84), .CK(clk), .RN(n78), .Q(Q[25]), .QN(n116) );
  DFFRX2TS Q_reg_24_ ( .D(n85), .CK(clk), .RN(n78), .Q(Q[24]), .QN(n117) );
  DFFRX2TS Q_reg_23_ ( .D(n86), .CK(clk), .RN(n78), .Q(Q[23]), .QN(n118) );
  DFFRX2TS Q_reg_22_ ( .D(n87), .CK(clk), .RN(n78), .Q(Q[22]), .QN(n119) );
  DFFRX2TS Q_reg_21_ ( .D(n88), .CK(clk), .RN(n78), .Q(Q[21]), .QN(n120) );
  DFFRX2TS Q_reg_20_ ( .D(n89), .CK(clk), .RN(n78), .Q(Q[20]), .QN(n121) );
  DFFRX2TS Q_reg_19_ ( .D(n90), .CK(clk), .RN(n78), .Q(Q[19]), .QN(n122) );
  DFFRX2TS Q_reg_18_ ( .D(n91), .CK(clk), .RN(n78), .Q(Q[18]), .QN(n123) );
  DFFRX2TS Q_reg_17_ ( .D(n92), .CK(clk), .RN(n78), .Q(Q[17]), .QN(n124) );
  DFFRX2TS Q_reg_16_ ( .D(n93), .CK(clk), .RN(n78), .Q(Q[16]), .QN(n125) );
  DFFRX2TS Q_reg_15_ ( .D(n94), .CK(clk), .RN(n78), .Q(Q[15]), .QN(n126) );
  DFFRX2TS Q_reg_14_ ( .D(n95), .CK(clk), .RN(n78), .Q(Q[14]), .QN(n127) );
  DFFRX2TS Q_reg_13_ ( .D(n96), .CK(clk), .RN(n78), .Q(Q[13]), .QN(n128) );
  DFFRX2TS Q_reg_12_ ( .D(n97), .CK(clk), .RN(n78), .Q(Q[12]), .QN(n129) );
  DFFRX2TS Q_reg_11_ ( .D(n98), .CK(clk), .RN(n78), .Q(Q[11]), .QN(n130) );
  DFFRX2TS Q_reg_10_ ( .D(n99), .CK(clk), .RN(n78), .Q(Q[10]), .QN(n131) );
  DFFRX2TS Q_reg_9_ ( .D(n100), .CK(clk), .RN(n78), .Q(Q[9]), .QN(n132) );
  DFFRX2TS Q_reg_8_ ( .D(n101), .CK(clk), .RN(n78), .Q(Q[8]), .QN(n133) );
  DFFRX2TS Q_reg_7_ ( .D(n102), .CK(clk), .RN(n78), .Q(Q[7]), .QN(n134) );
  DFFRX2TS Q_reg_6_ ( .D(n103), .CK(clk), .RN(n78), .Q(Q[6]), .QN(n135) );
  DFFRX2TS Q_reg_5_ ( .D(n104), .CK(clk), .RN(n78), .Q(Q[5]), .QN(n136) );
  DFFRX2TS Q_reg_4_ ( .D(n105), .CK(clk), .RN(n78), .Q(Q[4]), .QN(n137) );
  DFFRX2TS Q_reg_3_ ( .D(n106), .CK(clk), .RN(n78), .Q(Q[3]), .QN(n138) );
  DFFRX2TS Q_reg_2_ ( .D(n107), .CK(clk), .RN(n78), .Q(Q[2]), .QN(n139) );
  DFFRX2TS Q_reg_1_ ( .D(n108), .CK(clk), .RN(n78), .Q(Q[1]), .QN(n140) );
  BUFX20TS U35 ( .A(n76), .Y(n66) );
  BUFX20TS U36 ( .A(n75), .Y(n67) );
  BUFX20TS U37 ( .A(n75), .Y(n68) );
  BUFX20TS U38 ( .A(n74), .Y(n69) );
  BUFX20TS U39 ( .A(n74), .Y(n70) );
  BUFX20TS U40 ( .A(n73), .Y(n71) );
  BUFX20TS U41 ( .A(n73), .Y(n72) );
  CLKBUFX20TS U42 ( .A(load), .Y(n73) );
  CLKBUFX20TS U43 ( .A(load), .Y(n74) );
  CLKBUFX20TS U44 ( .A(load), .Y(n75) );
  CLKBUFX20TS U45 ( .A(load), .Y(n76) );
endmodule


module RegisterAdd_W1_5 ( clk, rst, load, D, Q );
  input [0:0] D;
  output [0:0] Q;
  input clk, rst, load;
  wire   n4, n5, n6;

  OAI2BB2XLTS U2 ( .B0(n6), .B1(load), .A0N(load), .A1N(D[0]), .Y(n4) );
  INVX2TS U3 ( .A(rst), .Y(n5) );
  DFFRX2TS Q_reg_0_ ( .D(n4), .CK(clk), .RN(n5), .Q(Q[0]), .QN(n6) );
endmodule


module Comparator_W31 ( Data_X_i, Data_Y_i, gtXY_o, eqXY_o );
  input [30:0] Data_X_i;
  input [30:0] Data_Y_i;
  output gtXY_o, eqXY_o;
  wire   N0, N1, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14,
         n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42,
         n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56,
         n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70,
         n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84,
         n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98,
         n99, n100, n101, n102, n103, n104, n105, n106;

  BUFX16TS B_1 ( .A(N1), .Y(eqXY_o) );
  BUFX16TS B_0 ( .A(N0), .Y(gtXY_o) );
  CLKINVX1TS U1 ( .A(Data_Y_i[1]), .Y(n49) );
  XOR2X1TS U2 ( .A(Data_X_i[1]), .B(n49), .Y(n51) );
  XNOR2X1TS U3 ( .A(Data_X_i[2]), .B(Data_Y_i[2]), .Y(n1) );
  CLKINVX1TS U4 ( .A(Data_Y_i[3]), .Y(n52) );
  XOR2X1TS U5 ( .A(Data_X_i[3]), .B(n52), .Y(n53) );
  NAND2X1TS U6 ( .A(n1), .B(n53), .Y(n56) );
  XNOR2X1TS U7 ( .A(Data_X_i[8]), .B(Data_Y_i[8]), .Y(n5) );
  XNOR2X1TS U8 ( .A(Data_X_i[10]), .B(Data_Y_i[10]), .Y(n2) );
  XOR2X1TS U9 ( .A(Data_X_i[11]), .B(Data_Y_i[11]), .Y(n21) );
  NOR2BX1TS U10 ( .AN(n2), .B(n21), .Y(n27) );
  XOR2X1TS U11 ( .A(Data_X_i[9]), .B(Data_Y_i[9]), .Y(n24) );
  XOR2X1TS U12 ( .A(Data_X_i[13]), .B(Data_Y_i[13]), .Y(n33) );
  XNOR2X1TS U13 ( .A(Data_X_i[14]), .B(Data_Y_i[14]), .Y(n3) );
  XOR2X1TS U14 ( .A(Data_X_i[15]), .B(Data_Y_i[15]), .Y(n30) );
  NOR2BX1TS U15 ( .AN(n3), .B(n30), .Y(n36) );
  XNOR2X1TS U16 ( .A(Data_X_i[12]), .B(Data_Y_i[12]), .Y(n4) );
  NAND3BX1TS U17 ( .AN(n33), .B(n36), .C(n4), .Y(n39) );
  NOR4BBX1TS U18 ( .AN(n5), .BN(n27), .C(n24), .D(n39), .Y(n59) );
  XNOR2X1TS U19 ( .A(Data_X_i[0]), .B(Data_Y_i[0]), .Y(n6) );
  NAND3BX1TS U20 ( .AN(n56), .B(n59), .C(n6), .Y(n18) );
  XNOR2X1TS U21 ( .A(Data_X_i[18]), .B(Data_Y_i[18]), .Y(n7) );
  XNOR2X1TS U22 ( .A(Data_X_i[19]), .B(Data_Y_i[19]), .Y(n95) );
  NAND2X1TS U23 ( .A(n7), .B(n95), .Y(n97) );
  XNOR2X1TS U24 ( .A(Data_X_i[16]), .B(Data_Y_i[16]), .Y(n15) );
  XNOR2X1TS U25 ( .A(Data_X_i[22]), .B(Data_Y_i[22]), .Y(n8) );
  XNOR2X1TS U26 ( .A(Data_X_i[23]), .B(Data_Y_i[23]), .Y(n86) );
  NAND2X1TS U27 ( .A(n8), .B(n86), .Y(n87) );
  XNOR2X1TS U28 ( .A(Data_X_i[21]), .B(Data_Y_i[21]), .Y(n82) );
  XNOR2X1TS U29 ( .A(Data_X_i[20]), .B(Data_Y_i[20]), .Y(n9) );
  NAND3BX1TS U30 ( .AN(n87), .B(n82), .C(n9), .Y(n96) );
  CLKINVX1TS U31 ( .A(n96), .Y(n13) );
  XNOR2X1TS U32 ( .A(Data_X_i[24]), .B(Data_Y_i[24]), .Y(n12) );
  XNOR2X1TS U33 ( .A(Data_X_i[26]), .B(Data_Y_i[26]), .Y(n10) );
  XOR2X1TS U34 ( .A(Data_X_i[27]), .B(Data_Y_i[27]), .Y(n65) );
  NOR2BX1TS U35 ( .AN(n10), .B(n65), .Y(n71) );
  XOR2X1TS U36 ( .A(Data_X_i[25]), .B(Data_Y_i[25]), .Y(n68) );
  XOR2X1TS U37 ( .A(Data_X_i[29]), .B(Data_Y_i[29]), .Y(n74) );
  XNOR2X1TS U38 ( .A(Data_X_i[30]), .B(Data_Y_i[30]), .Y(n75) );
  XNOR2X1TS U39 ( .A(Data_X_i[28]), .B(Data_Y_i[28]), .Y(n11) );
  NAND3BX1TS U40 ( .AN(n74), .B(n75), .C(n11), .Y(n80) );
  NOR4BBX1TS U41 ( .AN(n12), .BN(n71), .C(n68), .D(n80), .Y(n100) );
  CLKINVX1TS U42 ( .A(Data_Y_i[17]), .Y(n90) );
  XOR2X1TS U43 ( .A(Data_X_i[17]), .B(n90), .Y(n91) );
  AND3X1TS U44 ( .A(n13), .B(n100), .C(n91), .Y(n14) );
  NAND3BX1TS U45 ( .AN(n97), .B(n15), .C(n14), .Y(n106) );
  XNOR2X1TS U46 ( .A(Data_X_i[6]), .B(Data_Y_i[6]), .Y(n16) );
  CLKINVX1TS U47 ( .A(Data_Y_i[7]), .Y(n43) );
  XOR2X1TS U48 ( .A(Data_X_i[7]), .B(n43), .Y(n44) );
  NAND2X1TS U49 ( .A(n16), .B(n44), .Y(n46) );
  XNOR2X1TS U50 ( .A(Data_X_i[5]), .B(Data_Y_i[5]), .Y(n42) );
  XNOR2X1TS U51 ( .A(Data_X_i[4]), .B(Data_Y_i[4]), .Y(n17) );
  NAND3BX1TS U52 ( .AN(n46), .B(n42), .C(n17), .Y(n55) );
  NOR4BX1TS U53 ( .AN(n51), .B(n18), .C(n106), .D(n55), .Y(N1) );
  CLKINVX1TS U54 ( .A(Data_X_i[10]), .Y(n20) );
  CLKINVX1TS U55 ( .A(Data_X_i[11]), .Y(n19) );
  OAI32X1TS U56 ( .A0(n21), .A1(Data_Y_i[10]), .A2(n20), .B0(Data_Y_i[11]), 
        .B1(n19), .Y(n26) );
  CLKINVX1TS U57 ( .A(Data_X_i[8]), .Y(n23) );
  CLKINVX1TS U58 ( .A(Data_X_i[9]), .Y(n22) );
  OAI32X1TS U59 ( .A0(n24), .A1(Data_Y_i[8]), .A2(n23), .B0(Data_Y_i[9]), .B1(
        n22), .Y(n25) );
  OAI22X1TS U60 ( .A0(n27), .A1(n26), .B0(n26), .B1(n25), .Y(n38) );
  CLKINVX1TS U61 ( .A(Data_X_i[14]), .Y(n29) );
  CLKINVX1TS U62 ( .A(Data_X_i[15]), .Y(n28) );
  OAI32X1TS U63 ( .A0(n30), .A1(Data_Y_i[14]), .A2(n29), .B0(Data_Y_i[15]), 
        .B1(n28), .Y(n35) );
  CLKINVX1TS U64 ( .A(Data_X_i[12]), .Y(n32) );
  CLKINVX1TS U65 ( .A(Data_X_i[13]), .Y(n31) );
  OAI32X1TS U66 ( .A0(n33), .A1(Data_Y_i[12]), .A2(n32), .B0(Data_Y_i[13]), 
        .B1(n31), .Y(n34) );
  OAI22X1TS U67 ( .A0(n36), .A1(n35), .B0(n35), .B1(n34), .Y(n37) );
  OAI21X1TS U68 ( .A0(n39), .A1(n38), .B0(n37), .Y(n62) );
  CLKINVX1TS U69 ( .A(Data_Y_i[4]), .Y(n41) );
  CLKINVX1TS U70 ( .A(Data_Y_i[5]), .Y(n40) );
  AOI32X1TS U71 ( .A0(n42), .A1(n41), .A2(Data_X_i[4]), .B0(Data_X_i[5]), .B1(
        n40), .Y(n48) );
  CLKINVX1TS U72 ( .A(Data_Y_i[6]), .Y(n45) );
  AOI32X1TS U73 ( .A0(Data_X_i[6]), .A1(n45), .A2(n44), .B0(n43), .B1(
        Data_X_i[7]), .Y(n47) );
  AOI22X1TS U74 ( .A0(n48), .A1(n47), .B0(n47), .B1(n46), .Y(n61) );
  CLKINVX1TS U75 ( .A(Data_Y_i[0]), .Y(n50) );
  AOI32X1TS U76 ( .A0(n51), .A1(n50), .A2(Data_X_i[0]), .B0(Data_X_i[1]), .B1(
        n49), .Y(n58) );
  CLKINVX1TS U77 ( .A(Data_Y_i[2]), .Y(n54) );
  AOI32X1TS U78 ( .A0(Data_X_i[2]), .A1(n54), .A2(n53), .B0(n52), .B1(
        Data_X_i[3]), .Y(n57) );
  AOI221X1TS U79 ( .A0(n58), .A1(n57), .B0(n57), .B1(n56), .C0(n55), .Y(n60)
         );
  OAI32X1TS U80 ( .A0(n62), .A1(n61), .A2(n60), .B0(n59), .B1(n62), .Y(n105)
         );
  CLKINVX1TS U81 ( .A(Data_X_i[26]), .Y(n64) );
  CLKINVX1TS U82 ( .A(Data_X_i[27]), .Y(n63) );
  OAI32X1TS U83 ( .A0(n65), .A1(Data_Y_i[26]), .A2(n64), .B0(Data_Y_i[27]), 
        .B1(n63), .Y(n70) );
  CLKINVX1TS U84 ( .A(Data_X_i[24]), .Y(n67) );
  CLKINVX1TS U85 ( .A(Data_X_i[25]), .Y(n66) );
  OAI32X1TS U86 ( .A0(n68), .A1(Data_Y_i[24]), .A2(n67), .B0(Data_Y_i[25]), 
        .B1(n66), .Y(n69) );
  OAI22X1TS U87 ( .A0(n71), .A1(n70), .B0(n70), .B1(n69), .Y(n79) );
  NOR2BX1TS U88 ( .AN(Data_X_i[30]), .B(Data_Y_i[30]), .Y(n77) );
  CLKINVX1TS U89 ( .A(Data_X_i[28]), .Y(n73) );
  CLKINVX1TS U90 ( .A(Data_X_i[29]), .Y(n72) );
  OAI32X1TS U91 ( .A0(n74), .A1(Data_Y_i[28]), .A2(n73), .B0(Data_Y_i[29]), 
        .B1(n72), .Y(n76) );
  OAI22X1TS U92 ( .A0(n77), .A1(n76), .B0(n77), .B1(n75), .Y(n78) );
  OAI21X1TS U93 ( .A0(n80), .A1(n79), .B0(n78), .Y(n103) );
  CLKINVX1TS U94 ( .A(Data_Y_i[20]), .Y(n83) );
  CLKINVX1TS U95 ( .A(Data_Y_i[21]), .Y(n81) );
  AOI32X1TS U96 ( .A0(Data_X_i[20]), .A1(n83), .A2(n82), .B0(Data_X_i[21]), 
        .B1(n81), .Y(n89) );
  CLKINVX1TS U97 ( .A(Data_Y_i[22]), .Y(n85) );
  CLKINVX1TS U98 ( .A(Data_Y_i[23]), .Y(n84) );
  AOI32X1TS U99 ( .A0(n86), .A1(n85), .A2(Data_X_i[22]), .B0(n84), .B1(
        Data_X_i[23]), .Y(n88) );
  AOI22X1TS U100 ( .A0(n89), .A1(n88), .B0(n88), .B1(n87), .Y(n102) );
  CLKINVX1TS U101 ( .A(Data_Y_i[16]), .Y(n92) );
  AOI32X1TS U102 ( .A0(Data_X_i[16]), .A1(n92), .A2(n91), .B0(Data_X_i[17]), 
        .B1(n90), .Y(n99) );
  CLKINVX1TS U103 ( .A(Data_Y_i[18]), .Y(n94) );
  CLKINVX1TS U104 ( .A(Data_Y_i[19]), .Y(n93) );
  AOI32X1TS U105 ( .A0(n95), .A1(n94), .A2(Data_X_i[18]), .B0(n93), .B1(
        Data_X_i[19]), .Y(n98) );
  AOI221X1TS U106 ( .A0(n99), .A1(n98), .B0(n98), .B1(n97), .C0(n96), .Y(n101)
         );
  OAI32X1TS U107 ( .A0(n103), .A1(n102), .A2(n101), .B0(n100), .B1(n103), .Y(
        n104) );
  OAI21X1TS U108 ( .A0(n106), .A1(n105), .B0(n104), .Y(N0) );
endmodule


module xor_tri_W32 ( A_i, B_i, C_i, Z_o );
  input A_i, B_i, C_i;
  output Z_o;
  wire   N0;

  CLKXOR2X8TS C8 ( .A(A_i), .B(B_i), .Y(N0) );
  CLKXOR2X8TS C7 ( .A(N0), .B(C_i), .Y(Z_o) );
endmodule


module sgn_result ( Add_Subt_i, sgn_X_i, sgn_Y_i, gtXY_i, eqXY_i, sgn_result_o
 );
  input Add_Subt_i, sgn_X_i, sgn_Y_i, gtXY_i, eqXY_i;
  output sgn_result_o;
  wire   N0, N1, N2, N3, N4, N5, N6, N7, N8;

  OR2X8TS C16 ( .A(eqXY_i), .B(gtXY_i), .Y(N6) );
  INVX12TS I_2 ( .A(N6), .Y(N7) );
  OR2X8TS C14 ( .A(sgn_X_i), .B(N7), .Y(N8) );
  INVX12TS I_1 ( .A(sgn_Y_i), .Y(N2) );
  INVX12TS I_0 ( .A(Add_Subt_i), .Y(N1) );
  OR2X8TS C11 ( .A(N1), .B(N2), .Y(N3) );
  OR2X8TS C10 ( .A(Add_Subt_i), .B(sgn_Y_i), .Y(N0) );
  AND2X8TS C9 ( .A(N0), .B(N3), .Y(N4) );
  OR2X8TS C8 ( .A(gtXY_i), .B(N4), .Y(N5) );
  AND2X8TS C7 ( .A(N5), .B(N8), .Y(sgn_result_o) );
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
         n59, n60, n61, n62, n63;

  OAI22X1TS U1 ( .A0(n1), .A1(n2), .B0(select), .B1(n3), .Y(S1_o[9]) );
  OAI22X1TS U2 ( .A0(n2), .A1(n4), .B0(select), .B1(n5), .Y(S1_o[8]) );
  OAI22X1TS U3 ( .A0(n2), .A1(n6), .B0(select), .B1(n7), .Y(S1_o[7]) );
  OAI22X1TS U4 ( .A0(n2), .A1(n8), .B0(select), .B1(n9), .Y(S1_o[6]) );
  OAI22X1TS U5 ( .A0(n2), .A1(n10), .B0(select), .B1(n11), .Y(S1_o[5]) );
  OAI22X1TS U6 ( .A0(n2), .A1(n12), .B0(select), .B1(n13), .Y(S1_o[4]) );
  OAI22X1TS U7 ( .A0(n2), .A1(n14), .B0(select), .B1(n15), .Y(S1_o[3]) );
  OAI22X1TS U8 ( .A0(n2), .A1(n16), .B0(select), .B1(n17), .Y(S1_o[30]) );
  OAI22X1TS U9 ( .A0(n2), .A1(n18), .B0(select), .B1(n19), .Y(S1_o[2]) );
  OAI22X1TS U10 ( .A0(n2), .A1(n20), .B0(select), .B1(n21), .Y(S1_o[29]) );
  OAI22X1TS U11 ( .A0(n2), .A1(n22), .B0(select), .B1(n23), .Y(S1_o[28]) );
  OAI22X1TS U12 ( .A0(n2), .A1(n24), .B0(select), .B1(n25), .Y(S1_o[27]) );
  OAI22X1TS U13 ( .A0(n2), .A1(n26), .B0(select), .B1(n27), .Y(S1_o[26]) );
  OAI22X1TS U14 ( .A0(n2), .A1(n28), .B0(select), .B1(n29), .Y(S1_o[25]) );
  OAI22X1TS U15 ( .A0(n2), .A1(n30), .B0(select), .B1(n31), .Y(S1_o[24]) );
  OAI22X1TS U16 ( .A0(n2), .A1(n32), .B0(select), .B1(n33), .Y(S1_o[23]) );
  OAI22X1TS U17 ( .A0(n2), .A1(n34), .B0(select), .B1(n35), .Y(S1_o[22]) );
  OAI22X1TS U18 ( .A0(n2), .A1(n36), .B0(select), .B1(n37), .Y(S1_o[21]) );
  OAI22X1TS U19 ( .A0(n2), .A1(n38), .B0(select), .B1(n39), .Y(S1_o[20]) );
  OAI22X1TS U20 ( .A0(n2), .A1(n40), .B0(select), .B1(n41), .Y(S1_o[1]) );
  OAI22X1TS U21 ( .A0(n2), .A1(n42), .B0(select), .B1(n43), .Y(S1_o[19]) );
  OAI22X1TS U22 ( .A0(n2), .A1(n44), .B0(select), .B1(n45), .Y(S1_o[18]) );
  OAI22X1TS U23 ( .A0(n2), .A1(n46), .B0(select), .B1(n47), .Y(S1_o[17]) );
  OAI22X1TS U24 ( .A0(n2), .A1(n48), .B0(select), .B1(n49), .Y(S1_o[16]) );
  OAI22X1TS U25 ( .A0(n2), .A1(n50), .B0(select), .B1(n51), .Y(S1_o[15]) );
  OAI22X1TS U26 ( .A0(n2), .A1(n52), .B0(select), .B1(n53), .Y(S1_o[14]) );
  OAI22X1TS U27 ( .A0(n2), .A1(n54), .B0(select), .B1(n55), .Y(S1_o[13]) );
  OAI22X1TS U28 ( .A0(n2), .A1(n56), .B0(select), .B1(n57), .Y(S1_o[12]) );
  OAI22X1TS U29 ( .A0(n2), .A1(n58), .B0(select), .B1(n59), .Y(S1_o[11]) );
  OAI22X1TS U30 ( .A0(n2), .A1(n60), .B0(select), .B1(n61), .Y(S1_o[10]) );
  OAI22X1TS U31 ( .A0(n2), .A1(n62), .B0(select), .B1(n63), .Y(S1_o[0]) );
  OAI22X1TS U32 ( .A0(select), .A1(n1), .B0(n3), .B1(n2), .Y(S0_o[9]) );
  CLKINVX1TS U33 ( .A(D0_i[9]), .Y(n3) );
  CLKINVX1TS U34 ( .A(D1_i[9]), .Y(n1) );
  OAI22X1TS U35 ( .A0(select), .A1(n4), .B0(n2), .B1(n5), .Y(S0_o[8]) );
  CLKINVX1TS U36 ( .A(D0_i[8]), .Y(n5) );
  CLKINVX1TS U37 ( .A(D1_i[8]), .Y(n4) );
  OAI22X1TS U38 ( .A0(select), .A1(n6), .B0(n2), .B1(n7), .Y(S0_o[7]) );
  CLKINVX1TS U39 ( .A(D0_i[7]), .Y(n7) );
  CLKINVX1TS U40 ( .A(D1_i[7]), .Y(n6) );
  OAI22X1TS U41 ( .A0(select), .A1(n8), .B0(n2), .B1(n9), .Y(S0_o[6]) );
  CLKINVX1TS U42 ( .A(D0_i[6]), .Y(n9) );
  CLKINVX1TS U43 ( .A(D1_i[6]), .Y(n8) );
  OAI22X1TS U44 ( .A0(select), .A1(n10), .B0(n2), .B1(n11), .Y(S0_o[5]) );
  CLKINVX1TS U45 ( .A(D0_i[5]), .Y(n11) );
  CLKINVX1TS U46 ( .A(D1_i[5]), .Y(n10) );
  OAI22X1TS U47 ( .A0(select), .A1(n12), .B0(n2), .B1(n13), .Y(S0_o[4]) );
  CLKINVX1TS U48 ( .A(D0_i[4]), .Y(n13) );
  CLKINVX1TS U49 ( .A(D1_i[4]), .Y(n12) );
  OAI22X1TS U50 ( .A0(select), .A1(n14), .B0(n2), .B1(n15), .Y(S0_o[3]) );
  CLKINVX1TS U51 ( .A(D0_i[3]), .Y(n15) );
  CLKINVX1TS U52 ( .A(D1_i[3]), .Y(n14) );
  OAI22X1TS U53 ( .A0(select), .A1(n16), .B0(n2), .B1(n17), .Y(S0_o[30]) );
  CLKINVX1TS U54 ( .A(D0_i[30]), .Y(n17) );
  CLKINVX1TS U55 ( .A(D1_i[30]), .Y(n16) );
  OAI22X1TS U56 ( .A0(select), .A1(n18), .B0(n2), .B1(n19), .Y(S0_o[2]) );
  CLKINVX1TS U57 ( .A(D0_i[2]), .Y(n19) );
  CLKINVX1TS U58 ( .A(D1_i[2]), .Y(n18) );
  OAI22X1TS U59 ( .A0(select), .A1(n20), .B0(n2), .B1(n21), .Y(S0_o[29]) );
  CLKINVX1TS U60 ( .A(D0_i[29]), .Y(n21) );
  CLKINVX1TS U61 ( .A(D1_i[29]), .Y(n20) );
  OAI22X1TS U62 ( .A0(select), .A1(n22), .B0(n2), .B1(n23), .Y(S0_o[28]) );
  CLKINVX1TS U63 ( .A(D0_i[28]), .Y(n23) );
  CLKINVX1TS U64 ( .A(D1_i[28]), .Y(n22) );
  OAI22X1TS U65 ( .A0(select), .A1(n24), .B0(n2), .B1(n25), .Y(S0_o[27]) );
  CLKINVX1TS U66 ( .A(D0_i[27]), .Y(n25) );
  CLKINVX1TS U67 ( .A(D1_i[27]), .Y(n24) );
  OAI22X1TS U68 ( .A0(select), .A1(n26), .B0(n2), .B1(n27), .Y(S0_o[26]) );
  CLKINVX1TS U69 ( .A(D0_i[26]), .Y(n27) );
  CLKINVX1TS U70 ( .A(D1_i[26]), .Y(n26) );
  OAI22X1TS U71 ( .A0(select), .A1(n28), .B0(n2), .B1(n29), .Y(S0_o[25]) );
  CLKINVX1TS U72 ( .A(D0_i[25]), .Y(n29) );
  CLKINVX1TS U73 ( .A(D1_i[25]), .Y(n28) );
  OAI22X1TS U74 ( .A0(select), .A1(n30), .B0(n2), .B1(n31), .Y(S0_o[24]) );
  CLKINVX1TS U75 ( .A(D0_i[24]), .Y(n31) );
  CLKINVX1TS U76 ( .A(D1_i[24]), .Y(n30) );
  OAI22X1TS U77 ( .A0(select), .A1(n32), .B0(n2), .B1(n33), .Y(S0_o[23]) );
  CLKINVX1TS U78 ( .A(D0_i[23]), .Y(n33) );
  CLKINVX1TS U79 ( .A(D1_i[23]), .Y(n32) );
  OAI22X1TS U80 ( .A0(select), .A1(n34), .B0(n2), .B1(n35), .Y(S0_o[22]) );
  CLKINVX1TS U81 ( .A(D0_i[22]), .Y(n35) );
  CLKINVX1TS U82 ( .A(D1_i[22]), .Y(n34) );
  OAI22X1TS U83 ( .A0(select), .A1(n36), .B0(n2), .B1(n37), .Y(S0_o[21]) );
  CLKINVX1TS U84 ( .A(D0_i[21]), .Y(n37) );
  CLKINVX1TS U85 ( .A(D1_i[21]), .Y(n36) );
  OAI22X1TS U86 ( .A0(select), .A1(n38), .B0(n2), .B1(n39), .Y(S0_o[20]) );
  CLKINVX1TS U87 ( .A(D0_i[20]), .Y(n39) );
  CLKINVX1TS U88 ( .A(D1_i[20]), .Y(n38) );
  OAI22X1TS U89 ( .A0(select), .A1(n40), .B0(n2), .B1(n41), .Y(S0_o[1]) );
  CLKINVX1TS U90 ( .A(D0_i[1]), .Y(n41) );
  CLKINVX1TS U91 ( .A(D1_i[1]), .Y(n40) );
  OAI22X1TS U92 ( .A0(select), .A1(n42), .B0(n2), .B1(n43), .Y(S0_o[19]) );
  CLKINVX1TS U93 ( .A(D0_i[19]), .Y(n43) );
  CLKINVX1TS U94 ( .A(D1_i[19]), .Y(n42) );
  OAI22X1TS U95 ( .A0(select), .A1(n44), .B0(n2), .B1(n45), .Y(S0_o[18]) );
  CLKINVX1TS U96 ( .A(D0_i[18]), .Y(n45) );
  CLKINVX1TS U97 ( .A(D1_i[18]), .Y(n44) );
  OAI22X1TS U98 ( .A0(select), .A1(n46), .B0(n2), .B1(n47), .Y(S0_o[17]) );
  CLKINVX1TS U99 ( .A(D0_i[17]), .Y(n47) );
  CLKINVX1TS U100 ( .A(D1_i[17]), .Y(n46) );
  OAI22X1TS U101 ( .A0(select), .A1(n48), .B0(n2), .B1(n49), .Y(S0_o[16]) );
  CLKINVX1TS U102 ( .A(D0_i[16]), .Y(n49) );
  CLKINVX1TS U103 ( .A(D1_i[16]), .Y(n48) );
  OAI22X1TS U104 ( .A0(select), .A1(n50), .B0(n2), .B1(n51), .Y(S0_o[15]) );
  CLKINVX1TS U105 ( .A(D0_i[15]), .Y(n51) );
  CLKINVX1TS U106 ( .A(D1_i[15]), .Y(n50) );
  OAI22X1TS U107 ( .A0(select), .A1(n52), .B0(n2), .B1(n53), .Y(S0_o[14]) );
  CLKINVX1TS U108 ( .A(D0_i[14]), .Y(n53) );
  CLKINVX1TS U109 ( .A(D1_i[14]), .Y(n52) );
  OAI22X1TS U110 ( .A0(select), .A1(n54), .B0(n2), .B1(n55), .Y(S0_o[13]) );
  CLKINVX1TS U111 ( .A(D0_i[13]), .Y(n55) );
  CLKINVX1TS U112 ( .A(D1_i[13]), .Y(n54) );
  OAI22X1TS U113 ( .A0(select), .A1(n56), .B0(n2), .B1(n57), .Y(S0_o[12]) );
  CLKINVX1TS U114 ( .A(D0_i[12]), .Y(n57) );
  CLKINVX1TS U115 ( .A(D1_i[12]), .Y(n56) );
  OAI22X1TS U116 ( .A0(select), .A1(n58), .B0(n2), .B1(n59), .Y(S0_o[11]) );
  CLKINVX1TS U117 ( .A(D0_i[11]), .Y(n59) );
  CLKINVX1TS U118 ( .A(D1_i[11]), .Y(n58) );
  OAI22X1TS U119 ( .A0(select), .A1(n60), .B0(n2), .B1(n61), .Y(S0_o[10]) );
  CLKINVX1TS U120 ( .A(D0_i[10]), .Y(n61) );
  CLKINVX1TS U121 ( .A(D1_i[10]), .Y(n60) );
  OAI22X1TS U122 ( .A0(select), .A1(n62), .B0(n2), .B1(n63), .Y(S0_o[0]) );
  CLKINVX1TS U123 ( .A(D0_i[0]), .Y(n63) );
  CLKINVX1TS U124 ( .A(select), .Y(n2) );
  CLKINVX1TS U125 ( .A(D1_i[0]), .Y(n62) );
endmodule


module RegisterAdd_W31_0 ( clk, rst, load, D, Q );
  input [30:0] D;
  output [30:0] Q;
  input clk, rst, load;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63;

  OAI2BB2XLTS U2 ( .B0(n1), .B1(load), .A0N(load), .A1N(D[0]), .Y(n32) );
  OAI2BB2XLTS U3 ( .B0(n2), .B1(load), .A0N(D[1]), .A1N(load), .Y(n33) );
  OAI2BB2XLTS U4 ( .B0(n3), .B1(load), .A0N(D[2]), .A1N(load), .Y(n34) );
  OAI2BB2XLTS U5 ( .B0(n4), .B1(load), .A0N(D[3]), .A1N(load), .Y(n35) );
  OAI2BB2XLTS U6 ( .B0(n5), .B1(load), .A0N(D[4]), .A1N(load), .Y(n36) );
  OAI2BB2XLTS U7 ( .B0(n6), .B1(load), .A0N(D[5]), .A1N(load), .Y(n37) );
  OAI2BB2XLTS U8 ( .B0(n7), .B1(load), .A0N(D[6]), .A1N(load), .Y(n38) );
  OAI2BB2XLTS U9 ( .B0(n8), .B1(load), .A0N(D[7]), .A1N(load), .Y(n39) );
  OAI2BB2XLTS U10 ( .B0(n9), .B1(load), .A0N(D[8]), .A1N(load), .Y(n40) );
  OAI2BB2XLTS U11 ( .B0(n10), .B1(load), .A0N(D[9]), .A1N(load), .Y(n41) );
  OAI2BB2XLTS U12 ( .B0(n11), .B1(load), .A0N(D[10]), .A1N(load), .Y(n42) );
  OAI2BB2XLTS U13 ( .B0(n12), .B1(load), .A0N(D[11]), .A1N(load), .Y(n43) );
  OAI2BB2XLTS U14 ( .B0(n13), .B1(load), .A0N(D[12]), .A1N(load), .Y(n44) );
  OAI2BB2XLTS U15 ( .B0(n14), .B1(load), .A0N(D[13]), .A1N(load), .Y(n45) );
  OAI2BB2XLTS U16 ( .B0(n15), .B1(load), .A0N(D[14]), .A1N(load), .Y(n46) );
  OAI2BB2XLTS U17 ( .B0(n16), .B1(load), .A0N(D[15]), .A1N(load), .Y(n47) );
  OAI2BB2XLTS U18 ( .B0(n17), .B1(load), .A0N(D[16]), .A1N(load), .Y(n48) );
  OAI2BB2XLTS U19 ( .B0(n18), .B1(load), .A0N(D[17]), .A1N(load), .Y(n49) );
  OAI2BB2XLTS U20 ( .B0(n19), .B1(load), .A0N(D[18]), .A1N(load), .Y(n50) );
  OAI2BB2XLTS U21 ( .B0(n20), .B1(load), .A0N(D[19]), .A1N(load), .Y(n51) );
  OAI2BB2XLTS U22 ( .B0(n21), .B1(load), .A0N(D[20]), .A1N(load), .Y(n52) );
  OAI2BB2XLTS U23 ( .B0(n22), .B1(load), .A0N(D[21]), .A1N(load), .Y(n53) );
  OAI2BB2XLTS U24 ( .B0(n23), .B1(load), .A0N(D[22]), .A1N(load), .Y(n54) );
  OAI2BB2XLTS U25 ( .B0(n24), .B1(load), .A0N(D[23]), .A1N(load), .Y(n55) );
  OAI2BB2XLTS U26 ( .B0(n25), .B1(load), .A0N(D[24]), .A1N(load), .Y(n56) );
  OAI2BB2XLTS U27 ( .B0(n26), .B1(load), .A0N(D[25]), .A1N(load), .Y(n57) );
  OAI2BB2XLTS U28 ( .B0(n27), .B1(load), .A0N(D[26]), .A1N(load), .Y(n58) );
  OAI2BB2XLTS U29 ( .B0(n28), .B1(load), .A0N(D[27]), .A1N(load), .Y(n59) );
  OAI2BB2XLTS U30 ( .B0(n29), .B1(load), .A0N(D[28]), .A1N(load), .Y(n60) );
  OAI2BB2XLTS U31 ( .B0(n30), .B1(load), .A0N(D[29]), .A1N(load), .Y(n61) );
  OAI2BB2XLTS U32 ( .B0(n31), .B1(load), .A0N(D[30]), .A1N(load), .Y(n63) );
  INVX2TS U33 ( .A(rst), .Y(n62) );
  DFFRXLTS Q_reg_9_ ( .D(n41), .CK(clk), .RN(n62), .Q(Q[9]), .QN(n10) );
  DFFRXLTS Q_reg_30_ ( .D(n63), .CK(clk), .RN(n62), .Q(Q[30]), .QN(n31) );
  DFFRXLTS Q_reg_29_ ( .D(n61), .CK(clk), .RN(n62), .Q(Q[29]), .QN(n30) );
  DFFRXLTS Q_reg_28_ ( .D(n60), .CK(clk), .RN(n62), .Q(Q[28]), .QN(n29) );
  DFFRXLTS Q_reg_27_ ( .D(n59), .CK(clk), .RN(n62), .Q(Q[27]), .QN(n28) );
  DFFRXLTS Q_reg_26_ ( .D(n58), .CK(clk), .RN(n62), .Q(Q[26]), .QN(n27) );
  DFFRXLTS Q_reg_25_ ( .D(n57), .CK(clk), .RN(n62), .Q(Q[25]), .QN(n26) );
  DFFRXLTS Q_reg_24_ ( .D(n56), .CK(clk), .RN(n62), .Q(Q[24]), .QN(n25) );
  DFFRXLTS Q_reg_23_ ( .D(n55), .CK(clk), .RN(n62), .Q(Q[23]), .QN(n24) );
  DFFRXLTS Q_reg_22_ ( .D(n54), .CK(clk), .RN(n62), .Q(Q[22]), .QN(n23) );
  DFFRXLTS Q_reg_21_ ( .D(n53), .CK(clk), .RN(n62), .Q(Q[21]), .QN(n22) );
  DFFRXLTS Q_reg_20_ ( .D(n52), .CK(clk), .RN(n62), .Q(Q[20]), .QN(n21) );
  DFFRXLTS Q_reg_19_ ( .D(n51), .CK(clk), .RN(n62), .Q(Q[19]), .QN(n20) );
  DFFRXLTS Q_reg_18_ ( .D(n50), .CK(clk), .RN(n62), .Q(Q[18]), .QN(n19) );
  DFFRXLTS Q_reg_17_ ( .D(n49), .CK(clk), .RN(n62), .Q(Q[17]), .QN(n18) );
  DFFRXLTS Q_reg_16_ ( .D(n48), .CK(clk), .RN(n62), .Q(Q[16]), .QN(n17) );
  DFFRXLTS Q_reg_15_ ( .D(n47), .CK(clk), .RN(n62), .Q(Q[15]), .QN(n16) );
  DFFRXLTS Q_reg_14_ ( .D(n46), .CK(clk), .RN(n62), .Q(Q[14]), .QN(n15) );
  DFFRXLTS Q_reg_13_ ( .D(n45), .CK(clk), .RN(n62), .Q(Q[13]), .QN(n14) );
  DFFRXLTS Q_reg_12_ ( .D(n44), .CK(clk), .RN(n62), .Q(Q[12]), .QN(n13) );
  DFFRXLTS Q_reg_11_ ( .D(n43), .CK(clk), .RN(n62), .Q(Q[11]), .QN(n12) );
  DFFRXLTS Q_reg_10_ ( .D(n42), .CK(clk), .RN(n62), .Q(Q[10]), .QN(n11) );
  DFFRXLTS Q_reg_8_ ( .D(n40), .CK(clk), .RN(n62), .Q(Q[8]), .QN(n9) );
  DFFRXLTS Q_reg_7_ ( .D(n39), .CK(clk), .RN(n62), .Q(Q[7]), .QN(n8) );
  DFFRXLTS Q_reg_6_ ( .D(n38), .CK(clk), .RN(n62), .Q(Q[6]), .QN(n7) );
  DFFRXLTS Q_reg_5_ ( .D(n37), .CK(clk), .RN(n62), .Q(Q[5]), .QN(n6) );
  DFFRXLTS Q_reg_4_ ( .D(n36), .CK(clk), .RN(n62), .Q(Q[4]), .QN(n5) );
  DFFRXLTS Q_reg_3_ ( .D(n35), .CK(clk), .RN(n62), .Q(Q[3]), .QN(n4) );
  DFFRXLTS Q_reg_2_ ( .D(n34), .CK(clk), .RN(n62), .Q(Q[2]), .QN(n3) );
  DFFRXLTS Q_reg_1_ ( .D(n33), .CK(clk), .RN(n62), .Q(Q[1]), .QN(n2) );
  DFFRX1TS Q_reg_0_ ( .D(n32), .CK(clk), .RN(n62), .Q(Q[0]), .QN(n1) );
endmodule


module RegisterAdd_W31_1 ( clk, rst, load, D, Q );
  input [30:0] D;
  output [30:0] Q;
  input clk, rst, load;
  wire   n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77,
         n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91,
         n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104,
         n105, n106, n107, n108, n109, n110, n111, n112, n113, n114, n115,
         n116, n117, n118, n119, n120, n121, n122, n123, n124, n125, n126;

  OAI2BB2XLTS U2 ( .B0(n126), .B1(load), .A0N(load), .A1N(D[0]), .Y(n95) );
  OAI2BB2XLTS U3 ( .B0(n125), .B1(load), .A0N(D[1]), .A1N(load), .Y(n94) );
  OAI2BB2XLTS U4 ( .B0(n124), .B1(load), .A0N(D[2]), .A1N(load), .Y(n93) );
  OAI2BB2XLTS U5 ( .B0(n123), .B1(load), .A0N(D[3]), .A1N(load), .Y(n92) );
  OAI2BB2XLTS U6 ( .B0(n122), .B1(load), .A0N(D[4]), .A1N(load), .Y(n91) );
  OAI2BB2XLTS U7 ( .B0(n121), .B1(load), .A0N(D[5]), .A1N(load), .Y(n90) );
  OAI2BB2XLTS U8 ( .B0(n120), .B1(load), .A0N(D[6]), .A1N(load), .Y(n89) );
  OAI2BB2XLTS U9 ( .B0(n119), .B1(load), .A0N(D[7]), .A1N(load), .Y(n88) );
  OAI2BB2XLTS U10 ( .B0(n118), .B1(load), .A0N(D[8]), .A1N(load), .Y(n87) );
  OAI2BB2XLTS U11 ( .B0(n117), .B1(load), .A0N(D[9]), .A1N(load), .Y(n86) );
  OAI2BB2XLTS U12 ( .B0(n116), .B1(load), .A0N(D[10]), .A1N(load), .Y(n85) );
  OAI2BB2XLTS U13 ( .B0(n115), .B1(load), .A0N(D[11]), .A1N(load), .Y(n84) );
  OAI2BB2XLTS U14 ( .B0(n114), .B1(load), .A0N(D[12]), .A1N(load), .Y(n83) );
  OAI2BB2XLTS U15 ( .B0(n113), .B1(load), .A0N(D[13]), .A1N(load), .Y(n82) );
  OAI2BB2XLTS U16 ( .B0(n112), .B1(load), .A0N(D[14]), .A1N(load), .Y(n81) );
  OAI2BB2XLTS U17 ( .B0(n111), .B1(load), .A0N(D[15]), .A1N(load), .Y(n80) );
  OAI2BB2XLTS U18 ( .B0(n110), .B1(load), .A0N(D[16]), .A1N(load), .Y(n79) );
  OAI2BB2XLTS U19 ( .B0(n109), .B1(load), .A0N(D[17]), .A1N(load), .Y(n78) );
  OAI2BB2XLTS U20 ( .B0(n108), .B1(load), .A0N(D[18]), .A1N(load), .Y(n77) );
  OAI2BB2XLTS U21 ( .B0(n107), .B1(load), .A0N(D[19]), .A1N(load), .Y(n76) );
  OAI2BB2XLTS U22 ( .B0(n106), .B1(load), .A0N(D[20]), .A1N(load), .Y(n75) );
  OAI2BB2XLTS U23 ( .B0(n105), .B1(load), .A0N(D[21]), .A1N(load), .Y(n74) );
  OAI2BB2XLTS U24 ( .B0(n104), .B1(load), .A0N(D[22]), .A1N(load), .Y(n73) );
  OAI2BB2XLTS U25 ( .B0(n103), .B1(load), .A0N(D[23]), .A1N(load), .Y(n72) );
  OAI2BB2XLTS U26 ( .B0(n102), .B1(load), .A0N(D[24]), .A1N(load), .Y(n71) );
  OAI2BB2XLTS U27 ( .B0(n101), .B1(load), .A0N(D[25]), .A1N(load), .Y(n70) );
  OAI2BB2XLTS U28 ( .B0(n100), .B1(load), .A0N(D[26]), .A1N(load), .Y(n69) );
  OAI2BB2XLTS U29 ( .B0(n99), .B1(load), .A0N(D[27]), .A1N(load), .Y(n68) );
  OAI2BB2XLTS U30 ( .B0(n98), .B1(load), .A0N(D[28]), .A1N(load), .Y(n67) );
  OAI2BB2XLTS U31 ( .B0(n97), .B1(load), .A0N(D[29]), .A1N(load), .Y(n66) );
  OAI2BB2XLTS U32 ( .B0(n96), .B1(load), .A0N(D[30]), .A1N(load), .Y(n64) );
  INVX2TS U33 ( .A(rst), .Y(n65) );
  DFFRX2TS Q_reg_9_ ( .D(n86), .CK(clk), .RN(n65), .Q(Q[9]), .QN(n117) );
  DFFRX2TS Q_reg_30_ ( .D(n64), .CK(clk), .RN(n65), .Q(Q[30]), .QN(n96) );
  DFFRX2TS Q_reg_29_ ( .D(n66), .CK(clk), .RN(n65), .Q(Q[29]), .QN(n97) );
  DFFRX2TS Q_reg_28_ ( .D(n67), .CK(clk), .RN(n65), .Q(Q[28]), .QN(n98) );
  DFFRX2TS Q_reg_27_ ( .D(n68), .CK(clk), .RN(n65), .Q(Q[27]), .QN(n99) );
  DFFRX2TS Q_reg_26_ ( .D(n69), .CK(clk), .RN(n65), .Q(Q[26]), .QN(n100) );
  DFFRX2TS Q_reg_25_ ( .D(n70), .CK(clk), .RN(n65), .Q(Q[25]), .QN(n101) );
  DFFRX2TS Q_reg_24_ ( .D(n71), .CK(clk), .RN(n65), .Q(Q[24]), .QN(n102) );
  DFFRX2TS Q_reg_23_ ( .D(n72), .CK(clk), .RN(n65), .Q(Q[23]), .QN(n103) );
  DFFRX2TS Q_reg_22_ ( .D(n73), .CK(clk), .RN(n65), .Q(Q[22]), .QN(n104) );
  DFFRX2TS Q_reg_21_ ( .D(n74), .CK(clk), .RN(n65), .Q(Q[21]), .QN(n105) );
  DFFRX2TS Q_reg_20_ ( .D(n75), .CK(clk), .RN(n65), .Q(Q[20]), .QN(n106) );
  DFFRX2TS Q_reg_19_ ( .D(n76), .CK(clk), .RN(n65), .Q(Q[19]), .QN(n107) );
  DFFRX2TS Q_reg_18_ ( .D(n77), .CK(clk), .RN(n65), .Q(Q[18]), .QN(n108) );
  DFFRX2TS Q_reg_17_ ( .D(n78), .CK(clk), .RN(n65), .Q(Q[17]), .QN(n109) );
  DFFRX2TS Q_reg_16_ ( .D(n79), .CK(clk), .RN(n65), .Q(Q[16]), .QN(n110) );
  DFFRX2TS Q_reg_15_ ( .D(n80), .CK(clk), .RN(n65), .Q(Q[15]), .QN(n111) );
  DFFRX2TS Q_reg_14_ ( .D(n81), .CK(clk), .RN(n65), .Q(Q[14]), .QN(n112) );
  DFFRX2TS Q_reg_13_ ( .D(n82), .CK(clk), .RN(n65), .Q(Q[13]), .QN(n113) );
  DFFRX2TS Q_reg_12_ ( .D(n83), .CK(clk), .RN(n65), .Q(Q[12]), .QN(n114) );
  DFFRX2TS Q_reg_11_ ( .D(n84), .CK(clk), .RN(n65), .Q(Q[11]), .QN(n115) );
  DFFRX2TS Q_reg_10_ ( .D(n85), .CK(clk), .RN(n65), .Q(Q[10]), .QN(n116) );
  DFFRX2TS Q_reg_8_ ( .D(n87), .CK(clk), .RN(n65), .Q(Q[8]), .QN(n118) );
  DFFRX2TS Q_reg_7_ ( .D(n88), .CK(clk), .RN(n65), .Q(Q[7]), .QN(n119) );
  DFFRX2TS Q_reg_6_ ( .D(n89), .CK(clk), .RN(n65), .Q(Q[6]), .QN(n120) );
  DFFRX2TS Q_reg_5_ ( .D(n90), .CK(clk), .RN(n65), .Q(Q[5]), .QN(n121) );
  DFFRX2TS Q_reg_4_ ( .D(n91), .CK(clk), .RN(n65), .Q(Q[4]), .QN(n122) );
  DFFRX2TS Q_reg_3_ ( .D(n92), .CK(clk), .RN(n65), .Q(Q[3]), .QN(n123) );
  DFFRX2TS Q_reg_2_ ( .D(n93), .CK(clk), .RN(n65), .Q(Q[2]), .QN(n124) );
  DFFRX2TS Q_reg_1_ ( .D(n94), .CK(clk), .RN(n65), .Q(Q[1]), .QN(n125) );
  DFFRX2TS Q_reg_0_ ( .D(n95), .CK(clk), .RN(n65), .Q(Q[0]), .QN(n126) );
endmodule


module RegisterAdd_W1_4 ( clk, rst, load, D, Q );
  input [0:0] D;
  output [0:0] Q;
  input clk, rst, load;
  wire   n4, n5, n6;

  OAI2BB2XLTS U2 ( .B0(n6), .B1(load), .A0N(load), .A1N(D[0]), .Y(n4) );
  INVX2TS U3 ( .A(rst), .Y(n5) );
  DFFRX2TS Q_reg_0_ ( .D(n4), .CK(clk), .RN(n5), .Q(Q[0]), .QN(n6) );
endmodule


module Oper_Start_In_W32 ( clk, rst, load_a_i, load_b_i, add_subt_i, Data_X_i, 
        Data_Y_i, DMP_o, DmP_o, zero_flag_o, real_op_o, sign_final_result_o );
  input [31:0] Data_X_i;
  input [31:0] Data_Y_i;
  output [30:0] DMP_o;
  output [30:0] DmP_o;
  input clk, rst, load_a_i, load_b_i, add_subt_i;
  output zero_flag_o, real_op_o, sign_final_result_o;
  wire   intAS, gtXY, eqXY, sign_result;
  wire   [31:0] intDX;
  wire   [31:0] intDY;
  wire   [30:0] intM;
  wire   [30:0] intm;

  AND2X8TS C7 ( .A(real_op_o), .B(eqXY), .Y(zero_flag_o) );
  RegisterAdd_W32_0 XRegister ( .clk(clk), .rst(rst), .load(load_a_i), .D(
        Data_X_i), .Q(intDX) );
  RegisterAdd_W32_2 YRegister ( .clk(clk), .rst(rst), .load(load_a_i), .D(
        Data_Y_i), .Q(intDY) );
  RegisterAdd_W1_5 ASRegister ( .clk(clk), .rst(rst), .load(load_a_i), .D(
        add_subt_i), .Q(intAS) );
  Comparator_W31 Magnitude_Comparator ( .Data_X_i(intDX[30:0]), .Data_Y_i(
        intDY[30:0]), .gtXY_o(gtXY), .eqXY_o(eqXY) );
  xor_tri_W32 Op_verification ( .A_i(intDX[31]), .B_i(intDY[31]), .C_i(intAS), 
        .Z_o(real_op_o) );
  sgn_result result_sign_bit ( .Add_Subt_i(intAS), .sgn_X_i(intDX[31]), 
        .sgn_Y_i(intDY[31]), .gtXY_i(gtXY), .eqXY_i(eqXY), .sgn_result_o(
        sign_result) );
  MultiplexTxT_W31 MuxXY ( .select(gtXY), .D0_i(intDX[30:0]), .D1_i(
        intDY[30:0]), .S0_o(intM), .S1_o(intm) );
  RegisterAdd_W31_0 MRegister ( .clk(clk), .rst(rst), .load(load_b_i), .D(intM), .Q(DMP_o) );
  RegisterAdd_W31_1 mRegister ( .clk(clk), .rst(rst), .load(load_b_i), .D(intm), .Q(DmP_o) );
  RegisterAdd_W1_4 SignRegister ( .clk(clk), .rst(rst), .load(load_b_i), .D(
        sign_result), .Q(sign_final_result_o) );
endmodule


module Multiplexer_AC_W8_0 ( ctrl, D0, D1, S );
  input [7:0] D0;
  input [7:0] D1;
  output [7:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(ctrl), .A1(D1[7]), .B0(D0[7]), .B1(n1), .Y(S[7]) );
  AO22X1TS U2 ( .A0(D1[6]), .A1(ctrl), .B0(D0[6]), .B1(n1), .Y(S[6]) );
  AO22X1TS U3 ( .A0(D1[5]), .A1(ctrl), .B0(D0[5]), .B1(n1), .Y(S[5]) );
  AO22X1TS U4 ( .A0(D1[4]), .A1(ctrl), .B0(D0[4]), .B1(n1), .Y(S[4]) );
  AO22X1TS U5 ( .A0(D1[3]), .A1(ctrl), .B0(D0[3]), .B1(n1), .Y(S[3]) );
  AO22X1TS U6 ( .A0(D1[2]), .A1(ctrl), .B0(D0[2]), .B1(n1), .Y(S[2]) );
  AO22X1TS U7 ( .A0(D1[1]), .A1(ctrl), .B0(D0[1]), .B1(n1), .Y(S[1]) );
  AO22X1TS U8 ( .A0(D1[0]), .A1(ctrl), .B0(D0[0]), .B1(n1), .Y(S[0]) );
  CLKINVX1TS U9 ( .A(ctrl), .Y(n1) );
endmodule


module Mux_3x1_W8 ( ctrl, D0, D1, D2, S );
  input [1:0] ctrl;
  input [7:0] D0;
  input [7:0] D1;
  input [7:0] D2;
  output [7:0] S;
  wire   N7, N8, N9, N10, n1, n2, n3, n4, n5, n6, n7, n8, n9;

  INVX12TS I_3 ( .A(N9), .Y(N10) );
  INVX12TS I_2 ( .A(N7), .Y(N8) );
  OAI2BB1X1TS U2 ( .A0N(N10), .A1N(D2[7]), .B0(n1), .Y(S[7]) );
  AOI22X1TS U3 ( .A0(N8), .A1(D1[7]), .B0(D0[7]), .B1(n2), .Y(n1) );
  OAI2BB1X1TS U4 ( .A0N(D2[6]), .A1N(N10), .B0(n3), .Y(S[6]) );
  AOI22X1TS U5 ( .A0(D0[6]), .A1(n2), .B0(D1[6]), .B1(N8), .Y(n3) );
  OAI2BB1X1TS U6 ( .A0N(D2[5]), .A1N(N10), .B0(n4), .Y(S[5]) );
  AOI22X1TS U7 ( .A0(D0[5]), .A1(n2), .B0(D1[5]), .B1(N8), .Y(n4) );
  OAI2BB1X1TS U8 ( .A0N(D2[4]), .A1N(N10), .B0(n5), .Y(S[4]) );
  AOI22X1TS U9 ( .A0(D0[4]), .A1(n2), .B0(D1[4]), .B1(N8), .Y(n5) );
  OAI2BB1X1TS U10 ( .A0N(D2[3]), .A1N(N10), .B0(n6), .Y(S[3]) );
  AOI22X1TS U11 ( .A0(D0[3]), .A1(n2), .B0(D1[3]), .B1(N8), .Y(n6) );
  OAI2BB1X1TS U12 ( .A0N(D2[2]), .A1N(N10), .B0(n7), .Y(S[2]) );
  AOI22X1TS U13 ( .A0(D0[2]), .A1(n2), .B0(D1[2]), .B1(N8), .Y(n7) );
  OAI2BB1X1TS U14 ( .A0N(D2[1]), .A1N(N10), .B0(n8), .Y(S[1]) );
  AOI22X1TS U15 ( .A0(D0[1]), .A1(n2), .B0(D1[1]), .B1(N8), .Y(n8) );
  OAI2BB1X1TS U16 ( .A0N(D2[0]), .A1N(N10), .B0(n9), .Y(S[0]) );
  AOI22X1TS U17 ( .A0(D0[0]), .A1(n2), .B0(D1[0]), .B1(N8), .Y(n9) );
  NOR2X1TS U18 ( .A(ctrl[0]), .B(ctrl[1]), .Y(n2) );
  NAND2BX1TS U19 ( .AN(ctrl[0]), .B(ctrl[1]), .Y(N9) );
  NAND2BX1TS U20 ( .AN(ctrl[1]), .B(ctrl[0]), .Y(N7) );
endmodule


module add_sub_carry_out_W8_DW01_add_0 ( A, B, CI, SUM, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] SUM;
  input CI;
  output CO;
  wire   n1, n2;
  wire   [7:1] carry;

  ADDFHX4TS U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(SUM[8]), .S(SUM[7])
         );
  ADDFHX4TS U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDFHX4TS U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDFHX4TS U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDFHX4TS U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDFHX4TS U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDFHX4TS U1_1 ( .A(A[1]), .B(B[1]), .CI(carry[1]), .CO(carry[2]), .S(SUM[1]) );
  NOR2X8TS U1 ( .A(n1), .B(n2), .Y(carry[1]) );
  INVX12TS U2 ( .A(A[0]), .Y(n1) );
  INVX12TS U3 ( .A(B[0]), .Y(n2) );
  XNOR2X4TS U4 ( .A(B[0]), .B(n1), .Y(SUM[0]) );
endmodule


module add_sub_carry_out_W8_DW01_sub_0 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2;
  wire   [8:1] carry;
  wire   [7:0] B_not;

  ADDFHX4TS U2_7 ( .A(A[7]), .B(B_not[7]), .CI(carry[7]), .CO(carry[8]), .S(
        DIFF[7]) );
  INVX12TS U1_7 ( .A(B[7]), .Y(B_not[7]) );
  ADDFHX4TS U2_6 ( .A(A[6]), .B(B_not[6]), .CI(carry[6]), .CO(carry[7]), .S(
        DIFF[6]) );
  INVX12TS U1_6 ( .A(B[6]), .Y(B_not[6]) );
  ADDFHX4TS U2_5 ( .A(A[5]), .B(B_not[5]), .CI(carry[5]), .CO(carry[6]), .S(
        DIFF[5]) );
  INVX12TS U1_5 ( .A(B[5]), .Y(B_not[5]) );
  ADDFHX4TS U2_4 ( .A(A[4]), .B(B_not[4]), .CI(carry[4]), .CO(carry[5]), .S(
        DIFF[4]) );
  INVX12TS U1_4 ( .A(B[4]), .Y(B_not[4]) );
  ADDFHX4TS U2_3 ( .A(A[3]), .B(B_not[3]), .CI(carry[3]), .CO(carry[4]), .S(
        DIFF[3]) );
  INVX12TS U1_3 ( .A(B[3]), .Y(B_not[3]) );
  ADDFHX4TS U2_2 ( .A(A[2]), .B(B_not[2]), .CI(carry[2]), .CO(carry[3]), .S(
        DIFF[2]) );
  INVX12TS U1_2 ( .A(B[2]), .Y(B_not[2]) );
  ADDFHX4TS U2_1 ( .A(A[1]), .B(B_not[1]), .CI(carry[1]), .CO(carry[2]), .S(
        DIFF[1]) );
  INVX12TS U1_1 ( .A(B[1]), .Y(B_not[1]) );
  INVX12TS U1_0 ( .A(B[0]), .Y(B_not[0]) );
  NAND2X8TS U1 ( .A(n1), .B(n2), .Y(carry[1]) );
  XNOR2X4TS U2 ( .A(B_not[0]), .B(A[0]), .Y(DIFF[0]) );
  INVX12TS U3 ( .A(B_not[0]), .Y(n1) );
  INVX12TS U4 ( .A(A[0]), .Y(n2) );
  INVX12TS U5 ( .A(carry[8]), .Y(DIFF[8]) );
endmodule


module add_sub_carry_out_W8 ( op_mode, Data_A, Data_B, Data_S );
  input [7:0] Data_A;
  input [7:0] Data_B;
  output [8:0] Data_S;
  input op_mode;
  wire   N3, N4, N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, N15, N16, N17,
         N18, N19, N20, n7;

  AO22X1TS U5 ( .A0(N20), .A1(n7), .B0(op_mode), .B1(N11), .Y(Data_S[8]) );
  AO22X1TS U6 ( .A0(N19), .A1(n7), .B0(N10), .B1(op_mode), .Y(Data_S[7]) );
  AO22X1TS U7 ( .A0(N9), .A1(op_mode), .B0(N18), .B1(n7), .Y(Data_S[6]) );
  AO22X1TS U8 ( .A0(N8), .A1(op_mode), .B0(N17), .B1(n7), .Y(Data_S[5]) );
  AO22X1TS U9 ( .A0(N7), .A1(op_mode), .B0(N16), .B1(n7), .Y(Data_S[4]) );
  AO22X1TS U10 ( .A0(N6), .A1(op_mode), .B0(N15), .B1(n7), .Y(Data_S[3]) );
  AO22X1TS U11 ( .A0(N5), .A1(op_mode), .B0(N14), .B1(n7), .Y(Data_S[2]) );
  AO22X1TS U12 ( .A0(N4), .A1(op_mode), .B0(N13), .B1(n7), .Y(Data_S[1]) );
  AO22X1TS U13 ( .A0(N3), .A1(op_mode), .B0(N12), .B1(n7), .Y(Data_S[0]) );
  CLKINVX1TS U14 ( .A(op_mode), .Y(n7) );
  add_sub_carry_out_W8_DW01_add_0 add_36 ( .A({1'b0, Data_A}), .B({1'b0, 
        Data_B}), .CI(1'b0), .SUM({N20, N19, N18, N17, N16, N15, N14, N13, N12}) );
  add_sub_carry_out_W8_DW01_sub_0 sub_34 ( .A({1'b0, Data_A}), .B({1'b0, 
        Data_B}), .CI(1'b0), .DIFF({N11, N10, N9, N8, N7, N6, N5, N4, N3}) );
endmodule


module Greater_Comparator_W9 ( Data_A, Data_B, gthan );
  input [8:0] Data_A;
  input [8:0] Data_B;
  output gthan;
  wire   N0, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15,
         n16, n17, n18, n19, n20, n21, n22, n23;

  BUFX16TS B_0 ( .A(N0), .Y(gthan) );
  CLKINVX1TS U1 ( .A(Data_B[8]), .Y(n23) );
  CLKINVX1TS U2 ( .A(Data_B[6]), .Y(n13) );
  CLKINVX1TS U3 ( .A(Data_B[7]), .Y(n11) );
  AND2X1TS U4 ( .A(Data_A[7]), .B(n11), .Y(n12) );
  AOI21X1TS U5 ( .A0(n13), .A1(Data_A[6]), .B0(n12), .Y(n19) );
  CLKINVX1TS U6 ( .A(Data_B[1]), .Y(n4) );
  CLKINVX1TS U7 ( .A(Data_B[0]), .Y(n1) );
  AO22X1TS U8 ( .A0(n1), .A1(Data_A[0]), .B0(n4), .B1(Data_A[1]), .Y(n3) );
  CLKINVX1TS U9 ( .A(Data_A[2]), .Y(n6) );
  NAND2BX1TS U10 ( .AN(Data_B[3]), .B(Data_A[3]), .Y(n5) );
  CLKINVX1TS U11 ( .A(Data_A[3]), .Y(n2) );
  AOI32X1TS U12 ( .A0(Data_B[2]), .A1(n6), .A2(n5), .B0(n2), .B1(Data_B[3]), 
        .Y(n8) );
  OAI211X1TS U13 ( .A0(Data_A[1]), .A1(n4), .B0(n3), .C0(n8), .Y(n10) );
  OAI21X1TS U14 ( .A0(Data_B[2]), .A1(n6), .B0(n5), .Y(n7) );
  CLKINVX1TS U15 ( .A(Data_B[4]), .Y(n16) );
  NOR2BX1TS U16 ( .AN(Data_A[5]), .B(Data_B[5]), .Y(n15) );
  AOI221X1TS U17 ( .A0(n8), .A1(n7), .B0(Data_A[4]), .B1(n16), .C0(n15), .Y(n9) );
  NAND3X1TS U18 ( .A(n19), .B(n10), .C(n9), .Y(n21) );
  OAI32X1TS U19 ( .A0(n13), .A1(Data_A[6]), .A2(n12), .B0(Data_A[7]), .B1(n11), 
        .Y(n18) );
  CLKINVX1TS U20 ( .A(Data_B[5]), .Y(n14) );
  OAI32X1TS U21 ( .A0(n16), .A1(Data_A[4]), .A2(n15), .B0(Data_A[5]), .B1(n14), 
        .Y(n17) );
  OAI22X1TS U22 ( .A0(n19), .A1(n18), .B0(n18), .B1(n17), .Y(n20) );
  OAI211X1TS U23 ( .A0(Data_A[8]), .A1(n23), .B0(n21), .C0(n20), .Y(n22) );
  OAI2BB1X1TS U24 ( .A0N(n23), .A1N(Data_A[8]), .B0(n22), .Y(N0) );
endmodule


module Comparator_Less_W9 ( Data_A, Data_B, less );
  input [8:0] Data_A;
  input [8:0] Data_B;
  output less;
  wire   N0, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15,
         n16, n17, n18, n19, n20, n21, n22, n23;

  BUFX16TS B_0 ( .A(N0), .Y(less) );
  CLKINVX1TS U1 ( .A(Data_A[8]), .Y(n23) );
  CLKINVX1TS U2 ( .A(Data_A[6]), .Y(n13) );
  CLKINVX1TS U3 ( .A(Data_A[7]), .Y(n11) );
  AND2X1TS U4 ( .A(Data_B[7]), .B(n11), .Y(n12) );
  AOI21X1TS U5 ( .A0(n13), .A1(Data_B[6]), .B0(n12), .Y(n19) );
  CLKINVX1TS U6 ( .A(Data_A[1]), .Y(n4) );
  CLKINVX1TS U7 ( .A(Data_A[0]), .Y(n1) );
  AO22X1TS U8 ( .A0(n1), .A1(Data_B[0]), .B0(n4), .B1(Data_B[1]), .Y(n3) );
  CLKINVX1TS U9 ( .A(Data_B[2]), .Y(n6) );
  NAND2BX1TS U10 ( .AN(Data_A[3]), .B(Data_B[3]), .Y(n5) );
  CLKINVX1TS U11 ( .A(Data_B[3]), .Y(n2) );
  AOI32X1TS U12 ( .A0(Data_A[2]), .A1(n6), .A2(n5), .B0(n2), .B1(Data_A[3]), 
        .Y(n8) );
  OAI211X1TS U13 ( .A0(Data_B[1]), .A1(n4), .B0(n3), .C0(n8), .Y(n10) );
  OAI21X1TS U14 ( .A0(Data_A[2]), .A1(n6), .B0(n5), .Y(n7) );
  CLKINVX1TS U15 ( .A(Data_A[4]), .Y(n16) );
  NOR2BX1TS U16 ( .AN(Data_B[5]), .B(Data_A[5]), .Y(n15) );
  AOI221X1TS U17 ( .A0(n8), .A1(n7), .B0(Data_B[4]), .B1(n16), .C0(n15), .Y(n9) );
  NAND3X1TS U18 ( .A(n19), .B(n10), .C(n9), .Y(n21) );
  OAI32X1TS U19 ( .A0(n13), .A1(Data_B[6]), .A2(n12), .B0(Data_B[7]), .B1(n11), 
        .Y(n18) );
  CLKINVX1TS U20 ( .A(Data_A[5]), .Y(n14) );
  OAI32X1TS U21 ( .A0(n16), .A1(Data_B[4]), .A2(n15), .B0(Data_B[5]), .B1(n14), 
        .Y(n17) );
  OAI22X1TS U22 ( .A0(n19), .A1(n18), .B0(n18), .B1(n17), .Y(n20) );
  OAI211X1TS U23 ( .A0(Data_B[8]), .A1(n23), .B0(n21), .C0(n20), .Y(n22) );
  OAI2BB1X1TS U24 ( .A0N(n23), .A1N(Data_B[8]), .B0(n22), .Y(N0) );
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
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17;

  OAI2BB2XLTS U2 ( .B0(n1), .B1(load), .A0N(load), .A1N(D[0]), .Y(n9) );
  OAI2BB2XLTS U3 ( .B0(n2), .B1(load), .A0N(D[1]), .A1N(load), .Y(n10) );
  OAI2BB2XLTS U4 ( .B0(n3), .B1(load), .A0N(D[2]), .A1N(load), .Y(n11) );
  OAI2BB2XLTS U5 ( .B0(n4), .B1(load), .A0N(D[3]), .A1N(load), .Y(n12) );
  OAI2BB2XLTS U6 ( .B0(n5), .B1(load), .A0N(D[4]), .A1N(load), .Y(n13) );
  OAI2BB2XLTS U7 ( .B0(n6), .B1(load), .A0N(D[5]), .A1N(load), .Y(n14) );
  OAI2BB2XLTS U8 ( .B0(n7), .B1(load), .A0N(D[6]), .A1N(load), .Y(n15) );
  OAI2BB2XLTS U9 ( .B0(n8), .B1(load), .A0N(D[7]), .A1N(load), .Y(n17) );
  INVX2TS U10 ( .A(rst), .Y(n16) );
  DFFRXLTS Q_reg_0_ ( .D(n9), .CK(clk), .RN(n16), .Q(Q[0]), .QN(n1) );
  DFFRXLTS Q_reg_1_ ( .D(n10), .CK(clk), .RN(n16), .Q(Q[1]), .QN(n2) );
  DFFRXLTS Q_reg_2_ ( .D(n11), .CK(clk), .RN(n16), .Q(Q[2]), .QN(n3) );
  DFFRXLTS Q_reg_6_ ( .D(n15), .CK(clk), .RN(n16), .Q(Q[6]), .QN(n7) );
  DFFRXLTS Q_reg_4_ ( .D(n13), .CK(clk), .RN(n16), .Q(Q[4]), .QN(n5) );
  DFFRXLTS Q_reg_3_ ( .D(n12), .CK(clk), .RN(n16), .Q(Q[3]), .QN(n4) );
  DFFRXLTS Q_reg_5_ ( .D(n14), .CK(clk), .RN(n16), .Q(Q[5]), .QN(n6) );
  DFFRXLTS Q_reg_7_ ( .D(n17), .CK(clk), .RN(n16), .Q(Q[7]), .QN(n8) );
endmodule


module RegisterAdd_W1_3 ( clk, rst, load, D, Q );
  input [0:0] D;
  output [0:0] Q;
  input clk, rst, load;
  wire   n4, n5, n6;

  OAI2BB2XLTS U2 ( .B0(n6), .B1(load), .A0N(load), .A1N(D[0]), .Y(n4) );
  INVX2TS U3 ( .A(rst), .Y(n5) );
  DFFRX2TS Q_reg_0_ ( .D(n4), .CK(clk), .RN(n5), .Q(Q[0]), .QN(n6) );
endmodule


module RegisterAdd_W1_2 ( clk, rst, load, D, Q );
  input [0:0] D;
  output [0:0] Q;
  input clk, rst, load;
  wire   n4, n5, n6;

  OAI2BB2XLTS U2 ( .B0(n6), .B1(load), .A0N(load), .A1N(D[0]), .Y(n4) );
  INVX2TS U3 ( .A(rst), .Y(n5) );
  DFFRX2TS Q_reg_0_ ( .D(n4), .CK(clk), .RN(n5), .Q(Q[0]), .QN(n6) );
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
  RegisterAdd_W1_3 Overflow ( .clk(clk), .rst(rst), .load(load_a_i), .D(
        Overflow_flag), .Q(Overflow_flag_o) );
  RegisterAdd_W1_2 Underflow ( .clk(clk), .rst(rst), .load(load_b_i), .D(
        Underflow_flag), .Q(Underflow_flag_o) );
endmodule


module Mux_3x1_W5 ( ctrl, D0, D1, D2, S );
  input [1:0] ctrl;
  input [4:0] D0;
  input [4:0] D1;
  input [4:0] D2;
  output [4:0] S;
  wire   N7, N8, N9, N10, n1, n2, n3, n4, n5, n6;

  INVX12TS I_3 ( .A(N9), .Y(N10) );
  INVX12TS I_2 ( .A(N7), .Y(N8) );
  OAI2BB1X1TS U2 ( .A0N(N10), .A1N(D2[4]), .B0(n1), .Y(S[4]) );
  AOI22X1TS U3 ( .A0(N8), .A1(D1[4]), .B0(D0[4]), .B1(n2), .Y(n1) );
  OAI2BB1X1TS U4 ( .A0N(D2[3]), .A1N(N10), .B0(n3), .Y(S[3]) );
  AOI22X1TS U5 ( .A0(D0[3]), .A1(n2), .B0(D1[3]), .B1(N8), .Y(n3) );
  OAI2BB1X1TS U6 ( .A0N(D2[2]), .A1N(N10), .B0(n4), .Y(S[2]) );
  AOI22X1TS U7 ( .A0(D0[2]), .A1(n2), .B0(D1[2]), .B1(N8), .Y(n4) );
  OAI2BB1X1TS U8 ( .A0N(D2[1]), .A1N(N10), .B0(n5), .Y(S[1]) );
  AOI22X1TS U9 ( .A0(D0[1]), .A1(n2), .B0(D1[1]), .B1(N8), .Y(n5) );
  OAI2BB1X1TS U10 ( .A0N(D2[0]), .A1N(N10), .B0(n6), .Y(S[0]) );
  AOI22X1TS U11 ( .A0(D0[0]), .A1(n2), .B0(D1[0]), .B1(N8), .Y(n6) );
  NOR2X1TS U12 ( .A(ctrl[0]), .B(ctrl[1]), .Y(n2) );
  NAND2BX1TS U13 ( .AN(ctrl[0]), .B(ctrl[1]), .Y(N9) );
  NAND2BX1TS U14 ( .AN(ctrl[1]), .B(ctrl[0]), .Y(N7) );
endmodule


module Multiplexer_AC_W26_0 ( ctrl, D0, D1, S );
  input [25:0] D0;
  input [25:0] D1;
  output [25:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(ctrl), .A1(D1[9]), .B0(D0[9]), .B1(n1), .Y(S[9]) );
  AO22X1TS U2 ( .A0(D1[8]), .A1(ctrl), .B0(D0[8]), .B1(n1), .Y(S[8]) );
  AO22X1TS U3 ( .A0(D1[7]), .A1(ctrl), .B0(D0[7]), .B1(n1), .Y(S[7]) );
  AO22X1TS U4 ( .A0(D1[6]), .A1(ctrl), .B0(D0[6]), .B1(n1), .Y(S[6]) );
  AO22X1TS U5 ( .A0(D1[5]), .A1(ctrl), .B0(D0[5]), .B1(n1), .Y(S[5]) );
  AO22X1TS U6 ( .A0(D1[4]), .A1(ctrl), .B0(D0[4]), .B1(n1), .Y(S[4]) );
  AO22X1TS U7 ( .A0(D1[3]), .A1(ctrl), .B0(D0[3]), .B1(n1), .Y(S[3]) );
  AO22X1TS U8 ( .A0(D1[2]), .A1(ctrl), .B0(D0[2]), .B1(n1), .Y(S[2]) );
  AO22X1TS U9 ( .A0(D1[25]), .A1(ctrl), .B0(D0[25]), .B1(n1), .Y(S[25]) );
  AO22X1TS U10 ( .A0(D1[24]), .A1(ctrl), .B0(D0[24]), .B1(n1), .Y(S[24]) );
  AO22X1TS U11 ( .A0(D1[23]), .A1(ctrl), .B0(D0[23]), .B1(n1), .Y(S[23]) );
  AO22X1TS U12 ( .A0(D1[22]), .A1(ctrl), .B0(D0[22]), .B1(n1), .Y(S[22]) );
  AO22X1TS U13 ( .A0(D1[21]), .A1(ctrl), .B0(D0[21]), .B1(n1), .Y(S[21]) );
  AO22X1TS U14 ( .A0(D1[20]), .A1(ctrl), .B0(D0[20]), .B1(n1), .Y(S[20]) );
  AO22X1TS U15 ( .A0(D1[1]), .A1(ctrl), .B0(D0[1]), .B1(n1), .Y(S[1]) );
  AO22X1TS U16 ( .A0(D1[19]), .A1(ctrl), .B0(D0[19]), .B1(n1), .Y(S[19]) );
  AO22X1TS U17 ( .A0(D1[18]), .A1(ctrl), .B0(D0[18]), .B1(n1), .Y(S[18]) );
  AO22X1TS U18 ( .A0(D1[17]), .A1(ctrl), .B0(D0[17]), .B1(n1), .Y(S[17]) );
  AO22X1TS U19 ( .A0(D1[16]), .A1(ctrl), .B0(D0[16]), .B1(n1), .Y(S[16]) );
  AO22X1TS U20 ( .A0(D1[15]), .A1(ctrl), .B0(D0[15]), .B1(n1), .Y(S[15]) );
  AO22X1TS U21 ( .A0(D1[14]), .A1(ctrl), .B0(D0[14]), .B1(n1), .Y(S[14]) );
  AO22X1TS U22 ( .A0(D1[13]), .A1(ctrl), .B0(D0[13]), .B1(n1), .Y(S[13]) );
  AO22X1TS U23 ( .A0(D1[12]), .A1(ctrl), .B0(D0[12]), .B1(n1), .Y(S[12]) );
  AO22X1TS U24 ( .A0(D1[11]), .A1(ctrl), .B0(D0[11]), .B1(n1), .Y(S[11]) );
  AO22X1TS U25 ( .A0(D1[10]), .A1(ctrl), .B0(D0[10]), .B1(n1), .Y(S[10]) );
  AO22X1TS U26 ( .A0(D1[0]), .A1(ctrl), .B0(D0[0]), .B1(n1), .Y(S[0]) );
  CLKINVX1TS U27 ( .A(ctrl), .Y(n1) );
endmodule


module Priority_Codec_32 ( Data_Dec_i, Data_Bin_o );
  input [25:0] Data_Dec_i;
  output [4:0] Data_Bin_o;
  wire   N1, N2, N3, N4, N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, N15, N16,
         N17, N18, N19, N20, N21, N22, N23, N24, N25, N26, n1, n2, n3, n4, n5,
         n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34,
         n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48,
         n49, n50, n51, n52, n53, n54, n55;

  INVX12TS I_25 ( .A(Data_Dec_i[0]), .Y(N26) );
  INVX12TS I_24 ( .A(Data_Dec_i[1]), .Y(N25) );
  INVX12TS I_23 ( .A(Data_Dec_i[2]), .Y(N24) );
  INVX12TS I_22 ( .A(Data_Dec_i[3]), .Y(N23) );
  INVX12TS I_21 ( .A(Data_Dec_i[4]), .Y(N22) );
  INVX12TS I_20 ( .A(Data_Dec_i[5]), .Y(N21) );
  INVX12TS I_19 ( .A(Data_Dec_i[6]), .Y(N20) );
  INVX12TS I_18 ( .A(Data_Dec_i[7]), .Y(N19) );
  INVX12TS I_17 ( .A(Data_Dec_i[8]), .Y(N18) );
  INVX12TS I_16 ( .A(Data_Dec_i[9]), .Y(N17) );
  INVX12TS I_15 ( .A(Data_Dec_i[10]), .Y(N16) );
  INVX12TS I_14 ( .A(Data_Dec_i[11]), .Y(N15) );
  INVX12TS I_13 ( .A(Data_Dec_i[12]), .Y(N14) );
  INVX12TS I_12 ( .A(Data_Dec_i[13]), .Y(N13) );
  INVX12TS I_11 ( .A(Data_Dec_i[14]), .Y(N12) );
  INVX12TS I_10 ( .A(Data_Dec_i[15]), .Y(N11) );
  INVX12TS I_9 ( .A(Data_Dec_i[16]), .Y(N10) );
  INVX12TS I_8 ( .A(Data_Dec_i[17]), .Y(N9) );
  INVX12TS I_7 ( .A(Data_Dec_i[18]), .Y(N8) );
  INVX12TS I_6 ( .A(Data_Dec_i[19]), .Y(N7) );
  INVX12TS I_5 ( .A(Data_Dec_i[20]), .Y(N6) );
  INVX12TS I_4 ( .A(Data_Dec_i[21]), .Y(N5) );
  INVX12TS I_3 ( .A(Data_Dec_i[22]), .Y(N4) );
  INVX12TS I_2 ( .A(Data_Dec_i[23]), .Y(N3) );
  INVX12TS I_1 ( .A(Data_Dec_i[24]), .Y(N2) );
  INVX12TS I_0 ( .A(Data_Dec_i[25]), .Y(N1) );
  NAND3X1TS U3 ( .A(n1), .B(n2), .C(n3), .Y(Data_Bin_o[4]) );
  AOI31X1TS U4 ( .A0(n4), .A1(n5), .A2(N17), .B0(n6), .Y(n3) );
  NAND2X1TS U5 ( .A(n7), .B(n8), .Y(n6) );
  CLKINVX1TS U6 ( .A(N16), .Y(n5) );
  OAI21X1TS U7 ( .A0(N21), .A1(N19), .B0(n9), .Y(n2) );
  NAND4X1TS U8 ( .A(n7), .B(n10), .C(n11), .D(n12), .Y(Data_Bin_o[3]) );
  AOI21X1TS U9 ( .A0(N9), .A1(n13), .B0(n14), .Y(n12) );
  OAI21X1TS U10 ( .A0(N13), .A1(N11), .B0(n15), .Y(n11) );
  NAND3BX1TS U11 ( .AN(N24), .B(n16), .C(N25), .Y(n7) );
  NAND4X1TS U12 ( .A(n17), .B(n18), .C(n19), .D(n20), .Y(Data_Bin_o[2]) );
  NOR2X1TS U13 ( .A(n21), .B(n22), .Y(n20) );
  OAI33XLTS U14 ( .A0(n23), .A1(N20), .A2(n24), .B0(n25), .B1(N12), .B2(n26), 
        .Y(n22) );
  CLKINVX1TS U15 ( .A(N13), .Y(n25) );
  CLKINVX1TS U16 ( .A(N21), .Y(n23) );
  AOI31X1TS U17 ( .A0(n27), .A1(n28), .A2(n29), .B0(n30), .Y(n19) );
  NAND3BX1TS U18 ( .AN(n21), .B(n31), .C(n32), .Y(Data_Bin_o[1]) );
  AOI31X1TS U19 ( .A0(n9), .A1(n33), .A2(N19), .B0(n34), .Y(n32) );
  NAND2X1TS U20 ( .A(n35), .B(n36), .Y(n34) );
  AOI32X1TS U21 ( .A0(n15), .A1(n37), .A2(N11), .B0(n29), .B1(n38), .Y(n31) );
  CLKINVX1TS U22 ( .A(n39), .Y(n15) );
  NAND4X1TS U23 ( .A(n10), .B(n40), .C(n41), .D(n42), .Y(n21) );
  AOI211X1TS U24 ( .A0(N7), .A1(n43), .B0(n44), .C0(n45), .Y(n42) );
  CLKINVX1TS U25 ( .A(n8), .Y(n44) );
  NAND3BX1TS U26 ( .AN(N22), .B(n46), .C(N23), .Y(n8) );
  NAND3BX1TS U27 ( .AN(N14), .B(n47), .C(N15), .Y(n10) );
  NAND3BX1TS U28 ( .AN(n14), .B(n1), .C(n48), .Y(Data_Bin_o[0]) );
  OA21XLTS U29 ( .A0(n49), .A1(N1), .B0(n40), .Y(n48) );
  NAND3BX1TS U30 ( .AN(N7), .B(n43), .C(N8), .Y(n40) );
  AOI2BB1X1TS U31 ( .A0N(N3), .A1N(n50), .B0(N2), .Y(n49) );
  AOI21X1TS U32 ( .A0(N6), .A1(n51), .B0(N4), .Y(n50) );
  CLKINVX1TS U33 ( .A(N5), .Y(n51) );
  AOI211X1TS U34 ( .A0(n9), .A1(N18), .B0(n30), .C0(n52), .Y(n1) );
  NAND3BX1TS U35 ( .AN(n45), .B(n35), .C(n17), .Y(n52) );
  NAND2X1TS U36 ( .A(N22), .B(n46), .Y(n17) );
  NAND2BX1TS U37 ( .AN(n24), .B(N20), .Y(n35) );
  AND2X1TS U38 ( .A(N24), .B(n16), .Y(n45) );
  AND3X1TS U39 ( .A(n53), .B(n16), .C(N26), .Y(n30) );
  NOR3BX1TS U40 ( .AN(n46), .B(N22), .C(N23), .Y(n16) );
  NOR3X1TS U41 ( .A(N20), .B(N21), .C(n24), .Y(n46) );
  NAND3BX1TS U42 ( .AN(N19), .B(n9), .C(n33), .Y(n24) );
  CLKINVX1TS U43 ( .A(N18), .Y(n33) );
  CLKINVX1TS U44 ( .A(N25), .Y(n53) );
  NOR3BX1TS U45 ( .AN(n4), .B(N17), .C(N16), .Y(n9) );
  OAI211X1TS U46 ( .A0(n39), .A1(n37), .B0(n41), .C0(n54), .Y(n14) );
  AND2X1TS U47 ( .A(n36), .B(n18), .Y(n54) );
  NAND2X1TS U48 ( .A(N14), .B(n47), .Y(n18) );
  NAND2X1TS U49 ( .A(N12), .B(n55), .Y(n36) );
  NAND2X1TS U50 ( .A(N16), .B(n4), .Y(n41) );
  NOR3BX1TS U51 ( .AN(n47), .B(N14), .C(N15), .Y(n4) );
  NOR3X1TS U52 ( .A(N12), .B(N13), .C(n26), .Y(n47) );
  CLKINVX1TS U53 ( .A(n55), .Y(n26) );
  NOR3X1TS U54 ( .A(N10), .B(N11), .C(n39), .Y(n55) );
  CLKINVX1TS U55 ( .A(N10), .Y(n37) );
  NAND2BX1TS U56 ( .AN(N9), .B(n13), .Y(n39) );
  NOR3BX1TS U57 ( .AN(n43), .B(N7), .C(N8), .Y(n13) );
  NOR3BX1TS U58 ( .AN(n29), .B(n28), .C(n38), .Y(n43) );
  CLKINVX1TS U59 ( .A(n27), .Y(n38) );
  NOR2X1TS U60 ( .A(N4), .B(N3), .Y(n27) );
  OR2X1TS U61 ( .A(N6), .B(N5), .Y(n28) );
  NOR2X1TS U62 ( .A(N1), .B(N2), .Y(n29) );
endmodule


module RegisterAdd_W5 ( clk, rst, load, D, Q );
  input [4:0] D;
  output [4:0] Q;
  input clk, rst, load;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11;

  OAI2BB2XLTS U2 ( .B0(n1), .B1(load), .A0N(load), .A1N(D[0]), .Y(n6) );
  OAI2BB2XLTS U3 ( .B0(n2), .B1(load), .A0N(D[1]), .A1N(load), .Y(n7) );
  OAI2BB2XLTS U4 ( .B0(n3), .B1(load), .A0N(D[2]), .A1N(load), .Y(n8) );
  OAI2BB2XLTS U5 ( .B0(n4), .B1(load), .A0N(D[3]), .A1N(load), .Y(n9) );
  OAI2BB2XLTS U6 ( .B0(n5), .B1(load), .A0N(D[4]), .A1N(load), .Y(n11) );
  INVX2TS U7 ( .A(rst), .Y(n10) );
  DFFRXLTS Q_reg_3_ ( .D(n9), .CK(clk), .RN(n10), .Q(Q[3]), .QN(n4) );
  DFFRXLTS Q_reg_4_ ( .D(n11), .CK(clk), .RN(n10), .Q(Q[4]), .QN(n5) );
  DFFRXLTS Q_reg_0_ ( .D(n6), .CK(clk), .RN(n10), .Q(Q[0]), .QN(n1) );
  DFFRXLTS Q_reg_1_ ( .D(n7), .CK(clk), .RN(n10), .Q(Q[1]), .QN(n2) );
  DFFRXLTS Q_reg_2_ ( .D(n8), .CK(clk), .RN(n10), .Q(Q[2]), .QN(n3) );
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


module Mux_3x1_W1 ( ctrl, D0, D1, D2, S );
  input [1:0] ctrl;
  input [0:0] D0;
  input [0:0] D1;
  input [0:0] D2;
  output [0:0] S;
  wire   N7, N8, N9, N10, n1, n2, n3;

  INVX12TS I_3 ( .A(N9), .Y(N10) );
  INVX12TS I_2 ( .A(N7), .Y(N8) );
  OAI2BB1X1TS U2 ( .A0N(N10), .A1N(D2[0]), .B0(n1), .Y(S[0]) );
  AOI32X1TS U3 ( .A0(n2), .A1(n3), .A2(D0[0]), .B0(N8), .B1(D1[0]), .Y(n1) );
  NAND2X1TS U4 ( .A(ctrl[1]), .B(n2), .Y(N9) );
  CLKINVX1TS U5 ( .A(ctrl[0]), .Y(n2) );
  NAND2X1TS U6 ( .A(ctrl[0]), .B(n3), .Y(N7) );
  CLKINVX1TS U7 ( .A(ctrl[1]), .Y(n3) );
endmodule


module Multiplexer_AC_W8_1 ( ctrl, D0, D1, S );
  input [7:0] D0;
  input [7:0] D1;
  output [7:0] S;
  input ctrl;
  wire   n2;

  AO22X1TS U1 ( .A0(ctrl), .A1(D1[7]), .B0(D0[7]), .B1(n2), .Y(S[7]) );
  AO22X1TS U2 ( .A0(D1[6]), .A1(ctrl), .B0(D0[6]), .B1(n2), .Y(S[6]) );
  AO22X1TS U3 ( .A0(D1[5]), .A1(ctrl), .B0(D0[5]), .B1(n2), .Y(S[5]) );
  AO22X1TS U4 ( .A0(D1[4]), .A1(ctrl), .B0(D0[4]), .B1(n2), .Y(S[4]) );
  AO22X1TS U5 ( .A0(D1[3]), .A1(ctrl), .B0(D0[3]), .B1(n2), .Y(S[3]) );
  AO22X1TS U6 ( .A0(D1[2]), .A1(ctrl), .B0(D0[2]), .B1(n2), .Y(S[2]) );
  AO22X1TS U7 ( .A0(D1[1]), .A1(ctrl), .B0(D0[1]), .B1(n2), .Y(S[1]) );
  AO22X1TS U8 ( .A0(D1[0]), .A1(ctrl), .B0(D0[0]), .B1(n2), .Y(S[0]) );
  CLKINVX1TS U9 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W23 ( ctrl, D0, D1, S );
  input [22:0] D0;
  input [22:0] D1;
  output [22:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(ctrl), .A1(D1[9]), .B0(D0[9]), .B1(n1), .Y(S[9]) );
  AO22X1TS U2 ( .A0(D1[8]), .A1(ctrl), .B0(D0[8]), .B1(n1), .Y(S[8]) );
  AO22X1TS U3 ( .A0(D1[7]), .A1(ctrl), .B0(D0[7]), .B1(n1), .Y(S[7]) );
  AO22X1TS U4 ( .A0(D1[6]), .A1(ctrl), .B0(D0[6]), .B1(n1), .Y(S[6]) );
  AO22X1TS U5 ( .A0(D1[5]), .A1(ctrl), .B0(D0[5]), .B1(n1), .Y(S[5]) );
  AO22X1TS U6 ( .A0(D1[4]), .A1(ctrl), .B0(D0[4]), .B1(n1), .Y(S[4]) );
  AO22X1TS U7 ( .A0(D1[3]), .A1(ctrl), .B0(D0[3]), .B1(n1), .Y(S[3]) );
  AO22X1TS U8 ( .A0(D1[2]), .A1(ctrl), .B0(D0[2]), .B1(n1), .Y(S[2]) );
  AO22X1TS U9 ( .A0(D1[22]), .A1(ctrl), .B0(D0[22]), .B1(n1), .Y(S[22]) );
  AO22X1TS U10 ( .A0(D1[21]), .A1(ctrl), .B0(D0[21]), .B1(n1), .Y(S[21]) );
  AO22X1TS U11 ( .A0(D1[20]), .A1(ctrl), .B0(D0[20]), .B1(n1), .Y(S[20]) );
  AO22X1TS U12 ( .A0(D1[1]), .A1(ctrl), .B0(D0[1]), .B1(n1), .Y(S[1]) );
  AO22X1TS U13 ( .A0(D1[19]), .A1(ctrl), .B0(D0[19]), .B1(n1), .Y(S[19]) );
  AO22X1TS U14 ( .A0(D1[18]), .A1(ctrl), .B0(D0[18]), .B1(n1), .Y(S[18]) );
  AO22X1TS U15 ( .A0(D1[17]), .A1(ctrl), .B0(D0[17]), .B1(n1), .Y(S[17]) );
  AO22X1TS U16 ( .A0(D1[16]), .A1(ctrl), .B0(D0[16]), .B1(n1), .Y(S[16]) );
  AO22X1TS U17 ( .A0(D1[15]), .A1(ctrl), .B0(D0[15]), .B1(n1), .Y(S[15]) );
  AO22X1TS U18 ( .A0(D1[14]), .A1(ctrl), .B0(D0[14]), .B1(n1), .Y(S[14]) );
  AO22X1TS U19 ( .A0(D1[13]), .A1(ctrl), .B0(D0[13]), .B1(n1), .Y(S[13]) );
  AO22X1TS U20 ( .A0(D1[12]), .A1(ctrl), .B0(D0[12]), .B1(n1), .Y(S[12]) );
  AO22X1TS U21 ( .A0(D1[11]), .A1(ctrl), .B0(D0[11]), .B1(n1), .Y(S[11]) );
  AO22X1TS U22 ( .A0(D1[10]), .A1(ctrl), .B0(D0[10]), .B1(n1), .Y(S[10]) );
  AO22X1TS U23 ( .A0(D1[0]), .A1(ctrl), .B0(D0[0]), .B1(n1), .Y(S[0]) );
  CLKINVX1TS U24 ( .A(ctrl), .Y(n1) );
endmodule


module RegisterAdd_W32_1 ( clk, rst, load, D, Q );
  input [31:0] D;
  output [31:0] Q;
  input clk, rst, load;
  wire   n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79,
         n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93,
         n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105,
         n106, n107, n108, n109, n110, n111, n112, n113, n114, n115, n116,
         n117, n118, n119, n120, n121, n122, n123, n124, n125, n126, n127,
         n128, n129, n130;

  OAI2BB2XLTS U2 ( .B0(n130), .B1(load), .A0N(load), .A1N(D[0]), .Y(n98) );
  OAI2BB2XLTS U3 ( .B0(n129), .B1(load), .A0N(D[1]), .A1N(load), .Y(n97) );
  OAI2BB2XLTS U4 ( .B0(n128), .B1(load), .A0N(D[2]), .A1N(load), .Y(n96) );
  OAI2BB2XLTS U5 ( .B0(n127), .B1(load), .A0N(D[3]), .A1N(load), .Y(n95) );
  OAI2BB2XLTS U6 ( .B0(n126), .B1(load), .A0N(D[4]), .A1N(load), .Y(n94) );
  OAI2BB2XLTS U7 ( .B0(n125), .B1(load), .A0N(D[5]), .A1N(load), .Y(n93) );
  OAI2BB2XLTS U8 ( .B0(n124), .B1(load), .A0N(D[6]), .A1N(load), .Y(n92) );
  OAI2BB2XLTS U9 ( .B0(n123), .B1(load), .A0N(D[7]), .A1N(load), .Y(n91) );
  OAI2BB2XLTS U10 ( .B0(n122), .B1(load), .A0N(D[8]), .A1N(load), .Y(n90) );
  OAI2BB2XLTS U11 ( .B0(n121), .B1(load), .A0N(D[9]), .A1N(load), .Y(n89) );
  OAI2BB2XLTS U12 ( .B0(n120), .B1(load), .A0N(D[10]), .A1N(load), .Y(n88) );
  OAI2BB2XLTS U13 ( .B0(n119), .B1(load), .A0N(D[11]), .A1N(load), .Y(n87) );
  OAI2BB2XLTS U14 ( .B0(n118), .B1(load), .A0N(D[12]), .A1N(load), .Y(n86) );
  OAI2BB2XLTS U15 ( .B0(n117), .B1(load), .A0N(D[13]), .A1N(load), .Y(n85) );
  OAI2BB2XLTS U16 ( .B0(n116), .B1(load), .A0N(D[14]), .A1N(load), .Y(n84) );
  OAI2BB2XLTS U17 ( .B0(n115), .B1(load), .A0N(D[15]), .A1N(load), .Y(n83) );
  OAI2BB2XLTS U18 ( .B0(n114), .B1(load), .A0N(D[16]), .A1N(load), .Y(n82) );
  OAI2BB2XLTS U19 ( .B0(n113), .B1(load), .A0N(D[17]), .A1N(load), .Y(n81) );
  OAI2BB2XLTS U20 ( .B0(n112), .B1(load), .A0N(D[18]), .A1N(load), .Y(n80) );
  OAI2BB2XLTS U21 ( .B0(n111), .B1(load), .A0N(D[19]), .A1N(load), .Y(n79) );
  OAI2BB2XLTS U22 ( .B0(n110), .B1(load), .A0N(D[20]), .A1N(load), .Y(n78) );
  OAI2BB2XLTS U23 ( .B0(n109), .B1(load), .A0N(D[21]), .A1N(load), .Y(n77) );
  OAI2BB2XLTS U24 ( .B0(n108), .B1(load), .A0N(D[22]), .A1N(load), .Y(n76) );
  OAI2BB2XLTS U25 ( .B0(n107), .B1(load), .A0N(D[23]), .A1N(load), .Y(n75) );
  OAI2BB2XLTS U26 ( .B0(n106), .B1(load), .A0N(D[24]), .A1N(load), .Y(n74) );
  OAI2BB2XLTS U27 ( .B0(n105), .B1(load), .A0N(D[25]), .A1N(load), .Y(n73) );
  OAI2BB2XLTS U28 ( .B0(n104), .B1(load), .A0N(D[26]), .A1N(load), .Y(n72) );
  OAI2BB2XLTS U29 ( .B0(n103), .B1(load), .A0N(D[27]), .A1N(load), .Y(n71) );
  OAI2BB2XLTS U30 ( .B0(n102), .B1(load), .A0N(D[28]), .A1N(load), .Y(n70) );
  OAI2BB2XLTS U31 ( .B0(n101), .B1(load), .A0N(D[29]), .A1N(load), .Y(n69) );
  OAI2BB2XLTS U32 ( .B0(n100), .B1(load), .A0N(D[30]), .A1N(load), .Y(n68) );
  OAI2BB2XLTS U33 ( .B0(n99), .B1(load), .A0N(D[31]), .A1N(load), .Y(n66) );
  INVX2TS U34 ( .A(rst), .Y(n67) );
  DFFRX2TS Q_reg_31_ ( .D(n66), .CK(clk), .RN(n67), .Q(Q[31]), .QN(n99) );
  DFFRX2TS Q_reg_30_ ( .D(n68), .CK(clk), .RN(n67), .Q(Q[30]), .QN(n100) );
  DFFRX2TS Q_reg_29_ ( .D(n69), .CK(clk), .RN(n67), .Q(Q[29]), .QN(n101) );
  DFFRX2TS Q_reg_28_ ( .D(n70), .CK(clk), .RN(n67), .Q(Q[28]), .QN(n102) );
  DFFRX2TS Q_reg_27_ ( .D(n71), .CK(clk), .RN(n67), .Q(Q[27]), .QN(n103) );
  DFFRX2TS Q_reg_26_ ( .D(n72), .CK(clk), .RN(n67), .Q(Q[26]), .QN(n104) );
  DFFRX2TS Q_reg_25_ ( .D(n73), .CK(clk), .RN(n67), .Q(Q[25]), .QN(n105) );
  DFFRX2TS Q_reg_24_ ( .D(n74), .CK(clk), .RN(n67), .Q(Q[24]), .QN(n106) );
  DFFRX2TS Q_reg_23_ ( .D(n75), .CK(clk), .RN(n67), .Q(Q[23]), .QN(n107) );
  DFFRX2TS Q_reg_22_ ( .D(n76), .CK(clk), .RN(n67), .Q(Q[22]), .QN(n108) );
  DFFRX2TS Q_reg_21_ ( .D(n77), .CK(clk), .RN(n67), .Q(Q[21]), .QN(n109) );
  DFFRX2TS Q_reg_20_ ( .D(n78), .CK(clk), .RN(n67), .Q(Q[20]), .QN(n110) );
  DFFRX2TS Q_reg_19_ ( .D(n79), .CK(clk), .RN(n67), .Q(Q[19]), .QN(n111) );
  DFFRX2TS Q_reg_18_ ( .D(n80), .CK(clk), .RN(n67), .Q(Q[18]), .QN(n112) );
  DFFRX2TS Q_reg_17_ ( .D(n81), .CK(clk), .RN(n67), .Q(Q[17]), .QN(n113) );
  DFFRX2TS Q_reg_16_ ( .D(n82), .CK(clk), .RN(n67), .Q(Q[16]), .QN(n114) );
  DFFRX2TS Q_reg_15_ ( .D(n83), .CK(clk), .RN(n67), .Q(Q[15]), .QN(n115) );
  DFFRX2TS Q_reg_14_ ( .D(n84), .CK(clk), .RN(n67), .Q(Q[14]), .QN(n116) );
  DFFRX2TS Q_reg_13_ ( .D(n85), .CK(clk), .RN(n67), .Q(Q[13]), .QN(n117) );
  DFFRX2TS Q_reg_12_ ( .D(n86), .CK(clk), .RN(n67), .Q(Q[12]), .QN(n118) );
  DFFRX2TS Q_reg_11_ ( .D(n87), .CK(clk), .RN(n67), .Q(Q[11]), .QN(n119) );
  DFFRX2TS Q_reg_10_ ( .D(n88), .CK(clk), .RN(n67), .Q(Q[10]), .QN(n120) );
  DFFRX2TS Q_reg_9_ ( .D(n89), .CK(clk), .RN(n67), .Q(Q[9]), .QN(n121) );
  DFFRX2TS Q_reg_8_ ( .D(n90), .CK(clk), .RN(n67), .Q(Q[8]), .QN(n122) );
  DFFRX2TS Q_reg_7_ ( .D(n91), .CK(clk), .RN(n67), .Q(Q[7]), .QN(n123) );
  DFFRX2TS Q_reg_6_ ( .D(n92), .CK(clk), .RN(n67), .Q(Q[6]), .QN(n124) );
  DFFRX2TS Q_reg_5_ ( .D(n93), .CK(clk), .RN(n67), .Q(Q[5]), .QN(n125) );
  DFFRX2TS Q_reg_4_ ( .D(n94), .CK(clk), .RN(n67), .Q(Q[4]), .QN(n126) );
  DFFRX2TS Q_reg_3_ ( .D(n95), .CK(clk), .RN(n67), .Q(Q[3]), .QN(n127) );
  DFFRX2TS Q_reg_2_ ( .D(n96), .CK(clk), .RN(n67), .Q(Q[2]), .QN(n128) );
  DFFRX2TS Q_reg_1_ ( .D(n97), .CK(clk), .RN(n67), .Q(Q[1]), .QN(n129) );
  DFFRX2TS Q_reg_0_ ( .D(n98), .CK(clk), .RN(n67), .Q(Q[0]), .QN(n130) );
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

  OR2X8TS C8 ( .A(sel_a_i), .B(sel_b_i), .Y(overunder) );
  Mux_3x1_W1 Sign_Mux ( .ctrl({sel_a_i, sel_b_i}), .D0(sign_i), .D1(1'b1), 
        .D2(1'b0), .S(Sign_S_mux) );
  Multiplexer_AC_W8_1 Exp_Mux ( .ctrl(overunder), .D0(exp_ieee_i), .D1({1'b1, 
        1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1}), .S(Exp_S_mux) );
  Multiplexer_AC_W23 Sgf_Mux ( .ctrl(overunder), .D0(sgf_ieee_i), .D1({1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .S(
        Sgf_S_mux) );
  RegisterAdd_W32_1 Final_Result_IEEE ( .clk(clk), .rst(rst), .load(load_i), 
        .D({Sign_S_mux, Exp_S_mux, Sgf_S_mux}), .Q(final_result_ieee_o) );
endmodule


module Multiplexer_AC_W1_52 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  CLKINVX1TS U2 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_51 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  CLKINVX1TS U2 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_50 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  CLKINVX1TS U2 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_49 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  CLKINVX1TS U2 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_48 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  CLKINVX1TS U2 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_47 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  CLKINVX1TS U2 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_46 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  CLKINVX1TS U2 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_45 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  CLKINVX1TS U2 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_44 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  CLKINVX1TS U2 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_43 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  CLKINVX1TS U2 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_42 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  CLKINVX1TS U2 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_41 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  CLKINVX1TS U2 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_40 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  CLKINVX1TS U2 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_39 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  CLKINVX1TS U2 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_38 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  CLKINVX1TS U2 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_37 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  CLKINVX1TS U2 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_36 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  CLKINVX1TS U2 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_35 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  CLKINVX1TS U2 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_34 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  CLKINVX1TS U2 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_33 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  CLKINVX1TS U2 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_32 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  CLKINVX1TS U2 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_31 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  CLKINVX1TS U2 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_30 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  CLKINVX1TS U2 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_29 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  CLKINVX1TS U2 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_28 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  CLKINVX1TS U2 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_27 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  CLKINVX1TS U2 ( .A(ctrl), .Y(n2) );
endmodule


module Rotate_Mux_Array_SWR26_0 ( Data_i, select_i, Data_o );
  input [25:0] Data_i;
  output [25:0] Data_o;
  input select_i;


  Multiplexer_AC_W1_52 MUX_ARRAY_0__MUX_ARRAY12_rotate_mux ( .ctrl(select_i), 
        .D0(Data_i[0]), .D1(Data_i[25]), .S(Data_o[0]) );
  Multiplexer_AC_W1_51 MUX_ARRAY_1__MUX_ARRAY12_rotate_mux ( .ctrl(select_i), 
        .D0(Data_i[1]), .D1(Data_i[24]), .S(Data_o[1]) );
  Multiplexer_AC_W1_50 MUX_ARRAY_2__MUX_ARRAY12_rotate_mux ( .ctrl(select_i), 
        .D0(Data_i[2]), .D1(Data_i[23]), .S(Data_o[2]) );
  Multiplexer_AC_W1_49 MUX_ARRAY_3__MUX_ARRAY12_rotate_mux ( .ctrl(select_i), 
        .D0(Data_i[3]), .D1(Data_i[22]), .S(Data_o[3]) );
  Multiplexer_AC_W1_48 MUX_ARRAY_4__MUX_ARRAY12_rotate_mux ( .ctrl(select_i), 
        .D0(Data_i[4]), .D1(Data_i[21]), .S(Data_o[4]) );
  Multiplexer_AC_W1_47 MUX_ARRAY_5__MUX_ARRAY12_rotate_mux ( .ctrl(select_i), 
        .D0(Data_i[5]), .D1(Data_i[20]), .S(Data_o[5]) );
  Multiplexer_AC_W1_46 MUX_ARRAY_6__MUX_ARRAY12_rotate_mux ( .ctrl(select_i), 
        .D0(Data_i[6]), .D1(Data_i[19]), .S(Data_o[6]) );
  Multiplexer_AC_W1_45 MUX_ARRAY_7__MUX_ARRAY12_rotate_mux ( .ctrl(select_i), 
        .D0(Data_i[7]), .D1(Data_i[18]), .S(Data_o[7]) );
  Multiplexer_AC_W1_44 MUX_ARRAY_8__MUX_ARRAY12_rotate_mux ( .ctrl(select_i), 
        .D0(Data_i[8]), .D1(Data_i[17]), .S(Data_o[8]) );
  Multiplexer_AC_W1_43 MUX_ARRAY_9__MUX_ARRAY12_rotate_mux ( .ctrl(select_i), 
        .D0(Data_i[9]), .D1(Data_i[16]), .S(Data_o[9]) );
  Multiplexer_AC_W1_42 MUX_ARRAY_10__MUX_ARRAY12_rotate_mux ( .ctrl(select_i), 
        .D0(Data_i[10]), .D1(Data_i[15]), .S(Data_o[10]) );
  Multiplexer_AC_W1_41 MUX_ARRAY_11__MUX_ARRAY12_rotate_mux ( .ctrl(select_i), 
        .D0(Data_i[11]), .D1(Data_i[14]), .S(Data_o[11]) );
  Multiplexer_AC_W1_40 MUX_ARRAY_12__MUX_ARRAY12_rotate_mux ( .ctrl(select_i), 
        .D0(Data_i[12]), .D1(Data_i[13]), .S(Data_o[12]) );
  Multiplexer_AC_W1_39 MUX_ARRAY_13__MUX_ARRAY12_rotate_mux ( .ctrl(select_i), 
        .D0(Data_i[13]), .D1(Data_i[12]), .S(Data_o[13]) );
  Multiplexer_AC_W1_38 MUX_ARRAY_14__MUX_ARRAY12_rotate_mux ( .ctrl(select_i), 
        .D0(Data_i[14]), .D1(Data_i[11]), .S(Data_o[14]) );
  Multiplexer_AC_W1_37 MUX_ARRAY_15__MUX_ARRAY12_rotate_mux ( .ctrl(select_i), 
        .D0(Data_i[15]), .D1(Data_i[10]), .S(Data_o[15]) );
  Multiplexer_AC_W1_36 MUX_ARRAY_16__MUX_ARRAY12_rotate_mux ( .ctrl(select_i), 
        .D0(Data_i[16]), .D1(Data_i[9]), .S(Data_o[16]) );
  Multiplexer_AC_W1_35 MUX_ARRAY_17__MUX_ARRAY12_rotate_mux ( .ctrl(select_i), 
        .D0(Data_i[17]), .D1(Data_i[8]), .S(Data_o[17]) );
  Multiplexer_AC_W1_34 MUX_ARRAY_18__MUX_ARRAY12_rotate_mux ( .ctrl(select_i), 
        .D0(Data_i[18]), .D1(Data_i[7]), .S(Data_o[18]) );
  Multiplexer_AC_W1_33 MUX_ARRAY_19__MUX_ARRAY12_rotate_mux ( .ctrl(select_i), 
        .D0(Data_i[19]), .D1(Data_i[6]), .S(Data_o[19]) );
  Multiplexer_AC_W1_32 MUX_ARRAY_20__MUX_ARRAY12_rotate_mux ( .ctrl(select_i), 
        .D0(Data_i[20]), .D1(Data_i[5]), .S(Data_o[20]) );
  Multiplexer_AC_W1_31 MUX_ARRAY_21__MUX_ARRAY12_rotate_mux ( .ctrl(select_i), 
        .D0(Data_i[21]), .D1(Data_i[4]), .S(Data_o[21]) );
  Multiplexer_AC_W1_30 MUX_ARRAY_22__MUX_ARRAY12_rotate_mux ( .ctrl(select_i), 
        .D0(Data_i[22]), .D1(Data_i[3]), .S(Data_o[22]) );
  Multiplexer_AC_W1_29 MUX_ARRAY_23__MUX_ARRAY12_rotate_mux ( .ctrl(select_i), 
        .D0(Data_i[23]), .D1(Data_i[2]), .S(Data_o[23]) );
  Multiplexer_AC_W1_28 MUX_ARRAY_24__MUX_ARRAY12_rotate_mux ( .ctrl(select_i), 
        .D0(Data_i[24]), .D1(Data_i[1]), .S(Data_o[24]) );
  Multiplexer_AC_W1_27 MUX_ARRAY_25__MUX_ARRAY12_rotate_mux ( .ctrl(select_i), 
        .D0(Data_i[25]), .D1(Data_i[0]), .S(Data_o[25]) );
endmodule


module shift_mux_array_SWR26_LEVEL0 ( Data_i, select_i, bit_shift_i, Data_o );
  input [25:0] Data_i;
  output [25:0] Data_o;
  input select_i, bit_shift_i;
  wire   n1;

  AO22X1TS U1 ( .A0(n1), .A1(Data_i[9]), .B0(Data_i[10]), .B1(select_i), .Y(
        Data_o[9]) );
  AO22X1TS U2 ( .A0(select_i), .A1(Data_i[9]), .B0(n1), .B1(Data_i[8]), .Y(
        Data_o[8]) );
  AO22X1TS U3 ( .A0(select_i), .A1(Data_i[8]), .B0(n1), .B1(Data_i[7]), .Y(
        Data_o[7]) );
  AO22X1TS U4 ( .A0(select_i), .A1(Data_i[7]), .B0(n1), .B1(Data_i[6]), .Y(
        Data_o[6]) );
  AO22X1TS U5 ( .A0(select_i), .A1(Data_i[6]), .B0(n1), .B1(Data_i[5]), .Y(
        Data_o[5]) );
  AO22X1TS U6 ( .A0(select_i), .A1(Data_i[5]), .B0(n1), .B1(Data_i[4]), .Y(
        Data_o[4]) );
  AO22X1TS U7 ( .A0(select_i), .A1(Data_i[4]), .B0(n1), .B1(Data_i[3]), .Y(
        Data_o[3]) );
  AO22X1TS U8 ( .A0(select_i), .A1(Data_i[3]), .B0(n1), .B1(Data_i[2]), .Y(
        Data_o[2]) );
  AO22X1TS U9 ( .A0(n1), .A1(Data_i[25]), .B0(bit_shift_i), .B1(select_i), .Y(
        Data_o[25]) );
  AO22X1TS U10 ( .A0(n1), .A1(Data_i[24]), .B0(select_i), .B1(Data_i[25]), .Y(
        Data_o[24]) );
  AO22X1TS U11 ( .A0(n1), .A1(Data_i[23]), .B0(select_i), .B1(Data_i[24]), .Y(
        Data_o[23]) );
  AO22X1TS U12 ( .A0(n1), .A1(Data_i[22]), .B0(select_i), .B1(Data_i[23]), .Y(
        Data_o[22]) );
  AO22X1TS U13 ( .A0(n1), .A1(Data_i[21]), .B0(select_i), .B1(Data_i[22]), .Y(
        Data_o[21]) );
  AO22X1TS U14 ( .A0(n1), .A1(Data_i[20]), .B0(select_i), .B1(Data_i[21]), .Y(
        Data_o[20]) );
  AO22X1TS U15 ( .A0(select_i), .A1(Data_i[2]), .B0(n1), .B1(Data_i[1]), .Y(
        Data_o[1]) );
  AO22X1TS U16 ( .A0(n1), .A1(Data_i[19]), .B0(select_i), .B1(Data_i[20]), .Y(
        Data_o[19]) );
  AO22X1TS U17 ( .A0(n1), .A1(Data_i[18]), .B0(select_i), .B1(Data_i[19]), .Y(
        Data_o[18]) );
  AO22X1TS U18 ( .A0(n1), .A1(Data_i[17]), .B0(select_i), .B1(Data_i[18]), .Y(
        Data_o[17]) );
  AO22X1TS U19 ( .A0(n1), .A1(Data_i[16]), .B0(select_i), .B1(Data_i[17]), .Y(
        Data_o[16]) );
  AO22X1TS U20 ( .A0(n1), .A1(Data_i[15]), .B0(select_i), .B1(Data_i[16]), .Y(
        Data_o[15]) );
  AO22X1TS U21 ( .A0(n1), .A1(Data_i[14]), .B0(select_i), .B1(Data_i[15]), .Y(
        Data_o[14]) );
  AO22X1TS U22 ( .A0(n1), .A1(Data_i[13]), .B0(select_i), .B1(Data_i[14]), .Y(
        Data_o[13]) );
  AO22X1TS U23 ( .A0(n1), .A1(Data_i[12]), .B0(select_i), .B1(Data_i[13]), .Y(
        Data_o[12]) );
  AO22X1TS U24 ( .A0(n1), .A1(Data_i[11]), .B0(select_i), .B1(Data_i[12]), .Y(
        Data_o[11]) );
  AO22X1TS U25 ( .A0(n1), .A1(Data_i[10]), .B0(select_i), .B1(Data_i[11]), .Y(
        Data_o[10]) );
  AO22X1TS U26 ( .A0(select_i), .A1(Data_i[1]), .B0(Data_i[0]), .B1(n1), .Y(
        Data_o[0]) );
  CLKINVX1TS U27 ( .A(select_i), .Y(n1) );
endmodule


module shift_mux_array_SWR26_LEVEL1 ( Data_i, select_i, bit_shift_i, Data_o );
  input [25:0] Data_i;
  output [25:0] Data_o;
  input select_i, bit_shift_i;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24;

  OAI22X1TS U1 ( .A0(select_i), .A1(n1), .B0(n2), .B1(n3), .Y(Data_o[9]) );
  OAI22X1TS U2 ( .A0(select_i), .A1(n4), .B0(n3), .B1(n5), .Y(Data_o[8]) );
  OAI22X1TS U3 ( .A0(n3), .A1(n1), .B0(select_i), .B1(n6), .Y(Data_o[7]) );
  CLKINVX1TS U4 ( .A(Data_i[9]), .Y(n1) );
  OAI22X1TS U5 ( .A0(n3), .A1(n4), .B0(select_i), .B1(n7), .Y(Data_o[6]) );
  CLKINVX1TS U6 ( .A(Data_i[8]), .Y(n4) );
  OAI22X1TS U7 ( .A0(n3), .A1(n6), .B0(select_i), .B1(n8), .Y(Data_o[5]) );
  CLKINVX1TS U8 ( .A(Data_i[5]), .Y(n8) );
  CLKINVX1TS U9 ( .A(Data_i[7]), .Y(n6) );
  OAI22X1TS U10 ( .A0(n3), .A1(n7), .B0(select_i), .B1(n9), .Y(Data_o[4]) );
  CLKINVX1TS U11 ( .A(Data_i[4]), .Y(n9) );
  CLKINVX1TS U12 ( .A(Data_i[6]), .Y(n7) );
  AO22X1TS U13 ( .A0(select_i), .A1(Data_i[5]), .B0(n3), .B1(Data_i[3]), .Y(
        Data_o[3]) );
  AO22X1TS U14 ( .A0(select_i), .A1(Data_i[4]), .B0(n3), .B1(Data_i[2]), .Y(
        Data_o[2]) );
  OAI22X1TS U15 ( .A0(n3), .A1(n10), .B0(select_i), .B1(n11), .Y(Data_o[25])
         );
  OAI22X1TS U16 ( .A0(n3), .A1(n10), .B0(select_i), .B1(n12), .Y(Data_o[24])
         );
  CLKINVX1TS U17 ( .A(bit_shift_i), .Y(n10) );
  OAI22X1TS U18 ( .A0(n3), .A1(n11), .B0(select_i), .B1(n13), .Y(Data_o[23])
         );
  CLKINVX1TS U19 ( .A(Data_i[25]), .Y(n11) );
  OAI22X1TS U20 ( .A0(n3), .A1(n12), .B0(select_i), .B1(n14), .Y(Data_o[22])
         );
  CLKINVX1TS U21 ( .A(Data_i[24]), .Y(n12) );
  OAI22X1TS U22 ( .A0(n3), .A1(n13), .B0(select_i), .B1(n15), .Y(Data_o[21])
         );
  CLKINVX1TS U23 ( .A(Data_i[23]), .Y(n13) );
  OAI22X1TS U24 ( .A0(n3), .A1(n14), .B0(select_i), .B1(n16), .Y(Data_o[20])
         );
  CLKINVX1TS U25 ( .A(Data_i[22]), .Y(n14) );
  AO22X1TS U26 ( .A0(select_i), .A1(Data_i[3]), .B0(Data_i[1]), .B1(n3), .Y(
        Data_o[1]) );
  OAI22X1TS U27 ( .A0(n3), .A1(n15), .B0(select_i), .B1(n17), .Y(Data_o[19])
         );
  CLKINVX1TS U28 ( .A(Data_i[21]), .Y(n15) );
  OAI22X1TS U29 ( .A0(n3), .A1(n16), .B0(select_i), .B1(n18), .Y(Data_o[18])
         );
  CLKINVX1TS U30 ( .A(Data_i[20]), .Y(n16) );
  OAI22X1TS U31 ( .A0(n3), .A1(n17), .B0(select_i), .B1(n19), .Y(Data_o[17])
         );
  CLKINVX1TS U32 ( .A(Data_i[19]), .Y(n17) );
  OAI22X1TS U33 ( .A0(n3), .A1(n18), .B0(select_i), .B1(n20), .Y(Data_o[16])
         );
  CLKINVX1TS U34 ( .A(Data_i[18]), .Y(n18) );
  OAI22X1TS U35 ( .A0(n3), .A1(n19), .B0(select_i), .B1(n21), .Y(Data_o[15])
         );
  CLKINVX1TS U36 ( .A(Data_i[17]), .Y(n19) );
  OAI22X1TS U37 ( .A0(n3), .A1(n20), .B0(select_i), .B1(n22), .Y(Data_o[14])
         );
  CLKINVX1TS U38 ( .A(Data_i[16]), .Y(n20) );
  OAI22X1TS U39 ( .A0(n3), .A1(n21), .B0(select_i), .B1(n23), .Y(Data_o[13])
         );
  CLKINVX1TS U40 ( .A(Data_i[15]), .Y(n21) );
  OAI22X1TS U41 ( .A0(n3), .A1(n22), .B0(select_i), .B1(n24), .Y(Data_o[12])
         );
  CLKINVX1TS U42 ( .A(Data_i[14]), .Y(n22) );
  OAI22X1TS U43 ( .A0(n3), .A1(n23), .B0(select_i), .B1(n2), .Y(Data_o[11]) );
  CLKINVX1TS U44 ( .A(Data_i[11]), .Y(n2) );
  CLKINVX1TS U45 ( .A(Data_i[13]), .Y(n23) );
  OAI22X1TS U46 ( .A0(n3), .A1(n24), .B0(select_i), .B1(n5), .Y(Data_o[10]) );
  CLKINVX1TS U47 ( .A(Data_i[10]), .Y(n5) );
  CLKINVX1TS U48 ( .A(Data_i[12]), .Y(n24) );
  AO22X1TS U49 ( .A0(select_i), .A1(Data_i[2]), .B0(Data_i[0]), .B1(n3), .Y(
        Data_o[0]) );
  CLKINVX1TS U50 ( .A(select_i), .Y(n3) );
endmodule


module shift_mux_array_SWR26_LEVEL2 ( Data_i, select_i, bit_shift_i, Data_o );
  input [25:0] Data_i;
  output [25:0] Data_o;
  input select_i, bit_shift_i;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12;

  AO22X1TS U1 ( .A0(Data_i[13]), .A1(select_i), .B0(n1), .B1(Data_i[9]), .Y(
        Data_o[9]) );
  AO22X1TS U2 ( .A0(select_i), .A1(Data_i[12]), .B0(n1), .B1(Data_i[8]), .Y(
        Data_o[8]) );
  AO22X1TS U3 ( .A0(select_i), .A1(Data_i[11]), .B0(n1), .B1(Data_i[7]), .Y(
        Data_o[7]) );
  AO22X1TS U4 ( .A0(select_i), .A1(Data_i[10]), .B0(n1), .B1(Data_i[6]), .Y(
        Data_o[6]) );
  AO22X1TS U5 ( .A0(select_i), .A1(Data_i[9]), .B0(n1), .B1(Data_i[5]), .Y(
        Data_o[5]) );
  AO22X1TS U6 ( .A0(select_i), .A1(Data_i[8]), .B0(n1), .B1(Data_i[4]), .Y(
        Data_o[4]) );
  AO22X1TS U7 ( .A0(select_i), .A1(Data_i[7]), .B0(Data_i[3]), .B1(n1), .Y(
        Data_o[3]) );
  AO22X1TS U8 ( .A0(select_i), .A1(Data_i[6]), .B0(Data_i[2]), .B1(n1), .Y(
        Data_o[2]) );
  OAI21X1TS U9 ( .A0(select_i), .A1(n2), .B0(n3), .Y(Data_o[25]) );
  OAI21X1TS U10 ( .A0(select_i), .A1(n4), .B0(n3), .Y(Data_o[24]) );
  OAI21X1TS U11 ( .A0(select_i), .A1(n5), .B0(n3), .Y(Data_o[23]) );
  OAI21X1TS U12 ( .A0(select_i), .A1(n6), .B0(n3), .Y(Data_o[22]) );
  NAND2X1TS U13 ( .A(bit_shift_i), .B(select_i), .Y(n3) );
  OAI22X1TS U14 ( .A0(n1), .A1(n2), .B0(select_i), .B1(n7), .Y(Data_o[21]) );
  CLKINVX1TS U15 ( .A(Data_i[25]), .Y(n2) );
  OAI22X1TS U16 ( .A0(n1), .A1(n4), .B0(select_i), .B1(n8), .Y(Data_o[20]) );
  CLKINVX1TS U17 ( .A(Data_i[24]), .Y(n4) );
  AO22X1TS U18 ( .A0(select_i), .A1(Data_i[5]), .B0(Data_i[1]), .B1(n1), .Y(
        Data_o[1]) );
  OAI22X1TS U19 ( .A0(n1), .A1(n5), .B0(select_i), .B1(n9), .Y(Data_o[19]) );
  CLKINVX1TS U20 ( .A(Data_i[19]), .Y(n9) );
  CLKINVX1TS U21 ( .A(Data_i[23]), .Y(n5) );
  OAI22X1TS U22 ( .A0(n1), .A1(n6), .B0(select_i), .B1(n10), .Y(Data_o[18]) );
  CLKINVX1TS U23 ( .A(Data_i[18]), .Y(n10) );
  CLKINVX1TS U24 ( .A(Data_i[22]), .Y(n6) );
  OAI22X1TS U25 ( .A0(n1), .A1(n7), .B0(select_i), .B1(n11), .Y(Data_o[17]) );
  CLKINVX1TS U26 ( .A(Data_i[17]), .Y(n11) );
  CLKINVX1TS U27 ( .A(Data_i[21]), .Y(n7) );
  OAI22X1TS U28 ( .A0(n1), .A1(n8), .B0(select_i), .B1(n12), .Y(Data_o[16]) );
  CLKINVX1TS U29 ( .A(Data_i[16]), .Y(n12) );
  CLKINVX1TS U30 ( .A(Data_i[20]), .Y(n8) );
  AO22X1TS U31 ( .A0(select_i), .A1(Data_i[19]), .B0(n1), .B1(Data_i[15]), .Y(
        Data_o[15]) );
  AO22X1TS U32 ( .A0(select_i), .A1(Data_i[18]), .B0(n1), .B1(Data_i[14]), .Y(
        Data_o[14]) );
  AO22X1TS U33 ( .A0(select_i), .A1(Data_i[17]), .B0(n1), .B1(Data_i[13]), .Y(
        Data_o[13]) );
  AO22X1TS U34 ( .A0(select_i), .A1(Data_i[16]), .B0(n1), .B1(Data_i[12]), .Y(
        Data_o[12]) );
  AO22X1TS U35 ( .A0(select_i), .A1(Data_i[15]), .B0(n1), .B1(Data_i[11]), .Y(
        Data_o[11]) );
  AO22X1TS U36 ( .A0(select_i), .A1(Data_i[14]), .B0(n1), .B1(Data_i[10]), .Y(
        Data_o[10]) );
  AO22X1TS U37 ( .A0(select_i), .A1(Data_i[4]), .B0(Data_i[0]), .B1(n1), .Y(
        Data_o[0]) );
  CLKINVX1TS U38 ( .A(select_i), .Y(n1) );
endmodule


module RegisterAdd_W26_1 ( clk, rst, load, D, Q );
  input [25:0] D;
  output [25:0] Q;
  input clk, rst, load;
  wire   n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67,
         n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81,
         n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95,
         n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106;

  OAI2BB2XLTS U2 ( .B0(n106), .B1(load), .A0N(load), .A1N(D[0]), .Y(n80) );
  OAI2BB2XLTS U3 ( .B0(n105), .B1(load), .A0N(D[1]), .A1N(load), .Y(n79) );
  OAI2BB2XLTS U4 ( .B0(n104), .B1(load), .A0N(D[2]), .A1N(load), .Y(n78) );
  OAI2BB2XLTS U5 ( .B0(n103), .B1(load), .A0N(D[3]), .A1N(load), .Y(n77) );
  OAI2BB2XLTS U6 ( .B0(n102), .B1(load), .A0N(D[4]), .A1N(load), .Y(n76) );
  OAI2BB2XLTS U7 ( .B0(n101), .B1(load), .A0N(D[5]), .A1N(load), .Y(n75) );
  OAI2BB2XLTS U8 ( .B0(n100), .B1(load), .A0N(D[6]), .A1N(load), .Y(n74) );
  OAI2BB2XLTS U9 ( .B0(n99), .B1(load), .A0N(D[7]), .A1N(load), .Y(n73) );
  OAI2BB2XLTS U10 ( .B0(n98), .B1(load), .A0N(D[8]), .A1N(load), .Y(n72) );
  OAI2BB2XLTS U11 ( .B0(n97), .B1(load), .A0N(D[9]), .A1N(load), .Y(n71) );
  OAI2BB2XLTS U12 ( .B0(n96), .B1(load), .A0N(D[10]), .A1N(load), .Y(n70) );
  OAI2BB2XLTS U13 ( .B0(n95), .B1(load), .A0N(D[11]), .A1N(load), .Y(n69) );
  OAI2BB2XLTS U14 ( .B0(n94), .B1(load), .A0N(D[12]), .A1N(load), .Y(n68) );
  OAI2BB2XLTS U15 ( .B0(n93), .B1(load), .A0N(D[13]), .A1N(load), .Y(n67) );
  OAI2BB2XLTS U16 ( .B0(n92), .B1(load), .A0N(D[14]), .A1N(load), .Y(n66) );
  OAI2BB2XLTS U17 ( .B0(n91), .B1(load), .A0N(D[15]), .A1N(load), .Y(n65) );
  OAI2BB2XLTS U18 ( .B0(n90), .B1(load), .A0N(D[16]), .A1N(load), .Y(n64) );
  OAI2BB2XLTS U19 ( .B0(n89), .B1(load), .A0N(D[17]), .A1N(load), .Y(n63) );
  OAI2BB2XLTS U20 ( .B0(n88), .B1(load), .A0N(D[18]), .A1N(load), .Y(n62) );
  OAI2BB2XLTS U21 ( .B0(n87), .B1(load), .A0N(D[19]), .A1N(load), .Y(n61) );
  OAI2BB2XLTS U22 ( .B0(n86), .B1(load), .A0N(D[20]), .A1N(load), .Y(n60) );
  OAI2BB2XLTS U23 ( .B0(n85), .B1(load), .A0N(D[21]), .A1N(load), .Y(n59) );
  OAI2BB2XLTS U24 ( .B0(n84), .B1(load), .A0N(D[22]), .A1N(load), .Y(n58) );
  OAI2BB2XLTS U25 ( .B0(n83), .B1(load), .A0N(D[23]), .A1N(load), .Y(n57) );
  OAI2BB2XLTS U26 ( .B0(n82), .B1(load), .A0N(D[24]), .A1N(load), .Y(n56) );
  OAI2BB2XLTS U27 ( .B0(n81), .B1(load), .A0N(D[25]), .A1N(load), .Y(n54) );
  INVX2TS U28 ( .A(rst), .Y(n55) );
  DFFRX2TS Q_reg_25_ ( .D(n54), .CK(clk), .RN(n55), .Q(Q[25]), .QN(n81) );
  DFFRX2TS Q_reg_24_ ( .D(n56), .CK(clk), .RN(n55), .Q(Q[24]), .QN(n82) );
  DFFRX2TS Q_reg_23_ ( .D(n57), .CK(clk), .RN(n55), .Q(Q[23]), .QN(n83) );
  DFFRX2TS Q_reg_22_ ( .D(n58), .CK(clk), .RN(n55), .Q(Q[22]), .QN(n84) );
  DFFRX2TS Q_reg_19_ ( .D(n61), .CK(clk), .RN(n55), .Q(Q[19]), .QN(n87) );
  DFFRX2TS Q_reg_18_ ( .D(n62), .CK(clk), .RN(n55), .Q(Q[18]), .QN(n88) );
  DFFRX2TS Q_reg_17_ ( .D(n63), .CK(clk), .RN(n55), .Q(Q[17]), .QN(n89) );
  DFFRX2TS Q_reg_16_ ( .D(n64), .CK(clk), .RN(n55), .Q(Q[16]), .QN(n90) );
  DFFRX2TS Q_reg_21_ ( .D(n59), .CK(clk), .RN(n55), .Q(Q[21]), .QN(n85) );
  DFFRX2TS Q_reg_20_ ( .D(n60), .CK(clk), .RN(n55), .Q(Q[20]), .QN(n86) );
  DFFRXLTS Q_reg_5_ ( .D(n75), .CK(clk), .RN(n55), .Q(Q[5]), .QN(n101) );
  DFFRXLTS Q_reg_4_ ( .D(n76), .CK(clk), .RN(n55), .Q(Q[4]), .QN(n102) );
  DFFRXLTS Q_reg_9_ ( .D(n71), .CK(clk), .RN(n55), .Q(Q[9]), .QN(n97) );
  DFFRXLTS Q_reg_10_ ( .D(n70), .CK(clk), .RN(n55), .Q(Q[10]), .QN(n96) );
  DFFRXLTS Q_reg_15_ ( .D(n65), .CK(clk), .RN(n55), .Q(Q[15]), .QN(n91) );
  DFFRXLTS Q_reg_14_ ( .D(n66), .CK(clk), .RN(n55), .Q(Q[14]), .QN(n92) );
  DFFRXLTS Q_reg_12_ ( .D(n68), .CK(clk), .RN(n55), .Q(Q[12]), .QN(n94) );
  DFFRXLTS Q_reg_7_ ( .D(n73), .CK(clk), .RN(n55), .Q(Q[7]), .QN(n99) );
  DFFRXLTS Q_reg_6_ ( .D(n74), .CK(clk), .RN(n55), .Q(Q[6]), .QN(n100) );
  DFFRXLTS Q_reg_11_ ( .D(n69), .CK(clk), .RN(n55), .Q(Q[11]), .QN(n95) );
  DFFRXLTS Q_reg_13_ ( .D(n67), .CK(clk), .RN(n55), .Q(Q[13]), .QN(n93) );
  DFFRXLTS Q_reg_8_ ( .D(n72), .CK(clk), .RN(n55), .Q(Q[8]), .QN(n98) );
  DFFRXLTS Q_reg_0_ ( .D(n80), .CK(clk), .RN(n55), .Q(Q[0]), .QN(n106) );
  DFFRXLTS Q_reg_1_ ( .D(n79), .CK(clk), .RN(n55), .Q(Q[1]), .QN(n105) );
  DFFRXLTS Q_reg_3_ ( .D(n77), .CK(clk), .RN(n55), .Q(Q[3]), .QN(n103) );
  DFFRXLTS Q_reg_2_ ( .D(n78), .CK(clk), .RN(n55), .Q(Q[2]), .QN(n104) );
endmodule


module shift_mux_array_SWR26_LEVEL3 ( Data_i, select_i, bit_shift_i, Data_o );
  input [25:0] Data_i;
  output [25:0] Data_o;
  input select_i, bit_shift_i;
  wire   n1, n2;

  AO22X1TS U1 ( .A0(Data_i[17]), .A1(select_i), .B0(n1), .B1(Data_i[9]), .Y(
        Data_o[9]) );
  AO22X1TS U2 ( .A0(select_i), .A1(Data_i[16]), .B0(n1), .B1(Data_i[8]), .Y(
        Data_o[8]) );
  AO22X1TS U3 ( .A0(select_i), .A1(Data_i[15]), .B0(Data_i[7]), .B1(n1), .Y(
        Data_o[7]) );
  AO22X1TS U4 ( .A0(select_i), .A1(Data_i[14]), .B0(Data_i[6]), .B1(n1), .Y(
        Data_o[6]) );
  AO22X1TS U5 ( .A0(select_i), .A1(Data_i[13]), .B0(Data_i[5]), .B1(n1), .Y(
        Data_o[5]) );
  AO22X1TS U6 ( .A0(select_i), .A1(Data_i[12]), .B0(Data_i[4]), .B1(n1), .Y(
        Data_o[4]) );
  AO22X1TS U7 ( .A0(select_i), .A1(Data_i[11]), .B0(Data_i[3]), .B1(n1), .Y(
        Data_o[3]) );
  AO22X1TS U8 ( .A0(select_i), .A1(Data_i[10]), .B0(Data_i[2]), .B1(n1), .Y(
        Data_o[2]) );
  OAI2BB1X1TS U9 ( .A0N(n1), .A1N(Data_i[25]), .B0(n2), .Y(Data_o[25]) );
  OAI2BB1X1TS U10 ( .A0N(n1), .A1N(Data_i[24]), .B0(n2), .Y(Data_o[24]) );
  OAI2BB1X1TS U11 ( .A0N(n1), .A1N(Data_i[23]), .B0(n2), .Y(Data_o[23]) );
  OAI2BB1X1TS U12 ( .A0N(n1), .A1N(Data_i[22]), .B0(n2), .Y(Data_o[22]) );
  OAI2BB1X1TS U13 ( .A0N(n1), .A1N(Data_i[21]), .B0(n2), .Y(Data_o[21]) );
  OAI2BB1X1TS U14 ( .A0N(n1), .A1N(Data_i[20]), .B0(n2), .Y(Data_o[20]) );
  AO22X1TS U15 ( .A0(select_i), .A1(Data_i[9]), .B0(Data_i[1]), .B1(n1), .Y(
        Data_o[1]) );
  OAI2BB1X1TS U16 ( .A0N(n1), .A1N(Data_i[19]), .B0(n2), .Y(Data_o[19]) );
  OAI2BB1X1TS U17 ( .A0N(n1), .A1N(Data_i[18]), .B0(n2), .Y(Data_o[18]) );
  NAND2X1TS U18 ( .A(bit_shift_i), .B(select_i), .Y(n2) );
  AO22X1TS U19 ( .A0(select_i), .A1(Data_i[25]), .B0(n1), .B1(Data_i[17]), .Y(
        Data_o[17]) );
  AO22X1TS U20 ( .A0(select_i), .A1(Data_i[24]), .B0(n1), .B1(Data_i[16]), .Y(
        Data_o[16]) );
  AO22X1TS U21 ( .A0(select_i), .A1(Data_i[23]), .B0(n1), .B1(Data_i[15]), .Y(
        Data_o[15]) );
  AO22X1TS U22 ( .A0(select_i), .A1(Data_i[22]), .B0(n1), .B1(Data_i[14]), .Y(
        Data_o[14]) );
  AO22X1TS U23 ( .A0(select_i), .A1(Data_i[21]), .B0(n1), .B1(Data_i[13]), .Y(
        Data_o[13]) );
  AO22X1TS U24 ( .A0(select_i), .A1(Data_i[20]), .B0(n1), .B1(Data_i[12]), .Y(
        Data_o[12]) );
  AO22X1TS U25 ( .A0(select_i), .A1(Data_i[19]), .B0(n1), .B1(Data_i[11]), .Y(
        Data_o[11]) );
  AO22X1TS U26 ( .A0(select_i), .A1(Data_i[18]), .B0(n1), .B1(Data_i[10]), .Y(
        Data_o[10]) );
  AO22X1TS U27 ( .A0(select_i), .A1(Data_i[8]), .B0(Data_i[0]), .B1(n1), .Y(
        Data_o[0]) );
  CLKINVX1TS U28 ( .A(select_i), .Y(n1) );
endmodule


module shift_mux_array_SWR26_LEVEL4 ( Data_i, select_i, bit_shift_i, Data_o );
  input [25:0] Data_i;
  output [25:0] Data_o;
  input select_i, bit_shift_i;
  wire   n1, n2;

  AO22X1TS U1 ( .A0(Data_i[25]), .A1(select_i), .B0(Data_i[9]), .B1(n1), .Y(
        Data_o[9]) );
  AO22X1TS U2 ( .A0(select_i), .A1(Data_i[24]), .B0(Data_i[8]), .B1(n1), .Y(
        Data_o[8]) );
  AO22X1TS U3 ( .A0(select_i), .A1(Data_i[23]), .B0(Data_i[7]), .B1(n1), .Y(
        Data_o[7]) );
  AO22X1TS U4 ( .A0(select_i), .A1(Data_i[22]), .B0(Data_i[6]), .B1(n1), .Y(
        Data_o[6]) );
  AO22X1TS U5 ( .A0(select_i), .A1(Data_i[21]), .B0(Data_i[5]), .B1(n1), .Y(
        Data_o[5]) );
  AO22X1TS U6 ( .A0(select_i), .A1(Data_i[20]), .B0(Data_i[4]), .B1(n1), .Y(
        Data_o[4]) );
  AO22X1TS U7 ( .A0(select_i), .A1(Data_i[19]), .B0(Data_i[3]), .B1(n1), .Y(
        Data_o[3]) );
  AO22X1TS U8 ( .A0(select_i), .A1(Data_i[18]), .B0(Data_i[2]), .B1(n1), .Y(
        Data_o[2]) );
  OAI2BB1X1TS U9 ( .A0N(n1), .A1N(Data_i[25]), .B0(n2), .Y(Data_o[25]) );
  OAI2BB1X1TS U10 ( .A0N(n1), .A1N(Data_i[24]), .B0(n2), .Y(Data_o[24]) );
  OAI2BB1X1TS U11 ( .A0N(n1), .A1N(Data_i[23]), .B0(n2), .Y(Data_o[23]) );
  OAI2BB1X1TS U12 ( .A0N(n1), .A1N(Data_i[22]), .B0(n2), .Y(Data_o[22]) );
  OAI2BB1X1TS U13 ( .A0N(n1), .A1N(Data_i[21]), .B0(n2), .Y(Data_o[21]) );
  OAI2BB1X1TS U14 ( .A0N(n1), .A1N(Data_i[20]), .B0(n2), .Y(Data_o[20]) );
  AO22X1TS U15 ( .A0(select_i), .A1(Data_i[17]), .B0(Data_i[1]), .B1(n1), .Y(
        Data_o[1]) );
  OAI2BB1X1TS U16 ( .A0N(n1), .A1N(Data_i[19]), .B0(n2), .Y(Data_o[19]) );
  OAI2BB1X1TS U17 ( .A0N(n1), .A1N(Data_i[18]), .B0(n2), .Y(Data_o[18]) );
  OAI2BB1X1TS U18 ( .A0N(n1), .A1N(Data_i[17]), .B0(n2), .Y(Data_o[17]) );
  OAI2BB1X1TS U19 ( .A0N(n1), .A1N(Data_i[16]), .B0(n2), .Y(Data_o[16]) );
  OAI2BB1X1TS U20 ( .A0N(Data_i[15]), .A1N(n1), .B0(n2), .Y(Data_o[15]) );
  OAI2BB1X1TS U21 ( .A0N(Data_i[14]), .A1N(n1), .B0(n2), .Y(Data_o[14]) );
  OAI2BB1X1TS U22 ( .A0N(Data_i[13]), .A1N(n1), .B0(n2), .Y(Data_o[13]) );
  OAI2BB1X1TS U23 ( .A0N(Data_i[12]), .A1N(n1), .B0(n2), .Y(Data_o[12]) );
  OAI2BB1X1TS U24 ( .A0N(Data_i[11]), .A1N(n1), .B0(n2), .Y(Data_o[11]) );
  OAI2BB1X1TS U25 ( .A0N(Data_i[10]), .A1N(n1), .B0(n2), .Y(Data_o[10]) );
  NAND2X1TS U26 ( .A(bit_shift_i), .B(select_i), .Y(n2) );
  AO22X1TS U27 ( .A0(select_i), .A1(Data_i[16]), .B0(Data_i[0]), .B1(n1), .Y(
        Data_o[0]) );
  CLKINVX1TS U28 ( .A(select_i), .Y(n1) );
endmodule


module Multiplexer_AC_W1_26 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  CLKINVX1TS U2 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_25 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  CLKINVX1TS U2 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_24 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  CLKINVX1TS U2 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_23 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  CLKINVX1TS U2 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_22 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  CLKINVX1TS U2 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_21 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  CLKINVX1TS U2 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_20 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  CLKINVX1TS U2 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_19 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  CLKINVX1TS U2 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_18 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  CLKINVX1TS U2 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_17 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  CLKINVX1TS U2 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_16 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  CLKINVX1TS U2 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_15 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  CLKINVX1TS U2 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_14 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  CLKINVX1TS U2 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_13 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  CLKINVX1TS U2 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_12 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  CLKINVX1TS U2 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_11 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  CLKINVX1TS U2 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_10 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  CLKINVX1TS U2 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_9 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  CLKINVX1TS U2 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_8 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  CLKINVX1TS U2 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_7 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  CLKINVX1TS U2 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_6 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  CLKINVX1TS U2 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_5 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  CLKINVX1TS U2 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_4 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  CLKINVX1TS U2 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_3 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  CLKINVX1TS U2 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_2 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  CLKINVX1TS U2 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_1 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(ctrl), .B1(D1[0]), .Y(S[0]) );
  CLKINVX1TS U2 ( .A(ctrl), .Y(n2) );
endmodule


module Rotate_Mux_Array_SWR26_1 ( Data_i, select_i, Data_o );
  input [25:0] Data_i;
  output [25:0] Data_o;
  input select_i;


  Multiplexer_AC_W1_26 MUX_ARRAY_0__MUX_ARRAY12_rotate_mux ( .ctrl(select_i), 
        .D0(Data_i[0]), .D1(Data_i[25]), .S(Data_o[0]) );
  Multiplexer_AC_W1_25 MUX_ARRAY_1__MUX_ARRAY12_rotate_mux ( .ctrl(select_i), 
        .D0(Data_i[1]), .D1(Data_i[24]), .S(Data_o[1]) );
  Multiplexer_AC_W1_24 MUX_ARRAY_2__MUX_ARRAY12_rotate_mux ( .ctrl(select_i), 
        .D0(Data_i[2]), .D1(Data_i[23]), .S(Data_o[2]) );
  Multiplexer_AC_W1_23 MUX_ARRAY_3__MUX_ARRAY12_rotate_mux ( .ctrl(select_i), 
        .D0(Data_i[3]), .D1(Data_i[22]), .S(Data_o[3]) );
  Multiplexer_AC_W1_22 MUX_ARRAY_4__MUX_ARRAY12_rotate_mux ( .ctrl(select_i), 
        .D0(Data_i[4]), .D1(Data_i[21]), .S(Data_o[4]) );
  Multiplexer_AC_W1_21 MUX_ARRAY_5__MUX_ARRAY12_rotate_mux ( .ctrl(select_i), 
        .D0(Data_i[5]), .D1(Data_i[20]), .S(Data_o[5]) );
  Multiplexer_AC_W1_20 MUX_ARRAY_6__MUX_ARRAY12_rotate_mux ( .ctrl(select_i), 
        .D0(Data_i[6]), .D1(Data_i[19]), .S(Data_o[6]) );
  Multiplexer_AC_W1_19 MUX_ARRAY_7__MUX_ARRAY12_rotate_mux ( .ctrl(select_i), 
        .D0(Data_i[7]), .D1(Data_i[18]), .S(Data_o[7]) );
  Multiplexer_AC_W1_18 MUX_ARRAY_8__MUX_ARRAY12_rotate_mux ( .ctrl(select_i), 
        .D0(Data_i[8]), .D1(Data_i[17]), .S(Data_o[8]) );
  Multiplexer_AC_W1_17 MUX_ARRAY_9__MUX_ARRAY12_rotate_mux ( .ctrl(select_i), 
        .D0(Data_i[9]), .D1(Data_i[16]), .S(Data_o[9]) );
  Multiplexer_AC_W1_16 MUX_ARRAY_10__MUX_ARRAY12_rotate_mux ( .ctrl(select_i), 
        .D0(Data_i[10]), .D1(Data_i[15]), .S(Data_o[10]) );
  Multiplexer_AC_W1_15 MUX_ARRAY_11__MUX_ARRAY12_rotate_mux ( .ctrl(select_i), 
        .D0(Data_i[11]), .D1(Data_i[14]), .S(Data_o[11]) );
  Multiplexer_AC_W1_14 MUX_ARRAY_12__MUX_ARRAY12_rotate_mux ( .ctrl(select_i), 
        .D0(Data_i[12]), .D1(Data_i[13]), .S(Data_o[12]) );
  Multiplexer_AC_W1_13 MUX_ARRAY_13__MUX_ARRAY12_rotate_mux ( .ctrl(select_i), 
        .D0(Data_i[13]), .D1(Data_i[12]), .S(Data_o[13]) );
  Multiplexer_AC_W1_12 MUX_ARRAY_14__MUX_ARRAY12_rotate_mux ( .ctrl(select_i), 
        .D0(Data_i[14]), .D1(Data_i[11]), .S(Data_o[14]) );
  Multiplexer_AC_W1_11 MUX_ARRAY_15__MUX_ARRAY12_rotate_mux ( .ctrl(select_i), 
        .D0(Data_i[15]), .D1(Data_i[10]), .S(Data_o[15]) );
  Multiplexer_AC_W1_10 MUX_ARRAY_16__MUX_ARRAY12_rotate_mux ( .ctrl(select_i), 
        .D0(Data_i[16]), .D1(Data_i[9]), .S(Data_o[16]) );
  Multiplexer_AC_W1_9 MUX_ARRAY_17__MUX_ARRAY12_rotate_mux ( .ctrl(select_i), 
        .D0(Data_i[17]), .D1(Data_i[8]), .S(Data_o[17]) );
  Multiplexer_AC_W1_8 MUX_ARRAY_18__MUX_ARRAY12_rotate_mux ( .ctrl(select_i), 
        .D0(Data_i[18]), .D1(Data_i[7]), .S(Data_o[18]) );
  Multiplexer_AC_W1_7 MUX_ARRAY_19__MUX_ARRAY12_rotate_mux ( .ctrl(select_i), 
        .D0(Data_i[19]), .D1(Data_i[6]), .S(Data_o[19]) );
  Multiplexer_AC_W1_6 MUX_ARRAY_20__MUX_ARRAY12_rotate_mux ( .ctrl(select_i), 
        .D0(Data_i[20]), .D1(Data_i[5]), .S(Data_o[20]) );
  Multiplexer_AC_W1_5 MUX_ARRAY_21__MUX_ARRAY12_rotate_mux ( .ctrl(select_i), 
        .D0(Data_i[21]), .D1(Data_i[4]), .S(Data_o[21]) );
  Multiplexer_AC_W1_4 MUX_ARRAY_22__MUX_ARRAY12_rotate_mux ( .ctrl(select_i), 
        .D0(Data_i[22]), .D1(Data_i[3]), .S(Data_o[22]) );
  Multiplexer_AC_W1_3 MUX_ARRAY_23__MUX_ARRAY12_rotate_mux ( .ctrl(select_i), 
        .D0(Data_i[23]), .D1(Data_i[2]), .S(Data_o[23]) );
  Multiplexer_AC_W1_2 MUX_ARRAY_24__MUX_ARRAY12_rotate_mux ( .ctrl(select_i), 
        .D0(Data_i[24]), .D1(Data_i[1]), .S(Data_o[24]) );
  Multiplexer_AC_W1_1 MUX_ARRAY_25__MUX_ARRAY12_rotate_mux ( .ctrl(select_i), 
        .D0(Data_i[25]), .D1(Data_i[0]), .S(Data_o[25]) );
endmodule


module Mux_Array_SWR26_EWR5 ( clk, rst, load_i, Data_i, FSM_left_right_i, 
        Shift_Value_i, bit_shift_i, Data_o );
  input [25:0] Data_i;
  input [4:0] Shift_Value_i;
  output [25:0] Data_o;
  input clk, rst, load_i, FSM_left_right_i, bit_shift_i;

  wire   [181:0] Data_array;

  Rotate_Mux_Array_SWR26_0 first_rotate ( .Data_i(Data_i), .select_i(
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
  RegisterAdd_W26_1 Mid_Reg ( .clk(clk), .rst(rst), .load(1'b1), .D(
        Data_array[103:78]), .Q(Data_array[129:104]) );
  shift_mux_array_SWR26_LEVEL3 SHIFT_2LVLS_3__shift_mux_array ( .Data_i(
        Data_array[129:104]), .select_i(Shift_Value_i[3]), .bit_shift_i(
        bit_shift_i), .Data_o(Data_array[155:130]) );
  shift_mux_array_SWR26_LEVEL4 SHIFT_2LVLS_4__shift_mux_array ( .Data_i(
        Data_array[155:130]), .select_i(Shift_Value_i[4]), .bit_shift_i(
        bit_shift_i), .Data_o(Data_array[181:156]) );
  Rotate_Mux_Array_SWR26_1 last_rotate ( .Data_i(Data_array[181:156]), 
        .select_i(FSM_left_right_i), .Data_o(Data_o) );
endmodule


module add_sub_carry_out_W26_DW01_sub_0 ( A, B, CI, DIFF, CO );
  input [26:0] A;
  input [26:0] B;
  output [26:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2;
  wire   [26:1] carry;
  wire   [25:0] B_not;

  ADDFHX4TS U2_25 ( .A(A[25]), .B(B_not[25]), .CI(carry[25]), .CO(carry[26]), 
        .S(DIFF[25]) );
  INVX12TS U1_25 ( .A(B[25]), .Y(B_not[25]) );
  ADDFHX4TS U2_24 ( .A(A[24]), .B(B_not[24]), .CI(carry[24]), .CO(carry[25]), 
        .S(DIFF[24]) );
  INVX12TS U1_24 ( .A(B[24]), .Y(B_not[24]) );
  ADDFHX4TS U2_23 ( .A(A[23]), .B(B_not[23]), .CI(carry[23]), .CO(carry[24]), 
        .S(DIFF[23]) );
  INVX12TS U1_23 ( .A(B[23]), .Y(B_not[23]) );
  ADDFHX4TS U2_22 ( .A(A[22]), .B(B_not[22]), .CI(carry[22]), .CO(carry[23]), 
        .S(DIFF[22]) );
  INVX12TS U1_22 ( .A(B[22]), .Y(B_not[22]) );
  ADDFHX4TS U2_21 ( .A(A[21]), .B(B_not[21]), .CI(carry[21]), .CO(carry[22]), 
        .S(DIFF[21]) );
  INVX12TS U1_21 ( .A(B[21]), .Y(B_not[21]) );
  ADDFHX4TS U2_20 ( .A(A[20]), .B(B_not[20]), .CI(carry[20]), .CO(carry[21]), 
        .S(DIFF[20]) );
  INVX12TS U1_20 ( .A(B[20]), .Y(B_not[20]) );
  ADDFHX4TS U2_19 ( .A(A[19]), .B(B_not[19]), .CI(carry[19]), .CO(carry[20]), 
        .S(DIFF[19]) );
  INVX12TS U1_19 ( .A(B[19]), .Y(B_not[19]) );
  ADDFHX4TS U2_18 ( .A(A[18]), .B(B_not[18]), .CI(carry[18]), .CO(carry[19]), 
        .S(DIFF[18]) );
  INVX12TS U1_18 ( .A(B[18]), .Y(B_not[18]) );
  ADDFHX4TS U2_17 ( .A(A[17]), .B(B_not[17]), .CI(carry[17]), .CO(carry[18]), 
        .S(DIFF[17]) );
  INVX12TS U1_17 ( .A(B[17]), .Y(B_not[17]) );
  ADDFHX4TS U2_16 ( .A(A[16]), .B(B_not[16]), .CI(carry[16]), .CO(carry[17]), 
        .S(DIFF[16]) );
  INVX12TS U1_16 ( .A(B[16]), .Y(B_not[16]) );
  ADDFHX4TS U2_15 ( .A(A[15]), .B(B_not[15]), .CI(carry[15]), .CO(carry[16]), 
        .S(DIFF[15]) );
  INVX12TS U1_15 ( .A(B[15]), .Y(B_not[15]) );
  ADDFHX4TS U2_14 ( .A(A[14]), .B(B_not[14]), .CI(carry[14]), .CO(carry[15]), 
        .S(DIFF[14]) );
  INVX12TS U1_14 ( .A(B[14]), .Y(B_not[14]) );
  ADDFHX4TS U2_13 ( .A(A[13]), .B(B_not[13]), .CI(carry[13]), .CO(carry[14]), 
        .S(DIFF[13]) );
  INVX12TS U1_13 ( .A(B[13]), .Y(B_not[13]) );
  ADDFHX4TS U2_12 ( .A(A[12]), .B(B_not[12]), .CI(carry[12]), .CO(carry[13]), 
        .S(DIFF[12]) );
  INVX12TS U1_12 ( .A(B[12]), .Y(B_not[12]) );
  ADDFHX4TS U2_11 ( .A(A[11]), .B(B_not[11]), .CI(carry[11]), .CO(carry[12]), 
        .S(DIFF[11]) );
  INVX12TS U1_11 ( .A(B[11]), .Y(B_not[11]) );
  ADDFHX4TS U2_10 ( .A(A[10]), .B(B_not[10]), .CI(carry[10]), .CO(carry[11]), 
        .S(DIFF[10]) );
  INVX12TS U1_10 ( .A(B[10]), .Y(B_not[10]) );
  ADDFHX4TS U2_9 ( .A(A[9]), .B(B_not[9]), .CI(carry[9]), .CO(carry[10]), .S(
        DIFF[9]) );
  INVX12TS U1_9 ( .A(B[9]), .Y(B_not[9]) );
  ADDFHX4TS U2_8 ( .A(A[8]), .B(B_not[8]), .CI(carry[8]), .CO(carry[9]), .S(
        DIFF[8]) );
  INVX12TS U1_8 ( .A(B[8]), .Y(B_not[8]) );
  ADDFHX4TS U2_7 ( .A(A[7]), .B(B_not[7]), .CI(carry[7]), .CO(carry[8]), .S(
        DIFF[7]) );
  INVX12TS U1_7 ( .A(B[7]), .Y(B_not[7]) );
  ADDFHX4TS U2_6 ( .A(A[6]), .B(B_not[6]), .CI(carry[6]), .CO(carry[7]), .S(
        DIFF[6]) );
  INVX12TS U1_6 ( .A(B[6]), .Y(B_not[6]) );
  ADDFHX4TS U2_5 ( .A(A[5]), .B(B_not[5]), .CI(carry[5]), .CO(carry[6]), .S(
        DIFF[5]) );
  INVX12TS U1_5 ( .A(B[5]), .Y(B_not[5]) );
  ADDFHX4TS U2_4 ( .A(A[4]), .B(B_not[4]), .CI(carry[4]), .CO(carry[5]), .S(
        DIFF[4]) );
  INVX12TS U1_4 ( .A(B[4]), .Y(B_not[4]) );
  ADDFHX4TS U2_3 ( .A(A[3]), .B(B_not[3]), .CI(carry[3]), .CO(carry[4]), .S(
        DIFF[3]) );
  INVX12TS U1_3 ( .A(B[3]), .Y(B_not[3]) );
  ADDFHX4TS U2_2 ( .A(A[2]), .B(B_not[2]), .CI(carry[2]), .CO(carry[3]), .S(
        DIFF[2]) );
  INVX12TS U1_2 ( .A(B[2]), .Y(B_not[2]) );
  ADDFHX4TS U2_1 ( .A(A[1]), .B(B_not[1]), .CI(carry[1]), .CO(carry[2]), .S(
        DIFF[1]) );
  INVX12TS U1_1 ( .A(B[1]), .Y(B_not[1]) );
  INVX12TS U1_0 ( .A(B[0]), .Y(B_not[0]) );
  NAND2X8TS U1 ( .A(n1), .B(n2), .Y(carry[1]) );
  XNOR2X4TS U2 ( .A(B_not[0]), .B(A[0]), .Y(DIFF[0]) );
  INVX12TS U3 ( .A(B_not[0]), .Y(n1) );
  INVX12TS U4 ( .A(A[0]), .Y(n2) );
  INVX12TS U5 ( .A(carry[26]), .Y(DIFF[26]) );
endmodule


module add_sub_carry_out_W26_DW01_add_0 ( A, B, CI, SUM, CO );
  input [26:0] A;
  input [26:0] B;
  output [26:0] SUM;
  input CI;
  output CO;
  wire   n1, n2;
  wire   [25:1] carry;

  ADDFHX4TS U1_25 ( .A(A[25]), .B(B[25]), .CI(carry[25]), .CO(SUM[26]), .S(
        SUM[25]) );
  ADDFHX4TS U1_24 ( .A(A[24]), .B(B[24]), .CI(carry[24]), .CO(carry[25]), .S(
        SUM[24]) );
  ADDFHX4TS U1_23 ( .A(A[23]), .B(B[23]), .CI(carry[23]), .CO(carry[24]), .S(
        SUM[23]) );
  ADDFHX4TS U1_22 ( .A(A[22]), .B(B[22]), .CI(carry[22]), .CO(carry[23]), .S(
        SUM[22]) );
  ADDFHX4TS U1_21 ( .A(A[21]), .B(B[21]), .CI(carry[21]), .CO(carry[22]), .S(
        SUM[21]) );
  ADDFHX4TS U1_20 ( .A(A[20]), .B(B[20]), .CI(carry[20]), .CO(carry[21]), .S(
        SUM[20]) );
  ADDFHX4TS U1_19 ( .A(A[19]), .B(B[19]), .CI(carry[19]), .CO(carry[20]), .S(
        SUM[19]) );
  ADDFHX4TS U1_18 ( .A(A[18]), .B(B[18]), .CI(carry[18]), .CO(carry[19]), .S(
        SUM[18]) );
  ADDFHX4TS U1_17 ( .A(A[17]), .B(B[17]), .CI(carry[17]), .CO(carry[18]), .S(
        SUM[17]) );
  ADDFHX4TS U1_16 ( .A(A[16]), .B(B[16]), .CI(carry[16]), .CO(carry[17]), .S(
        SUM[16]) );
  ADDFHX4TS U1_15 ( .A(A[15]), .B(B[15]), .CI(carry[15]), .CO(carry[16]), .S(
        SUM[15]) );
  ADDFHX4TS U1_14 ( .A(A[14]), .B(B[14]), .CI(carry[14]), .CO(carry[15]), .S(
        SUM[14]) );
  ADDFHX4TS U1_13 ( .A(A[13]), .B(B[13]), .CI(carry[13]), .CO(carry[14]), .S(
        SUM[13]) );
  ADDFHX4TS U1_12 ( .A(A[12]), .B(B[12]), .CI(carry[12]), .CO(carry[13]), .S(
        SUM[12]) );
  ADDFHX4TS U1_11 ( .A(A[11]), .B(B[11]), .CI(carry[11]), .CO(carry[12]), .S(
        SUM[11]) );
  ADDFHX4TS U1_10 ( .A(A[10]), .B(B[10]), .CI(carry[10]), .CO(carry[11]), .S(
        SUM[10]) );
  ADDFHX4TS U1_9 ( .A(A[9]), .B(B[9]), .CI(carry[9]), .CO(carry[10]), .S(
        SUM[9]) );
  ADDFHX4TS U1_8 ( .A(A[8]), .B(B[8]), .CI(carry[8]), .CO(carry[9]), .S(SUM[8]) );
  ADDFHX4TS U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  ADDFHX4TS U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDFHX4TS U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDFHX4TS U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDFHX4TS U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDFHX4TS U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDFHX4TS U1_1 ( .A(A[1]), .B(B[1]), .CI(carry[1]), .CO(carry[2]), .S(SUM[1]) );
  NOR2X8TS U1 ( .A(n1), .B(n2), .Y(carry[1]) );
  INVX12TS U2 ( .A(A[0]), .Y(n1) );
  INVX12TS U3 ( .A(B[0]), .Y(n2) );
  XNOR2X4TS U4 ( .A(B[0]), .B(n1), .Y(SUM[0]) );
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
         selector_D, rst_int, FSM_selector_A, FSM_selector_D, real_op,
         sign_final_result, S_A_S_op, Add_Sub_Sgf_op_mux_n1,
         Rounding_Decoder_n4, Rounding_Decoder_n3, Rounding_Decoder_n2,
         Rounding_Decoder_n1, Rounding_Decoder_N37, Rounding_Decoder_N35,
         Rounding_Decoder_N33, Rounding_Decoder_N30, Rounding_Decoder_N29,
         Rounding_Decoder_N28, Rounding_Decoder_N27, Rounding_Decoder_N26,
         Rounding_Decoder_N25, Rounding_Decoder_N24, Rounding_Decoder_N23,
         Rounding_Decoder_N22, Rounding_Decoder_N21, Rounding_Decoder_N20,
         Rounding_Decoder_N19, Rounding_Decoder_N18, Rounding_Decoder_N17,
         Rounding_Decoder_N16, Rounding_Decoder_N15, Rounding_Decoder_N14,
         Rounding_Decoder_N13, Rounding_Decoder_N12, Rounding_Decoder_N11,
         Rounding_Decoder_N10, Rounding_Decoder_N9, Rounding_Decoder_N8,
         Rounding_Decoder_N7, Barrel_Shifter_module_Output_Reg_n53,
         Barrel_Shifter_module_Output_Reg_n52,
         Barrel_Shifter_module_Output_Reg_n51,
         Barrel_Shifter_module_Output_Reg_n50,
         Barrel_Shifter_module_Output_Reg_n49,
         Barrel_Shifter_module_Output_Reg_n48,
         Barrel_Shifter_module_Output_Reg_n47,
         Barrel_Shifter_module_Output_Reg_n46,
         Barrel_Shifter_module_Output_Reg_n45,
         Barrel_Shifter_module_Output_Reg_n44,
         Barrel_Shifter_module_Output_Reg_n43,
         Barrel_Shifter_module_Output_Reg_n42,
         Barrel_Shifter_module_Output_Reg_n41,
         Barrel_Shifter_module_Output_Reg_n40,
         Barrel_Shifter_module_Output_Reg_n39,
         Barrel_Shifter_module_Output_Reg_n38,
         Barrel_Shifter_module_Output_Reg_n37,
         Barrel_Shifter_module_Output_Reg_n36,
         Barrel_Shifter_module_Output_Reg_n35,
         Barrel_Shifter_module_Output_Reg_n34,
         Barrel_Shifter_module_Output_Reg_n33,
         Barrel_Shifter_module_Output_Reg_n32,
         Barrel_Shifter_module_Output_Reg_n31,
         Barrel_Shifter_module_Output_Reg_n30,
         Barrel_Shifter_module_Output_Reg_n29,
         Barrel_Shifter_module_Output_Reg_n28,
         Barrel_Shifter_module_Output_Reg_n27,
         Barrel_Shifter_module_Output_Reg_n25,
         Barrel_Shifter_module_Output_Reg_n24,
         Barrel_Shifter_module_Output_Reg_n23,
         Barrel_Shifter_module_Output_Reg_n22,
         Barrel_Shifter_module_Output_Reg_n21,
         Barrel_Shifter_module_Output_Reg_n20,
         Barrel_Shifter_module_Output_Reg_n19,
         Barrel_Shifter_module_Output_Reg_n18,
         Barrel_Shifter_module_Output_Reg_n17,
         Barrel_Shifter_module_Output_Reg_n16,
         Barrel_Shifter_module_Output_Reg_n15,
         Barrel_Shifter_module_Output_Reg_n14,
         Barrel_Shifter_module_Output_Reg_n13,
         Barrel_Shifter_module_Output_Reg_n12,
         Barrel_Shifter_module_Output_Reg_n11,
         Barrel_Shifter_module_Output_Reg_n10,
         Barrel_Shifter_module_Output_Reg_n9,
         Barrel_Shifter_module_Output_Reg_n8,
         Barrel_Shifter_module_Output_Reg_n7,
         Barrel_Shifter_module_Output_Reg_n6,
         Barrel_Shifter_module_Output_Reg_n5,
         Barrel_Shifter_module_Output_Reg_n4, Add_Subt_Sgf_module_Sgf_AS_n7,
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
         Add_Subt_Sgf_module_Sgf_AS_N30, Add_Subt_Sgf_module_Sgf_AS_N29,
         Add_Subt_Sgf_module_Sgf_AS_N28, Add_Subt_Sgf_module_Sgf_AS_N27,
         Add_Subt_Sgf_module_Sgf_AS_N26, Add_Subt_Sgf_module_Sgf_AS_N25,
         Add_Subt_Sgf_module_Sgf_AS_N24, Add_Subt_Sgf_module_Sgf_AS_N23,
         Add_Subt_Sgf_module_Sgf_AS_N22, Add_Subt_Sgf_module_Sgf_AS_N21,
         Add_Subt_Sgf_module_Sgf_AS_N20, Add_Subt_Sgf_module_Sgf_AS_N19,
         Add_Subt_Sgf_module_Sgf_AS_N18, Add_Subt_Sgf_module_Sgf_AS_N17,
         Add_Subt_Sgf_module_Sgf_AS_N16, Add_Subt_Sgf_module_Sgf_AS_N15,
         Add_Subt_Sgf_module_Sgf_AS_N14, Add_Subt_Sgf_module_Sgf_AS_N13,
         Add_Subt_Sgf_module_Sgf_AS_N12, Add_Subt_Sgf_module_Sgf_AS_N11,
         Add_Subt_Sgf_module_Sgf_AS_N10, Add_Subt_Sgf_module_Sgf_AS_N9,
         Add_Subt_Sgf_module_Sgf_AS_N8, Add_Subt_Sgf_module_Sgf_AS_N7,
         Add_Subt_Sgf_module_Sgf_AS_N6, Add_Subt_Sgf_module_Sgf_AS_N5,
         Add_Subt_Sgf_module_Sgf_AS_N4, Add_Subt_Sgf_module_Sgf_AS_N3, n1, n2,
         n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17,
         n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31,
         n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45,
         n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59,
         n60, n61, n62, n63, n64;
  wire   [1:0] selector_B;
  wire   [1:0] FSM_selector_B;
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
  wire   [25:0] S_A_S_Oper_A;
  wire   [25:0] S_A_S_Oper_B;
  wire   [25:0] Add_Subt_LZD;
  wire   [25:0] Barrel_Shifter_module_Data_Reg;
  wire   [26:0] Add_Subt_Sgf_module_S_to_D;

  FSM_Add_Subtract FS_Module ( .clk(clk), .rst(rst), .rst_FSM(ack_FSM), 
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
  RegisterAdd_W1_0 Sel_A ( .clk(clk), .rst(rst_int), .load(selector_A), .D(
        1'b1), .Q(FSM_selector_A) );
  RegisterAdd_W1_7 Sel_C ( .clk(clk), .rst(rst_int), .load(selector_C), .D(
        1'b1), .Q(FSM_selector_C) );
  RegisterAdd_W2 Sel_B ( .clk(clk), .rst(rst_int), .load(load_b), .D(
        selector_B), .Q(FSM_selector_B) );
  Oper_Start_In_W32 Oper_Start_in_module ( .clk(clk), .rst(rst_int), 
        .load_a_i(FSM_op_start_in_load_a), .load_b_i(FSM_op_start_in_load_b), 
        .add_subt_i(add_subt), .Data_X_i(Data_X), .Data_Y_i(Data_Y), .DMP_o(
        DMP), .DmP_o(DmP), .zero_flag_o(zero_flag), .real_op_o(real_op), 
        .sign_final_result_o(sign_final_result) );
  Multiplexer_AC_W8_0 Exp_Oper_A_mux ( .ctrl(FSM_selector_A), .D0(DMP[30:23]), 
        .D1(exp_oper_result), .S(S_Oper_A_exp) );
  Mux_3x1_W8 Exp_Oper_B_mux ( .ctrl(FSM_selector_B), .D0(DmP[30:23]), .D1({
        1'b0, 1'b0, 1'b0, LZA_output}), .D2({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b1}), .S(S_Oper_B_exp) );
  Exp_Operation_EW8 Exp_Operation_Module ( .clk(clk), .rst(rst_int), 
        .load_a_i(FSM_exp_operation_load_diff), .load_b_i(
        FSM_exp_operation_load_OU), .Data_A_i(S_Oper_A_exp), .Data_B_i(
        S_Oper_B_exp), .Add_Subt_i(FSM_exp_operation_A_S), .Data_Result_o(
        exp_oper_result), .Overflow_flag_o(overflow_flag), .Underflow_flag_o(
        underflow_flag) );
  Mux_3x1_W5 Barrel_Shifter_S_V_mux ( .ctrl(FSM_selector_B), .D0(
        exp_oper_result[4:0]), .D1(LZA_output), .D2({1'b0, 1'b0, 1'b0, 1'b0, 
        1'b1}), .S(S_Shift_Value) );
  Multiplexer_AC_W26_0 Barrel_Shifter_D_I_mux ( .ctrl(FSM_selector_C), .D0({
        1'b1, DmP[22:0], 1'b0, 1'b0}), .D1(Add_Subt_result), .S(S_Data_Shift)
         );
  LZD_SWR26_EWR5 Leading_Zero_Detector_Module ( .clk(clk), .rst(rst_int), 
        .load_i(FSM_LZA_load), .Add_subt_result_i(Add_Subt_LZD), 
        .Shift_Value_o(LZA_output) );
  Tenth_Phase_W32_EW8_SW23 final_result_ieee_Module ( .clk(clk), .rst(rst_int), 
        .load_i(FSM_Final_Result_load), .sel_a_i(overflow_flag), .sel_b_i(
        underflow_flag), .sign_i(sign_final_result), .exp_ieee_i(
        exp_oper_result), .sgf_ieee_i(Sgf_normalized_result[24:2]), 
        .final_result_ieee_o(final_result_ieee) );
  Mux_Array_SWR26_EWR5 Barrel_Shifter_module_Mux_Array ( .clk(clk), .rst(
        rst_int), .load_i(FSM_barrel_shifter_load), .Data_i(S_Data_Shift), 
        .FSM_left_right_i(FSM_barrel_shifter_L_R), .Shift_Value_i(
        S_Shift_Value), .bit_shift_i(FSM_barrel_shifter_B_S), .Data_o(
        Barrel_Shifter_module_Data_Reg) );
  CLKINVX1TS Add_Sub_Sgf_op_mux_U2 ( .A(FSM_selector_D), .Y(
        Add_Sub_Sgf_op_mux_n1) );
  CLKINVX1TS Rounding_Decoder_U13 ( .A(Rounding_Decoder_N7), .Y(
        Rounding_Decoder_n2) );
  NAND2BX1TS Rounding_Decoder_U12 ( .AN(Rounding_Decoder_N10), .B(
        Rounding_Decoder_n2), .Y(Rounding_Decoder_N11) );
  CLKINVX1TS Rounding_Decoder_U11 ( .A(Rounding_Decoder_N14), .Y(
        Rounding_Decoder_n4) );
  NAND2X1TS Rounding_Decoder_U10 ( .A(Rounding_Decoder_N7), .B(
        Rounding_Decoder_n4), .Y(Rounding_Decoder_N15) );
  NAND2X1TS Rounding_Decoder_U9 ( .A(Rounding_Decoder_n2), .B(
        Rounding_Decoder_n4), .Y(Rounding_Decoder_N17) );
  NAND2BX1TS Rounding_Decoder_U8 ( .AN(Rounding_Decoder_N21), .B(
        Rounding_Decoder_n2), .Y(Rounding_Decoder_N22) );
  CLKINVX1TS Rounding_Decoder_U7 ( .A(Rounding_Decoder_N25), .Y(
        Rounding_Decoder_n3) );
  NAND2X1TS Rounding_Decoder_U6 ( .A(Rounding_Decoder_N7), .B(
        Rounding_Decoder_n3), .Y(Rounding_Decoder_N26) );
  NAND2X1TS Rounding_Decoder_U5 ( .A(Rounding_Decoder_n2), .B(
        Rounding_Decoder_n3), .Y(Rounding_Decoder_N28) );
  OR3X1TS Rounding_Decoder_U4 ( .A(Rounding_Decoder_N29), .B(
        Rounding_Decoder_N27), .C(Rounding_Decoder_N23), .Y(
        Rounding_Decoder_n1) );
  OR4X1TS Rounding_Decoder_U3 ( .A(Rounding_Decoder_N18), .B(
        Rounding_Decoder_N16), .C(Rounding_Decoder_N12), .D(
        Rounding_Decoder_n1), .Y(round_flag) );
  OR2X8TS Rounding_Decoder_C7 ( .A(Rounding_Decoder_N30), .B(r_mode[1]), .Y(
        Rounding_Decoder_N8) );
  OR2X8TS Rounding_Decoder_C8 ( .A(Rounding_Decoder_N33), .B(
        Sgf_normalized_result[1]), .Y(Rounding_Decoder_N9) );
  OR2X8TS Rounding_Decoder_C9 ( .A(Rounding_Decoder_N8), .B(
        Rounding_Decoder_N9), .Y(Rounding_Decoder_N10) );
  OR2X8TS Rounding_Decoder_C16 ( .A(Rounding_Decoder_N33), .B(
        Rounding_Decoder_N37), .Y(Rounding_Decoder_N13) );
  OR2X8TS Rounding_Decoder_C17 ( .A(Rounding_Decoder_N8), .B(
        Rounding_Decoder_N13), .Y(Rounding_Decoder_N14) );
  OR2X8TS Rounding_Decoder_C31 ( .A(sign_final_result), .B(
        Rounding_Decoder_N35), .Y(Rounding_Decoder_N19) );
  OR2X8TS Rounding_Decoder_C32 ( .A(r_mode[0]), .B(Sgf_normalized_result[1]), 
        .Y(Rounding_Decoder_N20) );
  OR2X8TS Rounding_Decoder_C33 ( .A(Rounding_Decoder_N19), .B(
        Rounding_Decoder_N20), .Y(Rounding_Decoder_N21) );
  OR2X8TS Rounding_Decoder_C39 ( .A(r_mode[0]), .B(Rounding_Decoder_N37), .Y(
        Rounding_Decoder_N24) );
  OR2X8TS Rounding_Decoder_C40 ( .A(Rounding_Decoder_N19), .B(
        Rounding_Decoder_N24), .Y(Rounding_Decoder_N25) );
  INVX12TS Rounding_Decoder_I_1 ( .A(Rounding_Decoder_N11), .Y(
        Rounding_Decoder_N12) );
  INVX12TS Rounding_Decoder_I_2 ( .A(Rounding_Decoder_N15), .Y(
        Rounding_Decoder_N16) );
  INVX12TS Rounding_Decoder_I_3 ( .A(Rounding_Decoder_N17), .Y(
        Rounding_Decoder_N18) );
  INVX12TS Rounding_Decoder_I_4 ( .A(Rounding_Decoder_N22), .Y(
        Rounding_Decoder_N23) );
  INVX12TS Rounding_Decoder_I_5 ( .A(Rounding_Decoder_N26), .Y(
        Rounding_Decoder_N27) );
  INVX12TS Rounding_Decoder_I_6 ( .A(Rounding_Decoder_N28), .Y(
        Rounding_Decoder_N29) );
  INVX12TS Rounding_Decoder_I_7 ( .A(sign_final_result), .Y(
        Rounding_Decoder_N30) );
  INVX12TS Rounding_Decoder_I_8 ( .A(r_mode[0]), .Y(Rounding_Decoder_N33) );
  INVX12TS Rounding_Decoder_I_9 ( .A(r_mode[1]), .Y(Rounding_Decoder_N35) );
  INVX2TS Barrel_Shifter_module_Output_Reg_U28 ( .A(rst_int), .Y(
        Barrel_Shifter_module_Output_Reg_n52) );
  OAI2BB2XLTS Barrel_Shifter_module_Output_Reg_U27 ( .B0(n3), .B1(
        FSM_barrel_shifter_load), .A0N(Barrel_Shifter_module_Data_Reg[25]), 
        .A1N(FSM_barrel_shifter_load), .Y(Barrel_Shifter_module_Output_Reg_n53) );
  OAI2BB2XLTS Barrel_Shifter_module_Output_Reg_U26 ( .B0(
        Barrel_Shifter_module_Output_Reg_n25), .B1(FSM_barrel_shifter_load), 
        .A0N(Barrel_Shifter_module_Data_Reg[24]), .A1N(FSM_barrel_shifter_load), .Y(Barrel_Shifter_module_Output_Reg_n51) );
  OAI2BB2XLTS Barrel_Shifter_module_Output_Reg_U25 ( .B0(
        Barrel_Shifter_module_Output_Reg_n24), .B1(FSM_barrel_shifter_load), 
        .A0N(Barrel_Shifter_module_Data_Reg[23]), .A1N(FSM_barrel_shifter_load), .Y(Barrel_Shifter_module_Output_Reg_n50) );
  OAI2BB2XLTS Barrel_Shifter_module_Output_Reg_U24 ( .B0(
        Barrel_Shifter_module_Output_Reg_n23), .B1(FSM_barrel_shifter_load), 
        .A0N(Barrel_Shifter_module_Data_Reg[22]), .A1N(FSM_barrel_shifter_load), .Y(Barrel_Shifter_module_Output_Reg_n49) );
  OAI2BB2XLTS Barrel_Shifter_module_Output_Reg_U23 ( .B0(
        Barrel_Shifter_module_Output_Reg_n22), .B1(FSM_barrel_shifter_load), 
        .A0N(Barrel_Shifter_module_Data_Reg[21]), .A1N(FSM_barrel_shifter_load), .Y(Barrel_Shifter_module_Output_Reg_n48) );
  OAI2BB2XLTS Barrel_Shifter_module_Output_Reg_U22 ( .B0(
        Barrel_Shifter_module_Output_Reg_n21), .B1(FSM_barrel_shifter_load), 
        .A0N(Barrel_Shifter_module_Data_Reg[20]), .A1N(FSM_barrel_shifter_load), .Y(Barrel_Shifter_module_Output_Reg_n47) );
  OAI2BB2XLTS Barrel_Shifter_module_Output_Reg_U21 ( .B0(
        Barrel_Shifter_module_Output_Reg_n20), .B1(FSM_barrel_shifter_load), 
        .A0N(Barrel_Shifter_module_Data_Reg[19]), .A1N(FSM_barrel_shifter_load), .Y(Barrel_Shifter_module_Output_Reg_n46) );
  OAI2BB2XLTS Barrel_Shifter_module_Output_Reg_U20 ( .B0(
        Barrel_Shifter_module_Output_Reg_n19), .B1(FSM_barrel_shifter_load), 
        .A0N(Barrel_Shifter_module_Data_Reg[18]), .A1N(FSM_barrel_shifter_load), .Y(Barrel_Shifter_module_Output_Reg_n45) );
  OAI2BB2XLTS Barrel_Shifter_module_Output_Reg_U19 ( .B0(
        Barrel_Shifter_module_Output_Reg_n18), .B1(FSM_barrel_shifter_load), 
        .A0N(Barrel_Shifter_module_Data_Reg[17]), .A1N(FSM_barrel_shifter_load), .Y(Barrel_Shifter_module_Output_Reg_n44) );
  OAI2BB2XLTS Barrel_Shifter_module_Output_Reg_U18 ( .B0(
        Barrel_Shifter_module_Output_Reg_n17), .B1(FSM_barrel_shifter_load), 
        .A0N(Barrel_Shifter_module_Data_Reg[16]), .A1N(FSM_barrel_shifter_load), .Y(Barrel_Shifter_module_Output_Reg_n43) );
  OAI2BB2XLTS Barrel_Shifter_module_Output_Reg_U17 ( .B0(
        Barrel_Shifter_module_Output_Reg_n16), .B1(FSM_barrel_shifter_load), 
        .A0N(Barrel_Shifter_module_Data_Reg[15]), .A1N(FSM_barrel_shifter_load), .Y(Barrel_Shifter_module_Output_Reg_n42) );
  OAI2BB2XLTS Barrel_Shifter_module_Output_Reg_U16 ( .B0(
        Barrel_Shifter_module_Output_Reg_n15), .B1(FSM_barrel_shifter_load), 
        .A0N(Barrel_Shifter_module_Data_Reg[14]), .A1N(FSM_barrel_shifter_load), .Y(Barrel_Shifter_module_Output_Reg_n41) );
  OAI2BB2XLTS Barrel_Shifter_module_Output_Reg_U15 ( .B0(
        Barrel_Shifter_module_Output_Reg_n14), .B1(FSM_barrel_shifter_load), 
        .A0N(Barrel_Shifter_module_Data_Reg[13]), .A1N(FSM_barrel_shifter_load), .Y(Barrel_Shifter_module_Output_Reg_n40) );
  OAI2BB2XLTS Barrel_Shifter_module_Output_Reg_U14 ( .B0(
        Barrel_Shifter_module_Output_Reg_n13), .B1(FSM_barrel_shifter_load), 
        .A0N(Barrel_Shifter_module_Data_Reg[12]), .A1N(FSM_barrel_shifter_load), .Y(Barrel_Shifter_module_Output_Reg_n39) );
  OAI2BB2XLTS Barrel_Shifter_module_Output_Reg_U13 ( .B0(
        Barrel_Shifter_module_Output_Reg_n12), .B1(FSM_barrel_shifter_load), 
        .A0N(Barrel_Shifter_module_Data_Reg[11]), .A1N(FSM_barrel_shifter_load), .Y(Barrel_Shifter_module_Output_Reg_n38) );
  OAI2BB2XLTS Barrel_Shifter_module_Output_Reg_U12 ( .B0(
        Barrel_Shifter_module_Output_Reg_n11), .B1(FSM_barrel_shifter_load), 
        .A0N(Barrel_Shifter_module_Data_Reg[10]), .A1N(FSM_barrel_shifter_load), .Y(Barrel_Shifter_module_Output_Reg_n37) );
  OAI2BB2XLTS Barrel_Shifter_module_Output_Reg_U11 ( .B0(
        Barrel_Shifter_module_Output_Reg_n10), .B1(FSM_barrel_shifter_load), 
        .A0N(Barrel_Shifter_module_Data_Reg[9]), .A1N(FSM_barrel_shifter_load), 
        .Y(Barrel_Shifter_module_Output_Reg_n36) );
  OAI2BB2XLTS Barrel_Shifter_module_Output_Reg_U10 ( .B0(
        Barrel_Shifter_module_Output_Reg_n9), .B1(FSM_barrel_shifter_load), 
        .A0N(Barrel_Shifter_module_Data_Reg[8]), .A1N(FSM_barrel_shifter_load), 
        .Y(Barrel_Shifter_module_Output_Reg_n35) );
  OAI2BB2XLTS Barrel_Shifter_module_Output_Reg_U9 ( .B0(
        Barrel_Shifter_module_Output_Reg_n8), .B1(FSM_barrel_shifter_load), 
        .A0N(Barrel_Shifter_module_Data_Reg[7]), .A1N(FSM_barrel_shifter_load), 
        .Y(Barrel_Shifter_module_Output_Reg_n34) );
  OAI2BB2XLTS Barrel_Shifter_module_Output_Reg_U8 ( .B0(
        Barrel_Shifter_module_Output_Reg_n7), .B1(FSM_barrel_shifter_load), 
        .A0N(Barrel_Shifter_module_Data_Reg[6]), .A1N(FSM_barrel_shifter_load), 
        .Y(Barrel_Shifter_module_Output_Reg_n33) );
  OAI2BB2XLTS Barrel_Shifter_module_Output_Reg_U7 ( .B0(
        Barrel_Shifter_module_Output_Reg_n6), .B1(FSM_barrel_shifter_load), 
        .A0N(Barrel_Shifter_module_Data_Reg[5]), .A1N(FSM_barrel_shifter_load), 
        .Y(Barrel_Shifter_module_Output_Reg_n32) );
  OAI2BB2XLTS Barrel_Shifter_module_Output_Reg_U6 ( .B0(
        Barrel_Shifter_module_Output_Reg_n5), .B1(FSM_barrel_shifter_load), 
        .A0N(Barrel_Shifter_module_Data_Reg[4]), .A1N(FSM_barrel_shifter_load), 
        .Y(Barrel_Shifter_module_Output_Reg_n31) );
  OAI2BB2XLTS Barrel_Shifter_module_Output_Reg_U5 ( .B0(
        Barrel_Shifter_module_Output_Reg_n4), .B1(FSM_barrel_shifter_load), 
        .A0N(Barrel_Shifter_module_Data_Reg[3]), .A1N(FSM_barrel_shifter_load), 
        .Y(Barrel_Shifter_module_Output_Reg_n30) );
  OAI2BB2XLTS Barrel_Shifter_module_Output_Reg_U4 ( .B0(n2), .B1(
        FSM_barrel_shifter_load), .A0N(Barrel_Shifter_module_Data_Reg[2]), 
        .A1N(FSM_barrel_shifter_load), .Y(Barrel_Shifter_module_Output_Reg_n29) );
  OAI2BB2XLTS Barrel_Shifter_module_Output_Reg_U3 ( .B0(Rounding_Decoder_N37), 
        .B1(FSM_barrel_shifter_load), .A0N(Barrel_Shifter_module_Data_Reg[1]), 
        .A1N(FSM_barrel_shifter_load), .Y(Barrel_Shifter_module_Output_Reg_n28) );
  OAI2BB2XLTS Barrel_Shifter_module_Output_Reg_U2 ( .B0(Rounding_Decoder_N7), 
        .B1(FSM_barrel_shifter_load), .A0N(FSM_barrel_shifter_load), .A1N(
        Barrel_Shifter_module_Data_Reg[0]), .Y(
        Barrel_Shifter_module_Output_Reg_n27) );
  add_sub_carry_out_W26_DW01_sub_0 Add_Subt_Sgf_module_Sgf_AS_sub_34 ( .A({
        1'b0, S_A_S_Oper_A}), .B({1'b0, S_A_S_Oper_B}), .CI(1'b0), .DIFF({
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
        1'b0, S_A_S_Oper_A}), .B({1'b0, S_A_S_Oper_B}), .CI(1'b0), .SUM({
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
  CLKINVX1TS Add_Subt_Sgf_module_Sgf_AS_U32 ( .A(S_A_S_op), .Y(
        Add_Subt_Sgf_module_Sgf_AS_n7) );
  AO22X1TS Add_Subt_Sgf_module_Sgf_AS_U31 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N30), .A1(Add_Subt_Sgf_module_Sgf_AS_n7), .B0(Add_Subt_Sgf_module_Sgf_AS_N3), .B1(
        S_A_S_op), .Y(Add_Subt_Sgf_module_S_to_D[0]) );
  AO22X1TS Add_Subt_Sgf_module_Sgf_AS_U30 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N40), .A1(Add_Subt_Sgf_module_Sgf_AS_n7), .B0(Add_Subt_Sgf_module_Sgf_AS_N13), 
        .B1(S_A_S_op), .Y(Add_Subt_Sgf_module_S_to_D[10]) );
  AO22X1TS Add_Subt_Sgf_module_Sgf_AS_U29 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N41), .A1(Add_Subt_Sgf_module_Sgf_AS_n7), .B0(Add_Subt_Sgf_module_Sgf_AS_N14), 
        .B1(S_A_S_op), .Y(Add_Subt_Sgf_module_S_to_D[11]) );
  AO22X1TS Add_Subt_Sgf_module_Sgf_AS_U28 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N42), .A1(Add_Subt_Sgf_module_Sgf_AS_n7), .B0(Add_Subt_Sgf_module_Sgf_AS_N15), 
        .B1(S_A_S_op), .Y(Add_Subt_Sgf_module_S_to_D[12]) );
  AO22X1TS Add_Subt_Sgf_module_Sgf_AS_U27 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N43), .A1(Add_Subt_Sgf_module_Sgf_AS_n7), .B0(Add_Subt_Sgf_module_Sgf_AS_N16), 
        .B1(S_A_S_op), .Y(Add_Subt_Sgf_module_S_to_D[13]) );
  AO22X1TS Add_Subt_Sgf_module_Sgf_AS_U26 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N44), .A1(Add_Subt_Sgf_module_Sgf_AS_n7), .B0(Add_Subt_Sgf_module_Sgf_AS_N17), 
        .B1(S_A_S_op), .Y(Add_Subt_Sgf_module_S_to_D[14]) );
  AO22X1TS Add_Subt_Sgf_module_Sgf_AS_U25 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N45), .A1(Add_Subt_Sgf_module_Sgf_AS_n7), .B0(Add_Subt_Sgf_module_Sgf_AS_N18), 
        .B1(S_A_S_op), .Y(Add_Subt_Sgf_module_S_to_D[15]) );
  AO22X1TS Add_Subt_Sgf_module_Sgf_AS_U24 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N46), .A1(Add_Subt_Sgf_module_Sgf_AS_n7), .B0(Add_Subt_Sgf_module_Sgf_AS_N19), 
        .B1(S_A_S_op), .Y(Add_Subt_Sgf_module_S_to_D[16]) );
  AO22X1TS Add_Subt_Sgf_module_Sgf_AS_U23 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N47), .A1(Add_Subt_Sgf_module_Sgf_AS_n7), .B0(Add_Subt_Sgf_module_Sgf_AS_N20), 
        .B1(S_A_S_op), .Y(Add_Subt_Sgf_module_S_to_D[17]) );
  AO22X1TS Add_Subt_Sgf_module_Sgf_AS_U22 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N48), .A1(Add_Subt_Sgf_module_Sgf_AS_n7), .B0(Add_Subt_Sgf_module_Sgf_AS_N21), 
        .B1(S_A_S_op), .Y(Add_Subt_Sgf_module_S_to_D[18]) );
  AO22X1TS Add_Subt_Sgf_module_Sgf_AS_U21 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N49), .A1(Add_Subt_Sgf_module_Sgf_AS_n7), .B0(Add_Subt_Sgf_module_Sgf_AS_N22), 
        .B1(S_A_S_op), .Y(Add_Subt_Sgf_module_S_to_D[19]) );
  AO22X1TS Add_Subt_Sgf_module_Sgf_AS_U20 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N4), 
        .A1(S_A_S_op), .B0(Add_Subt_Sgf_module_Sgf_AS_N31), .B1(
        Add_Subt_Sgf_module_Sgf_AS_n7), .Y(Add_Subt_Sgf_module_S_to_D[1]) );
  AO22X1TS Add_Subt_Sgf_module_Sgf_AS_U19 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N50), .A1(Add_Subt_Sgf_module_Sgf_AS_n7), .B0(Add_Subt_Sgf_module_Sgf_AS_N23), 
        .B1(S_A_S_op), .Y(Add_Subt_Sgf_module_S_to_D[20]) );
  AO22X1TS Add_Subt_Sgf_module_Sgf_AS_U18 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N51), .A1(Add_Subt_Sgf_module_Sgf_AS_n7), .B0(Add_Subt_Sgf_module_Sgf_AS_N24), 
        .B1(S_A_S_op), .Y(Add_Subt_Sgf_module_S_to_D[21]) );
  AO22X1TS Add_Subt_Sgf_module_Sgf_AS_U17 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N52), .A1(Add_Subt_Sgf_module_Sgf_AS_n7), .B0(Add_Subt_Sgf_module_Sgf_AS_N25), 
        .B1(S_A_S_op), .Y(Add_Subt_Sgf_module_S_to_D[22]) );
  AO22X1TS Add_Subt_Sgf_module_Sgf_AS_U16 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N53), .A1(Add_Subt_Sgf_module_Sgf_AS_n7), .B0(Add_Subt_Sgf_module_Sgf_AS_N26), 
        .B1(S_A_S_op), .Y(Add_Subt_Sgf_module_S_to_D[23]) );
  AO22X1TS Add_Subt_Sgf_module_Sgf_AS_U15 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N54), .A1(Add_Subt_Sgf_module_Sgf_AS_n7), .B0(Add_Subt_Sgf_module_Sgf_AS_N27), 
        .B1(S_A_S_op), .Y(Add_Subt_Sgf_module_S_to_D[24]) );
  AO22X1TS Add_Subt_Sgf_module_Sgf_AS_U14 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N55), .A1(Add_Subt_Sgf_module_Sgf_AS_n7), .B0(Add_Subt_Sgf_module_Sgf_AS_N28), 
        .B1(S_A_S_op), .Y(Add_Subt_Sgf_module_S_to_D[25]) );
  AO22X1TS Add_Subt_Sgf_module_Sgf_AS_U13 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N56), .A1(Add_Subt_Sgf_module_Sgf_AS_n7), .B0(Add_Subt_Sgf_module_Sgf_AS_N29), 
        .B1(S_A_S_op), .Y(Add_Subt_Sgf_module_S_to_D[26]) );
  AO22X1TS Add_Subt_Sgf_module_Sgf_AS_U12 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N5), 
        .A1(S_A_S_op), .B0(Add_Subt_Sgf_module_Sgf_AS_N32), .B1(
        Add_Subt_Sgf_module_Sgf_AS_n7), .Y(Add_Subt_Sgf_module_S_to_D[2]) );
  AO22X1TS Add_Subt_Sgf_module_Sgf_AS_U11 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N6), 
        .A1(S_A_S_op), .B0(Add_Subt_Sgf_module_Sgf_AS_N33), .B1(
        Add_Subt_Sgf_module_Sgf_AS_n7), .Y(Add_Subt_Sgf_module_S_to_D[3]) );
  AO22X1TS Add_Subt_Sgf_module_Sgf_AS_U10 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N7), 
        .A1(S_A_S_op), .B0(Add_Subt_Sgf_module_Sgf_AS_N34), .B1(
        Add_Subt_Sgf_module_Sgf_AS_n7), .Y(Add_Subt_Sgf_module_S_to_D[4]) );
  AO22X1TS Add_Subt_Sgf_module_Sgf_AS_U9 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N8), 
        .A1(S_A_S_op), .B0(Add_Subt_Sgf_module_Sgf_AS_N35), .B1(
        Add_Subt_Sgf_module_Sgf_AS_n7), .Y(Add_Subt_Sgf_module_S_to_D[5]) );
  AO22X1TS Add_Subt_Sgf_module_Sgf_AS_U8 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N9), 
        .A1(S_A_S_op), .B0(Add_Subt_Sgf_module_Sgf_AS_N36), .B1(
        Add_Subt_Sgf_module_Sgf_AS_n7), .Y(Add_Subt_Sgf_module_S_to_D[6]) );
  AO22X1TS Add_Subt_Sgf_module_Sgf_AS_U7 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N37), 
        .A1(Add_Subt_Sgf_module_Sgf_AS_n7), .B0(Add_Subt_Sgf_module_Sgf_AS_N10), .B1(S_A_S_op), .Y(Add_Subt_Sgf_module_S_to_D[7]) );
  AO22X1TS Add_Subt_Sgf_module_Sgf_AS_U6 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N38), 
        .A1(Add_Subt_Sgf_module_Sgf_AS_n7), .B0(Add_Subt_Sgf_module_Sgf_AS_N11), .B1(S_A_S_op), .Y(Add_Subt_Sgf_module_S_to_D[8]) );
  AO22X1TS Add_Subt_Sgf_module_Sgf_AS_U5 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N39), 
        .A1(Add_Subt_Sgf_module_Sgf_AS_n7), .B0(S_A_S_op), .B1(
        Add_Subt_Sgf_module_Sgf_AS_N12), .Y(Add_Subt_Sgf_module_S_to_D[9]) );
  INVX2TS Add_Subt_Sgf_module_Add_overflow_Result_U3 ( .A(rst_int), .Y(n63) );
  OAI2BB2XLTS Add_Subt_Sgf_module_Add_overflow_Result_U2 ( .B0(n62), .B1(
        FSM_Add_Subt_Sgf_load), .A0N(FSM_Add_Subt_Sgf_load), .A1N(
        Add_Subt_Sgf_module_S_to_D[26]), .Y(n64) );
  DFFRX4TS Add_Subt_Sgf_module_Add_overflow_Result_Q_reg_0_ ( .D(n64), .CK(clk), .RN(n63), .Q(add_overflow_flag), .QN(n62) );
  CLKINVX1TS Add_Sub_Sgf_Oper_B_mux_U27 ( .A(FSM_selector_D), .Y(n60) );
  AO22X1TS Add_Sub_Sgf_Oper_A_mux_U25 ( .A0(Sgf_normalized_result[10]), .A1(
        FSM_selector_D), .B0(DMP[8]), .B1(n59), .Y(S_A_S_Oper_A[10]) );
  AO22X1TS Add_Sub_Sgf_Oper_A_mux_U24 ( .A0(Sgf_normalized_result[11]), .A1(
        FSM_selector_D), .B0(DMP[9]), .B1(n59), .Y(S_A_S_Oper_A[11]) );
  AO22X1TS Add_Sub_Sgf_Oper_A_mux_U23 ( .A0(Sgf_normalized_result[12]), .A1(
        FSM_selector_D), .B0(DMP[10]), .B1(n59), .Y(S_A_S_Oper_A[12]) );
  AO22X1TS Add_Sub_Sgf_Oper_A_mux_U22 ( .A0(Sgf_normalized_result[13]), .A1(
        FSM_selector_D), .B0(DMP[11]), .B1(n59), .Y(S_A_S_Oper_A[13]) );
  AO22X1TS Add_Sub_Sgf_Oper_A_mux_U21 ( .A0(Sgf_normalized_result[14]), .A1(
        FSM_selector_D), .B0(DMP[12]), .B1(n59), .Y(S_A_S_Oper_A[14]) );
  AO22X1TS Add_Sub_Sgf_Oper_A_mux_U20 ( .A0(Sgf_normalized_result[15]), .A1(
        FSM_selector_D), .B0(DMP[13]), .B1(n59), .Y(S_A_S_Oper_A[15]) );
  AO22X1TS Add_Sub_Sgf_Oper_A_mux_U19 ( .A0(Sgf_normalized_result[16]), .A1(
        FSM_selector_D), .B0(DMP[14]), .B1(n59), .Y(S_A_S_Oper_A[16]) );
  AO22X1TS Add_Sub_Sgf_Oper_A_mux_U18 ( .A0(Sgf_normalized_result[17]), .A1(
        FSM_selector_D), .B0(DMP[15]), .B1(n59), .Y(S_A_S_Oper_A[17]) );
  AO22X1TS Add_Sub_Sgf_Oper_A_mux_U17 ( .A0(Sgf_normalized_result[18]), .A1(
        FSM_selector_D), .B0(DMP[16]), .B1(n59), .Y(S_A_S_Oper_A[18]) );
  AO22X1TS Add_Sub_Sgf_Oper_A_mux_U16 ( .A0(Sgf_normalized_result[19]), .A1(
        FSM_selector_D), .B0(DMP[17]), .B1(n59), .Y(S_A_S_Oper_A[19]) );
  AO22X1TS Add_Sub_Sgf_Oper_A_mux_U14 ( .A0(Sgf_normalized_result[20]), .A1(
        FSM_selector_D), .B0(DMP[18]), .B1(n59), .Y(S_A_S_Oper_A[20]) );
  AO22X1TS Add_Sub_Sgf_Oper_A_mux_U13 ( .A0(Sgf_normalized_result[21]), .A1(
        FSM_selector_D), .B0(DMP[19]), .B1(n59), .Y(S_A_S_Oper_A[21]) );
  AO22X1TS Add_Sub_Sgf_Oper_A_mux_U12 ( .A0(Sgf_normalized_result[22]), .A1(
        FSM_selector_D), .B0(DMP[20]), .B1(n59), .Y(S_A_S_Oper_A[22]) );
  AO22X1TS Add_Sub_Sgf_Oper_A_mux_U11 ( .A0(Sgf_normalized_result[23]), .A1(
        FSM_selector_D), .B0(DMP[21]), .B1(n59), .Y(S_A_S_Oper_A[23]) );
  AO22X1TS Add_Sub_Sgf_Oper_A_mux_U10 ( .A0(Sgf_normalized_result[24]), .A1(
        FSM_selector_D), .B0(DMP[22]), .B1(n59), .Y(S_A_S_Oper_A[24]) );
  AO22X1TS Add_Sub_Sgf_Oper_A_mux_U8 ( .A0(Sgf_normalized_result[2]), .A1(
        FSM_selector_D), .B0(DMP[0]), .B1(n59), .Y(S_A_S_Oper_A[2]) );
  AO22X1TS Add_Sub_Sgf_Oper_A_mux_U7 ( .A0(Sgf_normalized_result[3]), .A1(
        FSM_selector_D), .B0(DMP[1]), .B1(n59), .Y(S_A_S_Oper_A[3]) );
  AO22X1TS Add_Sub_Sgf_Oper_A_mux_U6 ( .A0(Sgf_normalized_result[4]), .A1(
        FSM_selector_D), .B0(DMP[2]), .B1(n59), .Y(S_A_S_Oper_A[4]) );
  AO22X1TS Add_Sub_Sgf_Oper_A_mux_U5 ( .A0(Sgf_normalized_result[5]), .A1(
        FSM_selector_D), .B0(DMP[3]), .B1(n59), .Y(S_A_S_Oper_A[5]) );
  AO22X1TS Add_Sub_Sgf_Oper_A_mux_U4 ( .A0(Sgf_normalized_result[6]), .A1(
        FSM_selector_D), .B0(DMP[4]), .B1(n59), .Y(S_A_S_Oper_A[6]) );
  AO22X1TS Add_Sub_Sgf_Oper_A_mux_U3 ( .A0(Sgf_normalized_result[7]), .A1(
        FSM_selector_D), .B0(DMP[5]), .B1(n59), .Y(S_A_S_Oper_A[7]) );
  AO22X1TS Add_Sub_Sgf_Oper_A_mux_U2 ( .A0(Sgf_normalized_result[8]), .A1(
        FSM_selector_D), .B0(DMP[6]), .B1(n59), .Y(S_A_S_Oper_A[8]) );
  AO22X1TS Add_Sub_Sgf_Oper_A_mux_U1 ( .A0(FSM_selector_D), .A1(
        Sgf_normalized_result[9]), .B0(DMP[7]), .B1(n59), .Y(S_A_S_Oper_A[9])
         );
  INVX2TS Add_Subt_Sgf_module_Add_Subt_Result_U28 ( .A(rst_int), .Y(n57) );
  OAI2BB2XLTS Add_Subt_Sgf_module_Add_Subt_Result_U27 ( .B0(Add_Subt_LZD[25]), 
        .B1(FSM_Add_Subt_Sgf_load), .A0N(Add_Subt_Sgf_module_S_to_D[25]), 
        .A1N(FSM_Add_Subt_Sgf_load), .Y(n58) );
  OAI2BB2XLTS Add_Subt_Sgf_module_Add_Subt_Result_U26 ( .B0(Add_Subt_LZD[24]), 
        .B1(FSM_Add_Subt_Sgf_load), .A0N(Add_Subt_Sgf_module_S_to_D[24]), 
        .A1N(FSM_Add_Subt_Sgf_load), .Y(n56) );
  OAI2BB2XLTS Add_Subt_Sgf_module_Add_Subt_Result_U25 ( .B0(Add_Subt_LZD[23]), 
        .B1(FSM_Add_Subt_Sgf_load), .A0N(Add_Subt_Sgf_module_S_to_D[23]), 
        .A1N(FSM_Add_Subt_Sgf_load), .Y(n55) );
  OAI2BB2XLTS Add_Subt_Sgf_module_Add_Subt_Result_U24 ( .B0(Add_Subt_LZD[22]), 
        .B1(FSM_Add_Subt_Sgf_load), .A0N(Add_Subt_Sgf_module_S_to_D[22]), 
        .A1N(FSM_Add_Subt_Sgf_load), .Y(n54) );
  OAI2BB2XLTS Add_Subt_Sgf_module_Add_Subt_Result_U23 ( .B0(Add_Subt_LZD[21]), 
        .B1(FSM_Add_Subt_Sgf_load), .A0N(Add_Subt_Sgf_module_S_to_D[21]), 
        .A1N(FSM_Add_Subt_Sgf_load), .Y(n53) );
  OAI2BB2XLTS Add_Subt_Sgf_module_Add_Subt_Result_U22 ( .B0(Add_Subt_LZD[20]), 
        .B1(FSM_Add_Subt_Sgf_load), .A0N(Add_Subt_Sgf_module_S_to_D[20]), 
        .A1N(FSM_Add_Subt_Sgf_load), .Y(n52) );
  OAI2BB2XLTS Add_Subt_Sgf_module_Add_Subt_Result_U21 ( .B0(Add_Subt_LZD[19]), 
        .B1(FSM_Add_Subt_Sgf_load), .A0N(Add_Subt_Sgf_module_S_to_D[19]), 
        .A1N(FSM_Add_Subt_Sgf_load), .Y(n51) );
  OAI2BB2XLTS Add_Subt_Sgf_module_Add_Subt_Result_U20 ( .B0(Add_Subt_LZD[18]), 
        .B1(FSM_Add_Subt_Sgf_load), .A0N(Add_Subt_Sgf_module_S_to_D[18]), 
        .A1N(FSM_Add_Subt_Sgf_load), .Y(n50) );
  OAI2BB2XLTS Add_Subt_Sgf_module_Add_Subt_Result_U19 ( .B0(Add_Subt_LZD[17]), 
        .B1(FSM_Add_Subt_Sgf_load), .A0N(Add_Subt_Sgf_module_S_to_D[17]), 
        .A1N(FSM_Add_Subt_Sgf_load), .Y(n49) );
  OAI2BB2XLTS Add_Subt_Sgf_module_Add_Subt_Result_U18 ( .B0(Add_Subt_LZD[16]), 
        .B1(FSM_Add_Subt_Sgf_load), .A0N(Add_Subt_Sgf_module_S_to_D[16]), 
        .A1N(FSM_Add_Subt_Sgf_load), .Y(n48) );
  OAI2BB2XLTS Add_Subt_Sgf_module_Add_Subt_Result_U17 ( .B0(Add_Subt_LZD[15]), 
        .B1(FSM_Add_Subt_Sgf_load), .A0N(Add_Subt_Sgf_module_S_to_D[15]), 
        .A1N(FSM_Add_Subt_Sgf_load), .Y(n47) );
  OAI2BB2XLTS Add_Subt_Sgf_module_Add_Subt_Result_U16 ( .B0(Add_Subt_LZD[14]), 
        .B1(FSM_Add_Subt_Sgf_load), .A0N(Add_Subt_Sgf_module_S_to_D[14]), 
        .A1N(FSM_Add_Subt_Sgf_load), .Y(n46) );
  OAI2BB2XLTS Add_Subt_Sgf_module_Add_Subt_Result_U15 ( .B0(Add_Subt_LZD[13]), 
        .B1(FSM_Add_Subt_Sgf_load), .A0N(Add_Subt_Sgf_module_S_to_D[13]), 
        .A1N(FSM_Add_Subt_Sgf_load), .Y(n45) );
  OAI2BB2XLTS Add_Subt_Sgf_module_Add_Subt_Result_U14 ( .B0(Add_Subt_LZD[12]), 
        .B1(FSM_Add_Subt_Sgf_load), .A0N(Add_Subt_Sgf_module_S_to_D[12]), 
        .A1N(FSM_Add_Subt_Sgf_load), .Y(n44) );
  OAI2BB2XLTS Add_Subt_Sgf_module_Add_Subt_Result_U13 ( .B0(Add_Subt_LZD[11]), 
        .B1(FSM_Add_Subt_Sgf_load), .A0N(Add_Subt_Sgf_module_S_to_D[11]), 
        .A1N(FSM_Add_Subt_Sgf_load), .Y(n43) );
  OAI2BB2XLTS Add_Subt_Sgf_module_Add_Subt_Result_U12 ( .B0(Add_Subt_LZD[10]), 
        .B1(FSM_Add_Subt_Sgf_load), .A0N(Add_Subt_Sgf_module_S_to_D[10]), 
        .A1N(FSM_Add_Subt_Sgf_load), .Y(n42) );
  OAI2BB2XLTS Add_Subt_Sgf_module_Add_Subt_Result_U11 ( .B0(Add_Subt_LZD[9]), 
        .B1(FSM_Add_Subt_Sgf_load), .A0N(Add_Subt_Sgf_module_S_to_D[9]), .A1N(
        FSM_Add_Subt_Sgf_load), .Y(n41) );
  OAI2BB2XLTS Add_Subt_Sgf_module_Add_Subt_Result_U10 ( .B0(Add_Subt_LZD[8]), 
        .B1(FSM_Add_Subt_Sgf_load), .A0N(Add_Subt_Sgf_module_S_to_D[8]), .A1N(
        FSM_Add_Subt_Sgf_load), .Y(n40) );
  OAI2BB2XLTS Add_Subt_Sgf_module_Add_Subt_Result_U9 ( .B0(Add_Subt_LZD[7]), 
        .B1(FSM_Add_Subt_Sgf_load), .A0N(Add_Subt_Sgf_module_S_to_D[7]), .A1N(
        FSM_Add_Subt_Sgf_load), .Y(n39) );
  OAI2BB2XLTS Add_Subt_Sgf_module_Add_Subt_Result_U8 ( .B0(Add_Subt_LZD[6]), 
        .B1(FSM_Add_Subt_Sgf_load), .A0N(Add_Subt_Sgf_module_S_to_D[6]), .A1N(
        FSM_Add_Subt_Sgf_load), .Y(n38) );
  OAI2BB2XLTS Add_Subt_Sgf_module_Add_Subt_Result_U7 ( .B0(Add_Subt_LZD[5]), 
        .B1(FSM_Add_Subt_Sgf_load), .A0N(Add_Subt_Sgf_module_S_to_D[5]), .A1N(
        FSM_Add_Subt_Sgf_load), .Y(n37) );
  OAI2BB2XLTS Add_Subt_Sgf_module_Add_Subt_Result_U6 ( .B0(Add_Subt_LZD[4]), 
        .B1(FSM_Add_Subt_Sgf_load), .A0N(Add_Subt_Sgf_module_S_to_D[4]), .A1N(
        FSM_Add_Subt_Sgf_load), .Y(n36) );
  OAI2BB2XLTS Add_Subt_Sgf_module_Add_Subt_Result_U5 ( .B0(Add_Subt_LZD[3]), 
        .B1(FSM_Add_Subt_Sgf_load), .A0N(Add_Subt_Sgf_module_S_to_D[3]), .A1N(
        FSM_Add_Subt_Sgf_load), .Y(n35) );
  OAI2BB2XLTS Add_Subt_Sgf_module_Add_Subt_Result_U4 ( .B0(Add_Subt_LZD[2]), 
        .B1(FSM_Add_Subt_Sgf_load), .A0N(Add_Subt_Sgf_module_S_to_D[2]), .A1N(
        FSM_Add_Subt_Sgf_load), .Y(n34) );
  OAI2BB2XLTS Add_Subt_Sgf_module_Add_Subt_Result_U3 ( .B0(Add_Subt_LZD[1]), 
        .B1(FSM_Add_Subt_Sgf_load), .A0N(Add_Subt_Sgf_module_S_to_D[1]), .A1N(
        FSM_Add_Subt_Sgf_load), .Y(n33) );
  OAI2BB2XLTS Add_Subt_Sgf_module_Add_Subt_Result_U2 ( .B0(Add_Subt_LZD[0]), 
        .B1(FSM_Add_Subt_Sgf_load), .A0N(FSM_Add_Subt_Sgf_load), .A1N(
        Add_Subt_Sgf_module_S_to_D[0]), .Y(n32) );
  DFFRX4TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_8_ ( .D(n40), .CK(clk), 
        .RN(n57), .Q(Add_Subt_result[8]), .QN(Add_Subt_LZD[8]) );
  DFFRX4TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_9_ ( .D(n41), .CK(clk), 
        .RN(n57), .Q(Add_Subt_result[9]), .QN(Add_Subt_LZD[9]) );
  DFFRX4TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_10_ ( .D(n42), .CK(clk), 
        .RN(n57), .Q(Add_Subt_result[10]), .QN(Add_Subt_LZD[10]) );
  DFFRX4TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_11_ ( .D(n43), .CK(clk), 
        .RN(n57), .Q(Add_Subt_result[11]), .QN(Add_Subt_LZD[11]) );
  DFFRX4TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_12_ ( .D(n44), .CK(clk), 
        .RN(n57), .Q(Add_Subt_result[12]), .QN(Add_Subt_LZD[12]) );
  DFFRX4TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_13_ ( .D(n45), .CK(clk), 
        .RN(n57), .Q(Add_Subt_result[13]), .QN(Add_Subt_LZD[13]) );
  DFFRX4TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_14_ ( .D(n46), .CK(clk), 
        .RN(n57), .Q(Add_Subt_result[14]), .QN(Add_Subt_LZD[14]) );
  DFFRX4TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_15_ ( .D(n47), .CK(clk), 
        .RN(n57), .Q(Add_Subt_result[15]), .QN(Add_Subt_LZD[15]) );
  DFFRX4TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_16_ ( .D(n48), .CK(clk), 
        .RN(n57), .Q(Add_Subt_result[16]), .QN(Add_Subt_LZD[16]) );
  DFFRX4TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_17_ ( .D(n49), .CK(clk), 
        .RN(n57), .Q(Add_Subt_result[17]), .QN(Add_Subt_LZD[17]) );
  DFFRX4TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_18_ ( .D(n50), .CK(clk), 
        .RN(n57), .Q(Add_Subt_result[18]), .QN(Add_Subt_LZD[18]) );
  DFFRX4TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_19_ ( .D(n51), .CK(clk), 
        .RN(n57), .Q(Add_Subt_result[19]), .QN(Add_Subt_LZD[19]) );
  DFFRX4TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_20_ ( .D(n52), .CK(clk), 
        .RN(n57), .Q(Add_Subt_result[20]), .QN(Add_Subt_LZD[20]) );
  DFFRX4TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_21_ ( .D(n53), .CK(clk), 
        .RN(n57), .Q(Add_Subt_result[21]), .QN(Add_Subt_LZD[21]) );
  DFFRX4TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_22_ ( .D(n54), .CK(clk), 
        .RN(n57), .Q(Add_Subt_result[22]), .QN(Add_Subt_LZD[22]) );
  DFFRX4TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_23_ ( .D(n55), .CK(clk), 
        .RN(n57), .Q(Add_Subt_result[23]), .QN(Add_Subt_LZD[23]) );
  DFFRX4TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_24_ ( .D(n56), .CK(clk), 
        .RN(n57), .Q(Add_Subt_result[24]), .QN(Add_Subt_LZD[24]) );
  DFFRX4TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_25_ ( .D(n58), .CK(clk), 
        .RN(n57), .Q(Add_Subt_result[25]), .QN(Add_Subt_LZD[25]) );
  DFFRXLTS Barrel_Shifter_module_Output_Reg_Q_reg_25_ ( .D(
        Barrel_Shifter_module_Output_Reg_n53), .CK(clk), .RN(
        Barrel_Shifter_module_Output_Reg_n52), .Q(Sgf_normalized_result[25]), 
        .QN(n3) );
  DFFRXLTS Barrel_Shifter_module_Output_Reg_Q_reg_24_ ( .D(
        Barrel_Shifter_module_Output_Reg_n51), .CK(clk), .RN(
        Barrel_Shifter_module_Output_Reg_n52), .Q(Sgf_normalized_result[24]), 
        .QN(Barrel_Shifter_module_Output_Reg_n25) );
  DFFRXLTS Barrel_Shifter_module_Output_Reg_Q_reg_23_ ( .D(
        Barrel_Shifter_module_Output_Reg_n50), .CK(clk), .RN(
        Barrel_Shifter_module_Output_Reg_n52), .Q(Sgf_normalized_result[23]), 
        .QN(Barrel_Shifter_module_Output_Reg_n24) );
  DFFRXLTS Barrel_Shifter_module_Output_Reg_Q_reg_22_ ( .D(
        Barrel_Shifter_module_Output_Reg_n49), .CK(clk), .RN(
        Barrel_Shifter_module_Output_Reg_n52), .Q(Sgf_normalized_result[22]), 
        .QN(Barrel_Shifter_module_Output_Reg_n23) );
  DFFRXLTS Barrel_Shifter_module_Output_Reg_Q_reg_21_ ( .D(
        Barrel_Shifter_module_Output_Reg_n48), .CK(clk), .RN(
        Barrel_Shifter_module_Output_Reg_n52), .Q(Sgf_normalized_result[21]), 
        .QN(Barrel_Shifter_module_Output_Reg_n22) );
  DFFRXLTS Barrel_Shifter_module_Output_Reg_Q_reg_20_ ( .D(
        Barrel_Shifter_module_Output_Reg_n47), .CK(clk), .RN(
        Barrel_Shifter_module_Output_Reg_n52), .Q(Sgf_normalized_result[20]), 
        .QN(Barrel_Shifter_module_Output_Reg_n21) );
  DFFRXLTS Barrel_Shifter_module_Output_Reg_Q_reg_19_ ( .D(
        Barrel_Shifter_module_Output_Reg_n46), .CK(clk), .RN(
        Barrel_Shifter_module_Output_Reg_n52), .Q(Sgf_normalized_result[19]), 
        .QN(Barrel_Shifter_module_Output_Reg_n20) );
  DFFRXLTS Barrel_Shifter_module_Output_Reg_Q_reg_18_ ( .D(
        Barrel_Shifter_module_Output_Reg_n45), .CK(clk), .RN(
        Barrel_Shifter_module_Output_Reg_n52), .Q(Sgf_normalized_result[18]), 
        .QN(Barrel_Shifter_module_Output_Reg_n19) );
  DFFRXLTS Barrel_Shifter_module_Output_Reg_Q_reg_17_ ( .D(
        Barrel_Shifter_module_Output_Reg_n44), .CK(clk), .RN(
        Barrel_Shifter_module_Output_Reg_n52), .Q(Sgf_normalized_result[17]), 
        .QN(Barrel_Shifter_module_Output_Reg_n18) );
  DFFRXLTS Barrel_Shifter_module_Output_Reg_Q_reg_16_ ( .D(
        Barrel_Shifter_module_Output_Reg_n43), .CK(clk), .RN(
        Barrel_Shifter_module_Output_Reg_n52), .Q(Sgf_normalized_result[16]), 
        .QN(Barrel_Shifter_module_Output_Reg_n17) );
  DFFRXLTS Barrel_Shifter_module_Output_Reg_Q_reg_15_ ( .D(
        Barrel_Shifter_module_Output_Reg_n42), .CK(clk), .RN(
        Barrel_Shifter_module_Output_Reg_n52), .Q(Sgf_normalized_result[15]), 
        .QN(Barrel_Shifter_module_Output_Reg_n16) );
  DFFRXLTS Barrel_Shifter_module_Output_Reg_Q_reg_14_ ( .D(
        Barrel_Shifter_module_Output_Reg_n41), .CK(clk), .RN(
        Barrel_Shifter_module_Output_Reg_n52), .Q(Sgf_normalized_result[14]), 
        .QN(Barrel_Shifter_module_Output_Reg_n15) );
  DFFRXLTS Barrel_Shifter_module_Output_Reg_Q_reg_13_ ( .D(
        Barrel_Shifter_module_Output_Reg_n40), .CK(clk), .RN(
        Barrel_Shifter_module_Output_Reg_n52), .Q(Sgf_normalized_result[13]), 
        .QN(Barrel_Shifter_module_Output_Reg_n14) );
  DFFRXLTS Barrel_Shifter_module_Output_Reg_Q_reg_12_ ( .D(
        Barrel_Shifter_module_Output_Reg_n39), .CK(clk), .RN(
        Barrel_Shifter_module_Output_Reg_n52), .Q(Sgf_normalized_result[12]), 
        .QN(Barrel_Shifter_module_Output_Reg_n13) );
  DFFRXLTS Barrel_Shifter_module_Output_Reg_Q_reg_11_ ( .D(
        Barrel_Shifter_module_Output_Reg_n38), .CK(clk), .RN(
        Barrel_Shifter_module_Output_Reg_n52), .Q(Sgf_normalized_result[11]), 
        .QN(Barrel_Shifter_module_Output_Reg_n12) );
  DFFRXLTS Barrel_Shifter_module_Output_Reg_Q_reg_10_ ( .D(
        Barrel_Shifter_module_Output_Reg_n37), .CK(clk), .RN(
        Barrel_Shifter_module_Output_Reg_n52), .Q(Sgf_normalized_result[10]), 
        .QN(Barrel_Shifter_module_Output_Reg_n11) );
  DFFRXLTS Barrel_Shifter_module_Output_Reg_Q_reg_9_ ( .D(
        Barrel_Shifter_module_Output_Reg_n36), .CK(clk), .RN(
        Barrel_Shifter_module_Output_Reg_n52), .Q(Sgf_normalized_result[9]), 
        .QN(Barrel_Shifter_module_Output_Reg_n10) );
  DFFRXLTS Barrel_Shifter_module_Output_Reg_Q_reg_8_ ( .D(
        Barrel_Shifter_module_Output_Reg_n35), .CK(clk), .RN(
        Barrel_Shifter_module_Output_Reg_n52), .Q(Sgf_normalized_result[8]), 
        .QN(Barrel_Shifter_module_Output_Reg_n9) );
  DFFRXLTS Barrel_Shifter_module_Output_Reg_Q_reg_7_ ( .D(
        Barrel_Shifter_module_Output_Reg_n34), .CK(clk), .RN(
        Barrel_Shifter_module_Output_Reg_n52), .Q(Sgf_normalized_result[7]), 
        .QN(Barrel_Shifter_module_Output_Reg_n8) );
  DFFRXLTS Barrel_Shifter_module_Output_Reg_Q_reg_6_ ( .D(
        Barrel_Shifter_module_Output_Reg_n33), .CK(clk), .RN(
        Barrel_Shifter_module_Output_Reg_n52), .Q(Sgf_normalized_result[6]), 
        .QN(Barrel_Shifter_module_Output_Reg_n7) );
  DFFRXLTS Barrel_Shifter_module_Output_Reg_Q_reg_5_ ( .D(
        Barrel_Shifter_module_Output_Reg_n32), .CK(clk), .RN(
        Barrel_Shifter_module_Output_Reg_n52), .Q(Sgf_normalized_result[5]), 
        .QN(Barrel_Shifter_module_Output_Reg_n6) );
  DFFRXLTS Barrel_Shifter_module_Output_Reg_Q_reg_4_ ( .D(
        Barrel_Shifter_module_Output_Reg_n31), .CK(clk), .RN(
        Barrel_Shifter_module_Output_Reg_n52), .Q(Sgf_normalized_result[4]), 
        .QN(Barrel_Shifter_module_Output_Reg_n5) );
  DFFRXLTS Barrel_Shifter_module_Output_Reg_Q_reg_3_ ( .D(
        Barrel_Shifter_module_Output_Reg_n30), .CK(clk), .RN(
        Barrel_Shifter_module_Output_Reg_n52), .Q(Sgf_normalized_result[3]), 
        .QN(Barrel_Shifter_module_Output_Reg_n4) );
  DFFRXLTS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_0_ ( .D(n32), .CK(clk), 
        .RN(n57), .Q(Add_Subt_result[0]), .QN(Add_Subt_LZD[0]) );
  DFFRXLTS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_1_ ( .D(n33), .CK(clk), 
        .RN(n57), .Q(Add_Subt_result[1]), .QN(Add_Subt_LZD[1]) );
  DFFRXLTS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_2_ ( .D(n34), .CK(clk), 
        .RN(n57), .Q(Add_Subt_result[2]), .QN(Add_Subt_LZD[2]) );
  DFFRXLTS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_3_ ( .D(n35), .CK(clk), 
        .RN(n57), .Q(Add_Subt_result[3]), .QN(Add_Subt_LZD[3]) );
  DFFRXLTS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_4_ ( .D(n36), .CK(clk), 
        .RN(n57), .Q(Add_Subt_result[4]), .QN(Add_Subt_LZD[4]) );
  DFFRXLTS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_5_ ( .D(n37), .CK(clk), 
        .RN(n57), .Q(Add_Subt_result[5]), .QN(Add_Subt_LZD[5]) );
  DFFRXLTS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_6_ ( .D(n38), .CK(clk), 
        .RN(n57), .Q(Add_Subt_result[6]), .QN(Add_Subt_LZD[6]) );
  DFFRXLTS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_7_ ( .D(n39), .CK(clk), 
        .RN(n57), .Q(Add_Subt_result[7]), .QN(Add_Subt_LZD[7]) );
  DFFRX1TS Barrel_Shifter_module_Output_Reg_Q_reg_2_ ( .D(
        Barrel_Shifter_module_Output_Reg_n29), .CK(clk), .RN(n57), .Q(
        Sgf_normalized_result[2]), .QN(n2) );
  DFFRX1TS Barrel_Shifter_module_Output_Reg_Q_reg_1_ ( .D(
        Barrel_Shifter_module_Output_Reg_n28), .CK(clk), .RN(n57), .Q(
        Sgf_normalized_result[1]), .QN(Rounding_Decoder_N37) );
  DFFRX1TS Barrel_Shifter_module_Output_Reg_Q_reg_0_ ( .D(
        Barrel_Shifter_module_Output_Reg_n27), .CK(clk), .RN(n57), .Q(
        Sgf_normalized_result[0]), .QN(Rounding_Decoder_N7) );
  DFFRX4TS Sel_D_Q_reg_0_ ( .D(n61), .CK(clk), .RN(n57), .Q(FSM_selector_D), 
        .QN(n59) );
  NAND2X8TS U3 ( .A(n59), .B(n1), .Y(n61) );
  INVX12TS U4 ( .A(selector_D), .Y(n1) );
  NAND2X8TS U5 ( .A(n60), .B(n2), .Y(S_A_S_Oper_B[2]) );
  NAND2X8TS U6 ( .A(FSM_selector_D), .B(n3), .Y(S_A_S_Oper_A[25]) );
  NAND2X8TS U7 ( .A(real_op), .B(Add_Sub_Sgf_op_mux_n1), .Y(n4) );
  INVX12TS U8 ( .A(n4), .Y(S_A_S_op) );
  NAND2X8TS U9 ( .A(Sgf_normalized_result[0]), .B(n60), .Y(n5) );
  INVX12TS U10 ( .A(n5), .Y(S_A_S_Oper_B[0]) );
  NAND2X8TS U11 ( .A(Sgf_normalized_result[1]), .B(n60), .Y(n6) );
  INVX12TS U12 ( .A(n6), .Y(S_A_S_Oper_B[1]) );
  NAND2X8TS U13 ( .A(Sgf_normalized_result[3]), .B(n60), .Y(n7) );
  INVX12TS U14 ( .A(n7), .Y(S_A_S_Oper_B[3]) );
  NAND2X8TS U15 ( .A(Sgf_normalized_result[4]), .B(n60), .Y(n8) );
  INVX12TS U16 ( .A(n8), .Y(S_A_S_Oper_B[4]) );
  NAND2X8TS U17 ( .A(Sgf_normalized_result[5]), .B(n60), .Y(n9) );
  INVX12TS U18 ( .A(n9), .Y(S_A_S_Oper_B[5]) );
  NAND2X8TS U19 ( .A(Sgf_normalized_result[6]), .B(n60), .Y(n10) );
  INVX12TS U20 ( .A(n10), .Y(S_A_S_Oper_B[6]) );
  NAND2X8TS U21 ( .A(Sgf_normalized_result[7]), .B(n60), .Y(n11) );
  INVX12TS U22 ( .A(n11), .Y(S_A_S_Oper_B[7]) );
  NAND2X8TS U23 ( .A(Sgf_normalized_result[8]), .B(n60), .Y(n12) );
  INVX12TS U24 ( .A(n12), .Y(S_A_S_Oper_B[8]) );
  NAND2X8TS U25 ( .A(Sgf_normalized_result[9]), .B(n60), .Y(n13) );
  INVX12TS U26 ( .A(n13), .Y(S_A_S_Oper_B[9]) );
  NAND2X8TS U27 ( .A(Sgf_normalized_result[10]), .B(n60), .Y(n14) );
  INVX12TS U28 ( .A(n14), .Y(S_A_S_Oper_B[10]) );
  NAND2X8TS U29 ( .A(Sgf_normalized_result[11]), .B(n60), .Y(n15) );
  INVX12TS U30 ( .A(n15), .Y(S_A_S_Oper_B[11]) );
  NAND2X8TS U31 ( .A(Sgf_normalized_result[12]), .B(n60), .Y(n16) );
  INVX12TS U32 ( .A(n16), .Y(S_A_S_Oper_B[12]) );
  NAND2X8TS U33 ( .A(Sgf_normalized_result[13]), .B(n60), .Y(n17) );
  INVX12TS U34 ( .A(n17), .Y(S_A_S_Oper_B[13]) );
  NAND2X8TS U35 ( .A(Sgf_normalized_result[14]), .B(n60), .Y(n18) );
  INVX12TS U36 ( .A(n18), .Y(S_A_S_Oper_B[14]) );
  NAND2X8TS U37 ( .A(Sgf_normalized_result[15]), .B(n60), .Y(n19) );
  INVX12TS U38 ( .A(n19), .Y(S_A_S_Oper_B[15]) );
  NAND2X8TS U39 ( .A(Sgf_normalized_result[16]), .B(n60), .Y(n20) );
  INVX12TS U40 ( .A(n20), .Y(S_A_S_Oper_B[16]) );
  NAND2X8TS U41 ( .A(Sgf_normalized_result[17]), .B(n60), .Y(n21) );
  INVX12TS U42 ( .A(n21), .Y(S_A_S_Oper_B[17]) );
  NAND2X8TS U43 ( .A(Sgf_normalized_result[18]), .B(n60), .Y(n22) );
  INVX12TS U44 ( .A(n22), .Y(S_A_S_Oper_B[18]) );
  NAND2X8TS U45 ( .A(Sgf_normalized_result[19]), .B(n60), .Y(n23) );
  INVX12TS U46 ( .A(n23), .Y(S_A_S_Oper_B[19]) );
  NAND2X8TS U47 ( .A(Sgf_normalized_result[20]), .B(n60), .Y(n24) );
  INVX12TS U48 ( .A(n24), .Y(S_A_S_Oper_B[20]) );
  NAND2X8TS U49 ( .A(Sgf_normalized_result[21]), .B(n60), .Y(n25) );
  INVX12TS U50 ( .A(n25), .Y(S_A_S_Oper_B[21]) );
  NAND2X8TS U51 ( .A(Sgf_normalized_result[22]), .B(n60), .Y(n26) );
  INVX12TS U52 ( .A(n26), .Y(S_A_S_Oper_B[22]) );
  NAND2X8TS U53 ( .A(Sgf_normalized_result[23]), .B(n60), .Y(n27) );
  INVX12TS U54 ( .A(n27), .Y(S_A_S_Oper_B[23]) );
  NAND2X8TS U55 ( .A(Sgf_normalized_result[24]), .B(n60), .Y(n28) );
  INVX12TS U56 ( .A(n28), .Y(S_A_S_Oper_B[24]) );
  NAND2X8TS U57 ( .A(Sgf_normalized_result[25]), .B(n60), .Y(n29) );
  INVX12TS U58 ( .A(n29), .Y(S_A_S_Oper_B[25]) );
  NAND2X8TS U59 ( .A(Sgf_normalized_result[0]), .B(FSM_selector_D), .Y(n30) );
  INVX12TS U60 ( .A(n30), .Y(S_A_S_Oper_A[0]) );
  NAND2X8TS U61 ( .A(Sgf_normalized_result[1]), .B(FSM_selector_D), .Y(n31) );
  INVX12TS U62 ( .A(n31), .Y(S_A_S_Oper_A[1]) );
endmodule

