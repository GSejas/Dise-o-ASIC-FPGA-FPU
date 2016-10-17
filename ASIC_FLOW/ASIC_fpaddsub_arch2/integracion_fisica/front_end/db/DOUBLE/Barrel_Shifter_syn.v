/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : L-2016.03-SP3
// Date      : Mon Oct 17 14:52:10 2016
/////////////////////////////////////////////////////////////


module shift_mux_array_SWR26_LEVEL0 ( Data_i, select_i, bit_shift_i, Data_o );
  input [25:0] Data_i;
  output [25:0] Data_o;
  input select_i, bit_shift_i;
  wire   n7, n8, n9, n10, n11, n12;

  CLKBUFX2TS U1 ( .A(n7), .Y(n11) );
  INVX2TS U2 ( .A(n11), .Y(n8) );
  INVX2TS U3 ( .A(n11), .Y(n9) );
  INVX2TS U4 ( .A(n11), .Y(n10) );
  CLKBUFX2TS U5 ( .A(n7), .Y(n12) );
  AO22X1TS U6 ( .A0(n12), .A1(Data_i[5]), .B0(n10), .B1(Data_i[4]), .Y(
        Data_o[4]) );
  AO22X1TS U7 ( .A0(n12), .A1(Data_i[6]), .B0(n10), .B1(Data_i[5]), .Y(
        Data_o[5]) );
  AO22X1TS U8 ( .A0(n12), .A1(Data_i[3]), .B0(n10), .B1(Data_i[2]), .Y(
        Data_o[2]) );
  AO22X1TS U9 ( .A0(n12), .A1(Data_i[4]), .B0(n9), .B1(Data_i[3]), .Y(
        Data_o[3]) );
  CLKBUFX2TS U10 ( .A(select_i), .Y(n7) );
  AO22X1TS U11 ( .A0(n11), .A1(Data_i[1]), .B0(Data_i[0]), .B1(n9), .Y(
        Data_o[0]) );
  AO22X1TS U12 ( .A0(n12), .A1(Data_i[2]), .B0(n9), .B1(Data_i[1]), .Y(
        Data_o[1]) );
  AO22X1TS U13 ( .A0(n12), .A1(Data_i[9]), .B0(n10), .B1(Data_i[8]), .Y(
        Data_o[8]) );
  AO22X1TS U14 ( .A0(n9), .A1(Data_i[9]), .B0(Data_i[10]), .B1(n12), .Y(
        Data_o[9]) );
  AO22X1TS U15 ( .A0(n9), .A1(Data_i[11]), .B0(select_i), .B1(Data_i[12]), .Y(
        Data_o[11]) );
  AO22X1TS U16 ( .A0(n8), .A1(Data_i[22]), .B0(select_i), .B1(Data_i[23]), .Y(
        Data_o[22]) );
  AO22X1TS U17 ( .A0(n8), .A1(Data_i[23]), .B0(n7), .B1(Data_i[24]), .Y(
        Data_o[23]) );
  AO22X1TS U18 ( .A0(n8), .A1(Data_i[24]), .B0(select_i), .B1(Data_i[25]), .Y(
        Data_o[24]) );
  AO22X1TS U19 ( .A0(n12), .A1(Data_i[7]), .B0(n10), .B1(Data_i[6]), .Y(
        Data_o[6]) );
  AO22X1TS U20 ( .A0(n12), .A1(Data_i[8]), .B0(n10), .B1(Data_i[7]), .Y(
        Data_o[7]) );
  AO22X1TS U21 ( .A0(n9), .A1(Data_i[12]), .B0(n7), .B1(Data_i[13]), .Y(
        Data_o[12]) );
  AO22X1TS U22 ( .A0(n9), .A1(Data_i[13]), .B0(n7), .B1(Data_i[14]), .Y(
        Data_o[13]) );
  AO22X1TS U23 ( .A0(n8), .A1(Data_i[18]), .B0(select_i), .B1(Data_i[19]), .Y(
        Data_o[18]) );
  AO22X1TS U24 ( .A0(n8), .A1(Data_i[20]), .B0(n7), .B1(Data_i[21]), .Y(
        Data_o[20]) );
  AO22X1TS U25 ( .A0(n9), .A1(Data_i[14]), .B0(select_i), .B1(Data_i[15]), .Y(
        Data_o[14]) );
  AO22X1TS U26 ( .A0(n9), .A1(Data_i[16]), .B0(select_i), .B1(Data_i[17]), .Y(
        Data_o[16]) );
  AO22X1TS U27 ( .A0(n8), .A1(Data_i[19]), .B0(select_i), .B1(Data_i[20]), .Y(
        Data_o[19]) );
  AO22X1TS U28 ( .A0(n8), .A1(Data_i[21]), .B0(n7), .B1(Data_i[22]), .Y(
        Data_o[21]) );
  AO22X1TS U29 ( .A0(n8), .A1(Data_i[15]), .B0(n7), .B1(Data_i[16]), .Y(
        Data_o[15]) );
  AO22X1TS U30 ( .A0(n8), .A1(Data_i[17]), .B0(select_i), .B1(Data_i[18]), .Y(
        Data_o[17]) );
  AO22X1TS U31 ( .A0(n8), .A1(Data_i[25]), .B0(bit_shift_i), .B1(n12), .Y(
        Data_o[25]) );
  AO22X1TS U32 ( .A0(n9), .A1(Data_i[10]), .B0(n7), .B1(Data_i[11]), .Y(
        Data_o[10]) );
endmodule


