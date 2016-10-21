/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : L-2016.03-SP3
// Date      : Wed Oct 19 14:29:52 2016
/////////////////////////////////////////////////////////////


module Priority_Codec_32 ( Data_Dec_i, Data_Bin_o );
  input [25:0] Data_Dec_i;
  output [4:0] Data_Bin_o;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50;

  NOR3BX1TS U3 ( .AN(n25), .B(Data_Dec_i[18]), .C(n6), .Y(n31) );
  NOR3BX1TS U4 ( .AN(n39), .B(Data_Dec_i[10]), .C(Data_Dec_i[11]), .Y(
        Data_Bin_o[4]) );
  INVX2TS U5 ( .A(n31), .Y(n5) );
  AOI31X1TS U6 ( .A0(n7), .A1(n1), .A2(n40), .B0(n41), .Y(n34) );
  INVX2TS U7 ( .A(Data_Bin_o[4]), .Y(n4) );
  INVX2TS U8 ( .A(n42), .Y(n6) );
  INVX2TS U9 ( .A(n16), .Y(n3) );
  NOR2X1TS U10 ( .A(n22), .B(n23), .Y(n21) );
  NOR4BX1TS U11 ( .AN(n13), .B(n5), .C(Data_Dec_i[13]), .D(Data_Dec_i[14]), 
        .Y(n50) );
  NOR3X1TS U12 ( .A(Data_Dec_i[24]), .B(Data_Dec_i[25]), .C(n40), .Y(n42) );
  NOR4BX1TS U13 ( .AN(n24), .B(n4), .C(Data_Dec_i[5]), .D(Data_Dec_i[6]), .Y(
        n49) );
  NOR2BX1TS U14 ( .AN(n50), .B(Data_Dec_i[12]), .Y(n39) );
  NAND2BX1TS U15 ( .AN(Data_Dec_i[3]), .B(n38), .Y(n16) );
  NAND4X1TS U16 ( .A(n32), .B(n33), .C(n34), .D(n35), .Y(Data_Bin_o[1]) );
  NAND4BX1TS U17 ( .AN(Data_Dec_i[21]), .B(Data_Dec_i[19]), .C(n42), .D(n9), 
        .Y(n32) );
  NAND4BX1TS U18 ( .AN(Data_Dec_i[17]), .B(Data_Dec_i[15]), .C(n31), .D(n10), 
        .Y(n33) );
  NOR2BX1TS U19 ( .AN(n49), .B(Data_Dec_i[4]), .Y(n38) );
  NAND2BX1TS U20 ( .AN(Data_Dec_i[23]), .B(n8), .Y(n40) );
  NAND2X1TS U21 ( .A(Data_Dec_i[2]), .B(n3), .Y(n20) );
  NAND4X1TS U22 ( .A(n26), .B(n28), .C(n48), .D(n17), .Y(n41) );
  AOI31X1TS U23 ( .A0(Data_Bin_o[4]), .A1(n24), .A2(Data_Dec_i[6]), .B0(n2), 
        .Y(n48) );
  INVX2TS U24 ( .A(n20), .Y(n2) );
  INVX2TS U25 ( .A(Data_Dec_i[22]), .Y(n8) );
  NOR4BX1TS U26 ( .AN(n29), .B(n36), .C(n23), .D(n37), .Y(n35) );
  NOR4BX1TS U27 ( .AN(Data_Dec_i[7]), .B(Data_Dec_i[9]), .C(Data_Dec_i[8]), 
        .D(n4), .Y(n37) );
  NOR3X1TS U28 ( .A(n16), .B(Data_Dec_i[1]), .C(Data_Dec_i[0]), .Y(n36) );
  NOR3X1TS U29 ( .A(Data_Dec_i[16]), .B(Data_Dec_i[17]), .C(Data_Dec_i[15]), 
        .Y(n13) );
  NOR3X1TS U30 ( .A(Data_Dec_i[20]), .B(Data_Dec_i[21]), .C(Data_Dec_i[19]), 
        .Y(n25) );
  NAND3BX1TS U31 ( .AN(n43), .B(n44), .C(n45), .Y(Data_Bin_o[0]) );
  OAI31X1TS U32 ( .A0(n4), .A1(Data_Dec_i[9]), .A2(n11), .B0(n30), .Y(n43) );
  AOI31X1TS U33 ( .A0(n3), .A1(n12), .A2(Data_Dec_i[0]), .B0(n22), .Y(n44) );
  NAND4BX1TS U34 ( .AN(n18), .B(n19), .C(n20), .D(n21), .Y(Data_Bin_o[2]) );
  NAND4BX1TS U35 ( .AN(Data_Dec_i[6]), .B(Data_Dec_i[5]), .C(Data_Bin_o[4]), 
        .D(n24), .Y(n19) );
  OAI211X1TS U36 ( .A0(n6), .A1(n25), .B0(n14), .C0(n26), .Y(n18) );
  OAI211X1TS U37 ( .A0(n13), .A1(n5), .B0(n14), .C0(n15), .Y(Data_Bin_o[3]) );
  OA21XLTS U38 ( .A0(n16), .A1(Data_Dec_i[2]), .B0(n17), .Y(n15) );
  AND2X2TS U39 ( .A(Data_Dec_i[3]), .B(n38), .Y(n23) );
  AND2X2TS U40 ( .A(Data_Dec_i[4]), .B(n49), .Y(n22) );
  AOI211X1TS U41 ( .A0(n46), .A1(n1), .B0(n47), .C0(n41), .Y(n45) );
  OAI21X1TS U42 ( .A0(Data_Dec_i[23]), .A1(n8), .B0(n7), .Y(n46) );
  OAI33XLTS U43 ( .A0(n9), .A1(Data_Dec_i[21]), .A2(n6), .B0(n10), .B1(
        Data_Dec_i[17]), .B2(n5), .Y(n47) );
  NAND3BX1TS U44 ( .AN(Data_Dec_i[11]), .B(n39), .C(Data_Dec_i[10]), .Y(n28)
         );
  NAND2X1TS U45 ( .A(Data_Dec_i[12]), .B(n50), .Y(n30) );
  NAND2X1TS U46 ( .A(Data_Dec_i[11]), .B(n39), .Y(n29) );
  AND4X1TS U47 ( .A(n27), .B(n28), .C(n29), .D(n30), .Y(n14) );
  NAND4BX1TS U48 ( .AN(Data_Dec_i[14]), .B(Data_Dec_i[13]), .C(n31), .D(n13), 
        .Y(n27) );
  NAND3X1TS U49 ( .A(n31), .B(n13), .C(Data_Dec_i[14]), .Y(n17) );
  NOR3X1TS U50 ( .A(Data_Dec_i[8]), .B(Data_Dec_i[9]), .C(Data_Dec_i[7]), .Y(
        n24) );
  NAND3X1TS U51 ( .A(n42), .B(n25), .C(Data_Dec_i[18]), .Y(n26) );
  INVX2TS U52 ( .A(Data_Dec_i[20]), .Y(n9) );
  INVX2TS U53 ( .A(Data_Dec_i[16]), .Y(n10) );
  INVX2TS U54 ( .A(Data_Dec_i[24]), .Y(n7) );
  INVX2TS U55 ( .A(Data_Dec_i[25]), .Y(n1) );
  INVX2TS U56 ( .A(Data_Dec_i[8]), .Y(n11) );
  INVX2TS U57 ( .A(Data_Dec_i[1]), .Y(n12) );
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
  CLKINVX1TS U6 ( .A(rst), .Y(n10) );
  OAI2BB2XLTS U7 ( .B0(n5), .B1(load), .A0N(D[4]), .A1N(load), .Y(n11) );
  DFFRX2TS \Q_reg[4]  ( .D(n11), .CK(clk), .RN(n10), .Q(Q[4]), .QN(n5) );
  DFFRX2TS \Q_reg[3]  ( .D(n9), .CK(clk), .RN(n10), .Q(Q[3]), .QN(n4) );
  DFFRX2TS \Q_reg[2]  ( .D(n8), .CK(clk), .RN(n10), .Q(Q[2]), .QN(n3) );
  DFFRX2TS \Q_reg[1]  ( .D(n7), .CK(clk), .RN(n10), .Q(Q[1]), .QN(n2) );
  DFFRX2TS \Q_reg[0]  ( .D(n6), .CK(clk), .RN(n10), .Q(Q[0]), .QN(n1) );
endmodule


module LZD ( clk, rst, load_i, Add_subt_result_i, Shift_Value_o );
  input [25:0] Add_subt_result_i;
  output [4:0] Shift_Value_o;
  input clk, rst, load_i;

  wire   [4:0] Codec_to_Reg;

  Priority_Codec_32 \LZD_SINGLEBLK.Codec_32  ( .Data_Dec_i(Add_subt_result_i), 
        .Data_Bin_o(Codec_to_Reg) );
  RegisterAdd_W5 Output_Reg ( .clk(clk), .rst(rst), .load(load_i), .D(
        Codec_to_Reg), .Q(Shift_Value_o) );
endmodule

