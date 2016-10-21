/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : L-2016.03-SP3
// Date      : Wed Oct 19 14:30:25 2016
/////////////////////////////////////////////////////////////


module RegisterAdd_W32_1 ( clk, rst, load, D, Q );
  input [31:0] D;
  output [31:0] Q;
  input clk, rst, load;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n65, n97, n84, n85, n86, n87, n88, n89, n90,
         n91, n92, n93;

  DFFRX2TS \Q_reg[31]  ( .D(n65), .CK(clk), .RN(n84), .Q(Q[31]), .QN(n32) );
  DFFRX2TS \Q_reg[29]  ( .D(n62), .CK(clk), .RN(n84), .Q(Q[29]), .QN(n30) );
  DFFRX2TS \Q_reg[26]  ( .D(n59), .CK(clk), .RN(n84), .Q(Q[26]), .QN(n27) );
  DFFRX2TS \Q_reg[30]  ( .D(n63), .CK(clk), .RN(n84), .Q(Q[30]), .QN(n31) );
  DFFRX2TS \Q_reg[28]  ( .D(n61), .CK(clk), .RN(n84), .Q(Q[28]), .QN(n29) );
  DFFRX2TS \Q_reg[27]  ( .D(n60), .CK(clk), .RN(n84), .Q(Q[27]), .QN(n28) );
  DFFRX2TS \Q_reg[25]  ( .D(n58), .CK(clk), .RN(n84), .Q(Q[25]), .QN(n26) );
  DFFRX2TS \Q_reg[24]  ( .D(n57), .CK(clk), .RN(n84), .Q(Q[24]), .QN(n25) );
  DFFRX2TS \Q_reg[23]  ( .D(n56), .CK(clk), .RN(n84), .Q(Q[23]), .QN(n24) );
  DFFRX2TS \Q_reg[19]  ( .D(n52), .CK(clk), .RN(n85), .Q(Q[19]), .QN(n20) );
  DFFRX2TS \Q_reg[17]  ( .D(n50), .CK(clk), .RN(n85), .Q(Q[17]), .QN(n18) );
  DFFRX2TS \Q_reg[22]  ( .D(n55), .CK(clk), .RN(n84), .Q(Q[22]), .QN(n23) );
  DFFRX2TS \Q_reg[21]  ( .D(n54), .CK(clk), .RN(n85), .Q(Q[21]), .QN(n22) );
  DFFRX2TS \Q_reg[20]  ( .D(n53), .CK(clk), .RN(n85), .Q(Q[20]), .QN(n21) );
  DFFRX2TS \Q_reg[18]  ( .D(n51), .CK(clk), .RN(n85), .Q(Q[18]), .QN(n19) );
  DFFRX2TS \Q_reg[16]  ( .D(n49), .CK(clk), .RN(n85), .Q(Q[16]), .QN(n17) );
  DFFRX2TS \Q_reg[15]  ( .D(n48), .CK(clk), .RN(n85), .Q(Q[15]), .QN(n16) );
  DFFRX2TS \Q_reg[13]  ( .D(n46), .CK(clk), .RN(n85), .Q(Q[13]), .QN(n14) );
  DFFRX2TS \Q_reg[11]  ( .D(n44), .CK(clk), .RN(n86), .Q(Q[11]), .QN(n12) );
  DFFRX2TS \Q_reg[4]  ( .D(n37), .CK(clk), .RN(n86), .Q(Q[4]), .QN(n5) );
  DFFRX2TS \Q_reg[6]  ( .D(n39), .CK(clk), .RN(n86), .Q(Q[6]), .QN(n7) );
  DFFRX2TS \Q_reg[3]  ( .D(n36), .CK(clk), .RN(n86), .Q(Q[3]), .QN(n4) );
  DFFRX2TS \Q_reg[14]  ( .D(n47), .CK(clk), .RN(n85), .Q(Q[14]), .QN(n15) );
  DFFRX2TS \Q_reg[12]  ( .D(n45), .CK(clk), .RN(n85), .Q(Q[12]), .QN(n13) );
  DFFRX2TS \Q_reg[7]  ( .D(n40), .CK(clk), .RN(n86), .Q(Q[7]), .QN(n8) );
  DFFRX2TS \Q_reg[5]  ( .D(n38), .CK(clk), .RN(n86), .Q(Q[5]), .QN(n6) );
  DFFRX2TS \Q_reg[9]  ( .D(n42), .CK(clk), .RN(n86), .Q(Q[9]), .QN(n10) );
  DFFRX2TS \Q_reg[8]  ( .D(n41), .CK(clk), .RN(n86), .Q(Q[8]), .QN(n9) );
  DFFRX2TS \Q_reg[2]  ( .D(n35), .CK(clk), .RN(n86), .Q(Q[2]), .QN(n3) );
  DFFRX2TS \Q_reg[1]  ( .D(n34), .CK(clk), .RN(n97), .Q(Q[1]), .QN(n2) );
  DFFRX2TS \Q_reg[0]  ( .D(n33), .CK(clk), .RN(n97), .Q(Q[0]), .QN(n1) );
  DFFRX2TS \Q_reg[10]  ( .D(n43), .CK(clk), .RN(n86), .Q(Q[10]), .QN(n11) );
  CLKBUFX2TS U2 ( .A(n92), .Y(n87) );
  CLKBUFX2TS U3 ( .A(n93), .Y(n88) );
  CLKBUFX2TS U4 ( .A(n91), .Y(n89) );
  CLKBUFX2TS U5 ( .A(n91), .Y(n90) );
  CLKBUFX2TS U6 ( .A(n97), .Y(n86) );
  CLKBUFX2TS U7 ( .A(n97), .Y(n85) );
  CLKBUFX2TS U8 ( .A(n97), .Y(n84) );
  OAI2BB2XLTS U9 ( .B0(n1), .B1(n90), .A0N(D[0]), .A1N(n90), .Y(n33) );
  OAI2BB2XLTS U10 ( .B0(n2), .B1(n87), .A0N(D[1]), .A1N(n90), .Y(n34) );
  OAI2BB2XLTS U11 ( .B0(n3), .B1(n90), .A0N(D[2]), .A1N(n89), .Y(n35) );
  OAI2BB2XLTS U12 ( .B0(n4), .B1(n87), .A0N(D[3]), .A1N(n89), .Y(n36) );
  OAI2BB2XLTS U13 ( .B0(n5), .B1(n87), .A0N(D[4]), .A1N(n89), .Y(n37) );
  OAI2BB2XLTS U14 ( .B0(n6), .B1(n87), .A0N(D[5]), .A1N(n88), .Y(n38) );
  OAI2BB2XLTS U15 ( .B0(n7), .B1(n87), .A0N(D[6]), .A1N(n88), .Y(n39) );
  OAI2BB2XLTS U16 ( .B0(n8), .B1(n87), .A0N(D[7]), .A1N(n88), .Y(n40) );
  OAI2BB2XLTS U17 ( .B0(n9), .B1(n87), .A0N(D[8]), .A1N(n90), .Y(n41) );
  OAI2BB2XLTS U18 ( .B0(n10), .B1(n87), .A0N(D[9]), .A1N(n88), .Y(n42) );
  OAI2BB2XLTS U19 ( .B0(n11), .B1(n87), .A0N(D[10]), .A1N(n90), .Y(n43) );
  OAI2BB2XLTS U20 ( .B0(n12), .B1(n91), .A0N(D[11]), .A1N(n91), .Y(n44) );
  OAI2BB2XLTS U21 ( .B0(n13), .B1(n92), .A0N(D[12]), .A1N(n91), .Y(n45) );
  OAI2BB2XLTS U22 ( .B0(n14), .B1(n91), .A0N(D[13]), .A1N(n91), .Y(n46) );
  OAI2BB2XLTS U23 ( .B0(n15), .B1(n92), .A0N(D[14]), .A1N(load), .Y(n47) );
  OAI2BB2XLTS U24 ( .B0(n16), .B1(n87), .A0N(D[15]), .A1N(n88), .Y(n48) );
  OAI2BB2XLTS U25 ( .B0(n17), .B1(n92), .A0N(D[16]), .A1N(n91), .Y(n49) );
  OAI2BB2XLTS U26 ( .B0(n18), .B1(n91), .A0N(D[17]), .A1N(n91), .Y(n50) );
  OAI2BB2XLTS U27 ( .B0(n19), .B1(n92), .A0N(D[18]), .A1N(n88), .Y(n51) );
  OAI2BB2XLTS U28 ( .B0(n20), .B1(n92), .A0N(D[19]), .A1N(n88), .Y(n52) );
  OAI2BB2XLTS U29 ( .B0(n21), .B1(n92), .A0N(D[20]), .A1N(n88), .Y(n53) );
  OAI2BB2XLTS U30 ( .B0(n22), .B1(n93), .A0N(D[21]), .A1N(n89), .Y(n54) );
  OAI2BB2XLTS U31 ( .B0(n23), .B1(n93), .A0N(D[22]), .A1N(n88), .Y(n55) );
  OAI2BB2XLTS U32 ( .B0(n24), .B1(n93), .A0N(D[23]), .A1N(n88), .Y(n56) );
  OAI2BB2XLTS U33 ( .B0(n25), .B1(n93), .A0N(D[24]), .A1N(n89), .Y(n57) );
  OAI2BB2XLTS U34 ( .B0(n26), .B1(n93), .A0N(D[25]), .A1N(n89), .Y(n58) );
  OAI2BB2XLTS U35 ( .B0(n27), .B1(n93), .A0N(D[26]), .A1N(n89), .Y(n59) );
  OAI2BB2XLTS U36 ( .B0(n28), .B1(n93), .A0N(D[27]), .A1N(n89), .Y(n60) );
  OAI2BB2XLTS U37 ( .B0(n29), .B1(n93), .A0N(D[28]), .A1N(n89), .Y(n61) );
  OAI2BB2XLTS U38 ( .B0(n30), .B1(n92), .A0N(D[29]), .A1N(n89), .Y(n62) );
  OAI2BB2XLTS U39 ( .B0(n31), .B1(n93), .A0N(D[30]), .A1N(n90), .Y(n63) );
  OAI2BB2XLTS U40 ( .B0(n32), .B1(n92), .A0N(n90), .A1N(D[31]), .Y(n65) );
  CLKBUFX2TS U41 ( .A(load), .Y(n91) );
  CLKBUFX2TS U42 ( .A(load), .Y(n92) );
  CLKBUFX2TS U43 ( .A(load), .Y(n93) );
  INVX2TS U44 ( .A(rst), .Y(n97) );
