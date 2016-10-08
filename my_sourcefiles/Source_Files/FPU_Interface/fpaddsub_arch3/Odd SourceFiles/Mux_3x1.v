`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/22/2016 07:26:54 PM
// Design Name: 
// Module Name: Mux_3x1
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


module Mux_3x1

  # (parameter W = 8 )
	(

    input wire [1:0] ctrl,
    input wire [W-1:0] D0,
    input wire [W-1:0] D1,
    input wire [W-1:0] D2,
    output reg [W-1:0] S
    );

   always @(ctrl, D0, D1, D2)
   	case (ctrl)
   		2'b00: S<=D0;
   		2'b01: S<=D1;
   		2'b10: S<=D2;
   		default: S<=0;
	endcase
endmodule
