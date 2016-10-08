`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/26/2016 07:28:40 AM
// Design Name: 
// Module Name: LZD
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


module LZD#(parameter SWR=26, parameter EWR=5)(
	//#(parameter SWR=55, parameter EWR=6)(
    input wire clk,
    input wire rst,
    input wire load_i,
    input wire [SWR-1:0] Add_subt_result_i,

    /////////////////////////////////////////////7
    output wire [EWR-1:0] Shift_Value_o
    );


	wire [EWR-1:0] Codec_to_Reg;
	
	generate
		case (SWR)
			26:begin
				Priority_Codec_32 Codec_32(
					.Data_Dec_i(Add_subt_result_i),
					.Data_Bin_o(Codec_to_Reg)
					);
			   
				end
			55:begin
				Priority_Codec_64 Codec_64(
					.Data_Dec_i(Add_subt_result_i),
					.Data_Bin_o(Codec_to_Reg)
					);
			       
				end
			endcase
	endgenerate		
	
	RegisterAdd #(.W(EWR)) Output_Reg(
		        .clk(clk),
		        .rst(rst),
		        .load(load_i),
		        .D(Codec_to_Reg),
		        .Q(Shift_Value_o)
		        );

endmodule
