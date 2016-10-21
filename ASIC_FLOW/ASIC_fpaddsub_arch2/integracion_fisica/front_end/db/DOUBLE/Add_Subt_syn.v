/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : L-2016.03-SP3
// Date      : Wed Oct 19 14:30:45 2016
/////////////////////////////////////////////////////////////


module add_sub_carry_out_W26_DW01_add_1 ( A, B, CI, SUM, CO );
  input [26:0] A;
  input [26:0] B;
  output [26:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n12, n13, n14, n15, n16, n17,
         n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31,
         n32, n33, n34, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46,
         n47, n48, n49, n50, n51, n54, n55, n57, n58, n59, n60, n61, n62, n63,
         n64, n66, n67, n68, n69, n70, n174, n175, n176, n177, n178;

  AFHCONX2TS U4 ( .A(B[23]), .B(A[23]), .CI(n14), .CON(n13), .S(SUM[23]) );
  AFHCONX2TS U6 ( .A(B[21]), .B(A[21]), .CI(n16), .CON(n15), .S(SUM[21]) );
  AFHCONX2TS U8 ( .A(B[19]), .B(A[19]), .CI(n18), .CON(n17), .S(SUM[19]) );
  AFHCONX2TS U10 ( .A(B[17]), .B(A[17]), .CI(n20), .CON(n19), .S(SUM[17]) );
  AFHCONX2TS U12 ( .A(B[15]), .B(A[15]), .CI(n22), .CON(n21), .S(SUM[15]) );
  AFHCONX2TS U14 ( .A(B[13]), .B(A[13]), .CI(n24), .CON(n23), .S(SUM[13]) );
  AFHCONX2TS U16 ( .A(B[11]), .B(A[11]), .CI(n26), .CON(n25), .S(SUM[11]) );
  NOR2X1TS U95 ( .A(A[4]), .B(B[4]), .Y(n54) );
  NOR2X1TS U96 ( .A(A[2]), .B(B[2]), .Y(n63) );
  NOR2X1TS U97 ( .A(A[3]), .B(B[3]), .Y(n60) );
  NOR2X1TS U98 ( .A(A[5]), .B(B[5]), .Y(n49) );
  NAND2X1TS U99 ( .A(A[4]), .B(B[4]), .Y(n55) );
  NOR2X1TS U100 ( .A(A[1]), .B(B[1]), .Y(n67) );
  NAND2X1TS U101 ( .A(A[2]), .B(B[2]), .Y(n64) );
  NAND2X1TS U102 ( .A(A[1]), .B(B[1]), .Y(n68) );
  AOI21X1TS U103 ( .A0(n177), .A1(n47), .B0(n48), .Y(n46) );
  INVX2TS U104 ( .A(n57), .Y(n177) );
  INVX2TS U105 ( .A(n36), .Y(n174) );
  INVX2TS U106 ( .A(n66), .Y(n178) );
  AOI21X1TS U107 ( .A0(n58), .A1(n66), .B0(n59), .Y(n57) );
  NOR2X1TS U108 ( .A(n63), .B(n60), .Y(n58) );
  OAI21X1TS U109 ( .A0(n60), .A1(n64), .B0(n61), .Y(n59) );
  OAI21X1TS U110 ( .A0(n67), .A1(n70), .B0(n68), .Y(n66) );
  OAI21X1TS U111 ( .A0(n57), .A1(n37), .B0(n38), .Y(n36) );
  NAND2X1TS U112 ( .A(n47), .B(n39), .Y(n37) );
  AOI21X1TS U113 ( .A0(n39), .A1(n48), .B0(n40), .Y(n38) );
  NOR2X1TS U114 ( .A(n44), .B(n41), .Y(n39) );
  OAI21X1TS U115 ( .A0(n49), .A1(n55), .B0(n50), .Y(n48) );
  NOR2X1TS U116 ( .A(n54), .B(n49), .Y(n47) );
  OAI21X1TS U117 ( .A0(n41), .A1(n45), .B0(n42), .Y(n40) );
  OAI21X1TS U118 ( .A0(n174), .A1(n33), .B0(n34), .Y(n32) );
  AOI21X1TS U119 ( .A0(n177), .A1(n175), .B0(n176), .Y(n51) );
  INVX2TS U120 ( .A(n55), .Y(n176) );
  OAI21X1TS U121 ( .A0(n178), .A1(n63), .B0(n64), .Y(n62) );
  OAI21X1TS U122 ( .A0(n46), .A1(n44), .B0(n45), .Y(n43) );
  NAND2BX1TS U123 ( .AN(n67), .B(n68), .Y(n9) );
  NAND2BX1TS U124 ( .AN(n49), .B(n50), .Y(n5) );
  NAND2BX1TS U125 ( .AN(n63), .B(n64), .Y(n8) );
  NAND2BX1TS U126 ( .AN(n44), .B(n45), .Y(n4) );
  NAND2BX1TS U127 ( .AN(n33), .B(n34), .Y(n2) );
  NAND2BX1TS U128 ( .AN(n60), .B(n61), .Y(n7) );
  NAND2BX1TS U129 ( .AN(n41), .B(n42), .Y(n3) );
  NAND2BX1TS U130 ( .AN(n30), .B(n31), .Y(n1) );
  NAND2X1TS U131 ( .A(n175), .B(n55), .Y(n6) );
  INVX2TS U132 ( .A(n54), .Y(n175) );
  AFHCINX2TS U133 ( .CIN(n27), .B(A[10]), .A(B[10]), .S(SUM[10]), .CO(n26) );
  AOI21X1TS U134 ( .A0(n36), .A1(n28), .B0(n29), .Y(n27) );
  NOR2X1TS U135 ( .A(n33), .B(n30), .Y(n28) );
  OAI21X1TS U136 ( .A0(n30), .A1(n34), .B0(n31), .Y(n29) );
  AFHCINX2TS U137 ( .CIN(n25), .B(A[12]), .A(B[12]), .S(SUM[12]), .CO(n24) );
  AFHCINX2TS U138 ( .CIN(n23), .B(A[14]), .A(B[14]), .S(SUM[14]), .CO(n22) );
  AFHCINX2TS U139 ( .CIN(n21), .B(A[16]), .A(B[16]), .S(SUM[16]), .CO(n20) );
  AFHCINX2TS U140 ( .CIN(n19), .B(A[18]), .A(B[18]), .S(SUM[18]), .CO(n18) );
  AFHCINX2TS U141 ( .CIN(n17), .B(A[20]), .A(B[20]), .S(SUM[20]), .CO(n16) );
  AFHCINX2TS U142 ( .CIN(n15), .B(A[22]), .A(B[22]), .S(SUM[22]), .CO(n14) );
  AFHCINX2TS U143 ( .CIN(n13), .B(A[24]), .A(B[24]), .S(SUM[24]), .CO(n12) );
  NOR2X1TS U144 ( .A(A[6]), .B(B[6]), .Y(n44) );
  NOR2X1TS U145 ( .A(A[8]), .B(B[8]), .Y(n33) );
  NOR2X1TS U146 ( .A(A[7]), .B(B[7]), .Y(n41) );
  NOR2X1TS U147 ( .A(A[9]), .B(B[9]), .Y(n30) );
  NAND2X1TS U148 ( .A(A[0]), .B(B[0]), .Y(n70) );
  NAND2X1TS U149 ( .A(A[6]), .B(B[6]), .Y(n45) );
  NAND2X1TS U150 ( .A(A[8]), .B(B[8]), .Y(n34) );
  NAND2X1TS U151 ( .A(A[3]), .B(B[3]), .Y(n61) );
  NAND2X1TS U152 ( .A(A[5]), .B(B[5]), .Y(n50) );
  NAND2X1TS U153 ( .A(A[7]), .B(B[7]), .Y(n42) );
  NAND2X1TS U154 ( .A(A[9]), .B(B[9]), .Y(n31) );
  CMPR32X2TS U155 ( .A(A[25]), .B(B[25]), .C(n12), .CO(SUM[26]), .S(SUM[25])
         );
  XOR2X1TS U156 ( .A(n46), .B(n4), .Y(SUM[6]) );
  XOR2X1TS U157 ( .A(n174), .B(n2), .Y(SUM[8]) );
  XNOR2X1TS U158 ( .A(n32), .B(n1), .Y(SUM[9]) );
  XNOR2X1TS U159 ( .A(n43), .B(n3), .Y(SUM[7]) );
  XNOR2X1TS U160 ( .A(n177), .B(n6), .Y(SUM[4]) );
  INVX2TS U161 ( .A(n10), .Y(SUM[0]) );
  XOR2X1TS U162 ( .A(n9), .B(n70), .Y(SUM[1]) );
  XOR2X1TS U163 ( .A(n178), .B(n8), .Y(SUM[2]) );
  XOR2X1TS U164 ( .A(n51), .B(n5), .Y(SUM[5]) );
  XNOR2X1TS U165 ( .A(n62), .B(n7), .Y(SUM[3]) );
  NAND2BX1TS U166 ( .AN(n69), .B(n70), .Y(n10) );
  NOR2X1TS U167 ( .A(A[0]), .B(B[0]), .Y(n69) );
endmodule


module add_sub_carry_out_W26_DW01_sub_1 ( A, B, CI, DIFF, CO );
  input [26:0] A;
  input [26:0] B;
  output [26:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45,
         n46, n47, n48, n49, n50, n53, n54, n56, n57, n58, n59, n60, n61, n62,
         n63, n65, n66, n67, n68, n224, n225, n226, n227, n228, n229, n230,
         n231, n232, n233, n234, n235, n236, n237, n238, n239, n240, n241,
         n242, n243, n244, n245, n246, n247, n248, n249, n250, n251, n252,
         n253, n254;

  AFHCONX2TS U4 ( .A(A[23]), .B(n231), .CI(n13), .CON(n12), .S(DIFF[23]) );
  AFHCONX2TS U6 ( .A(A[21]), .B(n233), .CI(n15), .CON(n14), .S(DIFF[21]) );
  AFHCONX2TS U8 ( .A(A[19]), .B(n235), .CI(n17), .CON(n16), .S(DIFF[19]) );
  AFHCONX2TS U10 ( .A(A[17]), .B(n237), .CI(n19), .CON(n18), .S(DIFF[17]) );
  AFHCONX2TS U12 ( .A(A[15]), .B(n239), .CI(n21), .CON(n20), .S(DIFF[15]) );
  AFHCONX2TS U14 ( .A(A[13]), .B(n241), .CI(n23), .CON(n22), .S(DIFF[13]) );
  AFHCONX2TS U16 ( .A(A[11]), .B(n243), .CI(n25), .CON(n24), .S(DIFF[11]) );
  AOI21X1TS U118 ( .A0(n35), .A1(n27), .B0(n28), .Y(n26) );
  CMPR32X2TS U119 ( .A(n229), .B(A[25]), .C(n11), .CO(n10), .S(DIFF[25]) );
  CLKINVX2TS U120 ( .A(n65), .Y(n228) );
  NOR2X1TS U121 ( .A(n250), .B(A[4]), .Y(n53) );
  NOR2X1TS U122 ( .A(n249), .B(A[5]), .Y(n48) );
  NOR2X1TS U123 ( .A(n254), .B(A[0]), .Y(n68) );
  NAND2X1TS U124 ( .A(n250), .B(A[4]), .Y(n54) );
  NOR2X1TS U125 ( .A(n253), .B(A[1]), .Y(n66) );
  NAND2X1TS U126 ( .A(n252), .B(A[2]), .Y(n63) );
  NOR2X1TS U127 ( .A(n252), .B(A[2]), .Y(n62) );
  NOR2X1TS U128 ( .A(n251), .B(A[3]), .Y(n59) );
  NAND2X1TS U129 ( .A(n253), .B(A[1]), .Y(n67) );
  INVX2TS U130 ( .A(B[1]), .Y(n253) );
  INVX2TS U131 ( .A(B[0]), .Y(n254) );
  AOI21X1TS U132 ( .A0(n227), .A1(n46), .B0(n47), .Y(n45) );
  INVX2TS U133 ( .A(n56), .Y(n227) );
  INVX2TS U134 ( .A(n35), .Y(n224) );
  AOI21X1TS U135 ( .A0(n57), .A1(n65), .B0(n58), .Y(n56) );
  NOR2X1TS U136 ( .A(n62), .B(n59), .Y(n57) );
  OAI21X1TS U137 ( .A0(n59), .A1(n63), .B0(n60), .Y(n58) );
  OAI21X1TS U138 ( .A0(n66), .A1(n68), .B0(n67), .Y(n65) );
  OAI21X1TS U139 ( .A0(n56), .A1(n36), .B0(n37), .Y(n35) );
  NAND2X1TS U140 ( .A(n46), .B(n38), .Y(n36) );
  AOI21X1TS U141 ( .A0(n38), .A1(n47), .B0(n39), .Y(n37) );
  NOR2X1TS U142 ( .A(n43), .B(n40), .Y(n38) );
  OAI21X1TS U143 ( .A0(n48), .A1(n54), .B0(n49), .Y(n47) );
  NOR2X1TS U144 ( .A(n53), .B(n48), .Y(n46) );
  OAI21X1TS U145 ( .A0(n40), .A1(n44), .B0(n41), .Y(n39) );
  OAI21X1TS U146 ( .A0(n29), .A1(n33), .B0(n30), .Y(n28) );
  OAI21X1TS U147 ( .A0(n224), .A1(n32), .B0(n33), .Y(n31) );
  OAI21X1TS U148 ( .A0(n45), .A1(n43), .B0(n44), .Y(n42) );
  AOI21X1TS U149 ( .A0(n227), .A1(n225), .B0(n226), .Y(n50) );
  INVX2TS U150 ( .A(n54), .Y(n226) );
  OAI21X1TS U151 ( .A0(n228), .A1(n62), .B0(n63), .Y(n61) );
  NAND2BX1TS U152 ( .AN(n66), .B(n67), .Y(n9) );
  NAND2BX1TS U153 ( .AN(n48), .B(n49), .Y(n5) );
  NAND2BX1TS U154 ( .AN(n62), .B(n63), .Y(n8) );
  NAND2BX1TS U155 ( .AN(n43), .B(n44), .Y(n4) );
  NAND2BX1TS U156 ( .AN(n32), .B(n33), .Y(n2) );
  NAND2BX1TS U157 ( .AN(n59), .B(n60), .Y(n7) );
  NAND2BX1TS U158 ( .AN(n40), .B(n41), .Y(n3) );
  NAND2BX1TS U159 ( .AN(n29), .B(n30), .Y(n1) );
  NAND2X1TS U160 ( .A(n225), .B(n54), .Y(n6) );
  INVX2TS U161 ( .A(n53), .Y(n225) );
  INVX2TS U162 ( .A(B[11]), .Y(n243) );
  INVX2TS U163 ( .A(B[13]), .Y(n241) );
  INVX2TS U164 ( .A(B[15]), .Y(n239) );
  INVX2TS U165 ( .A(B[17]), .Y(n237) );
  INVX2TS U166 ( .A(B[19]), .Y(n235) );
  INVX2TS U167 ( .A(B[21]), .Y(n233) );
  INVX2TS U168 ( .A(B[23]), .Y(n231) );
  AFHCINX2TS U169 ( .CIN(n26), .B(n244), .A(A[10]), .S(DIFF[10]), .CO(n25) );
  INVX2TS U170 ( .A(B[10]), .Y(n244) );
  NOR2X1TS U171 ( .A(n32), .B(n29), .Y(n27) );
  AFHCINX2TS U172 ( .CIN(n24), .B(n242), .A(A[12]), .S(DIFF[12]), .CO(n23) );
  INVX2TS U173 ( .A(B[12]), .Y(n242) );
  AFHCINX2TS U174 ( .CIN(n22), .B(n240), .A(A[14]), .S(DIFF[14]), .CO(n21) );
  INVX2TS U175 ( .A(B[14]), .Y(n240) );
  AFHCINX2TS U176 ( .CIN(n20), .B(n238), .A(A[16]), .S(DIFF[16]), .CO(n19) );
  INVX2TS U177 ( .A(B[16]), .Y(n238) );
  AFHCINX2TS U178 ( .CIN(n18), .B(n236), .A(A[18]), .S(DIFF[18]), .CO(n17) );
  INVX2TS U179 ( .A(B[18]), .Y(n236) );
  AFHCINX2TS U180 ( .CIN(n16), .B(n234), .A(A[20]), .S(DIFF[20]), .CO(n15) );
  INVX2TS U181 ( .A(B[20]), .Y(n234) );
  AFHCINX2TS U182 ( .CIN(n14), .B(n232), .A(A[22]), .S(DIFF[22]), .CO(n13) );
  INVX2TS U183 ( .A(B[22]), .Y(n232) );
  AFHCINX2TS U184 ( .CIN(n12), .B(n230), .A(A[24]), .S(DIFF[24]), .CO(n11) );
  INVX2TS U185 ( .A(B[24]), .Y(n230) );
  NOR2X1TS U186 ( .A(n248), .B(A[6]), .Y(n43) );
  NOR2X1TS U187 ( .A(n246), .B(A[8]), .Y(n32) );
  NOR2X1TS U188 ( .A(n247), .B(A[7]), .Y(n40) );
  NOR2X1TS U189 ( .A(n245), .B(A[9]), .Y(n29) );
  NAND2X1TS U190 ( .A(n248), .B(A[6]), .Y(n44) );
  NAND2X1TS U191 ( .A(n246), .B(A[8]), .Y(n33) );
  INVX2TS U192 ( .A(n10), .Y(DIFF[26]) );
  NAND2X1TS U193 ( .A(n251), .B(A[3]), .Y(n60) );
  NAND2X1TS U194 ( .A(n249), .B(A[5]), .Y(n49) );
  NAND2X1TS U195 ( .A(n247), .B(A[7]), .Y(n41) );
  NAND2X1TS U196 ( .A(n245), .B(A[9]), .Y(n30) );
  INVX2TS U197 ( .A(B[4]), .Y(n250) );
  INVX2TS U198 ( .A(B[2]), .Y(n252) );
  INVX2TS U199 ( .A(B[5]), .Y(n249) );
  INVX2TS U200 ( .A(B[3]), .Y(n251) );
  INVX2TS U201 ( .A(B[7]), .Y(n247) );
  INVX2TS U202 ( .A(B[6]), .Y(n248) );
  INVX2TS U203 ( .A(B[8]), .Y(n246) );
  INVX2TS U204 ( .A(B[9]), .Y(n245) );
  INVX2TS U205 ( .A(B[25]), .Y(n229) );
  XOR2X1TS U206 ( .A(n45), .B(n4), .Y(DIFF[6]) );
  XOR2X1TS U207 ( .A(n224), .B(n2), .Y(DIFF[8]) );
  XNOR2X1TS U208 ( .A(n31), .B(n1), .Y(DIFF[9]) );
  XNOR2X1TS U209 ( .A(n42), .B(n3), .Y(DIFF[7]) );
  XNOR2X1TS U210 ( .A(n227), .B(n6), .Y(DIFF[4]) );
  XNOR2X1TS U211 ( .A(n254), .B(A[0]), .Y(DIFF[0]) );
  XOR2X1TS U212 ( .A(n9), .B(n68), .Y(DIFF[1]) );
  XOR2X1TS U213 ( .A(n228), .B(n8), .Y(DIFF[2]) );
  XOR2X1TS U214 ( .A(n50), .B(n5), .Y(DIFF[5]) );
  XNOR2X1TS U215 ( .A(n61), .B(n7), .Y(DIFF[3]) );
endmodule


module add_sub_carry_out_W26 ( op_mode, Data_A, Data_B, Data_S );
  input [25:0] Data_A;
  input [25:0] Data_B;
  output [26:0] Data_S;
  input op_mode;
  wire   N3, N4, N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, N15, N16, N17,
         N18, N19, N20, N21, N22, N23, N24, N25, N26, N27, N28, N29, N30, N31,
         N32, N33, N34, N35, N36, N37, N38, N39, N40, N41, N42, N43, N44, N45,
         N46, N47, N48, N49, N50, N51, N52, N53, N54, N55, N56, n9, n10, n11,
         n12, n13, n14;

  add_sub_carry_out_W26_DW01_add_1 add_36 ( .A({1'b0, Data_A}), .B({1'b0, 
        Data_B}), .CI(1'b0), .SUM({N56, N55, N54, N53, N52, N51, N50, N49, N48, 
        N47, N46, N45, N44, N43, N42, N41, N40, N39, N38, N37, N36, N35, N34, 
        N33, N32, N31, N30}) );
  add_sub_carry_out_W26_DW01_sub_1 sub_34 ( .A({1'b0, Data_A}), .B({1'b0, 
        Data_B}), .CI(1'b0), .DIFF({N29, N28, N27, N26, N25, N24, N23, N22, 
        N21, N20, N19, N18, N17, N16, N15, N14, N13, N12, N11, N10, N9, N8, N7, 
        N6, N5, N4, N3}) );
  CLKBUFX2TS U3 ( .A(op_mode), .Y(n13) );
  INVX2TS U4 ( .A(n13), .Y(n11) );
  INVX2TS U5 ( .A(n13), .Y(n10) );
  INVX2TS U6 ( .A(n13), .Y(n12) );
  CLKBUFX2TS U7 ( .A(op_mode), .Y(n14) );
  AO22X1TS U8 ( .A0(N56), .A1(n10), .B0(N29), .B1(n14), .Y(Data_S[26]) );
  AO22X1TS U9 ( .A0(N54), .A1(n10), .B0(N27), .B1(n9), .Y(Data_S[24]) );
  AO22X1TS U10 ( .A0(N55), .A1(n10), .B0(N28), .B1(n14), .Y(Data_S[25]) );
  AO22X1TS U11 ( .A0(N52), .A1(n10), .B0(N25), .B1(n9), .Y(Data_S[22]) );
  AO22X1TS U12 ( .A0(N53), .A1(n10), .B0(N26), .B1(n9), .Y(Data_S[23]) );
  AO22X1TS U13 ( .A0(N48), .A1(n11), .B0(N21), .B1(n9), .Y(Data_S[18]) );
  AO22X1TS U14 ( .A0(N49), .A1(n11), .B0(N22), .B1(n9), .Y(Data_S[19]) );
  AO22X1TS U15 ( .A0(N50), .A1(n10), .B0(N23), .B1(n9), .Y(Data_S[20]) );
  AO22X1TS U16 ( .A0(N51), .A1(n10), .B0(N24), .B1(n9), .Y(Data_S[21]) );
  AO22X1TS U17 ( .A0(N44), .A1(n11), .B0(N17), .B1(n13), .Y(Data_S[14]) );
  AO22X1TS U18 ( .A0(N45), .A1(n11), .B0(N18), .B1(n13), .Y(Data_S[15]) );
  AO22X1TS U19 ( .A0(N46), .A1(n11), .B0(N19), .B1(n9), .Y(Data_S[16]) );
  AO22X1TS U20 ( .A0(N47), .A1(n11), .B0(N20), .B1(n9), .Y(Data_S[17]) );
  AO22X1TS U21 ( .A0(N9), .A1(n14), .B0(N36), .B1(n12), .Y(Data_S[6]) );
  AO22X1TS U22 ( .A0(N38), .A1(n10), .B0(N11), .B1(n14), .Y(Data_S[8]) );
  AO22X1TS U23 ( .A0(N39), .A1(n10), .B0(n13), .B1(N12), .Y(Data_S[9]) );
  AO22X1TS U24 ( .A0(N40), .A1(n11), .B0(N13), .B1(n13), .Y(Data_S[10]) );
  AO22X1TS U25 ( .A0(N41), .A1(n12), .B0(N14), .B1(n13), .Y(Data_S[11]) );
  AO22X1TS U26 ( .A0(N42), .A1(n11), .B0(N15), .B1(n9), .Y(Data_S[12]) );
  AO22X1TS U27 ( .A0(N43), .A1(n11), .B0(N16), .B1(n13), .Y(Data_S[13]) );
  AO22X1TS U28 ( .A0(N37), .A1(n10), .B0(N10), .B1(n14), .Y(Data_S[7]) );
  AO22X1TS U29 ( .A0(N7), .A1(n14), .B0(N34), .B1(n12), .Y(Data_S[4]) );
  AO22X1TS U30 ( .A0(N30), .A1(n11), .B0(N3), .B1(n14), .Y(Data_S[0]) );
  AO22X1TS U31 ( .A0(N4), .A1(n14), .B0(N31), .B1(n12), .Y(Data_S[1]) );
  AO22X1TS U32 ( .A0(N5), .A1(n14), .B0(N32), .B1(n12), .Y(Data_S[2]) );
  AO22X1TS U33 ( .A0(N8), .A1(n13), .B0(N35), .B1(n12), .Y(Data_S[5]) );
  CLKBUFX2TS U34 ( .A(op_mode), .Y(n9) );
  AO22X1TS U35 ( .A0(N6), .A1(n14), .B0(N33), .B1(n12), .Y(Data_S[3]) );
