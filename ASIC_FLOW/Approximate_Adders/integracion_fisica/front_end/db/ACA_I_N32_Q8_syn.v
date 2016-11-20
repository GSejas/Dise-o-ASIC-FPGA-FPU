/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : L-2016.03-SP3
// Date      : Sun Nov 20 02:17:49 2016
/////////////////////////////////////////////////////////////


module ACA_I_N32_Q8_DW01_add_J6_0 ( A, B, CI, SUM, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] SUM;
  input CI;
  output CO;
  wire   n35, n36, n37, n38, n39, n40, n41, n42, n43, n44;

  NOR2X1TS U13 ( .A(A[6]), .B(B[6]), .Y(n42) );
  NOR2X1TS U14 ( .A(A[4]), .B(B[4]), .Y(n39) );
  OAI2BB2X2TS U15 ( .B0(n37), .B1(n36), .A0N(A[2]), .A1N(B[2]), .Y(n38) );
  CLKAND2X2TS U16 ( .A(A[0]), .B(B[0]), .Y(n35) );
  AOI222X1TS U17 ( .A0(B[1]), .A1(A[1]), .B0(B[1]), .B1(n35), .C0(A[1]), .C1(
        n35), .Y(n37) );
  NOR2X1TS U18 ( .A(A[2]), .B(B[2]), .Y(n36) );
  AOI222X1TS U19 ( .A0(B[3]), .A1(A[3]), .B0(B[3]), .B1(n38), .C0(A[3]), .C1(
        n38), .Y(n40) );
  OAI2BB2X1TS U20 ( .B0(n40), .B1(n39), .A0N(A[4]), .A1N(B[4]), .Y(n41) );
  AOI222X1TS U21 ( .A0(B[5]), .A1(A[5]), .B0(B[5]), .B1(n41), .C0(A[5]), .C1(
        n41), .Y(n43) );
  OAI2BB2X1TS U22 ( .B0(n43), .B1(n42), .A0N(A[6]), .A1N(B[6]), .Y(n44) );
  CMPR32X2TS U23 ( .A(A[7]), .B(B[7]), .C(n44), .CO(SUM[8]), .S(SUM[7]) );
initial $sdf_annotate("ACA_I_N32_Q8_syn.sdf"); 
 endmodule


module ACA_I_N32_Q8_DW01_add_J6_1 ( A, B, CI, SUM, CO );
  input [7:0] A;
  input [7:0] B;
  output [7:0] SUM;
  input CI;
  output CO;
  wire   n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44;

  CLKAND2X2TS U13 ( .A(B[0]), .B(A[0]), .Y(n34) );
  BUFX3TS U14 ( .A(A[1]), .Y(n33) );
  BUFX3TS U15 ( .A(B[1]), .Y(n32) );
  XOR2X1TS U16 ( .A(A[7]), .B(n44), .Y(SUM[7]) );
  AOI222X2TS U17 ( .A0(B[2]), .A1(A[2]), .B0(B[2]), .B1(n36), .C0(A[2]), .C1(
        n36), .Y(n38) );
  OAI21X4TS U18 ( .A0(n33), .A1(n32), .B0(n34), .Y(n35) );
  OAI2BB1X1TS U19 ( .A0N(n32), .A1N(n33), .B0(n35), .Y(n36) );
  NOR2X1TS U20 ( .A(A[3]), .B(B[3]), .Y(n37) );
  OAI2BB2X2TS U21 ( .B0(n38), .B1(n37), .A0N(A[3]), .A1N(B[3]), .Y(n39) );
  AOI222X1TS U22 ( .A0(B[4]), .A1(A[4]), .B0(B[4]), .B1(n39), .C0(A[4]), .C1(
        n39), .Y(n41) );
  NOR2X1TS U23 ( .A(A[5]), .B(B[5]), .Y(n40) );
  OAI2BB2X2TS U24 ( .B0(n41), .B1(n40), .A0N(A[5]), .A1N(B[5]), .Y(n42) );
  AOI222X1TS U25 ( .A0(B[6]), .A1(A[6]), .B0(B[6]), .B1(n42), .C0(A[6]), .C1(
        n42), .Y(n43) );
  XNOR2X2TS U26 ( .A(n43), .B(B[7]), .Y(n44) );
initial $sdf_annotate("ACA_I_N32_Q8_syn.sdf"); 
 endmodule


