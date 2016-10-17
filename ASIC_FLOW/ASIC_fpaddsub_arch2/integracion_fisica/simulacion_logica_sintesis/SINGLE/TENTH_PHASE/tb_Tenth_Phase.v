
`timescale 1ns/1ps

module tb_Tenth_Phase (); /* this is automatically generated */

  logic rstb;
  logic srst;
  logic clk;

  // clock
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  // reset
  initial begin
    rstb = 0;
    srst = 0;
    #20
    rstb = 1;
    repeat (5) @(posedge clk);
    srst = 1;
    repeat (1) @(posedge clk);
    srst = 0;
  end

  // (*NOTE*) replace reset, clock

  parameter W  = 32;
  parameter EW = 8;
  parameter SW = 23;

  logic          rst;
  logic          load_i;
  logic          sel_a_i;
  logic          sel_b_i;
  logic          sign_i;
  logic [EW-1:0] exp_ieee_i;
  logic [SW-1:0] sgf_ieee_i;
  logic  [W-1:0] final_result_ieee_o;

  Tenth_Phase #(
      .W(W),
      .EW(EW),
      .SW(SW)
    ) inst_Tenth_Phase (
      .clk                 (clk),
      .rst                 (rst),
      .load_i              (load_i),
      .sel_a_i             (sel_a_i),
      .sel_b_i             (sel_b_i),
      .sign_i              (sign_i),
      .exp_ieee_i          (exp_ieee_i),
      .sgf_ieee_i          (sgf_ieee_i),
      .final_result_ieee_o (final_result_ieee_o)
    );

  initial begin
    // do something

    repeat(10)@(posedge clk);
    $finish;
  end

  // dump wave
  initial begin
    $fsdbDumpfile("tb_Tenth_Phase.fsdb");
    $fsdbDumpvars(0, "tb_Tenth_Phase", "+mda");
  end

endmodule