endmodule


module RegisterAdd_W1_1 ( clk, rst, load, D, Q );
  input [0:0] D;
  output [0:0] Q;
  input clk, rst, load;
  wire   n3, n4, n2;

  DFFRX2TS \Q_reg[0]  ( .D(n3), .CK(clk), .RN(n2), .Q(Q[0]), .QN(n4) );
  OAI2BB2XLTS U2 ( .B0(n4), .B1(load), .A0N(load), .A1N(D[0]), .Y(n3) );
  INVX2TS U3 ( .A(rst), .Y(n2) );
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
         n99, n100, n101, n102, n103;
  assign gtXY_o = N0;
  assign eqXY_o = N1;

  XOR2X1TS U1 ( .A(Data_X_i[2]), .B(n31), .Y(n56) );
  XOR2X1TS U2 ( .A(Data_X_i[7]), .B(Data_Y_i[7]), .Y(n59) );
  XOR2X1TS U3 ( .A(Data_X_i[16]), .B(Data_Y_i[16]), .Y(n58) );
  XOR2X1TS U4 ( .A(Data_X_i[18]), .B(Data_Y_i[18]), .Y(n57) );
  NOR4BBX1TS U5 ( .AN(n68), .BN(n64), .C(n67), .D(n70), .Y(n39) );
  NOR3BX1TS U6 ( .AN(n51), .B(n52), .C(n53), .Y(n50) );
  NAND3X1TS U7 ( .A(n54), .B(n55), .C(n56), .Y(n52) );
  NOR3X1TS U8 ( .A(n57), .B(n58), .C(n59), .Y(n49) );
  NOR2BX1TS U9 ( .AN(n45), .B(n46), .Y(n43) );
  NOR3X1TS U10 ( .A(n32), .B(n33), .C(n34), .Y(N1) );
  NAND4BX1TS U11 ( .AN(n41), .B(n42), .C(n43), .D(n44), .Y(n33) );
  NAND4BBX1TS U12 ( .AN(n47), .BN(n48), .C(n49), .D(n50), .Y(n32) );
  NAND4BBX1TS U13 ( .AN(n35), .BN(n36), .C(n37), .D(n38), .Y(n34) );
  XNOR2X1TS U14 ( .A(Data_X_i[9]), .B(Data_Y_i[9]), .Y(n93) );
  XNOR2X1TS U15 ( .A(n18), .B(Data_Y_i[1]), .Y(n41) );
  OAI22X1TS U16 ( .A0(Data_Y_i[12]), .A1(n13), .B0(n87), .B1(n88), .Y(n86) );
  INVX2TS U17 ( .A(Data_X_i[12]), .Y(n13) );
  AOI22X1TS U18 ( .A0(n89), .A1(n90), .B0(Data_X_i[11]), .B1(n26), .Y(n87) );
  INVX2TS U19 ( .A(Data_Y_i[11]), .Y(n26) );
  OAI22X1TS U20 ( .A0(Data_Y_i[10]), .A1(n14), .B0(n91), .B1(n92), .Y(n90) );
  INVX2TS U21 ( .A(Data_X_i[10]), .Y(n14) );
  AOI32X1TS U22 ( .A0(Data_X_i[8]), .A1(n28), .A2(n93), .B0(Data_X_i[9]), .B1(
        n27), .Y(n91) );
  INVX2TS U23 ( .A(Data_Y_i[9]), .Y(n27) );
  OAI22X1TS U24 ( .A0(Data_Y_i[30]), .A1(n1), .B0(n60), .B1(n47), .Y(N0) );
  AOI22X1TS U25 ( .A0(n55), .A1(n61), .B0(Data_X_i[29]), .B1(n20), .Y(n60) );
  OAI21X1TS U26 ( .A0(Data_Y_i[28]), .A1(n2), .B0(n62), .Y(n61) );
  AOI32X1TS U27 ( .A0(n54), .A1(n63), .A2(n39), .B0(n64), .B1(n65), .Y(n62) );
  AOI22X1TS U28 ( .A0(n51), .A1(n97), .B0(Data_X_i[4]), .B1(n30), .Y(n96) );
  INVX2TS U29 ( .A(Data_Y_i[4]), .Y(n30) );
  OAI22X1TS U30 ( .A0(Data_Y_i[3]), .A1(n17), .B0(n98), .B1(n35), .Y(n97) );
  AOI22X1TS U31 ( .A0(n56), .A1(n99), .B0(Data_X_i[2]), .B1(n31), .Y(n98) );
  AOI22X1TS U32 ( .A0(n44), .A1(n78), .B0(Data_X_i[17]), .B1(n23), .Y(n77) );
  OAI22X1TS U33 ( .A0(Data_Y_i[16]), .A1(n11), .B0(n79), .B1(n58), .Y(n78) );
  INVX2TS U34 ( .A(Data_X_i[16]), .Y(n11) );
  AOI222XLTS U35 ( .A0(Data_X_i[15]), .A1(n24), .B0(n37), .B1(n80), .C0(n81), 
        .C1(n82), .Y(n79) );
  OAI22X1TS U36 ( .A0(Data_Y_i[7]), .A1(n15), .B0(n94), .B1(n59), .Y(n80) );
  INVX2TS U37 ( .A(Data_X_i[7]), .Y(n15) );
  AOI22X1TS U38 ( .A0(n42), .A1(n95), .B0(Data_X_i[6]), .B1(n29), .Y(n94) );
  OAI22X1TS U39 ( .A0(Data_Y_i[5]), .A1(n16), .B0(n96), .B1(n53), .Y(n95) );
  OAI22X1TS U40 ( .A0(Data_Y_i[14]), .A1(n12), .B0(n83), .B1(n84), .Y(n82) );
  INVX2TS U41 ( .A(Data_X_i[14]), .Y(n12) );
  AOI22X1TS U42 ( .A0(n85), .A1(n86), .B0(Data_X_i[13]), .B1(n25), .Y(n83) );
  INVX2TS U43 ( .A(Data_Y_i[13]), .Y(n25) );
  OAI22X1TS U44 ( .A0(Data_Y_i[23]), .A1(n6), .B0(n71), .B1(n48), .Y(n63) );
  NOR2X1TS U45 ( .A(n72), .B(n73), .Y(n71) );
  OAI32X1TS U46 ( .A0(n74), .A1(Data_Y_i[21]), .A2(n8), .B0(Data_Y_i[22]), 
        .B1(n7), .Y(n73) );
  OAI33XLTS U47 ( .A0(n36), .A1(Data_Y_i[20]), .A2(n9), .B0(n36), .B1(n75), 
        .B2(n46), .Y(n72) );
  AOI22X1TS U48 ( .A0(n45), .A1(n76), .B0(Data_X_i[19]), .B1(n22), .Y(n75) );
  INVX2TS U49 ( .A(Data_Y_i[19]), .Y(n22) );
  OAI22X1TS U50 ( .A0(Data_Y_i[18]), .A1(n10), .B0(n77), .B1(n57), .Y(n76) );
  INVX2TS U51 ( .A(Data_X_i[18]), .Y(n10) );
  XOR2X1TS U52 ( .A(Data_X_i[10]), .B(Data_Y_i[10]), .Y(n92) );
  OAI32X1TS U53 ( .A0(n41), .A1(Data_Y_i[0]), .A2(n19), .B0(Data_Y_i[1]), .B1(
        n18), .Y(n99) );
  INVX2TS U54 ( .A(Data_X_i[0]), .Y(n19) );
  INVX2TS U55 ( .A(Data_Y_i[2]), .Y(n31) );
  INVX2TS U56 ( .A(Data_X_i[1]), .Y(n18) );
  INVX2TS U57 ( .A(Data_Y_i[8]), .Y(n28) );
  XNOR2X1TS U58 ( .A(Data_X_i[11]), .B(Data_Y_i[11]), .Y(n89) );
  XNOR2X1TS U59 ( .A(Data_X_i[13]), .B(Data_Y_i[13]), .Y(n85) );
  XNOR2X1TS U60 ( .A(Data_X_i[4]), .B(Data_Y_i[4]), .Y(n51) );
  XNOR2X1TS U61 ( .A(n17), .B(Data_Y_i[3]), .Y(n35) );
  XNOR2X1TS U62 ( .A(Data_X_i[15]), .B(Data_Y_i[15]), .Y(n81) );
  NOR2BX1TS U63 ( .AN(n100), .B(n101), .Y(n37) );
  NAND4BX1TS U64 ( .AN(n102), .B(n85), .C(n89), .D(n93), .Y(n101) );
  NOR4BX1TS U65 ( .AN(n81), .B(n92), .C(n88), .D(n84), .Y(n100) );
  XOR2X1TS U66 ( .A(Data_Y_i[8]), .B(Data_X_i[8]), .Y(n102) );
  XOR2X1TS U67 ( .A(Data_X_i[14]), .B(Data_Y_i[14]), .Y(n84) );
  XOR2X1TS U68 ( .A(Data_X_i[12]), .B(Data_Y_i[12]), .Y(n88) );
  XOR2X1TS U69 ( .A(Data_X_i[6]), .B(n29), .Y(n42) );
  XOR2X1TS U70 ( .A(Data_X_i[5]), .B(Data_Y_i[5]), .Y(n53) );
  INVX2TS U71 ( .A(Data_Y_i[6]), .Y(n29) );
  INVX2TS U72 ( .A(Data_X_i[3]), .Y(n17) );
  INVX2TS U73 ( .A(Data_X_i[5]), .Y(n16) );
  XNOR2X1TS U74 ( .A(Data_X_i[19]), .B(Data_Y_i[19]), .Y(n45) );
  XNOR2X1TS U75 ( .A(n7), .B(Data_Y_i[22]), .Y(n74) );
  XOR2X1TS U76 ( .A(Data_X_i[17]), .B(n23), .Y(n44) );
  XOR2X1TS U77 ( .A(Data_X_i[20]), .B(Data_Y_i[20]), .Y(n46) );
  NAND2BX1TS U78 ( .AN(n74), .B(n103), .Y(n36) );
  XOR2X1TS U79 ( .A(n8), .B(Data_Y_i[21]), .Y(n103) );
  INVX2TS U80 ( .A(Data_Y_i[17]), .Y(n23) );
  INVX2TS U81 ( .A(Data_X_i[21]), .Y(n8) );
  INVX2TS U82 ( .A(Data_X_i[22]), .Y(n7) );
  INVX2TS U83 ( .A(Data_Y_i[15]), .Y(n24) );
  XNOR2X1TS U84 ( .A(n3), .B(Data_Y_i[27]), .Y(n67) );
  XNOR2X1TS U85 ( .A(n4), .B(Data_Y_i[25]), .Y(n70) );
  XNOR2X1TS U86 ( .A(n1), .B(Data_Y_i[30]), .Y(n47) );
  XNOR2X1TS U87 ( .A(n6), .B(Data_Y_i[23]), .Y(n48) );
  NOR2BX1TS U88 ( .AN(n39), .B(n40), .Y(n38) );
  XOR2X1TS U89 ( .A(Data_Y_i[0]), .B(Data_X_i[0]), .Y(n40) );
  OAI22X1TS U90 ( .A0(Data_Y_i[27]), .A1(n3), .B0(n66), .B1(n67), .Y(n65) );
  AOI22X1TS U91 ( .A0(n68), .A1(n69), .B0(Data_X_i[26]), .B1(n21), .Y(n66) );
  OAI32X1TS U92 ( .A0(n5), .A1(Data_Y_i[24]), .A2(n70), .B0(Data_Y_i[25]), 
        .B1(n4), .Y(n69) );
  XOR2X1TS U93 ( .A(Data_X_i[29]), .B(n20), .Y(n55) );
  XOR2X1TS U94 ( .A(n5), .B(Data_Y_i[24]), .Y(n54) );
  XOR2X1TS U95 ( .A(Data_X_i[26]), .B(n21), .Y(n68) );
  XOR2X1TS U96 ( .A(n2), .B(Data_Y_i[28]), .Y(n64) );
  INVX2TS U97 ( .A(Data_X_i[28]), .Y(n2) );
  INVX2TS U98 ( .A(Data_Y_i[26]), .Y(n21) );
  INVX2TS U99 ( .A(Data_Y_i[29]), .Y(n20) );
  INVX2TS U100 ( .A(Data_X_i[27]), .Y(n3) );
  INVX2TS U101 ( .A(Data_X_i[23]), .Y(n6) );
  INVX2TS U102 ( .A(Data_X_i[30]), .Y(n1) );
  INVX2TS U103 ( .A(Data_X_i[24]), .Y(n5) );
  INVX2TS U104 ( .A(Data_X_i[25]), .Y(n4) );
  INVX2TS U105 ( .A(Data_X_i[20]), .Y(n9) );