module shift_mux_array_SWR26_LEVEL1 ( Data_i, select_i, bit_shift_i, Data_o );
  input [25:0] Data_i;
  output [25:0] Data_o;
  input select_i, bit_shift_i;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n24, n30, n31, n32, n33, n34, n35;

  CLKBUFX2TS U1 ( .A(n30), .Y(n34) );
  INVX2TS U2 ( .A(select_i), .Y(n31) );
  INVX2TS U3 ( .A(n30), .Y(n32) );
  INVX2TS U4 ( .A(select_i), .Y(n33) );
  OAI22X1TS U5 ( .A0(n32), .A1(n8), .B0(n34), .B1(n10), .Y(Data_o[16]) );
  OAI22X1TS U6 ( .A0(n32), .A1(n7), .B0(n34), .B1(n9), .Y(Data_o[17]) );
  OAI22X1TS U7 ( .A0(n32), .A1(n6), .B0(n34), .B1(n8), .Y(Data_o[18]) );
  OAI22X1TS U8 ( .A0(n32), .A1(n5), .B0(n34), .B1(n7), .Y(Data_o[19]) );
  OAI22X1TS U9 ( .A0(n32), .A1(n11), .B0(n34), .B1(n13), .Y(Data_o[13]) );
  OAI22X1TS U10 ( .A0(n31), .A1(n20), .B0(n35), .B1(n22), .Y(Data_o[4]) );
  INVX2TS U11 ( .A(Data_i[4]), .Y(n22) );
  OAI22X1TS U12 ( .A0(n31), .A1(n19), .B0(select_i), .B1(n21), .Y(Data_o[5])
         );
  INVX2TS U13 ( .A(Data_i[5]), .Y(n21) );
  OAI22X1TS U14 ( .A0(n31), .A1(n18), .B0(n34), .B1(n20), .Y(Data_o[6]) );
  OAI22X1TS U15 ( .A0(n31), .A1(n17), .B0(n30), .B1(n19), .Y(Data_o[7]) );
  OAI22X1TS U16 ( .A0(n32), .A1(n13), .B0(n34), .B1(n15), .Y(Data_o[11]) );
  OAI22X1TS U17 ( .A0(n32), .A1(n12), .B0(n34), .B1(n14), .Y(Data_o[12]) );
  OAI22X1TS U18 ( .A0(n32), .A1(n10), .B0(n34), .B1(n12), .Y(Data_o[14]) );
  OAI22X1TS U19 ( .A0(n32), .A1(n9), .B0(n34), .B1(n11), .Y(Data_o[15]) );
  OAI22X1TS U20 ( .A0(n30), .A1(n18), .B0(n33), .B1(n16), .Y(Data_o[8]) );
  OAI22X1TS U21 ( .A0(n35), .A1(n17), .B0(n15), .B1(n33), .Y(Data_o[9]) );
  OAI22X1TS U22 ( .A0(n32), .A1(n14), .B0(n35), .B1(n16), .Y(Data_o[10]) );
  OAI22X1TS U23 ( .A0(n31), .A1(n4), .B0(n35), .B1(n6), .Y(Data_o[20]) );
  OAI22X1TS U24 ( .A0(n31), .A1(n3), .B0(select_i), .B1(n5), .Y(Data_o[21]) );
  OAI22X1TS U25 ( .A0(n31), .A1(n2), .B0(n30), .B1(n4), .Y(Data_o[22]) );
  OAI22X1TS U26 ( .A0(n31), .A1(n1), .B0(n35), .B1(n3), .Y(Data_o[23]) );
  OAI22X1TS U27 ( .A0(n31), .A1(n24), .B0(select_i), .B1(n2), .Y(Data_o[24])
         );
  OAI22X1TS U28 ( .A0(n31), .A1(n24), .B0(n30), .B1(n1), .Y(Data_o[25]) );
  AO22X1TS U29 ( .A0(n35), .A1(Data_i[4]), .B0(n33), .B1(Data_i[2]), .Y(
        Data_o[2]) );
  AO22X1TS U30 ( .A0(n35), .A1(Data_i[5]), .B0(n33), .B1(Data_i[3]), .Y(
        Data_o[3]) );
  CLKBUFX2TS U31 ( .A(n30), .Y(n35) );
  CLKBUFX2TS U32 ( .A(select_i), .Y(n30) );
  AO22X1TS U33 ( .A0(n35), .A1(Data_i[2]), .B0(Data_i[0]), .B1(n33), .Y(
        Data_o[0]) );
  AO22X1TS U34 ( .A0(n35), .A1(Data_i[3]), .B0(Data_i[1]), .B1(n33), .Y(
        Data_o[1]) );
  INVX2TS U35 ( .A(Data_i[8]), .Y(n18) );
  INVX2TS U36 ( .A(Data_i[9]), .Y(n17) );
  INVX2TS U37 ( .A(Data_i[11]), .Y(n15) );
  INVX2TS U38 ( .A(Data_i[22]), .Y(n4) );
  INVX2TS U39 ( .A(Data_i[23]), .Y(n3) );
  INVX2TS U40 ( .A(Data_i[24]), .Y(n2) );
  INVX2TS U41 ( .A(Data_i[6]), .Y(n20) );
  INVX2TS U42 ( .A(Data_i[7]), .Y(n19) );
  INVX2TS U43 ( .A(Data_i[12]), .Y(n14) );
  INVX2TS U44 ( .A(Data_i[13]), .Y(n13) );
  INVX2TS U45 ( .A(Data_i[18]), .Y(n8) );
  INVX2TS U46 ( .A(Data_i[20]), .Y(n6) );
  INVX2TS U47 ( .A(Data_i[14]), .Y(n12) );
  INVX2TS U48 ( .A(Data_i[16]), .Y(n10) );
  INVX2TS U49 ( .A(Data_i[19]), .Y(n7) );
  INVX2TS U50 ( .A(Data_i[21]), .Y(n5) );
  INVX2TS U51 ( .A(Data_i[15]), .Y(n11) );
  INVX2TS U52 ( .A(Data_i[17]), .Y(n9) );
  INVX2TS U53 ( .A(Data_i[25]), .Y(n1) );
  INVX2TS U54 ( .A(Data_i[10]), .Y(n16) );
  INVX2TS U55 ( .A(bit_shift_i), .Y(n24) );
endmodule


module shift_mux_array_SWR26_LEVEL2 ( Data_i, select_i, bit_shift_i, Data_o );
  input [25:0] Data_i;
  output [25:0] Data_o;
  input select_i, bit_shift_i;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n12, n17, n18, n19, n20, n21
