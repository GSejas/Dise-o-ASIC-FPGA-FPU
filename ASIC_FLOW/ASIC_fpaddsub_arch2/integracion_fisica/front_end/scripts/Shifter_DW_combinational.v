`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 03/12/2016 06:18:20 PM
// Design Name:
// Module Name: Mux_Array
// Project Name:
// Target Devices:
// Tool Versions:
// Description:
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////

// synopsys dc_script_begin
//
// synopsys dc_script_end

module Multiplexer_AC
  # (parameter W = 32)
  (
    input wire ctrl,
    input wire [W-1:0] D0,
    input wire [W-1:0] D1,
    output reg [W-1:0] S

    );


   always @(ctrl, D0, D1)
      case (ctrl)
         1'b0: S <= D0;
         1'b1: S <= D1;
      endcase

endmodule


module Rotate_Mux_Array
    #(parameter SWR=26)
    (
    input wire [SWR-1:0] Data_i,
    input wire select_i,
    output wire [SWR-1:0] Data_o
    );

  genvar j;//Create a variable for the loop FOR
  generate for (j=0; j <= SWR-1; j=j+1) begin : MUX_ARRAY

    case (j)

      SWR-1-j:begin : MUX_ARRAY11
        assign Data_o[j]=Data_i[SWR-1-j];
        end

      default:begin : MUX_ARRAY12
      Multiplexer_AC #(.W(1)) rotate_mux(
            .ctrl(select_i),
            .D0 (Data_i[j]),
            .D1 (Data_i[SWR-1-j]),
            .S (Data_o[j])
          );
        end
      endcase
    end
  endgenerate

endmodule


module DW_rbsh_inst #(parameter SWR = 8, parameter EWR = 3) ( Data_i, Shift_Value_i, inst_SH_TC, Data_o );
//Barrel Shifter with Preferred Right Direction

  input [SWR-1 : 0] Data_i;
  input [EWR-1 : 0] Shift_Value_i;
  input inst_SH_TC;
  output [SWR-1 : 0] Data_o;

      // Instance of DW_rbsh
      DW_rbsh #(SWR, EWR) U1 (
        .A(Data_i),
        .SH(Shift_Value_i),
        .SH_TC(inst_SH_TC),
        .B(Data_o) );

endmodule




module Mux_Array_DW
    #(parameter SWR=26, parameter EWR=5)
    (
    input wire clk,
    input wire rst,
    input wire [SWR-1:0] Data_i,
    input wire FSM_left_right_i,
    input wire [EWR-1:0] Shift_Value_i,
    input wire bit_shift_i,
    output wire [SWR-1:0] Data_o
    );
////ge
wire [SWR:0] Data_array[EWR+1:0];
assign Data_array [0] = {Data_i, bit_shift_i};
//////////////////7
genvar k;//Level
///////////////////77777
Rotate_Mux_Array #(.SWR(SWR+1)) first_rotate(
	.Data_i(Data_array [0] ),
	.select_i(FSM_left_right_i),
	.Data_o(Data_array [1][SWR:0])
	);

  DW_rbsh_inst #(
      .SWR(SWR+1),
      .EWR(EWR)
    ) inst_DW_rbsh_inst (
      .Data_i        (Data_array [2][SWR:0]),
      .Shift_Value_i (Shift_Value_i),
      .inst_SH_TC    (FSM_left_right_i),
      .Data_o        (Data_array [3][SWR:0])
    );

Rotate_Mux_Array #(.SWR(SWR+1))last_rotate(
	.Data_i(Data_array [4][SWR:0]),
	.select_i(FSM_left_right_i),
	.Data_o(Data_o)
	);



endmodule
