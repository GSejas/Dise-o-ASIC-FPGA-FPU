`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:10:47 08/17/2015 
// Design Name: 
// Module Name:    Register 
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
module RegisterAdd
	# (parameter W = 16)
	(
		input wire clk, //system clock
		input wire rst, //system reset
		input wire load, //load signal
		input wire [W-1:0] D, //input signal
		output reg [W-1:0] Q //output signal
    );

	always @(posedge clk, posedge rst)
		if(rst)
			Q <= 0;
		else if(load)
			Q <= D;
		else
			Q <= Q;

endmodule
