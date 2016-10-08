`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:52:10 08/18/2015 
// Design Name: 
// Module Name:    add_sub_carry_out 
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

//This module it's different to the add_sub module synthesized
module add_sub_carry_out
	# (parameter W = 32)
	(
		input wire op_mode,
		input wire [W-1:0] Data_A,
		input wire [W-1:0] Data_B,
		output reg [W:0] Data_S 
		);

	always @*
		if(op_mode)
			Data_S <= Data_A - Data_B;
		else
			Data_S <= Data_A + Data_B;

endmodule
