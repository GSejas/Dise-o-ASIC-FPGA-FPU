/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : L-2016.03-SP3
// Date      : Sun Nov 20 02:21:26 2016
/////////////////////////////////////////////////////////////


module GeAr_N16_R4_P4_DW01_add_J24_0 ( A, B, CI, SUM, CO );
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
initial $sdf_annotate("GeAr_N16_R4_P4_syn.sdf"); 
 endmodule


module GeAr_N16_R4_P4_DW01_add_J24_1 ( A, B, CI, SUM, CO );
  input [7:0] A;
  input [7:0] B;
  output [7:0] SUM;
  input CI;
  output CO;
  wire   n35, n36, n37, n38, n39, n40, n41, n42, n43;

  NOR2XLTS U13 ( .A(A[3]), .B(B[3]), .Y(n37) );
  XOR2XLTS U14 ( .A(B[7]), .B(n41), .Y(SUM[7]) );
  OAI2BB2X1TS U15 ( .B0(n38), .B1(n37), .A0N(A[3]), .A1N(B[3]), .Y(n42) );
  AOI222X2TS U16 ( .A0(B[2]), .A1(A[2]), .B0(B[2]), .B1(n36), .C0(A[2]), .C1(
        n36), .Y(n38) );
  ADDFHX2TS U17 ( .A(A[5]), .B(B[5]), .CI(n39), .CO(n43), .S(SUM[5]) );
  OAI2BB1X1TS U18 ( .A0N(B[1]), .A1N(A[1]), .B0(n35), .Y(n36) );
  XOR2X1TS U19 ( .A(A[7]), .B(n40), .Y(n41) );
  OAI211X1TS U20 ( .A0(A[1]), .A1(B[1]), .B0(B[0]), .C0(A[0]), .Y(n35) );
  CMPR32X2TS U21 ( .A(A[4]), .B(B[4]), .C(n42), .CO(n39), .S(SUM[4]) );
  CMPR32X2TS U22 ( .A(A[6]), .B(B[6]), .C(n43), .CO(n40), .S(SUM[6]) );
initial $sdf_annotate("GeAr_N16_R4_P4_syn.sdf"); 
 endmodule


module GeAr_N16_R4_P4 ( in1, in2, res );
  input [15:0] in1;
  input [15:0] in2;
  output [16:0] res;
  wire   n2, n3, n4, n5, n6, n7, n8, n9, SYNOPSYS_UNCONNECTED_1,
         SYNOPSYS_UNCONNECTED_2, SYNOPSYS_UNCONNECTED_3,
         SYNOPSYS_UNCONNECTED_4, SYNOPSYS_UNCONNECTED_5,
         SYNOPSYS_UNCONNECTED_6, SYNOPSYS_UNCONNECTED_7,
         SYNOPSYS_UNCONNECTED_8;

  GeAr_N16_R4_P4_DW01_add_J24_0 add_x_3 ( .A({1'b0, in1[15:8]}), .B({1'b0, 
        in2[15:8]}), .CI(1'b0), .SUM({res[16:12], SYNOPSYS_UNCONNECTED_1, 
        SYNOPSYS_UNCONNECTED_2, SYNOPSYS_UNCONNECTED_3, SYNOPSYS_UNCONNECTED_4}) );
  GeAr_N16_R4_P4_DW01_add_J24_1 add_x_2 ( .A(in1[11:4]), .B(in2[11:4]), .CI(
        1'b0), .SUM({res[11:8], SYNOPSYS_UNCONNECTED_5, SYNOPSYS_UNCONNECTED_6, 
        SYNOPSYS_UNCONNECTED_7, SYNOPSYS_UNCONNECTED_8}) );
  XOR2XLTS U2 ( .A(n3), .B(n2), .Y(res[7]) );
  XOR2XLTS U3 ( .A(in1[7]), .B(in2[7]), .Y(n2) );
  ADDHXLTS U4 ( .A(in2[0]), .B(in1[0]), .CO(n9), .S(res[0]) );
  CMPR32X2TS U5 ( .A(in1[6]), .B(in2[6]), .C(n4), .CO(n3), .S(res[6]) );
  CMPR32X2TS U6 ( .A(in1[5]), .B(in2[5]), .C(n5), .CO(n4), .S(res[5]) );
  CMPR32X2TS U7 ( .A(in1[4]), .B(in2[4]), .C(n6), .CO(n5), .S(res[4]) );
  CMPR32X2TS U8 ( .A(in1[3]), .B(in2[3]), .C(n7), .CO(n6), .S(res[3]) );
  CMPR32X2TS U9 ( .A(in1[2]), .B(in2[2]), .C(n8), .CO(n7), .S(res[2]) );
  CMPR32X2TS U10 ( .A(in1[1]), .B(in2[1]), .C(n9), .CO(n8), .S(res[1]) );
initial $sdf_annotate("GeAr_N16_R4_P4_syn.sdf"); 
 endmodule

