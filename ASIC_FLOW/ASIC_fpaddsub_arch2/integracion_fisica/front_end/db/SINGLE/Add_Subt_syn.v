/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : L-2016.03-SP3
// Date      : Mon Oct 17 20:47:53 2016
/////////////////////////////////////////////////////////////


module add_sub_carry_out_W26_DW01_add_1 ( A, B, CI, SUM, CO );
  input [26:0] A;
  input [26:0] B;
  output [26:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n12, n13, n14, n15, n16, n17,
         n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31,
         n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45,
         n46, n47, n48, n49, n50, n51, n53, n54, n55, n56, n57, n58, n59, n60,
         n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n76;

  CMPR32X2TS U2 ( .A(A[25]), .B(B[25]), .C(n12), .CO(SUM[26]), .S(SUM[25]) );
  AFHCINX2TS U3 ( .CIN(n13), .B(A[24]), .A(B[24]), .S(SUM[24]), .CO(n12) );
  AFHCONX2TS U4 ( .A(B[23]), .B(A[23]), .CI(n14), .CON(n13), .S(SUM[23]) );
  AFHCINX2TS U5 ( .CIN(n15), .B(A[22]), .A(B[22]), .S(SUM[22]), .CO(n14) );
  AFHCONX2TS U6 ( .A(B[21]), .B(A[21]), .CI(n16), .CON(n15), .S(SUM[21]) );
  AFHCINX2TS U7 ( .CIN(n17), .B(A[20]), .A(B[20]), .S(SUM[20]), .CO(n16) );
  AFHCONX2TS U8 ( .A(B[19]), .B(A[19]), .CI(n18), .CON(n17), .S(SUM[19]) );
  AFHCINX2TS U9 ( .CIN(n19), .B(A[18]), .A(B[18]), .S(SUM[18]), .CO(n18) );
  AFHCONX2TS U10 ( .A(B[17]), .B(A[17]), .CI(n20), .CON(n19), .S(SUM[17]) );
  AFHCINX2TS U11 ( .CIN(n21), .B(A[16]), .A(B[16]), .S(SUM[16]), .CO(n20) );
  AFHCONX2TS U12 ( .A(B[15]), .B(A[15]), .CI(n22), .CON(n21), .S(SUM[15]) );
  AFHCINX2TS U13 ( .CIN(n23), .B(A[14]), .A(B[14]), .S(SUM[14]), .CO(n22) );
  AFHCONX2TS U14 ( .A(B[13]), .B(A[13]), .CI(n24), .CON(n23), .S(SUM[13]) );
  AFHCINX2TS U15 ( .CIN(n25), .B(A[12]), .A(B[12]), .S(SUM[12]), .CO(n24) );
  AFHCONX2TS U16 ( .A(B[11]), .B(A[11]), .CI(n26), .CON(n25), .S(SUM[11]) );
  AFHCINX2TS U17 ( .CIN(n27), .B(A[10]), .A(B[10]), .S(SUM[10]), .CO(n26) );
  XOR2X1TS U26 ( .A(n35), .B(n2), .Y(SUM[8]) );
  XOR2X1TS U43 ( .A(n46), .B(n4), .Y(SUM[6]) );
  XOR2X1TS U49 ( .A(n51), .B(n5), .Y(SUM[5]) );
  XOR2X1TS U74 ( .A(n65), .B(n8), .Y(SUM[2]) );
  XOR2X1TS U80 ( .A(n9), .B(n70), .Y(SUM[1]) );
  NOR2X1TS U95 ( .A(A[4]), .B(B[4]), .Y(n54) );
  NOR2X1TS U96 ( .A(A[2]), .B(B[2]), .Y(n63) );
  NOR2X1TS U97 ( .A(A[6]), .B(B[6]), .Y(n44) );
  NOR2X1TS U98 ( .A(A[8]), .B(B[8]), .Y(n33) );
  NOR2X1TS U99 ( .A(A[3]), .B(B[3]), .Y(n60) );
  NOR2X1TS U100 ( .A(A[7]), .B(B[7]), .Y(n41) );
  NOR2X1TS U101 ( .A(A[5]), .B(B[5]), .Y(n49) );
  NOR2X1TS U102 ( .A(A[9]), .B(B[9]), .Y(n30) );
  INVX2TS U103 ( .A(n36), .Y(n35) );
  AOI21X1TS U104 ( .A0(n56), .A1(n47), .B0(n48), .Y(n46) );
  INVX2TS U105 ( .A(n57), .Y(n56) );
  INVX2TS U106 ( .A(n66), .Y(n65) );
  AOI21X1TS U107 ( .A0(n58), .A1(n66), .B0(n59), .Y(n57) );
  NOR2X1TS U108 ( .A(n63), .B(n60), .Y(n58) );
  OAI21X1TS U109 ( .A0(n60), .A1(n64), .B0(n61), .Y(n59) );
  OAI21X1TS U110 ( .A0(n67), .A1(n70), .B0(n68), .Y(n66) );
  OAI21X1TS U111 ( .A0(n57), .A1(n37), .B0(n38), .Y(n36) );
  NAND2X1TS U112 ( .A(n47), .B(n39), .Y(n37) );
  AOI21X1TS U113 ( .A0(n39), .A1(n48), .B0(n40), .Y(n38) );
  NOR2X1TS U114 ( .A(n44), .B(n41), .Y(n39) );
  OAI21X1TS U115 ( .A0(n49), .A1(n55), .B0(n50), .Y(n48) );
  OAI21X1TS U116 ( .A0(n41), .A1(n45), .B0(n42), .Y(n40) );
  NOR2X1TS U117 ( .A(n54), .B(n49), .Y(n47) );
  OAI21X1TS U118 ( .A0(n35), .A1(n33), .B0(n34), .Y(n32) );
  OAI21X1TS U119 ( .A0(n65), .A1(n63), .B0(n64), .Y(n62) );
  OAI21X1TS U120 ( .A0(n46), .A1(n44), .B0(n45), .Y(n43) );
  AOI21X1TS U121 ( .A0(n56), .A1(n76), .B0(n53), .Y(n51) );
  INVX2TS U122 ( .A(n55), .Y(n53) );
  NAND2X1TS U123 ( .A(n76), .B(n55), .Y(n6) );
  NAND2BX1TS U124 ( .AN(n60), .B(n61), .Y(n7) );
  NAND2BX1TS U125 ( .AN(n41), .B(n42), .Y(n3) );
  NAND2BX1TS U126 ( .AN(n30), .B(n31), .Y(n1) );
  NAND2BX1TS U127 ( .AN(n67), .B(n68), .Y(n9) );
  NAND2BX1TS U128 ( .AN(n63), .B(n64), .Y(n8) );
  NAND2BX1TS U129 ( .AN(n44), .B(n45), .Y(n4) );
  NAND2BX1TS U130 ( .AN(n33), .B(n34), .Y(n2) );
  NAND2BX1TS U131 ( .AN(n49), .B(n50), .Y(n5) );
  INVX2TS U132 ( .A(n54), .Y(n76) );
  AOI21X1TS U133 ( .A0(n36), .A1(n28), .B0(n29), .Y(n27) );
  NOR2X1TS U134 ( .A(n33), .B(n30), .Y(n28) );
  OAI21X1TS U135 ( .A0(n30), .A1(n34), .B0(n31), .Y(n29) );
  NAND2X1TS U136 ( .A(A[4]), .B(B[4]), .Y(n55) );
  NOR2X1TS U137 ( .A(A[1]), .B(B[1]), .Y(n67) );
  NAND2X1TS U138 ( .A(A[2]), .B(B[2]), .Y(n64) );
  NAND2X1TS U139 ( .A(A[6]), .B(B[6]), .Y(n45) );
  NAND2X1TS U140 ( .A(A[8]), .B(B[8]), .Y(n34) );
  NAND2X1TS U141 ( .A(A[0]), .B(B[0]), .Y(n70) );
  NAND2X1TS U142 ( .A(A[1]), .B(B[1]), .Y(n68) );
  NAND2X1TS U143 ( .A(A[3]), .B(B[3]), .Y(n61) );
  NAND2X1TS U144 ( .A(A[5]), .B(B[5]), .Y(n50) );
  NAND2X1TS U145 ( .A(A[7]), .B(B[7]), .Y(n42) );
  NAND2X1TS U146 ( .A(A[9]), .B(B[9]), .Y(n31) );
  XNOR2X1TS U147 ( .A(n32), .B(n1), .Y(SUM[9]) );
  NAND2BX1TS U148 ( .AN(n69), .B(n70), .Y(n10) );
  NOR2X1TS U149 ( .A(A[0]), .B(B[0]), .Y(n69) );
  INVX2TS U150 ( .A(n10), .Y(SUM[0]) );
  XNOR2X1TS U151 ( .A(n62), .B(n7), .Y(SUM[3]) );
  XNOR2X1TS U152 ( .A(n56), .B(n6), .Y(SUM[4]) );
  XNOR2X1TS U153 ( .A(n43), .B(n3), .Y(SUM[7]) );
endmodule


module add_sub_carry_out_W26_DW01_sub_1 ( A, B, CI, DIFF, CO );
  input [26:0] A;
  input [26:0] B;
  output [26:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n52, n53, n54, n55, n56, n57, n58, n59,
         n60, n61, n62, n63, n64, n65, n66, n67, n68, n74, n78, n79, n80, n81,
         n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95,
         n96, n97, n98, n99, n100, n101, n102, n103;

  CMPR32X2TS U2 ( .A(n78), .B(A[25]), .C(n11), .CO(n10), .S(DIFF[25]) );
  AFHCINX2TS U3 ( .CIN(n12), .B(n79), .A(A[24]), .S(DIFF[24]), .CO(n11) );
  AFHCONX2TS U4 ( .A(A[23]), .B(n80), .CI(n13), .CON(n12), .S(DIFF[23]) );
  AFHCINX2TS U5 ( .CIN(n14), .B(n81), .A(A[22]), .S(DIFF[22]), .CO(n13) );
  AFHCONX2TS U6 ( .A(A[21]), .B(n82), .CI(n15), .CON(n14), .S(DIFF[21]) );
  AFHCINX2TS U7 ( .CIN(n16), .B(n83), .A(A[20]), .S(DIFF[20]), .CO(n15) );
  AFHCONX2TS U8 ( .A(A[19]), .B(n84), .CI(n17), .CON(n16), .S(DIFF[19]) );
  AFHCINX2TS U9 ( .CIN(n18), .B(n85), .A(A[18]), .S(DIFF[18]), .CO(n17) );
  AFHCONX2TS U10 ( .A(A[17]), .B(n86), .CI(n19), .CON(n18), .S(DIFF[17]) );
  AFHCINX2TS U11 ( .CIN(n20), .B(n87), .A(A[16]), .S(DIFF[16]), .CO(n19) );
  AFHCONX2TS U12 ( .A(A[15]), .B(n88), .CI(n21), .CON(n20), .S(DIFF[15]) );
  AFHCINX2TS U13 ( .CIN(n22), .B(n89), .A(A[14]), .S(DIFF[14]), .CO(n21) );
  AFHCONX2TS U14 ( .A(A[13]), .B(n90), .CI(n23), .CON(n22), .S(DIFF[13]) );
  AFHCINX2TS U15 ( .CIN(n24), .B(n91), .A(A[12]), .S(DIFF[12]), .CO(n23) );
  AFHCONX2TS U16 ( .A(A[11]), .B(n92), .CI(n25), .CON(n24), .S(DIFF[11]) );
  AFHCINX2TS U17 ( .CIN(n26), .B(n93), .A(A[10]), .S(DIFF[10]), .CO(n25) );
  XOR2X1TS U26 ( .A(n34), .B(n2), .Y(DIFF[8]) );
  XOR2X1TS U43 ( .A(n45), .B(n4), .Y(DIFF[6]) );
  XOR2X1TS U49 ( .A(n50), .B(n5), .Y(DIFF[5]) );
  XOR2X1TS U74 ( .A(n64), .B(n8), .Y(DIFF[2]) );
  XOR2X1TS U80 ( .A(n9), .B(n68), .Y(DIFF[1]) );
  NOR2X1TS U118 ( .A(n99), .B(A[4]), .Y(n53) );
  NOR2X1TS U119 ( .A(n101), .B(A[2]), .Y(n62) );
  NOR2X1TS U120 ( .A(n97), .B(A[6]), .Y(n43) );
  NOR2X1TS U121 ( .A(n95), .B(A[8]), .Y(n32) );
  NOR2X1TS U122 ( .A(n100), .B(A[3]), .Y(n59) );
  NOR2X1TS U123 ( .A(n96), .B(A[7]), .Y(n40) );
  NOR2X1TS U124 ( .A(n98), .B(A[5]), .Y(n48) );
  NOR2X1TS U125 ( .A(n94), .B(A[9]), .Y(n29) );
  AOI21X1TS U126 ( .A0(n55), .A1(n46), .B0(n47), .Y(n45) );
  INVX2TS U127 ( .A(n56), .Y(n55) );
  INVX2TS U128 ( .A(n35), .Y(n34) );
  INVX2TS U129 ( .A(n65), .Y(n64) );
  AOI21X1TS U130 ( .A0(n57), .A1(n65), .B0(n58), .Y(n56) );
  NOR2X1TS U131 ( .A(n62), .B(n59), .Y(n57) );
  OAI21X1TS U132 ( .A0(n59), .A1(n63), .B0(n60), .Y(n58) );
  OAI21X1TS U133 ( .A0(n66), .A1(n68), .B0(n67), .Y(n65) );
  OAI21X1TS U134 ( .A0(n56), .A1(n36), .B0(n37), .Y(n35) );
  NAND2X1TS U135 ( .A(n46), .B(n38), .Y(n36) );
  AOI21X1TS U136 ( .A0(n38), .A1(n47), .B0(n39), .Y(n37) );
  NOR2X1TS U137 ( .A(n43), .B(n40), .Y(n38) );
  OAI21X1TS U138 ( .A0(n48), .A1(n54), .B0(n49), .Y(n47) );
  OAI21X1TS U139 ( .A0(n40), .A1(n44), .B0(n41), .Y(n39) );
  OAI21X1TS U140 ( .A0(n29), .A1(n33), .B0(n30), .Y(n28) );
  NOR2X1TS U141 ( .A(n53), .B(n48), .Y(n46) );
  OAI21X1TS U142 ( .A0(n34), .A1(n32), .B0(n33), .Y(n31) );
  OAI21X1TS U143 ( .A0(n64), .A1(n62), .B0(n63), .Y(n61) );
  OAI21X1TS U144 ( .A0(n45), .A1(n43), .B0(n44), .Y(n42) );
  AOI21X1TS U145 ( .A0(n55), .A1(n74), .B0(n52), .Y(n50) );
  INVX2TS U146 ( .A(n54), .Y(n52) );
  NAND2X1TS U147 ( .A(n74), .B(n54), .Y(n6) );
  NAND2BX1TS U148 ( .AN(n59), .B(n60), .Y(n7) );
  NAND2BX1TS U149 ( .AN(n40), .B(n41), .Y(n3) );
  NAND2BX1TS U150 ( .AN(n29), .B(n30), .Y(n1) );
  NAND2BX1TS U151 ( .AN(n62), .B(n63), .Y(n8) );
  NAND2BX1TS U152 ( .AN(n43), .B(n44), .Y(n4) );
  NAND2BX1TS U153 ( .AN(n32), .B(n33), .Y(n2) );
  INVX2TS U154 ( .A(n53), .Y(n74) );
  NAND2BX1TS U155 ( .AN(n48), .B(n49), .Y(n5) );
  NAND2BX1TS U156 ( .AN(n66), .B(n67), .Y(n9) );
  INVX2TS U157 ( .A(B[12]), .Y(n91) );
  INVX2TS U158 ( .A(B[14]), .Y(n89) );
  INVX2TS U159 ( .A(B[16]), .Y(n87) );
  INVX2TS U160 ( .A(B[18]), .Y(n85) );
  INVX2TS U161 ( .A(B[20]), .Y(n83) );
  INVX2TS U162 ( .A(B[22]), .Y(n81) );
  INVX2TS U163 ( .A(B[10]), .Y(n93) );
  AOI21X1TS U164 ( .A0(n35), .A1(n27), .B0(n28), .Y(n26) );
  NOR2X1TS U165 ( .A(n32), .B(n29), .Y(n27) );
  INVX2TS U166 ( .A(B[11]), .Y(n92) );
  INVX2TS U167 ( .A(B[13]), .Y(n90) );
  INVX2TS U168 ( .A(B[15]), .Y(n88) );
  INVX2TS U169 ( .A(B[17]), .Y(n86) );
  INVX2TS U170 ( .A(B[19]), .Y(n84) );
  INVX2TS U171 ( .A(B[21]), .Y(n82) );
  INVX2TS U172 ( .A(B[23]), .Y(n80) );
  NAND2X1TS U173 ( .A(n99), .B(A[4]), .Y(n54) );
  INVX2TS U174 ( .A(B[24]), .Y(n79) );
  NOR2X1TS U175 ( .A(n102), .B(A[1]), .Y(n66) );
  INVX2TS U176 ( .A(B[25]), .Y(n78) );
  NAND2X1TS U177 ( .A(n101), .B(A[2]), .Y(n63) );
  NAND2X1TS U178 ( .A(n97), .B(A[6]), .Y(n44) );
  NAND2X1TS U179 ( .A(n95), .B(A[8]), .Y(n33) );
  NAND2X1TS U180 ( .A(n102), .B(A[1]), .Y(n67) );
  NAND2X1TS U181 ( .A(n100), .B(A[3]), .Y(n60) );
  NAND2X1TS U182 ( .A(n98), .B(A[5]), .Y(n49) );
  NAND2X1TS U183 ( .A(n96), .B(A[7]), .Y(n41) );
  NAND2X1TS U184 ( .A(n94), .B(A[9]), .Y(n30) );
  NOR2X1TS U185 ( .A(n103), .B(A[0]), .Y(n68) );
  INVX2TS U186 ( .A(n10), .Y(DIFF[26]) );
  INVX2TS U187 ( .A(B[1]), .Y(n102) );
  INVX2TS U188 ( .A(B[3]), .Y(n100) );
  INVX2TS U189 ( .A(B[7]), .Y(n96) );
  INVX2TS U190 ( .A(B[5]), .Y(n98) );
  INVX2TS U191 ( .A(B[4]), .Y(n99) );
  INVX2TS U192 ( .A(B[9]), .Y(n94) );
  INVX2TS U193 ( .A(B[2]), .Y(n101) );
  INVX2TS U194 ( .A(B[6]), .Y(n97) );
  INVX2TS U195 ( .A(B[8]), .Y(n95) );
  INVX2TS U196 ( .A(B[0]), .Y(n103) );
  XNOR2X1TS U197 ( .A(n31), .B(n1), .Y(DIFF[9]) );
  XNOR2X1TS U198 ( .A(n103), .B(A[0]), .Y(DIFF[0]) );
  XNOR2X1TS U199 ( .A(n61), .B(n7), .Y(DIFF[3]) );
  XNOR2X1TS U200 ( .A(n55), .B(n6), .Y(DIFF[4]) );
  XNOR2X1TS U201 ( .A(n42), .B(n3), .Y(DIFF[7]) );
endmodule


module add_sub_carry_out_W26 ( op_mode, Data_A, Data_B, Data_S );
  input [25:0] Data_A;
  input [25:0] Data_B;
  output [26:0] Data_S;
  input op_mode;
  wire   N3, N4, N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, N15, N16, N17,
         N18, N19, N20, N21, N22, N23, N24, N25, N26, N27, N28, N29, N30, N31,
         N32, N33, N34, N35, N36, N37, N38, N39, N40, N41, N42, N43, N44, N45,
         N46, N47, N48, N49, N50, N51, N52, N53, N54, N55, N56, n1, n2;

  add_sub_carry_out_W26_DW01_add_1 add_36 ( .A({1'b0, Data_A}), .B({1'b0, 
        Data_B}), .CI(1'b0), .SUM({N56, N55, N54, N53, N52, N51, N50, N49, N48, 
        N47, N46, N45, N44, N43, N42, N41, N40, N39, N38, N37, N36, N35, N34, 
        N33, N32, N31, N30}) );
  add_sub_carry_out_W26_DW01_sub_1 sub_34 ( .A({1'b0, Data_A}), .B({1'b0, 
        Data_B}), .CI(1'b0), .DIFF({N29, N28, N27, N26, N25, N24, N23, N22, 
        N21, N20, N19, N18, N17, N16, N15, N14, N13, N12, N11, N10, N9, N8, N7, 
        N6, N5, N4, N3}) );
  CLKBUFX2TS U3 ( .A(n1), .Y(n2) );
  CLKMX2X2TS U4 ( .A(N56), .B(N29), .S0(op_mode), .Y(Data_S[26]) );
  CLKMX2X2TS U5 ( .A(N53), .B(N26), .S0(op_mode), .Y(Data_S[23]) );
  CLKMX2X2TS U6 ( .A(N54), .B(N27), .S0(op_mode), .Y(Data_S[24]) );
  CLKMX2X2TS U7 ( .A(N55), .B(N28), .S0(op_mode), .Y(Data_S[25]) );
  CLKMX2X2TS U8 ( .A(N48), .B(N21), .S0(n1), .Y(Data_S[18]) );
  CLKMX2X2TS U9 ( .A(N49), .B(N22), .S0(n1), .Y(Data_S[19]) );
  CLKMX2X2TS U10 ( .A(N50), .B(N23), .S0(op_mode), .Y(Data_S[20]) );
  CLKMX2X2TS U11 ( .A(N51), .B(N24), .S0(op_mode), .Y(Data_S[21]) );
  CLKMX2X2TS U12 ( .A(N52), .B(N25), .S0(op_mode), .Y(Data_S[22]) );
  CLKMX2X2TS U13 ( .A(N44), .B(N17), .S0(op_mode), .Y(Data_S[14]) );
  CLKMX2X2TS U14 ( .A(N45), .B(N18), .S0(op_mode), .Y(Data_S[15]) );
  CLKMX2X2TS U15 ( .A(N46), .B(N19), .S0(n1), .Y(Data_S[16]) );
  CLKMX2X2TS U16 ( .A(N47), .B(N20), .S0(n1), .Y(Data_S[17]) );
  CLKMX2X2TS U17 ( .A(N36), .B(N9), .S0(n2), .Y(Data_S[6]) );
  CLKMX2X2TS U18 ( .A(N39), .B(N12), .S0(n2), .Y(Data_S[9]) );
  CLKMX2X2TS U19 ( .A(N40), .B(N13), .S0(n1), .Y(Data_S[10]) );
  CLKMX2X2TS U20 ( .A(N41), .B(N14), .S0(n1), .Y(Data_S[11]) );
  CLKMX2X2TS U21 ( .A(N42), .B(N15), .S0(n1), .Y(Data_S[12]) );
  CLKMX2X2TS U22 ( .A(N43), .B(N16), .S0(n1), .Y(Data_S[13]) );
  CLKMX2X2TS U23 ( .A(N30), .B(N3), .S0(n2), .Y(Data_S[0]) );
  CLKMX2X2TS U24 ( .A(N31), .B(N4), .S0(n2), .Y(Data_S[1]) );
  CLKMX2X2TS U25 ( .A(N32), .B(N5), .S0(n2), .Y(Data_S[2]) );
  CLKMX2X2TS U26 ( .A(N33), .B(N6), .S0(n2), .Y(Data_S[3]) );
  CLKMX2X2TS U27 ( .A(N34), .B(N7), .S0(n2), .Y(Data_S[4]) );
  CLKMX2X2TS U28 ( .A(N35), .B(N8), .S0(n2), .Y(Data_S[5]) );
  CLKMX2X2TS U29 ( .A(N37), .B(N10), .S0(n2), .Y(Data_S[7]) );
  CLKMX2X2TS U30 ( .A(N38), .B(N11), .S0(n2), .Y(Data_S[8]) );
  CLKBUFX2TS U31 ( .A(op_mode), .Y(n1) );
