/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : L-2016.03-SP3
// Date      : Mon Oct 17 14:51:59 2016
/////////////////////////////////////////////////////////////


module Priority_Codec_32 ( Data_Dec_i, Data_Bin_o );
  input [25:0] Data_Dec_i;
  output [4:0] Data_Bin_o;
  wire   n1, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59;

  NOR2X1TS U3 ( .A(n17), .B(n40), .Y(n34) );
  NOR2X1TS U4 ( .A(n11), .B(n12), .Y(n44) );
  INVX2TS U5 ( .A(n43), .Y(n5) );
  INVX2TS U6 ( .A(n51), .Y(n6) );
  INVX2TS U7 ( .A(n50), .Y(n3) );
  INVX2TS U8 ( .A(n46), .Y(n9) );
  INVX2TS U9 ( .A(n57), .Y(n8) );
  INVX2TS U10 ( .A(n38), .Y(n7) );
  NAND3BX1TS U11 ( .AN(n35), .B(n34), .C(Data_Dec_i[3]), .Y(n50) );
  NAND3BX1TS U12 ( .AN(n36), .B(Data_Dec_i[11]), .C(Data_Dec_i[12]), .Y(n51)
         );
  NAND3BX1TS U13 ( .AN(n37), .B(n7), .C(Data_Dec_i[13]), .Y(n36) );
  NOR3BX1TS U14 ( .AN(n34), .B(n35), .C(Data_Dec_i[3]), .Y(n19) );
  NOR3BX1TS U15 ( .AN(Data_Dec_i[12]), .B(n36), .C(Data_Dec_i[11]), .Y(n25) );
  NAND3BX1TS U16 ( .AN(Data_Dec_i[1]), .B(n3), .C(Data_Dec_i[2]), .Y(n20) );
  NAND3X1TS U17 ( .A(Data_Dec_i[10]), .B(n6), .C(Data_Dec_i[9]), .Y(n43) );
  NAND3X1TS U18 ( .A(Data_Dec_i[17]), .B(n9), .C(Data_Dec_i[18]), .Y(n57) );
  NAND3X1TS U19 ( .A(Data_Dec_i[7]), .B(n5), .C(Data_Dec_i[8]), .Y(n40) );
  OAI211X1TS U20 ( .A0(n54), .A1(n40), .B0(n39), .C0(n55), .Y(n24) );
  AOI21X1TS U21 ( .A0(Data_Dec_i[5]), .A1(n18), .B0(n17), .Y(n54) );
  AOI2BB2X1TS U22 ( .B0(n5), .B1(n16), .A0N(n50), .A1N(Data_Dec_i[2]), .Y(n55)
         );
  INVX2TS U23 ( .A(Data_Dec_i[4]), .Y(n18) );
  NAND2X1TS U24 ( .A(Data_Dec_i[19]), .B(n49), .Y(n46) );
  INVX2TS U25 ( .A(n52), .Y(Data_Bin_o[0]) );
  NOR3BX1TS U26 ( .AN(n53), .B(n29), .C(n24), .Y(n52) );
  AOI2BB2X1TS U27 ( .B0(Data_Dec_i[25]), .B1(n58), .A0N(n46), .A1N(
        Data_Dec_i[18]), .Y(n53) );
  OAI211X1TS U28 ( .A0(Data_Dec_i[6]), .A1(n40), .B0(n4), .C0(n41), .Y(
        Data_Bin_o[1]) );
  AOI21X1TS U29 ( .A0(n7), .A1(n37), .B0(n42), .Y(n41) );
  OAI33XLTS U30 ( .A0(n16), .A1(Data_Dec_i[7]), .A2(n43), .B0(n1), .B1(n44), 
        .B2(n10), .Y(n42) );
  NAND4BX1TS U31 ( .AN(n30), .B(n31), .C(n4), .D(n32), .Y(Data_Bin_o[2]) );
  OAI2BB1X1TS U32 ( .A0N(Data_Dec_i[20]), .A1N(Data_Dec_i[21]), .B0(n33), .Y(
        n32) );
  AOI2BB2X1TS U33 ( .B0(n34), .B1(n35), .A0N(n36), .A1N(Data_Dec_i[12]), .Y(
        n31) );
  NAND4BX1TS U34 ( .AN(n25), .B(n20), .C(n26), .D(n27), .Y(Data_Bin_o[3]) );
  NAND3BX1TS U35 ( .AN(Data_Dec_i[17]), .B(n9), .C(Data_Dec_i[18]), .Y(n26) );
  AOI21X1TS U36 ( .A0(n8), .A1(n28), .B0(n29), .Y(n27) );
  NAND4BX1TS U37 ( .AN(n19), .B(n20), .C(n21), .D(n22), .Y(Data_Bin_o[4]) );
  NAND3BX1TS U38 ( .AN(Data_Dec_i[9]), .B(n6), .C(Data_Dec_i[10]), .Y(n21) );
  AOI21X1TS U39 ( .A0(n5), .A1(n23), .B0(n24), .Y(n22) );
  NAND2X1TS U40 ( .A(Data_Dec_i[16]), .B(n8), .Y(n38) );
  NAND3BX1TS U41 ( .AN(Data_Dec_i[0]), .B(n3), .C(Data_Dec_i[1]), .Y(n39) );
  AND3X2TS U42 ( .A(Data_Dec_i[20]), .B(n33), .C(Data_Dec_i[21]), .Y(n49) );
  AND3X2TS U43 ( .A(n44), .B(Data_Dec_i[24]), .C(Data_Dec_i[25]), .Y(n33) );
  OAI31X1TS U44 ( .A0(n37), .A1(Data_Dec_i[13]), .A2(n38), .B0(n39), .Y(n30)
         );
  INVX2TS U45 ( .A(Data_Dec_i[23]), .Y(n11) );
  INVX2TS U46 ( .A(Data_Dec_i[22]), .Y(n12) );
  INVX2TS U47 ( .A(n45), .Y(n4) );
  OAI211X1TS U48 ( .A0(Data_Dec_i[18]), .A1(n46), .B0(n47), .C0(n48), .Y(n45)
         );
  OA22X1TS U49 ( .A0(n50), .A1(Data_Dec_i[2]), .B0(n51), .B1(Data_Dec_i[10]), 
        .Y(n47) );
  AOI211X1TS U50 ( .A0(n49), .A1(n14), .B0(n19), .C0(n25), .Y(n48) );
  OAI222X1TS U51 ( .A0(Data_Dec_i[10]), .A1(n51), .B0(n56), .B1(n57), .C0(
        Data_Dec_i[12]), .C1(n36), .Y(n29) );
  OA21XLTS U52 ( .A0(n15), .A1(Data_Dec_i[14]), .B0(Data_Dec_i[16]), .Y(n56)
         );
  INVX2TS U53 ( .A(Data_Dec_i[15]), .Y(n15) );
  NAND2X1TS U54 ( .A(Data_Dec_i[15]), .B(Data_Dec_i[14]), .Y(n37) );
  INVX2TS U55 ( .A(Data_Dec_i[6]), .Y(n17) );
  OAI21X1TS U56 ( .A0(n59), .A1(n11), .B0(Data_Dec_i[24]), .Y(n58) );
  AOI21X1TS U57 ( .A0(Data_Dec_i[21]), .A1(n13), .B0(n12), .Y(n59) );
  INVX2TS U58 ( .A(Data_Dec_i[20]), .Y(n13) );
  NAND2X1TS U59 ( .A(Data_Dec_i[5]), .B(Data_Dec_i[4]), .Y(n35) );
  INVX2TS U60 ( .A(Data_Dec_i[8]), .Y(n16) );
  INVX2TS U61 ( .A(Data_Dec_i[25]), .Y(n1) );
  INVX2TS U62 ( .A(Data_Dec_i[24]), .Y(n10) );
  INVX2TS U63 ( .A(Data_Dec_i[19]), .Y(n14) );
  NAND2X1TS U64 ( .A(Data_Dec_i[13]), .B(Data_Dec_i[15]), .Y(n28) );
  NAND2X1TS U65 ( .A(Data_Dec_i[5]), .B(Data_Dec_i[7]), .Y(n23) );