module ACA_I_N32_Q8_DW01_add_J6_2 ( A, B, CI, SUM, CO );
  input [7:0] A;
  input [7:0] B;
  output [7:0] SUM;
  input CI;
  output CO;
  wire   n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44;

  CLKAND2X2TS U13 ( .A(B[0]), .B(A[0]), .Y(n34) );
  XOR2X1TS U14 ( .A(A[7]), .B(n44), .Y(SUM[7]) );
  AOI222X2TS U15 ( .A0(n32), .A1(n33), .B0(n32), .B1(n36), .C0(n33), .C1(n36), 
        .Y(n38) );
  CLKBUFX2TS U16 ( .A(B[2]), .Y(n32) );
  CLKBUFX2TS U17 ( .A(A[2]), .Y(n33) );
  OAI21X4TS U18 ( .A0(A[1]), .A1(B[1]), .B0(n34), .Y(n35) );
  OAI2BB1X1TS U19 ( .A0N(B[1]), .A1N(A[1]), .B0(n35), .Y(n36) );
  NOR2X1TS U20 ( .A(A[3]), .B(B[3]), .Y(n37) );
  OAI2BB2X2TS U21 ( .B0(n38), .B1(n37), .A0N(A[3]), .A1N(B[3]), .Y(n39) );
  AOI222X1TS U22 ( .A0(B[4]), .A1(A[4]), .B0(B[4]), .B1(n39), .C0(A[4]), .C1(
        n39), .Y(n41) );
  NOR2X1TS U23 ( .A(A[5]), .B(B[5]), .Y(n40) );
  OAI2BB2X2TS U24 ( .B0(n41), .B1(n40), .A0N(A[5]), .A1N(B[5]), .Y(n42) );
  AOI222X1TS U25 ( .A0(B[6]), .A1(A[6]), .B0(B[6]), .B1(n42), .C0(A[6]), .C1(
        n42), .Y(n43) );
  XNOR2X2TS U26 ( .A(n43), .B(B[7]), .Y(n44) );
initial $sdf_annotate("ACA_I_N32_Q8_syn.sdf"); 
 endmodule


module ACA_I_N32_Q8_DW01_add_J6_3 ( A, B, CI, SUM, CO );
  input [7:0] A;
  input [7:0] B;
  output [7:0] SUM;
  input CI;
  output CO;
  wire   n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44;

  CLKAND2X2TS U13 ( .A(B[0]), .B(A[0]), .Y(n34) );
  XOR2X1TS U14 ( .A(A[7]), .B(n44), .Y(SUM[7]) );
  AOI222X2TS U15 ( .A0(B[2]), .A1(A[2]), .B0(B[2]), .B1(n36), .C0(A[2]), .C1(
        n36), .Y(n38) );
  CLKBUFX2TS U16 ( .A(B[3]), .Y(n32) );
  CLKBUFX2TS U17 ( .A(A[3]), .Y(n33) );
  OAI21X4TS U18 ( .A0(A[1]), .A1(B[1]), .B0(n34), .Y(n35) );
  OAI2BB1X1TS U19 ( .A0N(B[1]), .A1N(A[1]), .B0(n35), .Y(n36) );
  NOR2X1TS U20 ( .A(n33), .B(n32), .Y(n37) );
  OAI2BB2X2TS U21 ( .B0(n38), .B1(n37), .A0N(n33), .A1N(n32), .Y(n39) );
  AOI222X1TS U22 ( .A0(B[4]), .A1(A[4]), .B0(B[4]), .B1(n39), .C0(A[4]), .C1(
        n39), .Y(n41) );
  NOR2X1TS U23 ( .A(A[5]), .B(B[5]), .Y(n40) );
  OAI2BB2X2TS U24 ( .B0(n41), .B1(n40), .A0N(A[5]), .A1N(B[5]), .Y(n42) );
  AOI222X1TS U25 ( .A0(B[6]), .A1(A[6]), .B0(B[6]), .B1(n42), .C0(A[6]), .C1(
        n42), .Y(n43) );
  XNOR2X2TS U26 ( .A(n43), .B(B[7]), .Y(n44) );
initial $sdf_annotate("ACA_I_N32_Q8_syn.sdf"); 
 endmodule


