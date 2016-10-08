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


module Mux_Array
    #(parameter SWR=26, parameter EWR=5)
    (
    input wire clk,
    input wire rst,
    input wire load_i,
    input wire [SWR-1:0] Data_i,
    input wire FSM_left_right_i,
    input wire [EWR-1:0] Shift_Value_i,
    input wire bit_shift_i,
    output wire [SWR-1:0] Data_o
    );
////
wire [SWR-1:0] Data_array[EWR+1:0];

//////////////////7
genvar k;//Level
///////////////////77777
Rotate_Mux_Array #(.SWR(SWR)) first_rotate(
	.Data_i(Data_i),
	.select_i(FSM_left_right_i),
	.Data_o(Data_array [0][SWR-1:0])
	);
generate for (k=0; k < 3; k=k+1) begin
	shift_mux_array #(.SWR(SWR), .LEVEL(k)) shift_mux_array(
		.Data_i(Data_array[k]),
		.select_i(Shift_Value_i[k]),
		.bit_shift_i(bit_shift_i),
		.Data_o(Data_array[k+1])
		);
	end
endgenerate

RegisterAdd #(.W(SWR)) Mid_Reg(
        .clk(clk),
        .rst(rst),
        .load(1'b1),
        .D(Data_array[3]),
        .Q(Data_array[4])
        );

generate for (k=3; k < EWR; k=k+1) begin
	shift_mux_array #(.SWR(SWR), .LEVEL(k)) shift_mux_array(
		.Data_i(Data_array[k+1]),
		.select_i(Shift_Value_i[k]),
		.bit_shift_i(bit_shift_i),
		.Data_o(Data_array[k+2])
		);
	end
endgenerate

Rotate_Mux_Array #(.SWR(SWR)) last_rotate(
	.Data_i(Data_array[EWR+1]),
	.select_i(FSM_left_right_i),
	.Data_o(Data_o)
	);
	

	
endmodule
