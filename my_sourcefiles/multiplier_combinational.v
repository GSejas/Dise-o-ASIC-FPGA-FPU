`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: jorge Sequeira
// 
// Create Date: 08/27/2016 11:26:57 PM
// Design Name: 
// Module Name: multiplier_combinational
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: multiplicador normal
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module multiplier_C
# (parameter W = 3/*,level=5*/) 
    (
    input wire [W-1:0] Data_A_i, //Puerto de W
    input wire [W-1:0] Data_B_i, //Port width of W
    output wire [2*W-1:0] Data_S_o //Port width of 2W
    );
    
      assign Data_S_o = Data_A_i * Data_B_i;   
    
`ifdef PRESTO
	always $display("Instanciacion: multiplier_C de Jorge, W: %d",W);
`endif
endmodule
