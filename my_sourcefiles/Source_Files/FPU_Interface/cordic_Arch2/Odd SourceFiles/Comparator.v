`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/07/2016 04:31:20 PM
// Design Name: 
// Module Name: Comparator
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


module Comparator
    # (parameter W = 8) //Ignore this value, just for reference on the instantiation
    (
    input wire [W-1:0] Data_X_i,
    input wire [W-1:0] Data_Y_i,
    output wire gtXY_o,
    output wire eqXY_o
    );
    
    assign gtXY_o = (Data_X_i > Data_Y_i) ? 1'b1 : 1'b0;
    assign eqXY_o = (Data_X_i == Data_Y_i) ? 1'b1 : 1'b0;
    
endmodule
