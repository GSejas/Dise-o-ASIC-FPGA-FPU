`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/11/2016 02:09:05 PM
// Design Name: 
// Module Name: Rotate_Mux_Array
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


module Rotate_Mux_Array
    #(parameter SWR=26)
    (
    input wire [SWR-1:0] Data_i,
    input wire select_i,
    output wire [SWR-1:0] Data_o
    );

genvar j;//Create a variable for the loop FOR
generate for (j=0; j <= SWR-1; j=j+1) begin // generate enough Multiplexers modules for each bit

	case (j)

		SWR-1-j:begin
			assign Data_o[j]=Data_i[SWR-1-j];
			end

		default:begin
		Multiplexer_AC #(.W(1)) rotate_mux(
		    .ctrl(select_i),
		    .D0 (Data_i[j]),
		    .D1 (Data_i[SWR-1-j]),
		    .S (Data_o[j])
		    );
			end
		endcase
	end
endgenerate

endmodule
