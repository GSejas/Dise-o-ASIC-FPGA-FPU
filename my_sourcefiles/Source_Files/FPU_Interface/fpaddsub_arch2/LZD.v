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
//dc_script_begin
// set LIB_NAME scx3_cmos8rf_lpvt_tt_1p2v_25c.db

// set CLK_PERIOD 10
// set CLK_NAME clk
// set INPUT_DELAY_MAX 3
// #set the fastest input data arrival time to check for hold time changes to 1000pS
// set INPUT_DELAY_MIN 2
// # set the setup time requirements for the next block to 2nS
// set OUTPUT_DELAY_MAX 3
// # set the hold time requirements for the next block to 150pS
// set OUTPUT_DELAY_MIN 1
// set CLK_TRANSITION 1
// set_input_delay -max $INPUT_DELAY_MAX -clock $CLK_NAME $ALL_IN_EX_CLK_NAME
// set_input_delay -min $INPUT_DELAY_MIN -clock $CLK_NAME $ALL_IN_EX_CLK_NAME
// #Configuración del retardo en las señales de salida                -> page 5-26, 7-18
// set_output_delay -max $OUTPUT_DELAY_MAX -clock $CLK_NAME $ALL_OUT_NAME
// set_output_delay -min $OUTPUT_DELAY_MIN -clock $CLK_NAME $ALL_OUT_NAME
//set_clock_transition $CLK_TRANSITION [get_clocks $CLK_NAME]
//dc_script_end


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
			26:begin : LZD_SINGLEBLK
				Priority_Codec_32 Codec_32(
					.Data_Dec_i(Add_subt_result_i),
					.Data_Bin_o(Codec_to_Reg)
					);

				end
			55:begin : LZD_DOUBLEBLK
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
