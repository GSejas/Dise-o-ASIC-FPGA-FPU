/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : L-2016.03-SP3
// Date      : Thu Oct 13 20:13:09 2016
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
  wire   n31, ctrl_a_o, N18, N19, N20, N21, N23, N24, N25, N26, N27, N28, N29,
         N30, N31, N32, N33, N34, N35, N36, N37, N38, N39, N40, N41, N42, N43,
         N44, N45, N47, N48, N49, N51, N52, N53, N54, N55, N56, N57, N58, N59,
         N60, N61, N62, N63, N64, N65, N66, N67, N68, N69, N70, N71, N72, N73,
         N75, N76, N77, N79, N80, N82, N90, N94, N95, N96, N97, N98, N100,
         N101, N102, N103, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12,
         n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26,
         n27, n28, n29;
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
  AOI211X1TS U15 ( .A0(n13), .A1(n16), .B0(n12), .C0(add_overflow_i), .Y(n31)
         );
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
  DFFRXLTS state_reg_reg_2_ ( .D(n26), .CK(clk), .RN(n1), .Q(state_reg[2]), 
        .QN(N19) );
  DFFRXLTS state_reg_reg_0_ ( .D(n29), .CK(clk), .RN(n1), .Q(state_reg[0]), 
        .QN(N95) );
  DFFRXLTS state_reg_reg_3_ ( .D(n28), .CK(clk), .RN(n1), .Q(state_reg[3]), 
        .QN(N18) );
  DFFRXLTS state_reg_reg_1_ ( .D(n27), .CK(clk), .RN(n1), .Q(state_reg[1]), 
        .QN(N100) );
  BUFX20TS U63 ( .A(n31), .Y(left_right_o) );
endmodule


module RegisterAdd_W1_1 ( clk, rst, load, D, Q );
  input [0:0] D;
  output [0:0] Q;
  input clk, rst, load;
  wire   n1, n2, n3;

  OAI2BB2XLTS U2 ( .B0(n1), .B1(load), .A0N(load), .A1N(D[0]), .Y(n3) );
  INVX2TS U3 ( .A(rst), .Y(n2) );
  DFFRXLTS Q_reg_0_ ( .D(n3), .CK(clk), .RN(n2), .Q(Q[0]), .QN(n1) );
endmodule


module RegisterAdd_W1_13 ( clk, rst, load, D, Q );
  input [0:0] D;
  output [0:0] Q;
  input clk, rst, load;
  wire   n4, n5, n6;

  OAI2BB2XLTS U2 ( .B0(n6), .B1(load), .A0N(load), .A1N(D[0]), .Y(n4) );
  INVX2TS U3 ( .A(rst), .Y(n5) );
  DFFRX2TS Q_reg_0_ ( .D(n4), .CK(clk), .RN(n5), .Q(Q[0]), .QN(n6) );
endmodule


module RegisterAdd_W2_1 ( clk, rst, load, D, Q );
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


module RegisterAdd_W64_0 ( clk, rst, load, D, Q );
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
         n123, n124, n125, n126, n127, n128, n129, n130, n131, n132, n133,
         n134, n135, n136, n137, n138, n139, n140, n141, n142, n143, n144,
         n145, n146, n147, n148, n149;

  OAI2BB2XLTS U2 ( .B0(n1), .B1(n130), .A0N(n142), .A1N(D[0]), .Y(n65) );
  OAI2BB2XLTS U3 ( .B0(n2), .B1(n130), .A0N(D[1]), .A1N(n142), .Y(n66) );
  OAI2BB2XLTS U4 ( .B0(n3), .B1(n130), .A0N(D[2]), .A1N(n142), .Y(n67) );
  OAI2BB2XLTS U5 ( .B0(n4), .B1(n130), .A0N(D[3]), .A1N(n142), .Y(n68) );
  OAI2BB2XLTS U6 ( .B0(n5), .B1(n130), .A0N(D[4]), .A1N(n142), .Y(n69) );
  OAI2BB2XLTS U7 ( .B0(n6), .B1(n131), .A0N(D[5]), .A1N(n142), .Y(n70) );
  OAI2BB2XLTS U8 ( .B0(n7), .B1(n130), .A0N(D[6]), .A1N(n142), .Y(n71) );
  OAI2BB2XLTS U9 ( .B0(n8), .B1(n130), .A0N(D[7]), .A1N(n142), .Y(n72) );
  OAI2BB2XLTS U10 ( .B0(n9), .B1(n131), .A0N(D[8]), .A1N(n141), .Y(n73) );
  OAI2BB2XLTS U11 ( .B0(n10), .B1(n131), .A0N(D[9]), .A1N(n141), .Y(n74) );
  OAI2BB2XLTS U12 ( .B0(n11), .B1(n131), .A0N(D[10]), .A1N(n141), .Y(n75) );
  OAI2BB2XLTS U13 ( .B0(n12), .B1(n132), .A0N(D[11]), .A1N(n141), .Y(n76) );
  OAI2BB2XLTS U14 ( .B0(n13), .B1(n131), .A0N(D[12]), .A1N(n141), .Y(n77) );
  OAI2BB2XLTS U15 ( .B0(n14), .B1(n132), .A0N(D[13]), .A1N(n141), .Y(n78) );
  OAI2BB2XLTS U16 ( .B0(n15), .B1(n131), .A0N(D[14]), .A1N(n141), .Y(n79) );
  OAI2BB2XLTS U17 ( .B0(n16), .B1(n131), .A0N(D[15]), .A1N(n141), .Y(n80) );
  OAI2BB2XLTS U18 ( .B0(n17), .B1(n132), .A0N(D[16]), .A1N(n141), .Y(n81) );
  OAI2BB2XLTS U19 ( .B0(n18), .B1(n133), .A0N(D[17]), .A1N(n141), .Y(n82) );
  OAI2BB2XLTS U20 ( .B0(n19), .B1(n132), .A0N(D[18]), .A1N(n140), .Y(n83) );
  OAI2BB2XLTS U21 ( .B0(n20), .B1(n133), .A0N(D[19]), .A1N(n140), .Y(n84) );
  OAI2BB2XLTS U22 ( .B0(n21), .B1(n133), .A0N(D[20]), .A1N(n140), .Y(n85) );
  OAI2BB2XLTS U23 ( .B0(n22), .B1(n132), .A0N(D[21]), .A1N(n140), .Y(n86) );
  OAI2BB2XLTS U24 ( .B0(n23), .B1(n133), .A0N(D[22]), .A1N(n140), .Y(n87) );
  OAI2BB2XLTS U25 ( .B0(n24), .B1(n134), .A0N(D[23]), .A1N(n140), .Y(n88) );
  OAI2BB2XLTS U26 ( .B0(n25), .B1(n133), .A0N(D[24]), .A1N(n140), .Y(n89) );
  OAI2BB2XLTS U27 ( .B0(n26), .B1(n134), .A0N(D[25]), .A1N(n140), .Y(n90) );
  OAI2BB2XLTS U28 ( .B0(n27), .B1(n134), .A0N(D[26]), .A1N(n140), .Y(n91) );
  OAI2BB2XLTS U29 ( .B0(n28), .B1(n133), .A0N(D[27]), .A1N(n140), .Y(n92) );
  OAI2BB2XLTS U30 ( .B0(n29), .B1(n132), .A0N(D[28]), .A1N(n139), .Y(n93) );
  OAI2BB2XLTS U31 ( .B0(n30), .B1(n135), .A0N(D[29]), .A1N(n139), .Y(n94) );
  OAI2BB2XLTS U32 ( .B0(n31), .B1(n134), .A0N(D[30]), .A1N(n139), .Y(n95) );
  OAI2BB2XLTS U33 ( .B0(n32), .B1(n135), .A0N(D[31]), .A1N(n139), .Y(n96) );
  OAI2BB2XLTS U34 ( .B0(n33), .B1(n135), .A0N(D[32]), .A1N(n139), .Y(n97) );
  OAI2BB2XLTS U35 ( .B0(n34), .B1(n134), .A0N(D[33]), .A1N(n139), .Y(n98) );
  OAI2BB2XLTS U36 ( .B0(n35), .B1(n135), .A0N(D[34]), .A1N(n139), .Y(n99) );
  OAI2BB2XLTS U37 ( .B0(n36), .B1(n134), .A0N(D[35]), .A1N(n139), .Y(n100) );
  OAI2BB2XLTS U38 ( .B0(n37), .B1(n134), .A0N(D[36]), .A1N(n139), .Y(n101) );
  OAI2BB2XLTS U39 ( .B0(n38), .B1(n136), .A0N(D[37]), .A1N(n139), .Y(n102) );
  OAI2BB2XLTS U40 ( .B0(n39), .B1(n136), .A0N(D[38]), .A1N(n138), .Y(n103) );
  OAI2BB2XLTS U41 ( .B0(n40), .B1(n135), .A0N(D[39]), .A1N(n138), .Y(n104) );
  OAI2BB2XLTS U42 ( .B0(n41), .B1(n136), .A0N(D[40]), .A1N(n138), .Y(n105) );
  OAI2BB2XLTS U43 ( .B0(n42), .B1(n136), .A0N(D[41]), .A1N(n138), .Y(n106) );
  OAI2BB2XLTS U44 ( .B0(n43), .B1(n135), .A0N(D[42]), .A1N(n138), .Y(n107) );
  OAI2BB2XLTS U45 ( .B0(n44), .B1(n135), .A0N(D[43]), .A1N(n138), .Y(n108) );
  OAI2BB2XLTS U46 ( .B0(n45), .B1(n134), .A0N(D[44]), .A1N(n138), .Y(n109) );
  OAI2BB2XLTS U47 ( .B0(n46), .B1(n135), .A0N(D[45]), .A1N(n137), .Y(n110) );
  OAI2BB2XLTS U48 ( .B0(n47), .B1(n134), .A0N(D[46]), .A1N(n138), .Y(n111) );
  OAI2BB2XLTS U49 ( .B0(n48), .B1(n135), .A0N(D[47]), .A1N(n137), .Y(n112) );
  OAI2BB2XLTS U50 ( .B0(n49), .B1(n135), .A0N(D[48]), .A1N(n137), .Y(n113) );
  OAI2BB2XLTS U51 ( .B0(n50), .B1(n133), .A0N(D[49]), .A1N(n137), .Y(n114) );
  OAI2BB2XLTS U52 ( .B0(n51), .B1(n134), .A0N(D[50]), .A1N(n137), .Y(n115) );
  OAI2BB2XLTS U53 ( .B0(n52), .B1(n133), .A0N(D[51]), .A1N(n136), .Y(n116) );
  OAI2BB2XLTS U54 ( .B0(n53), .B1(n132), .A0N(D[52]), .A1N(n136), .Y(n117) );
  OAI2BB2XLTS U55 ( .B0(n54), .B1(n133), .A0N(D[53]), .A1N(n137), .Y(n118) );
  OAI2BB2XLTS U56 ( .B0(n55), .B1(n133), .A0N(D[54]), .A1N(n137), .Y(n119) );
  OAI2BB2XLTS U57 ( .B0(n56), .B1(n132), .A0N(D[55]), .A1N(n136), .Y(n120) );
  OAI2BB2XLTS U58 ( .B0(n57), .B1(n132), .A0N(D[56]), .A1N(n137), .Y(n121) );
  OAI2BB2XLTS U59 ( .B0(n58), .B1(n132), .A0N(D[57]), .A1N(n136), .Y(n122) );
  OAI2BB2XLTS U60 ( .B0(n59), .B1(n131), .A0N(D[58]), .A1N(n136), .Y(n123) );
  OAI2BB2XLTS U61 ( .B0(n60), .B1(n131), .A0N(D[59]), .A1N(n137), .Y(n124) );
  OAI2BB2XLTS U62 ( .B0(n61), .B1(n131), .A0N(D[60]), .A1N(n136), .Y(n125) );
  OAI2BB2XLTS U63 ( .B0(n62), .B1(n130), .A0N(D[61]), .A1N(n138), .Y(n126) );
  OAI2BB2XLTS U64 ( .B0(n63), .B1(n130), .A0N(D[62]), .A1N(n137), .Y(n127) );
  OAI2BB2XLTS U65 ( .B0(n64), .B1(n130), .A0N(D[63]), .A1N(n138), .Y(n129) );
  INVX2TS U66 ( .A(rst), .Y(n128) );
  DFFRXLTS Q_reg_0_ ( .D(n65), .CK(clk), .RN(n128), .Q(Q[0]), .QN(n1) );
  DFFRXLTS Q_reg_63_ ( .D(n129), .CK(clk), .RN(n128), .Q(Q[63]), .QN(n64) );
  DFFRXLTS Q_reg_62_ ( .D(n127), .CK(clk), .RN(n128), .Q(Q[62]), .QN(n63) );
  DFFRXLTS Q_reg_61_ ( .D(n126), .CK(clk), .RN(n128), .Q(Q[61]), .QN(n62) );
  DFFRXLTS Q_reg_60_ ( .D(n125), .CK(clk), .RN(n128), .Q(Q[60]), .QN(n61) );
  DFFRXLTS Q_reg_59_ ( .D(n124), .CK(clk), .RN(n128), .Q(Q[59]), .QN(n60) );
  DFFRXLTS Q_reg_58_ ( .D(n123), .CK(clk), .RN(n128), .Q(Q[58]), .QN(n59) );
  DFFRXLTS Q_reg_57_ ( .D(n122), .CK(clk), .RN(n128), .Q(Q[57]), .QN(n58) );
  DFFRXLTS Q_reg_56_ ( .D(n121), .CK(clk), .RN(n128), .Q(Q[56]), .QN(n57) );
  DFFRXLTS Q_reg_55_ ( .D(n120), .CK(clk), .RN(n128), .Q(Q[55]), .QN(n56) );
  DFFRXLTS Q_reg_54_ ( .D(n119), .CK(clk), .RN(n128), .Q(Q[54]), .QN(n55) );
  DFFRXLTS Q_reg_53_ ( .D(n118), .CK(clk), .RN(n128), .Q(Q[53]), .QN(n54) );
  DFFRXLTS Q_reg_52_ ( .D(n117), .CK(clk), .RN(n128), .Q(Q[52]), .QN(n53) );
  DFFRXLTS Q_reg_51_ ( .D(n116), .CK(clk), .RN(n128), .Q(Q[51]), .QN(n52) );
  DFFRXLTS Q_reg_50_ ( .D(n115), .CK(clk), .RN(n128), .Q(Q[50]), .QN(n51) );
  DFFRXLTS Q_reg_49_ ( .D(n114), .CK(clk), .RN(n128), .Q(Q[49]), .QN(n50) );
  DFFRXLTS Q_reg_48_ ( .D(n113), .CK(clk), .RN(n128), .Q(Q[48]), .QN(n49) );
  DFFRXLTS Q_reg_47_ ( .D(n112), .CK(clk), .RN(n128), .Q(Q[47]), .QN(n48) );
  DFFRXLTS Q_reg_46_ ( .D(n111), .CK(clk), .RN(n128), .Q(Q[46]), .QN(n47) );
  DFFRXLTS Q_reg_45_ ( .D(n110), .CK(clk), .RN(n128), .Q(Q[45]), .QN(n46) );
  DFFRXLTS Q_reg_44_ ( .D(n109), .CK(clk), .RN(n128), .Q(Q[44]), .QN(n45) );
  DFFRXLTS Q_reg_43_ ( .D(n108), .CK(clk), .RN(n128), .Q(Q[43]), .QN(n44) );
  DFFRXLTS Q_reg_42_ ( .D(n107), .CK(clk), .RN(n128), .Q(Q[42]), .QN(n43) );
  DFFRXLTS Q_reg_41_ ( .D(n106), .CK(clk), .RN(n128), .Q(Q[41]), .QN(n42) );
  DFFRXLTS Q_reg_40_ ( .D(n105), .CK(clk), .RN(n128), .Q(Q[40]), .QN(n41) );
  DFFRXLTS Q_reg_39_ ( .D(n104), .CK(clk), .RN(n128), .Q(Q[39]), .QN(n40) );
  DFFRXLTS Q_reg_38_ ( .D(n103), .CK(clk), .RN(n128), .Q(Q[38]), .QN(n39) );
  DFFRXLTS Q_reg_37_ ( .D(n102), .CK(clk), .RN(n128), .Q(Q[37]), .QN(n38) );
  DFFRXLTS Q_reg_36_ ( .D(n101), .CK(clk), .RN(n128), .Q(Q[36]), .QN(n37) );
  DFFRXLTS Q_reg_35_ ( .D(n100), .CK(clk), .RN(n128), .Q(Q[35]), .QN(n36) );
  DFFRXLTS Q_reg_34_ ( .D(n99), .CK(clk), .RN(n128), .Q(Q[34]), .QN(n35) );
  DFFRXLTS Q_reg_33_ ( .D(n98), .CK(clk), .RN(n128), .Q(Q[33]), .QN(n34) );
  DFFRXLTS Q_reg_32_ ( .D(n97), .CK(clk), .RN(n128), .Q(Q[32]), .QN(n33) );
  DFFRXLTS Q_reg_31_ ( .D(n96), .CK(clk), .RN(n128), .Q(Q[31]), .QN(n32) );
  DFFRXLTS Q_reg_30_ ( .D(n95), .CK(clk), .RN(n128), .Q(Q[30]), .QN(n31) );
  DFFRXLTS Q_reg_29_ ( .D(n94), .CK(clk), .RN(n128), .Q(Q[29]), .QN(n30) );
  DFFRXLTS Q_reg_28_ ( .D(n93), .CK(clk), .RN(n128), .Q(Q[28]), .QN(n29) );
  DFFRXLTS Q_reg_27_ ( .D(n92), .CK(clk), .RN(n128), .Q(Q[27]), .QN(n28) );
  DFFRXLTS Q_reg_26_ ( .D(n91), .CK(clk), .RN(n128), .Q(Q[26]), .QN(n27) );
  DFFRXLTS Q_reg_25_ ( .D(n90), .CK(clk), .RN(n128), .Q(Q[25]), .QN(n26) );
  DFFRXLTS Q_reg_24_ ( .D(n89), .CK(clk), .RN(n128), .Q(Q[24]), .QN(n25) );
  DFFRXLTS Q_reg_23_ ( .D(n88), .CK(clk), .RN(n128), .Q(Q[23]), .QN(n24) );
  DFFRXLTS Q_reg_22_ ( .D(n87), .CK(clk), .RN(n128), .Q(Q[22]), .QN(n23) );
  DFFRXLTS Q_reg_21_ ( .D(n86), .CK(clk), .RN(n128), .Q(Q[21]), .QN(n22) );
  DFFRXLTS Q_reg_20_ ( .D(n85), .CK(clk), .RN(n128), .Q(Q[20]), .QN(n21) );
  DFFRXLTS Q_reg_19_ ( .D(n84), .CK(clk), .RN(n128), .Q(Q[19]), .QN(n20) );
  DFFRXLTS Q_reg_18_ ( .D(n83), .CK(clk), .RN(n128), .Q(Q[18]), .QN(n19) );
  DFFRXLTS Q_reg_17_ ( .D(n82), .CK(clk), .RN(n128), .Q(Q[17]), .QN(n18) );
  DFFRXLTS Q_reg_16_ ( .D(n81), .CK(clk), .RN(n128), .Q(Q[16]), .QN(n17) );
  DFFRXLTS Q_reg_15_ ( .D(n80), .CK(clk), .RN(n128), .Q(Q[15]), .QN(n16) );
  DFFRXLTS Q_reg_14_ ( .D(n79), .CK(clk), .RN(n128), .Q(Q[14]), .QN(n15) );
  DFFRXLTS Q_reg_13_ ( .D(n78), .CK(clk), .RN(n128), .Q(Q[13]), .QN(n14) );
  DFFRXLTS Q_reg_12_ ( .D(n77), .CK(clk), .RN(n128), .Q(Q[12]), .QN(n13) );
  DFFRXLTS Q_reg_11_ ( .D(n76), .CK(clk), .RN(n128), .Q(Q[11]), .QN(n12) );
  DFFRXLTS Q_reg_10_ ( .D(n75), .CK(clk), .RN(n128), .Q(Q[10]), .QN(n11) );
  DFFRXLTS Q_reg_9_ ( .D(n74), .CK(clk), .RN(n128), .Q(Q[9]), .QN(n10) );
  DFFRXLTS Q_reg_8_ ( .D(n73), .CK(clk), .RN(n128), .Q(Q[8]), .QN(n9) );
  DFFRXLTS Q_reg_7_ ( .D(n72), .CK(clk), .RN(n128), .Q(Q[7]), .QN(n8) );
  DFFRXLTS Q_reg_6_ ( .D(n71), .CK(clk), .RN(n128), .Q(Q[6]), .QN(n7) );
  DFFRXLTS Q_reg_5_ ( .D(n70), .CK(clk), .RN(n128), .Q(Q[5]), .QN(n6) );
  DFFRXLTS Q_reg_4_ ( .D(n69), .CK(clk), .RN(n128), .Q(Q[4]), .QN(n5) );
  DFFRXLTS Q_reg_3_ ( .D(n68), .CK(clk), .RN(n128), .Q(Q[3]), .QN(n4) );
  DFFRXLTS Q_reg_2_ ( .D(n67), .CK(clk), .RN(n128), .Q(Q[2]), .QN(n3) );
  DFFRXLTS Q_reg_1_ ( .D(n66), .CK(clk), .RN(n128), .Q(Q[1]), .QN(n2) );
  BUFX20TS U67 ( .A(n149), .Y(n130) );
  BUFX20TS U68 ( .A(n148), .Y(n131) );
  BUFX20TS U69 ( .A(n148), .Y(n132) );
  BUFX20TS U70 ( .A(n147), .Y(n133) );
  BUFX20TS U71 ( .A(n147), .Y(n134) );
  BUFX20TS U72 ( .A(n146), .Y(n135) );
  BUFX20TS U73 ( .A(n146), .Y(n136) );
  BUFX20TS U74 ( .A(n145), .Y(n137) );
  BUFX20TS U75 ( .A(n145), .Y(n138) );
  BUFX20TS U76 ( .A(n144), .Y(n139) );
  BUFX20TS U77 ( .A(n144), .Y(n140) );
  BUFX20TS U78 ( .A(n143), .Y(n141) );
  BUFX20TS U79 ( .A(n143), .Y(n142) );
  CLKBUFX20TS U80 ( .A(load), .Y(n143) );
  CLKBUFX20TS U81 ( .A(load), .Y(n144) );
  CLKBUFX20TS U82 ( .A(load), .Y(n145) );
  CLKBUFX20TS U83 ( .A(load), .Y(n146) );
  CLKBUFX20TS U84 ( .A(load), .Y(n147) );
  CLKBUFX20TS U85 ( .A(load), .Y(n148) );
  CLKBUFX20TS U86 ( .A(load), .Y(n149) );
endmodule


module RegisterAdd_W64_2 ( clk, rst, load, D, Q );
  input [63:0] D;
  output [63:0] Q;
  input clk, rst, load;
  wire   n130, n131, n132, n133, n134, n135, n136, n137, n138, n139, n140,
         n141, n142, n143, n144, n145, n146, n147, n148, n149, n150, n151,
         n152, n153, n154, n155, n156, n157, n158, n159, n160, n161, n162,
         n163, n164, n165, n166, n167, n168, n169, n170, n171, n172, n173,
         n174, n175, n176, n177, n178, n179, n180, n181, n182, n183, n184,
         n185, n186, n187, n188, n189, n190, n191, n192, n193, n194, n195,
         n196, n197, n198, n199, n200, n201, n202, n203, n204, n205, n206,
         n207, n208, n209, n210, n211, n212, n213, n214, n215, n216, n217,
         n218, n219, n220, n221, n222, n223, n224, n225, n226, n227, n228,
         n229, n230, n231, n232, n233, n234, n235, n236, n237, n238, n239,
         n240, n241, n242, n243, n244, n245, n246, n247, n248, n249, n250,
         n251, n252, n253, n254, n255, n256, n257, n258, n259, n260, n261,
         n262, n263, n264, n265, n266, n267, n268, n269, n270, n271, n272,
         n273, n274, n275, n276, n277, n278;

  OAI2BB2XLTS U2 ( .B0(n278), .B1(n130), .A0N(n142), .A1N(D[0]), .Y(n214) );
  OAI2BB2XLTS U3 ( .B0(n277), .B1(n130), .A0N(D[1]), .A1N(n142), .Y(n213) );
  OAI2BB2XLTS U4 ( .B0(n276), .B1(n130), .A0N(D[2]), .A1N(n142), .Y(n212) );
  OAI2BB2XLTS U5 ( .B0(n275), .B1(n130), .A0N(D[3]), .A1N(n142), .Y(n211) );
  OAI2BB2XLTS U6 ( .B0(n274), .B1(n130), .A0N(D[4]), .A1N(n142), .Y(n210) );
  OAI2BB2XLTS U7 ( .B0(n273), .B1(n131), .A0N(D[5]), .A1N(n142), .Y(n209) );
  OAI2BB2XLTS U8 ( .B0(n272), .B1(n130), .A0N(D[6]), .A1N(n142), .Y(n208) );
  OAI2BB2XLTS U9 ( .B0(n271), .B1(n130), .A0N(D[7]), .A1N(n142), .Y(n207) );
  OAI2BB2XLTS U10 ( .B0(n270), .B1(n131), .A0N(D[8]), .A1N(n141), .Y(n206) );
  OAI2BB2XLTS U11 ( .B0(n269), .B1(n131), .A0N(D[9]), .A1N(n141), .Y(n205) );
  OAI2BB2XLTS U12 ( .B0(n268), .B1(n131), .A0N(D[10]), .A1N(n141), .Y(n204) );
  OAI2BB2XLTS U13 ( .B0(n267), .B1(n132), .A0N(D[11]), .A1N(n141), .Y(n203) );
  OAI2BB2XLTS U14 ( .B0(n266), .B1(n131), .A0N(D[12]), .A1N(n141), .Y(n202) );
  OAI2BB2XLTS U15 ( .B0(n265), .B1(n132), .A0N(D[13]), .A1N(n141), .Y(n201) );
  OAI2BB2XLTS U16 ( .B0(n264), .B1(n131), .A0N(D[14]), .A1N(n141), .Y(n200) );
  OAI2BB2XLTS U17 ( .B0(n263), .B1(n131), .A0N(D[15]), .A1N(n141), .Y(n199) );
  OAI2BB2XLTS U18 ( .B0(n262), .B1(n132), .A0N(D[16]), .A1N(n141), .Y(n198) );
  OAI2BB2XLTS U19 ( .B0(n261), .B1(n133), .A0N(D[17]), .A1N(n141), .Y(n197) );
  OAI2BB2XLTS U20 ( .B0(n260), .B1(n132), .A0N(D[18]), .A1N(n140), .Y(n196) );
  OAI2BB2XLTS U21 ( .B0(n259), .B1(n133), .A0N(D[19]), .A1N(n140), .Y(n195) );
  OAI2BB2XLTS U22 ( .B0(n258), .B1(n133), .A0N(D[20]), .A1N(n140), .Y(n194) );
  OAI2BB2XLTS U23 ( .B0(n257), .B1(n132), .A0N(D[21]), .A1N(n140), .Y(n193) );
  OAI2BB2XLTS U24 ( .B0(n256), .B1(n133), .A0N(D[22]), .A1N(n140), .Y(n192) );
  OAI2BB2XLTS U25 ( .B0(n255), .B1(n134), .A0N(D[23]), .A1N(n140), .Y(n191) );
  OAI2BB2XLTS U26 ( .B0(n254), .B1(n133), .A0N(D[24]), .A1N(n140), .Y(n190) );
  OAI2BB2XLTS U27 ( .B0(n253), .B1(n134), .A0N(D[25]), .A1N(n140), .Y(n189) );
  OAI2BB2XLTS U28 ( .B0(n252), .B1(n134), .A0N(D[26]), .A1N(n140), .Y(n188) );
  OAI2BB2XLTS U29 ( .B0(n251), .B1(n133), .A0N(D[27]), .A1N(n140), .Y(n187) );
  OAI2BB2XLTS U30 ( .B0(n250), .B1(n132), .A0N(D[28]), .A1N(n139), .Y(n186) );
  OAI2BB2XLTS U31 ( .B0(n249), .B1(n135), .A0N(D[29]), .A1N(n139), .Y(n185) );
  OAI2BB2XLTS U32 ( .B0(n248), .B1(n134), .A0N(D[30]), .A1N(n139), .Y(n184) );
  OAI2BB2XLTS U33 ( .B0(n247), .B1(n135), .A0N(D[31]), .A1N(n139), .Y(n183) );
  OAI2BB2XLTS U34 ( .B0(n246), .B1(n135), .A0N(D[32]), .A1N(n139), .Y(n182) );
  OAI2BB2XLTS U35 ( .B0(n245), .B1(n134), .A0N(D[33]), .A1N(n139), .Y(n181) );
  OAI2BB2XLTS U36 ( .B0(n244), .B1(n135), .A0N(D[34]), .A1N(n139), .Y(n180) );
  OAI2BB2XLTS U37 ( .B0(n243), .B1(n134), .A0N(D[35]), .A1N(n139), .Y(n179) );
  OAI2BB2XLTS U38 ( .B0(n242), .B1(n134), .A0N(D[36]), .A1N(n139), .Y(n178) );
  OAI2BB2XLTS U39 ( .B0(n241), .B1(n136), .A0N(D[37]), .A1N(n139), .Y(n177) );
  OAI2BB2XLTS U40 ( .B0(n240), .B1(n136), .A0N(D[38]), .A1N(n138), .Y(n176) );
  OAI2BB2XLTS U41 ( .B0(n239), .B1(n135), .A0N(D[39]), .A1N(n138), .Y(n175) );
  OAI2BB2XLTS U42 ( .B0(n238), .B1(n136), .A0N(D[40]), .A1N(n138), .Y(n174) );
  OAI2BB2XLTS U43 ( .B0(n237), .B1(n136), .A0N(D[41]), .A1N(n138), .Y(n173) );
  OAI2BB2XLTS U44 ( .B0(n236), .B1(n135), .A0N(D[42]), .A1N(n138), .Y(n172) );
  OAI2BB2XLTS U45 ( .B0(n235), .B1(n135), .A0N(D[43]), .A1N(n138), .Y(n171) );
  OAI2BB2XLTS U46 ( .B0(n234), .B1(n134), .A0N(D[44]), .A1N(n138), .Y(n170) );
  OAI2BB2XLTS U47 ( .B0(n233), .B1(n135), .A0N(D[45]), .A1N(n137), .Y(n169) );
  OAI2BB2XLTS U48 ( .B0(n232), .B1(n134), .A0N(D[46]), .A1N(n138), .Y(n168) );
  OAI2BB2XLTS U49 ( .B0(n231), .B1(n135), .A0N(D[47]), .A1N(n137), .Y(n167) );
  OAI2BB2XLTS U50 ( .B0(n230), .B1(n135), .A0N(D[48]), .A1N(n137), .Y(n166) );
  OAI2BB2XLTS U51 ( .B0(n229), .B1(n133), .A0N(D[49]), .A1N(n137), .Y(n165) );
  OAI2BB2XLTS U52 ( .B0(n228), .B1(n134), .A0N(D[50]), .A1N(n137), .Y(n164) );
  OAI2BB2XLTS U53 ( .B0(n227), .B1(n133), .A0N(D[51]), .A1N(n136), .Y(n163) );
  OAI2BB2XLTS U54 ( .B0(n226), .B1(n132), .A0N(D[52]), .A1N(n136), .Y(n162) );
  OAI2BB2XLTS U55 ( .B0(n225), .B1(n133), .A0N(D[53]), .A1N(n137), .Y(n161) );
  OAI2BB2XLTS U56 ( .B0(n224), .B1(n133), .A0N(D[54]), .A1N(n137), .Y(n160) );
  OAI2BB2XLTS U57 ( .B0(n223), .B1(n132), .A0N(D[55]), .A1N(n136), .Y(n159) );
  OAI2BB2XLTS U58 ( .B0(n222), .B1(n132), .A0N(D[56]), .A1N(n137), .Y(n158) );
  OAI2BB2XLTS U59 ( .B0(n221), .B1(n132), .A0N(D[57]), .A1N(n136), .Y(n157) );
  OAI2BB2XLTS U60 ( .B0(n220), .B1(n131), .A0N(D[58]), .A1N(n136), .Y(n156) );
  OAI2BB2XLTS U61 ( .B0(n219), .B1(n131), .A0N(D[59]), .A1N(n137), .Y(n155) );
  OAI2BB2XLTS U62 ( .B0(n218), .B1(n131), .A0N(D[60]), .A1N(n136), .Y(n154) );
  OAI2BB2XLTS U63 ( .B0(n217), .B1(n130), .A0N(D[61]), .A1N(n138), .Y(n153) );
  OAI2BB2XLTS U64 ( .B0(n216), .B1(n130), .A0N(D[62]), .A1N(n137), .Y(n152) );
  OAI2BB2XLTS U65 ( .B0(n215), .B1(n130), .A0N(D[63]), .A1N(n138), .Y(n150) );
  INVX2TS U66 ( .A(rst), .Y(n151) );
  DFFRX2TS Q_reg_0_ ( .D(n214), .CK(clk), .RN(n151), .Q(Q[0]), .QN(n278) );
  DFFRX2TS Q_reg_63_ ( .D(n150), .CK(clk), .RN(n151), .Q(Q[63]), .QN(n215) );
  DFFRX2TS Q_reg_62_ ( .D(n152), .CK(clk), .RN(n151), .Q(Q[62]), .QN(n216) );
  DFFRX2TS Q_reg_61_ ( .D(n153), .CK(clk), .RN(n151), .Q(Q[61]), .QN(n217) );
  DFFRX2TS Q_reg_60_ ( .D(n154), .CK(clk), .RN(n151), .Q(Q[60]), .QN(n218) );
  DFFRX2TS Q_reg_59_ ( .D(n155), .CK(clk), .RN(n151), .Q(Q[59]), .QN(n219) );
  DFFRX2TS Q_reg_58_ ( .D(n156), .CK(clk), .RN(n151), .Q(Q[58]), .QN(n220) );
  DFFRX2TS Q_reg_57_ ( .D(n157), .CK(clk), .RN(n151), .Q(Q[57]), .QN(n221) );
  DFFRX2TS Q_reg_56_ ( .D(n158), .CK(clk), .RN(n151), .Q(Q[56]), .QN(n222) );
  DFFRX2TS Q_reg_55_ ( .D(n159), .CK(clk), .RN(n151), .Q(Q[55]), .QN(n223) );
  DFFRX2TS Q_reg_54_ ( .D(n160), .CK(clk), .RN(n151), .Q(Q[54]), .QN(n224) );
  DFFRX2TS Q_reg_53_ ( .D(n161), .CK(clk), .RN(n151), .Q(Q[53]), .QN(n225) );
  DFFRX2TS Q_reg_52_ ( .D(n162), .CK(clk), .RN(n151), .Q(Q[52]), .QN(n226) );
  DFFRX2TS Q_reg_51_ ( .D(n163), .CK(clk), .RN(n151), .Q(Q[51]), .QN(n227) );
  DFFRX2TS Q_reg_50_ ( .D(n164), .CK(clk), .RN(n151), .Q(Q[50]), .QN(n228) );
  DFFRX2TS Q_reg_49_ ( .D(n165), .CK(clk), .RN(n151), .Q(Q[49]), .QN(n229) );
  DFFRX2TS Q_reg_48_ ( .D(n166), .CK(clk), .RN(n151), .Q(Q[48]), .QN(n230) );
  DFFRX2TS Q_reg_47_ ( .D(n167), .CK(clk), .RN(n151), .Q(Q[47]), .QN(n231) );
  DFFRX2TS Q_reg_46_ ( .D(n168), .CK(clk), .RN(n151), .Q(Q[46]), .QN(n232) );
  DFFRX2TS Q_reg_45_ ( .D(n169), .CK(clk), .RN(n151), .Q(Q[45]), .QN(n233) );
  DFFRX2TS Q_reg_44_ ( .D(n170), .CK(clk), .RN(n151), .Q(Q[44]), .QN(n234) );
  DFFRX2TS Q_reg_43_ ( .D(n171), .CK(clk), .RN(n151), .Q(Q[43]), .QN(n235) );
  DFFRX2TS Q_reg_42_ ( .D(n172), .CK(clk), .RN(n151), .Q(Q[42]), .QN(n236) );
  DFFRX2TS Q_reg_41_ ( .D(n173), .CK(clk), .RN(n151), .Q(Q[41]), .QN(n237) );
  DFFRX2TS Q_reg_40_ ( .D(n174), .CK(clk), .RN(n151), .Q(Q[40]), .QN(n238) );
  DFFRX2TS Q_reg_39_ ( .D(n175), .CK(clk), .RN(n151), .Q(Q[39]), .QN(n239) );
  DFFRX2TS Q_reg_38_ ( .D(n176), .CK(clk), .RN(n151), .Q(Q[38]), .QN(n240) );
  DFFRX2TS Q_reg_37_ ( .D(n177), .CK(clk), .RN(n151), .Q(Q[37]), .QN(n241) );
  DFFRX2TS Q_reg_36_ ( .D(n178), .CK(clk), .RN(n151), .Q(Q[36]), .QN(n242) );
  DFFRX2TS Q_reg_35_ ( .D(n179), .CK(clk), .RN(n151), .Q(Q[35]), .QN(n243) );
  DFFRX2TS Q_reg_34_ ( .D(n180), .CK(clk), .RN(n151), .Q(Q[34]), .QN(n244) );
  DFFRX2TS Q_reg_33_ ( .D(n181), .CK(clk), .RN(n151), .Q(Q[33]), .QN(n245) );
  DFFRX2TS Q_reg_32_ ( .D(n182), .CK(clk), .RN(n151), .Q(Q[32]), .QN(n246) );
  DFFRX2TS Q_reg_31_ ( .D(n183), .CK(clk), .RN(n151), .Q(Q[31]), .QN(n247) );
  DFFRX2TS Q_reg_30_ ( .D(n184), .CK(clk), .RN(n151), .Q(Q[30]), .QN(n248) );
  DFFRX2TS Q_reg_29_ ( .D(n185), .CK(clk), .RN(n151), .Q(Q[29]), .QN(n249) );
  DFFRX2TS Q_reg_28_ ( .D(n186), .CK(clk), .RN(n151), .Q(Q[28]), .QN(n250) );
  DFFRX2TS Q_reg_27_ ( .D(n187), .CK(clk), .RN(n151), .Q(Q[27]), .QN(n251) );
  DFFRX2TS Q_reg_26_ ( .D(n188), .CK(clk), .RN(n151), .Q(Q[26]), .QN(n252) );
  DFFRX2TS Q_reg_25_ ( .D(n189), .CK(clk), .RN(n151), .Q(Q[25]), .QN(n253) );
  DFFRX2TS Q_reg_24_ ( .D(n190), .CK(clk), .RN(n151), .Q(Q[24]), .QN(n254) );
  DFFRX2TS Q_reg_23_ ( .D(n191), .CK(clk), .RN(n151), .Q(Q[23]), .QN(n255) );
  DFFRX2TS Q_reg_22_ ( .D(n192), .CK(clk), .RN(n151), .Q(Q[22]), .QN(n256) );
  DFFRX2TS Q_reg_21_ ( .D(n193), .CK(clk), .RN(n151), .Q(Q[21]), .QN(n257) );
  DFFRX2TS Q_reg_20_ ( .D(n194), .CK(clk), .RN(n151), .Q(Q[20]), .QN(n258) );
  DFFRX2TS Q_reg_19_ ( .D(n195), .CK(clk), .RN(n151), .Q(Q[19]), .QN(n259) );
  DFFRX2TS Q_reg_18_ ( .D(n196), .CK(clk), .RN(n151), .Q(Q[18]), .QN(n260) );
  DFFRX2TS Q_reg_17_ ( .D(n197), .CK(clk), .RN(n151), .Q(Q[17]), .QN(n261) );
  DFFRX2TS Q_reg_16_ ( .D(n198), .CK(clk), .RN(n151), .Q(Q[16]), .QN(n262) );
  DFFRX2TS Q_reg_15_ ( .D(n199), .CK(clk), .RN(n151), .Q(Q[15]), .QN(n263) );
  DFFRX2TS Q_reg_14_ ( .D(n200), .CK(clk), .RN(n151), .Q(Q[14]), .QN(n264) );
  DFFRX2TS Q_reg_13_ ( .D(n201), .CK(clk), .RN(n151), .Q(Q[13]), .QN(n265) );
  DFFRX2TS Q_reg_12_ ( .D(n202), .CK(clk), .RN(n151), .Q(Q[12]), .QN(n266) );
  DFFRX2TS Q_reg_11_ ( .D(n203), .CK(clk), .RN(n151), .Q(Q[11]), .QN(n267) );
  DFFRX2TS Q_reg_10_ ( .D(n204), .CK(clk), .RN(n151), .Q(Q[10]), .QN(n268) );
  DFFRX2TS Q_reg_9_ ( .D(n205), .CK(clk), .RN(n151), .Q(Q[9]), .QN(n269) );
  DFFRX2TS Q_reg_8_ ( .D(n206), .CK(clk), .RN(n151), .Q(Q[8]), .QN(n270) );
  DFFRX2TS Q_reg_7_ ( .D(n207), .CK(clk), .RN(n151), .Q(Q[7]), .QN(n271) );
  DFFRX2TS Q_reg_6_ ( .D(n208), .CK(clk), .RN(n151), .Q(Q[6]), .QN(n272) );
  DFFRX2TS Q_reg_5_ ( .D(n209), .CK(clk), .RN(n151), .Q(Q[5]), .QN(n273) );
  DFFRX2TS Q_reg_4_ ( .D(n210), .CK(clk), .RN(n151), .Q(Q[4]), .QN(n274) );
  DFFRX2TS Q_reg_3_ ( .D(n211), .CK(clk), .RN(n151), .Q(Q[3]), .QN(n275) );
  DFFRX2TS Q_reg_2_ ( .D(n212), .CK(clk), .RN(n151), .Q(Q[2]), .QN(n276) );
  DFFRX2TS Q_reg_1_ ( .D(n213), .CK(clk), .RN(n151), .Q(Q[1]), .QN(n277) );
  BUFX20TS U67 ( .A(n149), .Y(n130) );
  BUFX20TS U68 ( .A(n148), .Y(n131) );
  BUFX20TS U69 ( .A(n148), .Y(n132) );
  BUFX20TS U70 ( .A(n147), .Y(n133) );
  BUFX20TS U71 ( .A(n147), .Y(n134) );
  BUFX20TS U72 ( .A(n146), .Y(n135) );
  BUFX20TS U73 ( .A(n146), .Y(n136) );
  BUFX20TS U74 ( .A(n145), .Y(n137) );
  BUFX20TS U75 ( .A(n145), .Y(n138) );
  BUFX20TS U76 ( .A(n144), .Y(n139) );
  BUFX20TS U77 ( .A(n144), .Y(n140) );
  BUFX20TS U78 ( .A(n143), .Y(n141) );
  BUFX20TS U79 ( .A(n143), .Y(n142) );
  CLKBUFX20TS U80 ( .A(load), .Y(n143) );
  CLKBUFX20TS U81 ( .A(load), .Y(n144) );
  CLKBUFX20TS U82 ( .A(load), .Y(n145) );
  CLKBUFX20TS U83 ( .A(load), .Y(n146) );
  CLKBUFX20TS U84 ( .A(load), .Y(n147) );
  CLKBUFX20TS U85 ( .A(load), .Y(n148) );
  CLKBUFX20TS U86 ( .A(load), .Y(n149) );
endmodule


module RegisterAdd_W1_11 ( clk, rst, load, D, Q );
  input [0:0] D;
  output [0:0] Q;
  input clk, rst, load;
  wire   n4, n5, n6;

  OAI2BB2XLTS U2 ( .B0(n6), .B1(load), .A0N(load), .A1N(D[0]), .Y(n4) );
  INVX2TS U3 ( .A(rst), .Y(n5) );
  DFFRX2TS Q_reg_0_ ( .D(n4), .CK(clk), .RN(n5), .Q(Q[0]), .QN(n6) );
endmodule


module Comparator_W63 ( Data_X_i, Data_Y_i, gtXY_o, eqXY_o );
  input [62:0] Data_X_i;
  input [62:0] Data_Y_i;
  output gtXY_o, eqXY_o;
  wire   N0, N1, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14,
         n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42,
         n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56,
         n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70,
         n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84,
         n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98,
         n99, n100, n101, n102, n103, n104, n105, n106, n107, n108, n109, n110,
         n111, n112, n113, n114, n115, n116, n117, n118, n119, n120, n121,
         n122, n123, n124, n125, n126, n127, n128, n129, n130, n131, n132,
         n133, n134, n135, n136, n137, n138, n139, n140, n141, n142, n143,
         n144, n145, n146, n147, n148, n149, n150, n151, n152, n153, n154,
         n155, n156, n157, n158, n159, n160, n161, n162, n163, n164, n165,
         n166, n167, n168, n169, n170, n171, n172, n173, n174, n175, n176,
         n177, n178, n179, n180, n181, n182, n183, n184, n185, n186, n187,
         n188, n189, n190, n191, n192, n193, n194, n195, n196, n197, n198,
         n199, n200, n201, n202, n203, n204, n205, n206, n207, n208, n209,
         n210, n211, n212, n213, n214, n215, n216, n217, n218, n219, n220,
         n221, n222, n223, n224, n225, n226, n227;

  BUFX16TS B_1 ( .A(N1), .Y(eqXY_o) );
  BUFX16TS B_0 ( .A(N0), .Y(gtXY_o) );
  CLKINVX1TS U1 ( .A(Data_Y_i[8]), .Y(n133) );
  XOR2X1TS U2 ( .A(Data_X_i[8]), .B(n133), .Y(n4) );
  CLKINVX1TS U3 ( .A(Data_Y_i[10]), .Y(n130) );
  XOR2X1TS U4 ( .A(Data_X_i[10]), .B(n130), .Y(n1) );
  XOR2X1TS U5 ( .A(Data_X_i[11]), .B(Data_Y_i[11]), .Y(n131) );
  NOR2BX1TS U6 ( .AN(n1), .B(n131), .Y(n137) );
  XOR2X1TS U7 ( .A(Data_X_i[9]), .B(Data_Y_i[9]), .Y(n134) );
  XOR2X1TS U8 ( .A(Data_X_i[13]), .B(Data_Y_i[13]), .Y(n143) );
  CLKINVX1TS U9 ( .A(Data_Y_i[14]), .Y(n139) );
  XOR2X1TS U10 ( .A(Data_X_i[14]), .B(n139), .Y(n2) );
  XOR2X1TS U11 ( .A(Data_X_i[15]), .B(Data_Y_i[15]), .Y(n140) );
  NOR2BX1TS U12 ( .AN(n2), .B(n140), .Y(n146) );
  CLKINVX1TS U13 ( .A(Data_Y_i[12]), .Y(n142) );
  XOR2X1TS U14 ( .A(Data_X_i[12]), .B(n142), .Y(n3) );
  NAND3BX1TS U15 ( .AN(n143), .B(n146), .C(n3), .Y(n149) );
  NOR4BBX1TS U16 ( .AN(n4), .BN(n137), .C(n134), .D(n149), .Y(n171) );
  XOR2X1TS U17 ( .A(Data_X_i[0]), .B(Data_Y_i[0]), .Y(n163) );
  CLKINVX1TS U18 ( .A(Data_Y_i[16]), .Y(n207) );
  XOR2X1TS U19 ( .A(Data_X_i[16]), .B(n207), .Y(n13) );
  CLKINVX1TS U20 ( .A(Data_Y_i[18]), .Y(n211) );
  XOR2X1TS U21 ( .A(Data_X_i[18]), .B(n211), .Y(n5) );
  XOR2X1TS U22 ( .A(Data_X_i[19]), .B(Data_Y_i[19]), .Y(n210) );
  NOR2BX1TS U23 ( .AN(n5), .B(n210), .Y(n214) );
  CLKINVX1TS U24 ( .A(Data_Y_i[24]), .Y(n179) );
  XOR2X1TS U25 ( .A(Data_X_i[24]), .B(n179), .Y(n9) );
  CLKINVX1TS U26 ( .A(Data_Y_i[26]), .Y(n176) );
  XOR2X1TS U27 ( .A(Data_X_i[26]), .B(n176), .Y(n6) );
  XOR2X1TS U28 ( .A(Data_X_i[27]), .B(Data_Y_i[27]), .Y(n177) );
  NOR2BX1TS U29 ( .AN(n6), .B(n177), .Y(n183) );
  XOR2X1TS U30 ( .A(Data_X_i[25]), .B(Data_Y_i[25]), .Y(n180) );
  XOR2X1TS U31 ( .A(Data_X_i[29]), .B(Data_Y_i[29]), .Y(n189) );
  CLKINVX1TS U32 ( .A(Data_Y_i[30]), .Y(n185) );
  XOR2X1TS U33 ( .A(Data_X_i[30]), .B(n185), .Y(n7) );
  XOR2X1TS U34 ( .A(Data_X_i[31]), .B(Data_Y_i[31]), .Y(n186) );
  NOR2BX1TS U35 ( .AN(n7), .B(n186), .Y(n192) );
  CLKINVX1TS U36 ( .A(Data_Y_i[28]), .Y(n188) );
  XOR2X1TS U37 ( .A(Data_X_i[28]), .B(n188), .Y(n8) );
  NAND3BX1TS U38 ( .AN(n189), .B(n192), .C(n8), .Y(n195) );
  NOR4BBX1TS U39 ( .AN(n9), .BN(n183), .C(n180), .D(n195), .Y(n218) );
  CLKINVX1TS U40 ( .A(Data_X_i[21]), .Y(n196) );
  XOR2X1TS U41 ( .A(n196), .B(Data_Y_i[21]), .Y(n198) );
  CLKINVX1TS U42 ( .A(Data_Y_i[22]), .Y(n201) );
  XOR2X1TS U43 ( .A(Data_X_i[22]), .B(n201), .Y(n10) );
  XOR2X1TS U44 ( .A(Data_X_i[23]), .B(Data_Y_i[23]), .Y(n200) );
  NOR2BX1TS U45 ( .AN(n10), .B(n200), .Y(n202) );
  CLKINVX1TS U46 ( .A(Data_X_i[20]), .Y(n197) );
  XOR2X1TS U47 ( .A(n197), .B(Data_Y_i[20]), .Y(n11) );
  NAND3X1TS U48 ( .A(n198), .B(n202), .C(n11), .Y(n212) );
  CLKINVX1TS U49 ( .A(Data_Y_i[17]), .Y(n206) );
  XNOR2X1TS U50 ( .A(Data_X_i[17]), .B(n206), .Y(n208) );
  NOR3BX1TS U51 ( .AN(n218), .B(n212), .C(n208), .Y(n12) );
  NAND3X1TS U52 ( .A(n13), .B(n214), .C(n12), .Y(n224) );
  CLKINVX1TS U53 ( .A(Data_X_i[1]), .Y(n166) );
  XNOR2X1TS U54 ( .A(n166), .B(Data_Y_i[1]), .Y(n162) );
  CLKINVX1TS U55 ( .A(Data_X_i[6]), .Y(n155) );
  XOR2X1TS U56 ( .A(n155), .B(Data_Y_i[6]), .Y(n14) );
  XNOR2X1TS U57 ( .A(Data_X_i[7]), .B(Data_Y_i[7]), .Y(n154) );
  NAND2X1TS U58 ( .A(n14), .B(n154), .Y(n156) );
  CLKINVX1TS U59 ( .A(Data_X_i[5]), .Y(n150) );
  XOR2X1TS U60 ( .A(n150), .B(Data_Y_i[5]), .Y(n152) );
  CLKINVX1TS U61 ( .A(Data_X_i[4]), .Y(n151) );
  XOR2X1TS U62 ( .A(n151), .B(Data_Y_i[4]), .Y(n15) );
  NAND3BX1TS U63 ( .AN(n156), .B(n152), .C(n15), .Y(n168) );
  OR4X1TS U64 ( .A(n163), .B(n224), .C(n162), .D(n168), .Y(n34) );
  CLKINVX1TS U65 ( .A(Data_X_i[2]), .Y(n160) );
  XOR2X1TS U66 ( .A(n160), .B(Data_Y_i[2]), .Y(n16) );
  XNOR2X1TS U67 ( .A(Data_X_i[3]), .B(Data_Y_i[3]), .Y(n161) );
  NAND2X1TS U68 ( .A(n16), .B(n161), .Y(n169) );
  CLKINVX1TS U69 ( .A(Data_Y_i[34]), .Y(n70) );
  XOR2X1TS U70 ( .A(Data_X_i[34]), .B(n70), .Y(n17) );
  XOR2X1TS U71 ( .A(Data_X_i[35]), .B(Data_Y_i[35]), .Y(n71) );
  NOR2BX1TS U72 ( .AN(n17), .B(n71), .Y(n74) );
  CLKINVX1TS U73 ( .A(Data_Y_i[40]), .Y(n39) );
  XOR2X1TS U74 ( .A(Data_X_i[40]), .B(n39), .Y(n21) );
  CLKINVX1TS U75 ( .A(Data_Y_i[42]), .Y(n36) );
  XOR2X1TS U76 ( .A(Data_X_i[42]), .B(n36), .Y(n18) );
  XOR2X1TS U77 ( .A(Data_X_i[43]), .B(Data_Y_i[43]), .Y(n37) );
  NOR2BX1TS U78 ( .AN(n18), .B(n37), .Y(n43) );
  XOR2X1TS U79 ( .A(Data_X_i[41]), .B(Data_Y_i[41]), .Y(n40) );
  XOR2X1TS U80 ( .A(Data_X_i[45]), .B(Data_Y_i[45]), .Y(n49) );
  CLKINVX1TS U81 ( .A(Data_Y_i[46]), .Y(n45) );
  XOR2X1TS U82 ( .A(Data_X_i[46]), .B(n45), .Y(n19) );
  XOR2X1TS U83 ( .A(Data_X_i[47]), .B(Data_Y_i[47]), .Y(n46) );
  NOR2BX1TS U84 ( .AN(n19), .B(n46), .Y(n52) );
  CLKINVX1TS U85 ( .A(Data_Y_i[44]), .Y(n48) );
  XOR2X1TS U86 ( .A(Data_X_i[44]), .B(n48), .Y(n20) );
  NAND3BX1TS U87 ( .AN(n49), .B(n52), .C(n20), .Y(n55) );
  NOR4BBX1TS U88 ( .AN(n21), .BN(n43), .C(n40), .D(n55), .Y(n78) );
  CLKINVX1TS U89 ( .A(Data_Y_i[32]), .Y(n68) );
  XOR2X1TS U90 ( .A(Data_X_i[32]), .B(n68), .Y(n33) );
  CLKINVX1TS U91 ( .A(Data_X_i[37]), .Y(n56) );
  XOR2X1TS U92 ( .A(n56), .B(Data_Y_i[37]), .Y(n57) );
  CLKINVX1TS U93 ( .A(Data_Y_i[38]), .Y(n60) );
  XOR2X1TS U94 ( .A(Data_X_i[38]), .B(n60), .Y(n22) );
  XOR2X1TS U95 ( .A(Data_X_i[39]), .B(Data_Y_i[39]), .Y(n61) );
  NOR2BX1TS U96 ( .AN(n22), .B(n61), .Y(n62) );
  CLKINVX1TS U97 ( .A(Data_X_i[36]), .Y(n58) );
  XOR2X1TS U98 ( .A(n58), .B(Data_Y_i[36]), .Y(n23) );
  NAND3X1TS U99 ( .A(n57), .B(n62), .C(n23), .Y(n72) );
  CLKINVX1TS U100 ( .A(Data_Y_i[48]), .Y(n112) );
  XOR2X1TS U101 ( .A(Data_X_i[48]), .B(n112), .Y(n31) );
  CLKINVX1TS U102 ( .A(Data_Y_i[50]), .Y(n114) );
  XOR2X1TS U103 ( .A(Data_X_i[50]), .B(n114), .Y(n24) );
  XOR2X1TS U104 ( .A(Data_X_i[51]), .B(Data_Y_i[51]), .Y(n115) );
  NOR2BX1TS U105 ( .AN(n24), .B(n115), .Y(n118) );
  CLKINVX1TS U106 ( .A(Data_Y_i[56]), .Y(n86) );
  XOR2X1TS U107 ( .A(Data_X_i[56]), .B(n86), .Y(n27) );
  CLKINVX1TS U108 ( .A(Data_Y_i[58]), .Y(n83) );
  XOR2X1TS U109 ( .A(Data_X_i[58]), .B(n83), .Y(n25) );
  XOR2X1TS U110 ( .A(Data_X_i[59]), .B(Data_Y_i[59]), .Y(n84) );
  NOR2BX1TS U111 ( .AN(n25), .B(n84), .Y(n90) );
  XOR2X1TS U112 ( .A(Data_X_i[57]), .B(Data_Y_i[57]), .Y(n87) );
  XOR2X1TS U113 ( .A(Data_X_i[61]), .B(Data_Y_i[61]), .Y(n93) );
  XNOR2X1TS U114 ( .A(Data_X_i[62]), .B(Data_Y_i[62]), .Y(n94) );
  CLKINVX1TS U115 ( .A(Data_Y_i[60]), .Y(n92) );
  XOR2X1TS U116 ( .A(Data_X_i[60]), .B(n92), .Y(n26) );
  NAND3BX1TS U117 ( .AN(n93), .B(n94), .C(n26), .Y(n99) );
  NOR4BBX1TS U118 ( .AN(n27), .BN(n90), .C(n87), .D(n99), .Y(n122) );
  CLKINVX1TS U119 ( .A(Data_X_i[53]), .Y(n100) );
  XOR2X1TS U120 ( .A(n100), .B(Data_Y_i[53]), .Y(n101) );
  CLKINVX1TS U121 ( .A(Data_Y_i[54]), .Y(n104) );
  XOR2X1TS U122 ( .A(Data_X_i[54]), .B(n104), .Y(n28) );
  XOR2X1TS U123 ( .A(Data_X_i[55]), .B(Data_Y_i[55]), .Y(n105) );
  NOR2BX1TS U124 ( .AN(n28), .B(n105), .Y(n106) );
  CLKINVX1TS U125 ( .A(Data_X_i[52]), .Y(n102) );
  XOR2X1TS U126 ( .A(n102), .B(Data_Y_i[52]), .Y(n29) );
  NAND3X1TS U127 ( .A(n101), .B(n106), .C(n29), .Y(n116) );
  CLKINVX1TS U128 ( .A(Data_Y_i[49]), .Y(n110) );
  XNOR2X1TS U129 ( .A(Data_X_i[49]), .B(n110), .Y(n111) );
  NOR3BX1TS U130 ( .AN(n122), .B(n116), .C(n111), .Y(n30) );
  NAND3X1TS U131 ( .A(n31), .B(n118), .C(n30), .Y(n128) );
  CLKINVX1TS U132 ( .A(Data_Y_i[33]), .Y(n66) );
  XNOR2X1TS U133 ( .A(Data_X_i[33]), .B(n66), .Y(n67) );
  NOR3X1TS U134 ( .A(n72), .B(n128), .C(n67), .Y(n32) );
  NAND4X1TS U135 ( .A(n74), .B(n78), .C(n33), .D(n32), .Y(n227) );
  NOR4BX1TS U136 ( .AN(n171), .B(n34), .C(n169), .D(n227), .Y(N1) );
  CLKINVX1TS U137 ( .A(Data_Y_i[43]), .Y(n35) );
  OAI32X1TS U138 ( .A0(n37), .A1(Data_X_i[42]), .A2(n36), .B0(Data_X_i[43]), 
        .B1(n35), .Y(n42) );
  CLKINVX1TS U139 ( .A(Data_Y_i[41]), .Y(n38) );
  OAI32X1TS U140 ( .A0(n40), .A1(Data_X_i[40]), .A2(n39), .B0(Data_X_i[41]), 
        .B1(n38), .Y(n41) );
  OAI22X1TS U141 ( .A0(n43), .A1(n42), .B0(n42), .B1(n41), .Y(n54) );
  CLKINVX1TS U142 ( .A(Data_Y_i[47]), .Y(n44) );
  OAI32X1TS U143 ( .A0(n46), .A1(Data_X_i[46]), .A2(n45), .B0(Data_X_i[47]), 
        .B1(n44), .Y(n51) );
  CLKINVX1TS U144 ( .A(Data_Y_i[45]), .Y(n47) );
  OAI32X1TS U145 ( .A0(n49), .A1(Data_X_i[44]), .A2(n48), .B0(Data_X_i[45]), 
        .B1(n47), .Y(n50) );
  OAI22X1TS U146 ( .A0(n52), .A1(n51), .B0(n51), .B1(n50), .Y(n53) );
  OAI21X1TS U147 ( .A0(n55), .A1(n54), .B0(n53), .Y(n81) );
  AOI32X1TS U148 ( .A0(Data_Y_i[36]), .A1(n58), .A2(n57), .B0(Data_Y_i[37]), 
        .B1(n56), .Y(n65) );
  CLKINVX1TS U149 ( .A(Data_Y_i[39]), .Y(n59) );
  OAI32X1TS U150 ( .A0(n61), .A1(Data_X_i[38]), .A2(n60), .B0(Data_X_i[39]), 
        .B1(n59), .Y(n63) );
  CLKINVX1TS U151 ( .A(n63), .Y(n64) );
  AOI2BB2X1TS U152 ( .B0(n65), .B1(n64), .A0N(n63), .A1N(n62), .Y(n80) );
  OAI32X1TS U153 ( .A0(n68), .A1(Data_X_i[32]), .A2(n67), .B0(n66), .B1(
        Data_X_i[33]), .Y(n76) );
  CLKINVX1TS U154 ( .A(Data_Y_i[35]), .Y(n69) );
  OAI32X1TS U155 ( .A0(n71), .A1(Data_X_i[34]), .A2(n70), .B0(Data_X_i[35]), 
        .B1(n69), .Y(n75) );
  CLKINVX1TS U156 ( .A(n72), .Y(n73) );
  OAI221XLTS U157 ( .A0(n76), .A1(n75), .B0(n75), .B1(n74), .C0(n73), .Y(n77)
         );
  CLKINVX1TS U158 ( .A(n77), .Y(n79) );
  OAI32X1TS U159 ( .A0(n81), .A1(n80), .A2(n79), .B0(n78), .B1(n81), .Y(n127)
         );
  CLKINVX1TS U160 ( .A(Data_Y_i[59]), .Y(n82) );
  OAI32X1TS U161 ( .A0(n84), .A1(Data_X_i[58]), .A2(n83), .B0(Data_X_i[59]), 
        .B1(n82), .Y(n89) );
  CLKINVX1TS U162 ( .A(Data_Y_i[57]), .Y(n85) );
  OAI32X1TS U163 ( .A0(n87), .A1(Data_X_i[56]), .A2(n86), .B0(Data_X_i[57]), 
        .B1(n85), .Y(n88) );
  OAI22X1TS U164 ( .A0(n90), .A1(n89), .B0(n89), .B1(n88), .Y(n98) );
  NOR2BX1TS U165 ( .AN(Data_Y_i[62]), .B(Data_X_i[62]), .Y(n96) );
  CLKINVX1TS U166 ( .A(Data_Y_i[61]), .Y(n91) );
  OAI32X1TS U167 ( .A0(n93), .A1(Data_X_i[60]), .A2(n92), .B0(Data_X_i[61]), 
        .B1(n91), .Y(n95) );
  OAI22X1TS U168 ( .A0(n96), .A1(n95), .B0(n96), .B1(n94), .Y(n97) );
  OAI21X1TS U169 ( .A0(n99), .A1(n98), .B0(n97), .Y(n125) );
  AOI32X1TS U170 ( .A0(Data_Y_i[52]), .A1(n102), .A2(n101), .B0(Data_Y_i[53]), 
        .B1(n100), .Y(n109) );
  CLKINVX1TS U171 ( .A(Data_Y_i[55]), .Y(n103) );
  OAI32X1TS U172 ( .A0(n105), .A1(Data_X_i[54]), .A2(n104), .B0(Data_X_i[55]), 
        .B1(n103), .Y(n107) );
  CLKINVX1TS U173 ( .A(n107), .Y(n108) );
  AOI2BB2X1TS U174 ( .B0(n109), .B1(n108), .A0N(n107), .A1N(n106), .Y(n124) );
  OAI32X1TS U175 ( .A0(n112), .A1(Data_X_i[48]), .A2(n111), .B0(n110), .B1(
        Data_X_i[49]), .Y(n120) );
  CLKINVX1TS U176 ( .A(Data_Y_i[51]), .Y(n113) );
  OAI32X1TS U177 ( .A0(n115), .A1(Data_X_i[50]), .A2(n114), .B0(Data_X_i[51]), 
        .B1(n113), .Y(n119) );
  CLKINVX1TS U178 ( .A(n116), .Y(n117) );
  OAI221XLTS U179 ( .A0(n120), .A1(n119), .B0(n119), .B1(n118), .C0(n117), .Y(
        n121) );
  CLKINVX1TS U180 ( .A(n121), .Y(n123) );
  OAI32X1TS U181 ( .A0(n125), .A1(n124), .A2(n123), .B0(n122), .B1(n125), .Y(
        n126) );
  OA21XLTS U182 ( .A0(n128), .A1(n127), .B0(n126), .Y(n226) );
  CLKINVX1TS U183 ( .A(Data_Y_i[11]), .Y(n129) );
  OAI32X1TS U184 ( .A0(n131), .A1(Data_X_i[10]), .A2(n130), .B0(Data_X_i[11]), 
        .B1(n129), .Y(n136) );
  CLKINVX1TS U185 ( .A(Data_Y_i[9]), .Y(n132) );
  OAI32X1TS U186 ( .A0(n134), .A1(Data_X_i[8]), .A2(n133), .B0(Data_X_i[9]), 
        .B1(n132), .Y(n135) );
  OAI22X1TS U187 ( .A0(n137), .A1(n136), .B0(n136), .B1(n135), .Y(n148) );
  CLKINVX1TS U188 ( .A(Data_Y_i[15]), .Y(n138) );
  OAI32X1TS U189 ( .A0(n140), .A1(Data_X_i[14]), .A2(n139), .B0(Data_X_i[15]), 
        .B1(n138), .Y(n145) );
  CLKINVX1TS U190 ( .A(Data_Y_i[13]), .Y(n141) );
  OAI32X1TS U191 ( .A0(n143), .A1(Data_X_i[12]), .A2(n142), .B0(Data_X_i[13]), 
        .B1(n141), .Y(n144) );
  OAI22X1TS U192 ( .A0(n146), .A1(n145), .B0(n145), .B1(n144), .Y(n147) );
  OAI21X1TS U193 ( .A0(n149), .A1(n148), .B0(n147), .Y(n174) );
  AOI32X1TS U194 ( .A0(n152), .A1(n151), .A2(Data_Y_i[4]), .B0(Data_Y_i[5]), 
        .B1(n150), .Y(n158) );
  CLKINVX1TS U195 ( .A(Data_X_i[7]), .Y(n153) );
  AOI32X1TS U196 ( .A0(Data_Y_i[6]), .A1(n155), .A2(n154), .B0(n153), .B1(
        Data_Y_i[7]), .Y(n157) );
  AOI22X1TS U197 ( .A0(n158), .A1(n157), .B0(n157), .B1(n156), .Y(n173) );
  CLKINVX1TS U198 ( .A(Data_X_i[3]), .Y(n159) );
  AOI32X1TS U199 ( .A0(n161), .A1(n160), .A2(Data_Y_i[2]), .B0(n159), .B1(
        Data_Y_i[3]), .Y(n170) );
  CLKINVX1TS U200 ( .A(n170), .Y(n165) );
  AOI21X1TS U201 ( .A0(Data_X_i[0]), .A1(n163), .B0(n162), .Y(n164) );
  AOI211X1TS U202 ( .A0(Data_Y_i[1]), .A1(n166), .B0(n165), .C0(n164), .Y(n167) );
  AOI211X1TS U203 ( .A0(n170), .A1(n169), .B0(n168), .C0(n167), .Y(n172) );
  OAI32X1TS U204 ( .A0(n174), .A1(n173), .A2(n172), .B0(n171), .B1(n174), .Y(
        n223) );
  CLKINVX1TS U205 ( .A(Data_Y_i[27]), .Y(n175) );
  OAI32X1TS U206 ( .A0(n177), .A1(Data_X_i[26]), .A2(n176), .B0(Data_X_i[27]), 
        .B1(n175), .Y(n182) );
  CLKINVX1TS U207 ( .A(Data_Y_i[25]), .Y(n178) );
  OAI32X1TS U208 ( .A0(n180), .A1(Data_X_i[24]), .A2(n179), .B0(Data_X_i[25]), 
        .B1(n178), .Y(n181) );
  OAI22X1TS U209 ( .A0(n183), .A1(n182), .B0(n182), .B1(n181), .Y(n194) );
  CLKINVX1TS U210 ( .A(Data_Y_i[31]), .Y(n184) );
  OAI32X1TS U211 ( .A0(n186), .A1(Data_X_i[30]), .A2(n185), .B0(Data_X_i[31]), 
        .B1(n184), .Y(n191) );
  CLKINVX1TS U212 ( .A(Data_Y_i[29]), .Y(n187) );
  OAI32X1TS U213 ( .A0(n189), .A1(Data_X_i[28]), .A2(n188), .B0(Data_X_i[29]), 
        .B1(n187), .Y(n190) );
  OAI22X1TS U214 ( .A0(n192), .A1(n191), .B0(n191), .B1(n190), .Y(n193) );
  OAI21X1TS U215 ( .A0(n195), .A1(n194), .B0(n193), .Y(n221) );
  AOI32X1TS U216 ( .A0(n198), .A1(n197), .A2(Data_Y_i[20]), .B0(Data_Y_i[21]), 
        .B1(n196), .Y(n205) );
  CLKINVX1TS U217 ( .A(Data_Y_i[23]), .Y(n199) );
  OAI32X1TS U218 ( .A0(n201), .A1(Data_X_i[22]), .A2(n200), .B0(Data_X_i[23]), 
        .B1(n199), .Y(n203) );
  CLKINVX1TS U219 ( .A(n203), .Y(n204) );
  AOI2BB2X1TS U220 ( .B0(n205), .B1(n204), .A0N(n203), .A1N(n202), .Y(n220) );
  OAI32X1TS U221 ( .A0(n208), .A1(Data_X_i[16]), .A2(n207), .B0(n206), .B1(
        Data_X_i[17]), .Y(n216) );
  CLKINVX1TS U222 ( .A(Data_Y_i[19]), .Y(n209) );
  OAI32X1TS U223 ( .A0(n211), .A1(Data_X_i[18]), .A2(n210), .B0(Data_X_i[19]), 
        .B1(n209), .Y(n215) );
  CLKINVX1TS U224 ( .A(n212), .Y(n213) );
  OAI221XLTS U225 ( .A0(n216), .A1(n215), .B0(n215), .B1(n214), .C0(n213), .Y(
        n217) );
  CLKINVX1TS U226 ( .A(n217), .Y(n219) );
  OAI32X1TS U227 ( .A0(n221), .A1(n220), .A2(n219), .B0(n218), .B1(n221), .Y(
        n222) );
  OAI211X1TS U228 ( .A0(n224), .A1(n223), .B0(n222), .C0(n226), .Y(n225) );
  OAI2BB1X1TS U229 ( .A0N(n227), .A1N(n226), .B0(n225), .Y(N0) );
endmodule


module xor_tri_W64 ( A_i, B_i, C_i, Z_o );
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


module MultiplexTxT_W63 ( select, D0_i, D1_i, S0_o, S1_o );
  input [62:0] D0_i;
  input [62:0] D1_i;
  output [62:0] S0_o;
  output [62:0] S1_o;
  input select;
  wire   n1, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
         n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122,
         n123, n124, n125, n126, n127, n2, n128, n129, n130, n131, n132, n133,
         n134, n135, n136, n137, n138, n139, n140, n141, n142, n143, n144,
         n145, n146, n147, n148, n149, n150, n151, n152, n153, n154, n155,
         n156, n157, n158, n159, n160;

  OAI22X1TS U1 ( .A0(n1), .A1(n146), .B0(n2), .B1(n3), .Y(S1_o[9]) );
  OAI22X1TS U2 ( .A0(n153), .A1(n4), .B0(n2), .B1(n5), .Y(S1_o[8]) );
  OAI22X1TS U3 ( .A0(n153), .A1(n6), .B0(n2), .B1(n7), .Y(S1_o[7]) );
  OAI22X1TS U4 ( .A0(n153), .A1(n8), .B0(n2), .B1(n9), .Y(S1_o[6]) );
  OAI22X1TS U5 ( .A0(n153), .A1(n10), .B0(n2), .B1(n11), .Y(S1_o[62]) );
  OAI22X1TS U6 ( .A0(n153), .A1(n12), .B0(n2), .B1(n13), .Y(S1_o[61]) );
  OAI22X1TS U7 ( .A0(n152), .A1(n14), .B0(n2), .B1(n15), .Y(S1_o[60]) );
  OAI22X1TS U8 ( .A0(n153), .A1(n16), .B0(n2), .B1(n17), .Y(S1_o[5]) );
  OAI22X1TS U9 ( .A0(n153), .A1(n18), .B0(n2), .B1(n19), .Y(S1_o[59]) );
  OAI22X1TS U10 ( .A0(n152), .A1(n20), .B0(n2), .B1(n21), .Y(S1_o[58]) );
  OAI22X1TS U11 ( .A0(n152), .A1(n22), .B0(n128), .B1(n23), .Y(S1_o[57]) );
  OAI22X1TS U12 ( .A0(n152), .A1(n24), .B0(n128), .B1(n25), .Y(S1_o[56]) );
  OAI22X1TS U13 ( .A0(n152), .A1(n26), .B0(n128), .B1(n27), .Y(S1_o[55]) );
  OAI22X1TS U14 ( .A0(n152), .A1(n28), .B0(n128), .B1(n29), .Y(S1_o[54]) );
  OAI22X1TS U15 ( .A0(n152), .A1(n30), .B0(n128), .B1(n31), .Y(S1_o[53]) );
  OAI22X1TS U16 ( .A0(n151), .A1(n32), .B0(n128), .B1(n33), .Y(S1_o[52]) );
  OAI22X1TS U17 ( .A0(n152), .A1(n34), .B0(n128), .B1(n35), .Y(S1_o[51]) );
  OAI22X1TS U18 ( .A0(n152), .A1(n36), .B0(n128), .B1(n37), .Y(S1_o[50]) );
  OAI22X1TS U19 ( .A0(n151), .A1(n38), .B0(n128), .B1(n39), .Y(S1_o[4]) );
  OAI22X1TS U20 ( .A0(n151), .A1(n40), .B0(n128), .B1(n41), .Y(S1_o[49]) );
  OAI22X1TS U21 ( .A0(n151), .A1(n42), .B0(n129), .B1(n43), .Y(S1_o[48]) );
  OAI22X1TS U22 ( .A0(n151), .A1(n44), .B0(n129), .B1(n45), .Y(S1_o[47]) );
  OAI22X1TS U23 ( .A0(n151), .A1(n46), .B0(n129), .B1(n47), .Y(S1_o[46]) );
  OAI22X1TS U24 ( .A0(n151), .A1(n48), .B0(n129), .B1(n49), .Y(S1_o[45]) );
  OAI22X1TS U25 ( .A0(n150), .A1(n50), .B0(n129), .B1(n51), .Y(S1_o[44]) );
  OAI22X1TS U26 ( .A0(n151), .A1(n52), .B0(n129), .B1(n53), .Y(S1_o[43]) );
  OAI22X1TS U27 ( .A0(n151), .A1(n54), .B0(n129), .B1(n55), .Y(S1_o[42]) );
  OAI22X1TS U28 ( .A0(n150), .A1(n56), .B0(n129), .B1(n57), .Y(S1_o[41]) );
  OAI22X1TS U29 ( .A0(n150), .A1(n58), .B0(n129), .B1(n59), .Y(S1_o[40]) );
  OAI22X1TS U30 ( .A0(n150), .A1(n60), .B0(n129), .B1(n61), .Y(S1_o[3]) );
  OAI22X1TS U31 ( .A0(n150), .A1(n62), .B0(n130), .B1(n63), .Y(S1_o[39]) );
  OAI22X1TS U32 ( .A0(n150), .A1(n64), .B0(n130), .B1(n65), .Y(S1_o[38]) );
  OAI22X1TS U33 ( .A0(n150), .A1(n66), .B0(n130), .B1(n67), .Y(S1_o[37]) );
  OAI22X1TS U34 ( .A0(n149), .A1(n68), .B0(n130), .B1(n69), .Y(S1_o[36]) );
  OAI22X1TS U35 ( .A0(n150), .A1(n70), .B0(n130), .B1(n71), .Y(S1_o[35]) );
  OAI22X1TS U36 ( .A0(n150), .A1(n72), .B0(n130), .B1(n73), .Y(S1_o[34]) );
  OAI22X1TS U37 ( .A0(n149), .A1(n74), .B0(n130), .B1(n75), .Y(S1_o[33]) );
  OAI22X1TS U38 ( .A0(n149), .A1(n76), .B0(n130), .B1(n77), .Y(S1_o[32]) );
  OAI22X1TS U39 ( .A0(n149), .A1(n78), .B0(n130), .B1(n79), .Y(S1_o[31]) );
  OAI22X1TS U40 ( .A0(n149), .A1(n80), .B0(n130), .B1(n81), .Y(S1_o[30]) );
  OAI22X1TS U41 ( .A0(n149), .A1(n82), .B0(n131), .B1(n83), .Y(S1_o[2]) );
  OAI22X1TS U42 ( .A0(n149), .A1(n84), .B0(n131), .B1(n85), .Y(S1_o[29]) );
  OAI22X1TS U43 ( .A0(n153), .A1(n86), .B0(n131), .B1(n87), .Y(S1_o[28]) );
  OAI22X1TS U44 ( .A0(n149), .A1(n88), .B0(n131), .B1(n89), .Y(S1_o[27]) );
  OAI22X1TS U45 ( .A0(n149), .A1(n90), .B0(n131), .B1(n91), .Y(S1_o[26]) );
  OAI22X1TS U46 ( .A0(n148), .A1(n92), .B0(n131), .B1(n93), .Y(S1_o[25]) );
  OAI22X1TS U47 ( .A0(n148), .A1(n94), .B0(n131), .B1(n95), .Y(S1_o[24]) );
  OAI22X1TS U48 ( .A0(n148), .A1(n96), .B0(n131), .B1(n97), .Y(S1_o[23]) );
  OAI22X1TS U49 ( .A0(n148), .A1(n98), .B0(n131), .B1(n99), .Y(S1_o[22]) );
  OAI22X1TS U50 ( .A0(n148), .A1(n100), .B0(n131), .B1(n101), .Y(S1_o[21]) );
  OAI22X1TS U51 ( .A0(n148), .A1(n102), .B0(n132), .B1(n103), .Y(S1_o[20]) );
  OAI22X1TS U52 ( .A0(n148), .A1(n104), .B0(n132), .B1(n105), .Y(S1_o[1]) );
  OAI22X1TS U53 ( .A0(n148), .A1(n106), .B0(n132), .B1(n107), .Y(S1_o[19]) );
  OAI22X1TS U54 ( .A0(n148), .A1(n108), .B0(n132), .B1(n109), .Y(S1_o[18]) );
  OAI22X1TS U55 ( .A0(n147), .A1(n110), .B0(n132), .B1(n111), .Y(S1_o[17]) );
  OAI22X1TS U56 ( .A0(n147), .A1(n112), .B0(n132), .B1(n113), .Y(S1_o[16]) );
  OAI22X1TS U57 ( .A0(n147), .A1(n114), .B0(n132), .B1(n115), .Y(S1_o[15]) );
  OAI22X1TS U58 ( .A0(n147), .A1(n116), .B0(n132), .B1(n117), .Y(S1_o[14]) );
  OAI22X1TS U59 ( .A0(n147), .A1(n118), .B0(n132), .B1(n119), .Y(S1_o[13]) );
  OAI22X1TS U60 ( .A0(n147), .A1(n120), .B0(n132), .B1(n121), .Y(S1_o[12]) );
  OAI22X1TS U61 ( .A0(n147), .A1(n122), .B0(n133), .B1(n123), .Y(S1_o[11]) );
  OAI22X1TS U62 ( .A0(n147), .A1(n124), .B0(n133), .B1(n125), .Y(S1_o[10]) );
  OAI22X1TS U63 ( .A0(n147), .A1(n126), .B0(n133), .B1(n127), .Y(S1_o[0]) );
  OAI22X1TS U64 ( .A0(n133), .A1(n1), .B0(n3), .B1(n153), .Y(S0_o[9]) );
  CLKINVX1TS U65 ( .A(D0_i[9]), .Y(n3) );
  CLKINVX1TS U66 ( .A(D1_i[9]), .Y(n1) );
  OAI22X1TS U67 ( .A0(n133), .A1(n4), .B0(n140), .B1(n5), .Y(S0_o[8]) );
  CLKINVX1TS U68 ( .A(D0_i[8]), .Y(n5) );
  CLKINVX1TS U69 ( .A(D1_i[8]), .Y(n4) );
  OAI22X1TS U70 ( .A0(n133), .A1(n6), .B0(n140), .B1(n7), .Y(S0_o[7]) );
  CLKINVX1TS U71 ( .A(D0_i[7]), .Y(n7) );
  CLKINVX1TS U72 ( .A(D1_i[7]), .Y(n6) );
  OAI22X1TS U73 ( .A0(n133), .A1(n8), .B0(n140), .B1(n9), .Y(S0_o[6]) );
  CLKINVX1TS U74 ( .A(D0_i[6]), .Y(n9) );
  CLKINVX1TS U75 ( .A(D1_i[6]), .Y(n8) );
  OAI22X1TS U76 ( .A0(n133), .A1(n10), .B0(n140), .B1(n11), .Y(S0_o[62]) );
  CLKINVX1TS U77 ( .A(D0_i[62]), .Y(n11) );
  CLKINVX1TS U78 ( .A(D1_i[62]), .Y(n10) );
  OAI22X1TS U79 ( .A0(n133), .A1(n12), .B0(n140), .B1(n13), .Y(S0_o[61]) );
  CLKINVX1TS U80 ( .A(D0_i[61]), .Y(n13) );
  CLKINVX1TS U81 ( .A(D1_i[61]), .Y(n12) );
  OAI22X1TS U82 ( .A0(n133), .A1(n14), .B0(n140), .B1(n15), .Y(S0_o[60]) );
  CLKINVX1TS U83 ( .A(D0_i[60]), .Y(n15) );
  CLKINVX1TS U84 ( .A(D1_i[60]), .Y(n14) );
  OAI22X1TS U85 ( .A0(n134), .A1(n16), .B0(n140), .B1(n17), .Y(S0_o[5]) );
  CLKINVX1TS U86 ( .A(D0_i[5]), .Y(n17) );
  CLKINVX1TS U87 ( .A(D1_i[5]), .Y(n16) );
  OAI22X1TS U88 ( .A0(n134), .A1(n18), .B0(n140), .B1(n19), .Y(S0_o[59]) );
  CLKINVX1TS U89 ( .A(D0_i[59]), .Y(n19) );
  CLKINVX1TS U90 ( .A(D1_i[59]), .Y(n18) );
  OAI22X1TS U91 ( .A0(n134), .A1(n20), .B0(n141), .B1(n21), .Y(S0_o[58]) );
  CLKINVX1TS U92 ( .A(D0_i[58]), .Y(n21) );
  CLKINVX1TS U93 ( .A(D1_i[58]), .Y(n20) );
  OAI22X1TS U94 ( .A0(n134), .A1(n22), .B0(n141), .B1(n23), .Y(S0_o[57]) );
  CLKINVX1TS U95 ( .A(D0_i[57]), .Y(n23) );
  CLKINVX1TS U96 ( .A(D1_i[57]), .Y(n22) );
  OAI22X1TS U97 ( .A0(n134), .A1(n24), .B0(n141), .B1(n25), .Y(S0_o[56]) );
  CLKINVX1TS U98 ( .A(D0_i[56]), .Y(n25) );
  CLKINVX1TS U99 ( .A(D1_i[56]), .Y(n24) );
  OAI22X1TS U100 ( .A0(n134), .A1(n26), .B0(n141), .B1(n27), .Y(S0_o[55]) );
  CLKINVX1TS U101 ( .A(D0_i[55]), .Y(n27) );
  CLKINVX1TS U102 ( .A(D1_i[55]), .Y(n26) );
  OAI22X1TS U103 ( .A0(n134), .A1(n28), .B0(n141), .B1(n29), .Y(S0_o[54]) );
  CLKINVX1TS U104 ( .A(D0_i[54]), .Y(n29) );
  CLKINVX1TS U105 ( .A(D1_i[54]), .Y(n28) );
  OAI22X1TS U106 ( .A0(n134), .A1(n30), .B0(n141), .B1(n31), .Y(S0_o[53]) );
  CLKINVX1TS U107 ( .A(D0_i[53]), .Y(n31) );
  CLKINVX1TS U108 ( .A(D1_i[53]), .Y(n30) );
  OAI22X1TS U109 ( .A0(n134), .A1(n32), .B0(n141), .B1(n33), .Y(S0_o[52]) );
  CLKINVX1TS U110 ( .A(D0_i[52]), .Y(n33) );
  CLKINVX1TS U111 ( .A(D1_i[52]), .Y(n32) );
  OAI22X1TS U112 ( .A0(n134), .A1(n34), .B0(n141), .B1(n35), .Y(S0_o[51]) );
  CLKINVX1TS U113 ( .A(D0_i[51]), .Y(n35) );
  CLKINVX1TS U114 ( .A(D1_i[51]), .Y(n34) );
  OAI22X1TS U115 ( .A0(n135), .A1(n36), .B0(n141), .B1(n37), .Y(S0_o[50]) );
  CLKINVX1TS U116 ( .A(D0_i[50]), .Y(n37) );
  CLKINVX1TS U117 ( .A(D1_i[50]), .Y(n36) );
  OAI22X1TS U118 ( .A0(n135), .A1(n38), .B0(n142), .B1(n39), .Y(S0_o[4]) );
  CLKINVX1TS U119 ( .A(D0_i[4]), .Y(n39) );
  CLKINVX1TS U120 ( .A(D1_i[4]), .Y(n38) );
  OAI22X1TS U121 ( .A0(n135), .A1(n40), .B0(n142), .B1(n41), .Y(S0_o[49]) );
  CLKINVX1TS U122 ( .A(D0_i[49]), .Y(n41) );
  CLKINVX1TS U123 ( .A(D1_i[49]), .Y(n40) );
  OAI22X1TS U124 ( .A0(n135), .A1(n42), .B0(n142), .B1(n43), .Y(S0_o[48]) );
  CLKINVX1TS U125 ( .A(D0_i[48]), .Y(n43) );
  CLKINVX1TS U126 ( .A(D1_i[48]), .Y(n42) );
  OAI22X1TS U127 ( .A0(n135), .A1(n44), .B0(n142), .B1(n45), .Y(S0_o[47]) );
  CLKINVX1TS U128 ( .A(D0_i[47]), .Y(n45) );
  CLKINVX1TS U129 ( .A(D1_i[47]), .Y(n44) );
  OAI22X1TS U130 ( .A0(n135), .A1(n46), .B0(n142), .B1(n47), .Y(S0_o[46]) );
  CLKINVX1TS U131 ( .A(D0_i[46]), .Y(n47) );
  CLKINVX1TS U132 ( .A(D1_i[46]), .Y(n46) );
  OAI22X1TS U133 ( .A0(n135), .A1(n48), .B0(n142), .B1(n49), .Y(S0_o[45]) );
  CLKINVX1TS U134 ( .A(D0_i[45]), .Y(n49) );
  CLKINVX1TS U135 ( .A(D1_i[45]), .Y(n48) );
  OAI22X1TS U136 ( .A0(n135), .A1(n50), .B0(n142), .B1(n51), .Y(S0_o[44]) );
  CLKINVX1TS U137 ( .A(D0_i[44]), .Y(n51) );
  CLKINVX1TS U138 ( .A(D1_i[44]), .Y(n50) );
  OAI22X1TS U139 ( .A0(n135), .A1(n52), .B0(n142), .B1(n53), .Y(S0_o[43]) );
  CLKINVX1TS U140 ( .A(D0_i[43]), .Y(n53) );
  CLKINVX1TS U141 ( .A(D1_i[43]), .Y(n52) );
  OAI22X1TS U142 ( .A0(n135), .A1(n54), .B0(n142), .B1(n55), .Y(S0_o[42]) );
  CLKINVX1TS U143 ( .A(D0_i[42]), .Y(n55) );
  CLKINVX1TS U144 ( .A(D1_i[42]), .Y(n54) );
  OAI22X1TS U145 ( .A0(n136), .A1(n56), .B0(n143), .B1(n57), .Y(S0_o[41]) );
  CLKINVX1TS U146 ( .A(D0_i[41]), .Y(n57) );
  CLKINVX1TS U147 ( .A(D1_i[41]), .Y(n56) );
  OAI22X1TS U148 ( .A0(n136), .A1(n58), .B0(n143), .B1(n59), .Y(S0_o[40]) );
  CLKINVX1TS U149 ( .A(D0_i[40]), .Y(n59) );
  CLKINVX1TS U150 ( .A(D1_i[40]), .Y(n58) );
  OAI22X1TS U151 ( .A0(n136), .A1(n60), .B0(n143), .B1(n61), .Y(S0_o[3]) );
  CLKINVX1TS U152 ( .A(D0_i[3]), .Y(n61) );
  CLKINVX1TS U153 ( .A(D1_i[3]), .Y(n60) );
  OAI22X1TS U154 ( .A0(n136), .A1(n62), .B0(n143), .B1(n63), .Y(S0_o[39]) );
  CLKINVX1TS U155 ( .A(D0_i[39]), .Y(n63) );
  CLKINVX1TS U156 ( .A(D1_i[39]), .Y(n62) );
  OAI22X1TS U157 ( .A0(n136), .A1(n64), .B0(n143), .B1(n65), .Y(S0_o[38]) );
  CLKINVX1TS U158 ( .A(D0_i[38]), .Y(n65) );
  CLKINVX1TS U159 ( .A(D1_i[38]), .Y(n64) );
  OAI22X1TS U160 ( .A0(n136), .A1(n66), .B0(n143), .B1(n67), .Y(S0_o[37]) );
  CLKINVX1TS U161 ( .A(D0_i[37]), .Y(n67) );
  CLKINVX1TS U162 ( .A(D1_i[37]), .Y(n66) );
  OAI22X1TS U163 ( .A0(n136), .A1(n68), .B0(n143), .B1(n69), .Y(S0_o[36]) );
  CLKINVX1TS U164 ( .A(D0_i[36]), .Y(n69) );
  CLKINVX1TS U165 ( .A(D1_i[36]), .Y(n68) );
  OAI22X1TS U166 ( .A0(n136), .A1(n70), .B0(n143), .B1(n71), .Y(S0_o[35]) );
  CLKINVX1TS U167 ( .A(D0_i[35]), .Y(n71) );
  CLKINVX1TS U168 ( .A(D1_i[35]), .Y(n70) );
  OAI22X1TS U169 ( .A0(n136), .A1(n72), .B0(n144), .B1(n73), .Y(S0_o[34]) );
  CLKINVX1TS U170 ( .A(D0_i[34]), .Y(n73) );
  CLKINVX1TS U171 ( .A(D1_i[34]), .Y(n72) );
  OAI22X1TS U172 ( .A0(n136), .A1(n74), .B0(n144), .B1(n75), .Y(S0_o[33]) );
  CLKINVX1TS U173 ( .A(D0_i[33]), .Y(n75) );
  CLKINVX1TS U174 ( .A(D1_i[33]), .Y(n74) );
  OAI22X1TS U175 ( .A0(n137), .A1(n76), .B0(n144), .B1(n77), .Y(S0_o[32]) );
  CLKINVX1TS U176 ( .A(D0_i[32]), .Y(n77) );
  CLKINVX1TS U177 ( .A(D1_i[32]), .Y(n76) );
  OAI22X1TS U178 ( .A0(n137), .A1(n78), .B0(n144), .B1(n79), .Y(S0_o[31]) );
  CLKINVX1TS U179 ( .A(D0_i[31]), .Y(n79) );
  CLKINVX1TS U180 ( .A(D1_i[31]), .Y(n78) );
  OAI22X1TS U181 ( .A0(n137), .A1(n80), .B0(n144), .B1(n81), .Y(S0_o[30]) );
  CLKINVX1TS U182 ( .A(D0_i[30]), .Y(n81) );
  CLKINVX1TS U183 ( .A(D1_i[30]), .Y(n80) );
  OAI22X1TS U184 ( .A0(n137), .A1(n82), .B0(n144), .B1(n83), .Y(S0_o[2]) );
  CLKINVX1TS U185 ( .A(D0_i[2]), .Y(n83) );
  CLKINVX1TS U186 ( .A(D1_i[2]), .Y(n82) );
  OAI22X1TS U187 ( .A0(n137), .A1(n84), .B0(n143), .B1(n85), .Y(S0_o[29]) );
  CLKINVX1TS U188 ( .A(D0_i[29]), .Y(n85) );
  CLKINVX1TS U189 ( .A(D1_i[29]), .Y(n84) );
  OAI22X1TS U190 ( .A0(n137), .A1(n86), .B0(n144), .B1(n87), .Y(S0_o[28]) );
  CLKINVX1TS U191 ( .A(D0_i[28]), .Y(n87) );
  CLKINVX1TS U192 ( .A(D1_i[28]), .Y(n86) );
  OAI22X1TS U193 ( .A0(n137), .A1(n88), .B0(n144), .B1(n89), .Y(S0_o[27]) );
  CLKINVX1TS U194 ( .A(D0_i[27]), .Y(n89) );
  CLKINVX1TS U195 ( .A(D1_i[27]), .Y(n88) );
  OAI22X1TS U196 ( .A0(n137), .A1(n90), .B0(n144), .B1(n91), .Y(S0_o[26]) );
  CLKINVX1TS U197 ( .A(D0_i[26]), .Y(n91) );
  CLKINVX1TS U198 ( .A(D1_i[26]), .Y(n90) );
  OAI22X1TS U199 ( .A0(n137), .A1(n92), .B0(n145), .B1(n93), .Y(S0_o[25]) );
  CLKINVX1TS U200 ( .A(D0_i[25]), .Y(n93) );
  CLKINVX1TS U201 ( .A(D1_i[25]), .Y(n92) );
  OAI22X1TS U202 ( .A0(n137), .A1(n94), .B0(n145), .B1(n95), .Y(S0_o[24]) );
  CLKINVX1TS U203 ( .A(D0_i[24]), .Y(n95) );
  CLKINVX1TS U204 ( .A(D1_i[24]), .Y(n94) );
  OAI22X1TS U205 ( .A0(n138), .A1(n96), .B0(n145), .B1(n97), .Y(S0_o[23]) );
  CLKINVX1TS U206 ( .A(D0_i[23]), .Y(n97) );
  CLKINVX1TS U207 ( .A(D1_i[23]), .Y(n96) );
  OAI22X1TS U208 ( .A0(n138), .A1(n98), .B0(n145), .B1(n99), .Y(S0_o[22]) );
  CLKINVX1TS U209 ( .A(D0_i[22]), .Y(n99) );
  CLKINVX1TS U210 ( .A(D1_i[22]), .Y(n98) );
  OAI22X1TS U211 ( .A0(n138), .A1(n100), .B0(n145), .B1(n101), .Y(S0_o[21]) );
  CLKINVX1TS U212 ( .A(D0_i[21]), .Y(n101) );
  CLKINVX1TS U213 ( .A(D1_i[21]), .Y(n100) );
  OAI22X1TS U214 ( .A0(n138), .A1(n102), .B0(n145), .B1(n103), .Y(S0_o[20]) );
  CLKINVX1TS U215 ( .A(D0_i[20]), .Y(n103) );
  CLKINVX1TS U216 ( .A(D1_i[20]), .Y(n102) );
  OAI22X1TS U217 ( .A0(n138), .A1(n104), .B0(n145), .B1(n105), .Y(S0_o[1]) );
  CLKINVX1TS U218 ( .A(D0_i[1]), .Y(n105) );
  CLKINVX1TS U219 ( .A(D1_i[1]), .Y(n104) );
  OAI22X1TS U220 ( .A0(n138), .A1(n106), .B0(n145), .B1(n107), .Y(S0_o[19]) );
  CLKINVX1TS U221 ( .A(D0_i[19]), .Y(n107) );
  CLKINVX1TS U222 ( .A(D1_i[19]), .Y(n106) );
  OAI22X1TS U223 ( .A0(n138), .A1(n108), .B0(n145), .B1(n109), .Y(S0_o[18]) );
  CLKINVX1TS U224 ( .A(D0_i[18]), .Y(n109) );
  CLKINVX1TS U225 ( .A(D1_i[18]), .Y(n108) );
  OAI22X1TS U226 ( .A0(n138), .A1(n110), .B0(n146), .B1(n111), .Y(S0_o[17]) );
  CLKINVX1TS U227 ( .A(D0_i[17]), .Y(n111) );
  CLKINVX1TS U228 ( .A(D1_i[17]), .Y(n110) );
  OAI22X1TS U229 ( .A0(n138), .A1(n112), .B0(n146), .B1(n113), .Y(S0_o[16]) );
  CLKINVX1TS U230 ( .A(D0_i[16]), .Y(n113) );
  CLKINVX1TS U231 ( .A(D1_i[16]), .Y(n112) );
  OAI22X1TS U232 ( .A0(n138), .A1(n114), .B0(n146), .B1(n115), .Y(S0_o[15]) );
  CLKINVX1TS U233 ( .A(D0_i[15]), .Y(n115) );
  CLKINVX1TS U234 ( .A(D1_i[15]), .Y(n114) );
  OAI22X1TS U235 ( .A0(n139), .A1(n116), .B0(n146), .B1(n117), .Y(S0_o[14]) );
  CLKINVX1TS U236 ( .A(D0_i[14]), .Y(n117) );
  CLKINVX1TS U237 ( .A(D1_i[14]), .Y(n116) );
  OAI22X1TS U238 ( .A0(n139), .A1(n118), .B0(n146), .B1(n119), .Y(S0_o[13]) );
  CLKINVX1TS U239 ( .A(D0_i[13]), .Y(n119) );
  CLKINVX1TS U240 ( .A(D1_i[13]), .Y(n118) );
  OAI22X1TS U241 ( .A0(n139), .A1(n120), .B0(n146), .B1(n121), .Y(S0_o[12]) );
  CLKINVX1TS U242 ( .A(D0_i[12]), .Y(n121) );
  CLKINVX1TS U243 ( .A(D1_i[12]), .Y(n120) );
  OAI22X1TS U244 ( .A0(n139), .A1(n122), .B0(n146), .B1(n123), .Y(S0_o[11]) );
  CLKINVX1TS U245 ( .A(D0_i[11]), .Y(n123) );
  CLKINVX1TS U246 ( .A(D1_i[11]), .Y(n122) );
  OAI22X1TS U247 ( .A0(n139), .A1(n124), .B0(n146), .B1(n125), .Y(S0_o[10]) );
  CLKINVX1TS U248 ( .A(D0_i[10]), .Y(n125) );
  CLKINVX1TS U249 ( .A(D1_i[10]), .Y(n124) );
  OAI22X1TS U250 ( .A0(n139), .A1(n126), .B0(n140), .B1(n127), .Y(S0_o[0]) );
  CLKINVX1TS U251 ( .A(D0_i[0]), .Y(n127) );
  CLKINVX1TS U253 ( .A(D1_i[0]), .Y(n126) );
  CLKINVX20TS U252 ( .A(n152), .Y(n2) );
  CLKINVX20TS U254 ( .A(n151), .Y(n128) );
  CLKINVX20TS U255 ( .A(n150), .Y(n129) );
  CLKINVX20TS U256 ( .A(n149), .Y(n130) );
  CLKINVX20TS U257 ( .A(n148), .Y(n131) );
  CLKINVX20TS U258 ( .A(n147), .Y(n132) );
  CLKINVX20TS U259 ( .A(n146), .Y(n133) );
  CLKINVX20TS U260 ( .A(n145), .Y(n134) );
  CLKINVX20TS U261 ( .A(n144), .Y(n135) );
  CLKINVX20TS U262 ( .A(n143), .Y(n136) );
  CLKINVX20TS U263 ( .A(n142), .Y(n137) );
  CLKINVX20TS U264 ( .A(n141), .Y(n138) );
  CLKINVX20TS U265 ( .A(n140), .Y(n139) );
  CLKBUFX12TS U266 ( .A(n158), .Y(n140) );
  CLKBUFX12TS U267 ( .A(n158), .Y(n141) );
  CLKBUFX12TS U268 ( .A(n157), .Y(n142) );
  CLKBUFX12TS U269 ( .A(n157), .Y(n143) );
  CLKBUFX12TS U270 ( .A(n157), .Y(n144) );
  CLKBUFX12TS U271 ( .A(n156), .Y(n145) );
  CLKBUFX12TS U272 ( .A(n156), .Y(n146) );
  CLKBUFX12TS U273 ( .A(n156), .Y(n147) );
  CLKBUFX12TS U274 ( .A(n155), .Y(n148) );
  CLKBUFX12TS U275 ( .A(n155), .Y(n149) );
  CLKBUFX12TS U276 ( .A(n155), .Y(n150) );
  CLKBUFX12TS U277 ( .A(n154), .Y(n151) );
  CLKBUFX12TS U278 ( .A(n154), .Y(n152) );
  CLKBUFX12TS U279 ( .A(n154), .Y(n153) );
  CLKBUFX16TS U280 ( .A(n160), .Y(n154) );
  CLKBUFX16TS U281 ( .A(n160), .Y(n155) );
  CLKBUFX16TS U282 ( .A(n159), .Y(n156) );
  CLKBUFX16TS U283 ( .A(n159), .Y(n157) );
  CLKBUFX16TS U284 ( .A(n159), .Y(n158) );
  INVX12TS U285 ( .A(select), .Y(n159) );
  INVX12TS U286 ( .A(select), .Y(n160) );
endmodule


module RegisterAdd_W63_0 ( clk, rst, load, D, Q );
  input [62:0] D;
  output [62:0] Q;
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
         n123, n124, n125, n126, n127, n128, n129, n130, n131, n132, n133,
         n134, n135, n136, n137, n138, n139, n140, n141, n142, n143, n144,
         n145, n146, n147;

  DFFRX4TS Q_reg_28_ ( .D(n92), .CK(clk), .RN(n126), .Q(Q[28]), .QN(n29) );
  DFFRX4TS Q_reg_27_ ( .D(n91), .CK(clk), .RN(n126), .Q(Q[27]), .QN(n28) );
  DFFRX4TS Q_reg_26_ ( .D(n90), .CK(clk), .RN(n126), .Q(Q[26]), .QN(n27) );
  DFFRX4TS Q_reg_25_ ( .D(n89), .CK(clk), .RN(n126), .Q(Q[25]), .QN(n26) );
  DFFRX4TS Q_reg_24_ ( .D(n88), .CK(clk), .RN(n126), .Q(Q[24]), .QN(n25) );
  DFFRX4TS Q_reg_23_ ( .D(n87), .CK(clk), .RN(n126), .Q(Q[23]), .QN(n24) );
  DFFRX4TS Q_reg_22_ ( .D(n86), .CK(clk), .RN(n126), .Q(Q[22]), .QN(n23) );
  DFFRX4TS Q_reg_21_ ( .D(n85), .CK(clk), .RN(n126), .Q(Q[21]), .QN(n22) );
  DFFRX4TS Q_reg_20_ ( .D(n84), .CK(clk), .RN(n126), .Q(Q[20]), .QN(n21) );
  DFFRX4TS Q_reg_19_ ( .D(n83), .CK(clk), .RN(n126), .Q(Q[19]), .QN(n20) );
  DFFRX4TS Q_reg_18_ ( .D(n82), .CK(clk), .RN(n126), .Q(Q[18]), .QN(n19) );
  DFFRX4TS Q_reg_17_ ( .D(n81), .CK(clk), .RN(n126), .Q(Q[17]), .QN(n18) );
  DFFRX4TS Q_reg_16_ ( .D(n80), .CK(clk), .RN(n126), .Q(Q[16]), .QN(n17) );
  DFFRX4TS Q_reg_15_ ( .D(n79), .CK(clk), .RN(n126), .Q(Q[15]), .QN(n16) );
  DFFRX4TS Q_reg_14_ ( .D(n78), .CK(clk), .RN(n126), .Q(Q[14]), .QN(n15) );
  DFFRX4TS Q_reg_13_ ( .D(n77), .CK(clk), .RN(n126), .Q(Q[13]), .QN(n14) );
  DFFRX4TS Q_reg_12_ ( .D(n76), .CK(clk), .RN(n126), .Q(Q[12]), .QN(n13) );
  DFFRX4TS Q_reg_11_ ( .D(n75), .CK(clk), .RN(n126), .Q(Q[11]), .QN(n12) );
  DFFRX4TS Q_reg_10_ ( .D(n74), .CK(clk), .RN(n126), .Q(Q[10]), .QN(n11) );
  DFFRX4TS Q_reg_9_ ( .D(n73), .CK(clk), .RN(n126), .Q(Q[9]), .QN(n10) );
  DFFRX4TS Q_reg_8_ ( .D(n72), .CK(clk), .RN(n126), .Q(Q[8]), .QN(n9) );
  DFFRX4TS Q_reg_7_ ( .D(n71), .CK(clk), .RN(n126), .Q(Q[7]), .QN(n8) );
  DFFRX4TS Q_reg_6_ ( .D(n70), .CK(clk), .RN(n126), .Q(Q[6]), .QN(n7) );
  DFFRX4TS Q_reg_5_ ( .D(n69), .CK(clk), .RN(n126), .Q(Q[5]), .QN(n6) );
  DFFRX4TS Q_reg_4_ ( .D(n68), .CK(clk), .RN(n126), .Q(Q[4]), .QN(n5) );
  DFFRX4TS Q_reg_3_ ( .D(n67), .CK(clk), .RN(n126), .Q(Q[3]), .QN(n4) );
  DFFRX4TS Q_reg_2_ ( .D(n66), .CK(clk), .RN(n126), .Q(Q[2]), .QN(n3) );
  DFFRX4TS Q_reg_1_ ( .D(n65), .CK(clk), .RN(n126), .Q(Q[1]), .QN(n2) );
  DFFRX4TS Q_reg_0_ ( .D(n64), .CK(clk), .RN(n126), .Q(Q[0]), .QN(n1) );
  OAI2BB2XLTS U2 ( .B0(n1), .B1(n128), .A0N(n140), .A1N(D[0]), .Y(n64) );
  OAI2BB2XLTS U3 ( .B0(n2), .B1(n128), .A0N(D[1]), .A1N(n140), .Y(n65) );
  OAI2BB2XLTS U4 ( .B0(n3), .B1(n128), .A0N(D[2]), .A1N(n140), .Y(n66) );
  OAI2BB2XLTS U5 ( .B0(n4), .B1(n128), .A0N(D[3]), .A1N(n140), .Y(n67) );
  OAI2BB2XLTS U6 ( .B0(n5), .B1(n128), .A0N(D[4]), .A1N(n140), .Y(n68) );
  OAI2BB2XLTS U7 ( .B0(n6), .B1(n128), .A0N(D[5]), .A1N(n140), .Y(n69) );
  OAI2BB2XLTS U8 ( .B0(n7), .B1(n129), .A0N(D[6]), .A1N(n139), .Y(n70) );
  OAI2BB2XLTS U9 ( .B0(n8), .B1(n129), .A0N(D[7]), .A1N(n139), .Y(n71) );
  OAI2BB2XLTS U10 ( .B0(n9), .B1(n129), .A0N(D[8]), .A1N(n139), .Y(n72) );
  OAI2BB2XLTS U11 ( .B0(n10), .B1(n129), .A0N(D[9]), .A1N(n139), .Y(n73) );
  OAI2BB2XLTS U12 ( .B0(n11), .B1(n129), .A0N(D[10]), .A1N(n139), .Y(n74) );
  OAI2BB2XLTS U13 ( .B0(n12), .B1(n129), .A0N(D[11]), .A1N(n139), .Y(n75) );
  OAI2BB2XLTS U14 ( .B0(n13), .B1(n130), .A0N(D[12]), .A1N(n139), .Y(n76) );
  OAI2BB2XLTS U15 ( .B0(n14), .B1(n129), .A0N(D[13]), .A1N(n139), .Y(n77) );
  OAI2BB2XLTS U16 ( .B0(n15), .B1(n130), .A0N(D[14]), .A1N(n139), .Y(n78) );
  OAI2BB2XLTS U17 ( .B0(n16), .B1(n130), .A0N(D[15]), .A1N(n139), .Y(n79) );
  OAI2BB2XLTS U18 ( .B0(n17), .B1(n130), .A0N(D[16]), .A1N(n138), .Y(n80) );
  OAI2BB2XLTS U19 ( .B0(n18), .B1(n130), .A0N(D[17]), .A1N(n138), .Y(n81) );
  OAI2BB2XLTS U20 ( .B0(n19), .B1(n131), .A0N(D[18]), .A1N(n138), .Y(n82) );
  OAI2BB2XLTS U21 ( .B0(n20), .B1(n131), .A0N(D[19]), .A1N(n138), .Y(n83) );
  OAI2BB2XLTS U22 ( .B0(n21), .B1(n130), .A0N(D[20]), .A1N(n138), .Y(n84) );
  OAI2BB2XLTS U23 ( .B0(n22), .B1(n131), .A0N(D[21]), .A1N(n138), .Y(n85) );
  OAI2BB2XLTS U24 ( .B0(n23), .B1(n131), .A0N(D[22]), .A1N(n138), .Y(n86) );
  OAI2BB2XLTS U25 ( .B0(n24), .B1(n131), .A0N(D[23]), .A1N(n138), .Y(n87) );
  OAI2BB2XLTS U26 ( .B0(n25), .B1(n132), .A0N(D[24]), .A1N(n138), .Y(n88) );
  OAI2BB2XLTS U27 ( .B0(n26), .B1(n132), .A0N(D[25]), .A1N(n138), .Y(n89) );
  OAI2BB2XLTS U28 ( .B0(n27), .B1(n131), .A0N(D[26]), .A1N(n137), .Y(n90) );
  OAI2BB2XLTS U29 ( .B0(n28), .B1(n130), .A0N(D[27]), .A1N(n137), .Y(n91) );
  OAI2BB2XLTS U30 ( .B0(n29), .B1(n132), .A0N(D[28]), .A1N(n137), .Y(n92) );
  OAI2BB2XLTS U31 ( .B0(n30), .B1(n131), .A0N(D[29]), .A1N(n137), .Y(n93) );
  OAI2BB2XLTS U32 ( .B0(n31), .B1(n133), .A0N(D[30]), .A1N(n137), .Y(n94) );
  OAI2BB2XLTS U33 ( .B0(n32), .B1(n133), .A0N(D[31]), .A1N(n137), .Y(n95) );
  OAI2BB2XLTS U34 ( .B0(n33), .B1(n132), .A0N(D[32]), .A1N(n137), .Y(n96) );
  OAI2BB2XLTS U35 ( .B0(n34), .B1(n133), .A0N(D[33]), .A1N(n137), .Y(n97) );
  OAI2BB2XLTS U36 ( .B0(n35), .B1(n132), .A0N(D[34]), .A1N(n137), .Y(n98) );
  OAI2BB2XLTS U37 ( .B0(n36), .B1(n132), .A0N(D[35]), .A1N(n137), .Y(n99) );
  OAI2BB2XLTS U38 ( .B0(n37), .B1(n133), .A0N(D[36]), .A1N(n136), .Y(n100) );
  OAI2BB2XLTS U39 ( .B0(n38), .B1(n133), .A0N(D[37]), .A1N(n136), .Y(n101) );
  OAI2BB2XLTS U40 ( .B0(n39), .B1(n133), .A0N(D[38]), .A1N(n136), .Y(n102) );
  OAI2BB2XLTS U41 ( .B0(n40), .B1(n134), .A0N(D[39]), .A1N(n136), .Y(n103) );
  OAI2BB2XLTS U42 ( .B0(n41), .B1(n134), .A0N(D[40]), .A1N(n136), .Y(n104) );
  OAI2BB2XLTS U43 ( .B0(n42), .B1(n132), .A0N(D[41]), .A1N(n136), .Y(n105) );
  OAI2BB2XLTS U44 ( .B0(n43), .B1(n134), .A0N(D[42]), .A1N(n136), .Y(n106) );
  OAI2BB2XLTS U45 ( .B0(n44), .B1(n133), .A0N(D[43]), .A1N(n136), .Y(n107) );
  OAI2BB2XLTS U46 ( .B0(n45), .B1(n133), .A0N(D[44]), .A1N(n135), .Y(n108) );
  OAI2BB2XLTS U47 ( .B0(n46), .B1(n133), .A0N(D[45]), .A1N(n136), .Y(n109) );
  OAI2BB2XLTS U48 ( .B0(n47), .B1(n133), .A0N(D[46]), .A1N(n135), .Y(n110) );
  OAI2BB2XLTS U49 ( .B0(n48), .B1(n132), .A0N(D[47]), .A1N(n135), .Y(n111) );
  OAI2BB2XLTS U50 ( .B0(n49), .B1(n132), .A0N(D[48]), .A1N(n135), .Y(n112) );
  OAI2BB2XLTS U51 ( .B0(n50), .B1(n132), .A0N(D[49]), .A1N(n135), .Y(n113) );
  OAI2BB2XLTS U52 ( .B0(n51), .B1(n131), .A0N(D[50]), .A1N(n135), .Y(n114) );
  OAI2BB2XLTS U53 ( .B0(n52), .B1(n131), .A0N(D[51]), .A1N(n135), .Y(n115) );
  OAI2BB2XLTS U54 ( .B0(n53), .B1(n131), .A0N(D[52]), .A1N(n134), .Y(n116) );
  OAI2BB2XLTS U55 ( .B0(n54), .B1(n130), .A0N(D[53]), .A1N(n134), .Y(n117) );
  OAI2BB2XLTS U56 ( .B0(n55), .B1(n130), .A0N(D[54]), .A1N(n135), .Y(n118) );
  OAI2BB2XLTS U57 ( .B0(n56), .B1(n130), .A0N(D[55]), .A1N(n134), .Y(n119) );
  OAI2BB2XLTS U58 ( .B0(n57), .B1(n129), .A0N(D[56]), .A1N(n134), .Y(n120) );
  OAI2BB2XLTS U59 ( .B0(n58), .B1(n129), .A0N(D[57]), .A1N(n135), .Y(n121) );
  OAI2BB2XLTS U60 ( .B0(n59), .B1(n129), .A0N(D[58]), .A1N(n134), .Y(n122) );
  OAI2BB2XLTS U61 ( .B0(n60), .B1(n128), .A0N(D[59]), .A1N(n134), .Y(n123) );
  OAI2BB2XLTS U62 ( .B0(n61), .B1(n128), .A0N(D[60]), .A1N(n135), .Y(n124) );
  OAI2BB2XLTS U63 ( .B0(n62), .B1(n128), .A0N(D[61]), .A1N(n134), .Y(n125) );
  OAI2BB2XLTS U64 ( .B0(n63), .B1(n128), .A0N(D[62]), .A1N(n136), .Y(n127) );
  INVX2TS U65 ( .A(rst), .Y(n126) );
  DFFRXLTS Q_reg_59_ ( .D(n123), .CK(clk), .RN(n126), .Q(Q[59]), .QN(n60) );
  DFFRXLTS Q_reg_58_ ( .D(n122), .CK(clk), .RN(n126), .Q(Q[58]), .QN(n59) );
  DFFRXLTS Q_reg_57_ ( .D(n121), .CK(clk), .RN(n126), .Q(Q[57]), .QN(n58) );
  DFFRXLTS Q_reg_56_ ( .D(n120), .CK(clk), .RN(n126), .Q(Q[56]), .QN(n57) );
  DFFRXLTS Q_reg_55_ ( .D(n119), .CK(clk), .RN(n126), .Q(Q[55]), .QN(n56) );
  DFFRXLTS Q_reg_54_ ( .D(n118), .CK(clk), .RN(n126), .Q(Q[54]), .QN(n55) );
  DFFRXLTS Q_reg_53_ ( .D(n117), .CK(clk), .RN(n126), .Q(Q[53]), .QN(n54) );
  DFFRXLTS Q_reg_52_ ( .D(n116), .CK(clk), .RN(n126), .Q(Q[52]), .QN(n53) );
  DFFRXLTS Q_reg_51_ ( .D(n115), .CK(clk), .RN(n126), .Q(Q[51]), .QN(n52) );
  DFFRXLTS Q_reg_50_ ( .D(n114), .CK(clk), .RN(n126), .Q(Q[50]), .QN(n51) );
  DFFRXLTS Q_reg_49_ ( .D(n113), .CK(clk), .RN(n126), .Q(Q[49]), .QN(n50) );
  DFFRXLTS Q_reg_48_ ( .D(n112), .CK(clk), .RN(n126), .Q(Q[48]), .QN(n49) );
  DFFRXLTS Q_reg_47_ ( .D(n111), .CK(clk), .RN(n126), .Q(Q[47]), .QN(n48) );
  DFFRXLTS Q_reg_46_ ( .D(n110), .CK(clk), .RN(n126), .Q(Q[46]), .QN(n47) );
  DFFRXLTS Q_reg_45_ ( .D(n109), .CK(clk), .RN(n126), .Q(Q[45]), .QN(n46) );
  DFFRXLTS Q_reg_44_ ( .D(n108), .CK(clk), .RN(n126), .Q(Q[44]), .QN(n45) );
  DFFRXLTS Q_reg_43_ ( .D(n107), .CK(clk), .RN(n126), .Q(Q[43]), .QN(n44) );
  DFFRXLTS Q_reg_42_ ( .D(n106), .CK(clk), .RN(n126), .Q(Q[42]), .QN(n43) );
  DFFRXLTS Q_reg_41_ ( .D(n105), .CK(clk), .RN(n126), .Q(Q[41]), .QN(n42) );
  DFFRXLTS Q_reg_40_ ( .D(n104), .CK(clk), .RN(n126), .Q(Q[40]), .QN(n41) );
  DFFRXLTS Q_reg_39_ ( .D(n103), .CK(clk), .RN(n126), .Q(Q[39]), .QN(n40) );
  DFFRXLTS Q_reg_38_ ( .D(n102), .CK(clk), .RN(n126), .Q(Q[38]), .QN(n39) );
  DFFRXLTS Q_reg_37_ ( .D(n101), .CK(clk), .RN(n126), .Q(Q[37]), .QN(n38) );
  DFFRXLTS Q_reg_36_ ( .D(n100), .CK(clk), .RN(n126), .Q(Q[36]), .QN(n37) );
  DFFRXLTS Q_reg_35_ ( .D(n99), .CK(clk), .RN(n126), .Q(Q[35]), .QN(n36) );
  DFFRXLTS Q_reg_34_ ( .D(n98), .CK(clk), .RN(n126), .Q(Q[34]), .QN(n35) );
  DFFRXLTS Q_reg_33_ ( .D(n97), .CK(clk), .RN(n126), .Q(Q[33]), .QN(n34) );
  DFFRXLTS Q_reg_32_ ( .D(n96), .CK(clk), .RN(n126), .Q(Q[32]), .QN(n33) );
  DFFRXLTS Q_reg_31_ ( .D(n95), .CK(clk), .RN(n126), .Q(Q[31]), .QN(n32) );
  DFFRXLTS Q_reg_30_ ( .D(n94), .CK(clk), .RN(n126), .Q(Q[30]), .QN(n31) );
  DFFRXLTS Q_reg_62_ ( .D(n127), .CK(clk), .RN(n126), .Q(Q[62]), .QN(n63) );
  DFFRXLTS Q_reg_61_ ( .D(n125), .CK(clk), .RN(n126), .Q(Q[61]), .QN(n62) );
  DFFRXLTS Q_reg_60_ ( .D(n124), .CK(clk), .RN(n126), .Q(Q[60]), .QN(n61) );
  DFFRX1TS Q_reg_29_ ( .D(n93), .CK(clk), .RN(n126), .Q(Q[29]), .QN(n30) );
  BUFX20TS U66 ( .A(n147), .Y(n128) );
  BUFX20TS U67 ( .A(n146), .Y(n129) );
  BUFX20TS U68 ( .A(n146), .Y(n130) );
  BUFX20TS U69 ( .A(n145), .Y(n131) );
  BUFX20TS U70 ( .A(n145), .Y(n132) );
  BUFX20TS U71 ( .A(n144), .Y(n133) );
  BUFX20TS U72 ( .A(n144), .Y(n134) );
  BUFX20TS U73 ( .A(n143), .Y(n135) );
  BUFX20TS U74 ( .A(n143), .Y(n136) );
  BUFX20TS U75 ( .A(n142), .Y(n137) );
  BUFX20TS U76 ( .A(n142), .Y(n138) );
  BUFX20TS U77 ( .A(n141), .Y(n139) );
  BUFX20TS U78 ( .A(n141), .Y(n140) );
  CLKBUFX20TS U79 ( .A(load), .Y(n141) );
  CLKBUFX20TS U80 ( .A(load), .Y(n142) );
  CLKBUFX20TS U81 ( .A(load), .Y(n143) );
  CLKBUFX20TS U82 ( .A(load), .Y(n144) );
  CLKBUFX20TS U83 ( .A(load), .Y(n145) );
  CLKBUFX20TS U84 ( .A(load), .Y(n146) );
  CLKBUFX20TS U85 ( .A(load), .Y(n147) );
endmodule


module RegisterAdd_W63_1 ( clk, rst, load, D, Q );
  input [62:0] D;
  output [62:0] Q;
  input clk, rst, load;
  wire   n128, n129, n130, n131, n132, n133, n134, n135, n136, n137, n138,
         n139, n140, n141, n142, n143, n144, n145, n146, n147, n148, n149,
         n150, n151, n152, n153, n154, n155, n156, n157, n158, n159, n160,
         n161, n162, n163, n164, n165, n166, n167, n168, n169, n170, n171,
         n172, n173, n174, n175, n176, n177, n178, n179, n180, n181, n182,
         n183, n184, n185, n186, n187, n188, n189, n190, n191, n192, n193,
         n194, n195, n196, n197, n198, n199, n200, n201, n202, n203, n204,
         n205, n206, n207, n208, n209, n210, n211, n212, n213, n214, n215,
         n216, n217, n218, n219, n220, n221, n222, n223, n224, n225, n226,
         n227, n228, n229, n230, n231, n232, n233, n234, n235, n236, n237,
         n238, n239, n240, n241, n242, n243, n244, n245, n246, n247, n248,
         n249, n250, n251, n252, n253, n254, n255, n256, n257, n258, n259,
         n260, n261, n262, n263, n264, n265, n266, n267, n268, n269, n270,
         n271, n272, n273, n274;

  OAI2BB2XLTS U2 ( .B0(n274), .B1(n128), .A0N(n140), .A1N(D[0]), .Y(n211) );
  OAI2BB2XLTS U3 ( .B0(n273), .B1(n128), .A0N(D[1]), .A1N(n140), .Y(n210) );
  OAI2BB2XLTS U4 ( .B0(n272), .B1(n128), .A0N(D[2]), .A1N(n140), .Y(n209) );
  OAI2BB2XLTS U5 ( .B0(n271), .B1(n128), .A0N(D[3]), .A1N(n140), .Y(n208) );
  OAI2BB2XLTS U6 ( .B0(n270), .B1(n128), .A0N(D[4]), .A1N(n140), .Y(n207) );
  OAI2BB2XLTS U7 ( .B0(n269), .B1(n128), .A0N(D[5]), .A1N(n140), .Y(n206) );
  OAI2BB2XLTS U8 ( .B0(n268), .B1(n129), .A0N(D[6]), .A1N(n139), .Y(n205) );
  OAI2BB2XLTS U9 ( .B0(n267), .B1(n129), .A0N(D[7]), .A1N(n139), .Y(n204) );
  OAI2BB2XLTS U10 ( .B0(n266), .B1(n129), .A0N(D[8]), .A1N(n139), .Y(n203) );
  OAI2BB2XLTS U11 ( .B0(n265), .B1(n129), .A0N(D[9]), .A1N(n139), .Y(n202) );
  OAI2BB2XLTS U12 ( .B0(n264), .B1(n129), .A0N(D[10]), .A1N(n139), .Y(n201) );
  OAI2BB2XLTS U13 ( .B0(n263), .B1(n129), .A0N(D[11]), .A1N(n139), .Y(n200) );
  OAI2BB2XLTS U14 ( .B0(n262), .B1(n130), .A0N(D[12]), .A1N(n139), .Y(n199) );
  OAI2BB2XLTS U15 ( .B0(n261), .B1(n129), .A0N(D[13]), .A1N(n139), .Y(n198) );
  OAI2BB2XLTS U16 ( .B0(n260), .B1(n130), .A0N(D[14]), .A1N(n139), .Y(n197) );
  OAI2BB2XLTS U17 ( .B0(n259), .B1(n130), .A0N(D[15]), .A1N(n139), .Y(n196) );
  OAI2BB2XLTS U18 ( .B0(n258), .B1(n130), .A0N(D[16]), .A1N(n138), .Y(n195) );
  OAI2BB2XLTS U19 ( .B0(n257), .B1(n130), .A0N(D[17]), .A1N(n138), .Y(n194) );
  OAI2BB2XLTS U20 ( .B0(n256), .B1(n131), .A0N(D[18]), .A1N(n138), .Y(n193) );
  OAI2BB2XLTS U21 ( .B0(n255), .B1(n131), .A0N(D[19]), .A1N(n138), .Y(n192) );
  OAI2BB2XLTS U22 ( .B0(n254), .B1(n130), .A0N(D[20]), .A1N(n138), .Y(n191) );
  OAI2BB2XLTS U23 ( .B0(n253), .B1(n131), .A0N(D[21]), .A1N(n138), .Y(n190) );
  OAI2BB2XLTS U24 ( .B0(n252), .B1(n131), .A0N(D[22]), .A1N(n138), .Y(n189) );
  OAI2BB2XLTS U25 ( .B0(n251), .B1(n131), .A0N(D[23]), .A1N(n138), .Y(n188) );
  OAI2BB2XLTS U26 ( .B0(n250), .B1(n132), .A0N(D[24]), .A1N(n138), .Y(n187) );
  OAI2BB2XLTS U27 ( .B0(n249), .B1(n132), .A0N(D[25]), .A1N(n138), .Y(n186) );
  OAI2BB2XLTS U28 ( .B0(n248), .B1(n131), .A0N(D[26]), .A1N(n137), .Y(n185) );
  OAI2BB2XLTS U29 ( .B0(n247), .B1(n130), .A0N(D[27]), .A1N(n137), .Y(n184) );
  OAI2BB2XLTS U30 ( .B0(n246), .B1(n132), .A0N(D[28]), .A1N(n137), .Y(n183) );
  OAI2BB2XLTS U31 ( .B0(n245), .B1(n131), .A0N(D[29]), .A1N(n137), .Y(n182) );
  OAI2BB2XLTS U32 ( .B0(n244), .B1(n133), .A0N(D[30]), .A1N(n137), .Y(n181) );
  OAI2BB2XLTS U33 ( .B0(n243), .B1(n133), .A0N(D[31]), .A1N(n137), .Y(n180) );
  OAI2BB2XLTS U34 ( .B0(n242), .B1(n132), .A0N(D[32]), .A1N(n137), .Y(n179) );
  OAI2BB2XLTS U35 ( .B0(n241), .B1(n133), .A0N(D[33]), .A1N(n137), .Y(n178) );
  OAI2BB2XLTS U36 ( .B0(n240), .B1(n132), .A0N(D[34]), .A1N(n137), .Y(n177) );
  OAI2BB2XLTS U37 ( .B0(n239), .B1(n132), .A0N(D[35]), .A1N(n137), .Y(n176) );
  OAI2BB2XLTS U38 ( .B0(n238), .B1(n133), .A0N(D[36]), .A1N(n136), .Y(n175) );
  OAI2BB2XLTS U39 ( .B0(n237), .B1(n133), .A0N(D[37]), .A1N(n136), .Y(n174) );
  OAI2BB2XLTS U40 ( .B0(n236), .B1(n133), .A0N(D[38]), .A1N(n136), .Y(n173) );
  OAI2BB2XLTS U41 ( .B0(n235), .B1(n134), .A0N(D[39]), .A1N(n136), .Y(n172) );
  OAI2BB2XLTS U42 ( .B0(n234), .B1(n134), .A0N(D[40]), .A1N(n136), .Y(n171) );
  OAI2BB2XLTS U43 ( .B0(n233), .B1(n132), .A0N(D[41]), .A1N(n136), .Y(n170) );
  OAI2BB2XLTS U44 ( .B0(n232), .B1(n134), .A0N(D[42]), .A1N(n136), .Y(n169) );
  OAI2BB2XLTS U45 ( .B0(n231), .B1(n133), .A0N(D[43]), .A1N(n136), .Y(n168) );
  OAI2BB2XLTS U46 ( .B0(n230), .B1(n133), .A0N(D[44]), .A1N(n135), .Y(n167) );
  OAI2BB2XLTS U47 ( .B0(n229), .B1(n133), .A0N(D[45]), .A1N(n136), .Y(n166) );
  OAI2BB2XLTS U48 ( .B0(n228), .B1(n133), .A0N(D[46]), .A1N(n135), .Y(n165) );
  OAI2BB2XLTS U49 ( .B0(n227), .B1(n132), .A0N(D[47]), .A1N(n135), .Y(n164) );
  OAI2BB2XLTS U50 ( .B0(n226), .B1(n132), .A0N(D[48]), .A1N(n135), .Y(n163) );
  OAI2BB2XLTS U51 ( .B0(n225), .B1(n132), .A0N(D[49]), .A1N(n135), .Y(n162) );
  OAI2BB2XLTS U52 ( .B0(n224), .B1(n131), .A0N(D[50]), .A1N(n135), .Y(n161) );
  OAI2BB2XLTS U53 ( .B0(n223), .B1(n131), .A0N(D[51]), .A1N(n135), .Y(n160) );
  OAI2BB2XLTS U54 ( .B0(n222), .B1(n131), .A0N(D[52]), .A1N(n134), .Y(n159) );
  OAI2BB2XLTS U55 ( .B0(n221), .B1(n130), .A0N(D[53]), .A1N(n134), .Y(n158) );
  OAI2BB2XLTS U56 ( .B0(n220), .B1(n130), .A0N(D[54]), .A1N(n135), .Y(n157) );
  OAI2BB2XLTS U57 ( .B0(n219), .B1(n130), .A0N(D[55]), .A1N(n134), .Y(n156) );
  OAI2BB2XLTS U58 ( .B0(n218), .B1(n129), .A0N(D[56]), .A1N(n134), .Y(n155) );
  OAI2BB2XLTS U59 ( .B0(n217), .B1(n129), .A0N(D[57]), .A1N(n135), .Y(n154) );
  OAI2BB2XLTS U60 ( .B0(n216), .B1(n129), .A0N(D[58]), .A1N(n134), .Y(n153) );
  OAI2BB2XLTS U61 ( .B0(n215), .B1(n128), .A0N(D[59]), .A1N(n134), .Y(n152) );
  OAI2BB2XLTS U62 ( .B0(n214), .B1(n128), .A0N(D[60]), .A1N(n135), .Y(n151) );
  OAI2BB2XLTS U63 ( .B0(n213), .B1(n128), .A0N(D[61]), .A1N(n134), .Y(n150) );
  OAI2BB2XLTS U64 ( .B0(n212), .B1(n128), .A0N(D[62]), .A1N(n136), .Y(n148) );
  INVX2TS U65 ( .A(rst), .Y(n149) );
  DFFRX2TS Q_reg_62_ ( .D(n148), .CK(clk), .RN(n149), .Q(Q[62]), .QN(n212) );
  DFFRX2TS Q_reg_61_ ( .D(n150), .CK(clk), .RN(n149), .Q(Q[61]), .QN(n213) );
  DFFRX2TS Q_reg_60_ ( .D(n151), .CK(clk), .RN(n149), .Q(Q[60]), .QN(n214) );
  DFFRX2TS Q_reg_59_ ( .D(n152), .CK(clk), .RN(n149), .Q(Q[59]), .QN(n215) );
  DFFRX2TS Q_reg_58_ ( .D(n153), .CK(clk), .RN(n149), .Q(Q[58]), .QN(n216) );
  DFFRX2TS Q_reg_57_ ( .D(n154), .CK(clk), .RN(n149), .Q(Q[57]), .QN(n217) );
  DFFRX2TS Q_reg_56_ ( .D(n155), .CK(clk), .RN(n149), .Q(Q[56]), .QN(n218) );
  DFFRX2TS Q_reg_55_ ( .D(n156), .CK(clk), .RN(n149), .Q(Q[55]), .QN(n219) );
  DFFRX2TS Q_reg_54_ ( .D(n157), .CK(clk), .RN(n149), .Q(Q[54]), .QN(n220) );
  DFFRX2TS Q_reg_53_ ( .D(n158), .CK(clk), .RN(n149), .Q(Q[53]), .QN(n221) );
  DFFRX2TS Q_reg_52_ ( .D(n159), .CK(clk), .RN(n149), .Q(Q[52]), .QN(n222) );
  DFFRX2TS Q_reg_51_ ( .D(n160), .CK(clk), .RN(n149), .Q(Q[51]), .QN(n223) );
  DFFRX2TS Q_reg_50_ ( .D(n161), .CK(clk), .RN(n149), .Q(Q[50]), .QN(n224) );
  DFFRX2TS Q_reg_49_ ( .D(n162), .CK(clk), .RN(n149), .Q(Q[49]), .QN(n225) );
  DFFRX2TS Q_reg_48_ ( .D(n163), .CK(clk), .RN(n149), .Q(Q[48]), .QN(n226) );
  DFFRX2TS Q_reg_47_ ( .D(n164), .CK(clk), .RN(n149), .Q(Q[47]), .QN(n227) );
  DFFRX2TS Q_reg_46_ ( .D(n165), .CK(clk), .RN(n149), .Q(Q[46]), .QN(n228) );
  DFFRX2TS Q_reg_45_ ( .D(n166), .CK(clk), .RN(n149), .Q(Q[45]), .QN(n229) );
  DFFRX2TS Q_reg_44_ ( .D(n167), .CK(clk), .RN(n149), .Q(Q[44]), .QN(n230) );
  DFFRX2TS Q_reg_43_ ( .D(n168), .CK(clk), .RN(n149), .Q(Q[43]), .QN(n231) );
  DFFRX2TS Q_reg_42_ ( .D(n169), .CK(clk), .RN(n149), .Q(Q[42]), .QN(n232) );
  DFFRX2TS Q_reg_41_ ( .D(n170), .CK(clk), .RN(n149), .Q(Q[41]), .QN(n233) );
  DFFRX2TS Q_reg_40_ ( .D(n171), .CK(clk), .RN(n149), .Q(Q[40]), .QN(n234) );
  DFFRX2TS Q_reg_39_ ( .D(n172), .CK(clk), .RN(n149), .Q(Q[39]), .QN(n235) );
  DFFRX2TS Q_reg_38_ ( .D(n173), .CK(clk), .RN(n149), .Q(Q[38]), .QN(n236) );
  DFFRX2TS Q_reg_37_ ( .D(n174), .CK(clk), .RN(n149), .Q(Q[37]), .QN(n237) );
  DFFRX2TS Q_reg_36_ ( .D(n175), .CK(clk), .RN(n149), .Q(Q[36]), .QN(n238) );
  DFFRX2TS Q_reg_35_ ( .D(n176), .CK(clk), .RN(n149), .Q(Q[35]), .QN(n239) );
  DFFRX2TS Q_reg_34_ ( .D(n177), .CK(clk), .RN(n149), .Q(Q[34]), .QN(n240) );
  DFFRX2TS Q_reg_33_ ( .D(n178), .CK(clk), .RN(n149), .Q(Q[33]), .QN(n241) );
  DFFRX2TS Q_reg_32_ ( .D(n179), .CK(clk), .RN(n149), .Q(Q[32]), .QN(n242) );
  DFFRX2TS Q_reg_31_ ( .D(n180), .CK(clk), .RN(n149), .Q(Q[31]), .QN(n243) );
  DFFRX2TS Q_reg_30_ ( .D(n181), .CK(clk), .RN(n149), .Q(Q[30]), .QN(n244) );
  DFFRX2TS Q_reg_29_ ( .D(n182), .CK(clk), .RN(n149), .Q(Q[29]), .QN(n245) );
  DFFRX2TS Q_reg_28_ ( .D(n183), .CK(clk), .RN(n149), .Q(Q[28]), .QN(n246) );
  DFFRX2TS Q_reg_27_ ( .D(n184), .CK(clk), .RN(n149), .Q(Q[27]), .QN(n247) );
  DFFRX2TS Q_reg_26_ ( .D(n185), .CK(clk), .RN(n149), .Q(Q[26]), .QN(n248) );
  DFFRX2TS Q_reg_25_ ( .D(n186), .CK(clk), .RN(n149), .Q(Q[25]), .QN(n249) );
  DFFRX2TS Q_reg_24_ ( .D(n187), .CK(clk), .RN(n149), .Q(Q[24]), .QN(n250) );
  DFFRX2TS Q_reg_23_ ( .D(n188), .CK(clk), .RN(n149), .Q(Q[23]), .QN(n251) );
  DFFRX2TS Q_reg_22_ ( .D(n189), .CK(clk), .RN(n149), .Q(Q[22]), .QN(n252) );
  DFFRX2TS Q_reg_21_ ( .D(n190), .CK(clk), .RN(n149), .Q(Q[21]), .QN(n253) );
  DFFRX2TS Q_reg_9_ ( .D(n202), .CK(clk), .RN(n149), .Q(Q[9]), .QN(n265) );
  DFFRX2TS Q_reg_8_ ( .D(n203), .CK(clk), .RN(n149), .Q(Q[8]), .QN(n266) );
  DFFRX2TS Q_reg_7_ ( .D(n204), .CK(clk), .RN(n149), .Q(Q[7]), .QN(n267) );
  DFFRX2TS Q_reg_6_ ( .D(n205), .CK(clk), .RN(n149), .Q(Q[6]), .QN(n268) );
  DFFRX2TS Q_reg_5_ ( .D(n206), .CK(clk), .RN(n149), .Q(Q[5]), .QN(n269) );
  DFFRX2TS Q_reg_4_ ( .D(n207), .CK(clk), .RN(n149), .Q(Q[4]), .QN(n270) );
  DFFRX2TS Q_reg_3_ ( .D(n208), .CK(clk), .RN(n149), .Q(Q[3]), .QN(n271) );
  DFFRX2TS Q_reg_2_ ( .D(n209), .CK(clk), .RN(n149), .Q(Q[2]), .QN(n272) );
  DFFRX2TS Q_reg_0_ ( .D(n211), .CK(clk), .RN(n149), .Q(Q[0]), .QN(n274) );
  DFFRX2TS Q_reg_20_ ( .D(n191), .CK(clk), .RN(n149), .Q(Q[20]), .QN(n254) );
  DFFRX2TS Q_reg_19_ ( .D(n192), .CK(clk), .RN(n149), .Q(Q[19]), .QN(n255) );
  DFFRX2TS Q_reg_18_ ( .D(n193), .CK(clk), .RN(n149), .Q(Q[18]), .QN(n256) );
  DFFRX2TS Q_reg_17_ ( .D(n194), .CK(clk), .RN(n149), .Q(Q[17]), .QN(n257) );
  DFFRX2TS Q_reg_16_ ( .D(n195), .CK(clk), .RN(n149), .Q(Q[16]), .QN(n258) );
  DFFRX2TS Q_reg_15_ ( .D(n196), .CK(clk), .RN(n149), .Q(Q[15]), .QN(n259) );
  DFFRX2TS Q_reg_14_ ( .D(n197), .CK(clk), .RN(n149), .Q(Q[14]), .QN(n260) );
  DFFRX2TS Q_reg_13_ ( .D(n198), .CK(clk), .RN(n149), .Q(Q[13]), .QN(n261) );
  DFFRX2TS Q_reg_12_ ( .D(n199), .CK(clk), .RN(n149), .Q(Q[12]), .QN(n262) );
  DFFRX2TS Q_reg_1_ ( .D(n210), .CK(clk), .RN(n149), .Q(Q[1]), .QN(n273) );
  DFFRX2TS Q_reg_11_ ( .D(n200), .CK(clk), .RN(n149), .Q(Q[11]), .QN(n263) );
  DFFRX2TS Q_reg_10_ ( .D(n201), .CK(clk), .RN(n149), .Q(Q[10]), .QN(n264) );
  BUFX20TS U66 ( .A(n147), .Y(n128) );
  BUFX20TS U67 ( .A(n146), .Y(n129) );
  BUFX20TS U68 ( .A(n146), .Y(n130) );
  BUFX20TS U69 ( .A(n145), .Y(n131) );
  BUFX20TS U70 ( .A(n145), .Y(n132) );
  BUFX20TS U71 ( .A(n144), .Y(n133) );
  BUFX20TS U72 ( .A(n144), .Y(n134) );
  BUFX20TS U73 ( .A(n143), .Y(n135) );
  BUFX20TS U74 ( .A(n143), .Y(n136) );
  BUFX20TS U75 ( .A(n142), .Y(n137) );
  BUFX20TS U76 ( .A(n142), .Y(n138) );
  BUFX20TS U77 ( .A(n141), .Y(n139) );
  BUFX20TS U78 ( .A(n141), .Y(n140) );
  CLKBUFX20TS U79 ( .A(load), .Y(n141) );
  CLKBUFX20TS U80 ( .A(load), .Y(n142) );
  CLKBUFX20TS U81 ( .A(load), .Y(n143) );
  CLKBUFX20TS U82 ( .A(load), .Y(n144) );
  CLKBUFX20TS U83 ( .A(load), .Y(n145) );
  CLKBUFX20TS U84 ( .A(load), .Y(n146) );
  CLKBUFX20TS U85 ( .A(load), .Y(n147) );
endmodule


module RegisterAdd_W1_10 ( clk, rst, load, D, Q );
  input [0:0] D;
  output [0:0] Q;
  input clk, rst, load;
  wire   n4, n5, n6;

  OAI2BB2XLTS U2 ( .B0(n6), .B1(load), .A0N(load), .A1N(D[0]), .Y(n4) );
  INVX2TS U3 ( .A(rst), .Y(n5) );
  DFFRX2TS Q_reg_0_ ( .D(n4), .CK(clk), .RN(n5), .Q(Q[0]), .QN(n6) );
endmodule


module Oper_Start_In_W64 ( clk, rst, load_a_i, load_b_i, add_subt_i, Data_X_i, 
        Data_Y_i, DMP_o, DmP_o, zero_flag_o, real_op_o, sign_final_result_o );
  input [63:0] Data_X_i;
  input [63:0] Data_Y_i;
  output [62:0] DMP_o;
  output [62:0] DmP_o;
  input clk, rst, load_a_i, load_b_i, add_subt_i;
  output zero_flag_o, real_op_o, sign_final_result_o;
  wire   intAS, gtXY, eqXY, sign_result, n1, n2, n3, n4;
  wire   [63:0] intDX;
  wire   [63:0] intDY;
  wire   [62:0] intM;
  wire   [62:0] intm;

  AND2X8TS C7 ( .A(real_op_o), .B(eqXY), .Y(zero_flag_o) );
  RegisterAdd_W64_0 XRegister ( .clk(clk), .rst(rst), .load(n4), .D(Data_X_i), 
        .Q(intDX) );
  RegisterAdd_W64_2 YRegister ( .clk(clk), .rst(rst), .load(n3), .D(Data_Y_i), 
        .Q(intDY) );
  RegisterAdd_W1_11 ASRegister ( .clk(clk), .rst(rst), .load(n4), .D(
        add_subt_i), .Q(intAS) );
  Comparator_W63 Magnitude_Comparator ( .Data_X_i(intDX[62:0]), .Data_Y_i(
        intDY[62:0]), .gtXY_o(gtXY), .eqXY_o(eqXY) );
  xor_tri_W64 Op_verification ( .A_i(intDX[63]), .B_i(intDY[63]), .C_i(intAS), 
        .Z_o(real_op_o) );
  sgn_result result_sign_bit ( .Add_Subt_i(intAS), .sgn_X_i(intDX[63]), 
        .sgn_Y_i(intDY[63]), .gtXY_i(gtXY), .eqXY_i(eqXY), .sgn_result_o(
        sign_result) );
  MultiplexTxT_W63 MuxXY ( .select(gtXY), .D0_i(intDX[62:0]), .D1_i(
        intDY[62:0]), .S0_o(intM), .S1_o(intm) );
  RegisterAdd_W63_0 MRegister ( .clk(clk), .rst(rst), .load(n2), .D(intM), .Q(
        DMP_o) );
  RegisterAdd_W63_1 mRegister ( .clk(clk), .rst(rst), .load(n1), .D(intm), .Q(
        DmP_o) );
  RegisterAdd_W1_10 SignRegister ( .clk(clk), .rst(rst), .load(n2), .D(
        sign_result), .Q(sign_final_result_o) );
  BUFX20TS U1 ( .A(load_b_i), .Y(n1) );
  BUFX20TS U2 ( .A(load_b_i), .Y(n2) );
  BUFX20TS U3 ( .A(load_a_i), .Y(n3) );
  BUFX20TS U4 ( .A(load_a_i), .Y(n4) );
endmodule


module Multiplexer_AC_W11_0 ( ctrl, D0, D1, S );
  input [10:0] D0;
  input [10:0] D1;
  output [10:0] S;
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
  AO22X1TS U9 ( .A0(D1[1]), .A1(ctrl), .B0(D0[1]), .B1(n1), .Y(S[1]) );
  AO22X1TS U10 ( .A0(D1[10]), .A1(ctrl), .B0(D0[10]), .B1(n1), .Y(S[10]) );
  AO22X1TS U11 ( .A0(D1[0]), .A1(ctrl), .B0(D0[0]), .B1(n1), .Y(S[0]) );
  CLKINVX1TS U12 ( .A(ctrl), .Y(n1) );
endmodule


module Mux_3x1_W11 ( ctrl, D0, D1, D2, S );
  input [1:0] ctrl;
  input [10:0] D0;
  input [10:0] D1;
  input [10:0] D2;
  output [10:0] S;
  wire   N7, N8, N9, N10, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12;

  INVX12TS I_3 ( .A(N9), .Y(N10) );
  INVX12TS I_2 ( .A(N7), .Y(N8) );
  OAI2BB1X1TS U2 ( .A0N(N10), .A1N(D2[9]), .B0(n1), .Y(S[9]) );
  AOI22X1TS U3 ( .A0(N8), .A1(D1[9]), .B0(D0[9]), .B1(n2), .Y(n1) );
  OAI2BB1X1TS U4 ( .A0N(D2[8]), .A1N(N10), .B0(n3), .Y(S[8]) );
  AOI22X1TS U5 ( .A0(D0[8]), .A1(n2), .B0(D1[8]), .B1(N8), .Y(n3) );
  OAI2BB1X1TS U6 ( .A0N(D2[7]), .A1N(N10), .B0(n4), .Y(S[7]) );
  AOI22X1TS U7 ( .A0(D0[7]), .A1(n2), .B0(D1[7]), .B1(N8), .Y(n4) );
  OAI2BB1X1TS U8 ( .A0N(D2[6]), .A1N(N10), .B0(n5), .Y(S[6]) );
  AOI22X1TS U9 ( .A0(D0[6]), .A1(n2), .B0(D1[6]), .B1(N8), .Y(n5) );
  OAI2BB1X1TS U10 ( .A0N(D2[5]), .A1N(N10), .B0(n6), .Y(S[5]) );
  AOI22X1TS U11 ( .A0(D0[5]), .A1(n2), .B0(D1[5]), .B1(N8), .Y(n6) );
  OAI2BB1X1TS U12 ( .A0N(D2[4]), .A1N(N10), .B0(n7), .Y(S[4]) );
  AOI22X1TS U13 ( .A0(D0[4]), .A1(n2), .B0(D1[4]), .B1(N8), .Y(n7) );
  OAI2BB1X1TS U14 ( .A0N(D2[3]), .A1N(N10), .B0(n8), .Y(S[3]) );
  AOI22X1TS U15 ( .A0(D0[3]), .A1(n2), .B0(D1[3]), .B1(N8), .Y(n8) );
  OAI2BB1X1TS U16 ( .A0N(D2[2]), .A1N(N10), .B0(n9), .Y(S[2]) );
  AOI22X1TS U17 ( .A0(D0[2]), .A1(n2), .B0(D1[2]), .B1(N8), .Y(n9) );
  OAI2BB1X1TS U18 ( .A0N(D2[1]), .A1N(N10), .B0(n10), .Y(S[1]) );
  AOI22X1TS U19 ( .A0(D0[1]), .A1(n2), .B0(D1[1]), .B1(N8), .Y(n10) );
  OAI2BB1X1TS U20 ( .A0N(D2[10]), .A1N(N10), .B0(n11), .Y(S[10]) );
  AOI22X1TS U21 ( .A0(D0[10]), .A1(n2), .B0(D1[10]), .B1(N8), .Y(n11) );
  OAI2BB1X1TS U22 ( .A0N(D2[0]), .A1N(N10), .B0(n12), .Y(S[0]) );
  AOI22X1TS U23 ( .A0(D0[0]), .A1(n2), .B0(D1[0]), .B1(N8), .Y(n12) );
  NOR2X1TS U24 ( .A(ctrl[0]), .B(ctrl[1]), .Y(n2) );
  NAND2BX1TS U25 ( .AN(ctrl[0]), .B(ctrl[1]), .Y(N9) );
  NAND2BX1TS U26 ( .AN(ctrl[1]), .B(ctrl[0]), .Y(N7) );
endmodule


module add_sub_carry_out_W11_DW01_add_0 ( A, B, CI, SUM, CO );
  input [11:0] A;
  input [11:0] B;
  output [11:0] SUM;
  input CI;
  output CO;
  wire   n1, n2;
  wire   [10:1] carry;

  ADDFHX4TS U1_10 ( .A(A[10]), .B(B[10]), .CI(carry[10]), .CO(SUM[11]), .S(
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


module add_sub_carry_out_W11_DW01_sub_0 ( A, B, CI, DIFF, CO );
  input [11:0] A;
  input [11:0] B;
  output [11:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2;
  wire   [11:1] carry;
  wire   [10:0] B_not;

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
  INVX12TS U5 ( .A(carry[11]), .Y(DIFF[11]) );
endmodule


module add_sub_carry_out_W11 ( op_mode, Data_A, Data_B, Data_S );
  input [10:0] Data_A;
  input [10:0] Data_B;
  output [11:0] Data_S;
  input op_mode;
  wire   N3, N4, N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, N15, N16, N17,
         N18, N19, N20, N21, N22, N23, N24, N25, N26, n7;

  AO22X1TS U5 ( .A0(N24), .A1(n7), .B0(op_mode), .B1(N12), .Y(Data_S[9]) );
  AO22X1TS U6 ( .A0(N23), .A1(n7), .B0(N11), .B1(op_mode), .Y(Data_S[8]) );
  AO22X1TS U7 ( .A0(N22), .A1(n7), .B0(N10), .B1(op_mode), .Y(Data_S[7]) );
  AO22X1TS U8 ( .A0(N9), .A1(op_mode), .B0(N21), .B1(n7), .Y(Data_S[6]) );
  AO22X1TS U9 ( .A0(N8), .A1(op_mode), .B0(N20), .B1(n7), .Y(Data_S[5]) );
  AO22X1TS U10 ( .A0(N7), .A1(op_mode), .B0(N19), .B1(n7), .Y(Data_S[4]) );
  AO22X1TS U11 ( .A0(N6), .A1(op_mode), .B0(N18), .B1(n7), .Y(Data_S[3]) );
  AO22X1TS U12 ( .A0(N5), .A1(op_mode), .B0(N17), .B1(n7), .Y(Data_S[2]) );
  AO22X1TS U13 ( .A0(N4), .A1(op_mode), .B0(N16), .B1(n7), .Y(Data_S[1]) );
  AO22X1TS U14 ( .A0(N26), .A1(n7), .B0(N14), .B1(op_mode), .Y(Data_S[11]) );
  AO22X1TS U15 ( .A0(N25), .A1(n7), .B0(N13), .B1(op_mode), .Y(Data_S[10]) );
  AO22X1TS U16 ( .A0(N3), .A1(op_mode), .B0(N15), .B1(n7), .Y(Data_S[0]) );
  CLKINVX1TS U17 ( .A(op_mode), .Y(n7) );
  add_sub_carry_out_W11_DW01_add_0 add_36 ( .A({1'b0, Data_A}), .B({1'b0, 
        Data_B}), .CI(1'b0), .SUM({N26, N25, N24, N23, N22, N21, N20, N19, N18, 
        N17, N16, N15}) );
  add_sub_carry_out_W11_DW01_sub_0 sub_34 ( .A({1'b0, Data_A}), .B({1'b0, 
        Data_B}), .CI(1'b0), .DIFF({N14, N13, N12, N11, N10, N9, N8, N7, N6, 
        N5, N4, N3}) );
endmodule


module Greater_Comparator_W12 ( Data_A, Data_B, gthan );
  input [11:0] Data_A;
  input [11:0] Data_B;
  output gthan;
  wire   N0, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15,
         n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31, n32, n33, n34, n35;

  BUFX16TS B_0 ( .A(N0), .Y(gthan) );
  CLKINVX1TS U1 ( .A(Data_B[10]), .Y(n3) );
  CLKINVX1TS U2 ( .A(Data_A[8]), .Y(n29) );
  NAND2BX1TS U3 ( .AN(Data_B[9]), .B(Data_A[9]), .Y(n28) );
  CLKINVX1TS U4 ( .A(Data_A[9]), .Y(n1) );
  AOI32X1TS U5 ( .A0(Data_B[8]), .A1(n29), .A2(n28), .B0(n1), .B1(Data_B[9]), 
        .Y(n2) );
  OA21XLTS U6 ( .A0(n3), .A1(Data_A[10]), .B0(n2), .Y(n5) );
  NOR2BX1TS U7 ( .AN(Data_A[10]), .B(Data_B[10]), .Y(n31) );
  NOR2BX1TS U8 ( .AN(Data_A[11]), .B(Data_B[11]), .Y(n30) );
  CLKINVX1TS U9 ( .A(Data_B[11]), .Y(n4) );
  OAI32X1TS U10 ( .A0(n5), .A1(n31), .A2(n30), .B0(Data_A[11]), .B1(n4), .Y(
        n35) );
  CLKINVX1TS U11 ( .A(Data_A[4]), .Y(n19) );
  CLKINVX1TS U12 ( .A(Data_B[2]), .Y(n8) );
  NOR2BX1TS U13 ( .AN(Data_A[3]), .B(Data_B[3]), .Y(n7) );
  AOI21X1TS U14 ( .A0(Data_A[2]), .A1(n8), .B0(n7), .Y(n9) );
  CLKINVX1TS U15 ( .A(Data_B[3]), .Y(n6) );
  OAI32X1TS U16 ( .A0(n8), .A1(Data_A[2]), .A2(n7), .B0(Data_A[3]), .B1(n6), 
        .Y(n12) );
  NAND2BX1TS U17 ( .AN(Data_B[5]), .B(Data_A[5]), .Y(n18) );
  OAI221XLTS U18 ( .A0(Data_B[4]), .A1(n19), .B0(n9), .B1(n12), .C0(n18), .Y(
        n27) );
  CLKINVX1TS U19 ( .A(Data_A[1]), .Y(n13) );
  CLKINVX1TS U20 ( .A(Data_B[0]), .Y(n10) );
  AOI2BB2X1TS U21 ( .B0(Data_A[0]), .B1(n10), .A0N(n13), .A1N(Data_B[1]), .Y(
        n11) );
  AOI211X1TS U22 ( .A0(Data_B[1]), .A1(n13), .B0(n12), .C0(n11), .Y(n26) );
  CLKINVX1TS U23 ( .A(Data_B[6]), .Y(n16) );
  CLKINVX1TS U24 ( .A(Data_B[7]), .Y(n14) );
  AND2X1TS U25 ( .A(Data_A[7]), .B(n14), .Y(n15) );
  AOI21X1TS U26 ( .A0(n16), .A1(Data_A[6]), .B0(n15), .Y(n23) );
  CLKINVX1TS U27 ( .A(n23), .Y(n25) );
  OAI32X1TS U28 ( .A0(n16), .A1(Data_A[6]), .A2(n15), .B0(Data_A[7]), .B1(n14), 
        .Y(n22) );
  CLKINVX1TS U29 ( .A(Data_A[5]), .Y(n17) );
  AOI32X1TS U30 ( .A0(Data_B[4]), .A1(n19), .A2(n18), .B0(n17), .B1(Data_B[5]), 
        .Y(n20) );
  CLKINVX1TS U31 ( .A(n20), .Y(n21) );
  OAI22X1TS U32 ( .A0(n23), .A1(n22), .B0(n22), .B1(n21), .Y(n24) );
  OAI31X1TS U33 ( .A0(n27), .A1(n26), .A2(n25), .B0(n24), .Y(n34) );
  OAI21X1TS U34 ( .A0(Data_B[8]), .A1(n29), .B0(n28), .Y(n32) );
  NOR3X1TS U35 ( .A(n32), .B(n31), .C(n30), .Y(n33) );
  OAI22X1TS U36 ( .A0(n35), .A1(n34), .B0(n33), .B1(n35), .Y(N0) );
endmodule


module Comparator_Less_W12 ( Data_A, Data_B, less );
  input [11:0] Data_A;
  input [11:0] Data_B;
  output less;
  wire   N0, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15,
         n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31, n32, n33, n34, n35;

  BUFX16TS B_0 ( .A(N0), .Y(less) );
  CLKINVX1TS U1 ( .A(Data_A[10]), .Y(n3) );
  CLKINVX1TS U2 ( .A(Data_B[8]), .Y(n29) );
  NAND2BX1TS U3 ( .AN(Data_A[9]), .B(Data_B[9]), .Y(n28) );
  CLKINVX1TS U4 ( .A(Data_B[9]), .Y(n1) );
  AOI32X1TS U5 ( .A0(Data_A[8]), .A1(n29), .A2(n28), .B0(n1), .B1(Data_A[9]), 
        .Y(n2) );
  OA21XLTS U6 ( .A0(n3), .A1(Data_B[10]), .B0(n2), .Y(n5) );
  NOR2BX1TS U7 ( .AN(Data_B[10]), .B(Data_A[10]), .Y(n31) );
  NOR2BX1TS U8 ( .AN(Data_B[11]), .B(Data_A[11]), .Y(n30) );
  CLKINVX1TS U9 ( .A(Data_A[11]), .Y(n4) );
  OAI32X1TS U10 ( .A0(n5), .A1(n31), .A2(n30), .B0(Data_B[11]), .B1(n4), .Y(
        n35) );
  CLKINVX1TS U11 ( .A(Data_B[4]), .Y(n19) );
  CLKINVX1TS U12 ( .A(Data_A[2]), .Y(n8) );
  NOR2BX1TS U13 ( .AN(Data_B[3]), .B(Data_A[3]), .Y(n7) );
  AOI21X1TS U14 ( .A0(Data_B[2]), .A1(n8), .B0(n7), .Y(n9) );
  CLKINVX1TS U15 ( .A(Data_A[3]), .Y(n6) );
  OAI32X1TS U16 ( .A0(n8), .A1(Data_B[2]), .A2(n7), .B0(Data_B[3]), .B1(n6), 
        .Y(n12) );
  NAND2BX1TS U17 ( .AN(Data_A[5]), .B(Data_B[5]), .Y(n18) );
  OAI221XLTS U18 ( .A0(Data_A[4]), .A1(n19), .B0(n9), .B1(n12), .C0(n18), .Y(
        n27) );
  CLKINVX1TS U19 ( .A(Data_B[1]), .Y(n13) );
  CLKINVX1TS U20 ( .A(Data_A[0]), .Y(n10) );
  AOI2BB2X1TS U21 ( .B0(Data_B[0]), .B1(n10), .A0N(n13), .A1N(Data_A[1]), .Y(
        n11) );
  AOI211X1TS U22 ( .A0(Data_A[1]), .A1(n13), .B0(n12), .C0(n11), .Y(n26) );
  CLKINVX1TS U23 ( .A(Data_A[6]), .Y(n16) );
  CLKINVX1TS U24 ( .A(Data_A[7]), .Y(n14) );
  AND2X1TS U25 ( .A(Data_B[7]), .B(n14), .Y(n15) );
  AOI21X1TS U26 ( .A0(n16), .A1(Data_B[6]), .B0(n15), .Y(n23) );
  CLKINVX1TS U27 ( .A(n23), .Y(n25) );
  OAI32X1TS U28 ( .A0(n16), .A1(Data_B[6]), .A2(n15), .B0(Data_B[7]), .B1(n14), 
        .Y(n22) );
  CLKINVX1TS U29 ( .A(Data_B[5]), .Y(n17) );
  AOI32X1TS U30 ( .A0(Data_A[4]), .A1(n19), .A2(n18), .B0(n17), .B1(Data_A[5]), 
        .Y(n20) );
  CLKINVX1TS U31 ( .A(n20), .Y(n21) );
  OAI22X1TS U32 ( .A0(n23), .A1(n22), .B0(n22), .B1(n21), .Y(n24) );
  OAI31X1TS U33 ( .A0(n27), .A1(n26), .A2(n25), .B0(n24), .Y(n34) );
  OAI21X1TS U34 ( .A0(Data_A[8]), .A1(n29), .B0(n28), .Y(n32) );
  NOR3X1TS U35 ( .A(n32), .B(n31), .C(n30), .Y(n33) );
  OAI22X1TS U36 ( .A0(n35), .A1(n34), .B0(n33), .B1(n35), .Y(N0) );
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
         n17, n18, n19, n20, n21, n22, n23;

  OAI2BB2XLTS U2 ( .B0(n1), .B1(load), .A0N(load), .A1N(D[0]), .Y(n12) );
  OAI2BB2XLTS U3 ( .B0(n2), .B1(load), .A0N(D[1]), .A1N(load), .Y(n13) );
  OAI2BB2XLTS U4 ( .B0(n3), .B1(load), .A0N(D[2]), .A1N(load), .Y(n14) );
  OAI2BB2XLTS U5 ( .B0(n4), .B1(load), .A0N(D[3]), .A1N(load), .Y(n15) );
  OAI2BB2XLTS U6 ( .B0(n5), .B1(load), .A0N(D[4]), .A1N(load), .Y(n16) );
  OAI2BB2XLTS U7 ( .B0(n6), .B1(load), .A0N(D[5]), .A1N(load), .Y(n17) );
  OAI2BB2XLTS U8 ( .B0(n7), .B1(load), .A0N(D[6]), .A1N(load), .Y(n18) );
  OAI2BB2XLTS U9 ( .B0(n8), .B1(load), .A0N(D[7]), .A1N(load), .Y(n19) );
  OAI2BB2XLTS U10 ( .B0(n9), .B1(load), .A0N(D[8]), .A1N(load), .Y(n20) );
  OAI2BB2XLTS U11 ( .B0(n10), .B1(load), .A0N(D[9]), .A1N(load), .Y(n21) );
  OAI2BB2XLTS U12 ( .B0(n11), .B1(load), .A0N(D[10]), .A1N(load), .Y(n23) );
  INVX2TS U13 ( .A(rst), .Y(n22) );
  DFFRXLTS Q_reg_7_ ( .D(n19), .CK(clk), .RN(n22), .Q(Q[7]), .QN(n8) );
  DFFRXLTS Q_reg_10_ ( .D(n23), .CK(clk), .RN(n22), .Q(Q[10]), .QN(n11) );
  DFFRXLTS Q_reg_8_ ( .D(n20), .CK(clk), .RN(n22), .Q(Q[8]), .QN(n9) );
  DFFRXLTS Q_reg_9_ ( .D(n21), .CK(clk), .RN(n22), .Q(Q[9]), .QN(n10) );
  DFFRXLTS Q_reg_0_ ( .D(n12), .CK(clk), .RN(n22), .Q(Q[0]), .QN(n1) );
  DFFRXLTS Q_reg_1_ ( .D(n13), .CK(clk), .RN(n22), .Q(Q[1]), .QN(n2) );
  DFFRXLTS Q_reg_4_ ( .D(n16), .CK(clk), .RN(n22), .Q(Q[4]), .QN(n5) );
  DFFRXLTS Q_reg_6_ ( .D(n18), .CK(clk), .RN(n22), .Q(Q[6]), .QN(n7) );
  DFFRXLTS Q_reg_2_ ( .D(n14), .CK(clk), .RN(n22), .Q(Q[2]), .QN(n3) );
  DFFRXLTS Q_reg_5_ ( .D(n17), .CK(clk), .RN(n22), .Q(Q[5]), .QN(n6) );
  DFFRXLTS Q_reg_3_ ( .D(n15), .CK(clk), .RN(n22), .Q(Q[3]), .QN(n4) );
endmodule


module RegisterAdd_W1_9 ( clk, rst, load, D, Q );
  input [0:0] D;
  output [0:0] Q;
  input clk, rst, load;
  wire   n4, n5, n6;

  OAI2BB2XLTS U2 ( .B0(n6), .B1(load), .A0N(load), .A1N(D[0]), .Y(n4) );
  INVX2TS U3 ( .A(rst), .Y(n5) );
  DFFRX1TS Q_reg_0_ ( .D(n4), .CK(clk), .RN(n5), .Q(Q[0]), .QN(n6) );
endmodule


module RegisterAdd_W1_8 ( clk, rst, load, D, Q );
  input [0:0] D;
  output [0:0] Q;
  input clk, rst, load;
  wire   n4, n5, n6;

  DFFRX4TS Q_reg_0_ ( .D(n4), .CK(clk), .RN(n5), .Q(Q[0]), .QN(n6) );
  OAI2BB2XLTS U2 ( .B0(n6), .B1(load), .A0N(load), .A1N(D[0]), .Y(n4) );
  INVX2TS U3 ( .A(rst), .Y(n5) );
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
  RegisterAdd_W1_9 Overflow ( .clk(clk), .rst(rst), .load(load_a_i), .D(
        Overflow_flag), .Q(Overflow_flag_o) );
  RegisterAdd_W1_8 Underflow ( .clk(clk), .rst(rst), .load(load_b_i), .D(
        Underflow_flag), .Q(Underflow_flag_o) );
endmodule


module Mux_3x1_W6 ( ctrl, D0, D1, D2, S );
  input [1:0] ctrl;
  input [5:0] D0;
  input [5:0] D1;
  input [5:0] D2;
  output [5:0] S;
  wire   N7, N8, N9, N10, n1, n2, n3, n4, n5, n6, n7;

  INVX12TS I_3 ( .A(N9), .Y(N10) );
  INVX12TS I_2 ( .A(N7), .Y(N8) );
  OAI2BB1X1TS U2 ( .A0N(N10), .A1N(D2[5]), .B0(n1), .Y(S[5]) );
  AOI22X1TS U3 ( .A0(N8), .A1(D1[5]), .B0(D0[5]), .B1(n2), .Y(n1) );
  OAI2BB1X1TS U4 ( .A0N(D2[4]), .A1N(N10), .B0(n3), .Y(S[4]) );
  AOI22X1TS U5 ( .A0(D0[4]), .A1(n2), .B0(D1[4]), .B1(N8), .Y(n3) );
  OAI2BB1X1TS U6 ( .A0N(D2[3]), .A1N(N10), .B0(n4), .Y(S[3]) );
  AOI22X1TS U7 ( .A0(D0[3]), .A1(n2), .B0(D1[3]), .B1(N8), .Y(n4) );
  OAI2BB1X1TS U8 ( .A0N(D2[2]), .A1N(N10), .B0(n5), .Y(S[2]) );
  AOI22X1TS U9 ( .A0(D0[2]), .A1(n2), .B0(D1[2]), .B1(N8), .Y(n5) );
  OAI2BB1X1TS U10 ( .A0N(D2[1]), .A1N(N10), .B0(n6), .Y(S[1]) );
  AOI22X1TS U11 ( .A0(D0[1]), .A1(n2), .B0(D1[1]), .B1(N8), .Y(n6) );
  OAI2BB1X1TS U12 ( .A0N(D2[0]), .A1N(N10), .B0(n7), .Y(S[0]) );
  AOI22X1TS U13 ( .A0(D0[0]), .A1(n2), .B0(D1[0]), .B1(N8), .Y(n7) );
  NOR2X1TS U14 ( .A(ctrl[0]), .B(ctrl[1]), .Y(n2) );
  NAND2BX1TS U15 ( .AN(ctrl[0]), .B(ctrl[1]), .Y(N9) );
  NAND2BX1TS U16 ( .AN(ctrl[1]), .B(ctrl[0]), .Y(N7) );
endmodule


module Multiplexer_AC_W55_0 ( ctrl, D0, D1, S );
  input [54:0] D0;
  input [54:0] D1;
  output [54:0] S;
  input ctrl;
  wire   n1;

  AO22X1TS U1 ( .A0(ctrl), .A1(D1[9]), .B0(D0[9]), .B1(n1), .Y(S[9]) );
  AO22X1TS U2 ( .A0(D1[8]), .A1(ctrl), .B0(D0[8]), .B1(n1), .Y(S[8]) );
  AO22X1TS U3 ( .A0(D1[7]), .A1(ctrl), .B0(D0[7]), .B1(n1), .Y(S[7]) );
  AO22X1TS U4 ( .A0(D1[6]), .A1(ctrl), .B0(D0[6]), .B1(n1), .Y(S[6]) );
  AO22X1TS U5 ( .A0(D1[5]), .A1(ctrl), .B0(D0[5]), .B1(n1), .Y(S[5]) );
  AO22X1TS U6 ( .A0(D1[54]), .A1(ctrl), .B0(D0[54]), .B1(n1), .Y(S[54]) );
  AO22X1TS U7 ( .A0(D1[53]), .A1(ctrl), .B0(D0[53]), .B1(n1), .Y(S[53]) );
  AO22X1TS U8 ( .A0(D1[52]), .A1(ctrl), .B0(D0[52]), .B1(n1), .Y(S[52]) );
  AO22X1TS U9 ( .A0(D1[51]), .A1(ctrl), .B0(D0[51]), .B1(n1), .Y(S[51]) );
  AO22X1TS U10 ( .A0(D1[50]), .A1(ctrl), .B0(D0[50]), .B1(n1), .Y(S[50]) );
  AO22X1TS U11 ( .A0(D1[4]), .A1(ctrl), .B0(D0[4]), .B1(n1), .Y(S[4]) );
  AO22X1TS U12 ( .A0(D1[49]), .A1(ctrl), .B0(D0[49]), .B1(n1), .Y(S[49]) );
  AO22X1TS U13 ( .A0(D1[48]), .A1(ctrl), .B0(D0[48]), .B1(n1), .Y(S[48]) );
  AO22X1TS U14 ( .A0(D1[47]), .A1(ctrl), .B0(D0[47]), .B1(n1), .Y(S[47]) );
  AO22X1TS U15 ( .A0(D1[46]), .A1(ctrl), .B0(D0[46]), .B1(n1), .Y(S[46]) );
  AO22X1TS U16 ( .A0(D1[45]), .A1(ctrl), .B0(D0[45]), .B1(n1), .Y(S[45]) );
  AO22X1TS U17 ( .A0(D1[44]), .A1(ctrl), .B0(D0[44]), .B1(n1), .Y(S[44]) );
  AO22X1TS U18 ( .A0(D1[43]), .A1(ctrl), .B0(D0[43]), .B1(n1), .Y(S[43]) );
  AO22X1TS U19 ( .A0(D1[42]), .A1(ctrl), .B0(D0[42]), .B1(n1), .Y(S[42]) );
  AO22X1TS U20 ( .A0(D1[41]), .A1(ctrl), .B0(D0[41]), .B1(n1), .Y(S[41]) );
  AO22X1TS U21 ( .A0(D1[40]), .A1(ctrl), .B0(D0[40]), .B1(n1), .Y(S[40]) );
  AO22X1TS U22 ( .A0(D1[3]), .A1(ctrl), .B0(D0[3]), .B1(n1), .Y(S[3]) );
  AO22X1TS U23 ( .A0(D1[39]), .A1(ctrl), .B0(D0[39]), .B1(n1), .Y(S[39]) );
  AO22X1TS U24 ( .A0(D1[38]), .A1(ctrl), .B0(D0[38]), .B1(n1), .Y(S[38]) );
  AO22X1TS U25 ( .A0(D1[37]), .A1(ctrl), .B0(D0[37]), .B1(n1), .Y(S[37]) );
  AO22X1TS U26 ( .A0(D1[36]), .A1(ctrl), .B0(D0[36]), .B1(n1), .Y(S[36]) );
  AO22X1TS U27 ( .A0(D1[35]), .A1(ctrl), .B0(D0[35]), .B1(n1), .Y(S[35]) );
  AO22X1TS U28 ( .A0(D1[34]), .A1(ctrl), .B0(D0[34]), .B1(n1), .Y(S[34]) );
  AO22X1TS U29 ( .A0(D1[33]), .A1(ctrl), .B0(D0[33]), .B1(n1), .Y(S[33]) );
  AO22X1TS U30 ( .A0(D1[32]), .A1(ctrl), .B0(D0[32]), .B1(n1), .Y(S[32]) );
  AO22X1TS U31 ( .A0(D1[31]), .A1(ctrl), .B0(D0[31]), .B1(n1), .Y(S[31]) );
  AO22X1TS U32 ( .A0(D1[30]), .A1(ctrl), .B0(D0[30]), .B1(n1), .Y(S[30]) );
  AO22X1TS U33 ( .A0(D1[2]), .A1(ctrl), .B0(D0[2]), .B1(n1), .Y(S[2]) );
  AO22X1TS U34 ( .A0(D1[29]), .A1(ctrl), .B0(D0[29]), .B1(n1), .Y(S[29]) );
  AO22X1TS U35 ( .A0(D1[28]), .A1(ctrl), .B0(D0[28]), .B1(n1), .Y(S[28]) );
  AO22X1TS U36 ( .A0(D1[27]), .A1(ctrl), .B0(D0[27]), .B1(n1), .Y(S[27]) );
  AO22X1TS U37 ( .A0(D1[26]), .A1(ctrl), .B0(D0[26]), .B1(n1), .Y(S[26]) );
  AO22X1TS U38 ( .A0(D1[25]), .A1(ctrl), .B0(D0[25]), .B1(n1), .Y(S[25]) );
  AO22X1TS U39 ( .A0(D1[24]), .A1(ctrl), .B0(D0[24]), .B1(n1), .Y(S[24]) );
  AO22X1TS U40 ( .A0(D1[23]), .A1(ctrl), .B0(D0[23]), .B1(n1), .Y(S[23]) );
  AO22X1TS U41 ( .A0(D1[22]), .A1(ctrl), .B0(D0[22]), .B1(n1), .Y(S[22]) );
  AO22X1TS U42 ( .A0(D1[21]), .A1(ctrl), .B0(D0[21]), .B1(n1), .Y(S[21]) );
  AO22X1TS U43 ( .A0(D1[20]), .A1(ctrl), .B0(D0[20]), .B1(n1), .Y(S[20]) );
  AO22X1TS U44 ( .A0(D1[1]), .A1(ctrl), .B0(D0[1]), .B1(n1), .Y(S[1]) );
  AO22X1TS U45 ( .A0(D1[19]), .A1(ctrl), .B0(D0[19]), .B1(n1), .Y(S[19]) );
  AO22X1TS U46 ( .A0(D1[18]), .A1(ctrl), .B0(D0[18]), .B1(n1), .Y(S[18]) );
  AO22X1TS U47 ( .A0(D1[17]), .A1(ctrl), .B0(D0[17]), .B1(n1), .Y(S[17]) );
  AO22X1TS U48 ( .A0(D1[16]), .A1(ctrl), .B0(D0[16]), .B1(n1), .Y(S[16]) );
  AO22X1TS U49 ( .A0(D1[15]), .A1(ctrl), .B0(D0[15]), .B1(n1), .Y(S[15]) );
  AO22X1TS U50 ( .A0(D1[14]), .A1(ctrl), .B0(D0[14]), .B1(n1), .Y(S[14]) );
  AO22X1TS U51 ( .A0(D1[13]), .A1(ctrl), .B0(D0[13]), .B1(n1), .Y(S[13]) );
  AO22X1TS U52 ( .A0(D1[12]), .A1(ctrl), .B0(D0[12]), .B1(n1), .Y(S[12]) );
  AO22X1TS U53 ( .A0(D1[11]), .A1(ctrl), .B0(D0[11]), .B1(n1), .Y(S[11]) );
  AO22X1TS U54 ( .A0(D1[10]), .A1(ctrl), .B0(D0[10]), .B1(n1), .Y(S[10]) );
  AO22X1TS U55 ( .A0(D1[0]), .A1(ctrl), .B0(D0[0]), .B1(n1), .Y(S[0]) );
  CLKINVX1TS U56 ( .A(ctrl), .Y(n1) );
endmodule


module Priority_Codec_64 ( Data_Dec_i, Data_Bin_o );
  input [54:0] Data_Dec_i;
  output [5:0] Data_Bin_o;
  wire   N2, N3, N4, N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, N15, N16,
         N17, N18, N19, N20, N21, N22, N23, N24, N25, N26, N27, N28, N29, N30,
         N31, N32, N33, N34, N35, N36, N37, N38, N39, N40, N41, N42, N43, N44,
         N45, N46, N47, N48, N49, N50, N51, N52, N53, N54, N55, N56, n1, n2,
         n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17,
         n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31,
         n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45,
         n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59,
         n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73,
         n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87,
         n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122,
         n123, n124, n125, n126, n127, n128, n129, n130, n131, n132, n133;

  INVX12TS I_54 ( .A(Data_Dec_i[0]), .Y(N56) );
  INVX12TS I_53 ( .A(Data_Dec_i[1]), .Y(N55) );
  INVX12TS I_52 ( .A(Data_Dec_i[2]), .Y(N54) );
  INVX12TS I_51 ( .A(Data_Dec_i[3]), .Y(N53) );
  INVX12TS I_50 ( .A(Data_Dec_i[4]), .Y(N52) );
  INVX12TS I_49 ( .A(Data_Dec_i[5]), .Y(N51) );
  INVX12TS I_48 ( .A(Data_Dec_i[6]), .Y(N50) );
  INVX12TS I_47 ( .A(Data_Dec_i[7]), .Y(N49) );
  INVX12TS I_46 ( .A(Data_Dec_i[8]), .Y(N48) );
  INVX12TS I_45 ( .A(Data_Dec_i[9]), .Y(N47) );
  INVX12TS I_44 ( .A(Data_Dec_i[10]), .Y(N46) );
  INVX12TS I_43 ( .A(Data_Dec_i[11]), .Y(N45) );
  INVX12TS I_42 ( .A(Data_Dec_i[12]), .Y(N44) );
  INVX12TS I_41 ( .A(Data_Dec_i[13]), .Y(N43) );
  INVX12TS I_40 ( .A(Data_Dec_i[14]), .Y(N42) );
  INVX12TS I_39 ( .A(Data_Dec_i[15]), .Y(N41) );
  INVX12TS I_38 ( .A(Data_Dec_i[16]), .Y(N40) );
  INVX12TS I_37 ( .A(Data_Dec_i[17]), .Y(N39) );
  INVX12TS I_36 ( .A(Data_Dec_i[18]), .Y(N38) );
  INVX12TS I_35 ( .A(Data_Dec_i[19]), .Y(N37) );
  INVX12TS I_34 ( .A(Data_Dec_i[20]), .Y(N36) );
  INVX12TS I_33 ( .A(Data_Dec_i[21]), .Y(N35) );
  INVX12TS I_32 ( .A(Data_Dec_i[22]), .Y(N34) );
  INVX12TS I_31 ( .A(Data_Dec_i[23]), .Y(N33) );
  INVX12TS I_30 ( .A(Data_Dec_i[24]), .Y(N32) );
  INVX12TS I_29 ( .A(Data_Dec_i[25]), .Y(N31) );
  INVX12TS I_28 ( .A(Data_Dec_i[26]), .Y(N30) );
  INVX12TS I_27 ( .A(Data_Dec_i[27]), .Y(N29) );
  INVX12TS I_26 ( .A(Data_Dec_i[28]), .Y(N28) );
  INVX12TS I_25 ( .A(Data_Dec_i[29]), .Y(N27) );
  INVX12TS I_24 ( .A(Data_Dec_i[30]), .Y(N26) );
  INVX12TS I_23 ( .A(Data_Dec_i[31]), .Y(N25) );
  INVX12TS I_22 ( .A(Data_Dec_i[32]), .Y(N24) );
  INVX12TS I_21 ( .A(Data_Dec_i[33]), .Y(N23) );
  INVX12TS I_20 ( .A(Data_Dec_i[34]), .Y(N22) );
  INVX12TS I_19 ( .A(Data_Dec_i[35]), .Y(N21) );
  INVX12TS I_18 ( .A(Data_Dec_i[36]), .Y(N20) );
  INVX12TS I_17 ( .A(Data_Dec_i[37]), .Y(N19) );
  INVX12TS I_16 ( .A(Data_Dec_i[38]), .Y(N18) );
  INVX12TS I_15 ( .A(Data_Dec_i[39]), .Y(N17) );
  INVX12TS I_14 ( .A(Data_Dec_i[40]), .Y(N16) );
  INVX12TS I_13 ( .A(Data_Dec_i[41]), .Y(N15) );
  INVX12TS I_12 ( .A(Data_Dec_i[42]), .Y(N14) );
  INVX12TS I_11 ( .A(Data_Dec_i[43]), .Y(N13) );
  INVX12TS I_10 ( .A(Data_Dec_i[44]), .Y(N12) );
  INVX12TS I_9 ( .A(Data_Dec_i[45]), .Y(N11) );
  INVX12TS I_8 ( .A(Data_Dec_i[46]), .Y(N10) );
  INVX12TS I_7 ( .A(Data_Dec_i[47]), .Y(N9) );
  INVX12TS I_6 ( .A(Data_Dec_i[48]), .Y(N8) );
  INVX12TS I_5 ( .A(Data_Dec_i[49]), .Y(N7) );
  INVX12TS I_4 ( .A(Data_Dec_i[50]), .Y(N6) );
  INVX12TS I_3 ( .A(Data_Dec_i[51]), .Y(N5) );
  INVX12TS I_2 ( .A(Data_Dec_i[52]), .Y(N4) );
  INVX12TS I_1 ( .A(Data_Dec_i[53]), .Y(N3) );
  INVX12TS I_0 ( .A(Data_Dec_i[54]), .Y(N2) );
  NAND4X1TS U3 ( .A(n1), .B(n2), .C(n3), .D(n4), .Y(Data_Bin_o[5]) );
  NOR4BX1TS U4 ( .AN(n5), .B(n6), .C(n7), .D(n8), .Y(n4) );
  OAI32X1TS U5 ( .A0(n9), .A1(N35), .A2(n10), .B0(n11), .B1(n12), .Y(n6) );
  AND3X1TS U6 ( .A(n13), .B(n14), .C(n15), .Y(n3) );
  NAND4BBX1TS U7 ( .AN(n16), .BN(n17), .C(n18), .D(n19), .Y(Data_Bin_o[4]) );
  NOR4BX1TS U8 ( .AN(n2), .B(n20), .C(n21), .D(n22), .Y(n19) );
  OAI31X1TS U9 ( .A0(n23), .A1(N17), .A2(n24), .B0(n25), .Y(n20) );
  CLKINVX1TS U10 ( .A(n26), .Y(n24) );
  NAND3BX1TS U11 ( .AN(N53), .B(n27), .C(N54), .Y(n2) );
  AOI211X1TS U12 ( .A0(N30), .A1(n28), .B0(n29), .C0(n30), .Y(n18) );
  AOI2BB1X1TS U13 ( .A0N(N20), .A1N(N22), .B0(n31), .Y(n30) );
  OR4X1TS U14 ( .A(n32), .B(n33), .C(n34), .D(n35), .Y(Data_Bin_o[3]) );
  NAND4X1TS U15 ( .A(n36), .B(n37), .C(n38), .D(n39), .Y(n35) );
  NOR4BX1TS U16 ( .AN(n40), .B(n41), .C(n21), .D(n42), .Y(n39) );
  CLKINVX1TS U17 ( .A(n43), .Y(n21) );
  NAND3BX1TS U18 ( .AN(N25), .B(n44), .C(N26), .Y(n43) );
  NAND3BX1TS U19 ( .AN(N9), .B(n45), .C(N10), .Y(n38) );
  OAI211X1TS U20 ( .A0(n46), .A1(n47), .B0(n48), .C0(n49), .Y(n34) );
  OAI33XLTS U21 ( .A0(n12), .A1(N45), .A2(n50), .B0(n51), .B1(N29), .B2(n52), 
        .Y(n33) );
  CLKINVX1TS U22 ( .A(N30), .Y(n51) );
  CLKINVX1TS U23 ( .A(N46), .Y(n12) );
  AOI21X1TS U24 ( .A0(n53), .A1(n54), .B0(n55), .Y(n32) );
  NAND4BX1TS U25 ( .AN(n29), .B(n56), .C(n57), .D(n58), .Y(Data_Bin_o[2]) );
  NOR3BX1TS U26 ( .AN(n59), .B(n60), .C(n61), .Y(n58) );
  OAI33XLTS U27 ( .A0(n54), .A1(N13), .A2(n62), .B0(n63), .B1(n64), .B2(n65), 
        .Y(n60) );
  CLKINVX1TS U28 ( .A(N14), .Y(n54) );
  AOI31X1TS U29 ( .A0(n66), .A1(n67), .A2(N22), .B0(n8), .Y(n57) );
  NAND3X1TS U30 ( .A(n68), .B(n37), .C(n69), .Y(n8) );
  AOI22X1TS U31 ( .A0(N42), .A1(n70), .B0(N44), .B1(n71), .Y(n69) );
  NAND2X1TS U32 ( .A(N50), .B(n72), .Y(n37) );
  NAND3X1TS U33 ( .A(n40), .B(n73), .C(n74), .Y(n29) );
  AOI21X1TS U34 ( .A0(N28), .A1(n28), .B0(n75), .Y(n74) );
  NAND3BX1TS U35 ( .AN(N33), .B(n76), .C(N34), .Y(n40) );
  OR4X1TS U36 ( .A(n77), .B(n78), .C(n79), .D(n80), .Y(Data_Bin_o[1]) );
  NAND4X1TS U37 ( .A(n81), .B(n82), .C(n83), .D(n84), .Y(n80) );
  NOR4BX1TS U38 ( .AN(n73), .B(n61), .C(n85), .D(n86), .Y(n84) );
  AND2X1TS U39 ( .A(N8), .B(n87), .Y(n61) );
  NAND3BX1TS U40 ( .AN(N23), .B(n88), .C(N24), .Y(n73) );
  OAI211X1TS U41 ( .A0(n89), .A1(n63), .B0(n5), .C0(n49), .Y(n79) );
  NOR4BBX1TS U42 ( .AN(n90), .BN(n68), .C(n91), .D(n92), .Y(n49) );
  NAND3BX1TS U43 ( .AN(n93), .B(n13), .C(n15), .Y(n92) );
  NAND3BX1TS U44 ( .AN(N47), .B(n94), .C(N48), .Y(n15) );
  NAND2X1TS U45 ( .A(N52), .B(n95), .Y(n68) );
  NOR4XLTS U46 ( .A(n96), .B(n75), .C(n22), .D(n97), .Y(n90) );
  CLKINVX1TS U47 ( .A(n98), .Y(n22) );
  NAND3BX1TS U48 ( .AN(N31), .B(n99), .C(N32), .Y(n98) );
  NOR3BX1TS U49 ( .AN(N36), .B(n46), .C(N35), .Y(n75) );
  NAND3X1TS U50 ( .A(n59), .B(n100), .C(n101), .Y(n96) );
  NAND3BX1TS U51 ( .AN(N15), .B(n102), .C(N16), .Y(n59) );
  AOI211X1TS U52 ( .A0(n103), .A1(N40), .B0(n104), .C0(n105), .Y(n5) );
  CLKINVX1TS U53 ( .A(n25), .Y(n104) );
  NAND3BX1TS U54 ( .AN(N55), .B(n106), .C(N56), .Y(n25) );
  CLKINVX1TS U55 ( .A(n107), .Y(n103) );
  OAI33XLTS U56 ( .A0(n53), .A1(N11), .A2(n55), .B0(n108), .B1(N19), .B2(n31), 
        .Y(n78) );
  CLKINVX1TS U57 ( .A(N20), .Y(n108) );
  CLKINVX1TS U58 ( .A(N12), .Y(n53) );
  OAI33XLTS U59 ( .A0(n109), .A1(N27), .A2(n110), .B0(n111), .B1(N43), .B2(n11), .Y(n77) );
  CLKINVX1TS U60 ( .A(N44), .Y(n111) );
  CLKINVX1TS U61 ( .A(N28), .Y(n109) );
  NAND4X1TS U62 ( .A(n56), .B(n48), .C(n112), .D(n113), .Y(Data_Bin_o[0]) );
  NOR3BX1TS U63 ( .AN(n100), .B(n114), .C(n105), .Y(n113) );
  NOR3BX1TS U64 ( .AN(N41), .B(n107), .C(N40), .Y(n105) );
  OAI31X1TS U65 ( .A0(n115), .A1(N38), .A2(n9), .B0(n13), .Y(n114) );
  NAND2X1TS U66 ( .A(N49), .B(n116), .Y(n13) );
  CLKINVX1TS U67 ( .A(n117), .Y(n9) );
  CLKINVX1TS U68 ( .A(N39), .Y(n115) );
  NAND2X1TS U69 ( .A(N13), .B(n118), .Y(n100) );
  AOI21X1TS U70 ( .A0(n119), .A1(n120), .B0(n16), .Y(n112) );
  OAI211X1TS U71 ( .A0(n31), .A1(n121), .B0(n1), .C0(n122), .Y(n16) );
  NOR3X1TS U72 ( .A(n97), .B(n86), .C(n42), .Y(n122) );
  AND2X1TS U73 ( .A(n99), .B(N31), .Y(n42) );
  NOR2BX1TS U74 ( .AN(n66), .B(n67), .Y(n86) );
  CLKINVX1TS U75 ( .A(N21), .Y(n67) );
  AND2X1TS U76 ( .A(N33), .B(n76), .Y(n97) );
  NAND2X1TS U77 ( .A(N55), .B(n106), .Y(n1) );
  NOR3BX1TS U78 ( .AN(n27), .B(N53), .C(N54), .Y(n106) );
  CLKINVX1TS U79 ( .A(N19), .Y(n121) );
  OAI21X1TS U80 ( .A0(N4), .A1(n123), .B0(n124), .Y(n119) );
  AOI21X1TS U81 ( .A0(N7), .A1(n125), .B0(N5), .Y(n123) );
  CLKINVX1TS U82 ( .A(N6), .Y(n125) );
  AOI21X1TS U83 ( .A0(n126), .A1(N11), .B0(n127), .Y(n48) );
  CLKINVX1TS U84 ( .A(n14), .Y(n127) );
  NAND2X1TS U85 ( .A(N47), .B(n94), .Y(n14) );
  NOR3BX1TS U86 ( .AN(n128), .B(n17), .C(n7), .Y(n56) );
  NAND3X1TS U87 ( .A(n36), .B(n83), .C(n129), .Y(n7) );
  AOI21X1TS U88 ( .A0(N43), .A1(n71), .B0(n91), .Y(n129) );
  AND2X1TS U89 ( .A(N53), .B(n27), .Y(n91) );
  NOR2BX1TS U90 ( .AN(n95), .B(N52), .Y(n27) );
  NOR3BX1TS U91 ( .AN(n72), .B(N50), .C(N51), .Y(n95) );
  CLKINVX1TS U92 ( .A(n11), .Y(n71) );
  NAND2X1TS U93 ( .A(N45), .B(n130), .Y(n83) );
  NAND3BX1TS U94 ( .AN(N50), .B(n72), .C(N51), .Y(n36) );
  NOR2BX1TS U95 ( .AN(n116), .B(N49), .Y(n72) );
  NOR3BX1TS U96 ( .AN(n94), .B(N47), .C(N48), .Y(n116) );
  NOR3X1TS U97 ( .A(N45), .B(N46), .C(n50), .Y(n94) );
  CLKINVX1TS U98 ( .A(n130), .Y(n50) );
  NOR3X1TS U99 ( .A(N43), .B(N44), .C(n11), .Y(n130) );
  NAND2BX1TS U100 ( .AN(N42), .B(n70), .Y(n11) );
  NOR3X1TS U101 ( .A(N40), .B(N41), .C(n107), .Y(n70) );
  NAND3X1TS U102 ( .A(n10), .B(n47), .C(n117), .Y(n107) );
  NOR3X1TS U103 ( .A(N36), .B(N37), .C(n46), .Y(n117) );
  CLKINVX1TS U104 ( .A(N35), .Y(n47) );
  NOR2X1TS U105 ( .A(N39), .B(N38), .Y(n10) );
  NAND4BX1TS U106 ( .AN(n93), .B(n81), .C(n82), .D(n131), .Y(n17) );
  AOI222XLTS U107 ( .A0(N27), .A1(n28), .B0(N23), .B1(n88), .C0(N35), .C1(n132), .Y(n131) );
  NAND2X1TS U108 ( .A(N25), .B(n44), .Y(n82) );
  NAND2X1TS U109 ( .A(N29), .B(n133), .Y(n81) );
  NOR4BX1TS U110 ( .AN(N37), .B(n46), .C(N35), .D(N36), .Y(n93) );
  CLKINVX1TS U111 ( .A(n132), .Y(n46) );
  NOR3BX1TS U112 ( .AN(n76), .B(N33), .C(N34), .Y(n132) );
  NOR3BX1TS U113 ( .AN(n99), .B(N31), .C(N32), .Y(n76) );
  NOR3X1TS U114 ( .A(N29), .B(N30), .C(n52), .Y(n99) );
  CLKINVX1TS U115 ( .A(n133), .Y(n52) );
  NOR3X1TS U116 ( .A(N27), .B(N28), .C(n110), .Y(n133) );
  CLKINVX1TS U117 ( .A(n28), .Y(n110) );
  NOR3BX1TS U118 ( .AN(n44), .B(N26), .C(N25), .Y(n28) );
  NOR3BX1TS U119 ( .AN(n88), .B(N23), .C(N24), .Y(n44) );
  NOR3BX1TS U120 ( .AN(n66), .B(N21), .C(N22), .Y(n88) );
  NOR3X1TS U121 ( .A(N19), .B(N20), .C(n31), .Y(n66) );
  NAND3BX1TS U122 ( .AN(N17), .B(n23), .C(n26), .Y(n31) );
  CLKINVX1TS U123 ( .A(N18), .Y(n23) );
  NOR3BX1TS U124 ( .AN(n101), .B(n85), .C(n41), .Y(n128) );
  AND2X1TS U125 ( .A(N15), .B(n102), .Y(n41) );
  AND2X1TS U126 ( .A(N9), .B(n45), .Y(n85) );
  NAND2X1TS U127 ( .A(N17), .B(n26), .Y(n101) );
  NOR3BX1TS U128 ( .AN(n102), .B(N15), .C(N16), .Y(n26) );
  NOR3X1TS U129 ( .A(N13), .B(N14), .C(n62), .Y(n102) );
  CLKINVX1TS U130 ( .A(n118), .Y(n62) );
  NOR3X1TS U131 ( .A(N11), .B(N12), .C(n55), .Y(n118) );
  CLKINVX1TS U132 ( .A(n126), .Y(n55) );
  NOR3BX1TS U133 ( .AN(n45), .B(N10), .C(N9), .Y(n126) );
  NOR2BX1TS U134 ( .AN(n87), .B(N8), .Y(n45) );
  NOR3BX1TS U135 ( .AN(n64), .B(n65), .C(n63), .Y(n87) );
  NAND2X1TS U136 ( .A(n120), .B(n124), .Y(n63) );
  CLKINVX1TS U137 ( .A(N3), .Y(n124) );
  CLKINVX1TS U138 ( .A(N2), .Y(n120) );
  CLKINVX1TS U139 ( .A(n89), .Y(n65) );
  NOR2X1TS U140 ( .A(N5), .B(N4), .Y(n89) );
  NOR2X1TS U141 ( .A(N7), .B(N6), .Y(n64) );
endmodule


module RegisterAdd_W6 ( clk, rst, load, D, Q );
  input [5:0] D;
  output [5:0] Q;
  input clk, rst, load;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13;

  OAI2BB2XLTS U2 ( .B0(n1), .B1(load), .A0N(load), .A1N(D[0]), .Y(n7) );
  OAI2BB2XLTS U3 ( .B0(n2), .B1(load), .A0N(D[1]), .A1N(load), .Y(n8) );
  OAI2BB2XLTS U4 ( .B0(n3), .B1(load), .A0N(D[2]), .A1N(load), .Y(n9) );
  OAI2BB2XLTS U5 ( .B0(n4), .B1(load), .A0N(D[3]), .A1N(load), .Y(n10) );
  OAI2BB2XLTS U6 ( .B0(n5), .B1(load), .A0N(D[4]), .A1N(load), .Y(n11) );
  OAI2BB2XLTS U7 ( .B0(n6), .B1(load), .A0N(D[5]), .A1N(load), .Y(n13) );
  INVX2TS U8 ( .A(rst), .Y(n12) );
  DFFRX1TS Q_reg_3_ ( .D(n10), .CK(clk), .RN(n12), .Q(Q[3]), .QN(n4) );
  DFFRX1TS Q_reg_2_ ( .D(n9), .CK(clk), .RN(n12), .Q(Q[2]), .QN(n3) );
  DFFRX1TS Q_reg_0_ ( .D(n7), .CK(clk), .RN(n12), .Q(Q[0]), .QN(n1) );
  DFFRX1TS Q_reg_4_ ( .D(n11), .CK(clk), .RN(n12), .Q(Q[4]), .QN(n5) );
  DFFRX1TS Q_reg_1_ ( .D(n8), .CK(clk), .RN(n12), .Q(Q[1]), .QN(n2) );
  DFFRX1TS Q_reg_5_ ( .D(n13), .CK(clk), .RN(n12), .Q(Q[5]), .QN(n6) );
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


module Multiplexer_AC_W1_160 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1, n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(n1), .B1(D1[0]), .Y(S[0]) );
  CLKINVX20TS U2 ( .A(n2), .Y(n1) );
  INVX20TS U3 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_159 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1, n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(n1), .B1(D1[0]), .Y(S[0]) );
  CLKINVX20TS U2 ( .A(n2), .Y(n1) );
  INVX20TS U3 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_158 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1, n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(n1), .B1(D1[0]), .Y(S[0]) );
  CLKINVX20TS U2 ( .A(n2), .Y(n1) );
  INVX20TS U3 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_157 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1, n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(n1), .B1(D1[0]), .Y(S[0]) );
  CLKINVX20TS U2 ( .A(n2), .Y(n1) );
  INVX20TS U3 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_156 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1, n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(n1), .B1(D1[0]), .Y(S[0]) );
  CLKINVX20TS U2 ( .A(n2), .Y(n1) );
  INVX20TS U3 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_155 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1, n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(n1), .B1(D1[0]), .Y(S[0]) );
  CLKINVX20TS U2 ( .A(n2), .Y(n1) );
  INVX20TS U3 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_154 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1, n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(n1), .B1(D1[0]), .Y(S[0]) );
  CLKINVX20TS U2 ( .A(n2), .Y(n1) );
  INVX20TS U3 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_153 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1, n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(n1), .B1(D1[0]), .Y(S[0]) );
  CLKINVX20TS U2 ( .A(n2), .Y(n1) );
  INVX20TS U3 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_152 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1, n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(n1), .B1(D1[0]), .Y(S[0]) );
  CLKINVX20TS U2 ( .A(n2), .Y(n1) );
  INVX20TS U3 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_151 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1, n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(n1), .B1(D1[0]), .Y(S[0]) );
  CLKINVX20TS U2 ( .A(n2), .Y(n1) );
  INVX20TS U3 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_150 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1, n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(n1), .B1(D1[0]), .Y(S[0]) );
  CLKINVX20TS U2 ( .A(n2), .Y(n1) );
  INVX20TS U3 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_149 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1, n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(n1), .B1(D1[0]), .Y(S[0]) );
  CLKINVX20TS U2 ( .A(n2), .Y(n1) );
  INVX20TS U3 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_148 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1, n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(n1), .B1(D1[0]), .Y(S[0]) );
  CLKINVX20TS U2 ( .A(n2), .Y(n1) );
  INVX20TS U3 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_147 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1, n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(n1), .B1(D1[0]), .Y(S[0]) );
  CLKINVX20TS U2 ( .A(n2), .Y(n1) );
  INVX20TS U3 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_146 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1, n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(n1), .B1(D1[0]), .Y(S[0]) );
  CLKINVX20TS U2 ( .A(n2), .Y(n1) );
  INVX20TS U3 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_145 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1, n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(n1), .B1(D1[0]), .Y(S[0]) );
  CLKINVX20TS U2 ( .A(n2), .Y(n1) );
  INVX20TS U3 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_144 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1, n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(n1), .B1(D1[0]), .Y(S[0]) );
  CLKINVX20TS U2 ( .A(n2), .Y(n1) );
  INVX20TS U3 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_143 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1, n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(n1), .B1(D1[0]), .Y(S[0]) );
  CLKINVX20TS U2 ( .A(n2), .Y(n1) );
  INVX20TS U3 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_142 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1, n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(n1), .B1(D1[0]), .Y(S[0]) );
  CLKINVX20TS U2 ( .A(n2), .Y(n1) );
  INVX20TS U3 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_141 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1, n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(n1), .B1(D1[0]), .Y(S[0]) );
  CLKINVX20TS U2 ( .A(n2), .Y(n1) );
  INVX20TS U3 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_140 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1, n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(n1), .B1(D1[0]), .Y(S[0]) );
  CLKINVX20TS U2 ( .A(n2), .Y(n1) );
  INVX20TS U3 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_139 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1, n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(n1), .B1(D1[0]), .Y(S[0]) );
  CLKINVX20TS U2 ( .A(n2), .Y(n1) );
  INVX20TS U3 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_138 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1, n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(n1), .B1(D1[0]), .Y(S[0]) );
  CLKINVX20TS U2 ( .A(n2), .Y(n1) );
  INVX20TS U3 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_137 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1, n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(n1), .B1(D1[0]), .Y(S[0]) );
  CLKINVX20TS U2 ( .A(n2), .Y(n1) );
  INVX20TS U3 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_136 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1, n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(n1), .B1(D1[0]), .Y(S[0]) );
  CLKINVX20TS U2 ( .A(n2), .Y(n1) );
  INVX20TS U3 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_135 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1, n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(n1), .B1(D1[0]), .Y(S[0]) );
  CLKINVX20TS U2 ( .A(n2), .Y(n1) );
  INVX20TS U3 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_134 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1, n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(n1), .B1(D1[0]), .Y(S[0]) );
  CLKINVX20TS U2 ( .A(n2), .Y(n1) );
  INVX20TS U3 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_133 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1, n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(n1), .B1(D1[0]), .Y(S[0]) );
  CLKINVX20TS U2 ( .A(n2), .Y(n1) );
  INVX20TS U3 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_132 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1, n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(n1), .B1(D1[0]), .Y(S[0]) );
  CLKINVX20TS U2 ( .A(n2), .Y(n1) );
  INVX20TS U3 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_131 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1, n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(n1), .B1(D1[0]), .Y(S[0]) );
  CLKINVX20TS U2 ( .A(n2), .Y(n1) );
  INVX20TS U3 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_130 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1, n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(n1), .B1(D1[0]), .Y(S[0]) );
  CLKINVX20TS U2 ( .A(n2), .Y(n1) );
  INVX20TS U3 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_129 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1, n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(n1), .B1(D1[0]), .Y(S[0]) );
  CLKINVX20TS U2 ( .A(n2), .Y(n1) );
  INVX20TS U3 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_128 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1, n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(n1), .B1(D1[0]), .Y(S[0]) );
  CLKINVX20TS U2 ( .A(n2), .Y(n1) );
  INVX20TS U3 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_127 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1, n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(n1), .B1(D1[0]), .Y(S[0]) );
  CLKINVX20TS U2 ( .A(n2), .Y(n1) );
  INVX20TS U3 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_126 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1, n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(n1), .B1(D1[0]), .Y(S[0]) );
  CLKINVX20TS U2 ( .A(n2), .Y(n1) );
  INVX20TS U3 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_125 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1, n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(n1), .B1(D1[0]), .Y(S[0]) );
  CLKINVX20TS U2 ( .A(n2), .Y(n1) );
  INVX20TS U3 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_124 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1, n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(n1), .B1(D1[0]), .Y(S[0]) );
  CLKINVX20TS U2 ( .A(n2), .Y(n1) );
  INVX20TS U3 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_123 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1, n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(n1), .B1(D1[0]), .Y(S[0]) );
  CLKINVX20TS U2 ( .A(n2), .Y(n1) );
  INVX20TS U3 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_122 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1, n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(n1), .B1(D1[0]), .Y(S[0]) );
  CLKINVX20TS U2 ( .A(n2), .Y(n1) );
  INVX20TS U3 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_121 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1, n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(n1), .B1(D1[0]), .Y(S[0]) );
  CLKINVX20TS U2 ( .A(n2), .Y(n1) );
  INVX20TS U3 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_120 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1, n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(n1), .B1(D1[0]), .Y(S[0]) );
  CLKINVX20TS U2 ( .A(n2), .Y(n1) );
  INVX20TS U3 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_119 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1, n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(n1), .B1(D1[0]), .Y(S[0]) );
  CLKINVX20TS U2 ( .A(n2), .Y(n1) );
  INVX20TS U3 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_118 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1, n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(n1), .B1(D1[0]), .Y(S[0]) );
  CLKINVX20TS U2 ( .A(n2), .Y(n1) );
  INVX20TS U3 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_117 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1, n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(n1), .B1(D1[0]), .Y(S[0]) );
  CLKINVX20TS U2 ( .A(n2), .Y(n1) );
  INVX20TS U3 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_116 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1, n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(n1), .B1(D1[0]), .Y(S[0]) );
  CLKINVX20TS U2 ( .A(n2), .Y(n1) );
  INVX20TS U3 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_115 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1, n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(n1), .B1(D1[0]), .Y(S[0]) );
  CLKINVX20TS U2 ( .A(n2), .Y(n1) );
  INVX20TS U3 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_114 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1, n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(n1), .B1(D1[0]), .Y(S[0]) );
  CLKINVX20TS U2 ( .A(n2), .Y(n1) );
  INVX20TS U3 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_113 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1, n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(n1), .B1(D1[0]), .Y(S[0]) );
  CLKINVX20TS U2 ( .A(n2), .Y(n1) );
  INVX20TS U3 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_112 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1, n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(n1), .B1(D1[0]), .Y(S[0]) );
  CLKINVX20TS U2 ( .A(n2), .Y(n1) );
  INVX20TS U3 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_111 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1, n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(n1), .B1(D1[0]), .Y(S[0]) );
  CLKINVX20TS U2 ( .A(n2), .Y(n1) );
  INVX20TS U3 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_110 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1, n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(n1), .B1(D1[0]), .Y(S[0]) );
  CLKINVX20TS U2 ( .A(n2), .Y(n1) );
  INVX20TS U3 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_109 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1, n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(n1), .B1(D1[0]), .Y(S[0]) );
  CLKINVX20TS U2 ( .A(n2), .Y(n1) );
  INVX20TS U3 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_108 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1, n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(n1), .B1(D1[0]), .Y(S[0]) );
  CLKINVX20TS U2 ( .A(n2), .Y(n1) );
  INVX20TS U3 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_107 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1, n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(n1), .B1(D1[0]), .Y(S[0]) );
  CLKINVX20TS U2 ( .A(n2), .Y(n1) );
  INVX20TS U3 ( .A(ctrl), .Y(n2) );
endmodule


module Rotate_Mux_Array_SWR55_0 ( Data_i, select_i, Data_o );
  input [54:0] Data_i;
  output [54:0] Data_o;
  input select_i;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9;
  assign Data_o[27] = Data_i[27];

  Multiplexer_AC_W1_160 MUX_ARRAY_0__MUX_ARRAY12_rotate_mux ( .ctrl(n1), .D0(
        Data_i[0]), .D1(Data_i[54]), .S(Data_o[0]) );
  Multiplexer_AC_W1_159 MUX_ARRAY_1__MUX_ARRAY12_rotate_mux ( .ctrl(n1), .D0(
        Data_i[1]), .D1(Data_i[53]), .S(Data_o[1]) );
  Multiplexer_AC_W1_158 MUX_ARRAY_2__MUX_ARRAY12_rotate_mux ( .ctrl(n1), .D0(
        Data_i[2]), .D1(Data_i[52]), .S(Data_o[2]) );
  Multiplexer_AC_W1_157 MUX_ARRAY_3__MUX_ARRAY12_rotate_mux ( .ctrl(n1), .D0(
        Data_i[3]), .D1(Data_i[51]), .S(Data_o[3]) );
  Multiplexer_AC_W1_156 MUX_ARRAY_4__MUX_ARRAY12_rotate_mux ( .ctrl(n1), .D0(
        Data_i[4]), .D1(Data_i[50]), .S(Data_o[4]) );
  Multiplexer_AC_W1_155 MUX_ARRAY_5__MUX_ARRAY12_rotate_mux ( .ctrl(n1), .D0(
        Data_i[5]), .D1(Data_i[49]), .S(Data_o[5]) );
  Multiplexer_AC_W1_154 MUX_ARRAY_6__MUX_ARRAY12_rotate_mux ( .ctrl(n1), .D0(
        Data_i[6]), .D1(Data_i[48]), .S(Data_o[6]) );
  Multiplexer_AC_W1_153 MUX_ARRAY_7__MUX_ARRAY12_rotate_mux ( .ctrl(n1), .D0(
        Data_i[7]), .D1(Data_i[47]), .S(Data_o[7]) );
  Multiplexer_AC_W1_152 MUX_ARRAY_8__MUX_ARRAY12_rotate_mux ( .ctrl(n1), .D0(
        Data_i[8]), .D1(Data_i[46]), .S(Data_o[8]) );
  Multiplexer_AC_W1_151 MUX_ARRAY_9__MUX_ARRAY12_rotate_mux ( .ctrl(n1), .D0(
        Data_i[9]), .D1(Data_i[45]), .S(Data_o[9]) );
  Multiplexer_AC_W1_150 MUX_ARRAY_10__MUX_ARRAY12_rotate_mux ( .ctrl(n2), .D0(
        Data_i[10]), .D1(Data_i[44]), .S(Data_o[10]) );
  Multiplexer_AC_W1_149 MUX_ARRAY_11__MUX_ARRAY12_rotate_mux ( .ctrl(n2), .D0(
        Data_i[11]), .D1(Data_i[43]), .S(Data_o[11]) );
  Multiplexer_AC_W1_148 MUX_ARRAY_12__MUX_ARRAY12_rotate_mux ( .ctrl(n2), .D0(
        Data_i[12]), .D1(Data_i[42]), .S(Data_o[12]) );
  Multiplexer_AC_W1_147 MUX_ARRAY_13__MUX_ARRAY12_rotate_mux ( .ctrl(n2), .D0(
        Data_i[13]), .D1(Data_i[41]), .S(Data_o[13]) );
  Multiplexer_AC_W1_146 MUX_ARRAY_14__MUX_ARRAY12_rotate_mux ( .ctrl(n2), .D0(
        Data_i[14]), .D1(Data_i[40]), .S(Data_o[14]) );
  Multiplexer_AC_W1_145 MUX_ARRAY_15__MUX_ARRAY12_rotate_mux ( .ctrl(n2), .D0(
        Data_i[15]), .D1(Data_i[39]), .S(Data_o[15]) );
  Multiplexer_AC_W1_144 MUX_ARRAY_16__MUX_ARRAY12_rotate_mux ( .ctrl(n2), .D0(
        Data_i[16]), .D1(Data_i[38]), .S(Data_o[16]) );
  Multiplexer_AC_W1_143 MUX_ARRAY_17__MUX_ARRAY12_rotate_mux ( .ctrl(n2), .D0(
        Data_i[17]), .D1(Data_i[37]), .S(Data_o[17]) );
  Multiplexer_AC_W1_142 MUX_ARRAY_18__MUX_ARRAY12_rotate_mux ( .ctrl(n2), .D0(
        Data_i[18]), .D1(Data_i[36]), .S(Data_o[18]) );
  Multiplexer_AC_W1_141 MUX_ARRAY_19__MUX_ARRAY12_rotate_mux ( .ctrl(n2), .D0(
        Data_i[19]), .D1(Data_i[35]), .S(Data_o[19]) );
  Multiplexer_AC_W1_140 MUX_ARRAY_20__MUX_ARRAY12_rotate_mux ( .ctrl(n3), .D0(
        Data_i[20]), .D1(Data_i[34]), .S(Data_o[20]) );
  Multiplexer_AC_W1_139 MUX_ARRAY_21__MUX_ARRAY12_rotate_mux ( .ctrl(n3), .D0(
        Data_i[21]), .D1(Data_i[33]), .S(Data_o[21]) );
  Multiplexer_AC_W1_138 MUX_ARRAY_22__MUX_ARRAY12_rotate_mux ( .ctrl(n3), .D0(
        Data_i[22]), .D1(Data_i[32]), .S(Data_o[22]) );
  Multiplexer_AC_W1_137 MUX_ARRAY_23__MUX_ARRAY12_rotate_mux ( .ctrl(n3), .D0(
        Data_i[23]), .D1(Data_i[31]), .S(Data_o[23]) );
  Multiplexer_AC_W1_136 MUX_ARRAY_24__MUX_ARRAY12_rotate_mux ( .ctrl(n3), .D0(
        Data_i[24]), .D1(Data_i[30]), .S(Data_o[24]) );
  Multiplexer_AC_W1_135 MUX_ARRAY_25__MUX_ARRAY12_rotate_mux ( .ctrl(n3), .D0(
        Data_i[25]), .D1(Data_i[29]), .S(Data_o[25]) );
  Multiplexer_AC_W1_134 MUX_ARRAY_26__MUX_ARRAY12_rotate_mux ( .ctrl(n3), .D0(
        Data_i[26]), .D1(Data_i[28]), .S(Data_o[26]) );
  Multiplexer_AC_W1_133 MUX_ARRAY_28__MUX_ARRAY12_rotate_mux ( .ctrl(n3), .D0(
        Data_i[28]), .D1(Data_i[26]), .S(Data_o[28]) );
  Multiplexer_AC_W1_132 MUX_ARRAY_29__MUX_ARRAY12_rotate_mux ( .ctrl(n3), .D0(
        Data_i[29]), .D1(Data_i[25]), .S(Data_o[29]) );
  Multiplexer_AC_W1_131 MUX_ARRAY_30__MUX_ARRAY12_rotate_mux ( .ctrl(n3), .D0(
        Data_i[30]), .D1(Data_i[24]), .S(Data_o[30]) );
  Multiplexer_AC_W1_130 MUX_ARRAY_31__MUX_ARRAY12_rotate_mux ( .ctrl(n4), .D0(
        Data_i[31]), .D1(Data_i[23]), .S(Data_o[31]) );
  Multiplexer_AC_W1_129 MUX_ARRAY_32__MUX_ARRAY12_rotate_mux ( .ctrl(n4), .D0(
        Data_i[32]), .D1(Data_i[22]), .S(Data_o[32]) );
  Multiplexer_AC_W1_128 MUX_ARRAY_33__MUX_ARRAY12_rotate_mux ( .ctrl(n4), .D0(
        Data_i[33]), .D1(Data_i[21]), .S(Data_o[33]) );
  Multiplexer_AC_W1_127 MUX_ARRAY_34__MUX_ARRAY12_rotate_mux ( .ctrl(n4), .D0(
        Data_i[34]), .D1(Data_i[20]), .S(Data_o[34]) );
  Multiplexer_AC_W1_126 MUX_ARRAY_35__MUX_ARRAY12_rotate_mux ( .ctrl(n4), .D0(
        Data_i[35]), .D1(Data_i[19]), .S(Data_o[35]) );
  Multiplexer_AC_W1_125 MUX_ARRAY_36__MUX_ARRAY12_rotate_mux ( .ctrl(n4), .D0(
        Data_i[36]), .D1(Data_i[18]), .S(Data_o[36]) );
  Multiplexer_AC_W1_124 MUX_ARRAY_37__MUX_ARRAY12_rotate_mux ( .ctrl(n4), .D0(
        Data_i[37]), .D1(Data_i[17]), .S(Data_o[37]) );
  Multiplexer_AC_W1_123 MUX_ARRAY_38__MUX_ARRAY12_rotate_mux ( .ctrl(n4), .D0(
        Data_i[38]), .D1(Data_i[16]), .S(Data_o[38]) );
  Multiplexer_AC_W1_122 MUX_ARRAY_39__MUX_ARRAY12_rotate_mux ( .ctrl(n4), .D0(
        Data_i[39]), .D1(Data_i[15]), .S(Data_o[39]) );
  Multiplexer_AC_W1_121 MUX_ARRAY_40__MUX_ARRAY12_rotate_mux ( .ctrl(n4), .D0(
        Data_i[40]), .D1(Data_i[14]), .S(Data_o[40]) );
  Multiplexer_AC_W1_120 MUX_ARRAY_41__MUX_ARRAY12_rotate_mux ( .ctrl(n5), .D0(
        Data_i[41]), .D1(Data_i[13]), .S(Data_o[41]) );
  Multiplexer_AC_W1_119 MUX_ARRAY_42__MUX_ARRAY12_rotate_mux ( .ctrl(n5), .D0(
        Data_i[42]), .D1(Data_i[12]), .S(Data_o[42]) );
  Multiplexer_AC_W1_118 MUX_ARRAY_43__MUX_ARRAY12_rotate_mux ( .ctrl(n5), .D0(
        Data_i[43]), .D1(Data_i[11]), .S(Data_o[43]) );
  Multiplexer_AC_W1_117 MUX_ARRAY_44__MUX_ARRAY12_rotate_mux ( .ctrl(n5), .D0(
        Data_i[44]), .D1(Data_i[10]), .S(Data_o[44]) );
  Multiplexer_AC_W1_116 MUX_ARRAY_45__MUX_ARRAY12_rotate_mux ( .ctrl(n5), .D0(
        Data_i[45]), .D1(Data_i[9]), .S(Data_o[45]) );
  Multiplexer_AC_W1_115 MUX_ARRAY_46__MUX_ARRAY12_rotate_mux ( .ctrl(n5), .D0(
        Data_i[46]), .D1(Data_i[8]), .S(Data_o[46]) );
  Multiplexer_AC_W1_114 MUX_ARRAY_47__MUX_ARRAY12_rotate_mux ( .ctrl(n5), .D0(
        Data_i[47]), .D1(Data_i[7]), .S(Data_o[47]) );
  Multiplexer_AC_W1_113 MUX_ARRAY_48__MUX_ARRAY12_rotate_mux ( .ctrl(n5), .D0(
        Data_i[48]), .D1(Data_i[6]), .S(Data_o[48]) );
  Multiplexer_AC_W1_112 MUX_ARRAY_49__MUX_ARRAY12_rotate_mux ( .ctrl(n5), .D0(
        Data_i[49]), .D1(Data_i[5]), .S(Data_o[49]) );
  Multiplexer_AC_W1_111 MUX_ARRAY_50__MUX_ARRAY12_rotate_mux ( .ctrl(n5), .D0(
        Data_i[50]), .D1(Data_i[4]), .S(Data_o[50]) );
  Multiplexer_AC_W1_110 MUX_ARRAY_51__MUX_ARRAY12_rotate_mux ( .ctrl(n6), .D0(
        Data_i[51]), .D1(Data_i[3]), .S(Data_o[51]) );
  Multiplexer_AC_W1_109 MUX_ARRAY_52__MUX_ARRAY12_rotate_mux ( .ctrl(n6), .D0(
        Data_i[52]), .D1(Data_i[2]), .S(Data_o[52]) );
  Multiplexer_AC_W1_108 MUX_ARRAY_53__MUX_ARRAY12_rotate_mux ( .ctrl(n6), .D0(
        Data_i[53]), .D1(Data_i[1]), .S(Data_o[53]) );
  Multiplexer_AC_W1_107 MUX_ARRAY_54__MUX_ARRAY12_rotate_mux ( .ctrl(n6), .D0(
        Data_i[54]), .D1(Data_i[0]), .S(Data_o[54]) );
  BUFX20TS U1 ( .A(n9), .Y(n1) );
  BUFX20TS U2 ( .A(n9), .Y(n2) );
  BUFX20TS U3 ( .A(n8), .Y(n3) );
  BUFX20TS U4 ( .A(n8), .Y(n4) );
  BUFX20TS U5 ( .A(n7), .Y(n5) );
  BUFX20TS U6 ( .A(n7), .Y(n6) );
  CLKBUFX20TS U7 ( .A(select_i), .Y(n7) );
  CLKBUFX20TS U8 ( .A(select_i), .Y(n8) );
  CLKBUFX20TS U9 ( .A(select_i), .Y(n9) );
endmodule


module shift_mux_array_SWR55_LEVEL0 ( Data_i, select_i, bit_shift_i, Data_o );
  input [54:0] Data_i;
  output [54:0] Data_o;
  input select_i, bit_shift_i;
  wire   n1;

  AO22X1TS U1 ( .A0(Data_i[10]), .A1(select_i), .B0(n1), .B1(Data_i[9]), .Y(
        Data_o[9]) );
  AO22X1TS U2 ( .A0(select_i), .A1(Data_i[9]), .B0(n1), .B1(Data_i[8]), .Y(
        Data_o[8]) );
  AO22X1TS U3 ( .A0(select_i), .A1(Data_i[8]), .B0(n1), .B1(Data_i[7]), .Y(
        Data_o[7]) );
  AO22X1TS U4 ( .A0(select_i), .A1(Data_i[7]), .B0(n1), .B1(Data_i[6]), .Y(
        Data_o[6]) );
  AO22X1TS U5 ( .A0(select_i), .A1(Data_i[6]), .B0(n1), .B1(Data_i[5]), .Y(
        Data_o[5]) );
  AO22X1TS U6 ( .A0(n1), .A1(Data_i[54]), .B0(bit_shift_i), .B1(select_i), .Y(
        Data_o[54]) );
  AO22X1TS U7 ( .A0(n1), .A1(Data_i[53]), .B0(select_i), .B1(Data_i[54]), .Y(
        Data_o[53]) );
  AO22X1TS U8 ( .A0(n1), .A1(Data_i[52]), .B0(select_i), .B1(Data_i[53]), .Y(
        Data_o[52]) );
  AO22X1TS U9 ( .A0(n1), .A1(Data_i[51]), .B0(select_i), .B1(Data_i[52]), .Y(
        Data_o[51]) );
  AO22X1TS U10 ( .A0(n1), .A1(Data_i[50]), .B0(select_i), .B1(Data_i[51]), .Y(
        Data_o[50]) );
  AO22X1TS U11 ( .A0(select_i), .A1(Data_i[5]), .B0(n1), .B1(Data_i[4]), .Y(
        Data_o[4]) );
  AO22X1TS U12 ( .A0(n1), .A1(Data_i[49]), .B0(select_i), .B1(Data_i[50]), .Y(
        Data_o[49]) );
  AO22X1TS U13 ( .A0(n1), .A1(Data_i[48]), .B0(select_i), .B1(Data_i[49]), .Y(
        Data_o[48]) );
  AO22X1TS U14 ( .A0(n1), .A1(Data_i[47]), .B0(select_i), .B1(Data_i[48]), .Y(
        Data_o[47]) );
  AO22X1TS U15 ( .A0(n1), .A1(Data_i[46]), .B0(select_i), .B1(Data_i[47]), .Y(
        Data_o[46]) );
  AO22X1TS U16 ( .A0(n1), .A1(Data_i[45]), .B0(select_i), .B1(Data_i[46]), .Y(
        Data_o[45]) );
  AO22X1TS U17 ( .A0(n1), .A1(Data_i[44]), .B0(select_i), .B1(Data_i[45]), .Y(
        Data_o[44]) );
  AO22X1TS U18 ( .A0(n1), .A1(Data_i[43]), .B0(select_i), .B1(Data_i[44]), .Y(
        Data_o[43]) );
  AO22X1TS U19 ( .A0(n1), .A1(Data_i[42]), .B0(select_i), .B1(Data_i[43]), .Y(
        Data_o[42]) );
  AO22X1TS U20 ( .A0(n1), .A1(Data_i[41]), .B0(select_i), .B1(Data_i[42]), .Y(
        Data_o[41]) );
  AO22X1TS U21 ( .A0(n1), .A1(Data_i[40]), .B0(select_i), .B1(Data_i[41]), .Y(
        Data_o[40]) );
  AO22X1TS U22 ( .A0(select_i), .A1(Data_i[4]), .B0(n1), .B1(Data_i[3]), .Y(
        Data_o[3]) );
  AO22X1TS U23 ( .A0(n1), .A1(Data_i[39]), .B0(select_i), .B1(Data_i[40]), .Y(
        Data_o[39]) );
  AO22X1TS U24 ( .A0(n1), .A1(Data_i[38]), .B0(select_i), .B1(Data_i[39]), .Y(
        Data_o[38]) );
  AO22X1TS U25 ( .A0(n1), .A1(Data_i[37]), .B0(select_i), .B1(Data_i[38]), .Y(
        Data_o[37]) );
  AO22X1TS U26 ( .A0(n1), .A1(Data_i[36]), .B0(select_i), .B1(Data_i[37]), .Y(
        Data_o[36]) );
  AO22X1TS U27 ( .A0(n1), .A1(Data_i[35]), .B0(select_i), .B1(Data_i[36]), .Y(
        Data_o[35]) );
  AO22X1TS U28 ( .A0(n1), .A1(Data_i[34]), .B0(select_i), .B1(Data_i[35]), .Y(
        Data_o[34]) );
  AO22X1TS U29 ( .A0(n1), .A1(Data_i[33]), .B0(select_i), .B1(Data_i[34]), .Y(
        Data_o[33]) );
  AO22X1TS U30 ( .A0(n1), .A1(Data_i[32]), .B0(select_i), .B1(Data_i[33]), .Y(
        Data_o[32]) );
  AO22X1TS U31 ( .A0(n1), .A1(Data_i[31]), .B0(select_i), .B1(Data_i[32]), .Y(
        Data_o[31]) );
  AO22X1TS U32 ( .A0(n1), .A1(Data_i[30]), .B0(select_i), .B1(Data_i[31]), .Y(
        Data_o[30]) );
  AO22X1TS U33 ( .A0(select_i), .A1(Data_i[3]), .B0(n1), .B1(Data_i[2]), .Y(
        Data_o[2]) );
  AO22X1TS U34 ( .A0(n1), .A1(Data_i[29]), .B0(select_i), .B1(Data_i[30]), .Y(
        Data_o[29]) );
  AO22X1TS U35 ( .A0(n1), .A1(Data_i[28]), .B0(select_i), .B1(Data_i[29]), .Y(
        Data_o[28]) );
  AO22X1TS U36 ( .A0(n1), .A1(Data_i[27]), .B0(select_i), .B1(Data_i[28]), .Y(
        Data_o[27]) );
  AO22X1TS U37 ( .A0(n1), .A1(Data_i[26]), .B0(select_i), .B1(Data_i[27]), .Y(
        Data_o[26]) );
  AO22X1TS U38 ( .A0(n1), .A1(Data_i[25]), .B0(select_i), .B1(Data_i[26]), .Y(
        Data_o[25]) );
  AO22X1TS U39 ( .A0(n1), .A1(Data_i[24]), .B0(select_i), .B1(Data_i[25]), .Y(
        Data_o[24]) );
  AO22X1TS U40 ( .A0(n1), .A1(Data_i[23]), .B0(select_i), .B1(Data_i[24]), .Y(
        Data_o[23]) );
  AO22X1TS U41 ( .A0(n1), .A1(Data_i[22]), .B0(select_i), .B1(Data_i[23]), .Y(
        Data_o[22]) );
  AO22X1TS U42 ( .A0(n1), .A1(Data_i[21]), .B0(select_i), .B1(Data_i[22]), .Y(
        Data_o[21]) );
  AO22X1TS U43 ( .A0(n1), .A1(Data_i[20]), .B0(select_i), .B1(Data_i[21]), .Y(
        Data_o[20]) );
  AO22X1TS U44 ( .A0(select_i), .A1(Data_i[2]), .B0(n1), .B1(Data_i[1]), .Y(
        Data_o[1]) );
  AO22X1TS U45 ( .A0(n1), .A1(Data_i[19]), .B0(select_i), .B1(Data_i[20]), .Y(
        Data_o[19]) );
  AO22X1TS U46 ( .A0(select_i), .A1(Data_i[19]), .B0(n1), .B1(Data_i[18]), .Y(
        Data_o[18]) );
  AO22X1TS U47 ( .A0(select_i), .A1(Data_i[18]), .B0(n1), .B1(Data_i[17]), .Y(
        Data_o[17]) );
  AO22X1TS U48 ( .A0(select_i), .A1(Data_i[17]), .B0(n1), .B1(Data_i[16]), .Y(
        Data_o[16]) );
  AO22X1TS U49 ( .A0(select_i), .A1(Data_i[16]), .B0(n1), .B1(Data_i[15]), .Y(
        Data_o[15]) );
  AO22X1TS U50 ( .A0(select_i), .A1(Data_i[15]), .B0(n1), .B1(Data_i[14]), .Y(
        Data_o[14]) );
  AO22X1TS U51 ( .A0(select_i), .A1(Data_i[14]), .B0(n1), .B1(Data_i[13]), .Y(
        Data_o[13]) );
  AO22X1TS U52 ( .A0(select_i), .A1(Data_i[13]), .B0(n1), .B1(Data_i[12]), .Y(
        Data_o[12]) );
  AO22X1TS U53 ( .A0(select_i), .A1(Data_i[12]), .B0(n1), .B1(Data_i[11]), .Y(
        Data_o[11]) );
  AO22X1TS U54 ( .A0(select_i), .A1(Data_i[11]), .B0(n1), .B1(Data_i[10]), .Y(
        Data_o[10]) );
  AO22X1TS U55 ( .A0(select_i), .A1(Data_i[1]), .B0(Data_i[0]), .B1(n1), .Y(
        Data_o[0]) );
  CLKINVX1TS U56 ( .A(select_i), .Y(n1) );
endmodule


module shift_mux_array_SWR55_LEVEL1 ( Data_i, select_i, bit_shift_i, Data_o );
  input [54:0] Data_i;
  output [54:0] Data_o;
  input select_i, bit_shift_i;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53;

  OAI22X1TS U1 ( .A0(select_i), .A1(n1), .B0(n2), .B1(n3), .Y(Data_o[9]) );
  OAI22X1TS U2 ( .A0(select_i), .A1(n4), .B0(n3), .B1(n5), .Y(Data_o[8]) );
  OAI22X1TS U3 ( .A0(n3), .A1(n1), .B0(select_i), .B1(n6), .Y(Data_o[7]) );
  CLKINVX1TS U4 ( .A(Data_i[9]), .Y(n1) );
  OAI22X1TS U5 ( .A0(n3), .A1(n4), .B0(select_i), .B1(n7), .Y(Data_o[6]) );
  CLKINVX1TS U6 ( .A(Data_i[8]), .Y(n4) );
  OAI22X1TS U7 ( .A0(n3), .A1(n6), .B0(select_i), .B1(n8), .Y(Data_o[5]) );
  CLKINVX1TS U8 ( .A(Data_i[5]), .Y(n8) );
  CLKINVX1TS U9 ( .A(Data_i[7]), .Y(n6) );
  OAI22X1TS U10 ( .A0(n3), .A1(n9), .B0(select_i), .B1(n10), .Y(Data_o[54]) );
  OAI22X1TS U11 ( .A0(n3), .A1(n9), .B0(select_i), .B1(n11), .Y(Data_o[53]) );
  CLKINVX1TS U12 ( .A(bit_shift_i), .Y(n9) );
  OAI22X1TS U13 ( .A0(n3), .A1(n10), .B0(select_i), .B1(n12), .Y(Data_o[52])
         );
  CLKINVX1TS U14 ( .A(Data_i[54]), .Y(n10) );
  OAI22X1TS U15 ( .A0(n3), .A1(n11), .B0(select_i), .B1(n13), .Y(Data_o[51])
         );
  CLKINVX1TS U16 ( .A(Data_i[53]), .Y(n11) );
  OAI22X1TS U17 ( .A0(n3), .A1(n12), .B0(select_i), .B1(n14), .Y(Data_o[50])
         );
  CLKINVX1TS U18 ( .A(Data_i[52]), .Y(n12) );
  OAI22X1TS U19 ( .A0(n3), .A1(n7), .B0(select_i), .B1(n15), .Y(Data_o[4]) );
  CLKINVX1TS U20 ( .A(Data_i[4]), .Y(n15) );
  CLKINVX1TS U21 ( .A(Data_i[6]), .Y(n7) );
  OAI22X1TS U22 ( .A0(n3), .A1(n13), .B0(select_i), .B1(n16), .Y(Data_o[49])
         );
  CLKINVX1TS U23 ( .A(Data_i[51]), .Y(n13) );
  OAI22X1TS U24 ( .A0(n3), .A1(n14), .B0(select_i), .B1(n17), .Y(Data_o[48])
         );
  CLKINVX1TS U25 ( .A(Data_i[50]), .Y(n14) );
  OAI22X1TS U26 ( .A0(n3), .A1(n16), .B0(select_i), .B1(n18), .Y(Data_o[47])
         );
  CLKINVX1TS U27 ( .A(Data_i[49]), .Y(n16) );
  OAI22X1TS U28 ( .A0(n3), .A1(n17), .B0(select_i), .B1(n19), .Y(Data_o[46])
         );
  CLKINVX1TS U29 ( .A(Data_i[48]), .Y(n17) );
  OAI22X1TS U30 ( .A0(n3), .A1(n18), .B0(select_i), .B1(n20), .Y(Data_o[45])
         );
  CLKINVX1TS U31 ( .A(Data_i[47]), .Y(n18) );
  OAI22X1TS U32 ( .A0(n3), .A1(n19), .B0(select_i), .B1(n21), .Y(Data_o[44])
         );
  CLKINVX1TS U33 ( .A(Data_i[46]), .Y(n19) );
  OAI22X1TS U34 ( .A0(n3), .A1(n20), .B0(select_i), .B1(n22), .Y(Data_o[43])
         );
  CLKINVX1TS U35 ( .A(Data_i[45]), .Y(n20) );
  OAI22X1TS U36 ( .A0(n3), .A1(n21), .B0(select_i), .B1(n23), .Y(Data_o[42])
         );
  CLKINVX1TS U37 ( .A(Data_i[44]), .Y(n21) );
  OAI22X1TS U38 ( .A0(n3), .A1(n22), .B0(select_i), .B1(n24), .Y(Data_o[41])
         );
  CLKINVX1TS U39 ( .A(Data_i[43]), .Y(n22) );
  OAI22X1TS U40 ( .A0(n3), .A1(n23), .B0(select_i), .B1(n25), .Y(Data_o[40])
         );
  CLKINVX1TS U41 ( .A(Data_i[42]), .Y(n23) );
  AO22X1TS U42 ( .A0(select_i), .A1(Data_i[5]), .B0(n3), .B1(Data_i[3]), .Y(
        Data_o[3]) );
  OAI22X1TS U43 ( .A0(n3), .A1(n24), .B0(select_i), .B1(n26), .Y(Data_o[39])
         );
  CLKINVX1TS U44 ( .A(Data_i[41]), .Y(n24) );
  OAI22X1TS U45 ( .A0(n3), .A1(n25), .B0(select_i), .B1(n27), .Y(Data_o[38])
         );
  CLKINVX1TS U46 ( .A(Data_i[40]), .Y(n25) );
  OAI22X1TS U47 ( .A0(n3), .A1(n26), .B0(select_i), .B1(n28), .Y(Data_o[37])
         );
  CLKINVX1TS U48 ( .A(Data_i[39]), .Y(n26) );
  OAI22X1TS U49 ( .A0(n3), .A1(n27), .B0(select_i), .B1(n29), .Y(Data_o[36])
         );
  CLKINVX1TS U50 ( .A(Data_i[38]), .Y(n27) );
  OAI22X1TS U51 ( .A0(n3), .A1(n28), .B0(select_i), .B1(n30), .Y(Data_o[35])
         );
  CLKINVX1TS U52 ( .A(Data_i[37]), .Y(n28) );
  OAI22X1TS U53 ( .A0(n3), .A1(n29), .B0(select_i), .B1(n31), .Y(Data_o[34])
         );
  CLKINVX1TS U54 ( .A(Data_i[36]), .Y(n29) );
  OAI22X1TS U55 ( .A0(n3), .A1(n30), .B0(select_i), .B1(n32), .Y(Data_o[33])
         );
  CLKINVX1TS U56 ( .A(Data_i[35]), .Y(n30) );
  OAI22X1TS U57 ( .A0(n3), .A1(n31), .B0(select_i), .B1(n33), .Y(Data_o[32])
         );
  CLKINVX1TS U58 ( .A(Data_i[34]), .Y(n31) );
  OAI22X1TS U59 ( .A0(n3), .A1(n32), .B0(select_i), .B1(n34), .Y(Data_o[31])
         );
  CLKINVX1TS U60 ( .A(Data_i[33]), .Y(n32) );
  OAI22X1TS U61 ( .A0(n3), .A1(n33), .B0(select_i), .B1(n35), .Y(Data_o[30])
         );
  CLKINVX1TS U62 ( .A(Data_i[32]), .Y(n33) );
  AO22X1TS U63 ( .A0(select_i), .A1(Data_i[4]), .B0(n3), .B1(Data_i[2]), .Y(
        Data_o[2]) );
  OAI22X1TS U64 ( .A0(n3), .A1(n34), .B0(select_i), .B1(n36), .Y(Data_o[29])
         );
  CLKINVX1TS U65 ( .A(Data_i[31]), .Y(n34) );
  OAI22X1TS U66 ( .A0(n3), .A1(n35), .B0(select_i), .B1(n37), .Y(Data_o[28])
         );
  CLKINVX1TS U67 ( .A(Data_i[30]), .Y(n35) );
  OAI22X1TS U68 ( .A0(n3), .A1(n36), .B0(select_i), .B1(n38), .Y(Data_o[27])
         );
  CLKINVX1TS U69 ( .A(Data_i[29]), .Y(n36) );
  OAI22X1TS U70 ( .A0(n3), .A1(n37), .B0(select_i), .B1(n39), .Y(Data_o[26])
         );
  CLKINVX1TS U71 ( .A(Data_i[28]), .Y(n37) );
  OAI22X1TS U72 ( .A0(n3), .A1(n38), .B0(select_i), .B1(n40), .Y(Data_o[25])
         );
  CLKINVX1TS U73 ( .A(Data_i[27]), .Y(n38) );
  OAI22X1TS U74 ( .A0(n3), .A1(n39), .B0(select_i), .B1(n41), .Y(Data_o[24])
         );
  CLKINVX1TS U75 ( .A(Data_i[26]), .Y(n39) );
  OAI22X1TS U76 ( .A0(n3), .A1(n40), .B0(select_i), .B1(n42), .Y(Data_o[23])
         );
  CLKINVX1TS U77 ( .A(Data_i[25]), .Y(n40) );
  OAI22X1TS U78 ( .A0(n3), .A1(n41), .B0(select_i), .B1(n43), .Y(Data_o[22])
         );
  CLKINVX1TS U79 ( .A(Data_i[24]), .Y(n41) );
  OAI22X1TS U80 ( .A0(n3), .A1(n42), .B0(select_i), .B1(n44), .Y(Data_o[21])
         );
  CLKINVX1TS U81 ( .A(Data_i[23]), .Y(n42) );
  OAI22X1TS U82 ( .A0(n3), .A1(n43), .B0(select_i), .B1(n45), .Y(Data_o[20])
         );
  CLKINVX1TS U83 ( .A(Data_i[22]), .Y(n43) );
  AO22X1TS U84 ( .A0(select_i), .A1(Data_i[3]), .B0(Data_i[1]), .B1(n3), .Y(
        Data_o[1]) );
  OAI22X1TS U85 ( .A0(n3), .A1(n44), .B0(select_i), .B1(n46), .Y(Data_o[19])
         );
  CLKINVX1TS U86 ( .A(Data_i[21]), .Y(n44) );
  OAI22X1TS U87 ( .A0(n3), .A1(n45), .B0(select_i), .B1(n47), .Y(Data_o[18])
         );
  CLKINVX1TS U88 ( .A(Data_i[20]), .Y(n45) );
  OAI22X1TS U89 ( .A0(n3), .A1(n46), .B0(select_i), .B1(n48), .Y(Data_o[17])
         );
  CLKINVX1TS U90 ( .A(Data_i[19]), .Y(n46) );
  OAI22X1TS U91 ( .A0(n3), .A1(n47), .B0(select_i), .B1(n49), .Y(Data_o[16])
         );
  CLKINVX1TS U92 ( .A(Data_i[18]), .Y(n47) );
  OAI22X1TS U93 ( .A0(n3), .A1(n48), .B0(select_i), .B1(n50), .Y(Data_o[15])
         );
  CLKINVX1TS U94 ( .A(Data_i[17]), .Y(n48) );
  OAI22X1TS U95 ( .A0(n3), .A1(n49), .B0(select_i), .B1(n51), .Y(Data_o[14])
         );
  CLKINVX1TS U96 ( .A(Data_i[16]), .Y(n49) );
  OAI22X1TS U97 ( .A0(n3), .A1(n50), .B0(select_i), .B1(n52), .Y(Data_o[13])
         );
  CLKINVX1TS U98 ( .A(Data_i[15]), .Y(n50) );
  OAI22X1TS U99 ( .A0(n3), .A1(n51), .B0(select_i), .B1(n53), .Y(Data_o[12])
         );
  CLKINVX1TS U100 ( .A(Data_i[14]), .Y(n51) );
  OAI22X1TS U101 ( .A0(n3), .A1(n52), .B0(select_i), .B1(n2), .Y(Data_o[11])
         );
  CLKINVX1TS U102 ( .A(Data_i[11]), .Y(n2) );
  CLKINVX1TS U103 ( .A(Data_i[13]), .Y(n52) );
  OAI22X1TS U104 ( .A0(n3), .A1(n53), .B0(select_i), .B1(n5), .Y(Data_o[10])
         );
  CLKINVX1TS U105 ( .A(Data_i[10]), .Y(n5) );
  CLKINVX1TS U106 ( .A(Data_i[12]), .Y(n53) );
  AO22X1TS U107 ( .A0(select_i), .A1(Data_i[2]), .B0(Data_i[0]), .B1(n3), .Y(
        Data_o[0]) );
  CLKINVX1TS U108 ( .A(select_i), .Y(n3) );
endmodule


module shift_mux_array_SWR55_LEVEL2 ( Data_i, select_i, bit_shift_i, Data_o );
  input [54:0] Data_i;
  output [54:0] Data_o;
  input select_i, bit_shift_i;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41;

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
  OAI21X1TS U6 ( .A0(select_i), .A1(n2), .B0(n3), .Y(Data_o[54]) );
  OAI21X1TS U7 ( .A0(select_i), .A1(n4), .B0(n3), .Y(Data_o[53]) );
  OAI21X1TS U8 ( .A0(select_i), .A1(n5), .B0(n3), .Y(Data_o[52]) );
  OAI21X1TS U9 ( .A0(select_i), .A1(n6), .B0(n3), .Y(Data_o[51]) );
  NAND2X1TS U10 ( .A(bit_shift_i), .B(select_i), .Y(n3) );
  OAI22X1TS U11 ( .A0(n1), .A1(n2), .B0(select_i), .B1(n7), .Y(Data_o[50]) );
  CLKINVX1TS U12 ( .A(Data_i[54]), .Y(n2) );
  AO22X1TS U13 ( .A0(select_i), .A1(Data_i[8]), .B0(n1), .B1(Data_i[4]), .Y(
        Data_o[4]) );
  OAI22X1TS U14 ( .A0(n1), .A1(n4), .B0(select_i), .B1(n8), .Y(Data_o[49]) );
  CLKINVX1TS U15 ( .A(Data_i[53]), .Y(n4) );
  OAI22X1TS U16 ( .A0(n1), .A1(n5), .B0(select_i), .B1(n9), .Y(Data_o[48]) );
  CLKINVX1TS U17 ( .A(Data_i[52]), .Y(n5) );
  OAI22X1TS U18 ( .A0(n1), .A1(n6), .B0(select_i), .B1(n10), .Y(Data_o[47]) );
  CLKINVX1TS U19 ( .A(Data_i[51]), .Y(n6) );
  OAI22X1TS U20 ( .A0(n1), .A1(n7), .B0(select_i), .B1(n11), .Y(Data_o[46]) );
  CLKINVX1TS U21 ( .A(Data_i[50]), .Y(n7) );
  OAI22X1TS U22 ( .A0(n1), .A1(n8), .B0(select_i), .B1(n12), .Y(Data_o[45]) );
  CLKINVX1TS U23 ( .A(Data_i[49]), .Y(n8) );
  OAI22X1TS U24 ( .A0(n1), .A1(n9), .B0(select_i), .B1(n13), .Y(Data_o[44]) );
  CLKINVX1TS U25 ( .A(Data_i[48]), .Y(n9) );
  OAI22X1TS U26 ( .A0(n1), .A1(n10), .B0(select_i), .B1(n14), .Y(Data_o[43])
         );
  CLKINVX1TS U27 ( .A(Data_i[47]), .Y(n10) );
  OAI22X1TS U28 ( .A0(n1), .A1(n11), .B0(select_i), .B1(n15), .Y(Data_o[42])
         );
  CLKINVX1TS U29 ( .A(Data_i[46]), .Y(n11) );
  OAI22X1TS U30 ( .A0(n1), .A1(n12), .B0(select_i), .B1(n16), .Y(Data_o[41])
         );
  CLKINVX1TS U31 ( .A(Data_i[45]), .Y(n12) );
  OAI22X1TS U32 ( .A0(n1), .A1(n13), .B0(select_i), .B1(n17), .Y(Data_o[40])
         );
  CLKINVX1TS U33 ( .A(Data_i[44]), .Y(n13) );
  AO22X1TS U34 ( .A0(select_i), .A1(Data_i[7]), .B0(Data_i[3]), .B1(n1), .Y(
        Data_o[3]) );
  OAI22X1TS U35 ( .A0(n1), .A1(n14), .B0(select_i), .B1(n18), .Y(Data_o[39])
         );
  CLKINVX1TS U36 ( .A(Data_i[43]), .Y(n14) );
  OAI22X1TS U37 ( .A0(n1), .A1(n15), .B0(select_i), .B1(n19), .Y(Data_o[38])
         );
  CLKINVX1TS U38 ( .A(Data_i[42]), .Y(n15) );
  OAI22X1TS U39 ( .A0(n1), .A1(n16), .B0(select_i), .B1(n20), .Y(Data_o[37])
         );
  CLKINVX1TS U40 ( .A(Data_i[41]), .Y(n16) );
  OAI22X1TS U41 ( .A0(n1), .A1(n17), .B0(select_i), .B1(n21), .Y(Data_o[36])
         );
  CLKINVX1TS U42 ( .A(Data_i[40]), .Y(n17) );
  OAI22X1TS U43 ( .A0(n1), .A1(n18), .B0(select_i), .B1(n22), .Y(Data_o[35])
         );
  CLKINVX1TS U44 ( .A(Data_i[39]), .Y(n18) );
  OAI22X1TS U45 ( .A0(n1), .A1(n19), .B0(select_i), .B1(n23), .Y(Data_o[34])
         );
  CLKINVX1TS U46 ( .A(Data_i[38]), .Y(n19) );
  OAI22X1TS U47 ( .A0(n1), .A1(n20), .B0(select_i), .B1(n24), .Y(Data_o[33])
         );
  CLKINVX1TS U48 ( .A(Data_i[37]), .Y(n20) );
  OAI22X1TS U49 ( .A0(n1), .A1(n21), .B0(select_i), .B1(n25), .Y(Data_o[32])
         );
  CLKINVX1TS U50 ( .A(Data_i[36]), .Y(n21) );
  OAI22X1TS U51 ( .A0(n1), .A1(n22), .B0(select_i), .B1(n26), .Y(Data_o[31])
         );
  CLKINVX1TS U52 ( .A(Data_i[35]), .Y(n22) );
  OAI22X1TS U53 ( .A0(n1), .A1(n23), .B0(select_i), .B1(n27), .Y(Data_o[30])
         );
  CLKINVX1TS U54 ( .A(Data_i[34]), .Y(n23) );
  AO22X1TS U55 ( .A0(select_i), .A1(Data_i[6]), .B0(Data_i[2]), .B1(n1), .Y(
        Data_o[2]) );
  OAI22X1TS U56 ( .A0(n1), .A1(n24), .B0(select_i), .B1(n28), .Y(Data_o[29])
         );
  CLKINVX1TS U57 ( .A(Data_i[33]), .Y(n24) );
  OAI22X1TS U58 ( .A0(n1), .A1(n25), .B0(select_i), .B1(n29), .Y(Data_o[28])
         );
  CLKINVX1TS U59 ( .A(Data_i[32]), .Y(n25) );
  OAI22X1TS U60 ( .A0(n1), .A1(n26), .B0(select_i), .B1(n30), .Y(Data_o[27])
         );
  CLKINVX1TS U61 ( .A(Data_i[31]), .Y(n26) );
  OAI22X1TS U62 ( .A0(n1), .A1(n27), .B0(select_i), .B1(n31), .Y(Data_o[26])
         );
  CLKINVX1TS U63 ( .A(Data_i[30]), .Y(n27) );
  OAI22X1TS U64 ( .A0(n1), .A1(n28), .B0(select_i), .B1(n32), .Y(Data_o[25])
         );
  CLKINVX1TS U65 ( .A(Data_i[29]), .Y(n28) );
  OAI22X1TS U66 ( .A0(n1), .A1(n29), .B0(select_i), .B1(n33), .Y(Data_o[24])
         );
  CLKINVX1TS U67 ( .A(Data_i[28]), .Y(n29) );
  OAI22X1TS U68 ( .A0(n1), .A1(n30), .B0(select_i), .B1(n34), .Y(Data_o[23])
         );
  CLKINVX1TS U69 ( .A(Data_i[27]), .Y(n30) );
  OAI22X1TS U70 ( .A0(n1), .A1(n31), .B0(select_i), .B1(n35), .Y(Data_o[22])
         );
  CLKINVX1TS U71 ( .A(Data_i[26]), .Y(n31) );
  OAI22X1TS U72 ( .A0(n1), .A1(n32), .B0(select_i), .B1(n36), .Y(Data_o[21])
         );
  CLKINVX1TS U73 ( .A(Data_i[25]), .Y(n32) );
  OAI22X1TS U74 ( .A0(n1), .A1(n33), .B0(select_i), .B1(n37), .Y(Data_o[20])
         );
  CLKINVX1TS U75 ( .A(Data_i[24]), .Y(n33) );
  AO22X1TS U76 ( .A0(select_i), .A1(Data_i[5]), .B0(Data_i[1]), .B1(n1), .Y(
        Data_o[1]) );
  OAI22X1TS U77 ( .A0(n1), .A1(n34), .B0(select_i), .B1(n38), .Y(Data_o[19])
         );
  CLKINVX1TS U78 ( .A(Data_i[19]), .Y(n38) );
  CLKINVX1TS U79 ( .A(Data_i[23]), .Y(n34) );
  OAI22X1TS U80 ( .A0(n1), .A1(n35), .B0(select_i), .B1(n39), .Y(Data_o[18])
         );
  CLKINVX1TS U81 ( .A(Data_i[18]), .Y(n39) );
  CLKINVX1TS U82 ( .A(Data_i[22]), .Y(n35) );
  OAI22X1TS U83 ( .A0(n1), .A1(n36), .B0(select_i), .B1(n40), .Y(Data_o[17])
         );
  CLKINVX1TS U84 ( .A(Data_i[17]), .Y(n40) );
  CLKINVX1TS U85 ( .A(Data_i[21]), .Y(n36) );
  OAI22X1TS U86 ( .A0(n1), .A1(n37), .B0(select_i), .B1(n41), .Y(Data_o[16])
         );
  CLKINVX1TS U87 ( .A(Data_i[16]), .Y(n41) );
  CLKINVX1TS U88 ( .A(Data_i[20]), .Y(n37) );
  AO22X1TS U89 ( .A0(select_i), .A1(Data_i[19]), .B0(n1), .B1(Data_i[15]), .Y(
        Data_o[15]) );
  AO22X1TS U90 ( .A0(select_i), .A1(Data_i[18]), .B0(n1), .B1(Data_i[14]), .Y(
        Data_o[14]) );
  AO22X1TS U91 ( .A0(select_i), .A1(Data_i[17]), .B0(n1), .B1(Data_i[13]), .Y(
        Data_o[13]) );
  AO22X1TS U92 ( .A0(select_i), .A1(Data_i[16]), .B0(n1), .B1(Data_i[12]), .Y(
        Data_o[12]) );
  AO22X1TS U93 ( .A0(select_i), .A1(Data_i[15]), .B0(n1), .B1(Data_i[11]), .Y(
        Data_o[11]) );
  AO22X1TS U94 ( .A0(select_i), .A1(Data_i[14]), .B0(n1), .B1(Data_i[10]), .Y(
        Data_o[10]) );
  AO22X1TS U95 ( .A0(select_i), .A1(Data_i[4]), .B0(Data_i[0]), .B1(n1), .Y(
        Data_o[0]) );
  CLKINVX1TS U96 ( .A(select_i), .Y(n1) );
endmodule


module RegisterAdd_W55_1 ( clk, rst, load, D, Q );
  input [54:0] D;
  output [54:0] Q;
  input clk, rst, load;
  wire   n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122,
         n123, n124, n125, n126, n127, n128, n129, n130, n131, n132, n133,
         n134, n135, n136, n137, n138, n139, n140, n141, n142, n143, n144,
         n145, n146, n147, n148, n149, n150, n151, n152, n153, n154, n155,
         n156, n157, n158, n159, n160, n161, n162, n163, n164, n165, n166,
         n167, n168, n169, n170, n171, n172, n173, n174, n175, n176, n177,
         n178, n179, n180, n181, n182, n183, n184, n185, n186, n187, n188,
         n189, n190, n191, n192, n193, n194, n195, n196, n197, n198, n199,
         n200, n201, n202, n203, n204, n205, n206, n207, n208, n209, n210,
         n211, n212, n213, n214, n215, n216, n217, n218, n219, n220, n221,
         n222;

  OAI2BB2XLTS U2 ( .B0(n222), .B1(load), .A0N(load), .A1N(D[0]), .Y(n167) );
  OAI2BB2XLTS U3 ( .B0(n221), .B1(load), .A0N(D[1]), .A1N(load), .Y(n166) );
  OAI2BB2XLTS U4 ( .B0(n220), .B1(load), .A0N(D[2]), .A1N(load), .Y(n165) );
  OAI2BB2XLTS U5 ( .B0(n219), .B1(load), .A0N(D[3]), .A1N(load), .Y(n164) );
  OAI2BB2XLTS U6 ( .B0(n218), .B1(load), .A0N(D[4]), .A1N(load), .Y(n163) );
  OAI2BB2XLTS U7 ( .B0(n217), .B1(load), .A0N(D[5]), .A1N(load), .Y(n162) );
  OAI2BB2XLTS U8 ( .B0(n216), .B1(load), .A0N(D[6]), .A1N(load), .Y(n161) );
  OAI2BB2XLTS U9 ( .B0(n215), .B1(load), .A0N(D[7]), .A1N(load), .Y(n160) );
  OAI2BB2XLTS U10 ( .B0(n214), .B1(load), .A0N(D[8]), .A1N(load), .Y(n159) );
  OAI2BB2XLTS U11 ( .B0(n213), .B1(load), .A0N(D[9]), .A1N(load), .Y(n158) );
  OAI2BB2XLTS U12 ( .B0(n212), .B1(load), .A0N(D[10]), .A1N(load), .Y(n157) );
  OAI2BB2XLTS U13 ( .B0(n211), .B1(load), .A0N(D[11]), .A1N(load), .Y(n156) );
  OAI2BB2XLTS U14 ( .B0(n210), .B1(load), .A0N(D[12]), .A1N(load), .Y(n155) );
  OAI2BB2XLTS U15 ( .B0(n209), .B1(load), .A0N(D[13]), .A1N(load), .Y(n154) );
  OAI2BB2XLTS U16 ( .B0(n208), .B1(load), .A0N(D[14]), .A1N(load), .Y(n153) );
  OAI2BB2XLTS U17 ( .B0(n207), .B1(load), .A0N(D[15]), .A1N(load), .Y(n152) );
  OAI2BB2XLTS U18 ( .B0(n206), .B1(load), .A0N(D[16]), .A1N(load), .Y(n151) );
  OAI2BB2XLTS U19 ( .B0(n205), .B1(load), .A0N(D[17]), .A1N(load), .Y(n150) );
  OAI2BB2XLTS U20 ( .B0(n204), .B1(load), .A0N(D[18]), .A1N(load), .Y(n149) );
  OAI2BB2XLTS U21 ( .B0(n203), .B1(load), .A0N(D[19]), .A1N(load), .Y(n148) );
  OAI2BB2XLTS U22 ( .B0(n202), .B1(load), .A0N(D[20]), .A1N(load), .Y(n147) );
  OAI2BB2XLTS U23 ( .B0(n201), .B1(load), .A0N(D[21]), .A1N(load), .Y(n146) );
  OAI2BB2XLTS U24 ( .B0(n200), .B1(load), .A0N(D[22]), .A1N(load), .Y(n145) );
  OAI2BB2XLTS U25 ( .B0(n199), .B1(load), .A0N(D[23]), .A1N(load), .Y(n144) );
  OAI2BB2XLTS U26 ( .B0(n198), .B1(load), .A0N(D[24]), .A1N(load), .Y(n143) );
  OAI2BB2XLTS U27 ( .B0(n197), .B1(load), .A0N(D[25]), .A1N(load), .Y(n142) );
  OAI2BB2XLTS U28 ( .B0(n196), .B1(load), .A0N(D[26]), .A1N(load), .Y(n141) );
  OAI2BB2XLTS U29 ( .B0(n195), .B1(load), .A0N(D[27]), .A1N(load), .Y(n140) );
  OAI2BB2XLTS U30 ( .B0(n194), .B1(load), .A0N(D[28]), .A1N(load), .Y(n139) );
  OAI2BB2XLTS U31 ( .B0(n193), .B1(load), .A0N(D[29]), .A1N(load), .Y(n138) );
  OAI2BB2XLTS U32 ( .B0(n192), .B1(load), .A0N(D[30]), .A1N(load), .Y(n137) );
  OAI2BB2XLTS U33 ( .B0(n191), .B1(load), .A0N(D[31]), .A1N(load), .Y(n136) );
  OAI2BB2XLTS U34 ( .B0(n190), .B1(load), .A0N(D[32]), .A1N(load), .Y(n135) );
  OAI2BB2XLTS U35 ( .B0(n189), .B1(load), .A0N(D[33]), .A1N(load), .Y(n134) );
  OAI2BB2XLTS U36 ( .B0(n188), .B1(load), .A0N(D[34]), .A1N(load), .Y(n133) );
  OAI2BB2XLTS U37 ( .B0(n187), .B1(load), .A0N(D[35]), .A1N(load), .Y(n132) );
  OAI2BB2XLTS U38 ( .B0(n186), .B1(load), .A0N(D[36]), .A1N(load), .Y(n131) );
  OAI2BB2XLTS U39 ( .B0(n185), .B1(load), .A0N(D[37]), .A1N(load), .Y(n130) );
  OAI2BB2XLTS U40 ( .B0(n184), .B1(load), .A0N(D[38]), .A1N(load), .Y(n129) );
  OAI2BB2XLTS U41 ( .B0(n183), .B1(load), .A0N(D[39]), .A1N(load), .Y(n128) );
  OAI2BB2XLTS U42 ( .B0(n182), .B1(load), .A0N(D[40]), .A1N(load), .Y(n127) );
  OAI2BB2XLTS U43 ( .B0(n181), .B1(load), .A0N(D[41]), .A1N(load), .Y(n126) );
  OAI2BB2XLTS U44 ( .B0(n180), .B1(load), .A0N(D[42]), .A1N(load), .Y(n125) );
  OAI2BB2XLTS U45 ( .B0(n179), .B1(load), .A0N(D[43]), .A1N(load), .Y(n124) );
  OAI2BB2XLTS U46 ( .B0(n178), .B1(load), .A0N(D[44]), .A1N(load), .Y(n123) );
  OAI2BB2XLTS U47 ( .B0(n177), .B1(load), .A0N(D[45]), .A1N(load), .Y(n122) );
  OAI2BB2XLTS U48 ( .B0(n176), .B1(load), .A0N(D[46]), .A1N(load), .Y(n121) );
  OAI2BB2XLTS U49 ( .B0(n175), .B1(load), .A0N(D[47]), .A1N(load), .Y(n120) );
  OAI2BB2XLTS U50 ( .B0(n174), .B1(load), .A0N(D[48]), .A1N(load), .Y(n119) );
  OAI2BB2XLTS U51 ( .B0(n173), .B1(load), .A0N(D[49]), .A1N(load), .Y(n118) );
  OAI2BB2XLTS U52 ( .B0(n172), .B1(load), .A0N(D[50]), .A1N(load), .Y(n117) );
  OAI2BB2XLTS U53 ( .B0(n171), .B1(load), .A0N(D[51]), .A1N(load), .Y(n116) );
  OAI2BB2XLTS U54 ( .B0(n170), .B1(load), .A0N(D[52]), .A1N(load), .Y(n115) );
  OAI2BB2XLTS U55 ( .B0(n169), .B1(load), .A0N(D[53]), .A1N(load), .Y(n114) );
  OAI2BB2XLTS U56 ( .B0(n168), .B1(load), .A0N(D[54]), .A1N(load), .Y(n112) );
  INVX2TS U57 ( .A(rst), .Y(n113) );
  DFFRX2TS Q_reg_15_ ( .D(n152), .CK(clk), .RN(n113), .Q(Q[15]), .QN(n207) );
  DFFRX2TS Q_reg_14_ ( .D(n153), .CK(clk), .RN(n113), .Q(Q[14]), .QN(n208) );
  DFFRX2TS Q_reg_12_ ( .D(n155), .CK(clk), .RN(n113), .Q(Q[12]), .QN(n210) );
  DFFRX2TS Q_reg_11_ ( .D(n156), .CK(clk), .RN(n113), .Q(Q[11]), .QN(n211) );
  DFFRX2TS Q_reg_10_ ( .D(n157), .CK(clk), .RN(n113), .Q(Q[10]), .QN(n212) );
  DFFRX2TS Q_reg_7_ ( .D(n160), .CK(clk), .RN(n113), .Q(Q[7]), .QN(n215) );
  DFFRX2TS Q_reg_6_ ( .D(n161), .CK(clk), .RN(n113), .Q(Q[6]), .QN(n216) );
  DFFRX2TS Q_reg_5_ ( .D(n162), .CK(clk), .RN(n113), .Q(Q[5]), .QN(n217) );
  DFFRX2TS Q_reg_13_ ( .D(n154), .CK(clk), .RN(n113), .Q(Q[13]), .QN(n209) );
  DFFRX2TS Q_reg_9_ ( .D(n158), .CK(clk), .RN(n113), .Q(Q[9]), .QN(n213) );
  DFFRX2TS Q_reg_4_ ( .D(n163), .CK(clk), .RN(n113), .Q(Q[4]), .QN(n218) );
  DFFRX2TS Q_reg_54_ ( .D(n112), .CK(clk), .RN(n113), .Q(Q[54]), .QN(n168) );
  DFFRX2TS Q_reg_53_ ( .D(n114), .CK(clk), .RN(n113), .Q(Q[53]), .QN(n169) );
  DFFRX2TS Q_reg_52_ ( .D(n115), .CK(clk), .RN(n113), .Q(Q[52]), .QN(n170) );
  DFFRX2TS Q_reg_51_ ( .D(n116), .CK(clk), .RN(n113), .Q(Q[51]), .QN(n171) );
  DFFRX2TS Q_reg_8_ ( .D(n159), .CK(clk), .RN(n113), .Q(Q[8]), .QN(n214) );
  DFFRX2TS Q_reg_50_ ( .D(n117), .CK(clk), .RN(n113), .Q(Q[50]), .QN(n172) );
  DFFRX2TS Q_reg_49_ ( .D(n118), .CK(clk), .RN(n113), .Q(Q[49]), .QN(n173) );
  DFFRX2TS Q_reg_48_ ( .D(n119), .CK(clk), .RN(n113), .Q(Q[48]), .QN(n174) );
  DFFRX2TS Q_reg_47_ ( .D(n120), .CK(clk), .RN(n113), .Q(Q[47]), .QN(n175) );
  DFFRX2TS Q_reg_46_ ( .D(n121), .CK(clk), .RN(n113), .Q(Q[46]), .QN(n176) );
  DFFRX2TS Q_reg_45_ ( .D(n122), .CK(clk), .RN(n113), .Q(Q[45]), .QN(n177) );
  DFFRX2TS Q_reg_44_ ( .D(n123), .CK(clk), .RN(n113), .Q(Q[44]), .QN(n178) );
  DFFRX2TS Q_reg_43_ ( .D(n124), .CK(clk), .RN(n113), .Q(Q[43]), .QN(n179) );
  DFFRX2TS Q_reg_42_ ( .D(n125), .CK(clk), .RN(n113), .Q(Q[42]), .QN(n180) );
  DFFRX2TS Q_reg_41_ ( .D(n126), .CK(clk), .RN(n113), .Q(Q[41]), .QN(n181) );
  DFFRX2TS Q_reg_40_ ( .D(n127), .CK(clk), .RN(n113), .Q(Q[40]), .QN(n182) );
  DFFRX2TS Q_reg_39_ ( .D(n128), .CK(clk), .RN(n113), .Q(Q[39]), .QN(n183) );
  DFFRX2TS Q_reg_38_ ( .D(n129), .CK(clk), .RN(n113), .Q(Q[38]), .QN(n184) );
  DFFRX2TS Q_reg_37_ ( .D(n130), .CK(clk), .RN(n113), .Q(Q[37]), .QN(n185) );
  DFFRX2TS Q_reg_36_ ( .D(n131), .CK(clk), .RN(n113), .Q(Q[36]), .QN(n186) );
  DFFRX2TS Q_reg_35_ ( .D(n132), .CK(clk), .RN(n113), .Q(Q[35]), .QN(n187) );
  DFFRX2TS Q_reg_34_ ( .D(n133), .CK(clk), .RN(n113), .Q(Q[34]), .QN(n188) );
  DFFRX2TS Q_reg_33_ ( .D(n134), .CK(clk), .RN(n113), .Q(Q[33]), .QN(n189) );
  DFFRX2TS Q_reg_32_ ( .D(n135), .CK(clk), .RN(n113), .Q(Q[32]), .QN(n190) );
  DFFRX2TS Q_reg_31_ ( .D(n136), .CK(clk), .RN(n113), .Q(Q[31]), .QN(n191) );
  DFFRX2TS Q_reg_30_ ( .D(n137), .CK(clk), .RN(n113), .Q(Q[30]), .QN(n192) );
  DFFRX2TS Q_reg_29_ ( .D(n138), .CK(clk), .RN(n113), .Q(Q[29]), .QN(n193) );
  DFFRX2TS Q_reg_28_ ( .D(n139), .CK(clk), .RN(n113), .Q(Q[28]), .QN(n194) );
  DFFRX2TS Q_reg_27_ ( .D(n140), .CK(clk), .RN(n113), .Q(Q[27]), .QN(n195) );
  DFFRX2TS Q_reg_26_ ( .D(n141), .CK(clk), .RN(n113), .Q(Q[26]), .QN(n196) );
  DFFRX2TS Q_reg_25_ ( .D(n142), .CK(clk), .RN(n113), .Q(Q[25]), .QN(n197) );
  DFFRX2TS Q_reg_24_ ( .D(n143), .CK(clk), .RN(n113), .Q(Q[24]), .QN(n198) );
  DFFRX2TS Q_reg_23_ ( .D(n144), .CK(clk), .RN(n113), .Q(Q[23]), .QN(n199) );
  DFFRX2TS Q_reg_22_ ( .D(n145), .CK(clk), .RN(n113), .Q(Q[22]), .QN(n200) );
  DFFRX2TS Q_reg_21_ ( .D(n146), .CK(clk), .RN(n113), .Q(Q[21]), .QN(n201) );
  DFFRX2TS Q_reg_20_ ( .D(n147), .CK(clk), .RN(n113), .Q(Q[20]), .QN(n202) );
  DFFRX2TS Q_reg_19_ ( .D(n148), .CK(clk), .RN(n113), .Q(Q[19]), .QN(n203) );
  DFFRX2TS Q_reg_18_ ( .D(n149), .CK(clk), .RN(n113), .Q(Q[18]), .QN(n204) );
  DFFRX2TS Q_reg_17_ ( .D(n150), .CK(clk), .RN(n113), .Q(Q[17]), .QN(n205) );
  DFFRX2TS Q_reg_16_ ( .D(n151), .CK(clk), .RN(n113), .Q(Q[16]), .QN(n206) );
  DFFRX2TS Q_reg_3_ ( .D(n164), .CK(clk), .RN(n113), .Q(Q[3]), .QN(n219) );
  DFFRX2TS Q_reg_2_ ( .D(n165), .CK(clk), .RN(n113), .Q(Q[2]), .QN(n220) );
  DFFRX2TS Q_reg_0_ ( .D(n167), .CK(clk), .RN(n113), .Q(Q[0]), .QN(n222) );
  DFFRX2TS Q_reg_1_ ( .D(n166), .CK(clk), .RN(n113), .Q(Q[1]), .QN(n221) );
endmodule


module shift_mux_array_SWR55_LEVEL3 ( Data_i, select_i, bit_shift_i, Data_o );
  input [54:0] Data_i;
  output [54:0] Data_o;
  input select_i, bit_shift_i;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25;

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
  OAI21X1TS U6 ( .A0(select_i), .A1(n2), .B0(n3), .Y(Data_o[54]) );
  OAI21X1TS U7 ( .A0(select_i), .A1(n4), .B0(n3), .Y(Data_o[53]) );
  OAI21X1TS U8 ( .A0(select_i), .A1(n5), .B0(n3), .Y(Data_o[52]) );
  OAI21X1TS U9 ( .A0(select_i), .A1(n6), .B0(n3), .Y(Data_o[51]) );
  OAI21X1TS U10 ( .A0(select_i), .A1(n7), .B0(n3), .Y(Data_o[50]) );
  AO22X1TS U11 ( .A0(select_i), .A1(Data_i[12]), .B0(Data_i[4]), .B1(n1), .Y(
        Data_o[4]) );
  OAI21X1TS U12 ( .A0(select_i), .A1(n8), .B0(n3), .Y(Data_o[49]) );
  OAI21X1TS U13 ( .A0(select_i), .A1(n9), .B0(n3), .Y(Data_o[48]) );
  OAI21X1TS U14 ( .A0(select_i), .A1(n10), .B0(n3), .Y(Data_o[47]) );
  NAND2X1TS U15 ( .A(bit_shift_i), .B(select_i), .Y(n3) );
  OAI22X1TS U16 ( .A0(n1), .A1(n2), .B0(select_i), .B1(n11), .Y(Data_o[46]) );
  CLKINVX1TS U17 ( .A(Data_i[54]), .Y(n2) );
  OAI22X1TS U18 ( .A0(n1), .A1(n4), .B0(select_i), .B1(n12), .Y(Data_o[45]) );
  CLKINVX1TS U19 ( .A(Data_i[53]), .Y(n4) );
  OAI22X1TS U20 ( .A0(n1), .A1(n5), .B0(select_i), .B1(n13), .Y(Data_o[44]) );
  CLKINVX1TS U21 ( .A(Data_i[52]), .Y(n5) );
  OAI22X1TS U22 ( .A0(n1), .A1(n6), .B0(select_i), .B1(n14), .Y(Data_o[43]) );
  CLKINVX1TS U23 ( .A(Data_i[51]), .Y(n6) );
  OAI22X1TS U24 ( .A0(n1), .A1(n7), .B0(select_i), .B1(n15), .Y(Data_o[42]) );
  CLKINVX1TS U25 ( .A(Data_i[50]), .Y(n7) );
  OAI22X1TS U26 ( .A0(n1), .A1(n8), .B0(select_i), .B1(n16), .Y(Data_o[41]) );
  CLKINVX1TS U27 ( .A(Data_i[49]), .Y(n8) );
  OAI22X1TS U28 ( .A0(n1), .A1(n9), .B0(select_i), .B1(n17), .Y(Data_o[40]) );
  CLKINVX1TS U29 ( .A(Data_i[48]), .Y(n9) );
  AO22X1TS U30 ( .A0(select_i), .A1(Data_i[11]), .B0(Data_i[3]), .B1(n1), .Y(
        Data_o[3]) );
  OAI22X1TS U31 ( .A0(n1), .A1(n10), .B0(select_i), .B1(n18), .Y(Data_o[39])
         );
  CLKINVX1TS U32 ( .A(Data_i[39]), .Y(n18) );
  CLKINVX1TS U33 ( .A(Data_i[47]), .Y(n10) );
  OAI22X1TS U34 ( .A0(n1), .A1(n11), .B0(select_i), .B1(n19), .Y(Data_o[38])
         );
  CLKINVX1TS U35 ( .A(Data_i[38]), .Y(n19) );
  CLKINVX1TS U36 ( .A(Data_i[46]), .Y(n11) );
  OAI22X1TS U37 ( .A0(n1), .A1(n12), .B0(select_i), .B1(n20), .Y(Data_o[37])
         );
  CLKINVX1TS U38 ( .A(Data_i[37]), .Y(n20) );
  CLKINVX1TS U39 ( .A(Data_i[45]), .Y(n12) );
  OAI22X1TS U40 ( .A0(n1), .A1(n13), .B0(select_i), .B1(n21), .Y(Data_o[36])
         );
  CLKINVX1TS U41 ( .A(Data_i[36]), .Y(n21) );
  CLKINVX1TS U42 ( .A(Data_i[44]), .Y(n13) );
  OAI22X1TS U43 ( .A0(n1), .A1(n14), .B0(select_i), .B1(n22), .Y(Data_o[35])
         );
  CLKINVX1TS U44 ( .A(Data_i[35]), .Y(n22) );
  CLKINVX1TS U45 ( .A(Data_i[43]), .Y(n14) );
  OAI22X1TS U46 ( .A0(n1), .A1(n15), .B0(select_i), .B1(n23), .Y(Data_o[34])
         );
  CLKINVX1TS U47 ( .A(Data_i[34]), .Y(n23) );
  CLKINVX1TS U48 ( .A(Data_i[42]), .Y(n15) );
  OAI22X1TS U49 ( .A0(n1), .A1(n16), .B0(select_i), .B1(n24), .Y(Data_o[33])
         );
  CLKINVX1TS U50 ( .A(Data_i[33]), .Y(n24) );
  CLKINVX1TS U51 ( .A(Data_i[41]), .Y(n16) );
  OAI22X1TS U52 ( .A0(n1), .A1(n17), .B0(select_i), .B1(n25), .Y(Data_o[32])
         );
  CLKINVX1TS U53 ( .A(Data_i[32]), .Y(n25) );
  CLKINVX1TS U54 ( .A(Data_i[40]), .Y(n17) );
  AO22X1TS U55 ( .A0(select_i), .A1(Data_i[39]), .B0(n1), .B1(Data_i[31]), .Y(
        Data_o[31]) );
  AO22X1TS U56 ( .A0(select_i), .A1(Data_i[38]), .B0(n1), .B1(Data_i[30]), .Y(
        Data_o[30]) );
  AO22X1TS U57 ( .A0(select_i), .A1(Data_i[10]), .B0(Data_i[2]), .B1(n1), .Y(
        Data_o[2]) );
  AO22X1TS U58 ( .A0(select_i), .A1(Data_i[37]), .B0(n1), .B1(Data_i[29]), .Y(
        Data_o[29]) );
  AO22X1TS U59 ( .A0(select_i), .A1(Data_i[36]), .B0(n1), .B1(Data_i[28]), .Y(
        Data_o[28]) );
  AO22X1TS U60 ( .A0(select_i), .A1(Data_i[35]), .B0(n1), .B1(Data_i[27]), .Y(
        Data_o[27]) );
  AO22X1TS U61 ( .A0(select_i), .A1(Data_i[34]), .B0(n1), .B1(Data_i[26]), .Y(
        Data_o[26]) );
  AO22X1TS U62 ( .A0(select_i), .A1(Data_i[33]), .B0(n1), .B1(Data_i[25]), .Y(
        Data_o[25]) );
  AO22X1TS U63 ( .A0(select_i), .A1(Data_i[32]), .B0(n1), .B1(Data_i[24]), .Y(
        Data_o[24]) );
  AO22X1TS U64 ( .A0(select_i), .A1(Data_i[31]), .B0(n1), .B1(Data_i[23]), .Y(
        Data_o[23]) );
  AO22X1TS U65 ( .A0(select_i), .A1(Data_i[30]), .B0(n1), .B1(Data_i[22]), .Y(
        Data_o[22]) );
  AO22X1TS U66 ( .A0(select_i), .A1(Data_i[29]), .B0(n1), .B1(Data_i[21]), .Y(
        Data_o[21]) );
  AO22X1TS U67 ( .A0(select_i), .A1(Data_i[28]), .B0(n1), .B1(Data_i[20]), .Y(
        Data_o[20]) );
  AO22X1TS U68 ( .A0(select_i), .A1(Data_i[9]), .B0(Data_i[1]), .B1(n1), .Y(
        Data_o[1]) );
  AO22X1TS U69 ( .A0(select_i), .A1(Data_i[27]), .B0(n1), .B1(Data_i[19]), .Y(
        Data_o[19]) );
  AO22X1TS U70 ( .A0(select_i), .A1(Data_i[26]), .B0(n1), .B1(Data_i[18]), .Y(
        Data_o[18]) );
  AO22X1TS U71 ( .A0(select_i), .A1(Data_i[25]), .B0(n1), .B1(Data_i[17]), .Y(
        Data_o[17]) );
  AO22X1TS U72 ( .A0(select_i), .A1(Data_i[24]), .B0(n1), .B1(Data_i[16]), .Y(
        Data_o[16]) );
  AO22X1TS U73 ( .A0(select_i), .A1(Data_i[23]), .B0(n1), .B1(Data_i[15]), .Y(
        Data_o[15]) );
  AO22X1TS U74 ( .A0(select_i), .A1(Data_i[22]), .B0(n1), .B1(Data_i[14]), .Y(
        Data_o[14]) );
  AO22X1TS U75 ( .A0(select_i), .A1(Data_i[21]), .B0(n1), .B1(Data_i[13]), .Y(
        Data_o[13]) );
  AO22X1TS U76 ( .A0(select_i), .A1(Data_i[20]), .B0(n1), .B1(Data_i[12]), .Y(
        Data_o[12]) );
  AO22X1TS U77 ( .A0(select_i), .A1(Data_i[19]), .B0(n1), .B1(Data_i[11]), .Y(
        Data_o[11]) );
  AO22X1TS U78 ( .A0(select_i), .A1(Data_i[18]), .B0(n1), .B1(Data_i[10]), .Y(
        Data_o[10]) );
  AO22X1TS U79 ( .A0(select_i), .A1(Data_i[8]), .B0(Data_i[0]), .B1(n1), .Y(
        Data_o[0]) );
  CLKINVX1TS U80 ( .A(select_i), .Y(n1) );
endmodule


module shift_mux_array_SWR55_LEVEL4 ( Data_i, select_i, bit_shift_i, Data_o );
  input [54:0] Data_i;
  output [54:0] Data_o;
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
  OAI2BB1X1TS U6 ( .A0N(n1), .A1N(Data_i[54]), .B0(n2), .Y(Data_o[54]) );
  OAI2BB1X1TS U7 ( .A0N(n1), .A1N(Data_i[53]), .B0(n2), .Y(Data_o[53]) );
  OAI2BB1X1TS U8 ( .A0N(n1), .A1N(Data_i[52]), .B0(n2), .Y(Data_o[52]) );
  OAI2BB1X1TS U9 ( .A0N(n1), .A1N(Data_i[51]), .B0(n2), .Y(Data_o[51]) );
  OAI2BB1X1TS U10 ( .A0N(n1), .A1N(Data_i[50]), .B0(n2), .Y(Data_o[50]) );
  AO22X1TS U11 ( .A0(select_i), .A1(Data_i[20]), .B0(Data_i[4]), .B1(n1), .Y(
        Data_o[4]) );
  OAI2BB1X1TS U12 ( .A0N(n1), .A1N(Data_i[49]), .B0(n2), .Y(Data_o[49]) );
  OAI2BB1X1TS U13 ( .A0N(n1), .A1N(Data_i[48]), .B0(n2), .Y(Data_o[48]) );
  OAI2BB1X1TS U14 ( .A0N(n1), .A1N(Data_i[47]), .B0(n2), .Y(Data_o[47]) );
  OAI2BB1X1TS U15 ( .A0N(n1), .A1N(Data_i[46]), .B0(n2), .Y(Data_o[46]) );
  OAI2BB1X1TS U16 ( .A0N(n1), .A1N(Data_i[45]), .B0(n2), .Y(Data_o[45]) );
  OAI2BB1X1TS U17 ( .A0N(n1), .A1N(Data_i[44]), .B0(n2), .Y(Data_o[44]) );
  OAI2BB1X1TS U18 ( .A0N(n1), .A1N(Data_i[43]), .B0(n2), .Y(Data_o[43]) );
  OAI2BB1X1TS U19 ( .A0N(n1), .A1N(Data_i[42]), .B0(n2), .Y(Data_o[42]) );
  OAI2BB1X1TS U20 ( .A0N(n1), .A1N(Data_i[41]), .B0(n2), .Y(Data_o[41]) );
  OAI2BB1X1TS U21 ( .A0N(n1), .A1N(Data_i[40]), .B0(n2), .Y(Data_o[40]) );
  AO22X1TS U22 ( .A0(select_i), .A1(Data_i[19]), .B0(Data_i[3]), .B1(n1), .Y(
        Data_o[3]) );
  OAI2BB1X1TS U23 ( .A0N(n1), .A1N(Data_i[39]), .B0(n2), .Y(Data_o[39]) );
  NAND2X1TS U24 ( .A(bit_shift_i), .B(select_i), .Y(n2) );
  AO22X1TS U25 ( .A0(select_i), .A1(Data_i[54]), .B0(n1), .B1(Data_i[38]), .Y(
        Data_o[38]) );
  AO22X1TS U26 ( .A0(select_i), .A1(Data_i[53]), .B0(n1), .B1(Data_i[37]), .Y(
        Data_o[37]) );
  AO22X1TS U27 ( .A0(select_i), .A1(Data_i[52]), .B0(n1), .B1(Data_i[36]), .Y(
        Data_o[36]) );
  AO22X1TS U28 ( .A0(select_i), .A1(Data_i[51]), .B0(n1), .B1(Data_i[35]), .Y(
        Data_o[35]) );
  AO22X1TS U29 ( .A0(select_i), .A1(Data_i[50]), .B0(n1), .B1(Data_i[34]), .Y(
        Data_o[34]) );
  AO22X1TS U30 ( .A0(select_i), .A1(Data_i[49]), .B0(n1), .B1(Data_i[33]), .Y(
        Data_o[33]) );
  AO22X1TS U31 ( .A0(select_i), .A1(Data_i[48]), .B0(n1), .B1(Data_i[32]), .Y(
        Data_o[32]) );
  AO22X1TS U32 ( .A0(select_i), .A1(Data_i[47]), .B0(n1), .B1(Data_i[31]), .Y(
        Data_o[31]) );
  AO22X1TS U33 ( .A0(select_i), .A1(Data_i[46]), .B0(n1), .B1(Data_i[30]), .Y(
        Data_o[30]) );
  AO22X1TS U34 ( .A0(select_i), .A1(Data_i[18]), .B0(Data_i[2]), .B1(n1), .Y(
        Data_o[2]) );
  AO22X1TS U35 ( .A0(select_i), .A1(Data_i[45]), .B0(n1), .B1(Data_i[29]), .Y(
        Data_o[29]) );
  AO22X1TS U36 ( .A0(select_i), .A1(Data_i[44]), .B0(n1), .B1(Data_i[28]), .Y(
        Data_o[28]) );
  AO22X1TS U37 ( .A0(select_i), .A1(Data_i[43]), .B0(n1), .B1(Data_i[27]), .Y(
        Data_o[27]) );
  AO22X1TS U38 ( .A0(select_i), .A1(Data_i[42]), .B0(n1), .B1(Data_i[26]), .Y(
        Data_o[26]) );
  AO22X1TS U39 ( .A0(select_i), .A1(Data_i[41]), .B0(n1), .B1(Data_i[25]), .Y(
        Data_o[25]) );
  AO22X1TS U40 ( .A0(select_i), .A1(Data_i[40]), .B0(n1), .B1(Data_i[24]), .Y(
        Data_o[24]) );
  AO22X1TS U41 ( .A0(select_i), .A1(Data_i[39]), .B0(n1), .B1(Data_i[23]), .Y(
        Data_o[23]) );
  AO22X1TS U42 ( .A0(select_i), .A1(Data_i[38]), .B0(n1), .B1(Data_i[22]), .Y(
        Data_o[22]) );
  AO22X1TS U43 ( .A0(select_i), .A1(Data_i[37]), .B0(n1), .B1(Data_i[21]), .Y(
        Data_o[21]) );
  AO22X1TS U44 ( .A0(select_i), .A1(Data_i[36]), .B0(n1), .B1(Data_i[20]), .Y(
        Data_o[20]) );
  AO22X1TS U45 ( .A0(select_i), .A1(Data_i[17]), .B0(Data_i[1]), .B1(n1), .Y(
        Data_o[1]) );
  AO22X1TS U46 ( .A0(select_i), .A1(Data_i[35]), .B0(n1), .B1(Data_i[19]), .Y(
        Data_o[19]) );
  AO22X1TS U47 ( .A0(select_i), .A1(Data_i[34]), .B0(n1), .B1(Data_i[18]), .Y(
        Data_o[18]) );
  AO22X1TS U48 ( .A0(select_i), .A1(Data_i[33]), .B0(n1), .B1(Data_i[17]), .Y(
        Data_o[17]) );
  AO22X1TS U49 ( .A0(select_i), .A1(Data_i[32]), .B0(n1), .B1(Data_i[16]), .Y(
        Data_o[16]) );
  AO22X1TS U50 ( .A0(select_i), .A1(Data_i[31]), .B0(Data_i[15]), .B1(n1), .Y(
        Data_o[15]) );
  AO22X1TS U51 ( .A0(select_i), .A1(Data_i[30]), .B0(Data_i[14]), .B1(n1), .Y(
        Data_o[14]) );
  AO22X1TS U52 ( .A0(select_i), .A1(Data_i[29]), .B0(Data_i[13]), .B1(n1), .Y(
        Data_o[13]) );
  AO22X1TS U53 ( .A0(select_i), .A1(Data_i[28]), .B0(Data_i[12]), .B1(n1), .Y(
        Data_o[12]) );
  AO22X1TS U54 ( .A0(select_i), .A1(Data_i[27]), .B0(Data_i[11]), .B1(n1), .Y(
        Data_o[11]) );
  AO22X1TS U55 ( .A0(select_i), .A1(Data_i[26]), .B0(Data_i[10]), .B1(n1), .Y(
        Data_o[10]) );
  AO22X1TS U56 ( .A0(select_i), .A1(Data_i[16]), .B0(Data_i[0]), .B1(n1), .Y(
        Data_o[0]) );
  CLKINVX1TS U57 ( .A(select_i), .Y(n1) );
endmodule


module shift_mux_array_SWR55_LEVEL5 ( Data_i, select_i, bit_shift_i, Data_o );
  input [54:0] Data_i;
  output [54:0] Data_o;
  input select_i, bit_shift_i;
  wire   n1, n2;

  AO22X1TS U1 ( .A0(Data_i[41]), .A1(select_i), .B0(Data_i[9]), .B1(n1), .Y(
        Data_o[9]) );
  AO22X1TS U2 ( .A0(select_i), .A1(Data_i[40]), .B0(Data_i[8]), .B1(n1), .Y(
        Data_o[8]) );
  AO22X1TS U3 ( .A0(select_i), .A1(Data_i[39]), .B0(Data_i[7]), .B1(n1), .Y(
        Data_o[7]) );
  AO22X1TS U4 ( .A0(select_i), .A1(Data_i[38]), .B0(Data_i[6]), .B1(n1), .Y(
        Data_o[6]) );
  AO22X1TS U5 ( .A0(select_i), .A1(Data_i[37]), .B0(Data_i[5]), .B1(n1), .Y(
        Data_o[5]) );
  OAI2BB1X1TS U6 ( .A0N(n1), .A1N(Data_i[54]), .B0(n2), .Y(Data_o[54]) );
  OAI2BB1X1TS U7 ( .A0N(n1), .A1N(Data_i[53]), .B0(n2), .Y(Data_o[53]) );
  OAI2BB1X1TS U8 ( .A0N(n1), .A1N(Data_i[52]), .B0(n2), .Y(Data_o[52]) );
  OAI2BB1X1TS U9 ( .A0N(n1), .A1N(Data_i[51]), .B0(n2), .Y(Data_o[51]) );
  OAI2BB1X1TS U10 ( .A0N(n1), .A1N(Data_i[50]), .B0(n2), .Y(Data_o[50]) );
  AO22X1TS U11 ( .A0(select_i), .A1(Data_i[36]), .B0(Data_i[4]), .B1(n1), .Y(
        Data_o[4]) );
  OAI2BB1X1TS U12 ( .A0N(n1), .A1N(Data_i[49]), .B0(n2), .Y(Data_o[49]) );
  OAI2BB1X1TS U13 ( .A0N(n1), .A1N(Data_i[48]), .B0(n2), .Y(Data_o[48]) );
  OAI2BB1X1TS U14 ( .A0N(n1), .A1N(Data_i[47]), .B0(n2), .Y(Data_o[47]) );
  OAI2BB1X1TS U15 ( .A0N(n1), .A1N(Data_i[46]), .B0(n2), .Y(Data_o[46]) );
  OAI2BB1X1TS U16 ( .A0N(n1), .A1N(Data_i[45]), .B0(n2), .Y(Data_o[45]) );
  OAI2BB1X1TS U17 ( .A0N(n1), .A1N(Data_i[44]), .B0(n2), .Y(Data_o[44]) );
  OAI2BB1X1TS U18 ( .A0N(n1), .A1N(Data_i[43]), .B0(n2), .Y(Data_o[43]) );
  OAI2BB1X1TS U19 ( .A0N(n1), .A1N(Data_i[42]), .B0(n2), .Y(Data_o[42]) );
  OAI2BB1X1TS U20 ( .A0N(n1), .A1N(Data_i[41]), .B0(n2), .Y(Data_o[41]) );
  OAI2BB1X1TS U21 ( .A0N(n1), .A1N(Data_i[40]), .B0(n2), .Y(Data_o[40]) );
  AO22X1TS U22 ( .A0(select_i), .A1(Data_i[35]), .B0(Data_i[3]), .B1(n1), .Y(
        Data_o[3]) );
  OAI2BB1X1TS U23 ( .A0N(n1), .A1N(Data_i[39]), .B0(n2), .Y(Data_o[39]) );
  OAI2BB1X1TS U24 ( .A0N(n1), .A1N(Data_i[38]), .B0(n2), .Y(Data_o[38]) );
  OAI2BB1X1TS U25 ( .A0N(n1), .A1N(Data_i[37]), .B0(n2), .Y(Data_o[37]) );
  OAI2BB1X1TS U26 ( .A0N(n1), .A1N(Data_i[36]), .B0(n2), .Y(Data_o[36]) );
  OAI2BB1X1TS U27 ( .A0N(n1), .A1N(Data_i[35]), .B0(n2), .Y(Data_o[35]) );
  OAI2BB1X1TS U28 ( .A0N(n1), .A1N(Data_i[34]), .B0(n2), .Y(Data_o[34]) );
  OAI2BB1X1TS U29 ( .A0N(n1), .A1N(Data_i[33]), .B0(n2), .Y(Data_o[33]) );
  OAI2BB1X1TS U30 ( .A0N(n1), .A1N(Data_i[32]), .B0(n2), .Y(Data_o[32]) );
  OAI2BB1X1TS U31 ( .A0N(Data_i[31]), .A1N(n1), .B0(n2), .Y(Data_o[31]) );
  OAI2BB1X1TS U32 ( .A0N(Data_i[30]), .A1N(n1), .B0(n2), .Y(Data_o[30]) );
  AO22X1TS U33 ( .A0(select_i), .A1(Data_i[34]), .B0(Data_i[2]), .B1(n1), .Y(
        Data_o[2]) );
  OAI2BB1X1TS U34 ( .A0N(Data_i[29]), .A1N(n1), .B0(n2), .Y(Data_o[29]) );
  OAI2BB1X1TS U35 ( .A0N(Data_i[28]), .A1N(n1), .B0(n2), .Y(Data_o[28]) );
  OAI2BB1X1TS U36 ( .A0N(Data_i[27]), .A1N(n1), .B0(n2), .Y(Data_o[27]) );
  OAI2BB1X1TS U37 ( .A0N(Data_i[26]), .A1N(n1), .B0(n2), .Y(Data_o[26]) );
  OAI2BB1X1TS U38 ( .A0N(Data_i[25]), .A1N(n1), .B0(n2), .Y(Data_o[25]) );
  OAI2BB1X1TS U39 ( .A0N(Data_i[24]), .A1N(n1), .B0(n2), .Y(Data_o[24]) );
  OAI2BB1X1TS U40 ( .A0N(Data_i[23]), .A1N(n1), .B0(n2), .Y(Data_o[23]) );
  NAND2X1TS U41 ( .A(bit_shift_i), .B(select_i), .Y(n2) );
  AO22X1TS U42 ( .A0(select_i), .A1(Data_i[54]), .B0(Data_i[22]), .B1(n1), .Y(
        Data_o[22]) );
  AO22X1TS U43 ( .A0(select_i), .A1(Data_i[53]), .B0(Data_i[21]), .B1(n1), .Y(
        Data_o[21]) );
  AO22X1TS U44 ( .A0(select_i), .A1(Data_i[52]), .B0(Data_i[20]), .B1(n1), .Y(
        Data_o[20]) );
  AO22X1TS U45 ( .A0(select_i), .A1(Data_i[33]), .B0(Data_i[1]), .B1(n1), .Y(
        Data_o[1]) );
  AO22X1TS U46 ( .A0(select_i), .A1(Data_i[51]), .B0(Data_i[19]), .B1(n1), .Y(
        Data_o[19]) );
  AO22X1TS U47 ( .A0(select_i), .A1(Data_i[50]), .B0(Data_i[18]), .B1(n1), .Y(
        Data_o[18]) );
  AO22X1TS U48 ( .A0(select_i), .A1(Data_i[49]), .B0(Data_i[17]), .B1(n1), .Y(
        Data_o[17]) );
  AO22X1TS U49 ( .A0(select_i), .A1(Data_i[48]), .B0(Data_i[16]), .B1(n1), .Y(
        Data_o[16]) );
  AO22X1TS U50 ( .A0(select_i), .A1(Data_i[47]), .B0(Data_i[15]), .B1(n1), .Y(
        Data_o[15]) );
  AO22X1TS U51 ( .A0(select_i), .A1(Data_i[46]), .B0(Data_i[14]), .B1(n1), .Y(
        Data_o[14]) );
  AO22X1TS U52 ( .A0(select_i), .A1(Data_i[45]), .B0(Data_i[13]), .B1(n1), .Y(
        Data_o[13]) );
  AO22X1TS U53 ( .A0(select_i), .A1(Data_i[44]), .B0(Data_i[12]), .B1(n1), .Y(
        Data_o[12]) );
  AO22X1TS U54 ( .A0(select_i), .A1(Data_i[43]), .B0(Data_i[11]), .B1(n1), .Y(
        Data_o[11]) );
  AO22X1TS U55 ( .A0(select_i), .A1(Data_i[42]), .B0(Data_i[10]), .B1(n1), .Y(
        Data_o[10]) );
  AO22X1TS U56 ( .A0(select_i), .A1(Data_i[32]), .B0(Data_i[0]), .B1(n1), .Y(
        Data_o[0]) );
  CLKINVX1TS U57 ( .A(select_i), .Y(n1) );
endmodule


module Multiplexer_AC_W1_106 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1, n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(n1), .B1(D1[0]), .Y(S[0]) );
  CLKINVX20TS U2 ( .A(n2), .Y(n1) );
  INVX20TS U3 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_105 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1, n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(n1), .B1(D1[0]), .Y(S[0]) );
  CLKINVX20TS U2 ( .A(n2), .Y(n1) );
  INVX20TS U3 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_104 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1, n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(n1), .B1(D1[0]), .Y(S[0]) );
  CLKINVX20TS U2 ( .A(n2), .Y(n1) );
  INVX20TS U3 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_103 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1, n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(n1), .B1(D1[0]), .Y(S[0]) );
  CLKINVX20TS U2 ( .A(n2), .Y(n1) );
  INVX20TS U3 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_102 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1, n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(n1), .B1(D1[0]), .Y(S[0]) );
  CLKINVX20TS U2 ( .A(n2), .Y(n1) );
  INVX20TS U3 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_101 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1, n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(n1), .B1(D1[0]), .Y(S[0]) );
  CLKINVX20TS U2 ( .A(n2), .Y(n1) );
  INVX20TS U3 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_100 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1, n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(n1), .B1(D1[0]), .Y(S[0]) );
  CLKINVX20TS U2 ( .A(n2), .Y(n1) );
  INVX20TS U3 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_99 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1, n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(n1), .B1(D1[0]), .Y(S[0]) );
  CLKINVX20TS U2 ( .A(n2), .Y(n1) );
  INVX20TS U3 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_98 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1, n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(n1), .B1(D1[0]), .Y(S[0]) );
  CLKINVX20TS U2 ( .A(n2), .Y(n1) );
  INVX20TS U3 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_97 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1, n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(n1), .B1(D1[0]), .Y(S[0]) );
  CLKINVX20TS U2 ( .A(n2), .Y(n1) );
  INVX20TS U3 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_96 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1, n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(n1), .B1(D1[0]), .Y(S[0]) );
  CLKINVX20TS U2 ( .A(n2), .Y(n1) );
  INVX20TS U3 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_95 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1, n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(n1), .B1(D1[0]), .Y(S[0]) );
  CLKINVX20TS U2 ( .A(n2), .Y(n1) );
  INVX20TS U3 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_94 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1, n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(n1), .B1(D1[0]), .Y(S[0]) );
  CLKINVX20TS U2 ( .A(n2), .Y(n1) );
  INVX20TS U3 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_93 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1, n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(n1), .B1(D1[0]), .Y(S[0]) );
  CLKINVX20TS U2 ( .A(n2), .Y(n1) );
  INVX20TS U3 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_92 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1, n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(n1), .B1(D1[0]), .Y(S[0]) );
  CLKINVX20TS U2 ( .A(n2), .Y(n1) );
  INVX20TS U3 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_91 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1, n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(n1), .B1(D1[0]), .Y(S[0]) );
  CLKINVX20TS U2 ( .A(n2), .Y(n1) );
  INVX20TS U3 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_90 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1, n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(n1), .B1(D1[0]), .Y(S[0]) );
  CLKINVX20TS U2 ( .A(n2), .Y(n1) );
  INVX20TS U3 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_89 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1, n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(n1), .B1(D1[0]), .Y(S[0]) );
  CLKINVX20TS U2 ( .A(n2), .Y(n1) );
  INVX20TS U3 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_88 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1, n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(n1), .B1(D1[0]), .Y(S[0]) );
  CLKINVX20TS U2 ( .A(n2), .Y(n1) );
  INVX20TS U3 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_87 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1, n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(n1), .B1(D1[0]), .Y(S[0]) );
  CLKINVX20TS U2 ( .A(n2), .Y(n1) );
  INVX20TS U3 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_86 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1, n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(n1), .B1(D1[0]), .Y(S[0]) );
  CLKINVX20TS U2 ( .A(n2), .Y(n1) );
  INVX20TS U3 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_85 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1, n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(n1), .B1(D1[0]), .Y(S[0]) );
  CLKINVX20TS U2 ( .A(n2), .Y(n1) );
  INVX20TS U3 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_84 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1, n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(n1), .B1(D1[0]), .Y(S[0]) );
  CLKINVX20TS U2 ( .A(n2), .Y(n1) );
  INVX20TS U3 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_83 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1, n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(n1), .B1(D1[0]), .Y(S[0]) );
  CLKINVX20TS U2 ( .A(n2), .Y(n1) );
  INVX20TS U3 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_82 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1, n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(n1), .B1(D1[0]), .Y(S[0]) );
  CLKINVX20TS U2 ( .A(n2), .Y(n1) );
  INVX20TS U3 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_81 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1, n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(n1), .B1(D1[0]), .Y(S[0]) );
  CLKINVX20TS U2 ( .A(n2), .Y(n1) );
  INVX20TS U3 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_80 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1, n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(n1), .B1(D1[0]), .Y(S[0]) );
  CLKINVX20TS U2 ( .A(n2), .Y(n1) );
  INVX20TS U3 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_79 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1, n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(n1), .B1(D1[0]), .Y(S[0]) );
  CLKINVX20TS U2 ( .A(n2), .Y(n1) );
  INVX20TS U3 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_78 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1, n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(n1), .B1(D1[0]), .Y(S[0]) );
  CLKINVX20TS U2 ( .A(n2), .Y(n1) );
  INVX20TS U3 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_77 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1, n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(n1), .B1(D1[0]), .Y(S[0]) );
  CLKINVX20TS U2 ( .A(n2), .Y(n1) );
  INVX20TS U3 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_76 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1, n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(n1), .B1(D1[0]), .Y(S[0]) );
  CLKINVX20TS U2 ( .A(n2), .Y(n1) );
  INVX20TS U3 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_75 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1, n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(n1), .B1(D1[0]), .Y(S[0]) );
  CLKINVX20TS U2 ( .A(n2), .Y(n1) );
  INVX20TS U3 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_74 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1, n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(n1), .B1(D1[0]), .Y(S[0]) );
  CLKINVX20TS U2 ( .A(n2), .Y(n1) );
  INVX20TS U3 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_73 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1, n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(n1), .B1(D1[0]), .Y(S[0]) );
  CLKINVX20TS U2 ( .A(n2), .Y(n1) );
  INVX20TS U3 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_72 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1, n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(n1), .B1(D1[0]), .Y(S[0]) );
  CLKINVX20TS U2 ( .A(n2), .Y(n1) );
  INVX20TS U3 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_71 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1, n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(n1), .B1(D1[0]), .Y(S[0]) );
  CLKINVX20TS U2 ( .A(n2), .Y(n1) );
  INVX20TS U3 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_70 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1, n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(n1), .B1(D1[0]), .Y(S[0]) );
  CLKINVX20TS U2 ( .A(n2), .Y(n1) );
  INVX20TS U3 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_69 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1, n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(n1), .B1(D1[0]), .Y(S[0]) );
  CLKINVX20TS U2 ( .A(n2), .Y(n1) );
  INVX20TS U3 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_68 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1, n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(n1), .B1(D1[0]), .Y(S[0]) );
  CLKINVX20TS U2 ( .A(n2), .Y(n1) );
  INVX20TS U3 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_67 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1, n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(n1), .B1(D1[0]), .Y(S[0]) );
  CLKINVX20TS U2 ( .A(n2), .Y(n1) );
  INVX20TS U3 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_66 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1, n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(n1), .B1(D1[0]), .Y(S[0]) );
  CLKINVX20TS U2 ( .A(n2), .Y(n1) );
  INVX20TS U3 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_65 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1, n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(n1), .B1(D1[0]), .Y(S[0]) );
  CLKINVX20TS U2 ( .A(n2), .Y(n1) );
  INVX20TS U3 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_64 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1, n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(n1), .B1(D1[0]), .Y(S[0]) );
  CLKINVX20TS U2 ( .A(n2), .Y(n1) );
  INVX20TS U3 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_63 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1, n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(n1), .B1(D1[0]), .Y(S[0]) );
  CLKINVX20TS U2 ( .A(n2), .Y(n1) );
  INVX20TS U3 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_62 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1, n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(n1), .B1(D1[0]), .Y(S[0]) );
  CLKINVX20TS U2 ( .A(n2), .Y(n1) );
  INVX20TS U3 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_61 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1, n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(n1), .B1(D1[0]), .Y(S[0]) );
  CLKINVX20TS U2 ( .A(n2), .Y(n1) );
  INVX20TS U3 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_60 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1, n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(n1), .B1(D1[0]), .Y(S[0]) );
  CLKINVX20TS U2 ( .A(n2), .Y(n1) );
  INVX20TS U3 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_59 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1, n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(n1), .B1(D1[0]), .Y(S[0]) );
  CLKINVX20TS U2 ( .A(n2), .Y(n1) );
  INVX20TS U3 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_58 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1, n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(n1), .B1(D1[0]), .Y(S[0]) );
  CLKINVX20TS U2 ( .A(n2), .Y(n1) );
  INVX20TS U3 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_57 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1, n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(n1), .B1(D1[0]), .Y(S[0]) );
  CLKINVX20TS U2 ( .A(n2), .Y(n1) );
  INVX20TS U3 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_56 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1, n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(n1), .B1(D1[0]), .Y(S[0]) );
  CLKINVX20TS U2 ( .A(n2), .Y(n1) );
  INVX20TS U3 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_55 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1, n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(n1), .B1(D1[0]), .Y(S[0]) );
  CLKINVX20TS U2 ( .A(n2), .Y(n1) );
  INVX20TS U3 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_54 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1, n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(n1), .B1(D1[0]), .Y(S[0]) );
  CLKINVX20TS U2 ( .A(n2), .Y(n1) );
  INVX20TS U3 ( .A(ctrl), .Y(n2) );
endmodule


module Multiplexer_AC_W1_53 ( ctrl, D0, D1, S );
  input [0:0] D0;
  input [0:0] D1;
  output [0:0] S;
  input ctrl;
  wire   n1, n2;

  AO22X1TS U1 ( .A0(D0[0]), .A1(n2), .B0(n1), .B1(D1[0]), .Y(S[0]) );
  CLKINVX20TS U2 ( .A(n2), .Y(n1) );
  INVX20TS U3 ( .A(ctrl), .Y(n2) );
endmodule


module Rotate_Mux_Array_SWR55_1 ( Data_i, select_i, Data_o );
  input [54:0] Data_i;
  output [54:0] Data_o;
  input select_i;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9;
  assign Data_o[27] = Data_i[27];

  Multiplexer_AC_W1_106 MUX_ARRAY_0__MUX_ARRAY12_rotate_mux ( .ctrl(n1), .D0(
        Data_i[0]), .D1(Data_i[54]), .S(Data_o[0]) );
  Multiplexer_AC_W1_105 MUX_ARRAY_1__MUX_ARRAY12_rotate_mux ( .ctrl(n1), .D0(
        Data_i[1]), .D1(Data_i[53]), .S(Data_o[1]) );
  Multiplexer_AC_W1_104 MUX_ARRAY_2__MUX_ARRAY12_rotate_mux ( .ctrl(n1), .D0(
        Data_i[2]), .D1(Data_i[52]), .S(Data_o[2]) );
  Multiplexer_AC_W1_103 MUX_ARRAY_3__MUX_ARRAY12_rotate_mux ( .ctrl(n1), .D0(
        Data_i[3]), .D1(Data_i[51]), .S(Data_o[3]) );
  Multiplexer_AC_W1_102 MUX_ARRAY_4__MUX_ARRAY12_rotate_mux ( .ctrl(n1), .D0(
        Data_i[4]), .D1(Data_i[50]), .S(Data_o[4]) );
  Multiplexer_AC_W1_101 MUX_ARRAY_5__MUX_ARRAY12_rotate_mux ( .ctrl(n1), .D0(
        Data_i[5]), .D1(Data_i[49]), .S(Data_o[5]) );
  Multiplexer_AC_W1_100 MUX_ARRAY_6__MUX_ARRAY12_rotate_mux ( .ctrl(n1), .D0(
        Data_i[6]), .D1(Data_i[48]), .S(Data_o[6]) );
  Multiplexer_AC_W1_99 MUX_ARRAY_7__MUX_ARRAY12_rotate_mux ( .ctrl(n1), .D0(
        Data_i[7]), .D1(Data_i[47]), .S(Data_o[7]) );
  Multiplexer_AC_W1_98 MUX_ARRAY_8__MUX_ARRAY12_rotate_mux ( .ctrl(n1), .D0(
        Data_i[8]), .D1(Data_i[46]), .S(Data_o[8]) );
  Multiplexer_AC_W1_97 MUX_ARRAY_9__MUX_ARRAY12_rotate_mux ( .ctrl(n1), .D0(
        Data_i[9]), .D1(Data_i[45]), .S(Data_o[9]) );
  Multiplexer_AC_W1_96 MUX_ARRAY_10__MUX_ARRAY12_rotate_mux ( .ctrl(n2), .D0(
        Data_i[10]), .D1(Data_i[44]), .S(Data_o[10]) );
  Multiplexer_AC_W1_95 MUX_ARRAY_11__MUX_ARRAY12_rotate_mux ( .ctrl(n2), .D0(
        Data_i[11]), .D1(Data_i[43]), .S(Data_o[11]) );
  Multiplexer_AC_W1_94 MUX_ARRAY_12__MUX_ARRAY12_rotate_mux ( .ctrl(n2), .D0(
        Data_i[12]), .D1(Data_i[42]), .S(Data_o[12]) );
  Multiplexer_AC_W1_93 MUX_ARRAY_13__MUX_ARRAY12_rotate_mux ( .ctrl(n2), .D0(
        Data_i[13]), .D1(Data_i[41]), .S(Data_o[13]) );
  Multiplexer_AC_W1_92 MUX_ARRAY_14__MUX_ARRAY12_rotate_mux ( .ctrl(n2), .D0(
        Data_i[14]), .D1(Data_i[40]), .S(Data_o[14]) );
  Multiplexer_AC_W1_91 MUX_ARRAY_15__MUX_ARRAY12_rotate_mux ( .ctrl(n2), .D0(
        Data_i[15]), .D1(Data_i[39]), .S(Data_o[15]) );
  Multiplexer_AC_W1_90 MUX_ARRAY_16__MUX_ARRAY12_rotate_mux ( .ctrl(n2), .D0(
        Data_i[16]), .D1(Data_i[38]), .S(Data_o[16]) );
  Multiplexer_AC_W1_89 MUX_ARRAY_17__MUX_ARRAY12_rotate_mux ( .ctrl(n2), .D0(
        Data_i[17]), .D1(Data_i[37]), .S(Data_o[17]) );
  Multiplexer_AC_W1_88 MUX_ARRAY_18__MUX_ARRAY12_rotate_mux ( .ctrl(n2), .D0(
        Data_i[18]), .D1(Data_i[36]), .S(Data_o[18]) );
  Multiplexer_AC_W1_87 MUX_ARRAY_19__MUX_ARRAY12_rotate_mux ( .ctrl(n2), .D0(
        Data_i[19]), .D1(Data_i[35]), .S(Data_o[19]) );
  Multiplexer_AC_W1_86 MUX_ARRAY_20__MUX_ARRAY12_rotate_mux ( .ctrl(n3), .D0(
        Data_i[20]), .D1(Data_i[34]), .S(Data_o[20]) );
  Multiplexer_AC_W1_85 MUX_ARRAY_21__MUX_ARRAY12_rotate_mux ( .ctrl(n3), .D0(
        Data_i[21]), .D1(Data_i[33]), .S(Data_o[21]) );
  Multiplexer_AC_W1_84 MUX_ARRAY_22__MUX_ARRAY12_rotate_mux ( .ctrl(n3), .D0(
        Data_i[22]), .D1(Data_i[32]), .S(Data_o[22]) );
  Multiplexer_AC_W1_83 MUX_ARRAY_23__MUX_ARRAY12_rotate_mux ( .ctrl(n3), .D0(
        Data_i[23]), .D1(Data_i[31]), .S(Data_o[23]) );
  Multiplexer_AC_W1_82 MUX_ARRAY_24__MUX_ARRAY12_rotate_mux ( .ctrl(n3), .D0(
        Data_i[24]), .D1(Data_i[30]), .S(Data_o[24]) );
  Multiplexer_AC_W1_81 MUX_ARRAY_25__MUX_ARRAY12_rotate_mux ( .ctrl(n3), .D0(
        Data_i[25]), .D1(Data_i[29]), .S(Data_o[25]) );
  Multiplexer_AC_W1_80 MUX_ARRAY_26__MUX_ARRAY12_rotate_mux ( .ctrl(n3), .D0(
        Data_i[26]), .D1(Data_i[28]), .S(Data_o[26]) );
  Multiplexer_AC_W1_79 MUX_ARRAY_28__MUX_ARRAY12_rotate_mux ( .ctrl(n3), .D0(
        Data_i[28]), .D1(Data_i[26]), .S(Data_o[28]) );
  Multiplexer_AC_W1_78 MUX_ARRAY_29__MUX_ARRAY12_rotate_mux ( .ctrl(n3), .D0(
        Data_i[29]), .D1(Data_i[25]), .S(Data_o[29]) );
  Multiplexer_AC_W1_77 MUX_ARRAY_30__MUX_ARRAY12_rotate_mux ( .ctrl(n3), .D0(
        Data_i[30]), .D1(Data_i[24]), .S(Data_o[30]) );
  Multiplexer_AC_W1_76 MUX_ARRAY_31__MUX_ARRAY12_rotate_mux ( .ctrl(n4), .D0(
        Data_i[31]), .D1(Data_i[23]), .S(Data_o[31]) );
  Multiplexer_AC_W1_75 MUX_ARRAY_32__MUX_ARRAY12_rotate_mux ( .ctrl(n4), .D0(
        Data_i[32]), .D1(Data_i[22]), .S(Data_o[32]) );
  Multiplexer_AC_W1_74 MUX_ARRAY_33__MUX_ARRAY12_rotate_mux ( .ctrl(n4), .D0(
        Data_i[33]), .D1(Data_i[21]), .S(Data_o[33]) );
  Multiplexer_AC_W1_73 MUX_ARRAY_34__MUX_ARRAY12_rotate_mux ( .ctrl(n4), .D0(
        Data_i[34]), .D1(Data_i[20]), .S(Data_o[34]) );
  Multiplexer_AC_W1_72 MUX_ARRAY_35__MUX_ARRAY12_rotate_mux ( .ctrl(n4), .D0(
        Data_i[35]), .D1(Data_i[19]), .S(Data_o[35]) );
  Multiplexer_AC_W1_71 MUX_ARRAY_36__MUX_ARRAY12_rotate_mux ( .ctrl(n4), .D0(
        Data_i[36]), .D1(Data_i[18]), .S(Data_o[36]) );
  Multiplexer_AC_W1_70 MUX_ARRAY_37__MUX_ARRAY12_rotate_mux ( .ctrl(n4), .D0(
        Data_i[37]), .D1(Data_i[17]), .S(Data_o[37]) );
  Multiplexer_AC_W1_69 MUX_ARRAY_38__MUX_ARRAY12_rotate_mux ( .ctrl(n4), .D0(
        Data_i[38]), .D1(Data_i[16]), .S(Data_o[38]) );
  Multiplexer_AC_W1_68 MUX_ARRAY_39__MUX_ARRAY12_rotate_mux ( .ctrl(n4), .D0(
        Data_i[39]), .D1(Data_i[15]), .S(Data_o[39]) );
  Multiplexer_AC_W1_67 MUX_ARRAY_40__MUX_ARRAY12_rotate_mux ( .ctrl(n4), .D0(
        Data_i[40]), .D1(Data_i[14]), .S(Data_o[40]) );
  Multiplexer_AC_W1_66 MUX_ARRAY_41__MUX_ARRAY12_rotate_mux ( .ctrl(n5), .D0(
        Data_i[41]), .D1(Data_i[13]), .S(Data_o[41]) );
  Multiplexer_AC_W1_65 MUX_ARRAY_42__MUX_ARRAY12_rotate_mux ( .ctrl(n5), .D0(
        Data_i[42]), .D1(Data_i[12]), .S(Data_o[42]) );
  Multiplexer_AC_W1_64 MUX_ARRAY_43__MUX_ARRAY12_rotate_mux ( .ctrl(n5), .D0(
        Data_i[43]), .D1(Data_i[11]), .S(Data_o[43]) );
  Multiplexer_AC_W1_63 MUX_ARRAY_44__MUX_ARRAY12_rotate_mux ( .ctrl(n5), .D0(
        Data_i[44]), .D1(Data_i[10]), .S(Data_o[44]) );
  Multiplexer_AC_W1_62 MUX_ARRAY_45__MUX_ARRAY12_rotate_mux ( .ctrl(n5), .D0(
        Data_i[45]), .D1(Data_i[9]), .S(Data_o[45]) );
  Multiplexer_AC_W1_61 MUX_ARRAY_46__MUX_ARRAY12_rotate_mux ( .ctrl(n5), .D0(
        Data_i[46]), .D1(Data_i[8]), .S(Data_o[46]) );
  Multiplexer_AC_W1_60 MUX_ARRAY_47__MUX_ARRAY12_rotate_mux ( .ctrl(n5), .D0(
        Data_i[47]), .D1(Data_i[7]), .S(Data_o[47]) );
  Multiplexer_AC_W1_59 MUX_ARRAY_48__MUX_ARRAY12_rotate_mux ( .ctrl(n5), .D0(
        Data_i[48]), .D1(Data_i[6]), .S(Data_o[48]) );
  Multiplexer_AC_W1_58 MUX_ARRAY_49__MUX_ARRAY12_rotate_mux ( .ctrl(n5), .D0(
        Data_i[49]), .D1(Data_i[5]), .S(Data_o[49]) );
  Multiplexer_AC_W1_57 MUX_ARRAY_50__MUX_ARRAY12_rotate_mux ( .ctrl(n5), .D0(
        Data_i[50]), .D1(Data_i[4]), .S(Data_o[50]) );
  Multiplexer_AC_W1_56 MUX_ARRAY_51__MUX_ARRAY12_rotate_mux ( .ctrl(n6), .D0(
        Data_i[51]), .D1(Data_i[3]), .S(Data_o[51]) );
  Multiplexer_AC_W1_55 MUX_ARRAY_52__MUX_ARRAY12_rotate_mux ( .ctrl(n6), .D0(
        Data_i[52]), .D1(Data_i[2]), .S(Data_o[52]) );
  Multiplexer_AC_W1_54 MUX_ARRAY_53__MUX_ARRAY12_rotate_mux ( .ctrl(n6), .D0(
        Data_i[53]), .D1(Data_i[1]), .S(Data_o[53]) );
  Multiplexer_AC_W1_53 MUX_ARRAY_54__MUX_ARRAY12_rotate_mux ( .ctrl(n6), .D0(
        Data_i[54]), .D1(Data_i[0]), .S(Data_o[54]) );
  BUFX20TS U1 ( .A(n9), .Y(n1) );
  BUFX20TS U2 ( .A(n9), .Y(n2) );
  BUFX20TS U3 ( .A(n8), .Y(n3) );
  BUFX20TS U4 ( .A(n8), .Y(n4) );
  BUFX20TS U5 ( .A(n7), .Y(n5) );
  BUFX20TS U6 ( .A(n7), .Y(n6) );
  CLKBUFX20TS U7 ( .A(select_i), .Y(n7) );
  CLKBUFX20TS U8 ( .A(select_i), .Y(n8) );
  CLKBUFX20TS U9 ( .A(select_i), .Y(n9) );
endmodule


module Mux_Array_SWR55_EWR6 ( clk, rst, load_i, Data_i, FSM_left_right_i, 
        Shift_Value_i, bit_shift_i, Data_o );
  input [54:0] Data_i;
  input [5:0] Shift_Value_i;
  output [54:0] Data_o;
  input clk, rst, load_i, FSM_left_right_i, bit_shift_i;

  wire   [439:0] Data_array;

  Rotate_Mux_Array_SWR55_0 first_rotate ( .Data_i(Data_i), .select_i(
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
  RegisterAdd_W55_1 Mid_Reg ( .clk(clk), .rst(rst), .load(1'b1), .D(
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
  Rotate_Mux_Array_SWR55_1 last_rotate ( .Data_i(Data_array[439:385]), 
        .select_i(FSM_left_right_i), .Data_o(Data_o) );
endmodule


module RegisterAdd_W64_1 ( clk, rst, load, D, Q );
  input [63:0] D;
  output [63:0] Q;
  input clk, rst, load;
  wire   n130, n131, n132, n133, n134, n135, n136, n137, n138, n139, n140,
         n141, n142, n143, n144, n145, n146, n147, n148, n149, n150, n151,
         n152, n153, n154, n155, n156, n157, n158, n159, n160, n161, n162,
         n163, n164, n165, n166, n167, n168, n169, n170, n171, n172, n173,
         n174, n175, n176, n177, n178, n179, n180, n181, n182, n183, n184,
         n185, n186, n187, n188, n189, n190, n191, n192, n193, n194, n195,
         n196, n197, n198, n199, n200, n201, n202, n203, n204, n205, n206,
         n207, n208, n209, n210, n211, n212, n213, n214, n215, n216, n217,
         n218, n219, n220, n221, n222, n223, n224, n225, n226, n227, n228,
         n229, n230, n231, n232, n233, n234, n235, n236, n237, n238, n239,
         n240, n241, n242, n243, n244, n245, n246, n247, n248, n249, n250,
         n251, n252, n253, n254, n255, n256, n257, n258, n259, n260, n261,
         n262, n263, n264, n265, n266, n267, n268, n269, n270, n271, n272,
         n273, n274, n275, n276, n277, n278;

  OAI2BB2XLTS U2 ( .B0(n278), .B1(n130), .A0N(n142), .A1N(D[0]), .Y(n214) );
  OAI2BB2XLTS U3 ( .B0(n277), .B1(n130), .A0N(D[1]), .A1N(n142), .Y(n213) );
  OAI2BB2XLTS U4 ( .B0(n276), .B1(n130), .A0N(D[2]), .A1N(n142), .Y(n212) );
  OAI2BB2XLTS U5 ( .B0(n275), .B1(n130), .A0N(D[3]), .A1N(n142), .Y(n211) );
  OAI2BB2XLTS U6 ( .B0(n274), .B1(n130), .A0N(D[4]), .A1N(n142), .Y(n210) );
  OAI2BB2XLTS U7 ( .B0(n273), .B1(n131), .A0N(D[5]), .A1N(n142), .Y(n209) );
  OAI2BB2XLTS U8 ( .B0(n272), .B1(n130), .A0N(D[6]), .A1N(n142), .Y(n208) );
  OAI2BB2XLTS U9 ( .B0(n271), .B1(n130), .A0N(D[7]), .A1N(n142), .Y(n207) );
  OAI2BB2XLTS U10 ( .B0(n270), .B1(n131), .A0N(D[8]), .A1N(n141), .Y(n206) );
  OAI2BB2XLTS U11 ( .B0(n269), .B1(n131), .A0N(D[9]), .A1N(n141), .Y(n205) );
  OAI2BB2XLTS U12 ( .B0(n268), .B1(n131), .A0N(D[10]), .A1N(n141), .Y(n204) );
  OAI2BB2XLTS U13 ( .B0(n267), .B1(n132), .A0N(D[11]), .A1N(n141), .Y(n203) );
  OAI2BB2XLTS U14 ( .B0(n266), .B1(n131), .A0N(D[12]), .A1N(n141), .Y(n202) );
  OAI2BB2XLTS U15 ( .B0(n265), .B1(n132), .A0N(D[13]), .A1N(n141), .Y(n201) );
  OAI2BB2XLTS U16 ( .B0(n264), .B1(n131), .A0N(D[14]), .A1N(n141), .Y(n200) );
  OAI2BB2XLTS U17 ( .B0(n263), .B1(n131), .A0N(D[15]), .A1N(n141), .Y(n199) );
  OAI2BB2XLTS U18 ( .B0(n262), .B1(n132), .A0N(D[16]), .A1N(n141), .Y(n198) );
  OAI2BB2XLTS U19 ( .B0(n261), .B1(n133), .A0N(D[17]), .A1N(n141), .Y(n197) );
  OAI2BB2XLTS U20 ( .B0(n260), .B1(n132), .A0N(D[18]), .A1N(n140), .Y(n196) );
  OAI2BB2XLTS U21 ( .B0(n259), .B1(n133), .A0N(D[19]), .A1N(n140), .Y(n195) );
  OAI2BB2XLTS U22 ( .B0(n258), .B1(n133), .A0N(D[20]), .A1N(n140), .Y(n194) );
  OAI2BB2XLTS U23 ( .B0(n257), .B1(n132), .A0N(D[21]), .A1N(n140), .Y(n193) );
  OAI2BB2XLTS U24 ( .B0(n256), .B1(n133), .A0N(D[22]), .A1N(n140), .Y(n192) );
  OAI2BB2XLTS U25 ( .B0(n255), .B1(n134), .A0N(D[23]), .A1N(n140), .Y(n191) );
  OAI2BB2XLTS U26 ( .B0(n254), .B1(n133), .A0N(D[24]), .A1N(n140), .Y(n190) );
  OAI2BB2XLTS U27 ( .B0(n253), .B1(n134), .A0N(D[25]), .A1N(n140), .Y(n189) );
  OAI2BB2XLTS U28 ( .B0(n252), .B1(n134), .A0N(D[26]), .A1N(n140), .Y(n188) );
  OAI2BB2XLTS U29 ( .B0(n251), .B1(n133), .A0N(D[27]), .A1N(n140), .Y(n187) );
  OAI2BB2XLTS U30 ( .B0(n250), .B1(n132), .A0N(D[28]), .A1N(n139), .Y(n186) );
  OAI2BB2XLTS U31 ( .B0(n249), .B1(n135), .A0N(D[29]), .A1N(n139), .Y(n185) );
  OAI2BB2XLTS U32 ( .B0(n248), .B1(n134), .A0N(D[30]), .A1N(n139), .Y(n184) );
  OAI2BB2XLTS U33 ( .B0(n247), .B1(n135), .A0N(D[31]), .A1N(n139), .Y(n183) );
  OAI2BB2XLTS U34 ( .B0(n246), .B1(n135), .A0N(D[32]), .A1N(n139), .Y(n182) );
  OAI2BB2XLTS U35 ( .B0(n245), .B1(n134), .A0N(D[33]), .A1N(n139), .Y(n181) );
  OAI2BB2XLTS U36 ( .B0(n244), .B1(n135), .A0N(D[34]), .A1N(n139), .Y(n180) );
  OAI2BB2XLTS U37 ( .B0(n243), .B1(n134), .A0N(D[35]), .A1N(n139), .Y(n179) );
  OAI2BB2XLTS U38 ( .B0(n242), .B1(n134), .A0N(D[36]), .A1N(n139), .Y(n178) );
  OAI2BB2XLTS U39 ( .B0(n241), .B1(n136), .A0N(D[37]), .A1N(n139), .Y(n177) );
  OAI2BB2XLTS U40 ( .B0(n240), .B1(n136), .A0N(D[38]), .A1N(n138), .Y(n176) );
  OAI2BB2XLTS U41 ( .B0(n239), .B1(n135), .A0N(D[39]), .A1N(n138), .Y(n175) );
  OAI2BB2XLTS U42 ( .B0(n238), .B1(n136), .A0N(D[40]), .A1N(n138), .Y(n174) );
  OAI2BB2XLTS U43 ( .B0(n237), .B1(n136), .A0N(D[41]), .A1N(n138), .Y(n173) );
  OAI2BB2XLTS U44 ( .B0(n236), .B1(n135), .A0N(D[42]), .A1N(n138), .Y(n172) );
  OAI2BB2XLTS U45 ( .B0(n235), .B1(n135), .A0N(D[43]), .A1N(n138), .Y(n171) );
  OAI2BB2XLTS U46 ( .B0(n234), .B1(n134), .A0N(D[44]), .A1N(n138), .Y(n170) );
  OAI2BB2XLTS U47 ( .B0(n233), .B1(n135), .A0N(D[45]), .A1N(n137), .Y(n169) );
  OAI2BB2XLTS U48 ( .B0(n232), .B1(n134), .A0N(D[46]), .A1N(n138), .Y(n168) );
  OAI2BB2XLTS U49 ( .B0(n231), .B1(n135), .A0N(D[47]), .A1N(n137), .Y(n167) );
  OAI2BB2XLTS U50 ( .B0(n230), .B1(n135), .A0N(D[48]), .A1N(n137), .Y(n166) );
  OAI2BB2XLTS U51 ( .B0(n229), .B1(n133), .A0N(D[49]), .A1N(n137), .Y(n165) );
  OAI2BB2XLTS U52 ( .B0(n228), .B1(n134), .A0N(D[50]), .A1N(n137), .Y(n164) );
  OAI2BB2XLTS U53 ( .B0(n227), .B1(n133), .A0N(D[51]), .A1N(n136), .Y(n163) );
  OAI2BB2XLTS U54 ( .B0(n226), .B1(n132), .A0N(D[52]), .A1N(n136), .Y(n162) );
  OAI2BB2XLTS U55 ( .B0(n225), .B1(n133), .A0N(D[53]), .A1N(n137), .Y(n161) );
  OAI2BB2XLTS U56 ( .B0(n224), .B1(n133), .A0N(D[54]), .A1N(n137), .Y(n160) );
  OAI2BB2XLTS U57 ( .B0(n223), .B1(n132), .A0N(D[55]), .A1N(n136), .Y(n159) );
  OAI2BB2XLTS U58 ( .B0(n222), .B1(n132), .A0N(D[56]), .A1N(n137), .Y(n158) );
  OAI2BB2XLTS U59 ( .B0(n221), .B1(n132), .A0N(D[57]), .A1N(n136), .Y(n157) );
  OAI2BB2XLTS U60 ( .B0(n220), .B1(n131), .A0N(D[58]), .A1N(n136), .Y(n156) );
  OAI2BB2XLTS U61 ( .B0(n219), .B1(n131), .A0N(D[59]), .A1N(n137), .Y(n155) );
  OAI2BB2XLTS U62 ( .B0(n218), .B1(n131), .A0N(D[60]), .A1N(n136), .Y(n154) );
  OAI2BB2XLTS U63 ( .B0(n217), .B1(n130), .A0N(D[61]), .A1N(n138), .Y(n153) );
  OAI2BB2XLTS U64 ( .B0(n216), .B1(n130), .A0N(D[62]), .A1N(n137), .Y(n152) );
  OAI2BB2XLTS U65 ( .B0(n215), .B1(n130), .A0N(D[63]), .A1N(n138), .Y(n150) );
  INVX2TS U66 ( .A(rst), .Y(n151) );
  DFFRX2TS Q_reg_63_ ( .D(n150), .CK(clk), .RN(n151), .Q(Q[63]), .QN(n215) );
  DFFRX2TS Q_reg_62_ ( .D(n152), .CK(clk), .RN(n151), .Q(Q[62]), .QN(n216) );
  DFFRX2TS Q_reg_61_ ( .D(n153), .CK(clk), .RN(n151), .Q(Q[61]), .QN(n217) );
  DFFRX2TS Q_reg_59_ ( .D(n155), .CK(clk), .RN(n151), .Q(Q[59]), .QN(n219) );
  DFFRX2TS Q_reg_56_ ( .D(n158), .CK(clk), .RN(n151), .Q(Q[56]), .QN(n222) );
  DFFRX2TS Q_reg_54_ ( .D(n160), .CK(clk), .RN(n151), .Q(Q[54]), .QN(n224) );
  DFFRX2TS Q_reg_53_ ( .D(n161), .CK(clk), .RN(n151), .Q(Q[53]), .QN(n225) );
  DFFRX2TS Q_reg_60_ ( .D(n154), .CK(clk), .RN(n151), .Q(Q[60]), .QN(n218) );
  DFFRX2TS Q_reg_58_ ( .D(n156), .CK(clk), .RN(n151), .Q(Q[58]), .QN(n220) );
  DFFRX2TS Q_reg_57_ ( .D(n157), .CK(clk), .RN(n151), .Q(Q[57]), .QN(n221) );
  DFFRX2TS Q_reg_55_ ( .D(n159), .CK(clk), .RN(n151), .Q(Q[55]), .QN(n223) );
  DFFRX2TS Q_reg_52_ ( .D(n162), .CK(clk), .RN(n151), .Q(Q[52]), .QN(n226) );
  DFFRX1TS Q_reg_0_ ( .D(n214), .CK(clk), .RN(n151), .Q(Q[0]), .QN(n278) );
  DFFRX1TS Q_reg_51_ ( .D(n163), .CK(clk), .RN(n151), .Q(Q[51]), .QN(n227) );
  DFFRX1TS Q_reg_50_ ( .D(n164), .CK(clk), .RN(n151), .Q(Q[50]), .QN(n228) );
  DFFRX1TS Q_reg_49_ ( .D(n165), .CK(clk), .RN(n151), .Q(Q[49]), .QN(n229) );
  DFFRX1TS Q_reg_48_ ( .D(n166), .CK(clk), .RN(n151), .Q(Q[48]), .QN(n230) );
  DFFRX1TS Q_reg_47_ ( .D(n167), .CK(clk), .RN(n151), .Q(Q[47]), .QN(n231) );
  DFFRX1TS Q_reg_46_ ( .D(n168), .CK(clk), .RN(n151), .Q(Q[46]), .QN(n232) );
  DFFRX1TS Q_reg_45_ ( .D(n169), .CK(clk), .RN(n151), .Q(Q[45]), .QN(n233) );
  DFFRX1TS Q_reg_44_ ( .D(n170), .CK(clk), .RN(n151), .Q(Q[44]), .QN(n234) );
  DFFRX1TS Q_reg_43_ ( .D(n171), .CK(clk), .RN(n151), .Q(Q[43]), .QN(n235) );
  DFFRX1TS Q_reg_42_ ( .D(n172), .CK(clk), .RN(n151), .Q(Q[42]), .QN(n236) );
  DFFRX1TS Q_reg_41_ ( .D(n173), .CK(clk), .RN(n151), .Q(Q[41]), .QN(n237) );
  DFFRX1TS Q_reg_40_ ( .D(n174), .CK(clk), .RN(n151), .Q(Q[40]), .QN(n238) );
  DFFRX1TS Q_reg_39_ ( .D(n175), .CK(clk), .RN(n151), .Q(Q[39]), .QN(n239) );
  DFFRX1TS Q_reg_38_ ( .D(n176), .CK(clk), .RN(n151), .Q(Q[38]), .QN(n240) );
  DFFRX1TS Q_reg_37_ ( .D(n177), .CK(clk), .RN(n151), .Q(Q[37]), .QN(n241) );
  DFFRX1TS Q_reg_36_ ( .D(n178), .CK(clk), .RN(n151), .Q(Q[36]), .QN(n242) );
  DFFRX1TS Q_reg_35_ ( .D(n179), .CK(clk), .RN(n151), .Q(Q[35]), .QN(n243) );
  DFFRX1TS Q_reg_34_ ( .D(n180), .CK(clk), .RN(n151), .Q(Q[34]), .QN(n244) );
  DFFRX1TS Q_reg_33_ ( .D(n181), .CK(clk), .RN(n151), .Q(Q[33]), .QN(n245) );
  DFFRX1TS Q_reg_32_ ( .D(n182), .CK(clk), .RN(n151), .Q(Q[32]), .QN(n246) );
  DFFRX1TS Q_reg_31_ ( .D(n183), .CK(clk), .RN(n151), .Q(Q[31]), .QN(n247) );
  DFFRX1TS Q_reg_30_ ( .D(n184), .CK(clk), .RN(n151), .Q(Q[30]), .QN(n248) );
  DFFRX1TS Q_reg_29_ ( .D(n185), .CK(clk), .RN(n151), .Q(Q[29]), .QN(n249) );
  DFFRX1TS Q_reg_28_ ( .D(n186), .CK(clk), .RN(n151), .Q(Q[28]), .QN(n250) );
  DFFRX1TS Q_reg_27_ ( .D(n187), .CK(clk), .RN(n151), .Q(Q[27]), .QN(n251) );
  DFFRX1TS Q_reg_26_ ( .D(n188), .CK(clk), .RN(n151), .Q(Q[26]), .QN(n252) );
  DFFRX1TS Q_reg_25_ ( .D(n189), .CK(clk), .RN(n151), .Q(Q[25]), .QN(n253) );
  DFFRX1TS Q_reg_24_ ( .D(n190), .CK(clk), .RN(n151), .Q(Q[24]), .QN(n254) );
  DFFRX1TS Q_reg_23_ ( .D(n191), .CK(clk), .RN(n151), .Q(Q[23]), .QN(n255) );
  DFFRX1TS Q_reg_22_ ( .D(n192), .CK(clk), .RN(n151), .Q(Q[22]), .QN(n256) );
  DFFRX1TS Q_reg_21_ ( .D(n193), .CK(clk), .RN(n151), .Q(Q[21]), .QN(n257) );
  DFFRX1TS Q_reg_20_ ( .D(n194), .CK(clk), .RN(n151), .Q(Q[20]), .QN(n258) );
  DFFRX1TS Q_reg_19_ ( .D(n195), .CK(clk), .RN(n151), .Q(Q[19]), .QN(n259) );
  DFFRX1TS Q_reg_18_ ( .D(n196), .CK(clk), .RN(n151), .Q(Q[18]), .QN(n260) );
  DFFRX1TS Q_reg_17_ ( .D(n197), .CK(clk), .RN(n151), .Q(Q[17]), .QN(n261) );
  DFFRX1TS Q_reg_16_ ( .D(n198), .CK(clk), .RN(n151), .Q(Q[16]), .QN(n262) );
  DFFRX1TS Q_reg_15_ ( .D(n199), .CK(clk), .RN(n151), .Q(Q[15]), .QN(n263) );
  DFFRX1TS Q_reg_14_ ( .D(n200), .CK(clk), .RN(n151), .Q(Q[14]), .QN(n264) );
  DFFRX1TS Q_reg_13_ ( .D(n201), .CK(clk), .RN(n151), .Q(Q[13]), .QN(n265) );
  DFFRX1TS Q_reg_12_ ( .D(n202), .CK(clk), .RN(n151), .Q(Q[12]), .QN(n266) );
  DFFRX1TS Q_reg_11_ ( .D(n203), .CK(clk), .RN(n151), .Q(Q[11]), .QN(n267) );
  DFFRX1TS Q_reg_10_ ( .D(n204), .CK(clk), .RN(n151), .Q(Q[10]), .QN(n268) );
  DFFRX1TS Q_reg_9_ ( .D(n205), .CK(clk), .RN(n151), .Q(Q[9]), .QN(n269) );
  DFFRX1TS Q_reg_8_ ( .D(n206), .CK(clk), .RN(n151), .Q(Q[8]), .QN(n270) );
  DFFRX1TS Q_reg_7_ ( .D(n207), .CK(clk), .RN(n151), .Q(Q[7]), .QN(n271) );
  DFFRX1TS Q_reg_6_ ( .D(n208), .CK(clk), .RN(n151), .Q(Q[6]), .QN(n272) );
  DFFRX1TS Q_reg_5_ ( .D(n209), .CK(clk), .RN(n151), .Q(Q[5]), .QN(n273) );
  DFFRX1TS Q_reg_4_ ( .D(n210), .CK(clk), .RN(n151), .Q(Q[4]), .QN(n274) );
  DFFRX1TS Q_reg_3_ ( .D(n211), .CK(clk), .RN(n151), .Q(Q[3]), .QN(n275) );
  DFFRX1TS Q_reg_2_ ( .D(n212), .CK(clk), .RN(n151), .Q(Q[2]), .QN(n276) );
  DFFRX1TS Q_reg_1_ ( .D(n213), .CK(clk), .RN(n151), .Q(Q[1]), .QN(n277) );
  BUFX20TS U67 ( .A(n149), .Y(n130) );
  BUFX20TS U68 ( .A(n148), .Y(n131) );
  BUFX20TS U69 ( .A(n148), .Y(n132) );
  BUFX20TS U70 ( .A(n147), .Y(n133) );
  BUFX20TS U71 ( .A(n147), .Y(n134) );
  BUFX20TS U72 ( .A(n146), .Y(n135) );
  BUFX20TS U73 ( .A(n146), .Y(n136) );
  BUFX20TS U74 ( .A(n145), .Y(n137) );
  BUFX20TS U75 ( .A(n145), .Y(n138) );
  BUFX20TS U76 ( .A(n144), .Y(n139) );
  BUFX20TS U77 ( .A(n144), .Y(n140) );
  BUFX20TS U78 ( .A(n143), .Y(n141) );
  BUFX20TS U79 ( .A(n143), .Y(n142) );
  CLKBUFX20TS U80 ( .A(load), .Y(n143) );
  CLKBUFX20TS U81 ( .A(load), .Y(n144) );
  CLKBUFX20TS U82 ( .A(load), .Y(n145) );
  CLKBUFX20TS U83 ( .A(load), .Y(n146) );
  CLKBUFX20TS U84 ( .A(load), .Y(n147) );
  CLKBUFX20TS U85 ( .A(load), .Y(n148) );
  CLKBUFX20TS U86 ( .A(load), .Y(n149) );
endmodule


module Multiplexer_AC_W11_1 ( ctrl, D0, D1, S );
  input [10:0] D0;
  input [10:0] D1;
  output [10:0] S;
  input ctrl;
  wire   n2;

  AO22X1TS U1 ( .A0(ctrl), .A1(D1[9]), .B0(D0[9]), .B1(n2), .Y(S[9]) );
  AO22X1TS U2 ( .A0(D1[8]), .A1(ctrl), .B0(D0[8]), .B1(n2), .Y(S[8]) );
  AO22X1TS U3 ( .A0(D1[7]), .A1(ctrl), .B0(D0[7]), .B1(n2), .Y(S[7]) );
  AO22X1TS U4 ( .A0(D1[6]), .A1(ctrl), .B0(D0[6]), .B1(n2), .Y(S[6]) );
  AO22X1TS U5 ( .A0(D1[5]), .A1(ctrl), .B0(D0[5]), .B1(n2), .Y(S[5]) );
  AO22X1TS U6 ( .A0(D1[4]), .A1(ctrl), .B0(D0[4]), .B1(n2), .Y(S[4]) );
  AO22X1TS U7 ( .A0(D1[3]), .A1(ctrl), .B0(D0[3]), .B1(n2), .Y(S[3]) );
  AO22X1TS U8 ( .A0(D1[2]), .A1(ctrl), .B0(D0[2]), .B1(n2), .Y(S[2]) );
  AO22X1TS U9 ( .A0(D1[1]), .A1(ctrl), .B0(D0[1]), .B1(n2), .Y(S[1]) );
  AO22X1TS U10 ( .A0(D1[10]), .A1(ctrl), .B0(D0[10]), .B1(n2), .Y(S[10]) );
  AO22X1TS U11 ( .A0(D1[0]), .A1(ctrl), .B0(D0[0]), .B1(n2), .Y(S[0]) );
  CLKINVX1TS U12 ( .A(ctrl), .Y(n2) );
endmodule


module Mux_3x1_W1_1 ( ctrl, D0, D1, D2, S );
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


module add_sub_carry_out_W55_DW01_sub_0 ( A, B, CI, DIFF, CO );
  input [55:0] A;
  input [55:0] B;
  output [55:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2;
  wire   [55:1] carry;
  wire   [54:0] B_not;

  ADDFHX4TS U2_54 ( .A(A[54]), .B(B_not[54]), .CI(carry[54]), .CO(carry[55]), 
        .S(DIFF[54]) );
  INVX12TS U1_54 ( .A(B[54]), .Y(B_not[54]) );
  ADDFHX4TS U2_53 ( .A(A[53]), .B(B_not[53]), .CI(carry[53]), .CO(carry[54]), 
        .S(DIFF[53]) );
  INVX12TS U1_53 ( .A(B[53]), .Y(B_not[53]) );
  ADDFHX4TS U2_52 ( .A(A[52]), .B(B_not[52]), .CI(carry[52]), .CO(carry[53]), 
        .S(DIFF[52]) );
  INVX12TS U1_52 ( .A(B[52]), .Y(B_not[52]) );
  ADDFHX4TS U2_51 ( .A(A[51]), .B(B_not[51]), .CI(carry[51]), .CO(carry[52]), 
        .S(DIFF[51]) );
  INVX12TS U1_51 ( .A(B[51]), .Y(B_not[51]) );
  ADDFHX4TS U2_50 ( .A(A[50]), .B(B_not[50]), .CI(carry[50]), .CO(carry[51]), 
        .S(DIFF[50]) );
  INVX12TS U1_50 ( .A(B[50]), .Y(B_not[50]) );
  ADDFHX4TS U2_49 ( .A(A[49]), .B(B_not[49]), .CI(carry[49]), .CO(carry[50]), 
        .S(DIFF[49]) );
  INVX12TS U1_49 ( .A(B[49]), .Y(B_not[49]) );
  ADDFHX4TS U2_48 ( .A(A[48]), .B(B_not[48]), .CI(carry[48]), .CO(carry[49]), 
        .S(DIFF[48]) );
  INVX12TS U1_48 ( .A(B[48]), .Y(B_not[48]) );
  ADDFHX4TS U2_47 ( .A(A[47]), .B(B_not[47]), .CI(carry[47]), .CO(carry[48]), 
        .S(DIFF[47]) );
  INVX12TS U1_47 ( .A(B[47]), .Y(B_not[47]) );
  ADDFHX4TS U2_46 ( .A(A[46]), .B(B_not[46]), .CI(carry[46]), .CO(carry[47]), 
        .S(DIFF[46]) );
  INVX12TS U1_46 ( .A(B[46]), .Y(B_not[46]) );
  ADDFHX4TS U2_45 ( .A(A[45]), .B(B_not[45]), .CI(carry[45]), .CO(carry[46]), 
        .S(DIFF[45]) );
  INVX12TS U1_45 ( .A(B[45]), .Y(B_not[45]) );
  ADDFHX4TS U2_44 ( .A(A[44]), .B(B_not[44]), .CI(carry[44]), .CO(carry[45]), 
        .S(DIFF[44]) );
  INVX12TS U1_44 ( .A(B[44]), .Y(B_not[44]) );
  ADDFHX4TS U2_43 ( .A(A[43]), .B(B_not[43]), .CI(carry[43]), .CO(carry[44]), 
        .S(DIFF[43]) );
  INVX12TS U1_43 ( .A(B[43]), .Y(B_not[43]) );
  ADDFHX4TS U2_42 ( .A(A[42]), .B(B_not[42]), .CI(carry[42]), .CO(carry[43]), 
        .S(DIFF[42]) );
  INVX12TS U1_42 ( .A(B[42]), .Y(B_not[42]) );
  ADDFHX4TS U2_41 ( .A(A[41]), .B(B_not[41]), .CI(carry[41]), .CO(carry[42]), 
        .S(DIFF[41]) );
  INVX12TS U1_41 ( .A(B[41]), .Y(B_not[41]) );
  ADDFHX4TS U2_40 ( .A(A[40]), .B(B_not[40]), .CI(carry[40]), .CO(carry[41]), 
        .S(DIFF[40]) );
  INVX12TS U1_40 ( .A(B[40]), .Y(B_not[40]) );
  ADDFHX4TS U2_39 ( .A(A[39]), .B(B_not[39]), .CI(carry[39]), .CO(carry[40]), 
        .S(DIFF[39]) );
  INVX12TS U1_39 ( .A(B[39]), .Y(B_not[39]) );
  ADDFHX4TS U2_38 ( .A(A[38]), .B(B_not[38]), .CI(carry[38]), .CO(carry[39]), 
        .S(DIFF[38]) );
  INVX12TS U1_38 ( .A(B[38]), .Y(B_not[38]) );
  ADDFHX4TS U2_37 ( .A(A[37]), .B(B_not[37]), .CI(carry[37]), .CO(carry[38]), 
        .S(DIFF[37]) );
  INVX12TS U1_37 ( .A(B[37]), .Y(B_not[37]) );
  ADDFHX4TS U2_36 ( .A(A[36]), .B(B_not[36]), .CI(carry[36]), .CO(carry[37]), 
        .S(DIFF[36]) );
  INVX12TS U1_36 ( .A(B[36]), .Y(B_not[36]) );
  ADDFHX4TS U2_35 ( .A(A[35]), .B(B_not[35]), .CI(carry[35]), .CO(carry[36]), 
        .S(DIFF[35]) );
  INVX12TS U1_35 ( .A(B[35]), .Y(B_not[35]) );
  ADDFHX4TS U2_34 ( .A(A[34]), .B(B_not[34]), .CI(carry[34]), .CO(carry[35]), 
        .S(DIFF[34]) );
  INVX12TS U1_34 ( .A(B[34]), .Y(B_not[34]) );
  ADDFHX4TS U2_33 ( .A(A[33]), .B(B_not[33]), .CI(carry[33]), .CO(carry[34]), 
        .S(DIFF[33]) );
  INVX12TS U1_33 ( .A(B[33]), .Y(B_not[33]) );
  ADDFHX4TS U2_32 ( .A(A[32]), .B(B_not[32]), .CI(carry[32]), .CO(carry[33]), 
        .S(DIFF[32]) );
  INVX12TS U1_32 ( .A(B[32]), .Y(B_not[32]) );
  ADDFHX4TS U2_31 ( .A(A[31]), .B(B_not[31]), .CI(carry[31]), .CO(carry[32]), 
        .S(DIFF[31]) );
  INVX12TS U1_31 ( .A(B[31]), .Y(B_not[31]) );
  ADDFHX4TS U2_30 ( .A(A[30]), .B(B_not[30]), .CI(carry[30]), .CO(carry[31]), 
        .S(DIFF[30]) );
  INVX12TS U1_30 ( .A(B[30]), .Y(B_not[30]) );
  ADDFHX4TS U2_29 ( .A(A[29]), .B(B_not[29]), .CI(carry[29]), .CO(carry[30]), 
        .S(DIFF[29]) );
  INVX12TS U1_29 ( .A(B[29]), .Y(B_not[29]) );
  ADDFHX4TS U2_28 ( .A(A[28]), .B(B_not[28]), .CI(carry[28]), .CO(carry[29]), 
        .S(DIFF[28]) );
  INVX12TS U1_28 ( .A(B[28]), .Y(B_not[28]) );
  ADDFHX4TS U2_27 ( .A(A[27]), .B(B_not[27]), .CI(carry[27]), .CO(carry[28]), 
        .S(DIFF[27]) );
  INVX12TS U1_27 ( .A(B[27]), .Y(B_not[27]) );
  ADDFHX4TS U2_26 ( .A(A[26]), .B(B_not[26]), .CI(carry[26]), .CO(carry[27]), 
        .S(DIFF[26]) );
  INVX12TS U1_26 ( .A(B[26]), .Y(B_not[26]) );
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
  INVX12TS U5 ( .A(carry[55]), .Y(DIFF[55]) );
endmodule


module add_sub_carry_out_W55_DW01_add_0 ( A, B, CI, SUM, CO );
  input [55:0] A;
  input [55:0] B;
  output [55:0] SUM;
  input CI;
  output CO;
  wire   n1, n2;
  wire   [54:1] carry;

  ADDFHX4TS U1_54 ( .A(A[54]), .B(B[54]), .CI(carry[54]), .CO(SUM[55]), .S(
        SUM[54]) );
  ADDFHX4TS U1_53 ( .A(A[53]), .B(B[53]), .CI(carry[53]), .CO(carry[54]), .S(
        SUM[53]) );
  ADDFHX4TS U1_52 ( .A(A[52]), .B(B[52]), .CI(carry[52]), .CO(carry[53]), .S(
        SUM[52]) );
  ADDFHX4TS U1_51 ( .A(A[51]), .B(B[51]), .CI(carry[51]), .CO(carry[52]), .S(
        SUM[51]) );
  ADDFHX4TS U1_50 ( .A(A[50]), .B(B[50]), .CI(carry[50]), .CO(carry[51]), .S(
        SUM[50]) );
  ADDFHX4TS U1_49 ( .A(A[49]), .B(B[49]), .CI(carry[49]), .CO(carry[50]), .S(
        SUM[49]) );
  ADDFHX4TS U1_48 ( .A(A[48]), .B(B[48]), .CI(carry[48]), .CO(carry[49]), .S(
        SUM[48]) );
  ADDFHX4TS U1_47 ( .A(A[47]), .B(B[47]), .CI(carry[47]), .CO(carry[48]), .S(
        SUM[47]) );
  ADDFHX4TS U1_46 ( .A(A[46]), .B(B[46]), .CI(carry[46]), .CO(carry[47]), .S(
        SUM[46]) );
  ADDFHX4TS U1_45 ( .A(A[45]), .B(B[45]), .CI(carry[45]), .CO(carry[46]), .S(
        SUM[45]) );
  ADDFHX4TS U1_44 ( .A(A[44]), .B(B[44]), .CI(carry[44]), .CO(carry[45]), .S(
        SUM[44]) );
  ADDFHX4TS U1_43 ( .A(A[43]), .B(B[43]), .CI(carry[43]), .CO(carry[44]), .S(
        SUM[43]) );
  ADDFHX4TS U1_42 ( .A(A[42]), .B(B[42]), .CI(carry[42]), .CO(carry[43]), .S(
        SUM[42]) );
  ADDFHX4TS U1_41 ( .A(A[41]), .B(B[41]), .CI(carry[41]), .CO(carry[42]), .S(
        SUM[41]) );
  ADDFHX4TS U1_40 ( .A(A[40]), .B(B[40]), .CI(carry[40]), .CO(carry[41]), .S(
        SUM[40]) );
  ADDFHX4TS U1_39 ( .A(A[39]), .B(B[39]), .CI(carry[39]), .CO(carry[40]), .S(
        SUM[39]) );
  ADDFHX4TS U1_38 ( .A(A[38]), .B(B[38]), .CI(carry[38]), .CO(carry[39]), .S(
        SUM[38]) );
  ADDFHX4TS U1_37 ( .A(A[37]), .B(B[37]), .CI(carry[37]), .CO(carry[38]), .S(
        SUM[37]) );
  ADDFHX4TS U1_36 ( .A(A[36]), .B(B[36]), .CI(carry[36]), .CO(carry[37]), .S(
        SUM[36]) );
  ADDFHX4TS U1_35 ( .A(A[35]), .B(B[35]), .CI(carry[35]), .CO(carry[36]), .S(
        SUM[35]) );
  ADDFHX4TS U1_34 ( .A(A[34]), .B(B[34]), .CI(carry[34]), .CO(carry[35]), .S(
        SUM[34]) );
  ADDFHX4TS U1_33 ( .A(A[33]), .B(B[33]), .CI(carry[33]), .CO(carry[34]), .S(
        SUM[33]) );
  ADDFHX4TS U1_32 ( .A(A[32]), .B(B[32]), .CI(carry[32]), .CO(carry[33]), .S(
        SUM[32]) );
  ADDFHX4TS U1_31 ( .A(A[31]), .B(B[31]), .CI(carry[31]), .CO(carry[32]), .S(
        SUM[31]) );
  ADDFHX4TS U1_30 ( .A(A[30]), .B(B[30]), .CI(carry[30]), .CO(carry[31]), .S(
        SUM[30]) );
  ADDFHX4TS U1_29 ( .A(A[29]), .B(B[29]), .CI(carry[29]), .CO(carry[30]), .S(
        SUM[29]) );
  ADDFHX4TS U1_28 ( .A(A[28]), .B(B[28]), .CI(carry[28]), .CO(carry[29]), .S(
        SUM[28]) );
  ADDFHX4TS U1_27 ( .A(A[27]), .B(B[27]), .CI(carry[27]), .CO(carry[28]), .S(
        SUM[27]) );
  ADDFHX4TS U1_26 ( .A(A[26]), .B(B[26]), .CI(carry[26]), .CO(carry[27]), .S(
        SUM[26]) );
  ADDFHX4TS U1_25 ( .A(A[25]), .B(B[25]), .CI(carry[25]), .CO(carry[26]), .S(
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
         Rounding_Decoder_N7, final_result_ieee_Module_Sign_S_mux,
         final_result_ieee_Module_overunder,
         Barrel_Shifter_module_Output_Reg_n111,
         Barrel_Shifter_module_Output_Reg_n110,
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
         Barrel_Shifter_module_Output_Reg_n56,
         Barrel_Shifter_module_Output_Reg_n54,
         Barrel_Shifter_module_Output_Reg_n53,
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
         Barrel_Shifter_module_Output_Reg_n26,
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
         Barrel_Shifter_module_Output_Reg_n4,
         Barrel_Shifter_module_Output_Reg_n3,
         Barrel_Shifter_module_Output_Reg_n1, Add_Subt_Sgf_module_Sgf_AS_n7,
         Add_Subt_Sgf_module_Sgf_AS_N114, Add_Subt_Sgf_module_Sgf_AS_N113,
         Add_Subt_Sgf_module_Sgf_AS_N112, Add_Subt_Sgf_module_Sgf_AS_N111,
         Add_Subt_Sgf_module_Sgf_AS_N110, Add_Subt_Sgf_module_Sgf_AS_N109,
         Add_Subt_Sgf_module_Sgf_AS_N108, Add_Subt_Sgf_module_Sgf_AS_N107,
         Add_Subt_Sgf_module_Sgf_AS_N106, Add_Subt_Sgf_module_Sgf_AS_N105,
         Add_Subt_Sgf_module_Sgf_AS_N104, Add_Subt_Sgf_module_Sgf_AS_N103,
         Add_Subt_Sgf_module_Sgf_AS_N102, Add_Subt_Sgf_module_Sgf_AS_N101,
         Add_Subt_Sgf_module_Sgf_AS_N100, Add_Subt_Sgf_module_Sgf_AS_N99,
         Add_Subt_Sgf_module_Sgf_AS_N98, Add_Subt_Sgf_module_Sgf_AS_N97,
         Add_Subt_Sgf_module_Sgf_AS_N96, Add_Subt_Sgf_module_Sgf_AS_N95,
         Add_Subt_Sgf_module_Sgf_AS_N94, Add_Subt_Sgf_module_Sgf_AS_N93,
         Add_Subt_Sgf_module_Sgf_AS_N92, Add_Subt_Sgf_module_Sgf_AS_N91,
         Add_Subt_Sgf_module_Sgf_AS_N90, Add_Subt_Sgf_module_Sgf_AS_N89,
         Add_Subt_Sgf_module_Sgf_AS_N88, Add_Subt_Sgf_module_Sgf_AS_N87,
         Add_Subt_Sgf_module_Sgf_AS_N86, Add_Subt_Sgf_module_Sgf_AS_N85,
         Add_Subt_Sgf_module_Sgf_AS_N84, Add_Subt_Sgf_module_Sgf_AS_N83,
         Add_Subt_Sgf_module_Sgf_AS_N82, Add_Subt_Sgf_module_Sgf_AS_N81,
         Add_Subt_Sgf_module_Sgf_AS_N80, Add_Subt_Sgf_module_Sgf_AS_N79,
         Add_Subt_Sgf_module_Sgf_AS_N78, Add_Subt_Sgf_module_Sgf_AS_N77,
         Add_Subt_Sgf_module_Sgf_AS_N76, Add_Subt_Sgf_module_Sgf_AS_N75,
         Add_Subt_Sgf_module_Sgf_AS_N74, Add_Subt_Sgf_module_Sgf_AS_N73,
         Add_Subt_Sgf_module_Sgf_AS_N72, Add_Subt_Sgf_module_Sgf_AS_N71,
         Add_Subt_Sgf_module_Sgf_AS_N70, Add_Subt_Sgf_module_Sgf_AS_N69,
         Add_Subt_Sgf_module_Sgf_AS_N68, Add_Subt_Sgf_module_Sgf_AS_N67,
         Add_Subt_Sgf_module_Sgf_AS_N66, Add_Subt_Sgf_module_Sgf_AS_N65,
         Add_Subt_Sgf_module_Sgf_AS_N64, Add_Subt_Sgf_module_Sgf_AS_N63,
         Add_Subt_Sgf_module_Sgf_AS_N62, Add_Subt_Sgf_module_Sgf_AS_N61,
         Add_Subt_Sgf_module_Sgf_AS_N60, Add_Subt_Sgf_module_Sgf_AS_N59,
         Add_Subt_Sgf_module_Sgf_AS_N58, Add_Subt_Sgf_module_Sgf_AS_N57,
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
         Add_Subt_Sgf_module_Sgf_AS_N4, Add_Subt_Sgf_module_Sgf_AS_N3,
         final_result_ieee_Module_Sgf_Mux_n1, n1, n2, n3, n4, n5, n6, n7, n8,
         n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22,
         n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36,
         n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50,
         n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64,
         n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78,
         n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92,
         n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105,
         n106, n107, n108, n109, n110, n111, n112, n113, n114, n115, n116,
         n117, n118, n119, n120, n121, n122, n123, n124, n125, n126, n127,
         n128, n129, n130, n131, n132, n133, n134, n135, n136, n137, n138,
         n139, n140, n141, n142, n143, n144, n145, n146, n147, n148, n149,
         n150, n151, n152, n153, n154, n155, n156, n157, n158, n159, n160,
         n161, n162, n163, n164, n165, n166, n167, n168, n169, n170, n171,
         n172, n173, n174, n175;
  wire   [1:0] selector_B;
  wire   [1:0] FSM_selector_B;
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
  wire   [54:0] S_A_S_Oper_A;
  wire   [54:0] S_A_S_Oper_B;
  wire   [54:0] Add_Subt_LZD;
  wire   [54:0] Barrel_Shifter_module_Data_Reg;
  wire   [55:0] Add_Subt_Sgf_module_S_to_D;
  wire   [51:0] final_result_ieee_Module_Sgf_S_mux;
  wire   [10:0] final_result_ieee_Module_Exp_S_mux;

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
  RegisterAdd_W1_1 Sel_A ( .clk(clk), .rst(rst_int), .load(selector_A), .D(
        1'b1), .Q(FSM_selector_A) );
  RegisterAdd_W1_13 Sel_C ( .clk(clk), .rst(rst_int), .load(selector_C), .D(
        1'b1), .Q(FSM_selector_C) );
  RegisterAdd_W2_1 Sel_B ( .clk(clk), .rst(rst_int), .load(load_b), .D(
        selector_B), .Q(FSM_selector_B) );
  Oper_Start_In_W64 Oper_Start_in_module ( .clk(clk), .rst(rst_int), 
        .load_a_i(FSM_op_start_in_load_a), .load_b_i(FSM_op_start_in_load_b), 
        .add_subt_i(add_subt), .Data_X_i(Data_X), .Data_Y_i(Data_Y), .DMP_o(
        DMP), .DmP_o(DmP), .zero_flag_o(zero_flag), .real_op_o(real_op), 
        .sign_final_result_o(sign_final_result) );
  Multiplexer_AC_W11_0 Exp_Oper_A_mux ( .ctrl(FSM_selector_A), .D0(DMP[62:52]), 
        .D1(exp_oper_result), .S(S_Oper_A_exp) );
  Mux_3x1_W11 Exp_Oper_B_mux ( .ctrl(FSM_selector_B), .D0(DmP[62:52]), .D1({
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, LZA_output}), .D2({1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b1}), .S(S_Oper_B_exp) );
  Exp_Operation_EW11 Exp_Operation_Module ( .clk(clk), .rst(rst_int), 
        .load_a_i(FSM_exp_operation_load_diff), .load_b_i(
        FSM_exp_operation_load_OU), .Data_A_i(S_Oper_A_exp), .Data_B_i(
        S_Oper_B_exp), .Add_Subt_i(FSM_exp_operation_A_S), .Data_Result_o(
        exp_oper_result), .Overflow_flag_o(overflow_flag), .Underflow_flag_o(
        underflow_flag) );
  Mux_3x1_W6 Barrel_Shifter_S_V_mux ( .ctrl(FSM_selector_B), .D0(
        exp_oper_result[5:0]), .D1(LZA_output), .D2({1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b1}), .S(S_Shift_Value) );
  Multiplexer_AC_W55_0 Barrel_Shifter_D_I_mux ( .ctrl(FSM_selector_C), .D0({
        1'b1, DmP[51:0], 1'b0, 1'b0}), .D1(Add_Subt_result), .S(S_Data_Shift)
         );
  LZD_SWR55_EWR6 Leading_Zero_Detector_Module ( .clk(clk), .rst(rst_int), 
        .load_i(FSM_LZA_load), .Add_subt_result_i(Add_Subt_LZD), 
        .Shift_Value_o(LZA_output) );
  Mux_Array_SWR55_EWR6 Barrel_Shifter_module_Mux_Array ( .clk(clk), .rst(
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
  INVX12TS Rounding_Decoder_I_0 ( .A(Sgf_normalized_result[0]), .Y(
        Rounding_Decoder_N7) );
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
  RegisterAdd_W64_1 final_result_ieee_Module_Final_Result_IEEE ( .clk(clk), 
        .rst(rst_int), .load(FSM_Final_Result_load), .D({
        final_result_ieee_Module_Sign_S_mux, 
        final_result_ieee_Module_Exp_S_mux, final_result_ieee_Module_Sgf_S_mux}), .Q(final_result_ieee) );
  Multiplexer_AC_W11_1 final_result_ieee_Module_Exp_Mux ( .ctrl(
        final_result_ieee_Module_overunder), .D0(exp_oper_result), .D1({1'b1, 
        1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b1}), .S(
        final_result_ieee_Module_Exp_S_mux) );
  Mux_3x1_W1_1 final_result_ieee_Module_Sign_Mux ( .ctrl({overflow_flag, 
        underflow_flag}), .D0(sign_final_result), .D1(1'b1), .D2(1'b0), .S(
        final_result_ieee_Module_Sign_S_mux) );
  OR2X8TS final_result_ieee_Module_C8 ( .A(overflow_flag), .B(underflow_flag), 
        .Y(final_result_ieee_Module_overunder) );
  INVX2TS Barrel_Shifter_module_Output_Reg_U57 ( .A(rst_int), .Y(
        Barrel_Shifter_module_Output_Reg_n110) );
  OAI2BB2XLTS Barrel_Shifter_module_Output_Reg_U56 ( .B0(n3), .B1(
        FSM_barrel_shifter_load), .A0N(Barrel_Shifter_module_Data_Reg[54]), 
        .A1N(FSM_barrel_shifter_load), .Y(
        Barrel_Shifter_module_Output_Reg_n111) );
  OAI2BB2XLTS Barrel_Shifter_module_Output_Reg_U55 ( .B0(
        Barrel_Shifter_module_Output_Reg_n54), .B1(FSM_barrel_shifter_load), 
        .A0N(Barrel_Shifter_module_Data_Reg[53]), .A1N(FSM_barrel_shifter_load), .Y(Barrel_Shifter_module_Output_Reg_n109) );
  OAI2BB2XLTS Barrel_Shifter_module_Output_Reg_U54 ( .B0(
        Barrel_Shifter_module_Output_Reg_n53), .B1(FSM_barrel_shifter_load), 
        .A0N(Barrel_Shifter_module_Data_Reg[52]), .A1N(FSM_barrel_shifter_load), .Y(Barrel_Shifter_module_Output_Reg_n108) );
  OAI2BB2XLTS Barrel_Shifter_module_Output_Reg_U53 ( .B0(
        Barrel_Shifter_module_Output_Reg_n52), .B1(FSM_barrel_shifter_load), 
        .A0N(Barrel_Shifter_module_Data_Reg[51]), .A1N(FSM_barrel_shifter_load), .Y(Barrel_Shifter_module_Output_Reg_n107) );
  OAI2BB2XLTS Barrel_Shifter_module_Output_Reg_U52 ( .B0(
        Barrel_Shifter_module_Output_Reg_n51), .B1(FSM_barrel_shifter_load), 
        .A0N(Barrel_Shifter_module_Data_Reg[50]), .A1N(FSM_barrel_shifter_load), .Y(Barrel_Shifter_module_Output_Reg_n106) );
  OAI2BB2XLTS Barrel_Shifter_module_Output_Reg_U51 ( .B0(
        Barrel_Shifter_module_Output_Reg_n50), .B1(FSM_barrel_shifter_load), 
        .A0N(Barrel_Shifter_module_Data_Reg[49]), .A1N(FSM_barrel_shifter_load), .Y(Barrel_Shifter_module_Output_Reg_n105) );
  OAI2BB2XLTS Barrel_Shifter_module_Output_Reg_U50 ( .B0(
        Barrel_Shifter_module_Output_Reg_n49), .B1(FSM_barrel_shifter_load), 
        .A0N(Barrel_Shifter_module_Data_Reg[48]), .A1N(FSM_barrel_shifter_load), .Y(Barrel_Shifter_module_Output_Reg_n104) );
  OAI2BB2XLTS Barrel_Shifter_module_Output_Reg_U49 ( .B0(
        Barrel_Shifter_module_Output_Reg_n48), .B1(FSM_barrel_shifter_load), 
        .A0N(Barrel_Shifter_module_Data_Reg[47]), .A1N(FSM_barrel_shifter_load), .Y(Barrel_Shifter_module_Output_Reg_n103) );
  OAI2BB2XLTS Barrel_Shifter_module_Output_Reg_U48 ( .B0(
        Barrel_Shifter_module_Output_Reg_n47), .B1(FSM_barrel_shifter_load), 
        .A0N(Barrel_Shifter_module_Data_Reg[46]), .A1N(FSM_barrel_shifter_load), .Y(Barrel_Shifter_module_Output_Reg_n102) );
  OAI2BB2XLTS Barrel_Shifter_module_Output_Reg_U47 ( .B0(
        Barrel_Shifter_module_Output_Reg_n46), .B1(FSM_barrel_shifter_load), 
        .A0N(Barrel_Shifter_module_Data_Reg[45]), .A1N(FSM_barrel_shifter_load), .Y(Barrel_Shifter_module_Output_Reg_n101) );
  OAI2BB2XLTS Barrel_Shifter_module_Output_Reg_U46 ( .B0(
        Barrel_Shifter_module_Output_Reg_n45), .B1(FSM_barrel_shifter_load), 
        .A0N(Barrel_Shifter_module_Data_Reg[44]), .A1N(FSM_barrel_shifter_load), .Y(Barrel_Shifter_module_Output_Reg_n100) );
  OAI2BB2XLTS Barrel_Shifter_module_Output_Reg_U45 ( .B0(
        Barrel_Shifter_module_Output_Reg_n44), .B1(FSM_barrel_shifter_load), 
        .A0N(Barrel_Shifter_module_Data_Reg[43]), .A1N(FSM_barrel_shifter_load), .Y(Barrel_Shifter_module_Output_Reg_n99) );
  OAI2BB2XLTS Barrel_Shifter_module_Output_Reg_U44 ( .B0(
        Barrel_Shifter_module_Output_Reg_n43), .B1(FSM_barrel_shifter_load), 
        .A0N(Barrel_Shifter_module_Data_Reg[42]), .A1N(FSM_barrel_shifter_load), .Y(Barrel_Shifter_module_Output_Reg_n98) );
  OAI2BB2XLTS Barrel_Shifter_module_Output_Reg_U43 ( .B0(
        Barrel_Shifter_module_Output_Reg_n42), .B1(FSM_barrel_shifter_load), 
        .A0N(Barrel_Shifter_module_Data_Reg[41]), .A1N(FSM_barrel_shifter_load), .Y(Barrel_Shifter_module_Output_Reg_n97) );
  OAI2BB2XLTS Barrel_Shifter_module_Output_Reg_U42 ( .B0(
        Barrel_Shifter_module_Output_Reg_n41), .B1(FSM_barrel_shifter_load), 
        .A0N(Barrel_Shifter_module_Data_Reg[40]), .A1N(FSM_barrel_shifter_load), .Y(Barrel_Shifter_module_Output_Reg_n96) );
  OAI2BB2XLTS Barrel_Shifter_module_Output_Reg_U41 ( .B0(
        Barrel_Shifter_module_Output_Reg_n40), .B1(FSM_barrel_shifter_load), 
        .A0N(Barrel_Shifter_module_Data_Reg[39]), .A1N(FSM_barrel_shifter_load), .Y(Barrel_Shifter_module_Output_Reg_n95) );
  OAI2BB2XLTS Barrel_Shifter_module_Output_Reg_U40 ( .B0(
        Barrel_Shifter_module_Output_Reg_n39), .B1(FSM_barrel_shifter_load), 
        .A0N(Barrel_Shifter_module_Data_Reg[38]), .A1N(FSM_barrel_shifter_load), .Y(Barrel_Shifter_module_Output_Reg_n94) );
  OAI2BB2XLTS Barrel_Shifter_module_Output_Reg_U39 ( .B0(
        Barrel_Shifter_module_Output_Reg_n38), .B1(FSM_barrel_shifter_load), 
        .A0N(Barrel_Shifter_module_Data_Reg[37]), .A1N(FSM_barrel_shifter_load), .Y(Barrel_Shifter_module_Output_Reg_n93) );
  OAI2BB2XLTS Barrel_Shifter_module_Output_Reg_U38 ( .B0(
        Barrel_Shifter_module_Output_Reg_n37), .B1(FSM_barrel_shifter_load), 
        .A0N(Barrel_Shifter_module_Data_Reg[36]), .A1N(FSM_barrel_shifter_load), .Y(Barrel_Shifter_module_Output_Reg_n92) );
  OAI2BB2XLTS Barrel_Shifter_module_Output_Reg_U37 ( .B0(
        Barrel_Shifter_module_Output_Reg_n36), .B1(FSM_barrel_shifter_load), 
        .A0N(Barrel_Shifter_module_Data_Reg[35]), .A1N(FSM_barrel_shifter_load), .Y(Barrel_Shifter_module_Output_Reg_n91) );
  OAI2BB2XLTS Barrel_Shifter_module_Output_Reg_U36 ( .B0(
        Barrel_Shifter_module_Output_Reg_n35), .B1(FSM_barrel_shifter_load), 
        .A0N(Barrel_Shifter_module_Data_Reg[34]), .A1N(FSM_barrel_shifter_load), .Y(Barrel_Shifter_module_Output_Reg_n90) );
  OAI2BB2XLTS Barrel_Shifter_module_Output_Reg_U35 ( .B0(
        Barrel_Shifter_module_Output_Reg_n34), .B1(FSM_barrel_shifter_load), 
        .A0N(Barrel_Shifter_module_Data_Reg[33]), .A1N(FSM_barrel_shifter_load), .Y(Barrel_Shifter_module_Output_Reg_n89) );
  OAI2BB2XLTS Barrel_Shifter_module_Output_Reg_U34 ( .B0(
        Barrel_Shifter_module_Output_Reg_n33), .B1(FSM_barrel_shifter_load), 
        .A0N(Barrel_Shifter_module_Data_Reg[32]), .A1N(FSM_barrel_shifter_load), .Y(Barrel_Shifter_module_Output_Reg_n88) );
  OAI2BB2XLTS Barrel_Shifter_module_Output_Reg_U33 ( .B0(
        Barrel_Shifter_module_Output_Reg_n32), .B1(FSM_barrel_shifter_load), 
        .A0N(Barrel_Shifter_module_Data_Reg[31]), .A1N(FSM_barrel_shifter_load), .Y(Barrel_Shifter_module_Output_Reg_n87) );
  OAI2BB2XLTS Barrel_Shifter_module_Output_Reg_U32 ( .B0(
        Barrel_Shifter_module_Output_Reg_n31), .B1(FSM_barrel_shifter_load), 
        .A0N(Barrel_Shifter_module_Data_Reg[30]), .A1N(FSM_barrel_shifter_load), .Y(Barrel_Shifter_module_Output_Reg_n86) );
  OAI2BB2XLTS Barrel_Shifter_module_Output_Reg_U31 ( .B0(
        Barrel_Shifter_module_Output_Reg_n30), .B1(FSM_barrel_shifter_load), 
        .A0N(Barrel_Shifter_module_Data_Reg[29]), .A1N(FSM_barrel_shifter_load), .Y(Barrel_Shifter_module_Output_Reg_n85) );
  OAI2BB2XLTS Barrel_Shifter_module_Output_Reg_U30 ( .B0(
        Barrel_Shifter_module_Output_Reg_n29), .B1(FSM_barrel_shifter_load), 
        .A0N(Barrel_Shifter_module_Data_Reg[28]), .A1N(FSM_barrel_shifter_load), .Y(Barrel_Shifter_module_Output_Reg_n84) );
  OAI2BB2XLTS Barrel_Shifter_module_Output_Reg_U29 ( .B0(
        Barrel_Shifter_module_Output_Reg_n28), .B1(FSM_barrel_shifter_load), 
        .A0N(Barrel_Shifter_module_Data_Reg[27]), .A1N(FSM_barrel_shifter_load), .Y(Barrel_Shifter_module_Output_Reg_n83) );
  OAI2BB2XLTS Barrel_Shifter_module_Output_Reg_U28 ( .B0(
        Barrel_Shifter_module_Output_Reg_n27), .B1(FSM_barrel_shifter_load), 
        .A0N(Barrel_Shifter_module_Data_Reg[26]), .A1N(FSM_barrel_shifter_load), .Y(Barrel_Shifter_module_Output_Reg_n82) );
  OAI2BB2XLTS Barrel_Shifter_module_Output_Reg_U27 ( .B0(
        Barrel_Shifter_module_Output_Reg_n26), .B1(FSM_barrel_shifter_load), 
        .A0N(Barrel_Shifter_module_Data_Reg[25]), .A1N(FSM_barrel_shifter_load), .Y(Barrel_Shifter_module_Output_Reg_n81) );
  OAI2BB2XLTS Barrel_Shifter_module_Output_Reg_U26 ( .B0(
        Barrel_Shifter_module_Output_Reg_n25), .B1(FSM_barrel_shifter_load), 
        .A0N(Barrel_Shifter_module_Data_Reg[24]), .A1N(FSM_barrel_shifter_load), .Y(Barrel_Shifter_module_Output_Reg_n80) );
  OAI2BB2XLTS Barrel_Shifter_module_Output_Reg_U25 ( .B0(
        Barrel_Shifter_module_Output_Reg_n24), .B1(FSM_barrel_shifter_load), 
        .A0N(Barrel_Shifter_module_Data_Reg[23]), .A1N(FSM_barrel_shifter_load), .Y(Barrel_Shifter_module_Output_Reg_n79) );
  OAI2BB2XLTS Barrel_Shifter_module_Output_Reg_U24 ( .B0(
        Barrel_Shifter_module_Output_Reg_n23), .B1(FSM_barrel_shifter_load), 
        .A0N(Barrel_Shifter_module_Data_Reg[22]), .A1N(FSM_barrel_shifter_load), .Y(Barrel_Shifter_module_Output_Reg_n78) );
  OAI2BB2XLTS Barrel_Shifter_module_Output_Reg_U23 ( .B0(
        Barrel_Shifter_module_Output_Reg_n22), .B1(FSM_barrel_shifter_load), 
        .A0N(Barrel_Shifter_module_Data_Reg[21]), .A1N(FSM_barrel_shifter_load), .Y(Barrel_Shifter_module_Output_Reg_n77) );
  OAI2BB2XLTS Barrel_Shifter_module_Output_Reg_U22 ( .B0(
        Barrel_Shifter_module_Output_Reg_n21), .B1(FSM_barrel_shifter_load), 
        .A0N(Barrel_Shifter_module_Data_Reg[20]), .A1N(FSM_barrel_shifter_load), .Y(Barrel_Shifter_module_Output_Reg_n76) );
  OAI2BB2XLTS Barrel_Shifter_module_Output_Reg_U21 ( .B0(
        Barrel_Shifter_module_Output_Reg_n20), .B1(FSM_barrel_shifter_load), 
        .A0N(Barrel_Shifter_module_Data_Reg[19]), .A1N(FSM_barrel_shifter_load), .Y(Barrel_Shifter_module_Output_Reg_n75) );
  OAI2BB2XLTS Barrel_Shifter_module_Output_Reg_U20 ( .B0(
        Barrel_Shifter_module_Output_Reg_n19), .B1(FSM_barrel_shifter_load), 
        .A0N(Barrel_Shifter_module_Data_Reg[18]), .A1N(FSM_barrel_shifter_load), .Y(Barrel_Shifter_module_Output_Reg_n74) );
  OAI2BB2XLTS Barrel_Shifter_module_Output_Reg_U19 ( .B0(
        Barrel_Shifter_module_Output_Reg_n18), .B1(FSM_barrel_shifter_load), 
        .A0N(Barrel_Shifter_module_Data_Reg[17]), .A1N(FSM_barrel_shifter_load), .Y(Barrel_Shifter_module_Output_Reg_n73) );
  OAI2BB2XLTS Barrel_Shifter_module_Output_Reg_U18 ( .B0(
        Barrel_Shifter_module_Output_Reg_n17), .B1(FSM_barrel_shifter_load), 
        .A0N(Barrel_Shifter_module_Data_Reg[16]), .A1N(FSM_barrel_shifter_load), .Y(Barrel_Shifter_module_Output_Reg_n72) );
  OAI2BB2XLTS Barrel_Shifter_module_Output_Reg_U17 ( .B0(
        Barrel_Shifter_module_Output_Reg_n16), .B1(FSM_barrel_shifter_load), 
        .A0N(Barrel_Shifter_module_Data_Reg[15]), .A1N(FSM_barrel_shifter_load), .Y(Barrel_Shifter_module_Output_Reg_n71) );
  OAI2BB2XLTS Barrel_Shifter_module_Output_Reg_U16 ( .B0(
        Barrel_Shifter_module_Output_Reg_n15), .B1(FSM_barrel_shifter_load), 
        .A0N(Barrel_Shifter_module_Data_Reg[14]), .A1N(FSM_barrel_shifter_load), .Y(Barrel_Shifter_module_Output_Reg_n70) );
  OAI2BB2XLTS Barrel_Shifter_module_Output_Reg_U15 ( .B0(
        Barrel_Shifter_module_Output_Reg_n14), .B1(FSM_barrel_shifter_load), 
        .A0N(Barrel_Shifter_module_Data_Reg[13]), .A1N(FSM_barrel_shifter_load), .Y(Barrel_Shifter_module_Output_Reg_n69) );
  OAI2BB2XLTS Barrel_Shifter_module_Output_Reg_U14 ( .B0(
        Barrel_Shifter_module_Output_Reg_n13), .B1(FSM_barrel_shifter_load), 
        .A0N(Barrel_Shifter_module_Data_Reg[12]), .A1N(FSM_barrel_shifter_load), .Y(Barrel_Shifter_module_Output_Reg_n68) );
  OAI2BB2XLTS Barrel_Shifter_module_Output_Reg_U13 ( .B0(
        Barrel_Shifter_module_Output_Reg_n12), .B1(FSM_barrel_shifter_load), 
        .A0N(Barrel_Shifter_module_Data_Reg[11]), .A1N(FSM_barrel_shifter_load), .Y(Barrel_Shifter_module_Output_Reg_n67) );
  OAI2BB2XLTS Barrel_Shifter_module_Output_Reg_U12 ( .B0(
        Barrel_Shifter_module_Output_Reg_n11), .B1(FSM_barrel_shifter_load), 
        .A0N(Barrel_Shifter_module_Data_Reg[10]), .A1N(FSM_barrel_shifter_load), .Y(Barrel_Shifter_module_Output_Reg_n66) );
  OAI2BB2XLTS Barrel_Shifter_module_Output_Reg_U11 ( .B0(
        Barrel_Shifter_module_Output_Reg_n10), .B1(FSM_barrel_shifter_load), 
        .A0N(Barrel_Shifter_module_Data_Reg[9]), .A1N(FSM_barrel_shifter_load), 
        .Y(Barrel_Shifter_module_Output_Reg_n65) );
  OAI2BB2XLTS Barrel_Shifter_module_Output_Reg_U10 ( .B0(
        Barrel_Shifter_module_Output_Reg_n9), .B1(FSM_barrel_shifter_load), 
        .A0N(Barrel_Shifter_module_Data_Reg[8]), .A1N(FSM_barrel_shifter_load), 
        .Y(Barrel_Shifter_module_Output_Reg_n64) );
  OAI2BB2XLTS Barrel_Shifter_module_Output_Reg_U9 ( .B0(
        Barrel_Shifter_module_Output_Reg_n8), .B1(FSM_barrel_shifter_load), 
        .A0N(Barrel_Shifter_module_Data_Reg[7]), .A1N(FSM_barrel_shifter_load), 
        .Y(Barrel_Shifter_module_Output_Reg_n63) );
  OAI2BB2XLTS Barrel_Shifter_module_Output_Reg_U8 ( .B0(
        Barrel_Shifter_module_Output_Reg_n7), .B1(FSM_barrel_shifter_load), 
        .A0N(Barrel_Shifter_module_Data_Reg[6]), .A1N(FSM_barrel_shifter_load), 
        .Y(Barrel_Shifter_module_Output_Reg_n62) );
  OAI2BB2XLTS Barrel_Shifter_module_Output_Reg_U7 ( .B0(
        Barrel_Shifter_module_Output_Reg_n6), .B1(FSM_barrel_shifter_load), 
        .A0N(Barrel_Shifter_module_Data_Reg[5]), .A1N(FSM_barrel_shifter_load), 
        .Y(Barrel_Shifter_module_Output_Reg_n61) );
  OAI2BB2XLTS Barrel_Shifter_module_Output_Reg_U6 ( .B0(
        Barrel_Shifter_module_Output_Reg_n5), .B1(FSM_barrel_shifter_load), 
        .A0N(Barrel_Shifter_module_Data_Reg[4]), .A1N(FSM_barrel_shifter_load), 
        .Y(Barrel_Shifter_module_Output_Reg_n60) );
  OAI2BB2XLTS Barrel_Shifter_module_Output_Reg_U5 ( .B0(
        Barrel_Shifter_module_Output_Reg_n4), .B1(FSM_barrel_shifter_load), 
        .A0N(Barrel_Shifter_module_Data_Reg[3]), .A1N(FSM_barrel_shifter_load), 
        .Y(Barrel_Shifter_module_Output_Reg_n59) );
  OAI2BB2XLTS Barrel_Shifter_module_Output_Reg_U4 ( .B0(
        Barrel_Shifter_module_Output_Reg_n3), .B1(FSM_barrel_shifter_load), 
        .A0N(Barrel_Shifter_module_Data_Reg[2]), .A1N(FSM_barrel_shifter_load), 
        .Y(Barrel_Shifter_module_Output_Reg_n58) );
  OAI2BB2XLTS Barrel_Shifter_module_Output_Reg_U3 ( .B0(Rounding_Decoder_N37), 
        .B1(FSM_barrel_shifter_load), .A0N(Barrel_Shifter_module_Data_Reg[1]), 
        .A1N(FSM_barrel_shifter_load), .Y(Barrel_Shifter_module_Output_Reg_n57) );
  OAI2BB2XLTS Barrel_Shifter_module_Output_Reg_U2 ( .B0(
        Barrel_Shifter_module_Output_Reg_n1), .B1(FSM_barrel_shifter_load), 
        .A0N(FSM_barrel_shifter_load), .A1N(Barrel_Shifter_module_Data_Reg[0]), 
        .Y(Barrel_Shifter_module_Output_Reg_n56) );
  DFFRX4TS Barrel_Shifter_module_Output_Reg_Q_reg_0_ ( .D(
        Barrel_Shifter_module_Output_Reg_n56), .CK(clk), .RN(
        Barrel_Shifter_module_Output_Reg_n110), .Q(Sgf_normalized_result[0]), 
        .QN(Barrel_Shifter_module_Output_Reg_n1) );
  DFFRX4TS Barrel_Shifter_module_Output_Reg_Q_reg_2_ ( .D(
        Barrel_Shifter_module_Output_Reg_n58), .CK(clk), .RN(
        Barrel_Shifter_module_Output_Reg_n110), .Q(Sgf_normalized_result[2]), 
        .QN(Barrel_Shifter_module_Output_Reg_n3) );
  DFFRX4TS Barrel_Shifter_module_Output_Reg_Q_reg_3_ ( .D(
        Barrel_Shifter_module_Output_Reg_n59), .CK(clk), .RN(
        Barrel_Shifter_module_Output_Reg_n110), .Q(Sgf_normalized_result[3]), 
        .QN(Barrel_Shifter_module_Output_Reg_n4) );
  DFFRX4TS Barrel_Shifter_module_Output_Reg_Q_reg_4_ ( .D(
        Barrel_Shifter_module_Output_Reg_n60), .CK(clk), .RN(
        Barrel_Shifter_module_Output_Reg_n110), .Q(Sgf_normalized_result[4]), 
        .QN(Barrel_Shifter_module_Output_Reg_n5) );
  DFFRX4TS Barrel_Shifter_module_Output_Reg_Q_reg_5_ ( .D(
        Barrel_Shifter_module_Output_Reg_n61), .CK(clk), .RN(
        Barrel_Shifter_module_Output_Reg_n110), .Q(Sgf_normalized_result[5]), 
        .QN(Barrel_Shifter_module_Output_Reg_n6) );
  DFFRX4TS Barrel_Shifter_module_Output_Reg_Q_reg_6_ ( .D(
        Barrel_Shifter_module_Output_Reg_n62), .CK(clk), .RN(
        Barrel_Shifter_module_Output_Reg_n110), .Q(Sgf_normalized_result[6]), 
        .QN(Barrel_Shifter_module_Output_Reg_n7) );
  DFFRX4TS Barrel_Shifter_module_Output_Reg_Q_reg_7_ ( .D(
        Barrel_Shifter_module_Output_Reg_n63), .CK(clk), .RN(
        Barrel_Shifter_module_Output_Reg_n110), .Q(Sgf_normalized_result[7]), 
        .QN(Barrel_Shifter_module_Output_Reg_n8) );
  DFFRX4TS Barrel_Shifter_module_Output_Reg_Q_reg_8_ ( .D(
        Barrel_Shifter_module_Output_Reg_n64), .CK(clk), .RN(
        Barrel_Shifter_module_Output_Reg_n110), .Q(Sgf_normalized_result[8]), 
        .QN(Barrel_Shifter_module_Output_Reg_n9) );
  DFFRX4TS Barrel_Shifter_module_Output_Reg_Q_reg_9_ ( .D(
        Barrel_Shifter_module_Output_Reg_n65), .CK(clk), .RN(
        Barrel_Shifter_module_Output_Reg_n110), .Q(Sgf_normalized_result[9]), 
        .QN(Barrel_Shifter_module_Output_Reg_n10) );
  DFFRX4TS Barrel_Shifter_module_Output_Reg_Q_reg_10_ ( .D(
        Barrel_Shifter_module_Output_Reg_n66), .CK(clk), .RN(
        Barrel_Shifter_module_Output_Reg_n110), .Q(Sgf_normalized_result[10]), 
        .QN(Barrel_Shifter_module_Output_Reg_n11) );
  DFFRX4TS Barrel_Shifter_module_Output_Reg_Q_reg_11_ ( .D(
        Barrel_Shifter_module_Output_Reg_n67), .CK(clk), .RN(
        Barrel_Shifter_module_Output_Reg_n110), .Q(Sgf_normalized_result[11]), 
        .QN(Barrel_Shifter_module_Output_Reg_n12) );
  DFFRX4TS Barrel_Shifter_module_Output_Reg_Q_reg_12_ ( .D(
        Barrel_Shifter_module_Output_Reg_n68), .CK(clk), .RN(
        Barrel_Shifter_module_Output_Reg_n110), .Q(Sgf_normalized_result[12]), 
        .QN(Barrel_Shifter_module_Output_Reg_n13) );
  DFFRX4TS Barrel_Shifter_module_Output_Reg_Q_reg_13_ ( .D(
        Barrel_Shifter_module_Output_Reg_n69), .CK(clk), .RN(
        Barrel_Shifter_module_Output_Reg_n110), .Q(Sgf_normalized_result[13]), 
        .QN(Barrel_Shifter_module_Output_Reg_n14) );
  DFFRX4TS Barrel_Shifter_module_Output_Reg_Q_reg_14_ ( .D(
        Barrel_Shifter_module_Output_Reg_n70), .CK(clk), .RN(
        Barrel_Shifter_module_Output_Reg_n110), .Q(Sgf_normalized_result[14]), 
        .QN(Barrel_Shifter_module_Output_Reg_n15) );
  DFFRX4TS Barrel_Shifter_module_Output_Reg_Q_reg_15_ ( .D(
        Barrel_Shifter_module_Output_Reg_n71), .CK(clk), .RN(
        Barrel_Shifter_module_Output_Reg_n110), .Q(Sgf_normalized_result[15]), 
        .QN(Barrel_Shifter_module_Output_Reg_n16) );
  DFFRX4TS Barrel_Shifter_module_Output_Reg_Q_reg_17_ ( .D(
        Barrel_Shifter_module_Output_Reg_n73), .CK(clk), .RN(
        Barrel_Shifter_module_Output_Reg_n110), .Q(Sgf_normalized_result[17]), 
        .QN(Barrel_Shifter_module_Output_Reg_n18) );
  DFFRX4TS Barrel_Shifter_module_Output_Reg_Q_reg_18_ ( .D(
        Barrel_Shifter_module_Output_Reg_n74), .CK(clk), .RN(
        Barrel_Shifter_module_Output_Reg_n110), .Q(Sgf_normalized_result[18]), 
        .QN(Barrel_Shifter_module_Output_Reg_n19) );
  DFFRX4TS Barrel_Shifter_module_Output_Reg_Q_reg_19_ ( .D(
        Barrel_Shifter_module_Output_Reg_n75), .CK(clk), .RN(
        Barrel_Shifter_module_Output_Reg_n110), .Q(Sgf_normalized_result[19]), 
        .QN(Barrel_Shifter_module_Output_Reg_n20) );
  DFFRX4TS Barrel_Shifter_module_Output_Reg_Q_reg_20_ ( .D(
        Barrel_Shifter_module_Output_Reg_n76), .CK(clk), .RN(
        Barrel_Shifter_module_Output_Reg_n110), .Q(Sgf_normalized_result[20]), 
        .QN(Barrel_Shifter_module_Output_Reg_n21) );
  DFFRX4TS Barrel_Shifter_module_Output_Reg_Q_reg_21_ ( .D(
        Barrel_Shifter_module_Output_Reg_n77), .CK(clk), .RN(
        Barrel_Shifter_module_Output_Reg_n110), .Q(Sgf_normalized_result[21]), 
        .QN(Barrel_Shifter_module_Output_Reg_n22) );
  DFFRX4TS Barrel_Shifter_module_Output_Reg_Q_reg_22_ ( .D(
        Barrel_Shifter_module_Output_Reg_n78), .CK(clk), .RN(
        Barrel_Shifter_module_Output_Reg_n110), .Q(Sgf_normalized_result[22]), 
        .QN(Barrel_Shifter_module_Output_Reg_n23) );
  DFFRX4TS Barrel_Shifter_module_Output_Reg_Q_reg_23_ ( .D(
        Barrel_Shifter_module_Output_Reg_n79), .CK(clk), .RN(
        Barrel_Shifter_module_Output_Reg_n110), .Q(Sgf_normalized_result[23]), 
        .QN(Barrel_Shifter_module_Output_Reg_n24) );
  DFFRX4TS Barrel_Shifter_module_Output_Reg_Q_reg_24_ ( .D(
        Barrel_Shifter_module_Output_Reg_n80), .CK(clk), .RN(
        Barrel_Shifter_module_Output_Reg_n110), .Q(Sgf_normalized_result[24]), 
        .QN(Barrel_Shifter_module_Output_Reg_n25) );
  DFFRX4TS Barrel_Shifter_module_Output_Reg_Q_reg_25_ ( .D(
        Barrel_Shifter_module_Output_Reg_n81), .CK(clk), .RN(
        Barrel_Shifter_module_Output_Reg_n110), .Q(Sgf_normalized_result[25]), 
        .QN(Barrel_Shifter_module_Output_Reg_n26) );
  DFFRX4TS Barrel_Shifter_module_Output_Reg_Q_reg_26_ ( .D(
        Barrel_Shifter_module_Output_Reg_n82), .CK(clk), .RN(
        Barrel_Shifter_module_Output_Reg_n110), .Q(Sgf_normalized_result[26]), 
        .QN(Barrel_Shifter_module_Output_Reg_n27) );
  DFFRX4TS Barrel_Shifter_module_Output_Reg_Q_reg_27_ ( .D(
        Barrel_Shifter_module_Output_Reg_n83), .CK(clk), .RN(
        Barrel_Shifter_module_Output_Reg_n110), .Q(Sgf_normalized_result[27]), 
        .QN(Barrel_Shifter_module_Output_Reg_n28) );
  DFFRX4TS Barrel_Shifter_module_Output_Reg_Q_reg_28_ ( .D(
        Barrel_Shifter_module_Output_Reg_n84), .CK(clk), .RN(
        Barrel_Shifter_module_Output_Reg_n110), .Q(Sgf_normalized_result[28]), 
        .QN(Barrel_Shifter_module_Output_Reg_n29) );
  DFFRX4TS Barrel_Shifter_module_Output_Reg_Q_reg_29_ ( .D(
        Barrel_Shifter_module_Output_Reg_n85), .CK(clk), .RN(
        Barrel_Shifter_module_Output_Reg_n110), .Q(Sgf_normalized_result[29]), 
        .QN(Barrel_Shifter_module_Output_Reg_n30) );
  DFFRX4TS Barrel_Shifter_module_Output_Reg_Q_reg_30_ ( .D(
        Barrel_Shifter_module_Output_Reg_n86), .CK(clk), .RN(
        Barrel_Shifter_module_Output_Reg_n110), .Q(Sgf_normalized_result[30]), 
        .QN(Barrel_Shifter_module_Output_Reg_n31) );
  DFFRX4TS Barrel_Shifter_module_Output_Reg_Q_reg_31_ ( .D(
        Barrel_Shifter_module_Output_Reg_n87), .CK(clk), .RN(
        Barrel_Shifter_module_Output_Reg_n110), .Q(Sgf_normalized_result[31]), 
        .QN(Barrel_Shifter_module_Output_Reg_n32) );
  add_sub_carry_out_W55_DW01_sub_0 Add_Subt_Sgf_module_Sgf_AS_sub_34 ( .A({
        1'b0, S_A_S_Oper_A}), .B({1'b0, S_A_S_Oper_B}), .CI(1'b0), .DIFF({
        Add_Subt_Sgf_module_Sgf_AS_N58, Add_Subt_Sgf_module_Sgf_AS_N57, 
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
        Add_Subt_Sgf_module_Sgf_AS_N4, Add_Subt_Sgf_module_Sgf_AS_N3}) );
  add_sub_carry_out_W55_DW01_add_0 Add_Subt_Sgf_module_Sgf_AS_add_36 ( .A({
        1'b0, S_A_S_Oper_A}), .B({1'b0, S_A_S_Oper_B}), .CI(1'b0), .SUM({
        Add_Subt_Sgf_module_Sgf_AS_N114, Add_Subt_Sgf_module_Sgf_AS_N113, 
        Add_Subt_Sgf_module_Sgf_AS_N112, Add_Subt_Sgf_module_Sgf_AS_N111, 
        Add_Subt_Sgf_module_Sgf_AS_N110, Add_Subt_Sgf_module_Sgf_AS_N109, 
        Add_Subt_Sgf_module_Sgf_AS_N108, Add_Subt_Sgf_module_Sgf_AS_N107, 
        Add_Subt_Sgf_module_Sgf_AS_N106, Add_Subt_Sgf_module_Sgf_AS_N105, 
        Add_Subt_Sgf_module_Sgf_AS_N104, Add_Subt_Sgf_module_Sgf_AS_N103, 
        Add_Subt_Sgf_module_Sgf_AS_N102, Add_Subt_Sgf_module_Sgf_AS_N101, 
        Add_Subt_Sgf_module_Sgf_AS_N100, Add_Subt_Sgf_module_Sgf_AS_N99, 
        Add_Subt_Sgf_module_Sgf_AS_N98, Add_Subt_Sgf_module_Sgf_AS_N97, 
        Add_Subt_Sgf_module_Sgf_AS_N96, Add_Subt_Sgf_module_Sgf_AS_N95, 
        Add_Subt_Sgf_module_Sgf_AS_N94, Add_Subt_Sgf_module_Sgf_AS_N93, 
        Add_Subt_Sgf_module_Sgf_AS_N92, Add_Subt_Sgf_module_Sgf_AS_N91, 
        Add_Subt_Sgf_module_Sgf_AS_N90, Add_Subt_Sgf_module_Sgf_AS_N89, 
        Add_Subt_Sgf_module_Sgf_AS_N88, Add_Subt_Sgf_module_Sgf_AS_N87, 
        Add_Subt_Sgf_module_Sgf_AS_N86, Add_Subt_Sgf_module_Sgf_AS_N85, 
        Add_Subt_Sgf_module_Sgf_AS_N84, Add_Subt_Sgf_module_Sgf_AS_N83, 
        Add_Subt_Sgf_module_Sgf_AS_N82, Add_Subt_Sgf_module_Sgf_AS_N81, 
        Add_Subt_Sgf_module_Sgf_AS_N80, Add_Subt_Sgf_module_Sgf_AS_N79, 
        Add_Subt_Sgf_module_Sgf_AS_N78, Add_Subt_Sgf_module_Sgf_AS_N77, 
        Add_Subt_Sgf_module_Sgf_AS_N76, Add_Subt_Sgf_module_Sgf_AS_N75, 
        Add_Subt_Sgf_module_Sgf_AS_N74, Add_Subt_Sgf_module_Sgf_AS_N73, 
        Add_Subt_Sgf_module_Sgf_AS_N72, Add_Subt_Sgf_module_Sgf_AS_N71, 
        Add_Subt_Sgf_module_Sgf_AS_N70, Add_Subt_Sgf_module_Sgf_AS_N69, 
        Add_Subt_Sgf_module_Sgf_AS_N68, Add_Subt_Sgf_module_Sgf_AS_N67, 
        Add_Subt_Sgf_module_Sgf_AS_N66, Add_Subt_Sgf_module_Sgf_AS_N65, 
        Add_Subt_Sgf_module_Sgf_AS_N64, Add_Subt_Sgf_module_Sgf_AS_N63, 
        Add_Subt_Sgf_module_Sgf_AS_N62, Add_Subt_Sgf_module_Sgf_AS_N61, 
        Add_Subt_Sgf_module_Sgf_AS_N60, Add_Subt_Sgf_module_Sgf_AS_N59}) );
  CLKINVX1TS Add_Subt_Sgf_module_Sgf_AS_U61 ( .A(S_A_S_op), .Y(
        Add_Subt_Sgf_module_Sgf_AS_n7) );
  AO22X1TS Add_Subt_Sgf_module_Sgf_AS_U60 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N59), .A1(Add_Subt_Sgf_module_Sgf_AS_n7), .B0(Add_Subt_Sgf_module_Sgf_AS_N3), .B1(
        S_A_S_op), .Y(Add_Subt_Sgf_module_S_to_D[0]) );
  AO22X1TS Add_Subt_Sgf_module_Sgf_AS_U59 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N69), .A1(Add_Subt_Sgf_module_Sgf_AS_n7), .B0(Add_Subt_Sgf_module_Sgf_AS_N13), 
        .B1(S_A_S_op), .Y(Add_Subt_Sgf_module_S_to_D[10]) );
  AO22X1TS Add_Subt_Sgf_module_Sgf_AS_U58 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N70), .A1(Add_Subt_Sgf_module_Sgf_AS_n7), .B0(Add_Subt_Sgf_module_Sgf_AS_N14), 
        .B1(S_A_S_op), .Y(Add_Subt_Sgf_module_S_to_D[11]) );
  AO22X1TS Add_Subt_Sgf_module_Sgf_AS_U57 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N71), .A1(Add_Subt_Sgf_module_Sgf_AS_n7), .B0(Add_Subt_Sgf_module_Sgf_AS_N15), 
        .B1(S_A_S_op), .Y(Add_Subt_Sgf_module_S_to_D[12]) );
  AO22X1TS Add_Subt_Sgf_module_Sgf_AS_U56 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N72), .A1(Add_Subt_Sgf_module_Sgf_AS_n7), .B0(Add_Subt_Sgf_module_Sgf_AS_N16), 
        .B1(S_A_S_op), .Y(Add_Subt_Sgf_module_S_to_D[13]) );
  AO22X1TS Add_Subt_Sgf_module_Sgf_AS_U55 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N73), .A1(Add_Subt_Sgf_module_Sgf_AS_n7), .B0(Add_Subt_Sgf_module_Sgf_AS_N17), 
        .B1(S_A_S_op), .Y(Add_Subt_Sgf_module_S_to_D[14]) );
  AO22X1TS Add_Subt_Sgf_module_Sgf_AS_U54 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N74), .A1(Add_Subt_Sgf_module_Sgf_AS_n7), .B0(Add_Subt_Sgf_module_Sgf_AS_N18), 
        .B1(S_A_S_op), .Y(Add_Subt_Sgf_module_S_to_D[15]) );
  AO22X1TS Add_Subt_Sgf_module_Sgf_AS_U53 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N75), .A1(Add_Subt_Sgf_module_Sgf_AS_n7), .B0(Add_Subt_Sgf_module_Sgf_AS_N19), 
        .B1(S_A_S_op), .Y(Add_Subt_Sgf_module_S_to_D[16]) );
  AO22X1TS Add_Subt_Sgf_module_Sgf_AS_U52 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N76), .A1(Add_Subt_Sgf_module_Sgf_AS_n7), .B0(Add_Subt_Sgf_module_Sgf_AS_N20), 
        .B1(S_A_S_op), .Y(Add_Subt_Sgf_module_S_to_D[17]) );
  AO22X1TS Add_Subt_Sgf_module_Sgf_AS_U51 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N77), .A1(Add_Subt_Sgf_module_Sgf_AS_n7), .B0(Add_Subt_Sgf_module_Sgf_AS_N21), 
        .B1(S_A_S_op), .Y(Add_Subt_Sgf_module_S_to_D[18]) );
  AO22X1TS Add_Subt_Sgf_module_Sgf_AS_U50 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N78), .A1(Add_Subt_Sgf_module_Sgf_AS_n7), .B0(Add_Subt_Sgf_module_Sgf_AS_N22), 
        .B1(S_A_S_op), .Y(Add_Subt_Sgf_module_S_to_D[19]) );
  AO22X1TS Add_Subt_Sgf_module_Sgf_AS_U49 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N60), .A1(Add_Subt_Sgf_module_Sgf_AS_n7), .B0(Add_Subt_Sgf_module_Sgf_AS_N4), .B1(
        S_A_S_op), .Y(Add_Subt_Sgf_module_S_to_D[1]) );
  AO22X1TS Add_Subt_Sgf_module_Sgf_AS_U48 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N79), .A1(Add_Subt_Sgf_module_Sgf_AS_n7), .B0(Add_Subt_Sgf_module_Sgf_AS_N23), 
        .B1(S_A_S_op), .Y(Add_Subt_Sgf_module_S_to_D[20]) );
  AO22X1TS Add_Subt_Sgf_module_Sgf_AS_U47 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N80), .A1(Add_Subt_Sgf_module_Sgf_AS_n7), .B0(Add_Subt_Sgf_module_Sgf_AS_N24), 
        .B1(S_A_S_op), .Y(Add_Subt_Sgf_module_S_to_D[21]) );
  AO22X1TS Add_Subt_Sgf_module_Sgf_AS_U46 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N81), .A1(Add_Subt_Sgf_module_Sgf_AS_n7), .B0(Add_Subt_Sgf_module_Sgf_AS_N25), 
        .B1(S_A_S_op), .Y(Add_Subt_Sgf_module_S_to_D[22]) );
  AO22X1TS Add_Subt_Sgf_module_Sgf_AS_U45 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N82), .A1(Add_Subt_Sgf_module_Sgf_AS_n7), .B0(Add_Subt_Sgf_module_Sgf_AS_N26), 
        .B1(S_A_S_op), .Y(Add_Subt_Sgf_module_S_to_D[23]) );
  AO22X1TS Add_Subt_Sgf_module_Sgf_AS_U44 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N83), .A1(Add_Subt_Sgf_module_Sgf_AS_n7), .B0(Add_Subt_Sgf_module_Sgf_AS_N27), 
        .B1(S_A_S_op), .Y(Add_Subt_Sgf_module_S_to_D[24]) );
  AO22X1TS Add_Subt_Sgf_module_Sgf_AS_U43 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N84), .A1(Add_Subt_Sgf_module_Sgf_AS_n7), .B0(Add_Subt_Sgf_module_Sgf_AS_N28), 
        .B1(S_A_S_op), .Y(Add_Subt_Sgf_module_S_to_D[25]) );
  AO22X1TS Add_Subt_Sgf_module_Sgf_AS_U42 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N85), .A1(Add_Subt_Sgf_module_Sgf_AS_n7), .B0(Add_Subt_Sgf_module_Sgf_AS_N29), 
        .B1(S_A_S_op), .Y(Add_Subt_Sgf_module_S_to_D[26]) );
  AO22X1TS Add_Subt_Sgf_module_Sgf_AS_U41 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N86), .A1(Add_Subt_Sgf_module_Sgf_AS_n7), .B0(Add_Subt_Sgf_module_Sgf_AS_N30), 
        .B1(S_A_S_op), .Y(Add_Subt_Sgf_module_S_to_D[27]) );
  AO22X1TS Add_Subt_Sgf_module_Sgf_AS_U40 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N87), .A1(Add_Subt_Sgf_module_Sgf_AS_n7), .B0(Add_Subt_Sgf_module_Sgf_AS_N31), 
        .B1(S_A_S_op), .Y(Add_Subt_Sgf_module_S_to_D[28]) );
  AO22X1TS Add_Subt_Sgf_module_Sgf_AS_U39 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N88), .A1(Add_Subt_Sgf_module_Sgf_AS_n7), .B0(Add_Subt_Sgf_module_Sgf_AS_N32), 
        .B1(S_A_S_op), .Y(Add_Subt_Sgf_module_S_to_D[29]) );
  AO22X1TS Add_Subt_Sgf_module_Sgf_AS_U38 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N61), .A1(Add_Subt_Sgf_module_Sgf_AS_n7), .B0(Add_Subt_Sgf_module_Sgf_AS_N5), .B1(
        S_A_S_op), .Y(Add_Subt_Sgf_module_S_to_D[2]) );
  AO22X1TS Add_Subt_Sgf_module_Sgf_AS_U37 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N89), .A1(Add_Subt_Sgf_module_Sgf_AS_n7), .B0(Add_Subt_Sgf_module_Sgf_AS_N33), 
        .B1(S_A_S_op), .Y(Add_Subt_Sgf_module_S_to_D[30]) );
  AO22X1TS Add_Subt_Sgf_module_Sgf_AS_U36 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N90), .A1(Add_Subt_Sgf_module_Sgf_AS_n7), .B0(Add_Subt_Sgf_module_Sgf_AS_N34), 
        .B1(S_A_S_op), .Y(Add_Subt_Sgf_module_S_to_D[31]) );
  AO22X1TS Add_Subt_Sgf_module_Sgf_AS_U35 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N91), .A1(Add_Subt_Sgf_module_Sgf_AS_n7), .B0(Add_Subt_Sgf_module_Sgf_AS_N35), 
        .B1(S_A_S_op), .Y(Add_Subt_Sgf_module_S_to_D[32]) );
  AO22X1TS Add_Subt_Sgf_module_Sgf_AS_U34 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N92), .A1(Add_Subt_Sgf_module_Sgf_AS_n7), .B0(Add_Subt_Sgf_module_Sgf_AS_N36), 
        .B1(S_A_S_op), .Y(Add_Subt_Sgf_module_S_to_D[33]) );
  AO22X1TS Add_Subt_Sgf_module_Sgf_AS_U33 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N93), .A1(Add_Subt_Sgf_module_Sgf_AS_n7), .B0(Add_Subt_Sgf_module_Sgf_AS_N37), 
        .B1(S_A_S_op), .Y(Add_Subt_Sgf_module_S_to_D[34]) );
  AO22X1TS Add_Subt_Sgf_module_Sgf_AS_U32 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N94), .A1(Add_Subt_Sgf_module_Sgf_AS_n7), .B0(Add_Subt_Sgf_module_Sgf_AS_N38), 
        .B1(S_A_S_op), .Y(Add_Subt_Sgf_module_S_to_D[35]) );
  AO22X1TS Add_Subt_Sgf_module_Sgf_AS_U31 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N95), .A1(Add_Subt_Sgf_module_Sgf_AS_n7), .B0(Add_Subt_Sgf_module_Sgf_AS_N39), 
        .B1(S_A_S_op), .Y(Add_Subt_Sgf_module_S_to_D[36]) );
  AO22X1TS Add_Subt_Sgf_module_Sgf_AS_U30 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N96), .A1(Add_Subt_Sgf_module_Sgf_AS_n7), .B0(Add_Subt_Sgf_module_Sgf_AS_N40), 
        .B1(S_A_S_op), .Y(Add_Subt_Sgf_module_S_to_D[37]) );
  AO22X1TS Add_Subt_Sgf_module_Sgf_AS_U29 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N97), .A1(Add_Subt_Sgf_module_Sgf_AS_n7), .B0(Add_Subt_Sgf_module_Sgf_AS_N41), 
        .B1(S_A_S_op), .Y(Add_Subt_Sgf_module_S_to_D[38]) );
  AO22X1TS Add_Subt_Sgf_module_Sgf_AS_U28 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N98), .A1(Add_Subt_Sgf_module_Sgf_AS_n7), .B0(Add_Subt_Sgf_module_Sgf_AS_N42), 
        .B1(S_A_S_op), .Y(Add_Subt_Sgf_module_S_to_D[39]) );
  AO22X1TS Add_Subt_Sgf_module_Sgf_AS_U27 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N62), .A1(Add_Subt_Sgf_module_Sgf_AS_n7), .B0(Add_Subt_Sgf_module_Sgf_AS_N6), .B1(
        S_A_S_op), .Y(Add_Subt_Sgf_module_S_to_D[3]) );
  AO22X1TS Add_Subt_Sgf_module_Sgf_AS_U26 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N99), .A1(Add_Subt_Sgf_module_Sgf_AS_n7), .B0(Add_Subt_Sgf_module_Sgf_AS_N43), 
        .B1(S_A_S_op), .Y(Add_Subt_Sgf_module_S_to_D[40]) );
  AO22X1TS Add_Subt_Sgf_module_Sgf_AS_U25 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N44), .A1(S_A_S_op), .B0(Add_Subt_Sgf_module_Sgf_AS_N100), .B1(
        Add_Subt_Sgf_module_Sgf_AS_n7), .Y(Add_Subt_Sgf_module_S_to_D[41]) );
  AO22X1TS Add_Subt_Sgf_module_Sgf_AS_U24 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N45), .A1(S_A_S_op), .B0(Add_Subt_Sgf_module_Sgf_AS_N101), .B1(
        Add_Subt_Sgf_module_Sgf_AS_n7), .Y(Add_Subt_Sgf_module_S_to_D[42]) );
  AO22X1TS Add_Subt_Sgf_module_Sgf_AS_U23 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N46), .A1(S_A_S_op), .B0(Add_Subt_Sgf_module_Sgf_AS_N102), .B1(
        Add_Subt_Sgf_module_Sgf_AS_n7), .Y(Add_Subt_Sgf_module_S_to_D[43]) );
  AO22X1TS Add_Subt_Sgf_module_Sgf_AS_U22 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N47), .A1(S_A_S_op), .B0(Add_Subt_Sgf_module_Sgf_AS_N103), .B1(
        Add_Subt_Sgf_module_Sgf_AS_n7), .Y(Add_Subt_Sgf_module_S_to_D[44]) );
  AO22X1TS Add_Subt_Sgf_module_Sgf_AS_U21 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N48), .A1(S_A_S_op), .B0(Add_Subt_Sgf_module_Sgf_AS_N104), .B1(
        Add_Subt_Sgf_module_Sgf_AS_n7), .Y(Add_Subt_Sgf_module_S_to_D[45]) );
  AO22X1TS Add_Subt_Sgf_module_Sgf_AS_U20 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N49), .A1(S_A_S_op), .B0(Add_Subt_Sgf_module_Sgf_AS_N105), .B1(
        Add_Subt_Sgf_module_Sgf_AS_n7), .Y(Add_Subt_Sgf_module_S_to_D[46]) );
  AO22X1TS Add_Subt_Sgf_module_Sgf_AS_U19 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N50), .A1(S_A_S_op), .B0(Add_Subt_Sgf_module_Sgf_AS_N106), .B1(
        Add_Subt_Sgf_module_Sgf_AS_n7), .Y(Add_Subt_Sgf_module_S_to_D[47]) );
  AO22X1TS Add_Subt_Sgf_module_Sgf_AS_U18 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N51), .A1(S_A_S_op), .B0(Add_Subt_Sgf_module_Sgf_AS_N107), .B1(
        Add_Subt_Sgf_module_Sgf_AS_n7), .Y(Add_Subt_Sgf_module_S_to_D[48]) );
  AO22X1TS Add_Subt_Sgf_module_Sgf_AS_U17 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N52), .A1(S_A_S_op), .B0(Add_Subt_Sgf_module_Sgf_AS_N108), .B1(
        Add_Subt_Sgf_module_Sgf_AS_n7), .Y(Add_Subt_Sgf_module_S_to_D[49]) );
  AO22X1TS Add_Subt_Sgf_module_Sgf_AS_U16 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N7), 
        .A1(S_A_S_op), .B0(Add_Subt_Sgf_module_Sgf_AS_N63), .B1(
        Add_Subt_Sgf_module_Sgf_AS_n7), .Y(Add_Subt_Sgf_module_S_to_D[4]) );
  AO22X1TS Add_Subt_Sgf_module_Sgf_AS_U15 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N53), .A1(S_A_S_op), .B0(Add_Subt_Sgf_module_Sgf_AS_N109), .B1(
        Add_Subt_Sgf_module_Sgf_AS_n7), .Y(Add_Subt_Sgf_module_S_to_D[50]) );
  AO22X1TS Add_Subt_Sgf_module_Sgf_AS_U14 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N54), .A1(S_A_S_op), .B0(Add_Subt_Sgf_module_Sgf_AS_N110), .B1(
        Add_Subt_Sgf_module_Sgf_AS_n7), .Y(Add_Subt_Sgf_module_S_to_D[51]) );
  AO22X1TS Add_Subt_Sgf_module_Sgf_AS_U13 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N55), .A1(S_A_S_op), .B0(Add_Subt_Sgf_module_Sgf_AS_N111), .B1(
        Add_Subt_Sgf_module_Sgf_AS_n7), .Y(Add_Subt_Sgf_module_S_to_D[52]) );
  AO22X1TS Add_Subt_Sgf_module_Sgf_AS_U12 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N56), .A1(S_A_S_op), .B0(Add_Subt_Sgf_module_Sgf_AS_N112), .B1(
        Add_Subt_Sgf_module_Sgf_AS_n7), .Y(Add_Subt_Sgf_module_S_to_D[53]) );
  AO22X1TS Add_Subt_Sgf_module_Sgf_AS_U11 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N57), .A1(S_A_S_op), .B0(Add_Subt_Sgf_module_Sgf_AS_N113), .B1(
        Add_Subt_Sgf_module_Sgf_AS_n7), .Y(Add_Subt_Sgf_module_S_to_D[54]) );
  AO22X1TS Add_Subt_Sgf_module_Sgf_AS_U10 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N58), .A1(S_A_S_op), .B0(Add_Subt_Sgf_module_Sgf_AS_N114), .B1(
        Add_Subt_Sgf_module_Sgf_AS_n7), .Y(Add_Subt_Sgf_module_S_to_D[55]) );
  AO22X1TS Add_Subt_Sgf_module_Sgf_AS_U9 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N8), 
        .A1(S_A_S_op), .B0(Add_Subt_Sgf_module_Sgf_AS_N64), .B1(
        Add_Subt_Sgf_module_Sgf_AS_n7), .Y(Add_Subt_Sgf_module_S_to_D[5]) );
  AO22X1TS Add_Subt_Sgf_module_Sgf_AS_U8 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N9), 
        .A1(S_A_S_op), .B0(Add_Subt_Sgf_module_Sgf_AS_N65), .B1(
        Add_Subt_Sgf_module_Sgf_AS_n7), .Y(Add_Subt_Sgf_module_S_to_D[6]) );
  AO22X1TS Add_Subt_Sgf_module_Sgf_AS_U7 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N66), 
        .A1(Add_Subt_Sgf_module_Sgf_AS_n7), .B0(Add_Subt_Sgf_module_Sgf_AS_N10), .B1(S_A_S_op), .Y(Add_Subt_Sgf_module_S_to_D[7]) );
  AO22X1TS Add_Subt_Sgf_module_Sgf_AS_U6 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N67), 
        .A1(Add_Subt_Sgf_module_Sgf_AS_n7), .B0(Add_Subt_Sgf_module_Sgf_AS_N11), .B1(S_A_S_op), .Y(Add_Subt_Sgf_module_S_to_D[8]) );
  AO22X1TS Add_Subt_Sgf_module_Sgf_AS_U5 ( .A0(Add_Subt_Sgf_module_Sgf_AS_N68), 
        .A1(Add_Subt_Sgf_module_Sgf_AS_n7), .B0(S_A_S_op), .B1(
        Add_Subt_Sgf_module_Sgf_AS_N12), .Y(Add_Subt_Sgf_module_S_to_D[9]) );
  CLKINVX1TS final_result_ieee_Module_Sgf_Mux_U53 ( .A(
        final_result_ieee_Module_overunder), .Y(
        final_result_ieee_Module_Sgf_Mux_n1) );
  OAI2BB2XLTS Add_Subt_Sgf_module_Add_overflow_Result_U2 ( .B0(n174), .B1(
        FSM_Add_Subt_Sgf_load), .A0N(FSM_Add_Subt_Sgf_load), .A1N(
        Add_Subt_Sgf_module_S_to_D[55]), .Y(n175) );
  INVX2TS Sel_D_U3 ( .A(rst_int), .Y(n172) );
  DFFRX4TS Sel_D_Q_reg_0_ ( .D(n173), .CK(clk), .RN(n172), .Q(FSM_selector_D), 
        .QN(n171) );
  CLKINVX1TS Add_Sub_Sgf_Oper_B_mux_U56 ( .A(FSM_selector_D), .Y(n170) );
  CLKINVX1TS Add_Sub_Sgf_Oper_A_mux_U56 ( .A(FSM_selector_D), .Y(n169) );
  AO22X1TS Add_Sub_Sgf_Oper_A_mux_U54 ( .A0(Sgf_normalized_result[10]), .A1(
        FSM_selector_D), .B0(DMP[8]), .B1(n169), .Y(S_A_S_Oper_A[10]) );
  AO22X1TS Add_Sub_Sgf_Oper_A_mux_U53 ( .A0(Sgf_normalized_result[11]), .A1(
        FSM_selector_D), .B0(DMP[9]), .B1(n169), .Y(S_A_S_Oper_A[11]) );
  AO22X1TS Add_Sub_Sgf_Oper_A_mux_U52 ( .A0(Sgf_normalized_result[12]), .A1(
        FSM_selector_D), .B0(DMP[10]), .B1(n169), .Y(S_A_S_Oper_A[12]) );
  AO22X1TS Add_Sub_Sgf_Oper_A_mux_U51 ( .A0(Sgf_normalized_result[13]), .A1(
        FSM_selector_D), .B0(DMP[11]), .B1(n169), .Y(S_A_S_Oper_A[13]) );
  AO22X1TS Add_Sub_Sgf_Oper_A_mux_U50 ( .A0(Sgf_normalized_result[14]), .A1(
        FSM_selector_D), .B0(DMP[12]), .B1(n169), .Y(S_A_S_Oper_A[14]) );
  AO22X1TS Add_Sub_Sgf_Oper_A_mux_U49 ( .A0(Sgf_normalized_result[15]), .A1(
        FSM_selector_D), .B0(DMP[13]), .B1(n169), .Y(S_A_S_Oper_A[15]) );
  AO22X1TS Add_Sub_Sgf_Oper_A_mux_U48 ( .A0(Sgf_normalized_result[16]), .A1(
        FSM_selector_D), .B0(DMP[14]), .B1(n169), .Y(S_A_S_Oper_A[16]) );
  AO22X1TS Add_Sub_Sgf_Oper_A_mux_U47 ( .A0(Sgf_normalized_result[17]), .A1(
        FSM_selector_D), .B0(DMP[15]), .B1(n169), .Y(S_A_S_Oper_A[17]) );
  AO22X1TS Add_Sub_Sgf_Oper_A_mux_U46 ( .A0(Sgf_normalized_result[18]), .A1(
        FSM_selector_D), .B0(DMP[16]), .B1(n169), .Y(S_A_S_Oper_A[18]) );
  AO22X1TS Add_Sub_Sgf_Oper_A_mux_U45 ( .A0(Sgf_normalized_result[19]), .A1(
        FSM_selector_D), .B0(DMP[17]), .B1(n169), .Y(S_A_S_Oper_A[19]) );
  AO22X1TS Add_Sub_Sgf_Oper_A_mux_U43 ( .A0(Sgf_normalized_result[20]), .A1(
        FSM_selector_D), .B0(DMP[18]), .B1(n169), .Y(S_A_S_Oper_A[20]) );
  AO22X1TS Add_Sub_Sgf_Oper_A_mux_U42 ( .A0(Sgf_normalized_result[21]), .A1(
        FSM_selector_D), .B0(DMP[19]), .B1(n169), .Y(S_A_S_Oper_A[21]) );
  AO22X1TS Add_Sub_Sgf_Oper_A_mux_U41 ( .A0(Sgf_normalized_result[22]), .A1(
        FSM_selector_D), .B0(DMP[20]), .B1(n169), .Y(S_A_S_Oper_A[22]) );
  AO22X1TS Add_Sub_Sgf_Oper_A_mux_U40 ( .A0(Sgf_normalized_result[23]), .A1(
        FSM_selector_D), .B0(DMP[21]), .B1(n169), .Y(S_A_S_Oper_A[23]) );
  AO22X1TS Add_Sub_Sgf_Oper_A_mux_U39 ( .A0(Sgf_normalized_result[24]), .A1(
        FSM_selector_D), .B0(DMP[22]), .B1(n169), .Y(S_A_S_Oper_A[24]) );
  AO22X1TS Add_Sub_Sgf_Oper_A_mux_U38 ( .A0(Sgf_normalized_result[25]), .A1(
        FSM_selector_D), .B0(DMP[23]), .B1(n169), .Y(S_A_S_Oper_A[25]) );
  AO22X1TS Add_Sub_Sgf_Oper_A_mux_U37 ( .A0(Sgf_normalized_result[26]), .A1(
        FSM_selector_D), .B0(DMP[24]), .B1(n169), .Y(S_A_S_Oper_A[26]) );
  AO22X1TS Add_Sub_Sgf_Oper_A_mux_U36 ( .A0(Sgf_normalized_result[27]), .A1(
        FSM_selector_D), .B0(DMP[25]), .B1(n169), .Y(S_A_S_Oper_A[27]) );
  AO22X1TS Add_Sub_Sgf_Oper_A_mux_U35 ( .A0(Sgf_normalized_result[28]), .A1(
        FSM_selector_D), .B0(DMP[26]), .B1(n169), .Y(S_A_S_Oper_A[28]) );
  AO22X1TS Add_Sub_Sgf_Oper_A_mux_U34 ( .A0(Sgf_normalized_result[29]), .A1(
        FSM_selector_D), .B0(DMP[27]), .B1(n169), .Y(S_A_S_Oper_A[29]) );
  AO22X1TS Add_Sub_Sgf_Oper_A_mux_U33 ( .A0(Sgf_normalized_result[2]), .A1(
        FSM_selector_D), .B0(DMP[0]), .B1(n169), .Y(S_A_S_Oper_A[2]) );
  AO22X1TS Add_Sub_Sgf_Oper_A_mux_U32 ( .A0(Sgf_normalized_result[30]), .A1(
        FSM_selector_D), .B0(DMP[28]), .B1(n169), .Y(S_A_S_Oper_A[30]) );
  AO22X1TS Add_Sub_Sgf_Oper_A_mux_U31 ( .A0(Sgf_normalized_result[31]), .A1(
        FSM_selector_D), .B0(DMP[29]), .B1(n169), .Y(S_A_S_Oper_A[31]) );
  AO22X1TS Add_Sub_Sgf_Oper_A_mux_U30 ( .A0(Sgf_normalized_result[32]), .A1(
        FSM_selector_D), .B0(DMP[30]), .B1(n169), .Y(S_A_S_Oper_A[32]) );
  AO22X1TS Add_Sub_Sgf_Oper_A_mux_U29 ( .A0(Sgf_normalized_result[33]), .A1(
        FSM_selector_D), .B0(DMP[31]), .B1(n169), .Y(S_A_S_Oper_A[33]) );
  AO22X1TS Add_Sub_Sgf_Oper_A_mux_U28 ( .A0(Sgf_normalized_result[34]), .A1(
        FSM_selector_D), .B0(DMP[32]), .B1(n169), .Y(S_A_S_Oper_A[34]) );
  AO22X1TS Add_Sub_Sgf_Oper_A_mux_U27 ( .A0(Sgf_normalized_result[35]), .A1(
        FSM_selector_D), .B0(DMP[33]), .B1(n169), .Y(S_A_S_Oper_A[35]) );
  AO22X1TS Add_Sub_Sgf_Oper_A_mux_U26 ( .A0(Sgf_normalized_result[36]), .A1(
        FSM_selector_D), .B0(DMP[34]), .B1(n169), .Y(S_A_S_Oper_A[36]) );
  AO22X1TS Add_Sub_Sgf_Oper_A_mux_U25 ( .A0(Sgf_normalized_result[37]), .A1(
        FSM_selector_D), .B0(DMP[35]), .B1(n169), .Y(S_A_S_Oper_A[37]) );
  AO22X1TS Add_Sub_Sgf_Oper_A_mux_U24 ( .A0(Sgf_normalized_result[38]), .A1(
        FSM_selector_D), .B0(DMP[36]), .B1(n169), .Y(S_A_S_Oper_A[38]) );
  AO22X1TS Add_Sub_Sgf_Oper_A_mux_U23 ( .A0(Sgf_normalized_result[39]), .A1(
        FSM_selector_D), .B0(DMP[37]), .B1(n169), .Y(S_A_S_Oper_A[39]) );
  AO22X1TS Add_Sub_Sgf_Oper_A_mux_U22 ( .A0(Sgf_normalized_result[3]), .A1(
        FSM_selector_D), .B0(DMP[1]), .B1(n169), .Y(S_A_S_Oper_A[3]) );
  AO22X1TS Add_Sub_Sgf_Oper_A_mux_U21 ( .A0(Sgf_normalized_result[40]), .A1(
        FSM_selector_D), .B0(DMP[38]), .B1(n169), .Y(S_A_S_Oper_A[40]) );
  AO22X1TS Add_Sub_Sgf_Oper_A_mux_U20 ( .A0(Sgf_normalized_result[41]), .A1(
        FSM_selector_D), .B0(DMP[39]), .B1(n169), .Y(S_A_S_Oper_A[41]) );
  AO22X1TS Add_Sub_Sgf_Oper_A_mux_U19 ( .A0(Sgf_normalized_result[42]), .A1(
        FSM_selector_D), .B0(DMP[40]), .B1(n169), .Y(S_A_S_Oper_A[42]) );
  AO22X1TS Add_Sub_Sgf_Oper_A_mux_U18 ( .A0(Sgf_normalized_result[43]), .A1(
        FSM_selector_D), .B0(DMP[41]), .B1(n169), .Y(S_A_S_Oper_A[43]) );
  AO22X1TS Add_Sub_Sgf_Oper_A_mux_U17 ( .A0(Sgf_normalized_result[44]), .A1(
        FSM_selector_D), .B0(DMP[42]), .B1(n169), .Y(S_A_S_Oper_A[44]) );
  AO22X1TS Add_Sub_Sgf_Oper_A_mux_U16 ( .A0(Sgf_normalized_result[45]), .A1(
        FSM_selector_D), .B0(DMP[43]), .B1(n169), .Y(S_A_S_Oper_A[45]) );
  AO22X1TS Add_Sub_Sgf_Oper_A_mux_U15 ( .A0(Sgf_normalized_result[46]), .A1(
        FSM_selector_D), .B0(DMP[44]), .B1(n169), .Y(S_A_S_Oper_A[46]) );
  AO22X1TS Add_Sub_Sgf_Oper_A_mux_U14 ( .A0(Sgf_normalized_result[47]), .A1(
        FSM_selector_D), .B0(DMP[45]), .B1(n169), .Y(S_A_S_Oper_A[47]) );
  AO22X1TS Add_Sub_Sgf_Oper_A_mux_U13 ( .A0(Sgf_normalized_result[48]), .A1(
        FSM_selector_D), .B0(DMP[46]), .B1(n169), .Y(S_A_S_Oper_A[48]) );
  AO22X1TS Add_Sub_Sgf_Oper_A_mux_U12 ( .A0(Sgf_normalized_result[49]), .A1(
        FSM_selector_D), .B0(DMP[47]), .B1(n169), .Y(S_A_S_Oper_A[49]) );
  AO22X1TS Add_Sub_Sgf_Oper_A_mux_U11 ( .A0(Sgf_normalized_result[4]), .A1(
        FSM_selector_D), .B0(DMP[2]), .B1(n169), .Y(S_A_S_Oper_A[4]) );
  AO22X1TS Add_Sub_Sgf_Oper_A_mux_U10 ( .A0(Sgf_normalized_result[50]), .A1(
        FSM_selector_D), .B0(DMP[48]), .B1(n169), .Y(S_A_S_Oper_A[50]) );
  AO22X1TS Add_Sub_Sgf_Oper_A_mux_U9 ( .A0(Sgf_normalized_result[51]), .A1(
        FSM_selector_D), .B0(DMP[49]), .B1(n169), .Y(S_A_S_Oper_A[51]) );
  AO22X1TS Add_Sub_Sgf_Oper_A_mux_U8 ( .A0(Sgf_normalized_result[52]), .A1(
        FSM_selector_D), .B0(DMP[50]), .B1(n169), .Y(S_A_S_Oper_A[52]) );
  AO22X1TS Add_Sub_Sgf_Oper_A_mux_U7 ( .A0(Sgf_normalized_result[53]), .A1(
        FSM_selector_D), .B0(DMP[51]), .B1(n169), .Y(S_A_S_Oper_A[53]) );
  AO22X1TS Add_Sub_Sgf_Oper_A_mux_U5 ( .A0(Sgf_normalized_result[5]), .A1(
        FSM_selector_D), .B0(DMP[3]), .B1(n169), .Y(S_A_S_Oper_A[5]) );
  AO22X1TS Add_Sub_Sgf_Oper_A_mux_U4 ( .A0(Sgf_normalized_result[6]), .A1(
        FSM_selector_D), .B0(DMP[4]), .B1(n169), .Y(S_A_S_Oper_A[6]) );
  AO22X1TS Add_Sub_Sgf_Oper_A_mux_U3 ( .A0(Sgf_normalized_result[7]), .A1(
        FSM_selector_D), .B0(DMP[5]), .B1(n169), .Y(S_A_S_Oper_A[7]) );
  AO22X1TS Add_Sub_Sgf_Oper_A_mux_U2 ( .A0(Sgf_normalized_result[8]), .A1(
        FSM_selector_D), .B0(DMP[6]), .B1(n169), .Y(S_A_S_Oper_A[8]) );
  AO22X1TS Add_Sub_Sgf_Oper_A_mux_U1 ( .A0(FSM_selector_D), .A1(
        Sgf_normalized_result[9]), .B0(DMP[7]), .B1(n169), .Y(S_A_S_Oper_A[9])
         );
  INVX2TS Add_Subt_Sgf_module_Add_Subt_Result_U57 ( .A(rst_int), .Y(n167) );
  OAI2BB2XLTS Add_Subt_Sgf_module_Add_Subt_Result_U56 ( .B0(Add_Subt_LZD[54]), 
        .B1(FSM_Add_Subt_Sgf_load), .A0N(Add_Subt_Sgf_module_S_to_D[54]), 
        .A1N(FSM_Add_Subt_Sgf_load), .Y(n168) );
  OAI2BB2XLTS Add_Subt_Sgf_module_Add_Subt_Result_U55 ( .B0(Add_Subt_LZD[53]), 
        .B1(FSM_Add_Subt_Sgf_load), .A0N(Add_Subt_Sgf_module_S_to_D[53]), 
        .A1N(FSM_Add_Subt_Sgf_load), .Y(n166) );
  OAI2BB2XLTS Add_Subt_Sgf_module_Add_Subt_Result_U54 ( .B0(Add_Subt_LZD[52]), 
        .B1(FSM_Add_Subt_Sgf_load), .A0N(Add_Subt_Sgf_module_S_to_D[52]), 
        .A1N(FSM_Add_Subt_Sgf_load), .Y(n165) );
  OAI2BB2XLTS Add_Subt_Sgf_module_Add_Subt_Result_U53 ( .B0(Add_Subt_LZD[51]), 
        .B1(FSM_Add_Subt_Sgf_load), .A0N(Add_Subt_Sgf_module_S_to_D[51]), 
        .A1N(FSM_Add_Subt_Sgf_load), .Y(n164) );
  OAI2BB2XLTS Add_Subt_Sgf_module_Add_Subt_Result_U52 ( .B0(Add_Subt_LZD[50]), 
        .B1(FSM_Add_Subt_Sgf_load), .A0N(Add_Subt_Sgf_module_S_to_D[50]), 
        .A1N(FSM_Add_Subt_Sgf_load), .Y(n163) );
  OAI2BB2XLTS Add_Subt_Sgf_module_Add_Subt_Result_U51 ( .B0(Add_Subt_LZD[49]), 
        .B1(FSM_Add_Subt_Sgf_load), .A0N(Add_Subt_Sgf_module_S_to_D[49]), 
        .A1N(FSM_Add_Subt_Sgf_load), .Y(n162) );
  OAI2BB2XLTS Add_Subt_Sgf_module_Add_Subt_Result_U50 ( .B0(Add_Subt_LZD[48]), 
        .B1(FSM_Add_Subt_Sgf_load), .A0N(Add_Subt_Sgf_module_S_to_D[48]), 
        .A1N(FSM_Add_Subt_Sgf_load), .Y(n161) );
  OAI2BB2XLTS Add_Subt_Sgf_module_Add_Subt_Result_U49 ( .B0(Add_Subt_LZD[47]), 
        .B1(FSM_Add_Subt_Sgf_load), .A0N(Add_Subt_Sgf_module_S_to_D[47]), 
        .A1N(FSM_Add_Subt_Sgf_load), .Y(n160) );
  OAI2BB2XLTS Add_Subt_Sgf_module_Add_Subt_Result_U48 ( .B0(Add_Subt_LZD[46]), 
        .B1(FSM_Add_Subt_Sgf_load), .A0N(Add_Subt_Sgf_module_S_to_D[46]), 
        .A1N(FSM_Add_Subt_Sgf_load), .Y(n159) );
  OAI2BB2XLTS Add_Subt_Sgf_module_Add_Subt_Result_U47 ( .B0(Add_Subt_LZD[45]), 
        .B1(FSM_Add_Subt_Sgf_load), .A0N(Add_Subt_Sgf_module_S_to_D[45]), 
        .A1N(FSM_Add_Subt_Sgf_load), .Y(n158) );
  OAI2BB2XLTS Add_Subt_Sgf_module_Add_Subt_Result_U46 ( .B0(Add_Subt_LZD[44]), 
        .B1(FSM_Add_Subt_Sgf_load), .A0N(Add_Subt_Sgf_module_S_to_D[44]), 
        .A1N(FSM_Add_Subt_Sgf_load), .Y(n157) );
  OAI2BB2XLTS Add_Subt_Sgf_module_Add_Subt_Result_U45 ( .B0(Add_Subt_LZD[43]), 
        .B1(FSM_Add_Subt_Sgf_load), .A0N(Add_Subt_Sgf_module_S_to_D[43]), 
        .A1N(FSM_Add_Subt_Sgf_load), .Y(n156) );
  OAI2BB2XLTS Add_Subt_Sgf_module_Add_Subt_Result_U44 ( .B0(Add_Subt_LZD[42]), 
        .B1(FSM_Add_Subt_Sgf_load), .A0N(Add_Subt_Sgf_module_S_to_D[42]), 
        .A1N(FSM_Add_Subt_Sgf_load), .Y(n155) );
  OAI2BB2XLTS Add_Subt_Sgf_module_Add_Subt_Result_U43 ( .B0(Add_Subt_LZD[41]), 
        .B1(FSM_Add_Subt_Sgf_load), .A0N(Add_Subt_Sgf_module_S_to_D[41]), 
        .A1N(FSM_Add_Subt_Sgf_load), .Y(n154) );
  OAI2BB2XLTS Add_Subt_Sgf_module_Add_Subt_Result_U42 ( .B0(Add_Subt_LZD[40]), 
        .B1(FSM_Add_Subt_Sgf_load), .A0N(Add_Subt_Sgf_module_S_to_D[40]), 
        .A1N(FSM_Add_Subt_Sgf_load), .Y(n153) );
  OAI2BB2XLTS Add_Subt_Sgf_module_Add_Subt_Result_U41 ( .B0(Add_Subt_LZD[39]), 
        .B1(FSM_Add_Subt_Sgf_load), .A0N(Add_Subt_Sgf_module_S_to_D[39]), 
        .A1N(FSM_Add_Subt_Sgf_load), .Y(n152) );
  OAI2BB2XLTS Add_Subt_Sgf_module_Add_Subt_Result_U40 ( .B0(Add_Subt_LZD[38]), 
        .B1(FSM_Add_Subt_Sgf_load), .A0N(Add_Subt_Sgf_module_S_to_D[38]), 
        .A1N(FSM_Add_Subt_Sgf_load), .Y(n151) );
  OAI2BB2XLTS Add_Subt_Sgf_module_Add_Subt_Result_U39 ( .B0(Add_Subt_LZD[37]), 
        .B1(FSM_Add_Subt_Sgf_load), .A0N(Add_Subt_Sgf_module_S_to_D[37]), 
        .A1N(FSM_Add_Subt_Sgf_load), .Y(n150) );
  OAI2BB2XLTS Add_Subt_Sgf_module_Add_Subt_Result_U38 ( .B0(Add_Subt_LZD[36]), 
        .B1(FSM_Add_Subt_Sgf_load), .A0N(Add_Subt_Sgf_module_S_to_D[36]), 
        .A1N(FSM_Add_Subt_Sgf_load), .Y(n149) );
  OAI2BB2XLTS Add_Subt_Sgf_module_Add_Subt_Result_U37 ( .B0(Add_Subt_LZD[35]), 
        .B1(FSM_Add_Subt_Sgf_load), .A0N(Add_Subt_Sgf_module_S_to_D[35]), 
        .A1N(FSM_Add_Subt_Sgf_load), .Y(n148) );
  OAI2BB2XLTS Add_Subt_Sgf_module_Add_Subt_Result_U36 ( .B0(Add_Subt_LZD[34]), 
        .B1(FSM_Add_Subt_Sgf_load), .A0N(Add_Subt_Sgf_module_S_to_D[34]), 
        .A1N(FSM_Add_Subt_Sgf_load), .Y(n147) );
  OAI2BB2XLTS Add_Subt_Sgf_module_Add_Subt_Result_U35 ( .B0(Add_Subt_LZD[33]), 
        .B1(FSM_Add_Subt_Sgf_load), .A0N(Add_Subt_Sgf_module_S_to_D[33]), 
        .A1N(FSM_Add_Subt_Sgf_load), .Y(n146) );
  OAI2BB2XLTS Add_Subt_Sgf_module_Add_Subt_Result_U34 ( .B0(Add_Subt_LZD[32]), 
        .B1(FSM_Add_Subt_Sgf_load), .A0N(Add_Subt_Sgf_module_S_to_D[32]), 
        .A1N(FSM_Add_Subt_Sgf_load), .Y(n145) );
  OAI2BB2XLTS Add_Subt_Sgf_module_Add_Subt_Result_U33 ( .B0(Add_Subt_LZD[31]), 
        .B1(FSM_Add_Subt_Sgf_load), .A0N(Add_Subt_Sgf_module_S_to_D[31]), 
        .A1N(FSM_Add_Subt_Sgf_load), .Y(n144) );
  OAI2BB2XLTS Add_Subt_Sgf_module_Add_Subt_Result_U32 ( .B0(Add_Subt_LZD[30]), 
        .B1(FSM_Add_Subt_Sgf_load), .A0N(Add_Subt_Sgf_module_S_to_D[30]), 
        .A1N(FSM_Add_Subt_Sgf_load), .Y(n143) );
  OAI2BB2XLTS Add_Subt_Sgf_module_Add_Subt_Result_U31 ( .B0(Add_Subt_LZD[29]), 
        .B1(FSM_Add_Subt_Sgf_load), .A0N(Add_Subt_Sgf_module_S_to_D[29]), 
        .A1N(FSM_Add_Subt_Sgf_load), .Y(n142) );
  OAI2BB2XLTS Add_Subt_Sgf_module_Add_Subt_Result_U30 ( .B0(Add_Subt_LZD[28]), 
        .B1(FSM_Add_Subt_Sgf_load), .A0N(Add_Subt_Sgf_module_S_to_D[28]), 
        .A1N(FSM_Add_Subt_Sgf_load), .Y(n141) );
  OAI2BB2XLTS Add_Subt_Sgf_module_Add_Subt_Result_U29 ( .B0(Add_Subt_LZD[27]), 
        .B1(FSM_Add_Subt_Sgf_load), .A0N(Add_Subt_Sgf_module_S_to_D[27]), 
        .A1N(FSM_Add_Subt_Sgf_load), .Y(n140) );
  OAI2BB2XLTS Add_Subt_Sgf_module_Add_Subt_Result_U28 ( .B0(Add_Subt_LZD[26]), 
        .B1(FSM_Add_Subt_Sgf_load), .A0N(Add_Subt_Sgf_module_S_to_D[26]), 
        .A1N(FSM_Add_Subt_Sgf_load), .Y(n139) );
  OAI2BB2XLTS Add_Subt_Sgf_module_Add_Subt_Result_U27 ( .B0(Add_Subt_LZD[25]), 
        .B1(FSM_Add_Subt_Sgf_load), .A0N(Add_Subt_Sgf_module_S_to_D[25]), 
        .A1N(FSM_Add_Subt_Sgf_load), .Y(n138) );
  OAI2BB2XLTS Add_Subt_Sgf_module_Add_Subt_Result_U26 ( .B0(Add_Subt_LZD[24]), 
        .B1(FSM_Add_Subt_Sgf_load), .A0N(Add_Subt_Sgf_module_S_to_D[24]), 
        .A1N(FSM_Add_Subt_Sgf_load), .Y(n137) );
  OAI2BB2XLTS Add_Subt_Sgf_module_Add_Subt_Result_U25 ( .B0(Add_Subt_LZD[23]), 
        .B1(FSM_Add_Subt_Sgf_load), .A0N(Add_Subt_Sgf_module_S_to_D[23]), 
        .A1N(FSM_Add_Subt_Sgf_load), .Y(n136) );
  OAI2BB2XLTS Add_Subt_Sgf_module_Add_Subt_Result_U24 ( .B0(Add_Subt_LZD[22]), 
        .B1(FSM_Add_Subt_Sgf_load), .A0N(Add_Subt_Sgf_module_S_to_D[22]), 
        .A1N(FSM_Add_Subt_Sgf_load), .Y(n135) );
  OAI2BB2XLTS Add_Subt_Sgf_module_Add_Subt_Result_U23 ( .B0(Add_Subt_LZD[21]), 
        .B1(FSM_Add_Subt_Sgf_load), .A0N(Add_Subt_Sgf_module_S_to_D[21]), 
        .A1N(FSM_Add_Subt_Sgf_load), .Y(n134) );
  OAI2BB2XLTS Add_Subt_Sgf_module_Add_Subt_Result_U22 ( .B0(Add_Subt_LZD[20]), 
        .B1(FSM_Add_Subt_Sgf_load), .A0N(Add_Subt_Sgf_module_S_to_D[20]), 
        .A1N(FSM_Add_Subt_Sgf_load), .Y(n133) );
  OAI2BB2XLTS Add_Subt_Sgf_module_Add_Subt_Result_U21 ( .B0(Add_Subt_LZD[19]), 
        .B1(FSM_Add_Subt_Sgf_load), .A0N(Add_Subt_Sgf_module_S_to_D[19]), 
        .A1N(FSM_Add_Subt_Sgf_load), .Y(n132) );
  OAI2BB2XLTS Add_Subt_Sgf_module_Add_Subt_Result_U20 ( .B0(Add_Subt_LZD[18]), 
        .B1(FSM_Add_Subt_Sgf_load), .A0N(Add_Subt_Sgf_module_S_to_D[18]), 
        .A1N(FSM_Add_Subt_Sgf_load), .Y(n131) );
  OAI2BB2XLTS Add_Subt_Sgf_module_Add_Subt_Result_U19 ( .B0(Add_Subt_LZD[17]), 
        .B1(FSM_Add_Subt_Sgf_load), .A0N(Add_Subt_Sgf_module_S_to_D[17]), 
        .A1N(FSM_Add_Subt_Sgf_load), .Y(n130) );
  OAI2BB2XLTS Add_Subt_Sgf_module_Add_Subt_Result_U18 ( .B0(Add_Subt_LZD[16]), 
        .B1(FSM_Add_Subt_Sgf_load), .A0N(Add_Subt_Sgf_module_S_to_D[16]), 
        .A1N(FSM_Add_Subt_Sgf_load), .Y(n129) );
  OAI2BB2XLTS Add_Subt_Sgf_module_Add_Subt_Result_U17 ( .B0(Add_Subt_LZD[15]), 
        .B1(FSM_Add_Subt_Sgf_load), .A0N(Add_Subt_Sgf_module_S_to_D[15]), 
        .A1N(FSM_Add_Subt_Sgf_load), .Y(n128) );
  OAI2BB2XLTS Add_Subt_Sgf_module_Add_Subt_Result_U16 ( .B0(Add_Subt_LZD[14]), 
        .B1(FSM_Add_Subt_Sgf_load), .A0N(Add_Subt_Sgf_module_S_to_D[14]), 
        .A1N(FSM_Add_Subt_Sgf_load), .Y(n127) );
  OAI2BB2XLTS Add_Subt_Sgf_module_Add_Subt_Result_U15 ( .B0(Add_Subt_LZD[13]), 
        .B1(FSM_Add_Subt_Sgf_load), .A0N(Add_Subt_Sgf_module_S_to_D[13]), 
        .A1N(FSM_Add_Subt_Sgf_load), .Y(n126) );
  OAI2BB2XLTS Add_Subt_Sgf_module_Add_Subt_Result_U14 ( .B0(Add_Subt_LZD[12]), 
        .B1(FSM_Add_Subt_Sgf_load), .A0N(Add_Subt_Sgf_module_S_to_D[12]), 
        .A1N(FSM_Add_Subt_Sgf_load), .Y(n125) );
  OAI2BB2XLTS Add_Subt_Sgf_module_Add_Subt_Result_U13 ( .B0(Add_Subt_LZD[11]), 
        .B1(FSM_Add_Subt_Sgf_load), .A0N(Add_Subt_Sgf_module_S_to_D[11]), 
        .A1N(FSM_Add_Subt_Sgf_load), .Y(n124) );
  OAI2BB2XLTS Add_Subt_Sgf_module_Add_Subt_Result_U12 ( .B0(Add_Subt_LZD[10]), 
        .B1(FSM_Add_Subt_Sgf_load), .A0N(Add_Subt_Sgf_module_S_to_D[10]), 
        .A1N(FSM_Add_Subt_Sgf_load), .Y(n123) );
  OAI2BB2XLTS Add_Subt_Sgf_module_Add_Subt_Result_U11 ( .B0(Add_Subt_LZD[9]), 
        .B1(FSM_Add_Subt_Sgf_load), .A0N(Add_Subt_Sgf_module_S_to_D[9]), .A1N(
        FSM_Add_Subt_Sgf_load), .Y(n122) );
  OAI2BB2XLTS Add_Subt_Sgf_module_Add_Subt_Result_U10 ( .B0(Add_Subt_LZD[8]), 
        .B1(FSM_Add_Subt_Sgf_load), .A0N(Add_Subt_Sgf_module_S_to_D[8]), .A1N(
        FSM_Add_Subt_Sgf_load), .Y(n121) );
  OAI2BB2XLTS Add_Subt_Sgf_module_Add_Subt_Result_U9 ( .B0(Add_Subt_LZD[7]), 
        .B1(FSM_Add_Subt_Sgf_load), .A0N(Add_Subt_Sgf_module_S_to_D[7]), .A1N(
        FSM_Add_Subt_Sgf_load), .Y(n120) );
  OAI2BB2XLTS Add_Subt_Sgf_module_Add_Subt_Result_U8 ( .B0(Add_Subt_LZD[6]), 
        .B1(FSM_Add_Subt_Sgf_load), .A0N(Add_Subt_Sgf_module_S_to_D[6]), .A1N(
        FSM_Add_Subt_Sgf_load), .Y(n119) );
  OAI2BB2XLTS Add_Subt_Sgf_module_Add_Subt_Result_U7 ( .B0(Add_Subt_LZD[5]), 
        .B1(FSM_Add_Subt_Sgf_load), .A0N(Add_Subt_Sgf_module_S_to_D[5]), .A1N(
        FSM_Add_Subt_Sgf_load), .Y(n118) );
  OAI2BB2XLTS Add_Subt_Sgf_module_Add_Subt_Result_U6 ( .B0(Add_Subt_LZD[4]), 
        .B1(FSM_Add_Subt_Sgf_load), .A0N(Add_Subt_Sgf_module_S_to_D[4]), .A1N(
        FSM_Add_Subt_Sgf_load), .Y(n117) );
  OAI2BB2XLTS Add_Subt_Sgf_module_Add_Subt_Result_U5 ( .B0(Add_Subt_LZD[3]), 
        .B1(FSM_Add_Subt_Sgf_load), .A0N(Add_Subt_Sgf_module_S_to_D[3]), .A1N(
        FSM_Add_Subt_Sgf_load), .Y(n116) );
  OAI2BB2XLTS Add_Subt_Sgf_module_Add_Subt_Result_U4 ( .B0(Add_Subt_LZD[2]), 
        .B1(FSM_Add_Subt_Sgf_load), .A0N(Add_Subt_Sgf_module_S_to_D[2]), .A1N(
        FSM_Add_Subt_Sgf_load), .Y(n115) );
  OAI2BB2XLTS Add_Subt_Sgf_module_Add_Subt_Result_U3 ( .B0(Add_Subt_LZD[1]), 
        .B1(FSM_Add_Subt_Sgf_load), .A0N(Add_Subt_Sgf_module_S_to_D[1]), .A1N(
        FSM_Add_Subt_Sgf_load), .Y(n114) );
  OAI2BB2XLTS Add_Subt_Sgf_module_Add_Subt_Result_U2 ( .B0(Add_Subt_LZD[0]), 
        .B1(FSM_Add_Subt_Sgf_load), .A0N(FSM_Add_Subt_Sgf_load), .A1N(
        Add_Subt_Sgf_module_S_to_D[0]), .Y(n113) );
  DFFRXLTS Barrel_Shifter_module_Output_Reg_Q_reg_45_ ( .D(
        Barrel_Shifter_module_Output_Reg_n101), .CK(clk), .RN(
        Barrel_Shifter_module_Output_Reg_n110), .Q(Sgf_normalized_result[45]), 
        .QN(Barrel_Shifter_module_Output_Reg_n46) );
  DFFRXLTS Barrel_Shifter_module_Output_Reg_Q_reg_46_ ( .D(
        Barrel_Shifter_module_Output_Reg_n102), .CK(clk), .RN(
        Barrel_Shifter_module_Output_Reg_n110), .Q(Sgf_normalized_result[46]), 
        .QN(Barrel_Shifter_module_Output_Reg_n47) );
  DFFRXLTS Barrel_Shifter_module_Output_Reg_Q_reg_44_ ( .D(
        Barrel_Shifter_module_Output_Reg_n100), .CK(clk), .RN(
        Barrel_Shifter_module_Output_Reg_n110), .Q(Sgf_normalized_result[44]), 
        .QN(Barrel_Shifter_module_Output_Reg_n45) );
  DFFRXLTS Barrel_Shifter_module_Output_Reg_Q_reg_43_ ( .D(
        Barrel_Shifter_module_Output_Reg_n99), .CK(clk), .RN(
        Barrel_Shifter_module_Output_Reg_n110), .Q(Sgf_normalized_result[43]), 
        .QN(Barrel_Shifter_module_Output_Reg_n44) );
  DFFRXLTS Barrel_Shifter_module_Output_Reg_Q_reg_42_ ( .D(
        Barrel_Shifter_module_Output_Reg_n98), .CK(clk), .RN(
        Barrel_Shifter_module_Output_Reg_n110), .Q(Sgf_normalized_result[42]), 
        .QN(Barrel_Shifter_module_Output_Reg_n43) );
  DFFRXLTS Barrel_Shifter_module_Output_Reg_Q_reg_41_ ( .D(
        Barrel_Shifter_module_Output_Reg_n97), .CK(clk), .RN(
        Barrel_Shifter_module_Output_Reg_n110), .Q(Sgf_normalized_result[41]), 
        .QN(Barrel_Shifter_module_Output_Reg_n42) );
  DFFRXLTS Barrel_Shifter_module_Output_Reg_Q_reg_40_ ( .D(
        Barrel_Shifter_module_Output_Reg_n96), .CK(clk), .RN(
        Barrel_Shifter_module_Output_Reg_n110), .Q(Sgf_normalized_result[40]), 
        .QN(Barrel_Shifter_module_Output_Reg_n41) );
  DFFRXLTS Barrel_Shifter_module_Output_Reg_Q_reg_39_ ( .D(
        Barrel_Shifter_module_Output_Reg_n95), .CK(clk), .RN(
        Barrel_Shifter_module_Output_Reg_n110), .Q(Sgf_normalized_result[39]), 
        .QN(Barrel_Shifter_module_Output_Reg_n40) );
  DFFRXLTS Barrel_Shifter_module_Output_Reg_Q_reg_54_ ( .D(
        Barrel_Shifter_module_Output_Reg_n111), .CK(clk), .RN(
        Barrel_Shifter_module_Output_Reg_n110), .Q(Sgf_normalized_result[54]), 
        .QN(n3) );
  DFFRXLTS Barrel_Shifter_module_Output_Reg_Q_reg_53_ ( .D(
        Barrel_Shifter_module_Output_Reg_n109), .CK(clk), .RN(
        Barrel_Shifter_module_Output_Reg_n110), .Q(Sgf_normalized_result[53]), 
        .QN(Barrel_Shifter_module_Output_Reg_n54) );
  DFFRXLTS Barrel_Shifter_module_Output_Reg_Q_reg_52_ ( .D(
        Barrel_Shifter_module_Output_Reg_n108), .CK(clk), .RN(
        Barrel_Shifter_module_Output_Reg_n110), .Q(Sgf_normalized_result[52]), 
        .QN(Barrel_Shifter_module_Output_Reg_n53) );
  DFFRXLTS Barrel_Shifter_module_Output_Reg_Q_reg_51_ ( .D(
        Barrel_Shifter_module_Output_Reg_n107), .CK(clk), .RN(
        Barrel_Shifter_module_Output_Reg_n110), .Q(Sgf_normalized_result[51]), 
        .QN(Barrel_Shifter_module_Output_Reg_n52) );
  DFFRXLTS Barrel_Shifter_module_Output_Reg_Q_reg_50_ ( .D(
        Barrel_Shifter_module_Output_Reg_n106), .CK(clk), .RN(
        Barrel_Shifter_module_Output_Reg_n110), .Q(Sgf_normalized_result[50]), 
        .QN(Barrel_Shifter_module_Output_Reg_n51) );
  DFFRXLTS Barrel_Shifter_module_Output_Reg_Q_reg_49_ ( .D(
        Barrel_Shifter_module_Output_Reg_n105), .CK(clk), .RN(
        Barrel_Shifter_module_Output_Reg_n110), .Q(Sgf_normalized_result[49]), 
        .QN(Barrel_Shifter_module_Output_Reg_n50) );
  DFFRXLTS Barrel_Shifter_module_Output_Reg_Q_reg_48_ ( .D(
        Barrel_Shifter_module_Output_Reg_n104), .CK(clk), .RN(
        Barrel_Shifter_module_Output_Reg_n110), .Q(Sgf_normalized_result[48]), 
        .QN(Barrel_Shifter_module_Output_Reg_n49) );
  DFFRXLTS Barrel_Shifter_module_Output_Reg_Q_reg_47_ ( .D(
        Barrel_Shifter_module_Output_Reg_n103), .CK(clk), .RN(
        Barrel_Shifter_module_Output_Reg_n110), .Q(Sgf_normalized_result[47]), 
        .QN(Barrel_Shifter_module_Output_Reg_n48) );
  DFFRXLTS Barrel_Shifter_module_Output_Reg_Q_reg_38_ ( .D(
        Barrel_Shifter_module_Output_Reg_n94), .CK(clk), .RN(
        Barrel_Shifter_module_Output_Reg_n110), .Q(Sgf_normalized_result[38]), 
        .QN(Barrel_Shifter_module_Output_Reg_n39) );
  DFFRXLTS Barrel_Shifter_module_Output_Reg_Q_reg_37_ ( .D(
        Barrel_Shifter_module_Output_Reg_n93), .CK(clk), .RN(
        Barrel_Shifter_module_Output_Reg_n110), .Q(Sgf_normalized_result[37]), 
        .QN(Barrel_Shifter_module_Output_Reg_n38) );
  DFFRXLTS Barrel_Shifter_module_Output_Reg_Q_reg_36_ ( .D(
        Barrel_Shifter_module_Output_Reg_n92), .CK(clk), .RN(
        Barrel_Shifter_module_Output_Reg_n110), .Q(Sgf_normalized_result[36]), 
        .QN(Barrel_Shifter_module_Output_Reg_n37) );
  DFFRXLTS Barrel_Shifter_module_Output_Reg_Q_reg_35_ ( .D(
        Barrel_Shifter_module_Output_Reg_n91), .CK(clk), .RN(
        Barrel_Shifter_module_Output_Reg_n110), .Q(Sgf_normalized_result[35]), 
        .QN(Barrel_Shifter_module_Output_Reg_n36) );
  DFFRXLTS Barrel_Shifter_module_Output_Reg_Q_reg_34_ ( .D(
        Barrel_Shifter_module_Output_Reg_n90), .CK(clk), .RN(
        Barrel_Shifter_module_Output_Reg_n110), .Q(Sgf_normalized_result[34]), 
        .QN(Barrel_Shifter_module_Output_Reg_n35) );
  DFFRXLTS Barrel_Shifter_module_Output_Reg_Q_reg_33_ ( .D(
        Barrel_Shifter_module_Output_Reg_n89), .CK(clk), .RN(
        Barrel_Shifter_module_Output_Reg_n110), .Q(Sgf_normalized_result[33]), 
        .QN(Barrel_Shifter_module_Output_Reg_n34) );
  DFFRX1TS Barrel_Shifter_module_Output_Reg_Q_reg_32_ ( .D(
        Barrel_Shifter_module_Output_Reg_n88), .CK(clk), .RN(n167), .Q(
        Sgf_normalized_result[32]), .QN(Barrel_Shifter_module_Output_Reg_n33)
         );
  DFFRX1TS Barrel_Shifter_module_Output_Reg_Q_reg_16_ ( .D(
        Barrel_Shifter_module_Output_Reg_n72), .CK(clk), .RN(n167), .Q(
        Sgf_normalized_result[16]), .QN(Barrel_Shifter_module_Output_Reg_n17)
         );
  DFFRX1TS Barrel_Shifter_module_Output_Reg_Q_reg_1_ ( .D(
        Barrel_Shifter_module_Output_Reg_n57), .CK(clk), .RN(n167), .Q(
        Sgf_normalized_result[1]), .QN(Rounding_Decoder_N37) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_0_ ( .D(n113), .CK(clk), 
        .RN(n167), .Q(Add_Subt_result[0]), .QN(Add_Subt_LZD[0]) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_1_ ( .D(n114), .CK(clk), 
        .RN(n167), .Q(Add_Subt_result[1]), .QN(Add_Subt_LZD[1]) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_2_ ( .D(n115), .CK(clk), 
        .RN(n167), .Q(Add_Subt_result[2]), .QN(Add_Subt_LZD[2]) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_3_ ( .D(n116), .CK(clk), 
        .RN(n167), .Q(Add_Subt_result[3]), .QN(Add_Subt_LZD[3]) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_4_ ( .D(n117), .CK(clk), 
        .RN(n167), .Q(Add_Subt_result[4]), .QN(Add_Subt_LZD[4]) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_5_ ( .D(n118), .CK(clk), 
        .RN(n167), .Q(Add_Subt_result[5]), .QN(Add_Subt_LZD[5]) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_6_ ( .D(n119), .CK(clk), 
        .RN(n167), .Q(Add_Subt_result[6]), .QN(Add_Subt_LZD[6]) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_7_ ( .D(n120), .CK(clk), 
        .RN(n167), .Q(Add_Subt_result[7]), .QN(Add_Subt_LZD[7]) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_8_ ( .D(n121), .CK(clk), 
        .RN(n167), .Q(Add_Subt_result[8]), .QN(Add_Subt_LZD[8]) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_9_ ( .D(n122), .CK(clk), 
        .RN(n167), .Q(Add_Subt_result[9]), .QN(Add_Subt_LZD[9]) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_10_ ( .D(n123), .CK(clk), 
        .RN(n167), .Q(Add_Subt_result[10]), .QN(Add_Subt_LZD[10]) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_11_ ( .D(n124), .CK(clk), 
        .RN(n167), .Q(Add_Subt_result[11]), .QN(Add_Subt_LZD[11]) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_12_ ( .D(n125), .CK(clk), 
        .RN(n167), .Q(Add_Subt_result[12]), .QN(Add_Subt_LZD[12]) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_13_ ( .D(n126), .CK(clk), 
        .RN(n167), .Q(Add_Subt_result[13]), .QN(Add_Subt_LZD[13]) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_14_ ( .D(n127), .CK(clk), 
        .RN(n167), .Q(Add_Subt_result[14]), .QN(Add_Subt_LZD[14]) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_15_ ( .D(n128), .CK(clk), 
        .RN(n167), .Q(Add_Subt_result[15]), .QN(Add_Subt_LZD[15]) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_16_ ( .D(n129), .CK(clk), 
        .RN(n167), .Q(Add_Subt_result[16]), .QN(Add_Subt_LZD[16]) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_17_ ( .D(n130), .CK(clk), 
        .RN(n167), .Q(Add_Subt_result[17]), .QN(Add_Subt_LZD[17]) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_18_ ( .D(n131), .CK(clk), 
        .RN(n167), .Q(Add_Subt_result[18]), .QN(Add_Subt_LZD[18]) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_19_ ( .D(n132), .CK(clk), 
        .RN(n167), .Q(Add_Subt_result[19]), .QN(Add_Subt_LZD[19]) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_20_ ( .D(n133), .CK(clk), 
        .RN(n167), .Q(Add_Subt_result[20]), .QN(Add_Subt_LZD[20]) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_21_ ( .D(n134), .CK(clk), 
        .RN(n167), .Q(Add_Subt_result[21]), .QN(Add_Subt_LZD[21]) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_22_ ( .D(n135), .CK(clk), 
        .RN(n167), .Q(Add_Subt_result[22]), .QN(Add_Subt_LZD[22]) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_23_ ( .D(n136), .CK(clk), 
        .RN(n167), .Q(Add_Subt_result[23]), .QN(Add_Subt_LZD[23]) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_24_ ( .D(n137), .CK(clk), 
        .RN(n167), .Q(Add_Subt_result[24]), .QN(Add_Subt_LZD[24]) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_25_ ( .D(n138), .CK(clk), 
        .RN(n167), .Q(Add_Subt_result[25]), .QN(Add_Subt_LZD[25]) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_26_ ( .D(n139), .CK(clk), 
        .RN(n167), .Q(Add_Subt_result[26]), .QN(Add_Subt_LZD[26]) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_27_ ( .D(n140), .CK(clk), 
        .RN(n167), .Q(Add_Subt_result[27]), .QN(Add_Subt_LZD[27]) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_28_ ( .D(n141), .CK(clk), 
        .RN(n167), .Q(Add_Subt_result[28]), .QN(Add_Subt_LZD[28]) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_29_ ( .D(n142), .CK(clk), 
        .RN(n167), .Q(Add_Subt_result[29]), .QN(Add_Subt_LZD[29]) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_30_ ( .D(n143), .CK(clk), 
        .RN(n167), .Q(Add_Subt_result[30]), .QN(Add_Subt_LZD[30]) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_31_ ( .D(n144), .CK(clk), 
        .RN(n167), .Q(Add_Subt_result[31]), .QN(Add_Subt_LZD[31]) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_32_ ( .D(n145), .CK(clk), 
        .RN(n167), .Q(Add_Subt_result[32]), .QN(Add_Subt_LZD[32]) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_33_ ( .D(n146), .CK(clk), 
        .RN(n167), .Q(Add_Subt_result[33]), .QN(Add_Subt_LZD[33]) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_34_ ( .D(n147), .CK(clk), 
        .RN(n167), .Q(Add_Subt_result[34]), .QN(Add_Subt_LZD[34]) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_35_ ( .D(n148), .CK(clk), 
        .RN(n167), .Q(Add_Subt_result[35]), .QN(Add_Subt_LZD[35]) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_36_ ( .D(n149), .CK(clk), 
        .RN(n167), .Q(Add_Subt_result[36]), .QN(Add_Subt_LZD[36]) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_37_ ( .D(n150), .CK(clk), 
        .RN(n167), .Q(Add_Subt_result[37]), .QN(Add_Subt_LZD[37]) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_38_ ( .D(n151), .CK(clk), 
        .RN(n167), .Q(Add_Subt_result[38]), .QN(Add_Subt_LZD[38]) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_39_ ( .D(n152), .CK(clk), 
        .RN(n167), .Q(Add_Subt_result[39]), .QN(Add_Subt_LZD[39]) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_40_ ( .D(n153), .CK(clk), 
        .RN(n167), .Q(Add_Subt_result[40]), .QN(Add_Subt_LZD[40]) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_41_ ( .D(n154), .CK(clk), 
        .RN(n167), .Q(Add_Subt_result[41]), .QN(Add_Subt_LZD[41]) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_42_ ( .D(n155), .CK(clk), 
        .RN(n167), .Q(Add_Subt_result[42]), .QN(Add_Subt_LZD[42]) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_43_ ( .D(n156), .CK(clk), 
        .RN(n167), .Q(Add_Subt_result[43]), .QN(Add_Subt_LZD[43]) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_44_ ( .D(n157), .CK(clk), 
        .RN(n167), .Q(Add_Subt_result[44]), .QN(Add_Subt_LZD[44]) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_45_ ( .D(n158), .CK(clk), 
        .RN(n167), .Q(Add_Subt_result[45]), .QN(Add_Subt_LZD[45]) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_46_ ( .D(n159), .CK(clk), 
        .RN(n167), .Q(Add_Subt_result[46]), .QN(Add_Subt_LZD[46]) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_47_ ( .D(n160), .CK(clk), 
        .RN(n167), .Q(Add_Subt_result[47]), .QN(Add_Subt_LZD[47]) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_48_ ( .D(n161), .CK(clk), 
        .RN(n167), .Q(Add_Subt_result[48]), .QN(Add_Subt_LZD[48]) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_49_ ( .D(n162), .CK(clk), 
        .RN(n167), .Q(Add_Subt_result[49]), .QN(Add_Subt_LZD[49]) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_50_ ( .D(n163), .CK(clk), 
        .RN(n167), .Q(Add_Subt_result[50]), .QN(Add_Subt_LZD[50]) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_51_ ( .D(n164), .CK(clk), 
        .RN(n167), .Q(Add_Subt_result[51]), .QN(Add_Subt_LZD[51]) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_52_ ( .D(n165), .CK(clk), 
        .RN(n167), .Q(Add_Subt_result[52]), .QN(Add_Subt_LZD[52]) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_53_ ( .D(n166), .CK(clk), 
        .RN(n167), .Q(Add_Subt_result[53]), .QN(Add_Subt_LZD[53]) );
  DFFRX1TS Add_Subt_Sgf_module_Add_overflow_Result_Q_reg_0_ ( .D(n175), .CK(
        clk), .RN(n167), .Q(add_overflow_flag), .QN(n174) );
  DFFRX1TS Add_Subt_Sgf_module_Add_Subt_Result_Q_reg_54_ ( .D(n168), .CK(clk), 
        .RN(n167), .Q(Add_Subt_result[54]), .QN(Add_Subt_LZD[54]) );
  NAND2X8TS U3 ( .A(n171), .B(n1), .Y(n173) );
  INVX12TS U4 ( .A(selector_D), .Y(n1) );
  NAND2X8TS U5 ( .A(n170), .B(n2), .Y(S_A_S_Oper_B[2]) );
  INVX12TS U6 ( .A(Sgf_normalized_result[2]), .Y(n2) );
  NAND2X8TS U7 ( .A(FSM_selector_D), .B(n3), .Y(S_A_S_Oper_A[54]) );
  NAND2X8TS U8 ( .A(real_op), .B(Add_Sub_Sgf_op_mux_n1), .Y(n4) );
  INVX12TS U9 ( .A(n4), .Y(S_A_S_op) );
  NAND2X8TS U10 ( .A(Sgf_normalized_result[0]), .B(n170), .Y(n5) );
  INVX12TS U11 ( .A(n5), .Y(S_A_S_Oper_B[0]) );
  NAND2X8TS U12 ( .A(Sgf_normalized_result[1]), .B(n170), .Y(n6) );
  INVX12TS U13 ( .A(n6), .Y(S_A_S_Oper_B[1]) );
  NAND2X8TS U14 ( .A(Sgf_normalized_result[3]), .B(n170), .Y(n7) );
  INVX12TS U15 ( .A(n7), .Y(S_A_S_Oper_B[3]) );
  NAND2X8TS U16 ( .A(Sgf_normalized_result[4]), .B(n170), .Y(n8) );
  INVX12TS U17 ( .A(n8), .Y(S_A_S_Oper_B[4]) );
  NAND2X8TS U18 ( .A(Sgf_normalized_result[5]), .B(n170), .Y(n9) );
  INVX12TS U19 ( .A(n9), .Y(S_A_S_Oper_B[5]) );
  NAND2X8TS U20 ( .A(Sgf_normalized_result[6]), .B(n170), .Y(n10) );
  INVX12TS U21 ( .A(n10), .Y(S_A_S_Oper_B[6]) );
  NAND2X8TS U22 ( .A(Sgf_normalized_result[7]), .B(n170), .Y(n11) );
  INVX12TS U23 ( .A(n11), .Y(S_A_S_Oper_B[7]) );
  NAND2X8TS U24 ( .A(Sgf_normalized_result[8]), .B(n170), .Y(n12) );
  INVX12TS U25 ( .A(n12), .Y(S_A_S_Oper_B[8]) );
  NAND2X8TS U26 ( .A(Sgf_normalized_result[9]), .B(n170), .Y(n13) );
  INVX12TS U27 ( .A(n13), .Y(S_A_S_Oper_B[9]) );
  NAND2X8TS U28 ( .A(Sgf_normalized_result[10]), .B(n170), .Y(n14) );
  INVX12TS U29 ( .A(n14), .Y(S_A_S_Oper_B[10]) );
  NAND2X8TS U30 ( .A(Sgf_normalized_result[11]), .B(n170), .Y(n15) );
  INVX12TS U31 ( .A(n15), .Y(S_A_S_Oper_B[11]) );
  NAND2X8TS U32 ( .A(Sgf_normalized_result[12]), .B(n170), .Y(n16) );
  INVX12TS U33 ( .A(n16), .Y(S_A_S_Oper_B[12]) );
  NAND2X8TS U34 ( .A(Sgf_normalized_result[13]), .B(n170), .Y(n17) );
  INVX12TS U35 ( .A(n17), .Y(S_A_S_Oper_B[13]) );
  NAND2X8TS U36 ( .A(Sgf_normalized_result[14]), .B(n170), .Y(n18) );
  INVX12TS U37 ( .A(n18), .Y(S_A_S_Oper_B[14]) );
  NAND2X8TS U38 ( .A(Sgf_normalized_result[15]), .B(n170), .Y(n19) );
  INVX12TS U39 ( .A(n19), .Y(S_A_S_Oper_B[15]) );
  NAND2X8TS U40 ( .A(Sgf_normalized_result[16]), .B(n170), .Y(n20) );
  INVX12TS U41 ( .A(n20), .Y(S_A_S_Oper_B[16]) );
  NAND2X8TS U42 ( .A(Sgf_normalized_result[17]), .B(n170), .Y(n21) );
  INVX12TS U43 ( .A(n21), .Y(S_A_S_Oper_B[17]) );
  NAND2X8TS U44 ( .A(Sgf_normalized_result[18]), .B(n170), .Y(n22) );
  INVX12TS U45 ( .A(n22), .Y(S_A_S_Oper_B[18]) );
  NAND2X8TS U46 ( .A(Sgf_normalized_result[19]), .B(n170), .Y(n23) );
  INVX12TS U47 ( .A(n23), .Y(S_A_S_Oper_B[19]) );
  NAND2X8TS U48 ( .A(Sgf_normalized_result[20]), .B(n170), .Y(n24) );
  INVX12TS U49 ( .A(n24), .Y(S_A_S_Oper_B[20]) );
  NAND2X8TS U50 ( .A(Sgf_normalized_result[21]), .B(n170), .Y(n25) );
  INVX12TS U51 ( .A(n25), .Y(S_A_S_Oper_B[21]) );
  NAND2X8TS U52 ( .A(Sgf_normalized_result[22]), .B(n170), .Y(n26) );
  INVX12TS U53 ( .A(n26), .Y(S_A_S_Oper_B[22]) );
  NAND2X8TS U54 ( .A(Sgf_normalized_result[23]), .B(n170), .Y(n27) );
  INVX12TS U55 ( .A(n27), .Y(S_A_S_Oper_B[23]) );
  NAND2X8TS U56 ( .A(Sgf_normalized_result[24]), .B(n170), .Y(n28) );
  INVX12TS U57 ( .A(n28), .Y(S_A_S_Oper_B[24]) );
  NAND2X8TS U58 ( .A(Sgf_normalized_result[25]), .B(n170), .Y(n29) );
  INVX12TS U59 ( .A(n29), .Y(S_A_S_Oper_B[25]) );
  NAND2X8TS U60 ( .A(Sgf_normalized_result[26]), .B(n170), .Y(n30) );
  INVX12TS U61 ( .A(n30), .Y(S_A_S_Oper_B[26]) );
  NAND2X8TS U62 ( .A(Sgf_normalized_result[27]), .B(n170), .Y(n31) );
  INVX12TS U63 ( .A(n31), .Y(S_A_S_Oper_B[27]) );
  NAND2X8TS U64 ( .A(Sgf_normalized_result[28]), .B(n170), .Y(n32) );
  INVX12TS U65 ( .A(n32), .Y(S_A_S_Oper_B[28]) );
  NAND2X8TS U66 ( .A(Sgf_normalized_result[29]), .B(n170), .Y(n33) );
  INVX12TS U67 ( .A(n33), .Y(S_A_S_Oper_B[29]) );
  NAND2X8TS U68 ( .A(Sgf_normalized_result[30]), .B(n170), .Y(n34) );
  INVX12TS U69 ( .A(n34), .Y(S_A_S_Oper_B[30]) );
  NAND2X8TS U70 ( .A(Sgf_normalized_result[31]), .B(n170), .Y(n35) );
  INVX12TS U71 ( .A(n35), .Y(S_A_S_Oper_B[31]) );
  NAND2X8TS U72 ( .A(Sgf_normalized_result[32]), .B(n170), .Y(n36) );
  INVX12TS U73 ( .A(n36), .Y(S_A_S_Oper_B[32]) );
  NAND2X8TS U74 ( .A(Sgf_normalized_result[33]), .B(n170), .Y(n37) );
  INVX12TS U75 ( .A(n37), .Y(S_A_S_Oper_B[33]) );
  NAND2X8TS U76 ( .A(Sgf_normalized_result[34]), .B(n170), .Y(n38) );
  INVX12TS U77 ( .A(n38), .Y(S_A_S_Oper_B[34]) );
  NAND2X8TS U78 ( .A(Sgf_normalized_result[35]), .B(n170), .Y(n39) );
  INVX12TS U79 ( .A(n39), .Y(S_A_S_Oper_B[35]) );
  NAND2X8TS U80 ( .A(Sgf_normalized_result[36]), .B(n170), .Y(n40) );
  INVX12TS U81 ( .A(n40), .Y(S_A_S_Oper_B[36]) );
  NAND2X8TS U82 ( .A(Sgf_normalized_result[37]), .B(n170), .Y(n41) );
  INVX12TS U83 ( .A(n41), .Y(S_A_S_Oper_B[37]) );
  NAND2X8TS U84 ( .A(Sgf_normalized_result[38]), .B(n170), .Y(n42) );
  INVX12TS U85 ( .A(n42), .Y(S_A_S_Oper_B[38]) );
  NAND2X8TS U86 ( .A(Sgf_normalized_result[39]), .B(n170), .Y(n43) );
  INVX12TS U87 ( .A(n43), .Y(S_A_S_Oper_B[39]) );
  NAND2X8TS U88 ( .A(Sgf_normalized_result[40]), .B(n170), .Y(n44) );
  INVX12TS U89 ( .A(n44), .Y(S_A_S_Oper_B[40]) );
  NAND2X8TS U90 ( .A(Sgf_normalized_result[41]), .B(n170), .Y(n45) );
  INVX12TS U91 ( .A(n45), .Y(S_A_S_Oper_B[41]) );
  NAND2X8TS U92 ( .A(Sgf_normalized_result[42]), .B(n170), .Y(n46) );
  INVX12TS U93 ( .A(n46), .Y(S_A_S_Oper_B[42]) );
  NAND2X8TS U94 ( .A(Sgf_normalized_result[43]), .B(n170), .Y(n47) );
  INVX12TS U95 ( .A(n47), .Y(S_A_S_Oper_B[43]) );
  NAND2X8TS U96 ( .A(Sgf_normalized_result[44]), .B(n170), .Y(n48) );
  INVX12TS U97 ( .A(n48), .Y(S_A_S_Oper_B[44]) );
  NAND2X8TS U98 ( .A(Sgf_normalized_result[45]), .B(n170), .Y(n49) );
  INVX12TS U99 ( .A(n49), .Y(S_A_S_Oper_B[45]) );
  NAND2X8TS U100 ( .A(Sgf_normalized_result[46]), .B(n170), .Y(n50) );
  INVX12TS U101 ( .A(n50), .Y(S_A_S_Oper_B[46]) );
  NAND2X8TS U102 ( .A(Sgf_normalized_result[47]), .B(n170), .Y(n51) );
  INVX12TS U103 ( .A(n51), .Y(S_A_S_Oper_B[47]) );
  NAND2X8TS U104 ( .A(Sgf_normalized_result[48]), .B(n170), .Y(n52) );
  INVX12TS U105 ( .A(n52), .Y(S_A_S_Oper_B[48]) );
  NAND2X8TS U106 ( .A(Sgf_normalized_result[49]), .B(n170), .Y(n53) );
  INVX12TS U107 ( .A(n53), .Y(S_A_S_Oper_B[49]) );
  NAND2X8TS U108 ( .A(Sgf_normalized_result[50]), .B(n170), .Y(n54) );
  INVX12TS U109 ( .A(n54), .Y(S_A_S_Oper_B[50]) );
  NAND2X8TS U110 ( .A(Sgf_normalized_result[51]), .B(n170), .Y(n55) );
  INVX12TS U111 ( .A(n55), .Y(S_A_S_Oper_B[51]) );
  NAND2X8TS U112 ( .A(Sgf_normalized_result[52]), .B(n170), .Y(n56) );
  INVX12TS U113 ( .A(n56), .Y(S_A_S_Oper_B[52]) );
  NAND2X8TS U114 ( .A(Sgf_normalized_result[53]), .B(n170), .Y(n57) );
  INVX12TS U115 ( .A(n57), .Y(S_A_S_Oper_B[53]) );
  NAND2X8TS U116 ( .A(Sgf_normalized_result[54]), .B(n170), .Y(n58) );
  INVX12TS U117 ( .A(n58), .Y(S_A_S_Oper_B[54]) );
  NAND2X8TS U118 ( .A(Sgf_normalized_result[0]), .B(FSM_selector_D), .Y(n59)
         );
  INVX12TS U119 ( .A(n59), .Y(S_A_S_Oper_A[0]) );
  NAND2X8TS U120 ( .A(Sgf_normalized_result[1]), .B(FSM_selector_D), .Y(n60)
         );
  INVX12TS U121 ( .A(n60), .Y(S_A_S_Oper_A[1]) );
  NAND2X8TS U122 ( .A(Sgf_normalized_result[2]), .B(
        final_result_ieee_Module_Sgf_Mux_n1), .Y(n61) );
  INVX12TS U123 ( .A(n61), .Y(final_result_ieee_Module_Sgf_S_mux[0]) );
  NAND2X8TS U124 ( .A(Sgf_normalized_result[3]), .B(
        final_result_ieee_Module_Sgf_Mux_n1), .Y(n62) );
  INVX12TS U125 ( .A(n62), .Y(final_result_ieee_Module_Sgf_S_mux[1]) );
  NAND2X8TS U126 ( .A(Sgf_normalized_result[4]), .B(
        final_result_ieee_Module_Sgf_Mux_n1), .Y(n63) );
  INVX12TS U127 ( .A(n63), .Y(final_result_ieee_Module_Sgf_S_mux[2]) );
  NAND2X8TS U128 ( .A(Sgf_normalized_result[5]), .B(
        final_result_ieee_Module_Sgf_Mux_n1), .Y(n64) );
  INVX12TS U129 ( .A(n64), .Y(final_result_ieee_Module_Sgf_S_mux[3]) );
  NAND2X8TS U130 ( .A(Sgf_normalized_result[6]), .B(
        final_result_ieee_Module_Sgf_Mux_n1), .Y(n65) );
  INVX12TS U131 ( .A(n65), .Y(final_result_ieee_Module_Sgf_S_mux[4]) );
  NAND2X8TS U132 ( .A(Sgf_normalized_result[7]), .B(
        final_result_ieee_Module_Sgf_Mux_n1), .Y(n66) );
  INVX12TS U133 ( .A(n66), .Y(final_result_ieee_Module_Sgf_S_mux[5]) );
  NAND2X8TS U134 ( .A(Sgf_normalized_result[8]), .B(
        final_result_ieee_Module_Sgf_Mux_n1), .Y(n67) );
  INVX12TS U135 ( .A(n67), .Y(final_result_ieee_Module_Sgf_S_mux[6]) );
  NAND2X8TS U136 ( .A(Sgf_normalized_result[9]), .B(
        final_result_ieee_Module_Sgf_Mux_n1), .Y(n68) );
  INVX12TS U137 ( .A(n68), .Y(final_result_ieee_Module_Sgf_S_mux[7]) );
  NAND2X8TS U138 ( .A(Sgf_normalized_result[10]), .B(
        final_result_ieee_Module_Sgf_Mux_n1), .Y(n69) );
  INVX12TS U139 ( .A(n69), .Y(final_result_ieee_Module_Sgf_S_mux[8]) );
  NAND2X8TS U140 ( .A(Sgf_normalized_result[11]), .B(
        final_result_ieee_Module_Sgf_Mux_n1), .Y(n70) );
  INVX12TS U141 ( .A(n70), .Y(final_result_ieee_Module_Sgf_S_mux[9]) );
  NAND2X8TS U142 ( .A(Sgf_normalized_result[12]), .B(
        final_result_ieee_Module_Sgf_Mux_n1), .Y(n71) );
  INVX12TS U143 ( .A(n71), .Y(final_result_ieee_Module_Sgf_S_mux[10]) );
  NAND2X8TS U144 ( .A(Sgf_normalized_result[13]), .B(
        final_result_ieee_Module_Sgf_Mux_n1), .Y(n72) );
  INVX12TS U145 ( .A(n72), .Y(final_result_ieee_Module_Sgf_S_mux[11]) );
  NAND2X8TS U146 ( .A(Sgf_normalized_result[14]), .B(
        final_result_ieee_Module_Sgf_Mux_n1), .Y(n73) );
  INVX12TS U147 ( .A(n73), .Y(final_result_ieee_Module_Sgf_S_mux[12]) );
  NAND2X8TS U148 ( .A(Sgf_normalized_result[15]), .B(
        final_result_ieee_Module_Sgf_Mux_n1), .Y(n74) );
  INVX12TS U149 ( .A(n74), .Y(final_result_ieee_Module_Sgf_S_mux[13]) );
  NAND2X8TS U150 ( .A(Sgf_normalized_result[16]), .B(
        final_result_ieee_Module_Sgf_Mux_n1), .Y(n75) );
  INVX12TS U151 ( .A(n75), .Y(final_result_ieee_Module_Sgf_S_mux[14]) );
  NAND2X8TS U152 ( .A(Sgf_normalized_result[17]), .B(
        final_result_ieee_Module_Sgf_Mux_n1), .Y(n76) );
  INVX12TS U153 ( .A(n76), .Y(final_result_ieee_Module_Sgf_S_mux[15]) );
  NAND2X8TS U154 ( .A(Sgf_normalized_result[18]), .B(
        final_result_ieee_Module_Sgf_Mux_n1), .Y(n77) );
  INVX12TS U155 ( .A(n77), .Y(final_result_ieee_Module_Sgf_S_mux[16]) );
  NAND2X8TS U156 ( .A(Sgf_normalized_result[19]), .B(
        final_result_ieee_Module_Sgf_Mux_n1), .Y(n78) );
  INVX12TS U157 ( .A(n78), .Y(final_result_ieee_Module_Sgf_S_mux[17]) );
  NAND2X8TS U158 ( .A(Sgf_normalized_result[20]), .B(
        final_result_ieee_Module_Sgf_Mux_n1), .Y(n79) );
  INVX12TS U159 ( .A(n79), .Y(final_result_ieee_Module_Sgf_S_mux[18]) );
  NAND2X8TS U160 ( .A(Sgf_normalized_result[21]), .B(
        final_result_ieee_Module_Sgf_Mux_n1), .Y(n80) );
  INVX12TS U161 ( .A(n80), .Y(final_result_ieee_Module_Sgf_S_mux[19]) );
  NAND2X8TS U162 ( .A(Sgf_normalized_result[22]), .B(
        final_result_ieee_Module_Sgf_Mux_n1), .Y(n81) );
  INVX12TS U163 ( .A(n81), .Y(final_result_ieee_Module_Sgf_S_mux[20]) );
  NAND2X8TS U164 ( .A(Sgf_normalized_result[23]), .B(
        final_result_ieee_Module_Sgf_Mux_n1), .Y(n82) );
  INVX12TS U165 ( .A(n82), .Y(final_result_ieee_Module_Sgf_S_mux[21]) );
  NAND2X8TS U166 ( .A(Sgf_normalized_result[24]), .B(
        final_result_ieee_Module_Sgf_Mux_n1), .Y(n83) );
  INVX12TS U167 ( .A(n83), .Y(final_result_ieee_Module_Sgf_S_mux[22]) );
  NAND2X8TS U168 ( .A(Sgf_normalized_result[25]), .B(
        final_result_ieee_Module_Sgf_Mux_n1), .Y(n84) );
  INVX12TS U169 ( .A(n84), .Y(final_result_ieee_Module_Sgf_S_mux[23]) );
  NAND2X8TS U170 ( .A(Sgf_normalized_result[26]), .B(
        final_result_ieee_Module_Sgf_Mux_n1), .Y(n85) );
  INVX12TS U171 ( .A(n85), .Y(final_result_ieee_Module_Sgf_S_mux[24]) );
  NAND2X8TS U172 ( .A(Sgf_normalized_result[27]), .B(
        final_result_ieee_Module_Sgf_Mux_n1), .Y(n86) );
  INVX12TS U173 ( .A(n86), .Y(final_result_ieee_Module_Sgf_S_mux[25]) );
  NAND2X8TS U174 ( .A(Sgf_normalized_result[28]), .B(
        final_result_ieee_Module_Sgf_Mux_n1), .Y(n87) );
  INVX12TS U175 ( .A(n87), .Y(final_result_ieee_Module_Sgf_S_mux[26]) );
  NAND2X8TS U176 ( .A(Sgf_normalized_result[29]), .B(
        final_result_ieee_Module_Sgf_Mux_n1), .Y(n88) );
  INVX12TS U177 ( .A(n88), .Y(final_result_ieee_Module_Sgf_S_mux[27]) );
  NAND2X8TS U178 ( .A(Sgf_normalized_result[30]), .B(
        final_result_ieee_Module_Sgf_Mux_n1), .Y(n89) );
  INVX12TS U179 ( .A(n89), .Y(final_result_ieee_Module_Sgf_S_mux[28]) );
  NAND2X8TS U180 ( .A(Sgf_normalized_result[31]), .B(
        final_result_ieee_Module_Sgf_Mux_n1), .Y(n90) );
  INVX12TS U181 ( .A(n90), .Y(final_result_ieee_Module_Sgf_S_mux[29]) );
  NAND2X8TS U182 ( .A(Sgf_normalized_result[32]), .B(
        final_result_ieee_Module_Sgf_Mux_n1), .Y(n91) );
  INVX12TS U183 ( .A(n91), .Y(final_result_ieee_Module_Sgf_S_mux[30]) );
  NAND2X8TS U184 ( .A(Sgf_normalized_result[33]), .B(
        final_result_ieee_Module_Sgf_Mux_n1), .Y(n92) );
  INVX12TS U185 ( .A(n92), .Y(final_result_ieee_Module_Sgf_S_mux[31]) );
  NAND2X8TS U186 ( .A(Sgf_normalized_result[34]), .B(
        final_result_ieee_Module_Sgf_Mux_n1), .Y(n93) );
  INVX12TS U187 ( .A(n93), .Y(final_result_ieee_Module_Sgf_S_mux[32]) );
  NAND2X8TS U188 ( .A(Sgf_normalized_result[35]), .B(
        final_result_ieee_Module_Sgf_Mux_n1), .Y(n94) );
  INVX12TS U189 ( .A(n94), .Y(final_result_ieee_Module_Sgf_S_mux[33]) );
  NAND2X8TS U190 ( .A(Sgf_normalized_result[36]), .B(
        final_result_ieee_Module_Sgf_Mux_n1), .Y(n95) );
  INVX12TS U191 ( .A(n95), .Y(final_result_ieee_Module_Sgf_S_mux[34]) );
  NAND2X8TS U192 ( .A(Sgf_normalized_result[37]), .B(
        final_result_ieee_Module_Sgf_Mux_n1), .Y(n96) );
  INVX12TS U193 ( .A(n96), .Y(final_result_ieee_Module_Sgf_S_mux[35]) );
  NAND2X8TS U194 ( .A(Sgf_normalized_result[38]), .B(
        final_result_ieee_Module_Sgf_Mux_n1), .Y(n97) );
  INVX12TS U195 ( .A(n97), .Y(final_result_ieee_Module_Sgf_S_mux[36]) );
  NAND2X8TS U196 ( .A(Sgf_normalized_result[39]), .B(
        final_result_ieee_Module_Sgf_Mux_n1), .Y(n98) );
  INVX12TS U197 ( .A(n98), .Y(final_result_ieee_Module_Sgf_S_mux[37]) );
  NAND2X8TS U198 ( .A(Sgf_normalized_result[40]), .B(
        final_result_ieee_Module_Sgf_Mux_n1), .Y(n99) );
  INVX12TS U199 ( .A(n99), .Y(final_result_ieee_Module_Sgf_S_mux[38]) );
  NAND2X8TS U200 ( .A(Sgf_normalized_result[41]), .B(
        final_result_ieee_Module_Sgf_Mux_n1), .Y(n100) );
  INVX12TS U201 ( .A(n100), .Y(final_result_ieee_Module_Sgf_S_mux[39]) );
  NAND2X8TS U202 ( .A(Sgf_normalized_result[42]), .B(
        final_result_ieee_Module_Sgf_Mux_n1), .Y(n101) );
  INVX12TS U203 ( .A(n101), .Y(final_result_ieee_Module_Sgf_S_mux[40]) );
  NAND2X8TS U204 ( .A(Sgf_normalized_result[43]), .B(
        final_result_ieee_Module_Sgf_Mux_n1), .Y(n102) );
  INVX12TS U205 ( .A(n102), .Y(final_result_ieee_Module_Sgf_S_mux[41]) );
  NAND2X8TS U206 ( .A(Sgf_normalized_result[44]), .B(
        final_result_ieee_Module_Sgf_Mux_n1), .Y(n103) );
  INVX12TS U207 ( .A(n103), .Y(final_result_ieee_Module_Sgf_S_mux[42]) );
  NAND2X8TS U208 ( .A(Sgf_normalized_result[45]), .B(
        final_result_ieee_Module_Sgf_Mux_n1), .Y(n104) );
  INVX12TS U209 ( .A(n104), .Y(final_result_ieee_Module_Sgf_S_mux[43]) );
  NAND2X8TS U210 ( .A(Sgf_normalized_result[46]), .B(
        final_result_ieee_Module_Sgf_Mux_n1), .Y(n105) );
  INVX12TS U211 ( .A(n105), .Y(final_result_ieee_Module_Sgf_S_mux[44]) );
  NAND2X8TS U212 ( .A(Sgf_normalized_result[47]), .B(
        final_result_ieee_Module_Sgf_Mux_n1), .Y(n106) );
  INVX12TS U213 ( .A(n106), .Y(final_result_ieee_Module_Sgf_S_mux[45]) );
  NAND2X8TS U214 ( .A(Sgf_normalized_result[48]), .B(
        final_result_ieee_Module_Sgf_Mux_n1), .Y(n107) );
  INVX12TS U215 ( .A(n107), .Y(final_result_ieee_Module_Sgf_S_mux[46]) );
  NAND2X8TS U216 ( .A(Sgf_normalized_result[49]), .B(
        final_result_ieee_Module_Sgf_Mux_n1), .Y(n108) );
  INVX12TS U217 ( .A(n108), .Y(final_result_ieee_Module_Sgf_S_mux[47]) );
  NAND2X8TS U218 ( .A(Sgf_normalized_result[50]), .B(
        final_result_ieee_Module_Sgf_Mux_n1), .Y(n109) );
  INVX12TS U219 ( .A(n109), .Y(final_result_ieee_Module_Sgf_S_mux[48]) );
  NAND2X8TS U220 ( .A(Sgf_normalized_result[51]), .B(
        final_result_ieee_Module_Sgf_Mux_n1), .Y(n110) );
  INVX12TS U221 ( .A(n110), .Y(final_result_ieee_Module_Sgf_S_mux[49]) );
  NAND2X8TS U222 ( .A(Sgf_normalized_result[52]), .B(
        final_result_ieee_Module_Sgf_Mux_n1), .Y(n111) );
  INVX12TS U223 ( .A(n111), .Y(final_result_ieee_Module_Sgf_S_mux[50]) );
  NAND2X8TS U224 ( .A(Sgf_normalized_result[53]), .B(
        final_result_ieee_Module_Sgf_Mux_n1), .Y(n112) );
  INVX12TS U225 ( .A(n112), .Y(final_result_ieee_Module_Sgf_S_mux[51]) );
endmodule