endmodule


module RegisterAdd_W26 ( clk, rst, load, D, Q );
  input [25:0] D;
  output [25:0] Q;
  input clk, rst, load;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38,
         n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n53,
         n72, n73, n74, n75, n76, n77, n78, n79, n84, n85, n86, n87, n88, n89,
         n90, n91;

  DFFRX2TS \Q_reg[25]  ( .D(n53), .CK(clk), .RN(n84), .Q(Q[25]), .QN(n74) );
  DFFRX2TS \Q_reg[24]  ( .D(n51), .CK(clk), .RN(n84), .Q(Q[24]), .QN(n73) );
  DFFRX2TS \Q_reg[23]  ( .D(n50), .CK(clk), .RN(n84), .Q(Q[23]), .QN(n72) );
  DFFRX2TS \Q_reg[22]  ( .D(n49), .CK(clk), .RN(n84), .Q(Q[22]), .QN(n79) );
  DFFRX2TS \Q_reg[21]  ( .D(n48), .CK(clk), .RN(n84), .Q(Q[21]), .QN(n78) );
  DFFRX2TS \Q_reg[20]  ( .D(n47), .CK(clk), .RN(n84), .Q(Q[20]), .QN(n77) );
  DFFRX2TS \Q_reg[19]  ( .D(n46), .CK(clk), .RN(n84), .Q(Q[19]), .QN(n76) );
  DFFRX2TS \Q_reg[18]  ( .D(n45), .CK(clk), .RN(n84), .Q(Q[18]), .QN(n75) );
  DFFRX2TS \Q_reg[17]  ( .D(n44), .CK(clk), .RN(n84), .Q(Q[17]), .QN(n18) );
  DFFRX2TS \Q_reg[16]  ( .D(n43), .CK(clk), .RN(n84), .Q(Q[16]), .QN(n17) );
  DFFRX2TS \Q_reg[15]  ( .D(n42), .CK(clk), .RN(n85), .Q(Q[15]), .QN(n16) );
  DFFRX2TS \Q_reg[14]  ( .D(n41), .CK(clk), .RN(n85), .Q(Q[14]), .QN(n15) );
  DFFRX2TS \Q_reg[13]  ( .D(n40), .CK(clk), .RN(n85), .Q(Q[13]), .QN(n14) );
  DFFRX2TS \Q_reg[12]  ( .D(n39), .CK(clk), .RN(n85), .Q(Q[12]), .QN(n13) );
  DFFRX2TS \Q_reg[11]  ( .D(n38), .CK(clk), .RN(n85), .Q(Q[11]), .QN(n12) );
  DFFRX2TS \Q_reg[10]  ( .D(n37), .CK(clk), .RN(n85), .Q(Q[10]), .QN(n11) );
  DFFRX2TS \Q_reg[9]  ( .D(n36), .CK(clk), .RN(n85), .Q(Q[9]), .QN(n10) );
  DFFRX2TS \Q_reg[8]  ( .D(n35), .CK(clk), .RN(n85), .Q(Q[8]), .QN(n9) );
  DFFRX2TS \Q_reg[7]  ( .D(n34), .CK(clk), .RN(n85), .Q(Q[7]), .QN(n8) );
  DFFRX2TS \Q_reg[6]  ( .D(n33), .CK(clk), .RN(n85), .Q(Q[6]), .QN(n7) );
  DFFRX2TS \Q_reg[5]  ( .D(n32), .CK(clk), .RN(n91), .Q(Q[5]), .QN(n6) );
  DFFRX2TS \Q_reg[4]  ( .D(n31), .CK(clk), .RN(n91), .Q(Q[4]), .QN(n5) );
  DFFRX2TS \Q_reg[3]  ( .D(n30), .CK(clk), .RN(n91), .Q(Q[3]), .QN(n4) );
  DFFRX2TS \Q_reg[2]  ( .D(n29), .CK(clk), .RN(n91), .Q(Q[2]), .QN(n3) );
  DFFRX2TS \Q_reg[1]  ( .D(n28), .CK(clk), .RN(n91), .Q(Q[1]), .QN(n2) );
  DFFRX2TS \Q_reg[0]  ( .D(n27), .CK(clk), .RN(n91), .Q(Q[0]), .QN(n1) );
  CLKBUFX2TS U2 ( .A(n90), .Y(n86) );
  CLKBUFX2TS U3 ( .A(n90), .Y(n87) );
  CLKBUFX2TS U4 ( .A(n89), .Y(n88) );
  CLKBUFX2TS U5 ( .A(n91), .Y(n85) );
  CLKBUFX2TS U6 ( .A(n91), .Y(n84) );
  OAI2BB2XLTS U7 ( .B0(n73), .B1(load), .A0N(D[24]), .A1N(n88), .Y(n51) );
  OAI2BB2XLTS U8 ( .B0(n74), .B1(load), .A0N(n89), .A1N(D[25]), .Y(n53) );
  OAI2BB2XLTS U9 ( .B0(n79), .B1(n90), .A0N(D[22]), .A1N(n88), .Y(n49) );
  OAI2BB2XLTS U10 ( .B0(n72), .B1(n89), .A0N(D[23]), .A1N(n88), .Y(n50) );
  OAI2BB2XLTS U11 ( .B0(n75), .B1(n90), .A0N(D[18]), .A1N(n87), .Y(n45) );
  OAI2BB2XLTS U12 ( .B0(n76), .B1(n90), .A0N(D[19]), .A1N(n87), .Y(n46) );
  OAI2BB2XLTS U13 ( .B0(n77), .B1(n90), .A0N(D[20]), .A1N(n88), .Y(n47) );
  OAI2BB2XLTS U14 ( .B0(n78), .B1(n89), .A0N(D[21]), .A1N(n88), .Y(n48) );
  OAI2BB2XLTS U15 ( .B0(n15), .B1(n89), .A0N(D[14]), .A1N(n87), .Y(n41) );
  OAI2BB2XLTS U16 ( .B0(n16), .B1(load), .A0N(D[15]), .A1N(n87), .Y(n42) );
  OAI2BB2XLTS U17 ( .B0(n17), .B1(load), .A0N(D[16]), .A1N(n87), .Y(n43) );
  OAI2BB2XLTS U18 ( .B0(n18), .B1(load), .A0N(D[17]), .A1N(n87), .Y(n44) );
  OAI2BB2XLTS U19 ( .B0(n7), .B1(load), .A0N(D[6]), .A1N(n88), .Y(n33) );
  OAI2BB2XLTS U20 ( .B0(n9), .B1(n89), .A0N(D[8]), .A1N(n87), .Y(n35) );
  OAI2BB2XLTS U21 ( .B0(n10), .B1(n89), .A0N(D[9]), .A1N(n86), .Y(n36) );
  OAI2BB2XLTS U22 ( .B0(n11), .B1(n90), .A0N(D[10]), .A1N(n86), .Y(n37) );
  OAI2BB2XLTS U23 ( .B0(n12), .B1(n90), .A0N(D[11]), .A1N(n86), .Y(n38) );
  OAI2BB2XLTS U24 ( .B0(n13), .B1(n89), .A0N(D[12]), .A1N(n86), .Y(n39) );
  OAI2BB2XLTS U25 ( .B0(n14), .B1(n89), .A0N(D[13]), .A1N(n87), .Y(n40) );
  OAI2BB2XLTS U26 ( .B0(n8), .B1(n89), .A0N(D[7]), .A1N(n87), .Y(n34) );
  OAI2BB2XLTS U27 ( .B0(n5), .B1(n86), .A0N(D[4]), .A1N(n88), .Y(n31) );
  OAI2BB2XLTS U28 ( .B0(n1), .B1(n86), .A0N(D[0]), .A1N(n90), .Y(n27) );
  OAI2BB2XLTS U29 ( .B0(n2), .B1(n86), .A0N(D[1]), .A1N(n88), .Y(n28) );
  OAI2BB2XLTS U30 ( .B0(n3), .B1(n86), .A0N(D[2]), .A1N(n88), .Y(n29) );
  OAI2BB2XLTS U31 ( .B0(n6), .B1(n86), .A0N(D[5]), .A1N(n87), .Y(n32) );
  OAI2BB2XLTS U32 ( .B0(n4), .B1(n86), .A0N(D[3]), .A1N(n88), .Y(n30) );
  CLKBUFX2TS U33 ( .A(load), .Y(n90) );
  CLKBUFX2TS U34 ( .A(load), .Y(n89) );
  INVX2TS U35 ( .A(rst), .Y(n91) );