endmodule


module RegisterAdd_W26 ( clk, rst, load, D, Q );
  input [25:0] D;
  output [25:0] Q;
  input clk, rst, load;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38,
         n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n53,
         n19, n20, n21, n22, n23, n24, n59;

  DFFRX2TS \Q_reg[25]  ( .D(n53), .CK(clk), .RN(n20), .Q(Q[25]) );
  DFFRX2TS \Q_reg[24]  ( .D(n51), .CK(clk), .RN(n20), .Q(Q[24]) );
  DFFRX2TS \Q_reg[23]  ( .D(n50), .CK(clk), .RN(n59), .Q(Q[23]) );
  DFFRX2TS \Q_reg[22]  ( .D(n49), .CK(clk), .RN(n59), .Q(Q[22]) );
  DFFRX2TS \Q_reg[21]  ( .D(n48), .CK(clk), .RN(n59), .Q(Q[21]) );
  DFFRX2TS \Q_reg[20]  ( .D(n47), .CK(clk), .RN(n59), .Q(Q[20]) );
  DFFRX2TS \Q_reg[19]  ( .D(n46), .CK(clk), .RN(n59), .Q(Q[19]) );
  DFFRX2TS \Q_reg[18]  ( .D(n45), .CK(clk), .RN(n59), .Q(Q[18]) );
  DFFRX2TS \Q_reg[17]  ( .D(n44), .CK(clk), .RN(n19), .Q(Q[17]), .QN(n18) );
  DFFRX2TS \Q_reg[16]  ( .D(n43), .CK(clk), .RN(n19), .Q(Q[16]), .QN(n17) );
  DFFRX2TS \Q_reg[15]  ( .D(n42), .CK(clk), .RN(n19), .Q(Q[15]), .QN(n16) );
  DFFRX2TS \Q_reg[14]  ( .D(n41), .CK(clk), .RN(n19), .Q(Q[14]), .QN(n15) );
  DFFRX2TS \Q_reg[13]  ( .D(n40), .CK(clk), .RN(n19), .Q(Q[13]), .QN(n14) );
  DFFRX2TS \Q_reg[12]  ( .D(n39), .CK(clk), .RN(n19), .Q(Q[12]), .QN(n13) );
  DFFRX2TS \Q_reg[11]  ( .D(n38), .CK(clk), .RN(n19), .Q(Q[11]), .QN(n12) );
  DFFRX2TS \Q_reg[10]  ( .D(n37), .CK(clk), .RN(n19), .Q(Q[10]), .QN(n11) );
  DFFRX2TS \Q_reg[9]  ( .D(n36), .CK(clk), .RN(n19), .Q(Q[9]), .QN(n10) );
  DFFRX2TS \Q_reg[8]  ( .D(n35), .CK(clk), .RN(n19), .Q(Q[8]), .QN(n9) );
  DFFRX2TS \Q_reg[7]  ( .D(n34), .CK(clk), .RN(n20), .Q(Q[7]), .QN(n8) );
  DFFRX2TS \Q_reg[6]  ( .D(n33), .CK(clk), .RN(n20), .Q(Q[6]), .QN(n7) );
  DFFRX2TS \Q_reg[5]  ( .D(n32), .CK(clk), .RN(n20), .Q(Q[5]), .QN(n6) );
  DFFRX2TS \Q_reg[4]  ( .D(n31), .CK(clk), .RN(n20), .Q(Q[4]), .QN(n5) );
  DFFRX2TS \Q_reg[3]  ( .D(n30), .CK(clk), .RN(n20), .Q(Q[3]), .QN(n4) );
  DFFRX2TS \Q_reg[2]  ( .D(n29), .CK(clk), .RN(n20), .Q(Q[2]), .QN(n3) );
  DFFRX2TS \Q_reg[1]  ( .D(n28), .CK(clk), .RN(n20), .Q(Q[1]), .QN(n2) );
  DFFRX2TS \Q_reg[0]  ( .D(n27), .CK(clk), .RN(n20), .Q(Q[0]), .QN(n1) );
  CLKBUFX2TS U2 ( .A(n21), .Y(n23) );
  CLKBUFX2TS U3 ( .A(n21), .Y(n24) );
  CLKBUFX2TS U4 ( .A(n59), .Y(n19) );
  CLKBUFX2TS U5 ( .A(n59), .Y(n20) );
  CLKMX2X2TS U6 ( .A(Q[23]), .B(D[23]), .S0(n24), .Y(n50) );
  CLKMX2X2TS U7 ( .A(Q[24]), .B(D[24]), .S0(n22), .Y(n51) );
  CLKMX2X2TS U8 ( .A(Q[25]), .B(D[25]), .S0(n22), .Y(n53) );
  CLKMX2X2TS U9 ( .A(Q[18]), .B(D[18]), .S0(n24), .Y(n45) );
  CLKMX2X2TS U10 ( .A(Q[19]), .B(D[19]), .S0(n22), .Y(n46) );
  CLKMX2X2TS U11 ( .A(Q[20]), .B(D[20]), .S0(n22), .Y(n47) );
  CLKMX2X2TS U12 ( .A(Q[21]), .B(D[21]), .S0(n22), .Y(n48) );
  CLKMX2X2TS U13 ( .A(Q[22]), .B(D[22]), .S0(n22), .Y(n49) );
  OAI2BB2XLTS U14 ( .B0(n15), .B1(n23), .A0N(D[14]), .A1N(load), .Y(n41) );
  OAI2BB2XLTS U15 ( .B0(n16), .B1(n23), .A0N(D[15]), .A1N(load), .Y(n42) );
  OAI2BB2XLTS U16 ( .B0(n17), .B1(n23), .A0N(D[16]), .A1N(n21), .Y(n43) );
  OAI2BB2XLTS U17 ( .B0(n18), .B1(n23), .A0N(D[17]), .A1N(n21), .Y(n44) );
  OAI2BB2XLTS U18 ( .B0(n7), .B1(n24), .A0N(D[6]), .A1N(n22), .Y(n33) );
  OAI2BB2XLTS U19 ( .B0(n10), .B1(n24), .A0N(D[9]), .A1N(n21), .Y(n36) );
  OAI2BB2XLTS U20 ( .B0(n11), .B1(n23), .A0N(D[10]), .A1N(load), .Y(n37) );
  OAI2BB2XLTS U21 ( .B0(n12), .B1(n23), .A0N(D[11]), .A1N(load), .Y(n38) );
  OAI2BB2XLTS U22 ( .B0(n13), .B1(n23), .A0N(D[12]), .A1N(load), .Y(n39) );
  OAI2BB2XLTS U23 ( .B0(n14), .B1(n23), .A0N(D[13]), .A1N(load), .Y(n40) );
  OAI2BB2XLTS U24 ( .B0(n1), .B1(n23), .A0N(n21), .A1N(D[0]), .Y(n27) );
  OAI2BB2XLTS U25 ( .B0(n2), .B1(n24), .A0N(D[1]), .A1N(n21), .Y(n28) );
  OAI2BB2XLTS U26 ( .B0(n3), .B1(n24), .A0N(D[2]), .A1N(n21), .Y(n29) );
  OAI2BB2XLTS U27 ( .B0(n4), .B1(n24), .A0N(D[3]), .A1N(load), .Y(n30) );
  OAI2BB2XLTS U28 ( .B0(n5), .B1(n24), .A0N(D[4]), .A1N(n21), .Y(n31) );
  OAI2BB2XLTS U29 ( .B0(n6), .B1(n24), .A0N(D[5]), .A1N(n22), .Y(n32) );
  OAI2BB2XLTS U30 ( .B0(n8), .B1(n24), .A0N(D[7]), .A1N(n22), .Y(n34) );
  OAI2BB2XLTS U31 ( .B0(n9), .B1(n23), .A0N(D[8]), .A1N(n22), .Y(n35) );
  CLKBUFX2TS U32 ( .A(load), .Y(n21) );
  CLKBUFX2TS U33 ( .A(load), .Y(n22) );
  INVX2TS U34 ( .A(rst), .Y(n59) );
endmodule


module RegisterAdd_W1 ( clk, rst, load, D, Q );
  input [0:0] D;
  output [0:0] Q;
  input clk, rst, load;
  wire   n3, n2;

  DFFRX2TS \Q_reg[0]  ( .D(n3), .CK(clk), .RN(n2), .Q(Q[0]) );
  CLKMX2X2TS U2 ( .A(Q[0]), .B(D[0]), .S0(load), .Y(n3) );
  INVX2TS U3 ( .A(rst), .Y(n2) );
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

