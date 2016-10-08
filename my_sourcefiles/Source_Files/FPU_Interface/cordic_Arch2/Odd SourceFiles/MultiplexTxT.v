`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/07/2016 04:58:27 PM
// Design Name: 
// Module Name: MultiplexTxT
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


module MultiplexTxT
    # (parameter W = 8) //Ignore this value, just for reference on the instantiation
    (
    input wire select,
    input wire [W-1:0] D0_i,
    input wire [W-1:0] D1_i,
    output reg [W-1:0] S0_o,
    output reg [W-1:0] S1_o
    );
    
    always @(select, D0_i, D1_i)
        case(select) 
       1'b1: begin
            S0_o <= D0_i;
            S1_o <= D1_i;
        end
       
       1'b0: begin
            S0_o <= D1_i;
            S1_o <= D0_i;
        end
        endcase
endmodule
