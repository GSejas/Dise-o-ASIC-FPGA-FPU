/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : L-2016.03-SP3
// Date      : Sun Nov 20 02:53:52 2016
/////////////////////////////////////////////////////////////


module GeAr_N20_R5_P5_with_recovery ( clk, in1, in2, res, if_error_delayed, 
        co1, co2, co3 );
  input [19:0] in1;
  input [19:0] in2;
  output [20:0] res;
  input clk;
  output if_error_delayed, co1, co2, co3;
  wire   if_error_1, if_error_delayed_1, if_error_2, if_error_delayed_2, n8,
         n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22,
         n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36,
         n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50,
         n51, n52, n53, n54, n55;
  assign co3 = res[20];

  DFFQX1TS if_error_delayed_1_reg ( .D(if_error_1), .CK(clk), .Q(
        if_error_delayed_1) );
  DFFQX1TS if_error_delayed_2_reg ( .D(if_error_2), .CK(clk), .Q(
        if_error_delayed_2) );
  OR2X1TS U17 ( .A(in2[5]), .B(if_error_delayed_1), .Y(n22) );
  OR2X1TS U18 ( .A(in2[10]), .B(if_error_delayed_2), .Y(n11) );
  OR2X1TS U19 ( .A(in1[10]), .B(if_error_delayed_2), .Y(n10) );
  OAI21XLTS U20 ( .A0(n15), .A1(n14), .B0(n13), .Y(n16) );
  NOR2XLTS U21 ( .A(n33), .B(n15), .Y(n17) );
  NOR2XLTS U22 ( .A(n24), .B(n27), .Y(n29) );
  OR2X1TS U23 ( .A(in1[5]), .B(if_error_delayed_1), .Y(n21) );
  OAI21XLTS U24 ( .A0(n27), .A1(n26), .B0(n25), .Y(n28) );
  OR2X1TS U25 ( .A(in1[0]), .B(in2[0]), .Y(n36) );
  OR2X1TS U26 ( .A(if_error_delayed_2), .B(if_error_delayed_1), .Y(
        if_error_delayed) );
  NAND2X1TS U27 ( .A(in1[0]), .B(in2[0]), .Y(n45) );
  OAI22X1TS U28 ( .A0(in1[5]), .A1(in2[5]), .B0(in1[8]), .B1(in2[8]), .Y(n9)
         );
  NOR2XLTS U29 ( .A(in2[6]), .B(in1[6]), .Y(n8) );
  NOR2X1TS U30 ( .A(in1[7]), .B(in2[7]), .Y(n24) );
  NOR4BX1TS U31 ( .AN(co1), .B(n9), .C(n8), .D(n24), .Y(if_error_1) );
  NAND2X1TS U32 ( .A(n11), .B(n10), .Y(n12) );
  AFHCINX2TS U33 ( .CIN(n12), .B(in1[11]), .A(in2[11]), .CO(n18) );
  NOR2X1TS U34 ( .A(in1[12]), .B(in2[12]), .Y(n33) );
  NOR2X1TS U35 ( .A(in1[13]), .B(in2[13]), .Y(n15) );
  NAND2X1TS U36 ( .A(in1[12]), .B(in2[12]), .Y(n14) );
  NAND2X1TS U37 ( .A(in1[13]), .B(in2[13]), .Y(n13) );
  AOI21X1TS U38 ( .A0(n18), .A1(n17), .B0(n16), .Y(n19) );
  AFHCINX2TS U39 ( .CIN(n19), .B(in1[14]), .A(in2[14]), .CO(n50) );
  INVX2TS U40 ( .A(n20), .Y(res[20]) );
  NAND2X1TS U41 ( .A(n22), .B(n21), .Y(n23) );
  AFHCINX2TS U42 ( .CIN(n23), .B(in1[6]), .A(in2[6]), .CO(n30) );
  NOR2X1TS U43 ( .A(in1[8]), .B(in2[8]), .Y(n27) );
  NAND2X1TS U44 ( .A(in1[7]), .B(in2[7]), .Y(n26) );
  NAND2X1TS U45 ( .A(in1[8]), .B(in2[8]), .Y(n25) );
  AOI21X1TS U46 ( .A0(n30), .A1(n29), .B0(n28), .Y(n31) );
  AFHCINX2TS U47 ( .CIN(n31), .B(in1[9]), .A(in2[9]), .CO(n55) );
  INVX2TS U48 ( .A(n32), .Y(co2) );
  OAI22X1TS U49 ( .A0(in1[10]), .A1(in2[10]), .B0(in1[13]), .B1(in2[13]), .Y(
        n35) );
  NOR2XLTS U50 ( .A(in2[11]), .B(in1[11]), .Y(n34) );
  NOR4BX1TS U51 ( .AN(co2), .B(n35), .C(n34), .D(n33), .Y(if_error_2) );
  CLKAND2X2TS U52 ( .A(n36), .B(n45), .Y(res[0]) );
  AFHCINX2TS U53 ( .CIN(n37), .B(in1[9]), .A(in2[9]), .S(res[9]), .CO(co1) );
  AFHCONX2TS U54 ( .A(in2[8]), .B(in1[8]), .CI(n38), .CON(n37), .S(res[8]) );
  AFHCINX2TS U55 ( .CIN(n39), .B(in1[7]), .A(in2[7]), .S(res[7]), .CO(n38) );
  AFHCONX2TS U56 ( .A(in2[6]), .B(in1[6]), .CI(n40), .CON(n39), .S(res[6]) );
  AFHCINX2TS U57 ( .CIN(n41), .B(in1[5]), .A(in2[5]), .S(res[5]), .CO(n40) );
  AFHCONX2TS U58 ( .A(in2[4]), .B(in1[4]), .CI(n42), .CON(n41), .S(res[4]) );
  AFHCINX2TS U59 ( .CIN(n43), .B(in1[3]), .A(in2[3]), .S(res[3]), .CO(n42) );
  AFHCONX2TS U60 ( .A(in2[2]), .B(in1[2]), .CI(n44), .CON(n43), .S(res[2]) );
  AFHCINX2TS U61 ( .CIN(n45), .B(in1[1]), .A(in2[1]), .S(res[1]), .CO(n44) );
  AFHCONX2TS U62 ( .A(in2[19]), .B(in1[19]), .CI(n46), .CON(n20), .S(res[19])
         );
  AFHCINX2TS U63 ( .CIN(n47), .B(in1[18]), .A(in2[18]), .S(res[18]), .CO(n46)
         );
  AFHCONX2TS U64 ( .A(in2[17]), .B(in1[17]), .CI(n48), .CON(n47), .S(res[17])
         );
  AFHCINX2TS U65 ( .CIN(n49), .B(in1[16]), .A(in2[16]), .S(res[16]), .CO(n48)
         );
  AFHCONX2TS U66 ( .A(in2[15]), .B(in1[15]), .CI(n50), .CON(n49), .S(res[15])
         );
  AFHCONX2TS U67 ( .A(in2[14]), .B(in1[14]), .CI(n51), .CON(n32), .S(res[14])
         );
  AFHCINX2TS U68 ( .CIN(n52), .B(in1[13]), .A(in2[13]), .S(res[13]), .CO(n51)
         );
  AFHCONX2TS U69 ( .A(in2[12]), .B(in1[12]), .CI(n53), .CON(n52), .S(res[12])
         );
  AFHCINX2TS U70 ( .CIN(n54), .B(in1[11]), .A(in2[11]), .S(res[11]), .CO(n53)
         );
  AFHCONX2TS U71 ( .A(in2[10]), .B(in1[10]), .CI(n55), .CON(n54), .S(res[10])
         );
initial $sdf_annotate("GeAr_N20_R5_P5_with_recovery_syn.sdf"); 
 endmodule

