`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/18/2016 03:28:31 PM
// Design Name: 
// Module Name: Round_Sgf_Dec
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dep encies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Round_Sgf_Dec(
   
    input wire [1:0] Data_i,
    input wire [1:0] Round_Type_i,
    input wire Sign_Result_i,
    output reg Round_Flag_o
    );
    
    always @*
    	case ({Sign_Result_i,Round_Type_i,Data_i})
    	//Round type=00; Towards zero / No round
    	//Round type=01; Towards - infinity
    	//Round type=10; Towards + infinity


    	//Op=0;Round type=00

    	/*5'b00000: Round_Flag_o <=0;  
    	5'b00001: Round_Flag_o <=0;  
    	5'b00010: Round_Flag_o <=0;  
    	5'b00011: Round_Flag_o <=0;*/

		//Op=1;Round type=00

    	/*5'b10000: Round_Flag_o <=0;  
    	5'b10001: Round_Flag_o <=0;  
    	5'b10010: Round_Flag_o <=0;  
    	5'b10011: Round_Flag_o <=0;  */

    	//Op=0;Round type=01

    	/*5'b00100: Round_Flag_o <=0;  
    	5'b00101: Round_Flag_o <=0;  
    	5'b00110: Round_Flag_o <=0;  
    	5'b00111: Round_Flag_o <=0;  */

    	//Op=1;Round type=01

    	//5'b10100: Round_Flag_o <=0;  
    	5'b10101: Round_Flag_o <=1;  
    	5'b10110: Round_Flag_o <=1;  
    	5'b10111: Round_Flag_o <=1;  

    	//Op=0;Round type=10

    	//5'b01000: Round_Flag_o <=0;  
    	5'b01001: Round_Flag_o <=1;  
    	5'b01010: Round_Flag_o <=1;  
    	5'b01011: Round_Flag_o <=1;  


    	//Op=1;Round type=10

    	/*5'b11000: Round_Flag_o <=0;  
    	5'b11001: Round_Flag_o <=0;  
    	5'b11010: Round_Flag_o <=0;  
    	5'b11011: Round_Flag_o <=0;  */

    	default: Round_Flag_o <=0;

    	endcase

endmodule
