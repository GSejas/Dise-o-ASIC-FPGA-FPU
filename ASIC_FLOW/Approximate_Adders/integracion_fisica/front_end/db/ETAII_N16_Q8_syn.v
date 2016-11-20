/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : L-2016.03-SP3
// Date      : Sun Nov 20 02:50:24 2016
/////////////////////////////////////////////////////////////


module ETAII_N16_Q8_DW01_add_J49_0 ( A, B, CI, SUM, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] SUM;
  input CI;
  output CO;
  wire   n38, n39, n40, n41, n42, n43, n44, n45;

  NOR2X1TS U13 ( .A(A[3]), .B(B[3]), .Y(n40) );
  OAI211X1TS U14 ( .A0(A[1]), .A1(B[1]), .B0(B[0]), .C0(A[0]), .Y(n38) );
  OAI2BB1X1TS U15 ( .A0N(B[1]), .A1N(A[1]), .B0(n38), .Y(n39) );
  AOI222X1TS U16 ( .A0(B[2]), .A1(A[2]), .B0(B[2]), .B1(n39), .C0(A[2]), .C1(
        n39), .Y(n41) );
  OAI2BB2XLTS U17 ( .B0(n41), .B1(n40), .A0N(A[3]), .A1N(B[3]), .Y(n42) );
  CMPR32X2TS U18 ( .A(A[4]), .B(B[4]), .C(n42), .CO(n43), .S(SUM[4]) );
  CMPR32X2TS U19 ( .A(A[5]), .B(B[5]), .C(n43), .CO(n44), .S(SUM[5]) );
  CMPR32X2TS U20 ( .A(A[6]), .B(B[6]), .C(n44), .CO(n45), .S(SUM[6]) );
  CMPR32X2TS U21 ( .A(A[7]), .B(B[7]), .C(n45), .CO(SUM[8]), .S(SUM[7]) );
initial $sdf_annotate("ETAII_N16_Q8_syn.sdf"); 
 endmodule


module ETAII_N16_Q8_DW01_add_J49_1 ( A, B, CI, SUM, CO );
  input [7:0] A;
  input [7:0] B;
  output [7:0] SUM;
  input CI;
  output CO;
  wire   n35, n36, n37, n38, n39, n40, n41, n42, n43;

  XOR2XLTS U13 ( .A(B[7]), .B(n41), .Y(SUM[7]) );
  NOR2X1TS U14 ( .A(A[3]), .B(B[3]), .Y(n37) );
  OAI2BB2XLTS U15 ( .B0(n38), .B1(n37), .A0N(A[3]), .A1N(B[3]), .Y(n42) );
  ADDFHX2TS U16 ( .A(A[5]), .B(B[5]), .CI(n39), .CO(n43), .S(SUM[5]) );
  XOR2X1TS U17 ( .A(A[7]), .B(n40), .Y(n41) );
  OAI211X1TS U18 ( .A0(A[1]), .A1(B[1]), .B0(B[0]), .C0(A[0]), .Y(n35) );
  OAI2BB1X2TS U19 ( .A0N(B[1]), .A1N(A[1]), .B0(n35), .Y(n36) );
  AOI222X1TS U20 ( .A0(B[2]), .A1(A[2]), .B0(B[2]), .B1(n36), .C0(A[2]), .C1(
        n36), .Y(n38) );
  CMPR32X2TS U21 ( .A(A[4]), .B(B[4]), .C(n42), .CO(n39), .S(SUM[4]) );
  CMPR32X2TS U22 ( .A(A[6]), .B(B[6]), .C(n43), .CO(n40), .S(SUM[6]) );
initial $sdf_annotate("ETAII_N16_Q8_syn.sdf"); 
 endmodule


