`timescale 1ns / 1ps

module NaN_mod_32
(
input wire [1:0] operation,
input wire [31:0] data1,
input wire [31:0] data2,
output reg NaN_flag
 ); 
 always @*
 begin
    case(operation)
        2'b00:
        begin
            if((data1 == 32'h7f800000) && (data2 == 32'h7f800000))
                NaN_flag = 1'b1;
            else if((data1 == 32'hff800000) && (data2 == 32'hff800000))
                NaN_flag = 1'b1;
            else if((data1 == 32'h7f800000) && (data2 == 32'hff800000))
				NaN_flag = 1'b1;
            else if((data1 == 32'hff800000) && (data2 == 32'h7f800000))
				NaN_flag = 1'b1;
            else
                NaN_flag = 1'b0;            
        end        
        2'b01:
        begin
            if(data1 == 32'h7f800000)
                NaN_flag = 1'b1;
            else if(data1 == 32'hff800000)
                NaN_flag = 1'b1;
            else
                NaN_flag = 1'b0;            
        end        
        2'b10:
        begin
			if((data1 == 32'h00000000) && (data2 == 32'h7f800000))
                NaN_flag = 1'b1;
            else if((data1 == 32'h00000000) && (data2 == 32'hff800000))
                NaN_flag = 1'b1;
            else if((data1 == 32'hff800000) && (data2 == 32'h00000000))
				NaN_flag = 1'b1;
            else if((data1 == 32'h7f800000) && (data2 == 32'h00000000))
				NaN_flag = 1'b1;
            else
                NaN_flag = 1'b0;
        end        
        default:
            NaN_flag = 1'b0;
    endcase
 end
endmodule