;

  OAI22X1TS U1 ( .A0(n21), .A1(n6), .B0(n17), .B1(n10), .Y(Data_o[16]) );
  INVX2TS U2 ( .A(Data_i[16]), .Y(n10) );
  OAI22X1TS U3 ( .A0(n19), .A1(n5), .B0(n17), .B1(n9), .Y(Data_o[17]) );
  INVX2TS U4 ( .A(Data_i[17]), .Y(n9) );
  OAI22X1TS U5 ( .A0(n19), .A1(n4), .B0(n17), .B1(n8), .Y(Data_o[18]) );
  INVX2TS U6 ( .A(Data_i[18]), .Y(n8) );
  OAI22X1TS U7 ( .A0(n19), .A1(n3), .B0(n17), .B1(n7), .Y(Data_o[19]) );
  INVX2TS U8 ( .A(Data_i[19]), .Y(n7) );
  OAI22X1TS U9 ( .A0(n19), .A1(n2), .B0(n17), .B1(n6), .Y(Data_o[20]) );
  OAI22X1TS U10 ( .A0(n20), .A1(n1), .B0(n17), .B1(n5), .Y(Data_o[21]) );
  INVX2TS U11 ( .A(n19), .Y(n17) );
  INVX2TS U12 ( .A(n21), .Y(n18) );
  AO22X1TS U13 ( .A0(n18), .A1(Data_i[8]), .B0(n20), .B1(Data_i[4]), .Y(
        Data_o[4]) );
  AO22X1TS U14 ( .A0(n18), .A1(Data_i[9]), .B0(n20), .B1(Data_i[5]), .Y(
        Data_o[5]) );
  AO22X1TS U15 ( .A0(n18), .A1(Data_i[10]), .B0(n20), .B1(Data_i[6]), .Y(
        Data_o[6]) );
  AO22X1TS U16 ( .A0(n18), .A1(Data_i[11]), .B0(n20), .B1(Data_i[7]), .Y(
        Data_o[7]) );
  AO22X1TS U17 ( .A0(n18), .A1(Data_i[12]), .B0(n20), .B1(Data_i[8]), .Y(
        Data_o[8]) );
  AO22X1TS U18 ( .A0(select_i), .A1(Data_i[14]), .B0(n21), .B1(Data_i[10]), 
        .Y(Data_o[10]) );
  AO22X1TS U19 ( .A0(select_i), .A1(Data_i[15]), .B0(n20), .B1(Data_i[11]), 
        .Y(Data_o[11]) );
  AO22X1TS U20 ( .A0(select_i), .A1(Data_i[16]), .B0(n21), .B1(Data_i[12]), 
        .Y(Data_o[12]) );
  AO22X1TS U21 ( .A0(select_i), .A1(Data_i[17]), .B0(n20), .B1(Data_i[13]), 
        .Y(Data_o[13]) );
  AO22X1TS U22 ( .A0(select_i), .A1(Data_i[18]), .B0(n21), .B1(Data_i[14]), 
        .Y(Data_o[14]) );
  AO22X1TS U23 ( .A0(select_i), .A1(Data_i[19]), .B0(n20), .B1(Data_i[15]), 
        .Y(Data_o[15]) );
  AO22X1TS U24 ( .A0(Data_i[13]), .A1(select_i), .B0(n20), .B1(Data_i[9]), .Y(
        Data_o[9]) );
  CLKBUFX2TS U25 ( .A(n21), .Y(n19) );
  OAI21X1TS U26 ( .A0(n18), .A1(n3), .B0(n12), .Y(Data_o[23]) );
  OAI21X1TS U27 ( .A0(n17), .A1(n4), .B0(n12), .Y(Data_o[22]) );
  OAI21X1TS U28 ( .A0(n17), .A1(n2), .B0(n12), .Y(Data_o[24]) );
  OAI21X1TS U29 ( .A0(n17), .A1(n1), .B0(n12), .Y(Data_o[25]) );
  CLKBUFX2TS U30 ( .A(n21), .Y(n20) );
  INVX2TS U31 ( .A(Data_i[20]), .Y(n6) );
  INVX2TS U32 ( .A(Data_i[21]), .Y(n5) );
  INVX2TS U33 ( .A(Data_i[22]), .Y(n4) );
  INVX2TS U34 ( .A(Data_i[23]), .Y(n3) );
  INVX2TS U35 ( .A(Data_i[24]), .Y(n2) );
  INVX2TS U36 ( .A(Data_i[25]), .Y(n1) );
  AO22X1TS U37 ( .A0(n18), .A1(Data_i[6]), .B0(Data_i[2]), .B1(n19), .Y(
        Data_o[2]) );
  AO22X1TS U38 ( .A0(n18), .A1(Data_i[7]), .B0(Data_i[3]), .B1(n21), .Y(
        Data_o[3]) );
  NAND2X1TS U39 ( .A(bit_shift_i), .B(n17), .Y(n12) );
  AO22X1TS U40 ( .A0(n18), .A1(Data_i[4]), .B0(Data_i[0]), .B1(n21), .Y(
        Data_o[0]) );
  AO22X1TS U41 ( .A0(n18), .A1(Data_i[5]), .B0(Data_i[1]), .B1(n19), .Y(
        Data_o[1]) );
  INVX2TS U42 ( .A(select_i), .Y(n21) );
endmodule


module shift_mux_array_SWR26_LEVEL3 ( Data_i, select_i, bit_shift_i, Data_o );
  input [25:0] Data_i;
  output [25:0] Data_o;
  input select_i, bit_shift_i;
  wire   n1, n2, n7, n8, n9, n10;

  CLKBUFX2TS U1 ( .A(select_i), .Y(n7) );
  CLKBUFX2TS U2 ( .A(select_i), .Y(n8) );
  CLKBUFX2TS U3 ( .A(n1), .Y(n9) );
  CLKBUFX2TS U4 ( .A(n1), .Y(n10) );
  NAND2X1TS U5 ( .A(bit_shift_i), .B(n7), .Y(n2) );
  INVX2TS U6 ( .A(n7), .Y(n1) );
  OAI2BB1X1TS U7 ( .A0N(n1), .A1N(Data_i[25]), .B0(n2), .Y(Data_o[25]) );
  OAI2BB1X1TS U8 ( .A0N(n1), .A1N(Data_i[18]), .B0(n2), .Y(Data_o[18]) );
  OAI2BB1X1TS U9 ( .A0N(n1), .A1N(Data_i[19]), .B0(n2), .Y(Data_o[19]) );
  OAI2BB1X1TS U10 ( .A0N(n10), .A1N(Data_i[20]), .B0(n2), .Y(Data_o[20]) );
  OAI2BB1X1TS U11 ( .A0N(n1), .A1N(Data_i[21]), .B0(n2), .Y(Data_o[21]) );
  OAI2BB1X1TS U12 ( .A0N(n10), .A1N(Data_i[22]), .B0(n2), .Y(Data_o[22]) );
  OAI2BB1X1TS U13 ( .A0N(n1), .A1N(Data_i[23]), .B0(n2), .Y(Data_o[23]) );
  OAI2BB1X1TS U14 ( .A0N(n1), .A1N(Data_i[24]), .B0(n2), .Y(Data_o[24]) );
  AO22X1TS U15 ( .A0(n7), .A1(Data_i[24]), .B0(n10), .B1(Data_i[16]), .Y(
        Data_o[16]) );
  AO22X1TS U16 ( .A0(n7), .A1(Data_i[25]), .B0(n10), .B1(Data_i[17]), .Y(
        Data_o[17]) );
  AO22X1TS U17 ( .A0(n7), .A1(Data_i[18]), .B0(n9), .B1(Data_i[10]), .Y(
        Data_o[10]) );
  AO22X1TS U18 ( .A0(n7), .A1(Data_i[19]), .B0(n10), .B1(Data_i[11]), .Y(
        Data_o[11]) );
  AO22X1TS U19 ( .A0(n7), .A1(Data_i[20]), .B0(n10), .B1(Data_i[12]), .Y(
        Data_o[12]) );
  AO22X1TS U20 ( .A0(n7), .A1(Data_i[21]), .B0(n10), .B1(Data_i[13]), .Y(
        Data_o[13]) );
  AO22X1TS U21 ( .A0(n7), .A1(Data_i[22]), .B0(n10), .B1(Data_i[14]), .Y(
        Data_o[14]) );
  AO22X1TS U22 ( .A0(n7), .A1(Data_i[23]), .B0(n10), .B1(Data_i[15]), .Y(
        Data_o[15]) );
  AO22X1TS U23 ( .A0(Data_i[17]), .A1(n8), .B0(n10), .B1(Data_i[9]), .Y(
        Data_o[9]) );
  AO22X1TS U24 ( .A0(n8), .A1(Data_i[8]), .B0(Data_i[0]), .B1(n9), .Y(
        Data_o[0]) );
  AO22X1TS U25 ( .A0(n8), .A1(Data_i[9]), .B0(Data_i[1]), .B1(n9), .Y(
        Data_o[1]) );
  AO22X1TS U26 ( .A0(n8), .A1(Data_i[10]), .B0(Data_i[2]), .B1(n9), .Y(
        Data_o[2]) );
  AO22X1TS U27 ( .A0(n8), .A1(Data_i[11]), .B0(Data_i[3]), .B1(n9), .Y(
        Data_o[3]) );
  AO22X1TS U28 ( .A0(n8), .A1(Data_i[12]), .B0(Data_i[4]), .B1(n9), .Y(
        Data_o[4]) );
  AO22X1TS U29 ( .A0(n8), .A1(Data_i[13]), .B0(Data_i[5]), .B1(n9), .Y(
        Data_o[5]) );
  AO22X1TS U30 ( .A0(n8), .A1(Data_i[14]), .B0(Data_i[6]), .B1(n9), .Y(
        Data_o[6]) );
  AO22X1TS U31 ( .A0(n8), .A1(Data_i[15]), .B0(Data_i[7]), .B1(n9), .Y(
        Data_o[7]) );
  AO22X1TS U32 ( .A0(n8), .A1(Data_i[16]), .B0(n9), .B1(Data_i[8]), .Y(
        Data_o[8]) );