endmodule


module xor_tri_W32 ( A_i, B_i, C_i, Z_o );
  input A_i, B_i, C_i;
  output Z_o;
  wire   n1;

  XOR2X1TS U1 ( .A(A_i), .B(n1), .Y(Z_o) );
  XOR2X1TS U2 ( .A(C_i), .B(B_i), .Y(n1) );
endmodule


module sgn_result ( Add_Subt_i, sgn_X_i, sgn_Y_i, gtXY_i, eqXY_i, sgn_result_o
 );
  input Add_Subt_i, sgn_X_i, sgn_Y_i, gtXY_i, eqXY_i;
  output sgn_result_o;
  wire   n1, n2, n3;

  OAI31X1TS U1 ( .A0(n2), .A1(gtXY_i), .A2(eqXY_i), .B0(n3), .Y(sgn_result_o)
         );
  OAI21X1TS U2 ( .A0(gtXY_i), .A1(n1), .B0(sgn_X_i), .Y(n3) );
  INVX2TS U3 ( .A(n2), .Y(n1) );
  XNOR2X1TS U4 ( .A(sgn_Y_i), .B(Add_Subt_i), .Y(n2) );
endmodule


module MultiplexTxT_W31 ( select, D0_i, D1_i, S0_o, S1_o );
  input [30:0] D0_i;
  input [30:0] D1_i;
  output [30:0] S0_o;
  output [30:0] S1_o;
  input select;
  wire   n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n77, n78, n79, n80, n81, n82, n83, n84, n85,
         n86, n87, n88, n89, n90;

  INVX2TS U1 ( .A(n83), .Y(n78) );
  INVX2TS U2 ( .A(n87), .Y(n79) );
  INVX2TS U3 ( .A(n88), .Y(n80) );
  INVX2TS U4 ( .A(n90), .Y(n81) );
  INVX2TS U5 ( .A(n90), .Y(n82) );
  CLKBUFX2TS U6 ( .A(n88), .Y(n85) );
  CLKBUFX2TS U7 ( .A(n89), .Y(n84) );
  CLKBUFX2TS U8 ( .A(n88), .Y(n86) );
  CLKBUFX2TS U9 ( .A(n89), .Y(n83) );
  CLKBUFX2TS U10 ( .A(n90), .Y(n89) );
  CLKBUFX2TS U11 ( .A(n90), .Y(n88) );
  CLKBUFX2TS U12 ( .A(n90), .Y(n87) );
  INVX2TS U13 ( .A(n77), .Y(n90) );
  CLKBUFX2TS U14 ( .A(select), .Y(n77) );
  OAI22X1TS U15 ( .A0(n86), .A1(n63), .B0(n80), .B1(n32), .Y(S1_o[0]) );
  OAI22X1TS U16 ( .A0(n85), .A1(n62), .B0(n81), .B1(n31), .Y(S1_o[1]) );
  OAI22X1TS U17 ( .A0(n83), .A1(n60), .B0(n82), .B1(n29), .Y(S1_o[3]) );
  OAI22X1TS U18 ( .A0(n83), .A1(n59), .B0(n82), .B1(n28), .Y(S1_o[4]) );
  OAI22X1TS U19 ( .A0(n83), .A1(n58), .B0(n82), .B1(n27), .Y(S1_o[5]) );
  OAI22X1TS U20 ( .A0(n83), .A1(n56), .B0(n82), .B1(n25), .Y(S1_o[7]) );
  OAI22X1TS U21 ( .A0(n54), .A1(n84), .B0(n77), .B1(n23), .Y(S1_o[9]) );
  OAI22X1TS U22 ( .A0(n86), .A1(n53), .B0(n80), .B1(n22), .Y(S1_o[10]) );
  OAI22X1TS U23 ( .A0(n86), .A1(n52), .B0(n80), .B1(n21), .Y(S1_o[11]) );
  OAI22X1TS U24 ( .A0(n86), .A1(n51), .B0(n80), .B1(n20), .Y(S1_o[12]) );
  OAI22X1TS U25 ( .A0(n86), .A1(n50), .B0(n80), .B1(n19), .Y(S1_o[13]) );
  OAI22X1TS U26 ( .A0(n86), .A1(n49), .B0(n80), .B1(n18), .Y(S1_o[14]) );
  OAI22X1TS U27 ( .A0(n85), .A1(n48), .B0(n80), .B1(n17), .Y(S1_o[15]) );
  OAI22X1TS U28 ( .A0(n85), .A1(n47), .B0(n80), .B1(n16), .Y(S1_o[16]) );
  OAI22X1TS U29 ( .A0(n85), .A1(n45), .B0(n81), .B1(n14), .Y(S1_o[18]) );
  OAI22X1TS U30 ( .A0(n85), .A1(n44), .B0(n81), .B1(n13), .Y(S1_o[19]) );
  OAI22X1TS U31 ( .A0(n85), .A1(n41), .B0(n81), .B1(n10), .Y(S1_o[22]) );
  OAI22X1TS U32 ( .A0(n84), .A1(n40), .B0(n81), .B1(n9), .Y(S1_o[23]) );
  OAI22X1TS U33 ( .A0(n84), .A1(n38), .B0(n81), .B1(n7), .Y(S1_o[25]) );
  OAI22X1TS U34 ( .A0(n84), .A1(n36), .B0(n82), .B1(n5), .Y(S1_o[27]) );
  OAI22X1TS U35 ( .A0(n84), .A1(n35), .B0(n82), .B1(n4), .Y(S1_o[28]) );
  OAI22X1TS U36 ( .A0(n84), .A1(n33), .B0(n82), .B1(n2), .Y(S1_o[30]) );
  OAI22X1TS U37 ( .A0(n78), .A1(n63), .B0(n86), .B1(n32), .Y(S0_o[0]) );
  OAI22X1TS U38 ( .A0(n79), .A1(n62), .B0(n87), .B1(n31), .Y(S0_o[1]) );
  OAI22X1TS U39 ( .A0(n77), .A1(n60), .B0(n87), .B1(n29), .Y(S0_o[3]) );
  OAI22X1TS U40 ( .A0(n77), .A1(n59), .B0(n88), .B1(n28), .Y(S0_o[4]) );
  OAI22X1TS U41 ( .A0(select), .A1(n58), .B0(n87), .B1(n27), .Y(S0_o[5]) );
  OAI22X1TS U42 ( .A0(select), .A1(n56), .B0(n83), .B1(n25), .Y(S0_o[7]) );
  OAI22X1TS U43 ( .A0(n80), .A1(n54), .B0(n23), .B1(n85), .Y(S0_o[9]) );
  OAI22X1TS U44 ( .A0(n78), .A1(n53), .B0(n83), .B1(n22), .Y(S0_o[10]) );
  OAI22X1TS U45 ( .A0(n78), .A1(n52), .B0(n90), .B1(n21), .Y(S0_o[11]) );
  OAI22X1TS U46 ( .A0(n78), .A1(n51), .B0(n90), .B1(n20), .Y(S0_o[12]) );
  OAI22X1TS U47 ( .A0(n78), .A1(n50), .B0(n90), .B1(n19), .Y(S0_o[13]) );
  OAI22X1TS U48 ( .A0(n78), .A1(n49), .B0(n90), .B1(n18), .Y(S0_o[14]) );
  OAI22X1TS U49 ( .A0(n78), .A1(n48), .B0(n86), .B1(n17), .Y(S0_o[15]) );
  OAI22X1TS U50 ( .A0(n78), .A1(n47), .B0(n87), .B1(n16), .Y(S0_o[16]) );
  OAI22X1TS U51 ( .A0(n78), .A1(n45), .B0(n86), .B1(n14), .Y(S0_o[18]) );
  OAI22X1TS U52 ( .A0(n79), .A1(n44), .B0(n90), .B1(n13), .Y(S0_o[19]) );
  OAI22X1TS U53 ( .A0(n79), .A1(n41), .B0(n87), .B1(n10), .Y(S0_o[22]) );
  OAI22X1TS U54 ( .A0(n79), .A1(n40), .B0(n87), .B1(n9), .Y(S0_o[23]) );
  OAI22X1TS U55 ( .A0(n79), .A1(n38), .B0(n87), .B1(n7), .Y(S0_o[25]) );
  OAI22X1TS U56 ( .A0(n79), .A1(n36), .B0(n88), .B1(n5), .Y(S0_o[27]) );
  OAI22X1TS U57 ( .A0(select), .A1(n35), .B0(n87), .B1(n4), .Y(S0_o[28]) );
  OAI22X1TS U58 ( .A0(select), .A1(n33), .B0(n88), .B1(n2), .Y(S0_o[30]) );
  OAI22X1TS U59 ( .A0(n83), .A1(n55), .B0(n77), .B1(n24), .Y(S1_o[8]) );
  OAI22X1TS U60 ( .A0(select), .A1(n61), .B0(n89), .B1(n30), .Y(S0_o[2]) );
  OAI22X1TS U61 ( .A0(select), .A1(n57), .B0(n87), .B1(n26), .Y(S0_o[6]) );
  OAI22X1TS U62 ( .A0(n77), .A1(n55), .B0(n86), .B1(n24), .Y(S0_o[8]) );
  OAI22X1TS U63 ( .A0(n78), .A1(n46), .B0(n89), .B1(n15), .Y(S0_o[17]) );
  OAI22X1TS U64 ( .A0(n79), .A1(n43), .B0(n83), .B1(n12), .Y(S0_o[20]) );
  OAI22X1TS U65 ( .A0(n79), .A1(n42), .B0(n89), .B1(n11), .Y(S0_o[21]) );
  OAI22X1TS U66 ( .A0(n79), .A1(n39), .B0(n88), .B1(n8), .Y(S0_o[24]) );
  OAI22X1TS U67 ( .A0(n79), .A1(n37), .B0(n89), .B1(n6), .Y(S0_o[26]) );
  OAI22X1TS U68 ( .A0(select), .A1(n34), .B0(n88), .B1(n3), .Y(S0_o[29]) );
  OAI22X1TS U69 ( .A0(n84), .A1(n61), .B0(n82), .B1(n30), .Y(S1_o[2]) );
  OAI22X1TS U70 ( .A0(n83), .A1(n57), .B0(n82), .B1(n26), .Y(S1_o[6]) );
  OAI22X1TS U71 ( .A0(n85), .A1(n46), .B0(n80), .B1(n15), .Y(S1_o[17]) );
  OAI22X1TS U72 ( .A0(n85), .A1(n42), .B0(n81), .B1(n11), .Y(S1_o[21]) );
  OAI22X1TS U73 ( .A0(n84), .A1(n39), .B0(n81), .B1(n8), .Y(S1_o[24]) );
  OAI22X1TS U74 ( .A0(n84), .A1(n37), .B0(n81), .B1(n6), .Y(S1_o[26]) );
  OAI22X1TS U75 ( .A0(n84), .A1(n34), .B0(n82), .B1(n3), .Y(S1_o[29]) );
  OAI22X1TS U76 ( .A0(n85), .A1(n43), .B0(n81), .B1(n12), .Y(S1_o[20]) );
  INVX2TS U77 ( .A(D1_i[8]), .Y(n55) );
  INVX2TS U78 ( .A(D1_i[9]), .Y(n54) );
  INVX2TS U79 ( .A(D1_i[4]), .Y(n59) );
  INVX2TS U80 ( .A(D1_i[11]), .Y(n52) );
  INVX2TS U81 ( .A(D1_i[13]), .Y(n50) );
  INVX2TS U82 ( .A(D1_i[15]), .Y(n48) );
  INVX2TS U83 ( .A(D1_i[19]), .Y(n44) );
  INVX2TS U84 ( .A(D0_i[5]), .Y(n27) );
  INVX2TS U85 ( .A(D0_i[7]), .Y(n25) );
  INVX2TS U86 ( .A(D0_i[10]), .Y(n22) );
  INVX2TS U87 ( .A(D0_i[12]), .Y(n20) );
  INVX2TS U88 ( .A(D0_i[14]), .Y(n18) );
  INVX2TS U89 ( .A(D0_i[16]), .Y(n16) );
  INVX2TS U90 ( .A(D0_i[18]), .Y(n14) );
  INVX2TS U91 ( .A(D0_i[20]), .Y(n12) );
  INVX2TS U92 ( .A(D0_i[0]), .Y(n32) );
  INVX2TS U93 ( .A(D1_i[2]), .Y(n61) );
  INVX2TS U94 ( .A(D1_i[6]), .Y(n57) );
  INVX2TS U95 ( .A(D1_i[17]), .Y(n46) );
  INVX2TS U96 ( .A(D1_i[26]), .Y(n37) );
  INVX2TS U97 ( .A(D1_i[29]), .Y(n34) );
  INVX2TS U98 ( .A(D1_i[5]), .Y(n58) );
  INVX2TS U99 ( .A(D1_i[7]), .Y(n56) );
  INVX2TS U100 ( .A(D1_i[10]), .Y(n53) );
  INVX2TS U101 ( .A(D1_i[12]), .Y(n51) );
  INVX2TS U102 ( .A(D1_i[14]), .Y(n49) );
  INVX2TS U103 ( .A(D1_i[16]), .Y(n47) );
  INVX2TS U104 ( .A(D1_i[18]), .Y(n45) );
  INVX2TS U105 ( .A(D1_i[3]), .Y(n60) );
  INVX2TS U106 ( .A(D1_i[23]), .Y(n40) );
  INVX2TS U107 ( .A(D1_i[27]), .Y(n36) );
  INVX2TS U108 ( .A(D1_i[30]), .Y(n33) );
  INVX2TS U109 ( .A(D1_i[28]), .Y(n35) );
  INVX2TS U110 ( .A(D0_i[1]), .Y(n31) );
  INVX2TS U111 ( .A(D0_i[3]), .Y(n29) );
  INVX2TS U112 ( .A(D0_i[21]), .Y(n11) );
  INVX2TS U113 ( .A(D0_i[22]), .Y(n10) );
  INVX2TS U114 ( .A(D0_i[23]), .Y(n9) );
  INVX2TS U115 ( .A(D0_i[24]), .Y(n8) );
  INVX2TS U116 ( .A(D0_i[25]), .Y(n7) );
  INVX2TS U117 ( .A(D0_i[27]), .Y(n5) );
  INVX2TS U118 ( .A(D0_i[28]), .Y(n4) );
  INVX2TS U119 ( .A(D0_i[30]), .Y(n2) );
  INVX2TS U120 ( .A(D0_i[2]), .Y(n30) );
  INVX2TS U121 ( .A(D0_i[6]), .Y(n26) );
  INVX2TS U122 ( .A(D0_i[17]), .Y(n15) );
  INVX2TS U123 ( .A(D0_i[26]), .Y(n6) );
  INVX2TS U124 ( .A(D0_i[29]), .Y(n3) );
  INVX2TS U125 ( .A(D0_i[4]), .Y(n28) );
  INVX2TS U126 ( .A(D0_i[11]), .Y(n21) );
  INVX2TS U127 ( .A(D0_i[13]), .Y(n19) );
  INVX2TS U128 ( .A(D0_i[19]), .Y(n13) );
  INVX2TS U129 ( .A(D1_i[0]), .Y(n63) );
  INVX2TS U130 ( .A(D1_i[20]), .Y(n43) );
  INVX2TS U131 ( .A(D1_i[21]), .Y(n42) );
  INVX2TS U132 ( .A(D1_i[24]), .Y(n39) );
  INVX2TS U133 ( .A(D1_i[1]), .Y(n62) );
  INVX2TS U134 ( .A(D1_i[22]), .Y(n41) );
  INVX2TS U135 ( .A(D1_i[25]), .Y(n38) );
  INVX2TS U136 ( .A(D0_i[8]), .Y(n24) );
  INVX2TS U137 ( .A(D0_i[9]), .Y(n23) );
  INVX2TS U138 ( .A(D0_i[15]), .Y(n17) );
