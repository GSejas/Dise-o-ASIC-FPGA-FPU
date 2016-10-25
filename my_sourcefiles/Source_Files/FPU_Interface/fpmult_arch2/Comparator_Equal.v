`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    22:51:28 08/18/2015
// Design Name:
// Module Name:    Comparator_Equal
// Project Name:
// Target Devices:
// Tool versions:
// Description:
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////

//This comparator is exclusive to comparate the sign bits (1 Bit width) of the operands,
//the result is useful to take decisions about add or subtract significands
//in the third phase of execution

module Comparator_Equal

//It needs to be adjustable because it's used in two modules,
//but this parameter is not a function of the width of the format
	# (parameter S = 1)
	(
	input wire [S-1:0] Data_A,
	input wire [S-1:0] Data_B,
	output wire equal_sgn
    );

assign equal_sgn = (Data_A == Data_B) ? 1'b1 : 1'b0;
//The result is 1 if the signs are equal otherwise is 0.

endmodule
