/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : L-2016.03-SP3
// Date      : Sun Nov 20 02:24:03 2016
/////////////////////////////////////////////////////////////


module LOA ( in1, in2, res );
  input [15:0] in1;
  input [15:0] in2;
  output [16:0] res;
  wire   intadd_16_CI, intadd_16_n6, intadd_16_n5, intadd_16_n4, intadd_16_n3,
         intadd_16_n2;

  CMPR32X2TS intadd_16_U7 ( .A(in1[10]), .B(in2[10]), .C(intadd_16_CI), .CO(
        intadd_16_n6), .S(res[10]) );
  CMPR32X2TS intadd_16_U6 ( .A(in1[11]), .B(in2[11]), .C(intadd_16_n6), .CO(
        intadd_16_n5), .S(res[11]) );
  CMPR32X2TS intadd_16_U5 ( .A(in1[12]), .B(in2[12]), .C(intadd_16_n5), .CO(
        intadd_16_n4), .S(res[12]) );
  CMPR32X2TS intadd_16_U4 ( .A(in1[13]), .B(in2[13]), .C(intadd_16_n4), .CO(
        intadd_16_n3), .S(res[13]) );
  CMPR32X2TS intadd_16_U3 ( .A(in1[14]), .B(in2[14]), .C(intadd_16_n3), .CO(
        intadd_16_n2), .S(res[14]) );
  CMPR32X2TS intadd_16_U2 ( .A(in1[15]), .B(in2[15]), .C(intadd_16_n2), .CO(
        res[16]), .S(res[15]) );
  CLKAND2X2TS U12 ( .A(in2[9]), .B(in1[9]), .Y(intadd_16_CI) );
  OR2X1TS U13 ( .A(in2[9]), .B(in1[9]), .Y(res[9]) );
  OR2X1TS U14 ( .A(in1[8]), .B(in2[8]), .Y(res[8]) );
  OR2X1TS U15 ( .A(in1[7]), .B(in2[7]), .Y(res[7]) );
  OR2X1TS U16 ( .A(in1[6]), .B(in2[6]), .Y(res[6]) );
  OR2X1TS U17 ( .A(in1[5]), .B(in2[5]), .Y(res[5]) );
  OR2X1TS U18 ( .A(in1[0]), .B(in2[0]), .Y(res[0]) );
  OR2X1TS U19 ( .A(in1[4]), .B(in2[4]), .Y(res[4]) );
  OR2X1TS U20 ( .A(in1[3]), .B(in2[3]), .Y(res[3]) );
  OR2X1TS U21 ( .A(in1[2]), .B(in2[2]), .Y(res[2]) );
  OR2X1TS U22 ( .A(in1[1]), .B(in2[1]), .Y(res[1]) );
initial $sdf_annotate("LOA_syn.sdf"); 
 endmodule