endmodule


module RegisterAdd_W31_1 ( clk, rst, load, D, Q );
  input [30:0] D;
  output [30:0] Q;
  input clk, rst, load;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73;

  OAI2BB2XLTS U2 ( .B0(n1), .B1(n67), .A0N(n70), .A1N(D[0]), .Y(n32) );
  OAI2BB2XLTS U3 ( .B0(n2), .B1(n67), .A0N(D[1]), .A1N(n70), .Y(n33) );
  OAI2BB2XLTS U4 ( .B0(n3), .B1(n67), .A0N(D[2]), .A1N(n69), .Y(n34) );
  OAI2BB2XLTS U5 ( .B0(n4), .B1(n67), .A0N(D[3]), .A1N(n69), .Y(n35) );
  OAI2BB2XLTS U6 ( .B0(n5), .B1(n67), .A0N(D[4]), .A1N(n69), .Y(n36) );
  OAI2BB2XLTS U7 ( .B0(n6), .B1(n67), .A0N(D[5]), .A1N(n69), .Y(n37) );
  OAI2BB2XLTS U8 ( .B0(n7), .B1(n72), .A0N(D[6]), .A1N(n69), .Y(n38) );
  OAI2BB2XLTS U9 ( .B0(n8), .B1(n72), .A0N(D[7]), .A1N(n69), .Y(n39) );
  OAI2BB2XLTS U10 ( .B0(n9), .B1(n73), .A0N(D[8]), .A1N(n69), .Y(n40) );
  OAI2BB2XLTS U11 ( .B0(n10), .B1(n72), .A0N(D[9]), .A1N(n69), .Y(n41) );
  OAI2BB2XLTS U12 ( .B0(n11), .B1(n71), .A0N(D[10]), .A1N(n69), .Y(n42) );
  OAI2BB2XLTS U13 ( .B0(n12), .B1(n73), .A0N(D[11]), .A1N(n69), .Y(n43) );
  OAI2BB2XLTS U14 ( .B0(n13), .B1(n68), .A0N(D[12]), .A1N(n70), .Y(n44) );
  OAI2BB2XLTS U15 ( .B0(n14), .B1(n68), .A0N(D[13]), .A1N(n70), .Y(n45) );
  OAI2BB2XLTS U16 ( .B0(n15), .B1(n72), .A0N(D[14]), .A1N(n70), .Y(n46) );
  OAI2BB2XLTS U17 ( .B0(n16), .B1(n68), .A0N(D[15]), .A1N(n70), .Y(n47) );
  OAI2BB2XLTS U18 ( .B0(n17), .B1(n68), .A0N(D[16]), .A1N(n70), .Y(n48) );
  OAI2BB2XLTS U19 ( .B0(n18), .B1(n68), .A0N(D[17]), .A1N(n70), .Y(n49) );
  OAI2BB2XLTS U20 ( .B0(n19), .B1(n68), .A0N(D[18]), .A1N(n70), .Y(n50) );
  OAI2BB2XLTS U21 ( .B0(n20), .B1(n71), .A0N(D[19]), .A1N(n71), .Y(n51) );
  OAI2BB2XLTS U22 ( .B0(n21), .B1(n68), .A0N(D[20]), .A1N(n73), .Y(n52) );
  OAI2BB2XLTS U23 ( .B0(n22), .B1(n68), .A0N(D[21]), .A1N(load), .Y(n53) );
  OAI2BB2XLTS U24 ( .B0(n23), .B1(n68), .A0N(D[22]), .A1N(n70), .Y(n54) );
  OAI2BB2XLTS U25 ( .B0(n24), .B1(n68), .A0N(D[23]), .A1N(n71), .Y(n55) );
  OAI2BB2XLTS U26 ( .B0(n25), .B1(n73), .A0N(D[24]), .A1N(n71), .Y(n56) );
  OAI2BB2XLTS U27 ( .B0(n26), .B1(n71), .A0N(D[25]), .A1N(n73), .Y(n57) );
  OAI2BB2XLTS U28 ( .B0(n27), .B1(n72), .A0N(D[26]), .A1N(n72), .Y(n58) );
  OAI2BB2XLTS U29 ( .B0(n28), .B1(n67), .A0N(D[27]), .A1N(n71), .Y(n59) );
  OAI2BB2XLTS U30 ( .B0(n29), .B1(n67), .A0N(D[28]), .A1N(n73), .Y(n60) );
  OAI2BB2XLTS U31 ( .B0(n30), .B1(n67), .A0N(D[29]), .A1N(n72), .Y(n61) );
  CLKINVX1TS U32 ( .A(rst), .Y(n62) );
  OAI2BB2XLTS U33 ( .B0(n31), .B1(n67), .A0N(D[30]), .A1N(n71), .Y(n63) );
  DFFRX2TS \Q_reg[30]  ( .D(n63), .CK(clk), .RN(n62), .Q(Q[30]), .QN(n31) );
  DFFRX2TS \Q_reg[29]  ( .D(n61), .CK(clk), .RN(n62), .Q(Q[29]), .QN(n30) );
  DFFRX2TS \Q_reg[28]  ( .D(n60), .CK(clk), .RN(n62), .Q(Q[28]), .QN(n29) );
  DFFRX2TS \Q_reg[27]  ( .D(n59), .CK(clk), .RN(n62), .Q(Q[27]), .QN(n28) );
  DFFRX2TS \Q_reg[26]  ( .D(n58), .CK(clk), .RN(n62), .Q(Q[26]), .QN(n27) );
  DFFRX2TS \Q_reg[25]  ( .D(n57), .CK(clk), .RN(n62), .Q(Q[25]), .QN(n26) );
  DFFRX2TS \Q_reg[24]  ( .D(n56), .CK(clk), .RN(n62), .Q(Q[24]), .QN(n25) );
  DFFRX2TS \Q_reg[23]  ( .D(n55), .CK(clk), .RN(n62), .Q(Q[23]), .QN(n24) );
  DFFRX2TS \Q_reg[22]  ( .D(n54), .CK(clk), .RN(n62), .Q(Q[22]), .QN(n23) );
  DFFRX2TS \Q_reg[21]  ( .D(n53), .CK(clk), .RN(n66), .Q(Q[21]), .QN(n22) );
  DFFRX2TS \Q_reg[20]  ( .D(n52), .CK(clk), .RN(n66), .Q(Q[20]), .QN(n21) );
  DFFRX2TS \Q_reg[19]  ( .D(n51), .CK(clk), .RN(n65), .Q(Q[19]), .QN(n20) );
  DFFRX2TS \Q_reg[18]  ( .D(n50), .CK(clk), .RN(n65), .Q(Q[18]), .QN(n19) );
  DFFRX2TS \Q_reg[17]  ( .D(n49), .CK(clk), .RN(n65), .Q(Q[17]), .QN(n18) );
  DFFRX2TS \Q_reg[16]  ( .D(n48), .CK(clk), .RN(n65), .Q(Q[16]), .QN(n17) );
  DFFRX2TS \Q_reg[15]  ( .D(n47), .CK(clk), .RN(n65), .Q(Q[15]), .QN(n16) );
  DFFRX2TS \Q_reg[14]  ( .D(n46), .CK(clk), .RN(n65), .Q(Q[14]), .QN(n15) );
  DFFRX2TS \Q_reg[13]  ( .D(n45), .CK(clk), .RN(n65), .Q(Q[13]), .QN(n14) );
  DFFRX2TS \Q_reg[12]  ( .D(n44), .CK(clk), .RN(n65), .Q(Q[12]), .QN(n13) );
  DFFRX2TS \Q_reg[11]  ( .D(n43), .CK(clk), .RN(n65), .Q(Q[11]), .QN(n12) );
  DFFRX2TS \Q_reg[10]  ( .D(n42), .CK(clk), .RN(n65), .Q(Q[10]), .QN(n11) );
  DFFRX2TS \Q_reg[9]  ( .D(n41), .CK(clk), .RN(n64), .Q(Q[9]), .QN(n10) );
  DFFRX2TS \Q_reg[8]  ( .D(n40), .CK(clk), .RN(n64), .Q(Q[8]), .QN(n9) );
  DFFRX2TS \Q_reg[7]  ( .D(n39), .CK(clk), .RN(n64), .Q(Q[7]), .QN(n8) );
  DFFRX2TS \Q_reg[6]  ( .D(n38), .CK(clk), .RN(n64), .Q(Q[6]), .QN(n7) );
  DFFRX2TS \Q_reg[5]  ( .D(n37), .CK(clk), .RN(n64), .Q(Q[5]), .QN(n6) );
  DFFRX2TS \Q_reg[4]  ( .D(n36), .CK(clk), .RN(n64), .Q(Q[4]), .QN(n5) );
  DFFRX2TS \Q_reg[3]  ( .D(n35), .CK(clk), .RN(n64), .Q(Q[3]), .QN(n4) );
  DFFRX2TS \Q_reg[2]  ( .D(n34), .CK(clk), .RN(n64), .Q(Q[2]), .QN(n3) );
  DFFRX2TS \Q_reg[1]  ( .D(n33), .CK(clk), .RN(n64), .Q(Q[1]), .QN(n2) );
  DFFRX2TS \Q_reg[0]  ( .D(n32), .CK(clk), .RN(n64), .Q(Q[0]), .QN(n1) );
  CLKBUFX2TS U34 ( .A(n66), .Y(n64) );
  CLKBUFX2TS U35 ( .A(n66), .Y(n65) );
  CLKBUFX2TS U36 ( .A(n72), .Y(n68) );
  CLKBUFX2TS U37 ( .A(n71), .Y(n69) );
  CLKBUFX2TS U38 ( .A(n71), .Y(n70) );
  CLKBUFX2TS U39 ( .A(n62), .Y(n66) );
  CLKBUFX2TS U40 ( .A(load), .Y(n71) );
  CLKBUFX2TS U41 ( .A(load), .Y(n72) );
  CLKBUFX2TS U42 ( .A(n73), .Y(n67) );
  CLKBUFX2TS U43 ( .A(load), .Y(n73) );
