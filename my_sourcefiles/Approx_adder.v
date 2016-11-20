`timescale 1ns / 1ps


module Approx_adder
    #(parameter W=26, parameter LowL=16) (
        input wire add_sub,
        input wire [W-1:0] in1,
        input wire [W-1:0] in2,
       output wire [W:0] res
    );

  wire  [W-1:0] in2_signed;
  wire  [LowL-1:0] lower_res;
 wire approx_cout;

`ifdef ACAIN16Q4
 assign in2_signed = (add_sub) ? ~in2 : in2;
   ACA_I_N16_Q4 ApproxAdd (.in1(in1[LowL-1:0]), .in2(in2_signed[LowL-1:0]), .res({approx_cout,lower_res}));

  always @* begin : ADD_SUB_SGF
      res = {(in1[W-1:LowL] + in2_signed[W-1:LowL] + approx_cout),lower_res};
  end
`elsif ETAIIN16Q4

  assign in2_signed = (add_sub) ? ~in2 : in2;

  ETAII_N16_Q4 ApproxAdd (.in1(in1[LowL-1:0]), .in2(in2_signed[LowL-1:0]), .res({approx_cout,lower_res}));

  always @* begin : ADD_SUB_SGF
      res = {(in1[W-1:LowL] + in2_signed[W-1:LowL] + approx_cout),lower_res};
  end
`elsif ETAIIN16Q8

  assign in2_signed = (add_sub) ? ~in2 : in2;

  ETAII_N16_Q8 ApproxAdd (.in1(in1[LowL-1:0]), .in2(in2_signed[LowL-1:0]), .res({approx_cout,lower_res}));

  always @* begin : ADD_SUB_SGF
      res = {(in1[W-1:LowL] + in2_signed[W-1:LowL] + approx_cout),lower_res};
  end
`elsif ACAIIN16Q4

  assign in2_signed = (add_sub) ? ~in2 : in2;

  ACA_II_N16_Q4 ApproxAdd (.in1(in1[LowL-1:0]), .in2(in2_signed[LowL-1:0]), .res({approx_cout,lower_res}));

  always @* begin : ADD_SUB_SGF
      res = {(in1[W-1:LowL] + in2_signed[W-1:LowL] + approx_cout),lower_res};
  end
`elsif ACAIIN16Q8

  assign in2_signed = (add_sub) ? ~in2 : in2;

  ACA_II_N16_Q8 ApproxAdd (.in1(in1[LowL-1:0]), .in2(in2_signed[LowL-1:0]), .res({approx_cout,lower_res}));

  always @* begin : ADD_SUB_SGF
      res = {(in1[W-1:LowL] + in2_signed[W-1:LowL] + approx_cout),lower_res};
  end
`elsif GDAN16M4P4

  assign in2_signed = (add_sub) ? ~in2 : in2;

  GDA_St_N16_M4_P4 ApproxAdd (.in1(in1[LowL-1:0]), .in2(in2_signed[LowL-1:0]), .res({approx_cout,lower_res}));

  always @* begin : ADD_SUB_SGF
      res = {(in1[W-1:LowL] + in2_signed[W-1:LowL] + approx_cout),lower_res};
  end
`elsif GDAN16M4P8

  assign in2_signed = (add_sub) ? ~in2 : in2;

  GDA_St_N16_M4_P8 ApproxAdd (.in1(in1[LowL-1:0]), .in2(in2_signed[LowL-1:0]), .res({approx_cout,lower_res}));

  always @* begin : ADD_SUB_SGF
      res = {(in1[W-1:LowL] + in2_signed[W-1:LowL] + approx_cout),lower_res};
  end
`elsif GeArN16R2P4


  assign in2_signed = (add_sub) ? ~in2 : in2;

  GeAr_N16_R2_P4 ApproxAdd (.in1(in1[LowL-1:0]), .in2(in2_signed[LowL-1:0]), .res({approx_cout,lower_res}));

  always @* begin : ADD_SUB_SGF
      res = {(in1[W-1:LowL] + in2_signed[W-1:LowL] + approx_cout),lower_res};
  end
`elsif GeArN16R4P4


  assign in2_signed = (add_sub) ? ~in2 : in2;

  GeAr_N16_R4_P4 ApproxAdd (.in1(in1[LowL-1:0]), .in2(in2_signed[LowL-1:0]), .res({approx_cout,lower_res}));

  always @* begin : ADD_SUB_SGF
      res = {(in1[W-1:LowL] + in2_signed[W-1:LowL] + approx_cout),lower_res};
  end
`elsif GeArN16R4P8

  assign in2_signed = (add_sub) ? ~in2 : in2;

  GeAr_N16_R4_P8 ApproxAdd (.in1(in1[LowL-1:0]), .in2(in2_signed[LowL-1:0]), .res({approx_cout,lower_res}));

  always @* begin : ADD_SUB_SGF
      res = {(in1[W-1:LowL] + in2_signed[W-1:LowL] + approx_cout),lower_res};
  end
`elsif LOALPL4

  assign in2_signed = (add_sub) ? ~in2 : in2;

    LOA #(.LPL(4), .W(16)) ApproxAdd (.in1(in1[LowL-1:0]), .in2(in2_signed[LowL-1:0]), .res({approx_cout,lower_res}));

  always @* begin : ADD_SUB_SGF
      res = {(in1[W-1:LowL] + in2_signed[W-1:LowL] + approx_cout),lower_res};
  end