endmodule


module RegisterAdd_W1 ( clk, rst, load, D, Q );
  input [0:0] D;
  output [0:0] Q;
  input clk, rst, load;
  wire   n3, n4, n6;

  DFFRX2TS \Q_reg[0]  ( .D(n3), .CK(clk), .RN(n6), .Q(Q[0]), .QN(n4) );
  OAI2BB2XLTS U2 ( .B0(n4), .B1(load), .A0N(load), .A1N(D[0]), .Y(n3) );
  INVX2TS U3 ( .A(rst), .Y(n6) );
endmodule


module Add_Subt ( clk, rst, load_i, Add_Sub_op_i, Data_A_i, PreData_B_i, 
        Data_Result_o, FSM_C_o );
  input [25:0] Data_A_i;
  input [25:0] PreData_B_i;
  output [25:0] Data_Result_o;
  input clk, rst, load_i, Add_Sub_op_i;
  output FSM_C_o;

  wire   [26:0] S_to_D;

  add_sub_carry_out_W26 Sgf_AS ( .op_mode(Add_Sub_op_i), .Data_A(Data_A_i), 
        .Data_B(PreData_B_i), .Data_S(S_to_D) );
  RegisterAdd_W26 Add_Subt_Result ( .clk(clk), .rst(rst), .load(load_i), .D(
        S_to_D[25:0]), .Q(Data_Result_o) );
  RegisterAdd_W1 Add_overflow_Result ( .clk(clk), .rst(rst), .load(load_i), 
        .D(S_to_D[26]), .Q(FSM_C_o) );
endmodule