endmodule


module RegisterAdd_W32_0 ( clk, rst, load, D, Q );
  input [31:0] D;
  output [31:0] Q;
  input clk, rst, load;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n65, n84, n85, n86, n87, n88, n89, n90, n91,
         n92, n93, n94;

  DFFRX2TS \Q_reg[31]  ( .D(n65), .CK(clk), .RN(n84), .Q(Q[31]), .QN(n32) );
  DFFRX2TS \Q_reg[25]  ( .D(n58), .CK(clk), .RN(n84), .Q(Q[25]), .QN(n26) );
  DFFRX2TS \Q_reg[24]  ( .D(n57), .CK(clk), .RN(n84), .Q(Q[24]), .QN(n25) );
  DFFRX2TS \Q_reg[28]  ( .D(n61), .CK(clk), .RN(n84), .Q(Q[28]), .QN(n29) );
  DFFRX2TS \Q_reg[30]  ( .D(n63), .CK(clk), .RN(n84), .Q(Q[30]), .QN(n31) );
  DFFRX2TS \Q_reg[27]  ( .D(n60), .CK(clk), .RN(n84), .Q(Q[27]), .QN(n28) );
  DFFRX2TS \Q_reg[23]  ( .D(n56), .CK(clk), .RN(n84), .Q(Q[23]), .QN(n24) );
  DFFRX2TS \Q_reg[29]  ( .D(n62), .CK(clk), .RN(n84), .Q(Q[29]), .QN(n30) );
  DFFRX2TS \Q_reg[26]  ( .D(n59), .CK(clk), .RN(n84), .Q(Q[26]), .QN(n27) );
  DFFRX2TS \Q_reg[22]  ( .D(n55), .CK(clk), .RN(n84), .Q(Q[22]), .QN(n23) );
  DFFRX2TS \Q_reg[21]  ( .D(n54), .CK(clk), .RN(n94), .Q(Q[21]), .QN(n22) );
  DFFRX2TS \Q_reg[20]  ( .D(n53), .CK(clk), .RN(n94), .Q(Q[20]), .QN(n21) );
  DFFRX2TS \Q_reg[18]  ( .D(n51), .CK(clk), .RN(n86), .Q(Q[18]), .QN(n19) );
  DFFRX2TS \Q_reg[16]  ( .D(n49), .CK(clk), .RN(n86), .Q(Q[16]), .QN(n17) );
  DFFRX2TS \Q_reg[17]  ( .D(n50), .CK(clk), .RN(n86), .Q(Q[17]), .QN(n18) );
  DFFRX2TS \Q_reg[19]  ( .D(n52), .CK(clk), .RN(n86), .Q(Q[19]), .QN(n20) );
  DFFRX2TS \Q_reg[3]  ( .D(n36), .CK(clk), .RN(n85), .Q(Q[3]), .QN(n4) );
  DFFRX2TS \Q_reg[14]  ( .D(n47), .CK(clk), .RN(n86), .Q(Q[14]), .QN(n15) );
  DFFRX2TS \Q_reg[12]  ( .D(n45), .CK(clk), .RN(n86), .Q(Q[12]), .QN(n13) );
  DFFRX2TS \Q_reg[7]  ( .D(n40), .CK(clk), .RN(n85), .Q(Q[7]), .QN(n8) );
  DFFRX2TS \Q_reg[5]  ( .D(n38), .CK(clk), .RN(n85), .Q(Q[5]), .QN(n6) );
  DFFRX2TS \Q_reg[6]  ( .D(n39), .CK(clk), .RN(n85), .Q(Q[6]), .QN(n7) );
  DFFRX2TS \Q_reg[15]  ( .D(n48), .CK(clk), .RN(n86), .Q(Q[15]), .QN(n16) );
  DFFRX2TS \Q_reg[13]  ( .D(n46), .CK(clk), .RN(n86), .Q(Q[13]), .QN(n14) );
  DFFRX2TS \Q_reg[11]  ( .D(n44), .CK(clk), .RN(n85), .Q(Q[11]), .QN(n12) );
  DFFRX2TS \Q_reg[4]  ( .D(n37), .CK(clk), .RN(n85), .Q(Q[4]), .QN(n5) );
  DFFRX2TS \Q_reg[1]  ( .D(n34), .CK(clk), .RN(n86), .Q(Q[1]), .QN(n2) );
  DFFRX2TS \Q_reg[0]  ( .D(n33), .CK(clk), .RN(n86), .Q(Q[0]), .QN(n1) );
  DFFRX2TS \Q_reg[10]  ( .D(n43), .CK(clk), .RN(n85), .Q(Q[10]), .QN(n11) );
  DFFRX2TS \Q_reg[2]  ( .D(n35), .CK(clk), .RN(n85), .Q(Q[2]), .QN(n3) );
  DFFRX2TS \Q_reg[9]  ( .D(n42), .CK(clk), .RN(n85), .Q(Q[9]), .QN(n10) );
  DFFRX2TS \Q_reg[8]  ( .D(n41), .CK(clk), .RN(n85), .Q(Q[8]), .QN(n9) );
  CLKBUFX2TS U2 ( .A(n92), .Y(n88) );
  CLKBUFX2TS U3 ( .A(n92), .Y(n87) );
  CLKBUFX2TS U4 ( .A(n91), .Y(n89) );
  CLKBUFX2TS U5 ( .A(n91), .Y(n90) );
  CLKBUFX2TS U6 ( .A(n94), .Y(n85) );
  CLKBUFX2TS U7 ( .A(n94), .Y(n84) );
  CLKBUFX2TS U8 ( .A(n94), .Y(n86) );
  OAI2BB2XLTS U9 ( .B0(n1), .B1(n93), .A0N(D[0]), .A1N(n90), .Y(n33) );
  OAI2BB2XLTS U10 ( .B0(n2), .B1(n88), .A0N(D[1]), .A1N(n90), .Y(n34) );
  OAI2BB2XLTS U11 ( .B0(n3), .B1(load), .A0N(D[2]), .A1N(n89), .Y(n35) );
  OAI2BB2XLTS U12 ( .B0(n4), .B1(n88), .A0N(D[3]), .A1N(n89), .Y(n36) );
  OAI2BB2XLTS U13 ( .B0(n5), .B1(n88), .A0N(D[4]), .A1N(n89), .Y(n37) );
  OAI2BB2XLTS U14 ( .B0(n6), .B1(n88), .A0N(D[5]), .A1N(n90), .Y(n38) );
  OAI2BB2XLTS U15 ( .B0(n7), .B1(n88), .A0N(D[6]), .A1N(n90), .Y(n39) );
  OAI2BB2XLTS U16 ( .B0(n8), .B1(n88), .A0N(D[7]), .A1N(n90), .Y(n40) );
  OAI2BB2XLTS U17 ( .B0(n9), .B1(n88), .A0N(D[8]), .A1N(n93), .Y(n41) );
  OAI2BB2XLTS U18 ( .B0(n10), .B1(n88), .A0N(D[9]), .A1N(n90), .Y(n42) );
  OAI2BB2XLTS U19 ( .B0(n11), .B1(n88), .A0N(D[10]), .A1N(n91), .Y(n43) );
  OAI2BB2XLTS U20 ( .B0(n12), .B1(n87), .A0N(D[11]), .A1N(n92), .Y(n44) );
  OAI2BB2XLTS U21 ( .B0(n13), .B1(n87), .A0N(D[12]), .A1N(n93), .Y(n45) );
  OAI2BB2XLTS U22 ( .B0(n14), .B1(n87), .A0N(D[13]), .A1N(n91), .Y(n46) );
  OAI2BB2XLTS U23 ( .B0(n15), .B1(n87), .A0N(D[14]), .A1N(n92), .Y(n47) );
  OAI2BB2XLTS U24 ( .B0(n16), .B1(n88), .A0N(D[15]), .A1N(n90), .Y(n48) );
  OAI2BB2XLTS U25 ( .B0(n17), .B1(n87), .A0N(D[16]), .A1N(n93), .Y(n49) );
  OAI2BB2XLTS U26 ( .B0(n18), .B1(n87), .A0N(D[17]), .A1N(n91), .Y(n50) );
  OAI2BB2XLTS U27 ( .B0(n19), .B1(n87), .A0N(D[18]), .A1N(n90), .Y(n51) );
  OAI2BB2XLTS U28 ( .B0(n20), .B1(n87), .A0N(D[19]), .A1N(n91), .Y(n52) );
  OAI2BB2XLTS U29 ( .B0(n21), .B1(n87), .A0N(D[20]), .A1N(n91), .Y(n53) );
  OAI2BB2XLTS U30 ( .B0(n22), .B1(n93), .A0N(D[21]), .A1N(n89), .Y(n54) );
  OAI2BB2XLTS U31 ( .B0(n23), .B1(n93), .A0N(D[22]), .A1N(n91), .Y(n55) );
  OAI2BB2XLTS U32 ( .B0(n24), .B1(n93), .A0N(D[23]), .A1N(n91), .Y(n56) );
  OAI2BB2XLTS U33 ( .B0(n25), .B1(n93), .A0N(D[24]), .A1N(n89), .Y(n57) );
  OAI2BB2XLTS U34 ( .B0(n26), .B1(n93), .A0N(D[25]), .A1N(n89), .Y(n58) );
  OAI2BB2XLTS U35 ( .B0(n27), .B1(n93), .A0N(D[26]), .A1N(n89), .Y(n59) );
  OAI2BB2XLTS U36 ( .B0(n28), .B1(n92), .A0N(D[27]), .A1N(n89), .Y(n60) );
  OAI2BB2XLTS U37 ( .B0(n29), .B1(n92), .A0N(D[28]), .A1N(n89), .Y(n61) );
  OAI2BB2XLTS U38 ( .B0(n30), .B1(n92), .A0N(D[29]), .A1N(n89), .Y(n62) );
  OAI2BB2XLTS U39 ( .B0(n31), .B1(n91), .A0N(D[30]), .A1N(n90), .Y(n63) );
  OAI2BB2XLTS U40 ( .B0(n32), .B1(n87), .A0N(n90), .A1N(D[31]), .Y(n65) );
  CLKBUFX2TS U41 ( .A(load), .Y(n91) );
  CLKBUFX2TS U42 ( .A(load), .Y(n92) );
  CLKBUFX2TS U43 ( .A(load), .Y(n93) );
  INVX2TS U44 ( .A(rst), .Y(n94) );
