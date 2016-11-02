//
// FORMAT SPECIFICATIONS
//
`define FORMAT_WORD_WIDTH  32
`define FORMAT_FRAC_WIDTH  23
`define FORMAT_EXP_WIDTH   8

//
// FPU INSTRUCTIONS
//
`define FPU_INSTR_NOP   4'b0000  
`define FPU_INSTR_ADD   4'b0001  
`define FPU_INSTR_SUB   4'b0010
`define FPU_INSTR_MUL   4'b0011
`define FPU_INSTR_DIV   4'b0100
`define FPU_INSTR_SQRT	4'b0101
`define FPU_INSTR_UI2FP	4'b0110          
`define FPU_INSTR_SI2FP 4'b0111          
`define FPU_INSTR_FP2SI 4'b1000

//
// FPU ROUNDING MODES
//									
`define ROUNDING_MODE_NEAREST_EVEN	2'b00
`define ROUNDING_MODE_TRUNCATE		2'b01
`define ROUNDING_MODE_POS_INF		2'b10
`define ROUNDING_MODE_NEG_INF		2'b11

//
// Significand register file port names
//									   
`define SRF_REG_R0			4'b0000
`define SRF_REG_R1			4'b0001
`define SRF_REG_ZERO		4'b0010
`define SRF_REG_ONE			4'b0011
`define SRF_REG_TWO			4'b0100
`define SRF_REG_ULP_ROUND	4'b0101
`define SRF_REG_BIAS		4'b0110
`define SRF_REG_FIVE		4'b0111
`define SRF_REG_SIX			4'b1000	
`define SRF_REG_NANSIG		4'b1001
`define SRF_REG_ONES		4'b1111

//
// Exponent register file port names
//									
`define ERF_REG_R0			3'b000
`define ERF_REG_R1			3'b001
`define ERF_REG_ZERO		3'b010
`define ERF_REG_ONE			3'b011
`define ERF_REG_RPP			3'b100
`define ERF_REG_I2FP		3'b101
`define ERF_REG_BIAS		3'b110
`define ERF_REG_ONES		3'b111

//
// Significand ALU opcodes
//
`define SIG_ALU_OP_NOP	4'b0000	//no operation
`define SIG_ALU_OP_MOVA	4'b0001	//move op.A
`define SIG_ALU_OP_NEGB	4'b0010	//negate op.B
`define SIG_ALU_OP_ADD	4'b0011	//add op.A and op.B
`define SIG_ALU_OP_SUB	4'b0100	//subtract op.B from op.A
`define SIG_ALU_OP_SHRA	4'b0101	//arithmetic right-shift of operand A, by "op.B" digits
`define SIG_ALU_OP_SHRL	4'b0110	//logic right-shift of op.A, by "op.B" digits
`define SIG_ALU_OP_SHLL	4'b0111	//logic left-shift of op.A, by "op.B" digits	  
`define SIG_ALU_OP_CLZ	4'b1000	//count leading zeroes of op.A

//
// Exponent ALU opcodes
//
`define EXP_ALU_OP_NOP	3'b000
`define EXP_ALU_OP_MOVA	3'b001
`define EXP_ALU_OP_NEGB	3'b010
`define EXP_ALU_OP_ADD	3'b011
`define EXP_ALU_OP_SUB	3'b100
`define EXP_ALU_OP_SHL	3'b101


//
// Mask-And-Shift unit opcodes
//							  
`define MASK_AND_SHIFT_A8C8		2'b00
`define MASK_AND_SHIFT_A8D16	2'b01
`define MASK_AND_SHIFT_B16C8	2'b10
`define MASK_AND_SHIFT_B16D16	2'b11

//
// Shift-And_extend unit opcodes
//								
`define SHIFT_16_BIT_AND_EXTEND 2'b00
`define SHIFT_0_BIT_AND_EXTEND 2'b01
`define SHIFT_TRUNC_AND_EXTEND 2'b10

