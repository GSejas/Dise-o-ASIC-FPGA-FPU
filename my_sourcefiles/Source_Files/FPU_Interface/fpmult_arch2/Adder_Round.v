`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 04/26/2016 07:00:53 AM
// Design Name:
// Module Name: Adder_Round
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


module Adder_Round
#(parameter SW=26) (
    input wire clk,
    input wire rst,
    input wire load_i,//Reg load input

    input wire [SW-1:0] Data_A_i,

    input wire [SW-1:0] Data_B_i,


/////////////////////////////////////////////////////////////

    output wire [SW-1:0] Data_Result_o,
    output wire FSM_C_o
    );

	wire [SW:0] result_A_adder;

	adder #(.W(SW)) A_operation (
        .Data_A_i(Data_A_i),
        .Data_B_i(Data_B_i),
        .Data_S_o(result_A_adder)
    );

	RegisterAdd #(.W(SW)) Add_Subt_Result(
        .clk (clk),
        .rst (rst),
        .load (load_i),
        .D (result_A_adder[SW-1:0]),
        .Q (Data_Result_o)
    );

	RegisterAdd #(.W(1)) Add_overflow_Result(
	    .clk (clk),
	    .rst (rst),
	    .load (load_i),
	    .D (result_A_adder[SW]),
	    .Q (FSM_C_o)
    );

endmodule