endmodule


module RegisterAdd_W5 ( clk, rst, load, D, Q );
  input [4:0] D;
  output [4:0] Q;
  input clk, rst, load;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n11, n16;

  DFFRX2TS \Q_reg[4]  ( .D(n11), .CK(clk), .RN(n16), .Q(Q[4]), .QN(n5) );
  DFFRX2TS \Q_reg[3]  ( .D(n9), .CK(clk), .RN(n16), .Q(Q[3]), .QN(n4) );
  DFFRX2TS \Q_reg[2]  ( .D(n8), .CK(clk), .RN(n16), .Q(Q[2]), .QN(n3) );
  DFFRX2TS \Q_reg[1]  ( .D(n7), .CK(clk), .RN(n16), .Q(Q[1]), .QN(n2) );
  DFFRX2TS \Q_reg[0]  ( .D(n6), .CK(clk), .RN(n16), .Q(Q[0]), .QN(n1) );
  OAI2BB2XLTS U2 ( .B0(n1), .B1(load), .A0N(D[0]), .A1N(load), .Y(n6) );
  OAI2BB2XLTS U3 ( .B0(n2), .B1(load), .A0N(D[1]), .A1N(load), .Y(n7) );
  OAI2BB2XLTS U4 ( .B0(n3), .B1(load), .A0N(D[2]), .A1N(load), .Y(n8) );
  OAI2BB2XLTS U5 ( .B0(n4), .B1(load), .A0N(load), .A1N(D[3]), .Y(n9) );
  OAI2BB2XLTS U6 ( .B0(n5), .B1(load), .A0N(D[4]), .A1N(load), .Y(n11) );
  INVX2TS U7 ( .A(rst), .Y(n16) );
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

