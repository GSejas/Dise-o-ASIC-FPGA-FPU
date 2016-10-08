`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/23/2016 11:31:21 AM
// Design Name: 
// Module Name: multiplier
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


module multiplier
    # (parameter W = 32/*,level=5*/) (//level=log2(W)
    input wire clk,
    input wire [W-1:0] Data_A_i,
    input wire [W-1:0] Data_B_i,
    output wire [2*W-1:0] Data_S_o
    );
    //reg [W-1:0] aint,bint;
    reg [2*W-1:0] pdt_int;// [level-1:0];
    
    assign Data_S_o=pdt_int;
    
    always@(posedge clk)
    begin
        //aint<=Data_A_i;
        //bint<=Data_B_i;
        pdt_int<= Data_A_i*Data_B_i;
        //for (i=1;i<level;i=i+1)
          //  pdt_int[i]<=pdt_int[i-1];
    end
    
endmodule
