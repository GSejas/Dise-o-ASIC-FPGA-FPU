`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/07/2016 03:39:07 PM
// Design Name: 
// Module Name: sgn_result
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


module sgn_result(
    input wire Add_Subt_i, //Operation bit
    input wire sgn_X_i, //Sign bit of DATA_X
    input wire sgn_Y_i, //Sign bit of DATA_Y
    input wire gtXY_i, // X > Y flag from Magnitude_comparator
    input wire eqXY_i, // X = Y flag from Magnitude_comparator
    output wire sgn_result_o 
    );
    
    assign sgn_result_o = (gtXY_i | ((Add_Subt_i | sgn_Y_i) & (~Add_Subt_i | ~sgn_Y_i))) & ( sgn_X_i | ~(eqXY_i | gtXY_i));
endmodule
