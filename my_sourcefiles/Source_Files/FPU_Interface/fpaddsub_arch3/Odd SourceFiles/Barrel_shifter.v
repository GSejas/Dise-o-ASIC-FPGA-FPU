`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/11/2016 11:27:29 AM
// Design Name: 
// Module Name: Barrel_shifter
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


module Barrel_Shifter
    #(parameter SWR=26, parameter EWR=5) //Implicit bit + Significand Width (23 bits for simple format, 52 bits for Double format) 
    //+ guard Bit +  round bit
    /*#(parameter SWR=55, parameter EWR=6)*/
    (
    input wire clk,
    input wire rst,
    input wire load_i,
    input wire [EWR-1:0] Shift_Value_i,
    input wire [SWR-1:0] Shift_Data_i,
    input wire Left_Right_i,
    input wire Bit_Shift_i,
    /////////////////////////////////////////////7
    output wire [SWR-1:0] N_mant_o
    );
    wire [SWR-1:0] Data_Reg;


    ////////////////////////////////////////////////////7

    
    Mux_Array #(.SWR(SWR),.EWR(EWR)) Mux_Array(
        .clk(clk),
        .rst(rst),
        .load_i(load_i),
        .Data_i(Shift_Data_i),
        .FSM_left_right_i(Left_Right_i),
        .Shift_Value_i(Shift_Value_i),
        .bit_shift_i(Bit_Shift_i),
        .Data_o(Data_Reg)
        );

    RegisterAdd #(.W(SWR)) Output_Reg(
        .clk(clk),
        .rst(rst),
        .load(load_i),
        .D(Data_Reg),
        .Q(N_mant_o)
        );

endmodule
