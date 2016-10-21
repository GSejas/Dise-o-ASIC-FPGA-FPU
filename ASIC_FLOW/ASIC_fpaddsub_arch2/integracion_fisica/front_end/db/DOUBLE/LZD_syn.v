/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : L-2016.03-SP3
// Date      : Wed Oct 19 14:30:29 2016
/////////////////////////////////////////////////////////////


module Priority_Codec_32 ( Data_Dec_i, Data_Bin_o );
  input [25:0] Data_Dec_i;
  output [4:0] Data_Bin_o;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52;

  NOR3X1TS U3 ( .A(Data_Dec_i[20]), .B(Data_Dec_i[21]), .C(Data_Dec_i[19]), 
        .Y(n28) );
  NOR4BX1TS U4 ( .AN(Data_Dec_i[3]), .B(Data_Dec_i[5]), .C(Data_Dec_i[4]), .D(
        n2), .Y(n35) );
  NOR4BX1TS U5 ( .AN(Data_Dec_i[7]), .B(Data_Dec_i[9]), .C(Data_Dec_i[8]), .D(
        n3), .Y(n38) );
  NOR4BX1TS U6 ( .AN(Data_Dec_i[15]), .B(Data_Dec_i[17]), .C(Data_Dec_i[16]), 
        .D(n21), .Y(n36) );
  NOR4BX1TS U7 ( .AN(Data_Dec_i[19]), .B(Data_Dec_i[21]), .C(Data_Dec_i[20]), 
        .D(n29), .Y(n37) );
  INVX2TS U8 ( .A(n21), .Y(n5) );
  INVX2TS U9 ( .A(n29), .Y(n6) );
  INVX2TS U10 ( .A(n42), .Y(n1) );
  NAND3X1TS U11 ( .A(n6), .B(n11), .C(n28), .Y(n21) );
  NAND3X1TS U12 ( .A(n8), .B(n7), .C(n41), .Y(n29) );
  NOR2X1TS U13 ( .A(n2), .B(n25), .Y(n42) );
  INVX2TS U14 ( .A(Data_Bin_o[4]), .Y(n3) );
  INVX2TS U15 ( .A(n24), .Y(n2) );
  INVX2TS U16 ( .A(n50), .Y(n13) );
  AOI21X1TS U17 ( .A0(n28), .A1(n11), .B0(n29), .Y(n27) );
  INVX2TS U18 ( .A(n31), .Y(n4) );
  NAND3BX1TS U19 ( .AN(Data_Dec_i[12]), .B(n20), .C(n5), .Y(n31) );
  NOR3X1TS U20 ( .A(Data_Dec_i[13]), .B(Data_Dec_i[14]), .C(n13), .Y(n20) );
  NOR3X1TS U21 ( .A(Data_Dec_i[10]), .B(Data_Dec_i[11]), .C(n31), .Y(
        Data_Bin_o[4]) );
  NOR3X1TS U22 ( .A(n52), .B(Data_Dec_i[6]), .C(n3), .Y(n24) );
  NOR3X1TS U23 ( .A(Data_Dec_i[16]), .B(Data_Dec_i[17]), .C(Data_Dec_i[15]), 
        .Y(n50) );
  NOR2X1TS U24 ( .A(Data_Dec_i[23]), .B(Data_Dec_i[22]), .Y(n41) );
  NAND2X1TS U25 ( .A(n48), .B(n49), .Y(n40) );
  AOI32X1TS U26 ( .A0(n28), .A1(n6), .A2(Data_Dec_i[18]), .B0(Data_Dec_i[2]), 
        .B1(n42), .Y(n48) );
  AOI31X1TS U27 ( .A0(n5), .A1(n50), .A2(Data_Dec_i[14]), .B0(n51), .Y(n49) );
  OAI33XLTS U28 ( .A0(n14), .A1(Data_Dec_i[11]), .A2(n31), .B0(n16), .B1(n52), 
        .B2(n3), .Y(n51) );
  NAND3BX1TS U29 ( .AN(n43), .B(n44), .C(n45), .Y(Data_Bin_o[0]) );
  AOI33X1TS U30 ( .A0(n42), .A1(n19), .A2(Data_Dec_i[0]), .B0(n5), .B1(n12), 
        .B2(Data_Dec_i[16]), .Y(n44) );
  OAI31X1TS U31 ( .A0(n2), .A1(Data_Dec_i[5]), .A2(n17), .B0(n32), .Y(n43) );
  NAND2X1TS U32 ( .A(n33), .B(n34), .Y(Data_Bin_o[1]) );
  NOR4XLTS U33 ( .A(n35), .B(n36), .C(n37), .D(n38), .Y(n34) );
  AOI211X1TS U34 ( .A0(Data_Dec_i[11]), .A1(n4), .B0(n39), .C0(n40), .Y(n33)
         );
  AOI211X1TS U35 ( .A0(n46), .A1(n7), .B0(n47), .C0(n40), .Y(n45) );
  OAI21X1TS U36 ( .A0(Data_Dec_i[23]), .A1(n9), .B0(n8), .Y(n46) );
  OAI33XLTS U37 ( .A0(n15), .A1(Data_Dec_i[9]), .A2(n3), .B0(n10), .B1(
        Data_Dec_i[21]), .B2(n29), .Y(n47) );
  INVX2TS U38 ( .A(Data_Dec_i[22]), .Y(n9) );
  OAI33XLTS U39 ( .A0(n1), .A1(Data_Dec_i[1]), .A2(Data_Dec_i[0]), .B0(n41), 
        .B1(Data_Dec_i[25]), .B2(Data_Dec_i[24]), .Y(n39) );
  INVX2TS U40 ( .A(Data_Dec_i[24]), .Y(n8) );
  INVX2TS U41 ( .A(Data_Dec_i[25]), .Y(n7) );
  OR3X1TS U42 ( .A(Data_Dec_i[8]), .B(Data_Dec_i[9]), .C(Data_Dec_i[7]), .Y(
        n52) );
  OAI211X1TS U43 ( .A0(n1), .A1(n18), .B0(n22), .C0(n23), .Y(Data_Bin_o[2]) );
  INVX2TS U44 ( .A(Data_Dec_i[2]), .Y(n18) );
  AOI211X1TS U45 ( .A0(n24), .A1(n25), .B0(n26), .C0(n27), .Y(n23) );
  OA21XLTS U46 ( .A0(n30), .A1(n31), .B0(n32), .Y(n22) );
  NOR2X1TS U47 ( .A(Data_Dec_i[10]), .B(Data_Dec_i[11]), .Y(n30) );
  OAI221XLTS U48 ( .A0(n20), .A1(n21), .B0(Data_Dec_i[2]), .B1(n1), .C0(n22), 
        .Y(Data_Bin_o[3]) );
  INVX2TS U49 ( .A(Data_Dec_i[18]), .Y(n11) );
  INVX2TS U50 ( .A(Data_Dec_i[10]), .Y(n14) );
  INVX2TS U51 ( .A(Data_Dec_i[6]), .Y(n16) );
  NOR4BX1TS U52 ( .AN(Data_Dec_i[13]), .B(Data_Dec_i[14]), .C(n13), .D(n21), 
        .Y(n26) );
  OR3X1TS U53 ( .A(Data_Dec_i[4]), .B(Data_Dec_i[5]), .C(Data_Dec_i[3]), .Y(
        n25) );
  NAND3X1TS U54 ( .A(n5), .B(n20), .C(Data_Dec_i[12]), .Y(n32) );
  INVX2TS U55 ( .A(Data_Dec_i[20]), .Y(n10) );
  INVX2TS U56 ( .A(Data_Dec_i[17]), .Y(n12) );
  INVX2TS U57 ( .A(Data_Dec_i[8]), .Y(n15) );
  INVX2TS U58 ( .A(Data_Dec_i[4]), .Y(n17) );
  INVX2TS U59 ( .A(Data_Dec_i[1]), .Y(n19) );
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

