`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:29:23 08/17/2015 
// Design Name: 
// Module Name:    Multiplexer_AC 
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
