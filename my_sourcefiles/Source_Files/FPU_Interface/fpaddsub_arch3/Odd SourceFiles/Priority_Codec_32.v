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

	always @(Data_Dec_i)
	begin
		if(~Data_Dec_i[25]) begin Data_Bin_o = 5'b00000;//0
		end else if(~Data_Dec_i[24]) begin Data_Bin_o = 5'b00001;//1
		end else if(~Data_Dec_i[23]) begin Data_Bin_o = 5'b00010;//2
		end else if(~Data_Dec_i[22]) begin Data_Bin_o = 5'b00011;//3
		end else if(~Data_Dec_i[21]) begin Data_Bin_o = 5'b00100;//4
		end else if(~Data_Dec_i[20]) begin Data_Bin_o = 5'b00101;//5
		end else if(~Data_Dec_i[19]) begin Data_Bin_o = 5'b00110;//6
		end else if(~Data_Dec_i[18]) begin Data_Bin_o = 5'b00111;//7
		end else if(~Data_Dec_i[17]) begin Data_Bin_o = 5'b01000;//8
		end else if(~Data_Dec_i[16]) begin Data_Bin_o = 5'b01001;//9
		end else if(~Data_Dec_i[15]) begin Data_Bin_o = 5'b01010;//10
		end else if(~Data_Dec_i[14]) begin Data_Bin_o = 5'b01011;//11
		end else if(~Data_Dec_i[13]) begin Data_Bin_o = 5'b01100;//12
		end else if(~Data_Dec_i[12]) begin Data_Bin_o = 5'b01101;//13
		end else if(~Data_Dec_i[11]) begin Data_Bin_o = 5'b01110;//14
		end else if(~Data_Dec_i[10]) begin Data_Bin_o = 5'b01111;//15
		end else if(~Data_Dec_i[9])  begin Data_Bin_o = 5'b10000;//16
		end else if(~Data_Dec_i[8])  begin Data_Bin_o = 5'b10001;//17
		end else if(~Data_Dec_i[7])  begin Data_Bin_o = 5'b10010;//18
		end else if(~Data_Dec_i[6])  begin Data_Bin_o = 5'b10011;//19
		end else if(~Data_Dec_i[5])  begin Data_Bin_o = 5'b10100;//20
		end else if(~Data_Dec_i[4])  begin Data_Bin_o = 5'b10101;//21
		end else if(~Data_Dec_i[3])  begin Data_Bin_o = 5'b10110;//22
		end else if(~Data_Dec_i[2])  begin Data_Bin_o = 5'b10111;//23
		end else if(~Data_Dec_i[1])  begin Data_Bin_o = 5'b11000;//24
		end else if(~Data_Dec_i[0])  begin Data_Bin_o = 5'b10101;//25
		end
		else Data_Bin_o = 5'b00000;//zero value
	
	end
endmodule
