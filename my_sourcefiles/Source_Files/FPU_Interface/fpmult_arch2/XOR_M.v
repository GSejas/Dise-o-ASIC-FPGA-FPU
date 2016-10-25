`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    11:27:52 09/06/2015
// Design Name:
// Module Name:    XOR_M
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
module XOR_M(
	input wire Sgn_X,
	input wire Sgn_Y,
	output wire Sgn_Info
    );

assign Sgn_Info = Sgn_X ^ Sgn_Y;

endmodule
