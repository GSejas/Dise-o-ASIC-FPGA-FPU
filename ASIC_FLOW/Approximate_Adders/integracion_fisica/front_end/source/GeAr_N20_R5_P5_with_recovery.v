`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    
// Design Name: 
// Module Name:    GeAr_N20_R5_P5_with_recovery 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

module GeAr_N20_R5_P5_with_recovery(
	input 		       clk,
    input  		[19:0] in1,
    input  		[19:0] in2,
    output reg  [20:0] res,
	output  		   if_error_delayed,
	output reg		   co1,
	output reg		   co2,
	output reg		   co3
    );

reg if_error_delayed_1, if_error_delayed_2;
wire cp2,cp3,if_error,if_error_1,if_error_2;
wire p5,p6,p7,p8,p9,p5p6,p7p8,p7p8p9;
wire p10,p11,p12,p13,p14,p10p11,p12p13,p12p13p14;
reg [9:0] sum1,sum2,sum3;
wire [9:0] in1c,in2c,in1cc,in2cc;

or  or_1 (p5,in1[5],in2[5]);
or  or_2 (p6,in1[6],in2[6]);
or  or_3 (p7,in1[7],in2[7]);
or  or_4 (p8,in1[8],in2[8]);
or  or_5 (p9,in1[9],in2[9]);
and and_1(p5p6,p5,p6);
and and_2(p7p8,p7,p8);
and and_3(p7p8p9,p7p8,p9);
and and_4(cp2,p5p6,p7p8p9); 
and and_5(if_error_1,cp2,co1);

always @ (posedge clk)
begin
	if_error_delayed_1 <= if_error_1;
end

or  or_6 (p10,in1[10],in2[10]);
or  or_7 (p11,in1[11],in2[11]);
or  or_8 (p12,in1[12],in2[12]);
or  or_9 (p13,in1[13],in2[13]);
or  or_10 (p14,in1[14],in2[14]);
and and_6(p10p11,p10,p11);
and and_7(p12p13,p12,p13);
and and_8(p12p13p14,p12p13,p14);
and and_9(cp3,p10p11,p12p13p14); 
and and_10(if_error_2,cp3,co2);

always @ (posedge clk)
begin
	if_error_delayed_2 <= if_error_2;
end	

or  or_11 (if_error_delayed,if_error_delayed_1,if_error_delayed_2);

assign in1c[9:0]  = {in1[14:6],if_error_delayed_1?1'b1:in1[5]};
assign in2c[9:0]  = {in2[14:6],if_error_delayed_1?1'b1:in2[5]};

assign in1cc[9:0] = {in1[19:11],if_error_delayed_2?1'b1:in1[10]};
assign in2cc[9:0] = {in2[19:11],if_error_delayed_2?1'b1:in2[10]};

always @ (*)
begin
	{co1,sum1[9:0]} 	= in1[ 9:0] + in2[ 9:0];
	{co2,sum2[9:0]} 	= in1c[9:0] + in2c[9:0];
	{co3,sum3[9:0]} 	= in1cc[9:0] + in2cc[9:0];
	res[20:0] 			= {co3,sum3[9:5],sum2[9:5],sum1[9:0]};
end

endmodule
