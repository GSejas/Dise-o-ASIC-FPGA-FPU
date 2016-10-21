
`timescale 1ns/1ps

module tb_Oper_Start_In (); /* this is automatically generated */

  parameter PERIOD = 10;
  reg clk;
  reg rst;

  // clock
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  // reset
  initial begin
    rst = 0;

    #6
    rst = 1;
    repeat (6) @(posedge clk);
    rst = 0;
  end

  // (*NOTE*) replace reset, clock

  parameter W = 32;

  reg          rst;
  reg          load_a_i;
  reg          load_b_i;
  reg          add_subt_i;
  reg  [W-1:0] Data_X_i;
  reg  [W-1:0] Data_Y_i;
  wire [W-2:0] DMP_o;
  wire [W-2:0] DmP_o;
  wire         zero_flag_o;
  wire         real_op_o;
  wire         sign_final_result_o;
`ifdef OPER1
  Oper_Start_In #(
      .W(W)
    ) inst_Oper_Start_In (
      .clk                 (clk),
      .rst                 (rst),
      .load_a_i            (load_a_i),
      .load_b_i            (load_b_i),
      .add_subt_i          (add_subt_i),
      .Data_X_i            (Data_X_i),
      .Data_Y_i            (Data_Y_i),
      .DMP_o               (DMP_o),
      .DmP_o               (DmP_o),
      .zero_flag_o         (zero_flag_o),
      .real_op_o           (real_op_o),
      .sign_final_result_o (sign_final_result_o)
    );
`endif

     Oper_Start_In_2_W32 inst_Oper_Start_In (
      .clk                 (clk),
      .rst                 (rst),
      .load_b_i            (load_b_i),
      .intAS               (add_subt_i),
      .intDX               (Data_X_i),
      .intDY               (Data_Y_i),
      .DMP_o               (DMP_o),
      .DmP_o               (DmP_o),
      .zero_flag_o         (zero_flag_o),
      .real_op_o           (real_op_o),
      .sign_final_result_o (sign_final_result_o)
    );
  reg [W-1:0] Array_IN   [0:((2**PERIOD)-1)];
  reg [W-1:0] Array_IN_2 [0:((2**PERIOD)-1)];
  integer contador;
  integer FileSaveData;
  integer Cont_CLK;
  integer Recept;

always begin
  #(3*PERIOD/2)
  @(posedge clk) begin
    load_a_i = 1;
    load_b_i = 0;
  end
  @(posedge clk) begin
    Data_X_i = Array_IN[contador];
    Data_Y_i = Array_IN_2[contador];
    contador = contador + 1;
    load_a_i = 1;
    load_b_i = 1;
  end
  @(posedge clk) begin
    load_a_i = 0;
    load_b_i = 0;
  end
  #(3*PERIOD/2);
end

initial begin
  $readmemh("Hexadecimal_A.txt", Array_IN);
  $readmemh("Hexadecimal_B.txt", Array_IN_2);
end



  initial begin
    load_a_i = 1;
    load_b_i = 1;
    add_subt_i = 0;
    contador = 0;

    repeat(5240)@(posedge clk);
    $finish;
  end


endmodule
