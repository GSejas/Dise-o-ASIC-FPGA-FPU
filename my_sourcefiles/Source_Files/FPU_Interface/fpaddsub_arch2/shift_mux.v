`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 03/12/2016 06:26:54 PM
// Design Name:
// Module Name: shift_mux_array
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


module shift_mux_array
	#(parameter SWR=26, parameter LEVEL=5)
    (
    input wire [SWR-1:0] Data_i,
    input wire select_i,
    input wire bit_shift_i,
    output wire [SWR-1:0] Data_o
    );

genvar j;
localparam integer lvl = 2**(LEVEL);
localparam integer x = (SWR - 1);
generate for (j=0; j<=SWR-1 ; j=j+1) begin : MUX_ODDNORM

	localparam integer sh=(2**LEVEL)+j; //value for second mux input. It changes in exponentation by 2 for each level

	case ((lvl+j)>(x))

		1'b1: begin :BSHITMUX
		//assign mux_out = (sel) ? din_1 : din_0;
			assign Data_o[j] = (select_i) ? bit_shift_i : Data_i[j];
			
			end
			
		1'b0: begin : FSHITMUX
		
			assign Data_o[j] = (select_i) ? Data_i[lvl+j] : Data_i[j];
			
			end
		endcase
	end
endgenerate

endmodule
