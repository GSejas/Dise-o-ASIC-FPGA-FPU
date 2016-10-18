//==================================================================================================
//  Filename      : Priority_Codec_32.v
//  Created On    : 2016-10-17 18:21:34
//  Last Modified : 2016-10-17 18:21:44
//  Revision      :
//  Author        : Jorge Sequeira Rojas
//  Company       : Instituto Tecnologico de Costa Rica
//  Email         : jsequeira@gmail.com
//
//  Description   : New LZD version
//
//
//==================================================================================================
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 03/17/2016 05:20:59 PM
// Design Name:
// Module Name: Priority_Codec_32
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


module Priority_Codec_32(
    input wire [25:0] Data_Dec_i,
    output reg [4:0] Data_Bin_o
    );
parameter SWR = 26;
	// always @(Data_Dec_i)
	// begin
	// 	if(~Data_Dec_i[25]) begin Data_Bin_o = 5'b00000;//0
	// 	end else if(~Data_Dec_i[24]) begin Data_Bin_o = 5'b00001;//1
	// 	end else if(~Data_Dec_i[23]) begin Data_Bin_o = 5'b00010;//2
	// 	end else if(~Data_Dec_i[22]) begin Data_Bin_o = 5'b00011;//3
	// 	end else if(~Data_Dec_i[21]) begin Data_Bin_o = 5'b00100;//4
	// 	end else if(~Data_Dec_i[20]) begin Data_Bin_o = 5'b00101;//5
	// 	end else if(~Data_Dec_i[19]) begin Data_Bin_o = 5'b00110;//6
	// 	end else if(~Data_Dec_i[18]) begin Data_Bin_o = 5'b00111;//7
	// 	end else if(~Data_Dec_i[17]) begin Data_Bin_o = 5'b01000;//8
	// 	end else if(~Data_Dec_i[16]) begin Data_Bin_o = 5'b01001;//9
	// 	end else if(~Data_Dec_i[15]) begin Data_Bin_o = 5'b01010;//10
	// 	end else if(~Data_Dec_i[14]) begin Data_Bin_o = 5'b01011;//11
	// 	end else if(~Data_Dec_i[13]) begin Data_Bin_o = 5'b01100;//12
	// 	end else if(~Data_Dec_i[12]) begin Data_Bin_o = 5'b01101;//13
	// 	end else if(~Data_Dec_i[11]) begin Data_Bin_o = 5'b01110;//14
	// 	end else if(~Data_Dec_i[10]) begin Data_Bin_o = 5'b01111;//15
	// 	end else if(~Data_Dec_i[9])  begin Data_Bin_o = 5'b10000;//16
	// 	end else if(~Data_Dec_i[8])  begin Data_Bin_o = 5'b10001;//17
	// 	end else if(~Data_Dec_i[7])  begin Data_Bin_o = 5'b10010;//18
	// 	end else if(~Data_Dec_i[6])  begin Data_Bin_o = 5'b10011;//19
	// 	end else if(~Data_Dec_i[5])  begin Data_Bin_o = 5'b10100;//20
	// 	end else if(~Data_Dec_i[4])  begin Data_Bin_o = 5'b10101;//21
	// 	end else if(~Data_Dec_i[3])  begin Data_Bin_o = 5'b10110;//22
	// 	end else if(~Data_Dec_i[2])  begin Data_Bin_o = 5'b10111;//23
	// 	end else if(~Data_Dec_i[1])  begin Data_Bin_o = 5'b11000;//24
	// 	end else if(~Data_Dec_i[0])  begin Data_Bin_o = 5'b10101;//25
	// 	end
	// 	else Data_Bin_o = 5'b00000;//zero value

	// end

always @(Data_Dec_i) begin
	   case (Data_Dec_i)
							{1'b1,          (SWR-1)* 1'bx} : begin Data_Bin_o = 5'd0; end
							{1'b0,   1'b1,  (SWR-2)* 1'bx} : begin Data_Bin_o = 5'd1; end
							{2*1'b0, 1'b1,  (SWR-3)* 1'bX} : begin Data_Bin_o = 5'd2; end
							{3*1'b0, 1'b1,  (SWR-4)* 1'bx} : begin Data_Bin_o = 5'd3; end
							{4*1'b0, 1'b1,  (SWR-5)* 1'bx} : begin Data_Bin_o = 5'd4; end
							{5*1'b0, 1'b1,  (SWR-6)* 1'bx} : begin Data_Bin_o = 5'd5; end
							{6*1'b0, 1'b1,  (SWR-7)* 1'bx} : begin Data_Bin_o = 5'd6; end
							{7*1'b0, 1'b1,  (SWR-8)* 1'bx} : begin Data_Bin_o = 5'd7; end
							{8*1'b0, 1'b1,  (SWR-9)* 1'bx} : begin Data_Bin_o = 5'd8; end
							{9*1'b0, 1'b1,  (SWR-10)*1'bx} : begin Data_Bin_o = 5'd9; end
							{10*1'b0, 1'b1, (SWR-11)*1'bx} : begin Data_Bin_o = 5'd10; end
							{11*1'b0, 1'b1, (SWR-12)*1'bx} : begin Data_Bin_o = 5'd11; end
							{12*1'b0, 1'b1, (SWR-13)*1'bx} : begin Data_Bin_o = 5'd12; end
							{13*1'b0, 1'b1, (SWR-14)*1'bx} : begin Data_Bin_o = 5'd13; end
							{14*1'b0, 1'b1, (SWR-15)*1'bx} : begin Data_Bin_o = 5'd14; end
							{15*1'b0, 1'b1, (SWR-16)*1'bx} : begin Data_Bin_o = 5'd15; end
							{16*1'b0, 1'b1, (SWR-17)*1'bx} : begin Data_Bin_o = 5'd16; end
							{17*1'b0, 1'b1, (SWR-18)*1'bx} : begin Data_Bin_o = 5'd17; end
							{18*1'b0, 1'b1, (SWR-19)*1'bx} : begin Data_Bin_o = 5'd18; end
							{19*1'b0, 1'b1, (SWR-20)*1'bx} : begin Data_Bin_o = 5'd19; end
							{20*1'b0, 1'b1, (SWR-21)*1'bx} : begin Data_Bin_o = 5'd20; end
							{21*1'b0, 1'b1, (SWR-22)*1'bx} : begin Data_Bin_o = 5'd21; end
							{22*1'b0, 1'b1, (SWR-23)*1'bx} : begin Data_Bin_o = 5'd22; end
							{23*1'b0, 1'b1, (SWR-24)*1'bx} : begin Data_Bin_o = 5'd23; end
							{24*1'b0, 1'b1, (SWR-25)*1'bx} : begin Data_Bin_o = 5'd24; end
							{25*1'b0, 1'b1               } : begin Data_Bin_o = 5'd25; end
							default 											 : begin Data_Bin_o = 5'd26; end
	   endcase
end
endmodule
