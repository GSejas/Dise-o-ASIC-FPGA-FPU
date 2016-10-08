`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:29:25 08/20/2015 
// Design Name: 
// Module Name:    Comparator_Less 
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
module Comparator_Less
	# (parameter W = 8)
	(
		input wire [W-1:0] Data_A,
		input wire [W-1:0] Data_B,
		output wire less
	 );

assign less = (Data_A < Data_B) ? 1'b1 : 1'b0;

endmodule
