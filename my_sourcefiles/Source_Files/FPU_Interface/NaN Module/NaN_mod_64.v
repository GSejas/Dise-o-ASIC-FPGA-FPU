`timescale 1ns / 1ps

module NaN_mod_64
(
input wire [1:0] operation,
input wire [63:0] data1,
input wire [63:0] data2,
output reg NaN_flag
 ); 
 always @*
 begin
    case(operation)
        2'b00:
        begin
            if((data1 == 64'h7ff0000000000000) && (data2 == 64'h7ff0000000000000))
                NaN_flag = 1'b1;
            else if((data1 == 64'hfff0000000000000) && (data2 == 64'hfff0000000000000))
                NaN_flag = 1'b1;
            else if((data1 == 64'h7ff0000000000000) && (data2 == 64'hfff0000000000000))
				NaN_flag = 1'b1;
            else if((data1 == 64'hfff0000000000000) && (data2 == 64'h7ff0000000000000))
				NaN_flag = 1'b1;
            else
                NaN_flag = 1'b0;            
        end        
        2'b01:
        begin
            if(data1 == 64'h7ff0000000000000)
                NaN_flag = 1'b1;
            else if(data1 == 64'hfff0000000000000)
                NaN_flag = 1'b1;
            else
                NaN_flag = 1'b0;            
        end        
        2'b10:
        begin
			if((data1 == 64'h0000000000000000) && (data2 == 64'h7ff0000000000000))
                NaN_flag = 1'b1;
            else if((data1 == 64'h0000000000000000) && (data2 == 64'hfff0000000000000))
                NaN_flag = 1'b1;
            else if((data1 == 64'hfff0000000000000) && (data2 == 64'h0000000000000000))
				NaN_flag = 1'b1;
            else if((data1 == 64'h7ff0000000000000) && (data2 == 64'h0000000000000000))
				NaN_flag = 1'b1;
            else
                NaN_flag = 1'b0;
        end        
        default:
            NaN_flag = 1'b0;
    endcase
 end
 endmodule