endmodule


module shift_mux_array_SWR26_LEVEL4 ( Data_i, select_i, bit_shift_i, Data_o );
  input [25:0] Data_i;
  output [25:0] Data_o;
  input select_i, bit_shift_i;
  wire   n1, n2, n7, n8, n9, n10;

  INVX2TS U1 ( .A(n1), .Y(n7) );
  CLKBUFX2TS U2 ( .A(n2), .Y(n8) );
  NAND2X1TS U3 ( .A(bit_shift_i), .B(select_i), .Y(n2) );
  OAI2BB1X1TS U4 ( .A0N(n10), .A1N(Data_i[16]), .B0(n2), .Y(Data_o[16]) );
  OAI2BB1X1TS U5 ( .A0N(n10), .A1N(Data_i[17]), .B0(n2), .Y(Data_o[17]) );
  OAI2BB1X1TS U6 ( .A0N(n10), .A1N(Data_i[18]), .B0(n2), .Y(Data_o[18]) );
  OAI2BB1X1TS U7 ( .A0N(n10), .A1N(Data_i[19]), .B0(n2), .Y(Data_o[19]) );
  OAI2BB1X1TS U8 ( .A0N(n10), .A1N(Data_i[20]), .B0(n2), .Y(Data_o[20]) );
  OAI2BB1X1TS U9 ( .A0N(n10), .A1N(Data_i[21]), .B0(n2), .Y(Data_o[21]) );
  OAI2BB1X1TS U10 ( .A0N(n10), .A1N(Data_i[22]), .B0(n2), .Y(Data_o[22]) );
  OAI2BB1X1TS U11 ( .A0N(n10), .A1N(Data_i[23]), .B0(n2), .Y(Data_o[23]) );
  OAI2BB1X1TS U12 ( .A0N(n10), .A1N(Data_i[24]), .B0(n2), .Y(Data_o[24]) );
  OAI2BB1X1TS U13 ( .A0N(n10), .A1N(Data_i[25]), .B0(n8), .Y(Data_o[25]) );
  CLKBUFX2TS U14 ( .A(n1), .Y(n9) );
  CLKBUFX2TS U15 ( .A(n1), .Y(n10) );
  INVX2TS U16 ( .A(select_i), .Y(n1) );
  OAI2BB1X1TS U17 ( .A0N(Data_i[10]), .A1N(n1), .B0(n8), .Y(Data_o[10]) );
  OAI2BB1X1TS U18 ( .A0N(Data_i[11]), .A1N(n1), .B0(n8), .Y(Data_o[11]) );
  OAI2BB1X1TS U19 ( .A0N(Data_i[12]), .A1N(n1), .B0(n8), .Y(Data_o[12]) );
  OAI2BB1X1TS U20 ( .A0N(Data_i[13]), .A1N(n1), .B0(n8), .Y(Data_o[13]) );
  OAI2BB1X1TS U21 ( .A0N(Data_i[14]), .A1N(n1), .B0(n8), .Y(Data_o[14]) );
  OAI2BB1X1TS U22 ( .A0N(Data_i[15]), .A1N(n1), .B0(n8), .Y(Data_o[15]) );
  AO22X1TS U23 ( .A0(Data_i[25]), .A1(n7), .B0(Data_i[9]), .B1(n9), .Y(
        Data_o[9]) );
  AO22X1TS U24 ( .A0(select_i), .A1(Data_i[16]), .B0(Data_i[0]), .B1(n9), .Y(
        Data_o[0]) );
  AO22X1TS U25 ( .A0(select_i), .A1(Data_i[17]), .B0(Data_i[1]), .B1(n9), .Y(
        Data_o[1]) );
  AO22X1TS U26 ( .A0(select_i), .A1(Data_i[18]), .B0(Data_i[2]), .B1(n9), .Y(
        Data_o[2]) );
  AO22X1TS U27 ( .A0(select_i), .A1(Data_i[19]), .B0(Data_i[3]), .B1(n9), .Y(
        Data_o[3]) );
  AO22X1TS U28 ( .A0(select_i), .A1(Data_i[20]), .B0(Data_i[4]), .B1(n9), .Y(
        Data_o[4]) );
  AO22X1TS U29 ( .A0(select_i), .A1(Data_i[21]), .B0(Data_i[5]), .B1(n9), .Y(
        Data_o[5]) );
  AO22X1TS U30 ( .A0(select_i), .A1(Data_i[22]), .B0(Data_i[6]), .B1(n9), .Y(
        Data_o[6]) );
  AO22X1TS U31 ( .A0(select_i), .A1(Data_i[23]), .B0(Data_i[7]), .B1(n9), .Y(
        Data_o[7]) );
  AO22X1TS U32 ( .A0(n7), .A1(Data_i[24]), .B0(Data_i[8]), .B1(n9), .Y(
        Data_o[8]) );
endmodule