`elsif LOALPL5

  assign in2_signed = (add_sub) ? ~in2 : in2;

    LOA #(.LPL(5), .W(16)) ApproxAdd (.in1(in1[LowL-1:0]), .in2(in2_signed[LowL-1:0]), .res({approx_cout,lower_res}));

  always @* begin : ADD_SUB_SGF
      res = {(in1[W-1:LowL] + in2_signed[W-1:LowL] + approx_cout),lower_res};
  end
`elsif LOALPL6
  assign in2_signed = (add_sub) ? ~in2 : in2;

    LOA #(.LPL(6), .W(16)) ApproxAdd (.in1(in1[LowL-1:0]), .in2(in2_signed[LowL-1:0]), .res({approx_cout,lower_res}));

  always @* begin : ADD_SUB_SGF
      res = {(in1[W-1:LowL] + in2_signed[W-1:LowL] + approx_cout),lower_res};
  end
`elsif LOALPL7
  assign in2_signed = (add_sub) ? ~in2 : in2;

    LOA #(.LPL(7), .W(16)) ApproxAdd (.in1(in1[LowL-1:0]), .in2(in2_signed[LowL-1:0]), .res({approx_cout,lower_res}));

  always @* begin : ADD_SUB_SGF
      res = {(in1[W-1:LowL] + in2_signed[W-1:LowL] + approx_cout),lower_res};
  end
`elsif LOALPL8

  assign in2_signed = (add_sub) ? ~in2 : in2;

    LOA #(.LPL(8), .W(16)) ApproxAdd (.in1(in1[LowL-1:0]), .in2(in2_signed[LowL-1:0]), .res({approx_cout,lower_res}));

  always @* begin : ADD_SUB_SGF
      res = {(in1[W-1:LowL] + in2_signed[W-1:LowL] + approx_cout),lower_res};
  end
`elsif LOALPL9

  assign in2_signed = (add_sub) ? ~in2 : in2;

    LOA #(.LPL(9), .W(16)) ApproxAdd (.in1(in1[LowL-1:0]), .in2(in2_signed[LowL-1:0]), .res({approx_cout,lower_res}));

  always @* begin : ADD_SUB_SGF
      res = {(in1[W-1:LowL] + in2_signed[W-1:LowL] + approx_cout),lower_res};
  end
`elsif LOALPL10

  assign in2_signed = (add_sub) ? ~in2 : in2;

    LOA #(.LPL(10), .W(16)) ApproxAdd (.in1(in1[LowL-1:0]), .in2(in2_signed[LowL-1:0]), .res({approx_cout,lower_res}));

  always @* begin : ADD_SUB_SGF
      res = {(in1[W-1:LowL] + in2_signed[W-1:LowL] + approx_cout),lower_res};
  end
`elsif LOALPL11

  assign in2_signed = (add_sub) ? ~in2 : in2;

    LOA #(.LPL(11), .W(16)) ApproxAdd (.in1(in1[LowL-1:0]), .in2(in2_signed[LowL-1:0]), .res({approx_cout,lower_res}));

  always @* begin : ADD_SUB_SGF
      res = {(in1[W-1:LowL] + in2_signed[W-1:LowL] + approx_cout),lower_res};
  end
`elsif LOALPL12

  assign in2_signed = (add_sub) ? ~in2 : in2;

    LOA #(.LPL(12), .W(16)) ApproxAdd (.in1(in1[LowL-1:0]), .in2(in2_signed[LowL-1:0]), .res({approx_cout,lower_res}));

  always @* begin : ADD_SUB_SGF
      res = {(in1[W-1:LowL] + in2_signed[W-1:LowL] + approx_cout),lower_res};
  end
`elsif LOALPL13

  assign in2_signed = (add_sub) ? ~in2 : in2;

    LOA #(.LPL(13), .W(16)) ApproxAdd (.in1(in1[LowL-1:0]), .in2(in2_signed[LowL-1:0]), .res({approx_cout,lower_res}));

  always @* begin : ADD_SUB_SGF
      res = {(in1[W-1:LowL] + in2_signed[W-1:LowL] + approx_cout),lower_res};
  end
`elsif GeArN16R6P4

  assign in2_signed = (add_sub) ? ~in2 : in2;

  GeAr_N16_R6_P4 ApproxAdd (.in1(in1[LowL-1:0]), .in2(in2_signed[LowL-1:0]), .res({approx_cout,lower_res}));

  always @* begin : ADD_SUB_SGF
      res = {(in1[W-1:LowL] + in2_signed[W-1:LowL] + approx_cout),lower_res};
  end
`else
       assign   res = (add_sub) ? (in1 - in2) : (in1 + in2);
`endif

endmodule


