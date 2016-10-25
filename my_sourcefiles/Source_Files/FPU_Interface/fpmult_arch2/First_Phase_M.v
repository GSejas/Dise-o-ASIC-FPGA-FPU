`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    11:39:13 09/04/2015
// Design Name:
// Module Name:    First_Phase_M
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
module First_Phase_M
//SINGLE PRECISION PARAMETERS
	# (parameter W = 32)
//DOUBLE PRECISION PARAMETERS
 /*# (parameter W = 64) */
	(
		input wire clk, //system clock
		input wire rst, //module reset
		input wire load, //load signal
		input wire [W-1:0] Data_MX, //Data X and Y are the operands
		input wire [W-1:0] Data_MY,
		output wire [W-1:0] Op_MX, //Both Op signals are the outputs
		output wire [W-1:0] Op_MY
	 );

//Module's Body
//Both registers could be set with the parameter signal
//to be 32 or 64 bitwidth
RegisterMult #(.W(W)) XMRegister ( //Data X input register
    .clk(clk),
    .rst(rst),
    .load(load),
    .D(Data_MX),
    .Q(Op_MX)
    );


RegisterMult #(.W(W)) YMRegister ( //Data Y input register
    .clk(clk),
    .rst(rst),
    .load(load),
    .D(Data_MY),
    .Q(Op_MY)
    );

endmodule
