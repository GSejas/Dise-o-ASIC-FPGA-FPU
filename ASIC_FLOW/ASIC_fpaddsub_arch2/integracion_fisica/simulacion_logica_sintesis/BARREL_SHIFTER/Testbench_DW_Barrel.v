`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/13/2016 05:51:29 PM
// Design Name: 
// Module Name: Testbench_Barrel_Shifter
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


module Testbench_Barrel_Shifter ();
parameter PERIOD = 10;
parameter EWR=3;
parameter SWR=8;
//inputs

    reg clk;
    reg rst;
    reg load_i;
    reg [EWR-1:0] Shift_Value_i;
    reg [SWR-1:0] Shift_Data_i;
    reg Left_Right_i;
    reg Bit_Shift_i;
    ///////////////////OUTPUT//////////////////////////7
    wire [SWR-1:0] N_mant_o;

    DW_rbsh_inst uut(
        .Data_i(Shift_Data_i),
        .Shift_Value_i(Shift_Value_i),
        .inst_SH_TC(Left_Right_i),
        .Data_o(N_mant_o)
    );
    
    integer Contador_shiftvalue = 0;
    
   always begin
             
             #(8*PERIOD/2) Contador_shiftvalue = Contador_shiftvalue + 1;
             Shift_Value_i = Contador_shiftvalue;
              Left_Right_i = ~Left_Right_i;
             #(8*PERIOD/2);
             end


     always @ (N_mant_o )
        begin
            
            $monitor($time,"REA Salida = %b Entrada = %b Numero de Corrimiento: %d",N_mant_o,Shift_Data_i, Shift_Value_i);
            $display($time,"TEO Salida = %b Entrada = %b Numero de Corrimiento: %d",(Shift_Data_i>>Shift_Value_i),Shift_Data_i,Shift_Value_i);
        end


    initial begin
            // Initialize Input
            rst = 1;
            clk = 0;
            load_i = 0;
            Shift_Value_i = 0;
            Shift_Data_i = $random;
            Left_Right_i = 0;
            Bit_Shift_i = 0;

            #40 rst = 0;
            load_i = 1;
            end
      
            
            
    initial begin
    #(PERIOD * 1024);
    $finish;
    end
            
    initial begin
                  clk = 1'b0;
                  #(PERIOD/2);
                  forever
                     #(PERIOD/2) clk = ~clk;
           end

endmodule
