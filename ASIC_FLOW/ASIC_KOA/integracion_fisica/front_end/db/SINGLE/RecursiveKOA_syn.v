/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : L-2016.03-SP3
// Date      : Wed Oct 26 18:11:22 2016
/////////////////////////////////////////////////////////////


module RegisterAdd_W48 ( clk, rst, load, D, Q );
  input [47:0] D;
  output [47:0] Q;
  input clk, rst, load;
  wire   n3, n5, n7, n9, n11, n13, n15, n17, n19, n21, n23, n25, n27, n29, n31,
         n33, n35, n37, n39, n41, n43, n45, n47, n49, n51, n53, n55, n57, n59,
         n61, n63, n65, n67, n69, n71, n73, n75, n77, n79, n81, n83, n85, n87,
         n89, n91, n93, n95, n97, n1, n2, n4, n6, n8, n10, n12, n14, n16, n18,
         n20, n22, n24, n26, n28, n30;

  DFFRXLTS Q_reg_47_ ( .D(n97), .CK(clk), .RN(n22), .Q(Q[47]) );
  DFFRXLTS Q_reg_46_ ( .D(n95), .CK(clk), .RN(n22), .Q(Q[46]) );
  DFFRXLTS Q_reg_45_ ( .D(n93), .CK(clk), .RN(n22), .Q(Q[45]) );
  DFFRXLTS Q_reg_44_ ( .D(n91), .CK(clk), .RN(n22), .Q(Q[44]) );
  DFFRXLTS Q_reg_43_ ( .D(n89), .CK(clk), .RN(n22), .Q(Q[43]) );
  DFFRXLTS Q_reg_42_ ( .D(n87), .CK(clk), .RN(n22), .Q(Q[42]) );
  DFFRXLTS Q_reg_41_ ( .D(n85), .CK(clk), .RN(n22), .Q(Q[41]) );
  DFFRXLTS Q_reg_40_ ( .D(n83), .CK(clk), .RN(n22), .Q(Q[40]) );
  DFFRXLTS Q_reg_39_ ( .D(n81), .CK(clk), .RN(n22), .Q(Q[39]) );
  DFFRXLTS Q_reg_38_ ( .D(n79), .CK(clk), .RN(n24), .Q(Q[38]) );
  DFFRXLTS Q_reg_37_ ( .D(n77), .CK(clk), .RN(n24), .Q(Q[37]) );
  DFFRXLTS Q_reg_36_ ( .D(n75), .CK(clk), .RN(n24), .Q(Q[36]) );
  DFFRXLTS Q_reg_35_ ( .D(n73), .CK(clk), .RN(n24), .Q(Q[35]) );
  DFFRXLTS Q_reg_34_ ( .D(n71), .CK(clk), .RN(n24), .Q(Q[34]) );
  DFFRXLTS Q_reg_33_ ( .D(n69), .CK(clk), .RN(n24), .Q(Q[33]) );
  DFFRXLTS Q_reg_32_ ( .D(n67), .CK(clk), .RN(n24), .Q(Q[32]) );
  DFFRXLTS Q_reg_31_ ( .D(n65), .CK(clk), .RN(n24), .Q(Q[31]) );
  DFFRXLTS Q_reg_30_ ( .D(n63), .CK(clk), .RN(n24), .Q(Q[30]) );
  DFFRXLTS Q_reg_29_ ( .D(n61), .CK(clk), .RN(n24), .Q(Q[29]) );
  DFFRXLTS Q_reg_28_ ( .D(n59), .CK(clk), .RN(n26), .Q(Q[28]) );
  DFFRXLTS Q_reg_27_ ( .D(n57), .CK(clk), .RN(n26), .Q(Q[27]) );
  DFFRXLTS Q_reg_26_ ( .D(n55), .CK(clk), .RN(n26), .Q(Q[26]) );
  DFFRXLTS Q_reg_25_ ( .D(n53), .CK(clk), .RN(n26), .Q(Q[25]) );
  DFFRXLTS Q_reg_24_ ( .D(n51), .CK(clk), .RN(n26), .Q(Q[24]) );
  DFFRXLTS Q_reg_23_ ( .D(n49), .CK(clk), .RN(n26), .Q(Q[23]) );
  DFFRXLTS Q_reg_22_ ( .D(n47), .CK(clk), .RN(n26), .Q(Q[22]) );
  DFFRXLTS Q_reg_21_ ( .D(n45), .CK(clk), .RN(n26), .Q(Q[21]) );
  DFFRXLTS Q_reg_20_ ( .D(n43), .CK(clk), .RN(n26), .Q(Q[20]) );
  DFFRXLTS Q_reg_19_ ( .D(n41), .CK(clk), .RN(n26), .Q(Q[19]) );
  DFFRXLTS Q_reg_18_ ( .D(n39), .CK(clk), .RN(n28), .Q(Q[18]) );
  DFFRXLTS Q_reg_17_ ( .D(n37), .CK(clk), .RN(n28), .Q(Q[17]) );
  DFFRXLTS Q_reg_16_ ( .D(n35), .CK(clk), .RN(n28), .Q(Q[16]) );
  DFFRXLTS Q_reg_15_ ( .D(n33), .CK(clk), .RN(n28), .Q(Q[15]) );
  DFFRXLTS Q_reg_14_ ( .D(n31), .CK(clk), .RN(n28), .Q(Q[14]) );
  DFFRXLTS Q_reg_13_ ( .D(n29), .CK(clk), .RN(n28), .Q(Q[13]) );
  DFFRXLTS Q_reg_12_ ( .D(n27), .CK(clk), .RN(n28), .Q(Q[12]) );
  DFFRXLTS Q_reg_11_ ( .D(n25), .CK(clk), .RN(n28), .Q(Q[11]) );
  DFFRXLTS Q_reg_10_ ( .D(n23), .CK(clk), .RN(n28), .Q(Q[10]) );
  DFFRXLTS Q_reg_9_ ( .D(n21), .CK(clk), .RN(n28), .Q(Q[9]) );
  DFFRXLTS Q_reg_8_ ( .D(n19), .CK(clk), .RN(n30), .Q(Q[8]) );
  DFFRXLTS Q_reg_7_ ( .D(n17), .CK(clk), .RN(n30), .Q(Q[7]) );
  DFFRXLTS Q_reg_6_ ( .D(n15), .CK(clk), .RN(n30), .Q(Q[6]) );
  DFFRXLTS Q_reg_5_ ( .D(n13), .CK(clk), .RN(n30), .Q(Q[5]) );
  DFFRXLTS Q_reg_4_ ( .D(n11), .CK(clk), .RN(n30), .Q(Q[4]) );
  DFFRXLTS Q_reg_3_ ( .D(n9), .CK(clk), .RN(n30), .Q(Q[3]) );
  DFFRXLTS Q_reg_2_ ( .D(n7), .CK(clk), .RN(n30), .Q(Q[2]) );
  DFFRXLTS Q_reg_1_ ( .D(n5), .CK(clk), .RN(n30), .Q(Q[1]) );
  DFFRXLTS Q_reg_0_ ( .D(n3), .CK(clk), .RN(n22), .Q(Q[0]) );
  AO22XLTS U2 ( .A0(load), .A1(D[0]), .B0(n20), .B1(Q[0]), .Y(n3) );
  AO22XLTS U3 ( .A0(load), .A1(D[1]), .B0(n20), .B1(Q[1]), .Y(n5) );
  AO22XLTS U4 ( .A0(load), .A1(D[2]), .B0(n20), .B1(Q[2]), .Y(n7) );
  AO22XLTS U5 ( .A0(load), .A1(D[3]), .B0(n20), .B1(Q[3]), .Y(n9) );
  AO22XLTS U6 ( .A0(load), .A1(D[4]), .B0(n18), .B1(Q[4]), .Y(n11) );
  AO22XLTS U7 ( .A0(load), .A1(D[5]), .B0(n18), .B1(Q[5]), .Y(n13) );
  AO22XLTS U8 ( .A0(load), .A1(D[6]), .B0(n18), .B1(Q[6]), .Y(n15) );
  AO22XLTS U9 ( .A0(load), .A1(D[7]), .B0(n16), .B1(Q[7]), .Y(n17) );
  AO22XLTS U10 ( .A0(n14), .A1(D[8]), .B0(n16), .B1(Q[8]), .Y(n19) );
  AO22XLTS U11 ( .A0(n14), .A1(D[9]), .B0(n16), .B1(Q[9]), .Y(n21) );
  AO22XLTS U12 ( .A0(n14), .A1(D[10]), .B0(n16), .B1(Q[10]), .Y(n23) );
  AO22XLTS U13 ( .A0(n14), .A1(D[11]), .B0(n16), .B1(Q[11]), .Y(n25) );
  AO22XLTS U14 ( .A0(n14), .A1(D[12]), .B0(n16), .B1(Q[12]), .Y(n27) );
  AO22XLTS U15 ( .A0(n14), .A1(D[13]), .B0(n16), .B1(Q[13]), .Y(n29) );
  AO22XLTS U16 ( .A0(n14), .A1(D[14]), .B0(n16), .B1(Q[14]), .Y(n31) );
  AO22XLTS U17 ( .A0(n14), .A1(D[15]), .B0(n16), .B1(Q[15]), .Y(n33) );
  AO22XLTS U18 ( .A0(n14), .A1(D[16]), .B0(n16), .B1(Q[16]), .Y(n35) );
  AO22XLTS U19 ( .A0(n14), .A1(D[17]), .B0(n12), .B1(Q[17]), .Y(n37) );
  AO22XLTS U20 ( .A0(n10), .A1(D[18]), .B0(n12), .B1(Q[18]), .Y(n39) );
  AO22XLTS U21 ( .A0(n10), .A1(D[19]), .B0(n12), .B1(Q[19]), .Y(n41) );
  AO22XLTS U22 ( .A0(n10), .A1(D[20]), .B0(n12), .B1(Q[20]), .Y(n43) );
  AO22XLTS U23 ( .A0(n10), .A1(D[21]), .B0(n12), .B1(Q[21]), .Y(n45) );
  AO22XLTS U24 ( .A0(n10), .A1(D[22]), .B0(n12), .B1(Q[22]), .Y(n47) );
  AO22XLTS U25 ( .A0(n10), .A1(D[23]), .B0(n12), .B1(Q[23]), .Y(n49) );
  AO22XLTS U26 ( .A0(n10), .A1(D[24]), .B0(n12), .B1(Q[24]), .Y(n51) );
  AO22XLTS U27 ( .A0(n10), .A1(D[25]), .B0(n12), .B1(Q[25]), .Y(n53) );
  AO22XLTS U28 ( .A0(n10), .A1(D[26]), .B0(n12), .B1(Q[26]), .Y(n55) );
  AO22XLTS U29 ( .A0(n10), .A1(D[27]), .B0(n8), .B1(Q[27]), .Y(n57) );
  AO22XLTS U30 ( .A0(n6), .A1(D[28]), .B0(n8), .B1(Q[28]), .Y(n59) );
  AO22XLTS U31 ( .A0(n6), .A1(D[29]), .B0(n8), .B1(Q[29]), .Y(n61) );
  AO22XLTS U32 ( .A0(n6), .A1(D[30]), .B0(n8), .B1(Q[30]), .Y(n63) );
  AO22XLTS U33 ( .A0(n6), .A1(D[31]), .B0(n8), .B1(Q[31]), .Y(n65) );
  AO22XLTS U34 ( .A0(n6), .A1(D[32]), .B0(n8), .B1(Q[32]), .Y(n67) );
  AO22XLTS U35 ( .A0(n6), .A1(D[33]), .B0(n8), .B1(Q[33]), .Y(n69) );
  AO22XLTS U36 ( .A0(n6), .A1(D[34]), .B0(n8), .B1(Q[34]), .Y(n71) );
  AO22XLTS U37 ( .A0(n6), .A1(D[35]), .B0(n8), .B1(Q[35]), .Y(n73) );
  AO22XLTS U38 ( .A0(n6), .A1(D[36]), .B0(n8), .B1(Q[36]), .Y(n75) );
  AO22XLTS U39 ( .A0(n6), .A1(D[37]), .B0(n4), .B1(Q[37]), .Y(n77) );
  AO22XLTS U40 ( .A0(n2), .A1(D[38]), .B0(n4), .B1(Q[38]), .Y(n79) );
  AO22XLTS U41 ( .A0(n2), .A1(D[39]), .B0(n4), .B1(Q[39]), .Y(n81) );
  AO22XLTS U42 ( .A0(n2), .A1(D[40]), .B0(n4), .B1(Q[40]), .Y(n83) );
  AO22XLTS U43 ( .A0(n2), .A1(D[41]), .B0(n4), .B1(Q[41]), .Y(n85) );
  AO22XLTS U44 ( .A0(n2), .A1(D[42]), .B0(n4), .B1(Q[42]), .Y(n87) );
  AO22XLTS U45 ( .A0(n2), .A1(D[43]), .B0(n4), .B1(Q[43]), .Y(n89) );
  AO22XLTS U46 ( .A0(n2), .A1(D[44]), .B0(n4), .B1(Q[44]), .Y(n91) );
  AO22XLTS U47 ( .A0(n2), .A1(D[45]), .B0(n20), .B1(Q[45]), .Y(n93) );
  AO22XLTS U48 ( .A0(n2), .A1(D[46]), .B0(n20), .B1(Q[46]), .Y(n95) );
  AO22XLTS U49 ( .A0(n2), .A1(D[47]), .B0(n20), .B1(Q[47]), .Y(n97) );
  INVX2TS U50 ( .A(rst), .Y(n1) );
  CLKBUFX2TS U51 ( .A(n1), .Y(n30) );
  CLKBUFX2TS U52 ( .A(n1), .Y(n22) );
  CLKBUFX2TS U53 ( .A(n1), .Y(n28) );
  CLKBUFX2TS U54 ( .A(n1), .Y(n26) );
  CLKBUFX2TS U55 ( .A(n1), .Y(n24) );
  INVX2TS U56 ( .A(load), .Y(n18) );
  CLKBUFX2TS U57 ( .A(n18), .Y(n4) );
  INVX2TS U58 ( .A(n4), .Y(n2) );
  CLKBUFX2TS U59 ( .A(n18), .Y(n20) );
  INVX2TS U60 ( .A(n4), .Y(n6) );
  CLKBUFX2TS U61 ( .A(n18), .Y(n8) );
  INVX2TS U62 ( .A(n20), .Y(n10) );
  CLKBUFX2TS U63 ( .A(n18), .Y(n12) );
  INVX2TS U64 ( .A(n20), .Y(n14) );
  CLKBUFX2TS U65 ( .A(n18), .Y(n16) );
initial $sdf_annotate("RecursiveKOA_syn.sdf"); 
 endmodule


module RecursiveKOA_SW24 ( clk, rst, load_b_i, Data_A_i, Data_B_i, 
        sgf_result_o );
  input [23:0] Data_A_i;
  input [23:0] Data_B_i;
  output [47:0] sgf_result_o;
  input clk, rst, load_b_i;

  wire   [47:0] Result;

  Simple_KOA main_KOA ( .Data_A_i(Data_A_i), .Data_B_i(Data_B_i), 
        .sgf_result_o(Result) );
  RegisterAdd_W48 finalreg ( .clk(clk), .rst(rst), .load(load_b_i), .D(Result), 
        .Q(sgf_result_o) );
initial $sdf_annotate("RecursiveKOA_syn.sdf"); 
 endmodule

