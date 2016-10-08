`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:16:07 08/17/2015 
// Design Name: 
// Module Name:    Greater_Comparator 
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
module Greater_Comparator
	# (parameter W = 8)
	(
		input wire [W-1:0] Data_A, //input signal
		input wire [W-1:0] Data_B, //input signal
		output wire gthan //output signal, indicates if the input A is greater than input B
    );

	assign gthan = (Data_A > Data_B) ? 1'b1 : 1'b0; //The output value is "1" if A > B otherwise B >A


endmodule
