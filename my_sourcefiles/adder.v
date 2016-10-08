`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/23/2016 11:31:21 AM
// Design Name: 
// Module Name: adder
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


module adder
    # (parameter W = 32) (
    input wire [W-1:0] Data_A_i,
    input wire [W-1:0] Data_B_i,
    output reg [W:0] Data_S_o
    );
    
    always @*
        Data_S_o <= Data_A_i + Data_B_i;

endmodule