module Mux_Array_SWR26_EWR5 ( clk, rst, load_i, Data_i, FSM_left_right_i, 
        Shift_Value_i, bit_shift_i, Data_o );
  input [25:0] Data_i;
  input [4:0] Shift_Value_i;
  output [25:0] Data_o;
  input clk, rst, load_i, FSM_left_right_i, bit_shift_i;
  wire   \Data_array[6][25] , \Data_array[6][24] , \Data_array[6][23] ,
         \Data_array[6][22] , \Data_array[6][21] , \Data_array[6][20] ,
         \Data_array[6][19] , \Data_array[6][18] , \Data_array[6][17] ,
         \Data_array[6][16] , \Data_array[6][15] , \Data_array[6][14] ,
         \Data_array[6][13] , \Data_array[6][12] , \Data_array[6][11] ,
         \Data_array[6][10] , \Data_array[6][9] , \Data_array[6][8] ,
         \Data_array[6][7] , \Data_array[6][6] , \Data_array[6][5] ,
         \Data_array[6][4] , \Data_array[6][3] , \Data_array[6][2] ,
         \Data_array[6][1] , \Data_array[6][0] , \Data_array[5][25] ,
         \Data_array[5][24] , \Data_array[5][23] , \Data_array[5][22] ,
         \Data_array[5][21] , \Data_array[5][20] , \Data_array[5][19] ,
         \Data_array[5][18] , \Data_array[5][17] , \Data_array[5][16] ,
         \Data_array[5][15] , \Data_array[5][14] , \Data_array[5][13] ,
         \Data_array[5][12] , \Data_array[5][11] , \Data_array[5][10] ,
         \Data_array[5][9] , \Data_array[5][8] , \Data_array[5][7] ,
         \Data_array[5][6] , \Data_array[5][5] , \Data_array[5][4] ,
         \Data_array[5][3] , \Data_array[5][2] , \Data_array[5][1] ,
         \Data_array[5][0] , \Data_array[4][25] , \Data_array[4][24] ,
         \Data_array[4][23] , \Data_array[4][22] , \Data_array[4][21] ,
         \Data_array[4][20] , \Data_array[4][19] , \Data_array[4][18] ,
         \Data_array[4][17] , \Data_array[4][16] , \Data_array[4][15] ,
         \Data_array[4][14] , \Data_array[4][13] , \Data_array[4][12] ,
         \Data_array[4][11] , \Data_array[4][10] , \Data_array[4][9] ,
         \Data_array[4][8] , \Data_array[4][7] , \Data_array[4][6] ,
         \Data_array[4][5] , \Data_array[4][4] , \Data_array[4][3] ,
         \Data_array[4][2] , \Data_array[4][1] , \Data_array[4][0] ,
         \Data_array[3][25] , \Data_array[3][24] , \Data_array[3][23] ,
         \Data_array[3][22] , \Data_array[3][21] , \Data_array[3][20] ,
         \Data_array[3][19] , \Data_array[3][18] , \Data_array[3][17] ,
         \Data_array[3][16] , \Data_array[3][15] , \Data_array[3][14] ,
         \Data_array[3][13] , \Data_array[3][12] , \Data_array[3][11] ,
         \Data_array[3][10] , \Data_array[3][9] , \Data_array[3][8] ,
         \Data_array[3][7] , \Data_array[3][6] , \Data_array[3][5] ,
         \Data_array[3][4] , \Data_array[3][3] , \Data_array[3][2] ,
         \Data_array[3][1] , \Data_array[3][0] , \Data_array[2][25] ,
         \Data_array[2][24] , \Data_array[2][23] , \Data_array[2][22] ,
         \Data_array[2][21] , \Data_array[2][20] , \Data_array[2][19] ,
         \Data_array[2][18] , \Data_array[2][17] , \Data_array[2][16] ,
         \Data_array[2][15] , \Data_array[2][14] , \Data_array[2][13] ,
         \Data_array[2][12] , \Data_array[2][11] , \Data_array[2][10] ,
         \Data_array[2][9] , \Data_array[2][8] , \Data_array[2][7] ,
         \Data_array[2][6] , \Data_array[2][5] , \Data_array[2][4] ,
         \Data_array[2][3] , \Data_array[2][2] , \Data_array[2][1] ,
         \Data_array[2][0] , \Data_array[1][25] , \Data_array[1][24] ,
         \Data_array[1][23] , \Data_array[1][22] , \Data_array[1][21] ,
         \Data_array[1][20] , \Data_array[1][19] , \Data_array[1][18] ,
         \Data_array[1][17] , \Data_array[1][16] , \Data_array[1][15] ,
         \Data_array[1][14] , \Data_array[1][13] , \Data_array[1][12] ,
         \Data_array[1][11] , \Data_array[1][10] , \Data_array[1][9] ,
         \Data_array[1][8] , \Data_array[1][7] , \Data_array[1][6] ,
         \Data_array[1][5] , \Data_array[1][4] , \Data_array[1][3] ,
         \Data_array[1][2] , \Data_array[1][1] , \Data_array[1][0] ,
         \Data_array[0][25] , \Data_array[0][24] , \Data_array[0][23] ,
         \Data_array[0][22] , \Data_array[0][21] , \Data_array[0][20] ,
         \Data_array[0][19] , \Data_array[0][18] , \Data_array[0][17] ,
         \Data_array[0][16] , \Data_array[0][15] , \Data_array[0][14] ,
         \Data_array[0][13] , \Data_array[0][12] , \Data_array[0][11] ,
         \Data_array[0][10] , \Data_array[0][9] , \Data_array[0][8] ,
         \Data_array[0][7] , \Data_array[0][6] , \Data_array[0][5] ,
         \Data_array[0][4] , \Data_array[0][3] , \Data_array[0][2] ,
         \Data_array[0][1] , \Data_array[0][0] ;

  Rotate_Mux_Array_SWR26_1 first_rotate ( .Data_i(Data_i), .select_i(
        FSM_left_right_i), .Data_o({\Data_array[0][25] , \Data_array[0][24] , 
        \Data_array[0][23] , \Data_array[0][22] , \Data_array[0][21] , 
        \Data_array[0][20] , \Data_array[0][19] , \Data_array[0][18] , 
        \Data_array[0][17] , \Data_array[0][16] , \Data_array[0][15] , 
        \Data_array[0][14] , \Data_array[0][13] , \Data_array[0][12] , 
        \Data_array[0][11] , \Data_array[0][10] , \Data_array[0][9] , 
        \Data_array[0][8] , \Data_array[0][7] , \Data_array[0][6] , 
        \Data_array[0][5] , \Data_array[0][4] , \Data_array[0][3] , 
        \Data_array[0][2] , \Data_array[0][1] , \Data_array[0][0] }) );
  shift_mux_array_SWR26_LEVEL0 \SHIFT_1LVLS[0].shift_mux_array  ( .Data_i({
        \Data_array[0][25] , \Data_array[0][24] , \Data_array[0][23] , 
        \Data_array[0][22] , \Data_array[0][21] , \Data_array[0][20] , 
        \Data_array[0][19] , \Data_array[0][18] , \Data_array[0][17] , 
        \Data_array[0][16] , \Data_array[0][15] , \Data_array[0][14] , 
        \Data_array[0][13] , \Data_array[0][12] , \Data_array[0][11] , 
        \Data_array[0][10] , \Data_array[0][9] , \Data_array[0][8] , 
        \Data_array[0][7] , \Data_array[0][6] , \Data_array[0][5] , 
        \Data_array[0][4] , \Data_array[0][3] , \Data_array[0][2] , 
        \Data_array[0][1] , \Data_array[0][0] }), .select_i(Shift_Value_i[0]), 
        .bit_shift_i(bit_shift_i), .Data_o({\Data_array[1][25] , 
        \Data_array[1][24] , \Data_array[1][23] , \Data_array[1][22] , 
        \Data_array[1][21] , \Data_array[1][20] , \Data_array[1][19] , 
        \Data_array[1][18] , \Data_array[1][17] , \Data_array[1][16] , 
        \Data_array[1][15] , \Data_array[1][14] , \Data_array[1][13] , 
        \Data_array[1][12] , \Data_array[1][11] , \Data_array[1][10] , 
        \Data_array[1][9] , \Data_array[1][8] , \Data_array[1][7] , 
        \Data_array[1][6] , \Data_array[1][5] , \Data_array[1][4] , 
        \Data_array[1][3] , \Data_array[1][2] , \Data_array[1][1] , 
        \Data_array[1][0] }) );
  shift_mux_array_SWR26_LEVEL1 \SHIFT_1LVLS[1].shift_mux_array  ( .Data_i({
        \Data_array[1][25] , \Data_array[1][24] , \Data_array[1][23] , 
        \Data_array[1][22] , \Data_array[1][21] , \Data_array[1][20] , 
        \Data_array[1][19] , \Data_array[1][18] , \Data_array[1][17] , 
        \Data_array[1][16] , \Data_array[1][15] , \Data_array[1][14] , 
        \Data_array[1][13] , \Data_array[1][12] , \Data_array[1][11] , 
        \Data_array[1][10] , \Data_array[1][9] , \Data_array[1][8] , 
        \Data_array[1][7] , \Data_array[1][6] , \Data_array[1][5] , 
        \Data_array[1][4] , \Data_array[1][3] , \Data_array[1][2] , 
        \Data_array[1][1] , \Data_array[1][0] }), .select_i(Shift_Value_i[1]), 
        .bit_shift_i(bit_shift_i), .Data_o({\Data_array[2][25] , 
        \Data_array[2][24] , \Data_array[2][23] , \Data_array[2][22] , 
        \Data_array[2][21] , \Data_array[2][20] , \Data_array[2][19] , 
        \Data_array[2][18] , \Data_array[2][17] , \Data_array[2][16] , 
        \Data_array[2][15] , \Data_array[2][14] , \Data_array[2][13] , 
        \Data_array[2][12] , \Data_array[2][11] , \Data_array[2][10] , 
        \Data_array[2][9] , \Data_array[2][8] , \Data_array[2][7] , 
        \Data_array[2][6] , \Data_array[2][5] , \Data_array[2][4] , 
        \Data_array[2][3] , \Data_array[2][2] , \Data_array[2][1] , 
        \Data_array[2][0] }) );
  shift_mux_array_SWR26_LEVEL2 \SHIFT_1LVLS[2].shift_mux_array  ( .Data_i({
        \Data_array[2][25] , \Data_array[2][24] , \Data_array[2][23] , 
        \Data_array[2][22] , \Data_array[2][21] , \Data_array[2][20] , 
        \Data_array[2][19] , \Data_array[2][18] , \Data_array[2][17] , 
        \Data_array[2][16] , \Data_array[2][15] , \Data_array[2][14] , 
        \Data_array[2][13] , \Data_array[2][12] , \Data_array[2][11] , 
        \Data_array[2][10] , \Data_array[2][9] , \Data_array[2][8] , 
        \Data_array[2][7] , \Data_array[2][6] , \Data_array[2][5] , 
        \Data_array[2][4] , \Data_array[2][3] , \Data_array[2][2] , 
        \Data_array[2][1] , \Data_array[2][0] }), .select_i(Shift_Value_i[2]), 
        .bit_shift_i(bit_shift_i), .Data_o({\Data_array[3][25] , 
        \Data_array[3][24] , \Data_array[3][23] , \Data_array[3][22] , 
        \Data_array[3][21] , \Data_array[3][20] , \Data_array[3][19] , 
        \Data_array[3][18] , \Data_array[3][17] , \Data_array[3][16] , 
        \Data_array[3][15] , \Data_array[3][14] , \Data_array[3][13] , 
        \Data_array[3][12] , \Data_array[3][11] , \Data_array[3][10] , 
        \Data_array[3][9] , \Data_array[3][8] , \Data_array[3][7] , 
        \Data_array[3][6] , \Data_array[3][5] , \Data_array[3][4] , 
        \Data_array[3][3] , \Data_array[3][2] , \Data_array[3][1] , 
        \Data_array[3][0] }) );
  RegisterAdd_W26_0 Mid_Reg ( .clk(clk), .rst(rst), .load(1'b1), .D({
        \Data_array[3][25] , \Data_array[3][24] , \Data_array[3][23] , 
        \Data_array[3][22] , \Data_array[3][21] , \Data_array[3][20] , 
        \Data_array[3][19] , \Data_array[3][18] , \Data_array[3][17] , 
        \Data_array[3][16] , \Data_array[3][15] , \Data_array[3][14] , 
        \Data_array[3][13] , \Data_array[3][12] , \Data_array[3][11] , 
        \Data_array[3][10] , \Data_array[3][9] , \Data_array[3][8] , 
        \Data_array[3][7] , \Data_array[3][6] , \Data_array[3][5] , 
        \Data_array[3][4] , \Data_array[3][3] , \Data_array[3][2] , 
        \Data_array[3][1] , \Data_array[3][0] }), .Q({\Data_array[4][25] , 
        \Data_array[4][24] , \Data_array[4][23] , \Data_array[4][22] , 
        \Data_array[4][21] , \Data_array[4][20] , \Data_array[4][19] , 
        \Data_array[4][18] , \Data_array[4][17] , \Data_array[4][16] , 
        \Data_array[4][15] , \Data_array[4][14] , \Data_array[4][13] , 
        \Data_array[4][12] , \Data_array[4][11] , \Data_array[4][10] , 
        \Data_array[4][9] , \Data_array[4][8] , \Data_array[4][7] , 
        \Data_array[4][6] , \Data_array[4][5] , \Data_array[4][4] , 
        \Data_array[4][3] , \Data_array[4][2] , \Data_array[4][1] , 
        \Data_array[4][0] }) );
  shift_mux_array_SWR26_LEVEL3 \SHIFT_2LVLS[3].shift_mux_array  ( .Data_i({
        \Data_array[4][25] , \Data_array[4][24] , \Data_array[4][23] , 
        \Data_array[4][22] , \Data_array[4][21] , \Data_array[4][20] , 
        \Data_array[4][19] , \Data_array[4][18] , \Data_array[4][17] , 
        \Data_array[4][16] , \Data_array[4][15] , \Data_array[4][14] , 
        \Data_array[4][13] , \Data_array[4][12] , \Data_array[4][11] , 
        \Data_array[4][10] , \Data_array[4][9] , \Data_array[4][8] , 
        \Data_array[4][7] , \Data_array[4][6] , \Data_array[4][5] , 
        \Data_array[4][4] , \Data_array[4][3] , \Data_array[4][2] , 
        \Data_array[4][1] , \Data_array[4][0] }), .select_i(Shift_Value_i[3]), 
        .bit_shift_i(bit_shift_i), .Data_o({\Data_array[5][25] , 
        \Data_array[5][24] , \Data_array[5][23] , \Data_array[5][22] , 
        \Data_array[5][21] , \Data_array[5][20] , \Data_array[5][19] , 
        \Data_array[5][18] , \Data_array[5][17] , \Data_array[5][16] , 
        \Data_array[5][15] , \Data_array[5][14] , \Data_array[5][13] , 
        \Data_array[5][12] , \Data_array[5][11] , \Data_array[5][10] , 
        \Data_array[5][9] , \Data_array[5][8] , \Data_array[5][7] , 
        \Data_array[5][6] , \Data_array[5][5] , \Data_array[5][4] , 
        \Data_array[5][3] , \Data_array[5][2] , \Data_array[5][1] , 
        \Data_array[5][0] }) );
  shift_mux_array_SWR26_LEVEL4 \SHIFT_2LVLS[4].shift_mux_array  ( .Data_i({
        \Data_array[5][25] , \Data_array[5][24] , \Data_array[5][23] , 
        \Data_array[5][22] , \Data_array[5][21] , \Data_array[5][20] , 
        \Data_array[5][19] , \Data_array[5][18] , \Data_array[5][17] , 
        \Data_array[5][16] , \Data_array[5][15] , \Data_array[5][14] , 
        \Data_array[5][13] , \Data_array[5][12] , \Data_array[5][11] , 
        \Data_array[5][10] , \Data_array[5][9] , \Data_array[5][8] , 
        \Data_array[5][7] , \Data_array[5][6] , \Data_array[5][5] , 
        \Data_array[5][4] , \Data_array[5][3] , \Data_array[5][2] , 
        \Data_array[5][1] , \Data_array[5][0] }), .select_i(Shift_Value_i[4]), 
        .bit_shift_i(bit_shift_i), .Data_o({\Data_array[6][25] , 
        \Data_array[6][24] , \Data_array[6][23] , \Data_array[6][22] , 
        \Data_array[6][21] , \Data_array[6][20] , \Data_array[6][19] , 
        \Data_array[6][18] , \Data_array[6][17] , \Data_array[6][16] , 
        \Data_array[6][15] , \Data_array[6][14] , \Data_array[6][13] , 
        \Data_array[6][12] , \Data_array[6][11] , \Data_array[6][10] , 
        \Data_array[6][9] , \Data_array[6][8] , \Data_array[6][7] , 
        \Data_array[6][6] , \Data_array[6][5] , \Data_array[6][4] , 
        \Data_array[6][3] , \Data_array[6][2] , \Data_array[6][1] , 
        \Data_array[6][0] }) );
  Rotate_Mux_Array_SWR26_0 last_rotate ( .Data_i({\Data_array[6][25] , 
        \Data_array[6][24] , \Data_array[6][23] , \Data_array[6][22] , 
        \Data_array[6][21] , \Data_array[6][20] , \Data_array[6][19] , 
        \Data_array[6][18] , \Data_array[6][17] , \Data_array[6][16] , 
        \Data_array[6][15] , \Data_array[6][14] , \Data_array[6][13] , 
        \Data_array[6][12] , \Data_array[6][11] , \Data_array[6][10] , 
        \Data_array[6][9] , \Data_array[6][8] , \Data_array[6][7] , 
        \Data_array[6][6] , \Data_array[6][5] , \Data_array[6][4] , 
        \Data_array[6][3] , \Data_array[6][2] , \Data_array[6][1] , 
        \Data_array[6][0] }), .select_i(FSM_left_right_i), .Data_o(Data_o) );