module ACA_I_N32_Q8 ( in1, in2, res );
  input [31:0] in1;
  input [31:0] in2;
  output [32:0] res;
  wire   n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
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
         n145, n146, n147, n148, n149, n150, n151, n152, n153, n154, n155,
         n156, n157, n158, n159, n160, n161, n162, n163, n164, n165, n166,
         n167, n168, n169, n170, n171, n172, n173, n174, n175, n176, n177,
         n178, n179, n180, n181, n182, n183, n184, n185, n186, n187, n188,
         n189, n190, n191, n192, n193, n194, n195, n196, n197, n198, n199,
         n200, n201, n202, n203, n204, n205, n206, n207, n208, n209, n210,
         n211, n212, n213, n214, n215, n216, n217, n218,
         SYNOPSYS_UNCONNECTED_1, SYNOPSYS_UNCONNECTED_2,
         SYNOPSYS_UNCONNECTED_3, SYNOPSYS_UNCONNECTED_4,
         SYNOPSYS_UNCONNECTED_5, SYNOPSYS_UNCONNECTED_6,
         SYNOPSYS_UNCONNECTED_7, SYNOPSYS_UNCONNECTED_8,
         SYNOPSYS_UNCONNECTED_9, SYNOPSYS_UNCONNECTED_10,
         SYNOPSYS_UNCONNECTED_11, SYNOPSYS_UNCONNECTED_12,
         SYNOPSYS_UNCONNECTED_13, SYNOPSYS_UNCONNECTED_14,
         SYNOPSYS_UNCONNECTED_15, SYNOPSYS_UNCONNECTED_16,
         SYNOPSYS_UNCONNECTED_17, SYNOPSYS_UNCONNECTED_18,
         SYNOPSYS_UNCONNECTED_19, SYNOPSYS_UNCONNECTED_20,
         SYNOPSYS_UNCONNECTED_21, SYNOPSYS_UNCONNECTED_22,
         SYNOPSYS_UNCONNECTED_23, SYNOPSYS_UNCONNECTED_24,
         SYNOPSYS_UNCONNECTED_25, SYNOPSYS_UNCONNECTED_26,
         SYNOPSYS_UNCONNECTED_27, SYNOPSYS_UNCONNECTED_28;

  ACA_I_N32_Q8_DW01_add_J6_0 add_x_25 ( .A({1'b0, in1[31:27], n20, n26, 
        in1[24]}), .B({1'b0, in2[31:27], n18, n24, in2[24]}), .CI(1'b0), .SUM(
        {res[32:31], SYNOPSYS_UNCONNECTED_1, SYNOPSYS_UNCONNECTED_2, 
        SYNOPSYS_UNCONNECTED_3, SYNOPSYS_UNCONNECTED_4, SYNOPSYS_UNCONNECTED_5, 
        SYNOPSYS_UNCONNECTED_6, SYNOPSYS_UNCONNECTED_7}) );
  ACA_I_N32_Q8_DW01_add_J6_1 add_x_24 ( .A({in1[30:26], n26, in1[24:23]}), .B(
        {in2[30:26], n24, in2[24:23]}), .CI(1'b0), .SUM({res[30], 
        SYNOPSYS_UNCONNECTED_8, SYNOPSYS_UNCONNECTED_9, 
        SYNOPSYS_UNCONNECTED_10, SYNOPSYS_UNCONNECTED_11, 
        SYNOPSYS_UNCONNECTED_12, SYNOPSYS_UNCONNECTED_13, 
        SYNOPSYS_UNCONNECTED_14}) );
  ACA_I_N32_Q8_DW01_add_J6_2 add_x_23 ( .A({in1[29:27], n20, in1[25:22]}), .B(
        {in2[29:27], n18, in2[25:22]}), .CI(1'b0), .SUM({res[29], 
        SYNOPSYS_UNCONNECTED_15, SYNOPSYS_UNCONNECTED_16, 
        SYNOPSYS_UNCONNECTED_17, SYNOPSYS_UNCONNECTED_18, 
        SYNOPSYS_UNCONNECTED_19, SYNOPSYS_UNCONNECTED_20, 
        SYNOPSYS_UNCONNECTED_21}) );
  ACA_I_N32_Q8_DW01_add_J6_3 add_x_22 ( .A(in1[28:21]), .B(in2[28:21]), .CI(
        1'b0), .SUM({res[28], SYNOPSYS_UNCONNECTED_22, SYNOPSYS_UNCONNECTED_23, 
        SYNOPSYS_UNCONNECTED_24, SYNOPSYS_UNCONNECTED_25, 
        SYNOPSYS_UNCONNECTED_26, SYNOPSYS_UNCONNECTED_27, 
        SYNOPSYS_UNCONNECTED_28}) );
  INVX2TS U2 ( .A(n38), .Y(n40) );
  CLKAND2X2TS U3 ( .A(in2[16]), .B(in1[16]), .Y(n6) );
  CLKAND2X2TS U4 ( .A(in2[17]), .B(in1[17]), .Y(n7) );
  CLKAND2X2TS U5 ( .A(in2[18]), .B(in1[18]), .Y(n8) );
  CLKAND2X2TS U6 ( .A(in2[15]), .B(in1[15]), .Y(n9) );
  INVX3TS U7 ( .A(in2[20]), .Y(n33) );
  CLKINVX6TS U8 ( .A(in1[20]), .Y(n38) );
  OAI21X2TS U9 ( .A0(in1[14]), .A1(in2[14]), .B0(n4), .Y(n145) );
  AND2X4TS U10 ( .A(n34), .B(n39), .Y(n2) );
  AND2X4TS U11 ( .A(n32), .B(in1[19]), .Y(n3) );
  INVX2TS U12 ( .A(in1[19]), .Y(n36) );
  XOR2X1TS U13 ( .A(n30), .B(n171), .Y(res[22]) );
  XOR2X1TS U14 ( .A(n11), .B(n189), .Y(res[24]) );
  XOR2X1TS U15 ( .A(n28), .B(n180), .Y(res[23]) );
  AOI222X2TS U16 ( .A0(n27), .A1(n28), .B0(n27), .B1(n187), .C0(n28), .C1(n187), .Y(n188) );
  AOI222X2TS U17 ( .A0(n29), .A1(n30), .B0(n29), .B1(n178), .C0(n30), .C1(n178), .Y(n179) );
  AOI222X2TS U18 ( .A0(n35), .A1(n16), .B0(n35), .B1(n169), .C0(n16), .C1(n169), .Y(n170) );
  CLKAND2X2TS U19 ( .A(in2[4]), .B(in1[4]), .Y(n73) );
  CLKAND2X2TS U20 ( .A(in2[6]), .B(in1[6]), .Y(n89) );
  CLKAND2X2TS U21 ( .A(in2[7]), .B(in1[7]), .Y(n97) );
  CLKAND2X2TS U22 ( .A(in2[9]), .B(in1[9]), .Y(n113) );
  CLKAND2X2TS U23 ( .A(in2[3]), .B(in1[3]), .Y(n65) );
  CLKAND2X2TS U24 ( .A(in2[12]), .B(in1[12]), .Y(n137) );
  CLKAND2X2TS U25 ( .A(in2[11]), .B(in1[11]), .Y(n129) );
  CLKAND2X2TS U26 ( .A(in2[2]), .B(in1[2]), .Y(n57) );
  CLKAND2X2TS U27 ( .A(in2[5]), .B(in1[5]), .Y(n81) );
  CLKAND2X2TS U28 ( .A(in2[8]), .B(in1[8]), .Y(n105) );
  XOR2X2TS U29 ( .A(in1[27]), .B(n218), .Y(res[27]) );
  XOR2X1TS U30 ( .A(n40), .B(n153), .Y(res[20]) );
  XOR2X1TS U31 ( .A(n72), .B(n71), .Y(res[10]) );
  XOR2X1TS U32 ( .A(n120), .B(n119), .Y(res[16]) );
  XOR2X1TS U33 ( .A(n136), .B(n135), .Y(res[18]) );
  XOR2X1TS U34 ( .A(n144), .B(n143), .Y(res[19]) );
  XOR2X1TS U35 ( .A(n88), .B(n87), .Y(res[12]) );
  XOR2X1TS U36 ( .A(n104), .B(n103), .Y(res[14]) );
  XOR2X1TS U37 ( .A(n42), .B(n41), .Y(res[7]) );
  XOR2X1TS U38 ( .A(n56), .B(n55), .Y(res[8]) );
  XOR2X1TS U39 ( .A(n128), .B(n127), .Y(res[17]) );
  XOR2X1TS U40 ( .A(n64), .B(n63), .Y(res[9]) );
  XOR2X1TS U41 ( .A(n96), .B(n95), .Y(res[13]) );
  XOR2X1TS U42 ( .A(n112), .B(n111), .Y(res[15]) );
  XOR2X1TS U43 ( .A(n80), .B(n79), .Y(res[11]) );
  AOI222X2TS U44 ( .A0(in2[17]), .A1(in1[17]), .B0(in2[17]), .B1(n149), .C0(
        in1[17]), .C1(n149), .Y(n150) );
  OAI21X2TS U45 ( .A0(n39), .A1(n34), .B0(n3), .Y(n199) );
  INVX6TS U46 ( .A(n31), .Y(n32) );
  INVX6TS U47 ( .A(n33), .Y(n34) );
  INVX4TS U48 ( .A(n38), .Y(n39) );
  INVX8TS U49 ( .A(in2[19]), .Y(n31) );
  XOR2X1TS U50 ( .A(in1[7]), .B(in2[7]), .Y(n41) );
  XOR2X1TS U51 ( .A(in1[10]), .B(in2[10]), .Y(n71) );
  NOR2X1TS U52 ( .A(in1[16]), .B(in2[16]), .Y(n147) );
  AOI222X2TS U53 ( .A0(in2[23]), .A1(in1[23]), .B0(in2[23]), .B1(n203), .C0(
        in1[23]), .C1(n203), .Y(n205) );
  OAI2BB2X2TS U54 ( .B0(n195), .B1(n211), .A0N(n28), .A1N(n27), .Y(n196) );
  XOR2X1TS U55 ( .A(in1[25]), .B(n198), .Y(res[25]) );
  AOI222X2TS U56 ( .A0(in2[24]), .A1(in1[24]), .B0(in2[24]), .B1(n213), .C0(
        in1[24]), .C1(n213), .Y(n215) );
  XNOR2X1TS U57 ( .A(n197), .B(in2[25]), .Y(n198) );
  AOI222X2TS U58 ( .A0(n10), .A1(n11), .B0(in2[24]), .B1(n196), .C0(in1[24]), 
        .C1(n196), .Y(n197) );
  CLKAND2X2TS U59 ( .A(in2[1]), .B(in1[1]), .Y(n49) );
  CLKAND2X2TS U60 ( .A(in2[10]), .B(in1[10]), .Y(n121) );
  XOR2X1TS U61 ( .A(in1[8]), .B(in2[8]), .Y(n55) );
  XOR2X1TS U62 ( .A(in1[9]), .B(in2[9]), .Y(n63) );
  XOR2X1TS U63 ( .A(in1[11]), .B(in2[11]), .Y(n79) );
  XOR2X1TS U64 ( .A(in1[12]), .B(in2[12]), .Y(n87) );
  XOR2X1TS U65 ( .A(in1[13]), .B(in2[13]), .Y(n95) );
  XOR2X1TS U66 ( .A(in1[14]), .B(in2[14]), .Y(n103) );
  XOR2X1TS U67 ( .A(in1[15]), .B(in2[15]), .Y(n111) );
  XOR2X1TS U68 ( .A(n22), .B(n21), .Y(n119) );
  XOR2X1TS U69 ( .A(n14), .B(n12), .Y(n127) );
  XOR2X1TS U70 ( .A(n15), .B(n13), .Y(n135) );
  XOR2X1TS U71 ( .A(n37), .B(in2[19]), .Y(n143) );
  INVX2TS U72 ( .A(in2[25]), .Y(n23) );
  INVX2TS U73 ( .A(in1[25]), .Y(n25) );
  AND2X4TS U74 ( .A(in2[13]), .B(in1[13]), .Y(n4) );
  AND2X4TS U75 ( .A(in2[14]), .B(in1[14]), .Y(n5) );
  CLKBUFX2TS U76 ( .A(in2[24]), .Y(n10) );
  CLKBUFX2TS U77 ( .A(in1[24]), .Y(n11) );
  CLKBUFX2TS U78 ( .A(in2[17]), .Y(n12) );
  CLKBUFX2TS U79 ( .A(in2[18]), .Y(n13) );
  CLKBUFX2TS U80 ( .A(in1[17]), .Y(n14) );
  CLKBUFX2TS U81 ( .A(in1[18]), .Y(n15) );
  CLKBUFX2TS U82 ( .A(in1[21]), .Y(n16) );
  INVX2TS U83 ( .A(in2[26]), .Y(n17) );
  INVX2TS U84 ( .A(n17), .Y(n18) );
  INVX2TS U85 ( .A(in1[26]), .Y(n19) );
  INVX2TS U86 ( .A(n19), .Y(n20) );
  CLKBUFX2TS U87 ( .A(in2[16]), .Y(n21) );
  CLKBUFX2TS U88 ( .A(in1[16]), .Y(n22) );
  OAI2BB2X1TS U89 ( .B0(n148), .B1(n147), .A0N(in1[16]), .A1N(in2[16]), .Y(
        n149) );
  INVX2TS U90 ( .A(n23), .Y(n24) );
  INVX2TS U91 ( .A(n25), .Y(n26) );
  CLKBUFX2TS U92 ( .A(in2[23]), .Y(n27) );
  CLKBUFX2TS U93 ( .A(in1[23]), .Y(n28) );
  CLKBUFX2TS U94 ( .A(in2[22]), .Y(n29) );
  CLKBUFX2TS U95 ( .A(in1[22]), .Y(n30) );
  CLKBUFX2TS U96 ( .A(in2[21]), .Y(n35) );
  INVX2TS U97 ( .A(n36), .Y(n37) );
  OAI2BB1X2TS U98 ( .A0N(in2[14]), .A1N(in1[14]), .B0(n145), .Y(n146) );
  OAI2BB1X2TS U99 ( .A0N(n34), .A1N(n39), .B0(n199), .Y(n200) );
  OAI2BB1X2TS U100 ( .A0N(in2[21]), .A1N(in1[21]), .B0(n209), .Y(n210) );
  OAI2BB1X2TS U101 ( .A0N(in2[15]), .A1N(in1[15]), .B0(n154), .Y(n155) );
  OAI2BB1X2TS U102 ( .A0N(in2[18]), .A1N(in1[18]), .B0(n181), .Y(n182) );
  OAI21X2TS U103 ( .A0(in1[18]), .A1(in2[18]), .B0(n7), .Y(n181) );
  OAI2BB1X2TS U104 ( .A0N(n32), .A1N(in1[19]), .B0(n190), .Y(n191) );
  OAI21X2TS U105 ( .A0(in1[19]), .A1(n32), .B0(n8), .Y(n190) );
  OAI2BB1X2TS U106 ( .A0N(in2[16]), .A1N(in1[16]), .B0(n163), .Y(n164) );
  OAI21X2TS U107 ( .A0(in1[16]), .A1(in2[16]), .B0(n9), .Y(n163) );
  OAI2BB1X2TS U108 ( .A0N(in2[17]), .A1N(in1[17]), .B0(n172), .Y(n173) );
  OAI21X2TS U109 ( .A0(in1[17]), .A1(in2[17]), .B0(n6), .Y(n172) );
  ADDHXLTS U110 ( .A(in2[0]), .B(in1[0]), .CO(n48), .S(res[0]) );
  CMPR32X2TS U111 ( .A(in1[6]), .B(in2[6]), .C(n43), .CO(n42), .S(res[6]) );
  CMPR32X2TS U112 ( .A(in1[5]), .B(in2[5]), .C(n44), .CO(n43), .S(res[5]) );
  CMPR32X2TS U113 ( .A(in1[4]), .B(in2[4]), .C(n45), .CO(n44), .S(res[4]) );
  CMPR32X2TS U114 ( .A(in1[3]), .B(in2[3]), .C(n46), .CO(n45), .S(res[3]) );
  CMPR32X2TS U115 ( .A(in1[2]), .B(in2[2]), .C(n47), .CO(n46), .S(res[2]) );
  CMPR32X2TS U116 ( .A(in1[1]), .B(in2[1]), .C(n48), .CO(n47), .S(res[1]) );
  CMPR32X2TS U117 ( .A(in1[2]), .B(in2[2]), .C(n49), .CO(n50) );
  CMPR32X2TS U118 ( .A(in1[3]), .B(in2[3]), .C(n50), .CO(n51) );
  CMPR32X2TS U119 ( .A(in1[4]), .B(in2[4]), .C(n51), .CO(n52) );
  CMPR32X2TS U120 ( .A(in1[5]), .B(in2[5]), .C(n52), .CO(n53) );
  CMPR32X2TS U121 ( .A(in1[6]), .B(in2[6]), .C(n53), .CO(n54) );
  CMPR32X2TS U122 ( .A(in1[7]), .B(in2[7]), .C(n54), .CO(n56) );
  CMPR32X2TS U123 ( .A(in1[3]), .B(in2[3]), .C(n57), .CO(n58) );
  CMPR32X2TS U124 ( .A(in1[4]), .B(in2[4]), .C(n58), .CO(n59) );
  CMPR32X2TS U125 ( .A(in1[5]), .B(in2[5]), .C(n59), .CO(n60) );
  CMPR32X2TS U126 ( .A(in1[6]), .B(in2[6]), .C(n60), .CO(n61) );
  CMPR32X2TS U127 ( .A(in1[7]), .B(in2[7]), .C(n61), .CO(n62) );
  CMPR32X2TS U128 ( .A(in1[8]), .B(in2[8]), .C(n62), .CO(n64) );
  CMPR32X2TS U129 ( .A(in1[4]), .B(in2[4]), .C(n65), .CO(n66) );
  CMPR32X2TS U130 ( .A(in1[5]), .B(in2[5]), .C(n66), .CO(n67) );
  CMPR32X2TS U131 ( .A(in1[6]), .B(in2[6]), .C(n67), .CO(n68) );
  CMPR32X2TS U132 ( .A(in1[7]), .B(in2[7]), .C(n68), .CO(n69) );
  CMPR32X2TS U133 ( .A(in1[8]), .B(in2[8]), .C(n69), .CO(n70) );
  CMPR32X2TS U134 ( .A(in1[9]), .B(in2[9]), .C(n70), .CO(n72) );
  CMPR32X2TS U135 ( .A(in1[5]), .B(in2[5]), .C(n73), .CO(n74) );
  CMPR32X2TS U136 ( .A(in1[6]), .B(in2[6]), .C(n74), .CO(n75) );
  CMPR32X2TS U137 ( .A(in1[7]), .B(in2[7]), .C(n75), .CO(n76) );
  CMPR32X2TS U138 ( .A(in1[8]), .B(in2[8]), .C(n76), .CO(n77) );
  CMPR32X2TS U139 ( .A(in1[9]), .B(in2[9]), .C(n77), .CO(n78) );
  CMPR32X2TS U140 ( .A(in1[10]), .B(in2[10]), .C(n78), .CO(n80) );
  CMPR32X2TS U141 ( .A(in1[6]), .B(in2[6]), .C(n81), .CO(n82) );
  CMPR32X2TS U142 ( .A(in1[7]), .B(in2[7]), .C(n82), .CO(n83) );
  CMPR32X2TS U143 ( .A(in1[8]), .B(in2[8]), .C(n83), .CO(n84) );
  CMPR32X2TS U144 ( .A(in1[9]), .B(in2[9]), .C(n84), .CO(n85) );
  CMPR32X2TS U145 ( .A(in1[10]), .B(in2[10]), .C(n85), .CO(n86) );
  CMPR32X2TS U146 ( .A(in1[11]), .B(in2[11]), .C(n86), .CO(n88) );
  CMPR32X2TS U147 ( .A(in1[7]), .B(in2[7]), .C(n89), .CO(n90) );
  CMPR32X2TS U148 ( .A(in1[8]), .B(in2[8]), .C(n90), .CO(n91) );
  CMPR32X2TS U149 ( .A(in1[9]), .B(in2[9]), .C(n91), .CO(n92) );
  CMPR32X2TS U150 ( .A(in1[10]), .B(in2[10]), .C(n92), .CO(n93) );
  CMPR32X2TS U151 ( .A(in1[11]), .B(in2[11]), .C(n93), .CO(n94) );
  CMPR32X2TS U152 ( .A(in1[12]), .B(in2[12]), .C(n94), .CO(n96) );
  CMPR32X2TS U153 ( .A(in1[8]), .B(in2[8]), .C(n97), .CO(n98) );
  CMPR32X2TS U154 ( .A(in1[9]), .B(in2[9]), .C(n98), .CO(n99) );
  CMPR32X2TS U155 ( .A(in1[10]), .B(in2[10]), .C(n99), .CO(n100) );
  CMPR32X2TS U156 ( .A(in1[11]), .B(in2[11]), .C(n100), .CO(n101) );
  CMPR32X2TS U157 ( .A(in1[12]), .B(in2[12]), .C(n101), .CO(n102) );
  CMPR32X2TS U158 ( .A(in1[13]), .B(in2[13]), .C(n102), .CO(n104) );
  CMPR32X2TS U159 ( .A(in1[9]), .B(in2[9]), .C(n105), .CO(n106) );
  CMPR32X2TS U160 ( .A(in1[10]), .B(in2[10]), .C(n106), .CO(n107) );
  CMPR32X2TS U161 ( .A(in1[11]), .B(in2[11]), .C(n107), .CO(n108) );
  CMPR32X2TS U162 ( .A(in1[12]), .B(in2[12]), .C(n108), .CO(n109) );
  CMPR32X2TS U163 ( .A(in1[13]), .B(in2[13]), .C(n109), .CO(n110) );
  CMPR32X2TS U164 ( .A(in1[14]), .B(in2[14]), .C(n110), .CO(n112) );
  CMPR32X2TS U165 ( .A(in1[10]), .B(in2[10]), .C(n113), .CO(n114) );
  CMPR32X2TS U166 ( .A(in1[11]), .B(in2[11]), .C(n114), .CO(n115) );
  CMPR32X2TS U167 ( .A(in1[12]), .B(in2[12]), .C(n115), .CO(n116) );
  CMPR32X2TS U168 ( .A(in1[13]), .B(in2[13]), .C(n116), .CO(n117) );
  CMPR32X2TS U169 ( .A(in1[14]), .B(in2[14]), .C(n117), .CO(n118) );
  CMPR32X2TS U170 ( .A(in1[15]), .B(in2[15]), .C(n118), .CO(n120) );
  CMPR32X2TS U171 ( .A(in1[11]), .B(in2[11]), .C(n121), .CO(n122) );
  CMPR32X2TS U172 ( .A(in1[12]), .B(in2[12]), .C(n122), .CO(n123) );
  CMPR32X2TS U173 ( .A(in1[13]), .B(in2[13]), .C(n123), .CO(n124) );
  CMPR32X2TS U174 ( .A(in1[14]), .B(in2[14]), .C(n124), .CO(n125) );
  CMPR32X2TS U175 ( .A(in1[15]), .B(in2[15]), .C(n125), .CO(n126) );
  CMPR32X2TS U176 ( .A(n22), .B(n21), .C(n126), .CO(n128) );
  CMPR32X2TS U177 ( .A(in1[12]), .B(in2[12]), .C(n129), .CO(n130) );
  CMPR32X2TS U178 ( .A(in1[13]), .B(in2[13]), .C(n130), .CO(n131) );
  CMPR32X2TS U179 ( .A(in1[14]), .B(in2[14]), .C(n131), .CO(n132) );
  CMPR32X2TS U180 ( .A(in1[15]), .B(in2[15]), .C(n132), .CO(n133) );
  CMPR32X2TS U181 ( .A(in1[16]), .B(in2[16]), .C(n133), .CO(n134) );
  CMPR32X2TS U182 ( .A(n14), .B(n12), .C(n134), .CO(n136) );
  CMPR32X2TS U183 ( .A(in1[13]), .B(in2[13]), .C(n137), .CO(n138) );
  CMPR32X2TS U184 ( .A(in1[14]), .B(in2[14]), .C(n138), .CO(n139) );
  CMPR32X2TS U185 ( .A(in1[15]), .B(in2[15]), .C(n139), .CO(n140) );
  CMPR32X2TS U186 ( .A(in1[16]), .B(in2[16]), .C(n140), .CO(n141) );
  CMPR32X2TS U187 ( .A(n14), .B(n12), .C(n141), .CO(n142) );
  CMPR32X2TS U188 ( .A(n15), .B(n13), .C(n142), .CO(n144) );
  AOI222X1TS U189 ( .A0(in2[15]), .A1(in1[15]), .B0(in2[15]), .B1(n146), .C0(
        in1[15]), .C1(n146), .Y(n148) );
  NOR2X1TS U190 ( .A(in1[18]), .B(in2[18]), .Y(n165) );
  OAI2BB2X1TS U191 ( .B0(n150), .B1(n165), .A0N(n15), .A1N(n13), .Y(n151) );
  AOI222X1TS U192 ( .A0(in2[19]), .A1(n37), .B0(in2[19]), .B1(n151), .C0(n37), 
        .C1(n151), .Y(n152) );
  XNOR2X2TS U193 ( .A(n152), .B(in2[20]), .Y(n153) );
  OAI21X4TS U194 ( .A0(in1[15]), .A1(in2[15]), .B0(n5), .Y(n154) );
  AOI222X1TS U195 ( .A0(in2[16]), .A1(in1[16]), .B0(in2[16]), .B1(n155), .C0(
        in1[16]), .C1(n155), .Y(n157) );
  NOR2X1TS U196 ( .A(in1[17]), .B(in2[17]), .Y(n156) );
  OAI2BB2X2TS U197 ( .B0(n157), .B1(n156), .A0N(in1[17]), .A1N(in2[17]), .Y(
        n158) );
  AOI222X1TS U198 ( .A0(in2[18]), .A1(in1[18]), .B0(in2[18]), .B1(n158), .C0(
        in1[18]), .C1(n158), .Y(n159) );
  NOR2X1TS U199 ( .A(in1[19]), .B(n32), .Y(n174) );
  OAI2BB2X1TS U200 ( .B0(n159), .B1(n174), .A0N(n37), .A1N(in2[19]), .Y(n160)
         );
  AOI222X1TS U201 ( .A0(in2[20]), .A1(n40), .B0(in2[20]), .B1(n160), .C0(n40), 
        .C1(n160), .Y(n161) );
  XNOR2X2TS U202 ( .A(n161), .B(n35), .Y(n162) );
  XOR2X1TS U203 ( .A(n16), .B(n162), .Y(res[21]) );
  AOI222X1TS U204 ( .A0(in2[17]), .A1(in1[17]), .B0(in2[17]), .B1(n164), .C0(
        in1[17]), .C1(n164), .Y(n166) );
  OAI2BB2X2TS U205 ( .B0(n166), .B1(n165), .A0N(in1[18]), .A1N(in2[18]), .Y(
        n167) );
  AOI222X1TS U206 ( .A0(in2[19]), .A1(n37), .B0(in2[19]), .B1(n167), .C0(n37), 
        .C1(n167), .Y(n168) );
  NOR2X1TS U207 ( .A(n39), .B(n34), .Y(n183) );
  OAI2BB2X1TS U208 ( .B0(n168), .B1(n183), .A0N(n40), .A1N(in2[20]), .Y(n169)
         );
  XNOR2X2TS U209 ( .A(n170), .B(n29), .Y(n171) );
  AOI222X1TS U210 ( .A0(in2[18]), .A1(in1[18]), .B0(in2[18]), .B1(n173), .C0(
        in1[18]), .C1(n173), .Y(n175) );
  OAI2BB2X2TS U211 ( .B0(n175), .B1(n174), .A0N(n37), .A1N(in2[19]), .Y(n176)
         );
  AOI222X1TS U212 ( .A0(in2[20]), .A1(n40), .B0(in2[20]), .B1(n176), .C0(n40), 
        .C1(n176), .Y(n177) );
  NOR2X1TS U213 ( .A(in1[21]), .B(in2[21]), .Y(n192) );
  OAI2BB2X1TS U214 ( .B0(n177), .B1(n192), .A0N(n16), .A1N(n35), .Y(n178) );
  XNOR2X2TS U215 ( .A(n179), .B(n27), .Y(n180) );
  AOI222X1TS U216 ( .A0(in2[19]), .A1(n37), .B0(in2[19]), .B1(n182), .C0(n37), 
        .C1(n182), .Y(n184) );
  OAI2BB2X2TS U217 ( .B0(n184), .B1(n183), .A0N(n40), .A1N(in2[20]), .Y(n185)
         );
  AOI222X1TS U218 ( .A0(in2[21]), .A1(in1[21]), .B0(in2[21]), .B1(n185), .C0(
        in1[21]), .C1(n185), .Y(n186) );
  NOR2X1TS U219 ( .A(in1[22]), .B(in2[22]), .Y(n201) );
  OAI2BB2X1TS U220 ( .B0(n186), .B1(n201), .A0N(n30), .A1N(n29), .Y(n187) );
  XNOR2X2TS U221 ( .A(n188), .B(n10), .Y(n189) );
  AOI222X1TS U222 ( .A0(in2[20]), .A1(n40), .B0(in2[20]), .B1(n191), .C0(n40), 
        .C1(n191), .Y(n193) );
  OAI2BB2X2TS U223 ( .B0(n193), .B1(n192), .A0N(in1[21]), .A1N(in2[21]), .Y(
        n194) );
  AOI222X1TS U224 ( .A0(in2[22]), .A1(in1[22]), .B0(in2[22]), .B1(n194), .C0(
        in1[22]), .C1(n194), .Y(n195) );
  NOR2X1TS U225 ( .A(in1[23]), .B(in2[23]), .Y(n211) );
  AOI222X1TS U226 ( .A0(in2[21]), .A1(in1[21]), .B0(in2[21]), .B1(n200), .C0(
        in1[21]), .C1(n200), .Y(n202) );
  OAI2BB2X1TS U227 ( .B0(n202), .B1(n201), .A0N(in1[22]), .A1N(in2[22]), .Y(
        n203) );
  NOR2X1TS U228 ( .A(in1[24]), .B(in2[24]), .Y(n204) );
  OAI2BB2X2TS U229 ( .B0(n205), .B1(n204), .A0N(in1[24]), .A1N(in2[24]), .Y(
        n206) );
  AOI222X1TS U230 ( .A0(in2[25]), .A1(in1[25]), .B0(in2[25]), .B1(n206), .C0(
        in1[25]), .C1(n206), .Y(n207) );
  XNOR2X2TS U231 ( .A(n207), .B(n18), .Y(n208) );
  XOR2X1TS U232 ( .A(n20), .B(n208), .Y(res[26]) );
  OAI21X4TS U233 ( .A0(in1[21]), .A1(in2[21]), .B0(n2), .Y(n209) );
  AOI222X1TS U234 ( .A0(in2[22]), .A1(in1[22]), .B0(in2[22]), .B1(n210), .C0(
        in1[22]), .C1(n210), .Y(n212) );
  OAI2BB2X1TS U235 ( .B0(n212), .B1(n211), .A0N(in1[23]), .A1N(in2[23]), .Y(
        n213) );
  NOR2X1TS U236 ( .A(in1[25]), .B(in2[25]), .Y(n214) );
  OAI2BB2X2TS U237 ( .B0(n215), .B1(n214), .A0N(in1[25]), .A1N(in2[25]), .Y(
        n216) );
  AOI222X1TS U238 ( .A0(in2[26]), .A1(in1[26]), .B0(n18), .B1(n216), .C0(n20), 
        .C1(n216), .Y(n217) );
  XNOR2X2TS U239 ( .A(n217), .B(in2[27]), .Y(n218) );
initial $sdf_annotate("ACA_I_N32_Q8_syn.sdf"); 
 endmodule