endmodule


module RegisterAdd_W1_0 ( clk, rst, load, D, Q );
  input [0:0] D;
  output [0:0] Q;
  input clk, rst, load;
  wire   n3, n4, n6;

  DFFRX2TS \Q_reg[0]  ( .D(n3), .CK(clk), .RN(n6), .Q(Q[0]), .QN(n4) );
  OAI2BB2XLTS U2 ( .B0(n4), .B1(load), .A0N(load), .A1N(D[0]), .Y(n3) );
  INVX2TS U3 ( .A(rst), .Y(n6) );
endmodule


module RegisterAdd_W31_0 ( clk, rst, load, D, Q );
  input [30:0] D;
  output [30:0] Q;
  input clk, rst, load;
  wire   n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77,
         n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91,
         n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104,
         n105, n106, n107, n108, n109, n110, n111, n112, n113, n114, n115,
         n116, n117, n118, n119, n120, n121, n122, n123, n124, n125, n126,
         n127, n128, n129, n130, n131, n132, n133, n134, n135, n136;

  OAI2BB2XLTS U2 ( .B0(n136), .B1(n67), .A0N(n71), .A1N(D[0]), .Y(n105) );
  OAI2BB2XLTS U3 ( .B0(n135), .B1(n67), .A0N(D[1]), .A1N(n71), .Y(n104) );
  OAI2BB2XLTS U4 ( .B0(n134), .B1(n67), .A0N(D[2]), .A1N(n70), .Y(n103) );
  OAI2BB2XLTS U5 ( .B0(n133), .B1(n67), .A0N(D[3]), .A1N(n70), .Y(n102) );
  OAI2BB2XLTS U6 ( .B0(n132), .B1(n67), .A0N(D[4]), .A1N(n70), .Y(n101) );
  OAI2BB2XLTS U7 ( .B0(n131), .B1(n67), .A0N(D[5]), .A1N(n70), .Y(n100) );
  OAI2BB2XLTS U8 ( .B0(n130), .B1(n68), .A0N(D[6]), .A1N(n70), .Y(n99) );
  OAI2BB2XLTS U9 ( .B0(n129), .B1(n68), .A0N(D[7]), .A1N(n70), .Y(n98) );
  OAI2BB2XLTS U10 ( .B0(n128), .B1(n68), .A0N(D[8]), .A1N(n70), .Y(n97) );
  OAI2BB2XLTS U11 ( .B0(n127), .B1(n68), .A0N(D[9]), .A1N(n70), .Y(n96) );
  OAI2BB2XLTS U12 ( .B0(n126), .B1(n68), .A0N(D[10]), .A1N(n70), .Y(n95) );
  OAI2BB2XLTS U13 ( .B0(n125), .B1(n68), .A0N(D[11]), .A1N(n70), .Y(n94) );
  OAI2BB2XLTS U14 ( .B0(n124), .B1(n69), .A0N(D[12]), .A1N(n71), .Y(n93) );
  OAI2BB2XLTS U15 ( .B0(n123), .B1(n69), .A0N(D[13]), .A1N(n71), .Y(n92) );
  OAI2BB2XLTS U16 ( .B0(n122), .B1(n68), .A0N(D[14]), .A1N(n71), .Y(n91) );
  OAI2BB2XLTS U17 ( .B0(n121), .B1(n69), .A0N(D[15]), .A1N(n71), .Y(n90) );
  OAI2BB2XLTS U18 ( .B0(n120), .B1(n69), .A0N(D[16]), .A1N(n71), .Y(n89) );
  OAI2BB2XLTS U19 ( .B0(n119), .B1(n69), .A0N(D[17]), .A1N(n71), .Y(n88) );
  OAI2BB2XLTS U20 ( .B0(n118), .B1(n69), .A0N(D[18]), .A1N(n71), .Y(n87) );
  OAI2BB2XLTS U21 ( .B0(n117), .B1(n72), .A0N(D[19]), .A1N(n72), .Y(n86) );
  OAI2BB2XLTS U22 ( .B0(n116), .B1(n69), .A0N(D[20]), .A1N(n72), .Y(n85) );
  OAI2BB2XLTS U23 ( .B0(n115), .B1(n69), .A0N(D[21]), .A1N(n72), .Y(n84) );
  OAI2BB2XLTS U24 ( .B0(n114), .B1(n69), .A0N(D[22]), .A1N(n71), .Y(n83) );
  OAI2BB2XLTS U25 ( .B0(n113), .B1(n69), .A0N(D[23]), .A1N(load), .Y(n82) );
  OAI2BB2XLTS U26 ( .B0(n112), .B1(n68), .A0N(D[24]), .A1N(n72), .Y(n81) );
  OAI2BB2XLTS U27 ( .B0(n111), .B1(n68), .A0N(D[25]), .A1N(n73), .Y(n80) );
  OAI2BB2XLTS U28 ( .B0(n110), .B1(n68), .A0N(D[26]), .A1N(n73), .Y(n79) );
  OAI2BB2XLTS U29 ( .B0(n109), .B1(n67), .A0N(D[27]), .A1N(n73), .Y(n78) );
  OAI2BB2XLTS U30 ( .B0(n108), .B1(n67), .A0N(D[28]), .A1N(n72), .Y(n77) );
  OAI2BB2XLTS U31 ( .B0(n107), .B1(n67), .A0N(D[29]), .A1N(n72), .Y(n76) );
  CLKINVX1TS U32 ( .A(rst), .Y(n75) );
  OAI2BB2XLTS U33 ( .B0(n106), .B1(n67), .A0N(D[30]), .A1N(n72), .Y(n74) );
  DFFRX2TS \Q_reg[30]  ( .D(n74), .CK(clk), .RN(n75), .Q(Q[30]), .QN(n106) );
  DFFRX2TS \Q_reg[29]  ( .D(n76), .CK(clk), .RN(n75), .Q(Q[29]), .QN(n107) );
  DFFRX2TS \Q_reg[28]  ( .D(n77), .CK(clk), .RN(n75), .Q(Q[28]), .QN(n108) );
  DFFRX2TS \Q_reg[27]  ( .D(n78), .CK(clk), .RN(n75), .Q(Q[27]), .QN(n109) );
  DFFRX2TS \Q_reg[26]  ( .D(n79), .CK(clk), .RN(n75), .Q(Q[26]), .QN(n110) );
  DFFRX2TS \Q_reg[25]  ( .D(n80), .CK(clk), .RN(n75), .Q(Q[25]), .QN(n111) );
  DFFRX2TS \Q_reg[24]  ( .D(n81), .CK(clk), .RN(n75), .Q(Q[24]), .QN(n112) );
  DFFRX2TS \Q_reg[23]  ( .D(n82), .CK(clk), .RN(n75), .Q(Q[23]), .QN(n113) );
  DFFRX2TS \Q_reg[22]  ( .D(n83), .CK(clk), .RN(n75), .Q(Q[22]), .QN(n114) );
  DFFRX2TS \Q_reg[21]  ( .D(n84), .CK(clk), .RN(n66), .Q(Q[21]), .QN(n115) );
  DFFRX2TS \Q_reg[20]  ( .D(n85), .CK(clk), .RN(n66), .Q(Q[20]), .QN(n116) );
  DFFRX2TS \Q_reg[19]  ( .D(n86), .CK(clk), .RN(n65), .Q(Q[19]), .QN(n117) );
  DFFRX2TS \Q_reg[18]  ( .D(n87), .CK(clk), .RN(n65), .Q(Q[18]), .QN(n118) );
  DFFRX2TS \Q_reg[17]  ( .D(n88), .CK(clk), .RN(n65), .Q(Q[17]), .QN(n119) );
  DFFRX2TS \Q_reg[16]  ( .D(n89), .CK(clk), .RN(n65), .Q(Q[16]), .QN(n120) );
  DFFRX2TS \Q_reg[15]  ( .D(n90), .CK(clk), .RN(n65), .Q(Q[15]), .QN(n121) );
  DFFRX2TS \Q_reg[14]  ( .D(n91), .CK(clk), .RN(n65), .Q(Q[14]), .QN(n122) );
  DFFRX2TS \Q_reg[13]  ( .D(n92), .CK(clk), .RN(n65), .Q(Q[13]), .QN(n123) );
  DFFRX2TS \Q_reg[12]  ( .D(n93), .CK(clk), .RN(n65), .Q(Q[12]), .QN(n124) );
  DFFRX2TS \Q_reg[11]  ( .D(n94), .CK(clk), .RN(n65), .Q(Q[11]), .QN(n125) );
  DFFRX2TS \Q_reg[10]  ( .D(n95), .CK(clk), .RN(n65), .Q(Q[10]), .QN(n126) );
  DFFRX2TS \Q_reg[9]  ( .D(n96), .CK(clk), .RN(n64), .Q(Q[9]), .QN(n127) );
  DFFRX2TS \Q_reg[8]  ( .D(n97), .CK(clk), .RN(n64), .Q(Q[8]), .QN(n128) );
  DFFRX2TS \Q_reg[7]  ( .D(n98), .CK(clk), .RN(n64), .Q(Q[7]), .QN(n129) );
  DFFRX2TS \Q_reg[6]  ( .D(n99), .CK(clk), .RN(n64), .Q(Q[6]), .QN(n130) );
  DFFRX2TS \Q_reg[5]  ( .D(n100), .CK(clk), .RN(n64), .Q(Q[5]), .QN(n131) );
  DFFRX2TS \Q_reg[4]  ( .D(n101), .CK(clk), .RN(n64), .Q(Q[4]), .QN(n132) );
  DFFRX2TS \Q_reg[3]  ( .D(n102), .CK(clk), .RN(n64), .Q(Q[3]), .QN(n133) );
  DFFRX2TS \Q_reg[2]  ( .D(n103), .CK(clk), .RN(n64), .Q(Q[2]), .QN(n134) );
  DFFRX2TS \Q_reg[1]  ( .D(n104), .CK(clk), .RN(n64), .Q(Q[1]), .QN(n135) );
  DFFRX2TS \Q_reg[0]  ( .D(n105), .CK(clk), .RN(n64), .Q(Q[0]), .QN(n136) );
  CLKBUFX2TS U34 ( .A(n66), .Y(n64) );
  CLKBUFX2TS U35 ( .A(n66), .Y(n65) );
  CLKBUFX2TS U36 ( .A(n73), .Y(n69) );
  CLKBUFX2TS U37 ( .A(n73), .Y(n68) );
  CLKBUFX2TS U38 ( .A(n72), .Y(n70) );
  CLKBUFX2TS U39 ( .A(n72), .Y(n71) );
  CLKBUFX2TS U40 ( .A(n75), .Y(n66) );
  CLKBUFX2TS U41 ( .A(load), .Y(n72) );
  CLKBUFX2TS U42 ( .A(load), .Y(n73) );
  CLKBUFX2TS U43 ( .A(load), .Y(n67) );
endmodule


module Oper_Start_In ( clk, rst, load_a_i, load_b_i, add_subt_i, Data_X_i, 
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

  RegisterAdd_W32_1 XRegister ( .clk(clk), .rst(rst), .load(load_a_i), .D(
        Data_X_i), .Q(intDX) );
  RegisterAdd_W32_0 YRegister ( .clk(clk), .rst(rst), .load(load_a_i), .D(
        Data_Y_i), .Q(intDY) );
  RegisterAdd_W1_1 ASRegister ( .clk(clk), .rst(rst), .load(load_a_i), .D(
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
  RegisterAdd_W31_1 MRegister ( .clk(clk), .rst(rst), .load(load_b_i), .D(intM), .Q(DMP_o) );
  RegisterAdd_W31_0 mRegister ( .clk(clk), .rst(rst), .load(load_b_i), .D(intm), .Q(DmP_o) );
  RegisterAdd_W1_0 SignRegister ( .clk(clk), .rst(rst), .load(load_b_i), .D(
        sign_result), .Q(sign_final_result_o) );
  AND2X2TS U2 ( .A(real_op_o), .B(eqXY), .Y(zero_flag_o) );
endmodule

