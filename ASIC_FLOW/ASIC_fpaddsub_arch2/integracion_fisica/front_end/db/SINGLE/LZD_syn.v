/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : L-2016.03-SP3
// Date      : Mon Oct 17 14:51:22 2016
/////////////////////////////////////////////////////////////


module Priority_Codec_32 ( Data_Dec_i, Data_Bin_o );
  input [25:0] Data_Dec_i;
  output [4:0] Data_Bin_o;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57;

  OAI33XLTS U3 ( .A0(n8), .A1(Data_Dec_i[15]), .A2(n43), .B0(n11), .B1(
        Data_Dec_i[7]), .B2(n19), .Y(n42) );
  NOR2BX1TS U4 ( .AN(n47), .B(n7), .Y(n25) );
  NAND4BX1TS U5 ( .AN(n44), .B(n20), .C(n45), .D(n46), .Y(n27) );
  AOI211X1TS U6 ( .A0(n47), .A1(n7), .B0(n2), .C0(n48), .Y(n46) );
  INVX2TS U7 ( .A(n18), .Y(n2) );
  NOR2X1TS U8 ( .A(n4), .B(n5), .Y(n51) );
  INVX2TS U9 ( .A(n43), .Y(n3) );
  NAND2X1TS U10 ( .A(n17), .B(n18), .Y(n16) );
  NOR2BX1TS U11 ( .AN(n49), .B(Data_Dec_i[4]), .Y(n32) );
  NOR3BX1TS U12 ( .AN(Data_Dec_i[13]), .B(n33), .C(n9), .Y(n50) );
  NOR2BX1TS U13 ( .AN(n26), .B(Data_Dec_i[2]), .Y(n48) );
  NOR3BX1TS U14 ( .AN(Data_Dec_i[7]), .B(n19), .C(n11), .Y(n35) );
  NAND3BX1TS U15 ( .AN(n24), .B(n1), .C(n52), .Y(Data_Bin_o[0]) );
  AOI21X1TS U16 ( .A0(Data_Dec_i[25]), .A1(n53), .B0(n44), .Y(n52) );
  OAI21X1TS U17 ( .A0(n54), .A1(n4), .B0(Data_Dec_i[24]), .Y(n53) );
  NAND4BBX1TS U18 ( .AN(n38), .BN(n39), .C(n40), .D(n41), .Y(Data_Bin_o[1]) );
  NAND3BX1TS U19 ( .AN(n51), .B(Data_Dec_i[24]), .C(Data_Dec_i[25]), .Y(n40)
         );
  NOR2X1TS U20 ( .A(n27), .B(n42), .Y(n41) );
  NAND3BX1TS U21 ( .AN(n27), .B(n28), .C(n29), .Y(Data_Bin_o[2]) );
  AOI31X1TS U22 ( .A0(n35), .A1(n12), .A2(Data_Dec_i[6]), .B0(n36), .Y(n28) );
  NOR3X1TS U23 ( .A(n30), .B(n31), .C(n32), .Y(n29) );
  NAND3X1TS U24 ( .A(n1), .B(n13), .C(n14), .Y(Data_Bin_o[4]) );
  AO21X1TS U25 ( .A0(Data_Dec_i[7]), .A1(Data_Dec_i[5]), .B0(n19), .Y(n13) );
  AOI31X1TS U26 ( .A0(n15), .A1(n10), .A2(Data_Dec_i[10]), .B0(n16), .Y(n14)
         );
  NOR3BX1TS U27 ( .AN(Data_Dec_i[21]), .B(n6), .C(n37), .Y(n47) );
  NAND3X1TS U28 ( .A(Data_Dec_i[15]), .B(n3), .C(Data_Dec_i[16]), .Y(n33) );
  NAND3X1TS U29 ( .A(Data_Dec_i[17]), .B(n25), .C(Data_Dec_i[18]), .Y(n43) );
  INVX2TS U30 ( .A(n55), .Y(n1) );
  OAI211X1TS U31 ( .A0(Data_Dec_i[8]), .A1(n19), .B0(n34), .C0(n56), .Y(n55)
         );
  NOR3X1TS U32 ( .A(n48), .B(n38), .C(n32), .Y(n56) );
  NAND3X1TS U33 ( .A(Data_Dec_i[24]), .B(n51), .C(Data_Dec_i[25]), .Y(n37) );
  AND3X2TS U34 ( .A(Data_Dec_i[11]), .B(n50), .C(Data_Dec_i[12]), .Y(n15) );
  NAND3X1TS U35 ( .A(Data_Dec_i[10]), .B(n15), .C(Data_Dec_i[9]), .Y(n19) );
  AND3X2TS U36 ( .A(Data_Dec_i[4]), .B(n49), .C(Data_Dec_i[3]), .Y(n26) );
  AND3X2TS U37 ( .A(Data_Dec_i[5]), .B(n35), .C(Data_Dec_i[6]), .Y(n49) );
  INVX2TS U38 ( .A(Data_Dec_i[23]), .Y(n4) );
  INVX2TS U39 ( .A(Data_Dec_i[22]), .Y(n5) );
  NOR2BX1TS U40 ( .AN(n50), .B(Data_Dec_i[12]), .Y(n31) );
  NAND3BX1TS U41 ( .AN(Data_Dec_i[1]), .B(n26), .C(Data_Dec_i[2]), .Y(n17) );
  NAND3BX1TS U42 ( .AN(Data_Dec_i[3]), .B(n49), .C(Data_Dec_i[4]), .Y(n18) );
  NOR2BX1TS U43 ( .AN(n35), .B(Data_Dec_i[6]), .Y(n38) );
  NAND4X1TS U44 ( .A(n17), .B(n20), .C(n21), .D(n22), .Y(Data_Bin_o[3]) );
  NAND3BX1TS U45 ( .AN(Data_Dec_i[17]), .B(n25), .C(Data_Dec_i[18]), .Y(n21)
         );
  AOI21X1TS U46 ( .A0(n3), .A1(n23), .B0(n24), .Y(n22) );
  OAI31X1TS U47 ( .A0(n9), .A1(Data_Dec_i[13]), .A2(n33), .B0(n34), .Y(n30) );
  INVX2TS U48 ( .A(Data_Dec_i[16]), .Y(n8) );
  NAND2BX1TS U49 ( .AN(Data_Dec_i[10]), .B(n15), .Y(n45) );
  NAND3BX1TS U50 ( .AN(Data_Dec_i[0]), .B(n26), .C(Data_Dec_i[1]), .Y(n34) );
  OAI211X1TS U51 ( .A0(Data_Dec_i[16]), .A1(n43), .B0(n45), .C0(n57), .Y(n24)
         );
  NOR2X1TS U52 ( .A(n39), .B(n31), .Y(n57) );
  INVX2TS U53 ( .A(Data_Dec_i[20]), .Y(n6) );
  INVX2TS U54 ( .A(Data_Dec_i[14]), .Y(n9) );
  INVX2TS U55 ( .A(Data_Dec_i[19]), .Y(n7) );
  NAND3BX1TS U56 ( .AN(Data_Dec_i[11]), .B(n50), .C(Data_Dec_i[12]), .Y(n20)
         );
  NOR2BX1TS U57 ( .AN(n25), .B(Data_Dec_i[18]), .Y(n44) );
  NOR2X1TS U58 ( .A(n33), .B(Data_Dec_i[14]), .Y(n39) );
  INVX2TS U59 ( .A(Data_Dec_i[8]), .Y(n11) );
  AOI21X1TS U60 ( .A0(Data_Dec_i[21]), .A1(n6), .B0(n5), .Y(n54) );
  AOI21X1TS U61 ( .A0(Data_Dec_i[21]), .A1(Data_Dec_i[20]), .B0(n37), .Y(n36)
         );
  NAND2X1TS U62 ( .A(Data_Dec_i[13]), .B(Data_Dec_i[15]), .Y(n23) );
  INVX2TS U63 ( .A(Data_Dec_i[9]), .Y(n10) );
  INVX2TS U64 ( .A(Data_Dec_i[5]), .Y(n12) );
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

