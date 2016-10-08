`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/17/2016 05:20:59 PM
// Design Name: 
// Module Name: Priority_Codec_64
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


module Priority_Codec_64(
    input wire [54:0]  Data_Dec_i,
    output reg [5:0] Data_Bin_o
    );

always @(Data_Dec_i)
	begin
	Data_Bin_o=6'b000000;
		if(~Data_Dec_i[54]) begin Data_Bin_o = 6'b000000;//0
		end else if(~Data_Dec_i[53]) begin Data_Bin_o = 6'b000001;//1
		end else if(~Data_Dec_i[52]) begin Data_Bin_o = 6'b000010;//2
		end else if(~Data_Dec_i[51]) begin Data_Bin_o = 6'b000011;//3
		end else if(~Data_Dec_i[50]) begin Data_Bin_o = 6'b000100;//4
		end else if(~Data_Dec_i[49]) begin Data_Bin_o = 6'b000101;//5
		end else if(~Data_Dec_i[48]) begin Data_Bin_o = 6'b000110;//6
		end else if(~Data_Dec_i[47]) begin Data_Bin_o = 6'b000111;//7
		end else if(~Data_Dec_i[46]) begin Data_Bin_o = 6'b001000;//8
		end else if(~Data_Dec_i[45]) begin Data_Bin_o = 6'b001001;//9
		end else if(~Data_Dec_i[44]) begin Data_Bin_o = 6'b001010;//10
		end else if(~Data_Dec_i[43]) begin Data_Bin_o = 6'b001011;//11
		end else if(~Data_Dec_i[42]) begin Data_Bin_o = 6'b001100;//12
		end else if(~Data_Dec_i[41]) begin Data_Bin_o = 6'b001101;//13
		end else if(~Data_Dec_i[40]) begin Data_Bin_o = 6'b001110;//14
		end else if(~Data_Dec_i[39]) begin Data_Bin_o = 6'b001111;//15
		end else if(~Data_Dec_i[38]) begin Data_Bin_o = 6'b010000;//16
		end else if(~Data_Dec_i[37]) begin Data_Bin_o = 6'b010001;//17
		end else if(~Data_Dec_i[36]) begin Data_Bin_o = 6'b010010;//18
		end else if(~Data_Dec_i[35]) begin Data_Bin_o = 6'b010011;//19
		end else if(~Data_Dec_i[34]) begin Data_Bin_o = 6'b010100;//20
		end else if(~Data_Dec_i[33]) begin Data_Bin_o = 6'b010101;//21
		end else if(~Data_Dec_i[32]) begin Data_Bin_o = 6'b010110;//22
		end else if(~Data_Dec_i[31]) begin Data_Bin_o = 6'b010111;//23
		end else if(~Data_Dec_i[30]) begin Data_Bin_o = 6'b011000;//24
		end else if(~Data_Dec_i[29]) begin Data_Bin_o = 6'b010101;//25
		end else if(~Data_Dec_i[28]) begin Data_Bin_o = 6'b010110;//26
		end else if(~Data_Dec_i[27]) begin Data_Bin_o = 6'b010111;//27
		end else if(~Data_Dec_i[26]) begin Data_Bin_o = 6'b011000;//28
		end else if(~Data_Dec_i[25]) begin Data_Bin_o = 6'b011001;//29
		end else if(~Data_Dec_i[24]) begin Data_Bin_o = 6'b011010;//30
		end else if(~Data_Dec_i[23]) begin Data_Bin_o = 6'b011011;//31
		end else if(~Data_Dec_i[22]) begin Data_Bin_o = 6'b011100;//32
		end else if(~Data_Dec_i[21]) begin Data_Bin_o = 6'b011101;//33
		end else if(~Data_Dec_i[20]) begin Data_Bin_o = 6'b011110;//34
		end else if(~Data_Dec_i[19]) begin Data_Bin_o = 6'b011111;//35
		end else if(~Data_Dec_i[18]) begin Data_Bin_o = 6'b100000;//36
		end else if(~Data_Dec_i[17]) begin Data_Bin_o = 6'b100001;//37
		end else if(~Data_Dec_i[16]) begin Data_Bin_o = 6'b100010;//38
		end else if(~Data_Dec_i[15]) begin Data_Bin_o = 6'b100011;//39
		end else if(~Data_Dec_i[14]) begin Data_Bin_o = 6'b100100;//40
		end else if(~Data_Dec_i[13]) begin Data_Bin_o = 6'b100101;//41
		end else if(~Data_Dec_i[12]) begin Data_Bin_o = 6'b100110;//42
		end else if(~Data_Dec_i[11]) begin Data_Bin_o = 6'b100111;//43
		end else if(~Data_Dec_i[10]) begin Data_Bin_o = 6'b101000;//44
		end else if(~Data_Dec_i[9]) begin Data_Bin_o = 6'b101001;//45
		end else if(~Data_Dec_i[8]) begin Data_Bin_o = 6'b101010;//46
		end else if(~Data_Dec_i[7]) begin Data_Bin_o = 6'b101011;//47
		end else if(~Data_Dec_i[6]) begin Data_Bin_o = 6'b101100;//48
		end else if(~Data_Dec_i[5]) begin Data_Bin_o = 6'b101101;//49
		end else if(~Data_Dec_i[4]) begin Data_Bin_o = 6'b101110;//50
		end else if(~Data_Dec_i[3]) begin Data_Bin_o = 6'b101111;//51
		end else if(~Data_Dec_i[2]) begin Data_Bin_o = 6'b110000;//52
		end else if(~Data_Dec_i[1]) begin Data_Bin_o = 6'b110001;//53
		end else if(~Data_Dec_i[0]) begin Data_Bin_o = 6'b110010;//54
		end else begin Data_Bin_o = 6'b000000;//zero value
		end		
	end
endmodule