endmodule


module RegisterAdd_W26 ( clk, rst, load, D, Q );
  input [25:0] D;
  output [25:0] Q;
  input clk, rst, load;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38,
         n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n53,
         n72, n73, n74, n75, n76, n77, n78, n79, n71, n68, n69, n70, n80, n81,
         n82, n83;

  DFFRX2TS \Q_reg[25]  ( .D(n53), .CK(clk), .RN(n68), .Q(Q[25]), .QN(n74) );
  DFFRX2TS \Q_reg[24]  ( .D(n51), .CK(clk), .RN(n68), .Q(Q[24]), .QN(n73) );
  DFFRX2TS \Q_reg[23]  ( .D(n50), .CK(clk), .RN(n68), .Q(Q[23]), .QN(n72) );
  DFFRX2TS \Q_reg[22]  ( .D(n49), .CK(clk), .RN(n68), .Q(Q[22]), .QN(n79) );
  DFFRX2TS \Q_reg[21]  ( .D(n48), .CK(clk), .RN(n68), .Q(Q[21]), .QN(n78) );
  DFFRX2TS \Q_reg[20]  ( .D(n47), .CK(clk), .RN(n68), .Q(Q[20]), .QN(n77) );
  DFFRX2TS \Q_reg[19]  ( .D(n46), .CK(clk), .RN(n68), .Q(Q[19]), .QN(n76) );
  DFFRX2TS \Q_reg[18]  ( .D(n45), .CK(clk), .RN(n68), .Q(Q[18]), .QN(n75) );
  DFFRX2TS \Q_reg[17]  ( .D(n44), .CK(clk), .RN(n68), .Q(Q[17]), .QN(n18) );
  DFFRX2TS \Q_reg[16]  ( .D(n43), .CK(clk), .RN(n68), .Q(Q[16]), .QN(n17) );
  DFFRX2TS \Q_reg[15]  ( .D(n42), .CK(clk), .RN(n69), .Q(Q[15]), .QN(n16) );
  DFFRX2TS \Q_reg[14]  ( .D(n41), .CK(clk), .RN(n69), .Q(Q[14]), .QN(n15) );
  DFFRX2TS \Q_reg[13]  ( .D(n40), .CK(clk), .RN(n69), .Q(Q[13]), .QN(n14) );
  DFFRX2TS \Q_reg[12]  ( .D(n39), .CK(clk), .RN(n69), .Q(Q[12]), .QN(n13) );
  DFFRX2TS \Q_reg[11]  ( .D(n38), .CK(clk), .RN(n69), .Q(Q[11]), .QN(n12) );
  DFFRX2TS \Q_reg[10]  ( .D(n37), .CK(clk), .RN(n69), .Q(Q[10]), .QN(n11) );
  DFFRX2TS \Q_reg[9]  ( .D(n36), .CK(clk), .RN(n69), .Q(Q[9]), .QN(n10) );
  DFFRX2TS \Q_reg[8]  ( .D(n35), .CK(clk), .RN(n69), .Q(Q[8]), .QN(n9) );
  DFFRX2TS \Q_reg[7]  ( .D(n34), .CK(clk), .RN(n69), .Q(Q[7]), .QN(n8) );
  DFFRX2TS \Q_reg[6]  ( .D(n33), .CK(clk), .RN(n69), .Q(Q[6]), .QN(n7) );
  DFFRX2TS \Q_reg[5]  ( .D(n32), .CK(clk), .RN(n71), .Q(Q[5]), .QN(n6) );
  DFFRX2TS \Q_reg[4]  ( .D(n31), .CK(clk), .RN(n71), .Q(Q[4]), .QN(n5) );
  DFFRX2TS \Q_reg[3]  ( .D(n30), .CK(clk), .RN(n71), .Q(Q[3]), .QN(n4) );
  DFFRX2TS \Q_reg[2]  ( .D(n29), .CK(clk), .RN(n71), .Q(Q[2]), .QN(n3) );
  DFFRX2TS \Q_reg[1]  ( .D(n28), .CK(clk), .RN(n71), .Q(Q[1]), .QN(n2) );
  DFFRX2TS \Q_reg[0]  ( .D(n27), .CK(clk), .RN(n71), .Q(Q[0]), .QN(n1) );
  CLKBUFX2TS U2 ( .A(load), .Y(n70) );
  CLKBUFX2TS U3 ( .A(n83), .Y(n80) );
  CLKBUFX2TS U4 ( .A(n83), .Y(n81) );
  CLKBUFX2TS U5 ( .A(n83), .Y(n82) );
  CLKBUFX2TS U6 ( .A(n71), .Y(n69) );
  CLKBUFX2TS U7 ( .A(n71), .Y(n68) );
  OAI2BB2XLTS U8 ( .B0(n1), .B1(n70), .A0N(D[0]), .A1N(n82), .Y(n27) );
  OAI2BB2XLTS U9 ( .B0(n2), .B1(n70), .A0N(D[1]), .A1N(n81), .Y(n28) );
  OAI2BB2XLTS U10 ( .B0(n3), .B1(n70), .A0N(D[2]), .A1N(n81), .Y(n29) );
  OAI2BB2XLTS U11 ( .B0(n4), .B1(n70), .A0N(D[3]), .A1N(n81), .Y(n30) );
  OAI2BB2XLTS U12 ( .B0(n5), .B1(n70), .A0N(D[4]), .A1N(n81), .Y(n31) );
  OAI2BB2XLTS U13 ( .B0(n6), .B1(n70), .A0N(D[5]), .A1N(n80), .Y(n32) );
  OAI2BB2XLTS U14 ( .B0(n7), .B1(load), .A0N(D[6]), .A1N(n81), .Y(n33) );
  OAI2BB2XLTS U15 ( .B0(n8), .B1(n83), .A0N(D[7]), .A1N(n80), .Y(n34) );
  OAI2BB2XLTS U16 ( .B0(n9), .B1(load), .A0N(D[8]), .A1N(n80), .Y(n35) );
  OAI2BB2XLTS U17 ( .B0(n10), .B1(n82), .A0N(D[9]), .A1N(n70), .Y(n36) );
  OAI2BB2XLTS U18 ( .B0(n11), .B1(n82), .A0N(D[10]), .A1N(n70), .Y(n37) );
  OAI2BB2XLTS U19 ( .B0(n12), .B1(n82), .A0N(D[11]), .A1N(n70), .Y(n38) );
  OAI2BB2XLTS U20 ( .B0(n13), .B1(n83), .A0N(D[12]), .A1N(n70), .Y(n39) );
  OAI2BB2XLTS U21 ( .B0(n14), .B1(load), .A0N(D[13]), .A1N(n80), .Y(n40) );
  OAI2BB2XLTS U22 ( .B0(n15), .B1(load), .A0N(D[14]), .A1N(n80), .Y(n41) );
  OAI2BB2XLTS U23 ( .B0(n16), .B1(load), .A0N(D[15]), .A1N(n80), .Y(n42) );
  OAI2BB2XLTS U24 ( .B0(n17), .B1(load), .A0N(D[16]), .A1N(n80), .Y(n43) );
  OAI2BB2XLTS U25 ( .B0(n18), .B1(load), .A0N(D[17]), .A1N(n80), .Y(n44) );
  OAI2BB2XLTS U26 ( .B0(n75), .B1(n83), .A0N(D[18]), .A1N(n80), .Y(n45) );
  OAI2BB2XLTS U27 ( .B0(n76), .B1(n83), .A0N(D[19]), .A1N(n80), .Y(n46) );
  OAI2BB2XLTS U28 ( .B0(n77), .B1(n83), .A0N(D[20]), .A1N(n81), .Y(n47) );
  OAI2BB2XLTS U29 ( .B0(n78), .B1(n83), .A0N(D[21]), .A1N(n81), .Y(n48) );
  OAI2BB2XLTS U30 ( .B0(n79), .B1(n83), .A0N(D[22]), .A1N(n81), .Y(n49) );
  OAI2BB2XLTS U31 ( .B0(n72), .B1(n82), .A0N(D[23]), .A1N(n81), .Y(n50) );
  OAI2BB2XLTS U32 ( .B0(n73), .B1(n82), .A0N(D[24]), .A1N(n81), .Y(n51) );
  OAI2BB2XLTS U33 ( .B0(n74), .B1(load), .A0N(n82), .A1N(D[25]), .Y(n53) );
  CLKBUFX2TS U34 ( .A(load), .Y(n83) );
  INVX2TS U35 ( .A(rst), .Y(n71) );
endmodule


module Barrel_Shifter ( clk, rst, load_i, Shift_Value_i, Shift_Data_i, 
        Left_Right_i, Bit_Shift_i, N_mant_o );
  input [4:0] Shift_Value_i;
  input [25:0] Shift_Data_i;
  output [25:0] N_mant_o;
  input clk, rst, load_i, Left_Right_i, Bit_Shift_i;

  wire   [25:0] Data_Reg;

  Mux_Array_SWR26_EWR5 Mux_Array ( .clk(clk), .rst(rst), .load_i(load_i), 
        .Data_i(Shift_Data_i), .FSM_left_right_i(Left_Right_i), 
        .Shift_Value_i(Shift_Value_i), .bit_shift_i(Bit_Shift_i), .Data_o(
        Data_Reg) );
  RegisterAdd_W26 Output_Reg ( .clk(clk), .rst(rst), .load(load_i), .D(
        Data_Reg), .Q(N_mant_o) );
endmodule

