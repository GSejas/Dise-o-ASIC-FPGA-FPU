
`timescale 1ns/1ps

module tb_multiplier (); /* this is automatically generated */

  reg clk;
  // clock
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end
`ifdef SINGLE
	parameter SW = 24;
`endif

`ifdef DOUBLE
	parameter SW = 54;// */
`endif

  // (*NOTE*) replace reset, clock

  reg [SW-1:0] a;
  reg [SW-1:0] b;
  wire [2*SW-1:0] RecursiveKOA;
  wire [2*SW-1:0] KOA_Simple;

  reg rst;
  reg load_b_i;

  // RecursiveKOA #(
  //     .SW(SW)
  //   ) inst_RecursiveKOA (
  //     .clk          (clk),
  //     .rst          (rst),
  //     .load_b_i     (load_b_i),
  //     .Data_A_i     (a),
  //     .Data_B_i     (b),
  //     .sgf_result_o (RecursiveKOA)
  //   );

  Simple_KOA #(
      .SW(SW)
    ) inst_Simple_KOA (
      .clk          (clk),
      .rst          (rst),
      .load_b_i     (load_b_i),
      .Data_A_i     (a),
      .Data_B_i     (b),
      .sgf_result_o (KOA_Simple)
    );

  integer i = 1;
  parameter cycles = 1024;

    initial begin
      $monitor(a,b, KOA_Simple, RecursiveKOA, a*b);
end

    initial begin
      b = 1;
	rst = 1;
      a = 1;
      load_b_i = 0;
      #30;
      rst = 0;
      #15;
      load_b_i = 1;
      #100;
      b = 2;

          repeat (cycles)  begin
          a = i;
          b = b + 2;
          i = i + 1;
          #50;
          end
      $finish;
      end
endmodule
