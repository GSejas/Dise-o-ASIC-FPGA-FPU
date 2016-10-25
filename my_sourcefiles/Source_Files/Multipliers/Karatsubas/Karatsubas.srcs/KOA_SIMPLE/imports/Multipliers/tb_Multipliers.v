
`timescale 1ns/1ps

module tb_multiplier (); /* this is automatically generated */


  // clock
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end


  // (*NOTE*) replace reset, clock

  reg [SW-1:0] a;
  reg [SW-1:0] b;
 // wire [2*SW-2:0] BinaryRES;
 // wire [2*SW-1:0] FKOARES;
 // wire [2*SW-1:0] RKOARES;
  //wire [2*SW-2:0] SimpleRES;
 // wire [2*SW-2:0] HybridRES;
  wire [2*SW-1:0] Simple_KOA;
 // wire [2*SW-1:0] Recursive_KOA;
  reg clk;

  parameter SW = 24;

//  Bks26 inst_Bks26 (.a(a), .b(b), .d(BinaryRES));
 // Sgf_Multiplication #(.SW(SW)) inst_Sgf_Multiplication (.clk(clk),.Data_A_i(a), .Data_B_i(b), .sgf_result_o(FKOARES));
//  Sks26 inst_Sks26 (.a(a), .b(b), .d(SimpleRES));
 // Hks26 inst_Hks26 (.a(a), .b(b), .d(HybridRES));
  //RKOA #(.SW(SW)) inst_RKOA (.Data_A_i(a), .Data_B_i(b), .sgf_result_o(RKOARES));

  Simple_KOA #(.SW(SW)) i_Simple_KOA (.Data_A_i(a), .Data_B_i(b), .sgf_result_o(Simple_KOA));

 // Recursive_KOA #(.SW(SW)) inst_Recursive_KOA (.Data_A_i(a), .Data_B_i(b), .sgf_result_o(Recursive_KOA));

  integer i = 1;
  parameter cycles = 1024;

    initial begin
      $monitor(a,b, Simple_KOA);
end

    initial begin
      b = 1;

      a = 1;

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
