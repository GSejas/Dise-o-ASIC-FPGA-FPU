`timescale 1ns/1ps

`include "global.v"

module SVDUnit(operand_in, sign_out, isZero_out, isInf_out, isNan_out, isDenorm_out, operand_out);
// I/O PORTS
	input [`FORMAT_WORD_WIDTH-1:0] operand_in;  
	output reg sign_out, isZero_out, isInf_out, isNan_out, isDenorm_out;	
	output reg [32:0] operand_out; //operand with leading significand bit included
	
//INTERNAL REGISTERS
	reg sign;
	reg [`FORMAT_EXP_WIDTH-1:0] exp;
	reg [`FORMAT_FRAC_WIDTH-1:0] frac;
	
	reg expIsMax, expIsNonZero, fracIsNonZero;
	
	always @(operand_in) begin
      	//decompose input
		sign = operand_in[`FORMAT_WORD_WIDTH-1]; //[31]
		exp   = operand_in[(`FORMAT_WORD_WIDTH-2):(`FORMAT_WORD_WIDTH-`FORMAT_EXP_WIDTH-1)]; // [30:23]
		frac  = operand_in[(`FORMAT_FRAC_WIDTH-1):0]; // [22:0]
            
     	// &-reduction / |-reduction
		expIsMax = &(exp); 
     	expIsNonZero = |(exp);
     	fracIsNonZero = |(frac); 
      	
		//generate output
		sign_out      = sign;
		isZero_out    = ~expIsMax & ~expIsNonZero & ~fracIsNonZero;
		isInf_out     = expIsMax & (~fracIsNonZero);
		isNan_out     = expIsMax & fracIsNonZero;
		isDenorm_out  = ~expIsMax & ~expIsNonZero & fracIsNonZero;
		operand_out = (isDenorm_out) ? {sign, exp, 1'b0, frac} : {sign, exp, 1'b1, frac};
  end  
endmodule 