module ETAII_N16_Q8_DW01_add_J49_2 ( A, B, CI, SUM, CO );
  input [7:0] A;
  input [7:0] B;
  output [7:0] SUM;
  input CI;
  output CO;
  wire   n35, n36, n37, n38, n39, n40, n41, n42, n43;

  NOR2XLTS U13 ( .A(A[3]), .B(B[3]), .Y(n37) );
  OAI2BB2XLTS U14 ( .B0(n38), .B1(n37), .A0N(A[3]), .A1N(B[3]), .Y(n41) );
  OAI2BB1X1TS U15 ( .A0N(B[1]), .A1N(A[1]), .B0(n35), .Y(n36) );
  OAI211X1TS U16 ( .A0(A[1]), .A1(B[1]), .B0(B[0]), .C0(A[0]), .Y(n35) );
  AOI222X1TS U17 ( .A0(B[2]), .A1(A[2]), .B0(B[2]), .B1(n36), .C0(A[2]), .C1(
        n36), .Y(n38) );
  XOR2X4TS U18 ( .A(A[7]), .B(n39), .Y(n40) );
  XOR2X1TS U19 ( .A(B[7]), .B(n40), .Y(SUM[7]) );
  CMPR32X2TS U20 ( .A(A[4]), .B(B[4]), .C(n41), .CO(n42), .S(SUM[4]) );
  CMPR32X2TS U21 ( .A(A[5]), .B(B[5]), .C(n42), .CO(n43), .S(SUM[5]) );
  CMPR32X2TS U22 ( .A(A[6]), .B(B[6]), .C(n43), .CO(n39), .S(SUM[6]) );
initial $sdf_annotate("ETAII_N16_Q8_syn.sdf"); 
 endmodule


module ETAII_N16_Q8 ( in1, in2, res );
  input [15:0] in1;
  input [15:0] in2;
  output [16:0] res;
  wire   n6, n7, n8, n9, SYNOPSYS_UNCONNECTED_1, SYNOPSYS_UNCONNECTED_2,
         SYNOPSYS_UNCONNECTED_3, SYNOPSYS_UNCONNECTED_4,
         SYNOPSYS_UNCONNECTED_5, SYNOPSYS_UNCONNECTED_6,
         SYNOPSYS_UNCONNECTED_7, SYNOPSYS_UNCONNECTED_8,
         SYNOPSYS_UNCONNECTED_9, SYNOPSYS_UNCONNECTED_10,
         SYNOPSYS_UNCONNECTED_11, SYNOPSYS_UNCONNECTED_12;

  ETAII_N16_Q8_DW01_add_J49_0 add_x_4 ( .A({1'b0, in1[15:8]}), .B({1'b0, 
        in2[15:8]}), .CI(1'b0), .SUM({res[16:12], SYNOPSYS_UNCONNECTED_1, 
        SYNOPSYS_UNCONNECTED_2, SYNOPSYS_UNCONNECTED_3, SYNOPSYS_UNCONNECTED_4}) );
  ETAII_N16_Q8_DW01_add_J49_1 add_x_3 ( .A(in1[11:4]), .B(in2[11:4]), .CI(1'b0), .SUM({res[11:8], SYNOPSYS_UNCONNECTED_5, SYNOPSYS_UNCONNECTED_6, 
        SYNOPSYS_UNCONNECTED_7, SYNOPSYS_UNCONNECTED_8}) );
  ETAII_N16_Q8_DW01_add_J49_2 add_x_2 ( .A(in1[7:0]), .B(in2[7:0]), .CI(1'b0), 
        .SUM({res[7:4], SYNOPSYS_UNCONNECTED_9, SYNOPSYS_UNCONNECTED_10, 
        SYNOPSYS_UNCONNECTED_11, SYNOPSYS_UNCONNECTED_12}) );
  XOR2XLTS U8 ( .A(in1[3]), .B(n9), .Y(res[3]) );
  CLKAND2X2TS U9 ( .A(in1[0]), .B(in2[0]), .Y(n6) );
  AOI2BB1XLTS U10 ( .A0N(in1[0]), .A1N(in2[0]), .B0(n6), .Y(res[0]) );
  CMPR32X2TS U12 ( .A(in1[1]), .B(in2[1]), .C(n6), .CO(n7), .S(res[1]) );
  CMPR32X2TS U13 ( .A(in1[2]), .B(in2[2]), .C(n7), .CO(n8), .S(res[2]) );
  XOR2X1TS U14 ( .A(in2[3]), .B(n8), .Y(n9) );
initial $sdf_annotate("ETAII_N16_Q8_syn.sdf"); 
 endmodule

