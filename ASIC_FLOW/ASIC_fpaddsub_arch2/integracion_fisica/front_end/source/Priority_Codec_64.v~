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
parameter SWR = 55;

`ifdef FRANCIS
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
`endif


parameter
				  case_data0  = {1'b1,{(SWR-1){1'bx}}},
					case_data1  = {1'b0, 1'b1,{(SWR-2){1'bx}}},
					case_data2  = {{2{1'b0}}, 1'b1,{(SWR-3){1'bx}}},
					case_data3  = {{3{1'b0}}, 1'b1,{(SWR-4){1'bx}}},
					case_data4  = {{4{1'b0}}, 1'b1,{(SWR-5){1'bx}}},
					case_data5  = {{5{1'b0}}, 1'b1,{(SWR-6){1'bx}}},
					case_data6  = {{6{1'b0}}, 1'b1,{(SWR-7){1'bx}}},
					case_data7  = {{7{1'b0}}, 1'b1,{(SWR-8){1'bx}}},
					case_data8  = {{8{1'b0}}, 1'b1,{(SWR-9){1'bx}}},
					case_data9  = {{9{1'b0}}, 1'b1,{(SWR-10){1'bx}}},
					case_data10 = {{10{1'b0}}, 1'b1,{(SWR-11){1'bx}}},
					case_data11 = {{11{1'b0}}, 1'b1,{(SWR-12){1'bx}}},
					case_data12 = {{12{1'b0}}, 1'b1,{(SWR-13){1'bx}}},
					case_data13 = {{13{1'b0}}, 1'b1,{(SWR-14){1'bx}}},
					case_data14 = {{14{1'b0}}, 1'b1,{(SWR-15){1'bx}}},
					case_data15 = {{15{1'b0}}, 1'b1,{(SWR-16){1'bx}}},
					case_data16 = {{16{1'b0}}, 1'b1,{(SWR-17){1'bx}}},
					case_data17 = {{17{1'b0}}, 1'b1,{(SWR-18){1'bx}}},
					case_data18 = {{18{1'b0}}, 1'b1,{(SWR-19){1'bx}}},
					case_data19 = {{19{1'b0}}, 1'b1,{(SWR-20){1'bx}}},
					case_data20 = {{20{1'b0}}, 1'b1,{(SWR-21){1'bx}}},
					case_data21 = {{21{1'b0}}, 1'b1,{(SWR-22){1'bx}}},
					case_data22 = {{22{1'b0}}, 1'b1,{(SWR-23){1'bx}}},
					case_data23 = {{23{1'b0}}, 1'b1,{(SWR-24){1'bx}}},
					case_data24 = {{24{1'b0}}, 1'b1,{(SWR-25){1'bx}}},
					case_data25 = {{25{1'b0}}, 1'b1,{(SWR-26){1'bx}}},
					case_data26 = {{26{1'b0}}, 1'b1,{(SWR-27){1'bx}}},
					case_data27 = {{27{1'b0}}, 1'b1,{(SWR-28){1'bx}}},
					case_data28 = {{28{1'b0}}, 1'b1,{(SWR-29){1'bx}}},
					case_data29 = {{29{1'b0}}, 1'b1,{(SWR-30){1'bx}}},
					case_data30 = {{30{1'b0}}, 1'b1,{(SWR-31){1'bx}}},
					case_data31 = {{31{1'b0}}, 1'b1,{(SWR-32){1'bx}}},
					case_data32 = {{32{1'b0}}, 1'b1,{(SWR-33){1'bx}}},
					case_data33 = {{33{1'b0}}, 1'b1,{(SWR-34){1'bx}}},
					case_data34 = {{34{1'b0}}, 1'b1,{(SWR-35){1'bx}}},
					case_data35 = {{35{1'b0}}, 1'b1,{(SWR-36){1'bx}}},
					case_data36 = {{36{1'b0}}, 1'b1,{(SWR-37){1'bx}}},
					case_data37 = {{37{1'b0}}, 1'b1,{(SWR-38){1'bx}}},
					case_data38 = {{38{1'b0}}, 1'b1,{(SWR-39){1'bx}}},
					case_data39 = {{39{1'b0}}, 1'b1,{(SWR-40){1'bx}}},
					case_data40 = {{40{1'b0}}, 1'b1,{(SWR-41){1'bx}}},
					case_data41 = {{41{1'b0}}, 1'b1,{(SWR-42){1'bx}}},
					case_data42 = {{42{1'b0}}, 1'b1,{(SWR-43){1'bx}}},
					case_data43 = {{43{1'b0}}, 1'b1,{(SWR-44){1'bx}}},
					case_data44 = {{44{1'b0}}, 1'b1,{(SWR-45){1'bx}}},
					case_data45 = {{45{1'b0}}, 1'b1,{(SWR-46){1'bx}}},
					case_data46 = {{46{1'b0}}, 1'b1,{(SWR-47){1'bx}}},
					case_data47 = {{47{1'b0}}, 1'b1,{(SWR-48){1'bx}}},
					case_data48 = {{48{1'b0}}, 1'b1,{(SWR-49){1'bx}}},
					case_data49 = {{49{1'b0}}, 1'b1,{(SWR-50){1'bx}}},
					case_data50 = {{50{1'b0}}, 1'b1,{(SWR-51){1'bx}}},
					case_data51 = {{51{1'b0}}, 1'b1,{(SWR-52){1'bx}}},
					case_data52 = {{52{1'b0}}, 1'b1,{(SWR-53){1'bx}}},
					case_data53 = {{53{1'b0}}, 1'b1,{(SWR-54){1'bx}}},
					case_data54 = {{54{1'b0}}, 1'b1,{(SWR-55){1'bx}}};


`ifndef FRANCIS

always @(Data_Dec_i) begin
	   casex (Data_Dec_i)
				case_data0 : begin Data_Bin_o = 6'd0; end
				case_data1 : begin Data_Bin_o = 6'd1; end
				case_data2 : begin Data_Bin_o = 6'd2; end
				case_data3 : begin Data_Bin_o = 6'd3; end
				case_data4 : begin Data_Bin_o = 6'd4; end
				case_data5 : begin Data_Bin_o = 6'd5; end
				case_data6 : begin Data_Bin_o = 6'd6; end
				case_data7 : begin Data_Bin_o = 6'd7; end
				case_data8 : begin Data_Bin_o = 6'd8; end
				case_data9 : begin Data_Bin_o = 6'd9; end
				case_data10 : begin Data_Bin_o = 6'd10; end
				case_data11 : begin Data_Bin_o = 6'd11; end
				case_data12 : begin Data_Bin_o = 6'd12; end
				case_data13 : begin Data_Bin_o = 6'd13; end
				case_data14 : begin Data_Bin_o = 6'd14; end
				case_data15 : begin Data_Bin_o = 6'd15; end
				case_data16 : begin Data_Bin_o = 6'd16; end
				case_data17 : begin Data_Bin_o = 6'd17; end
				case_data18 : begin Data_Bin_o = 6'd18; end
				case_data19 : begin Data_Bin_o = 6'd19; end
				case_data20 : begin Data_Bin_o = 6'd20; end
				case_data21 : begin Data_Bin_o = 6'd21; end
				case_data22 : begin Data_Bin_o = 6'd22; end
				case_data23 : begin Data_Bin_o = 6'd23; end
				case_data24 : begin Data_Bin_o = 6'd24; end
				case_data25 : begin Data_Bin_o = 6'd25; end
				case_data26 : begin Data_Bin_o = 6'd26; end
				case_data27 : begin Data_Bin_o = 6'd27; end
				case_data28 : begin Data_Bin_o = 6'd28; end
				case_data29 : begin Data_Bin_o = 6'd29; end
				case_data30 : begin Data_Bin_o = 6'd30; end
				case_data31 : begin Data_Bin_o = 6'd31; end
				case_data32 : begin Data_Bin_o = 6'd32; end
				case_data33 : begin Data_Bin_o = 6'd33; end
				case_data34 : begin Data_Bin_o = 6'd34; end
				case_data35 : begin Data_Bin_o = 6'd35; end
				case_data36 : begin Data_Bin_o = 6'd36; end
				case_data37 : begin Data_Bin_o = 6'd37; end
				case_data38 : begin Data_Bin_o = 6'd38; end
				case_data39 : begin Data_Bin_o = 6'd39; end
				case_data40 : begin Data_Bin_o = 6'd40; end
				case_data41 : begin Data_Bin_o = 6'd41; end
				case_data42 : begin Data_Bin_o = 6'd42; end
				case_data43 : begin Data_Bin_o = 6'd43; end
				case_data44 : begin Data_Bin_o = 6'd44; end
				case_data45 : begin Data_Bin_o = 6'd45; end
				case_data46 : begin Data_Bin_o = 6'd46; end
				case_data47 : begin Data_Bin_o = 6'd47; end
				case_data48 : begin Data_Bin_o = 6'd48; end
				case_data49 : begin Data_Bin_o = 6'd49; end
				case_data50 : begin Data_Bin_o = 6'd50; end
				case_data51 : begin Data_Bin_o = 6'd51; end
				case_data52 : begin Data_Bin_o = 6'd52; end
				case_data53 : begin Data_Bin_o = 6'd53; end
				case_data54 : begin Data_Bin_o = 6'd54; end
				default    : begin Data_Bin_o  = 6'd55; end
	   endcase
end
`endif
endmodule
