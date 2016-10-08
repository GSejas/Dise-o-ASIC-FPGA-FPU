`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:20:57 09/06/2015 
// Design Name: 
// Module Name:    FSM_Mult_Function 
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
module FSM_Mult_Function(
	//INPUTS
	input wire clk,
	input wire rst,
	input wire beg_FSM, //Be gin the multiply operation
	input wire ack_FSM, //Is used in the last state, is an aknowledge signal
	
	//ZERO PHASE EVALUATION SIGNALS
	input wire zero_flag_i,
	
	//Sgf_Operation *EVALUATION SIGNALS
	input wire Mult_shift_i,
	
	//round decoder EVALUATION SIGNALS
	input wire round_flag_i,
	
	//Adder round EV LUATION Signals
	input wire Add_Overflow_i,

	///////////////////////Load Signals/////////////////////////////////////7

	//Oper Start_in load signal
	output reg load_0_o, 

	/*Zero flag, Exp operation underflow, Sgf operation first reg, sign result reg*/
	output reg load_1_o, 

	//Exp operation result,
	output reg load_2_o, 
	
	//Exp operation Overflow, Sgf operation second reg
	output reg load_3_o, 
	
	//Adder round register
	output reg load_4_o,
	
	//Final result registers
	output reg load_5_o,

	//Barrel shifter registers
	output reg load_6_o,
	

	/////////////////////Multiplexers selector control signals////////////

	//Sixth Phase control signals
	output reg ctrl_select_a_o,
	output reg ctrl_select_b_o,
	output reg [1:0] selector_b_o,
	output reg ctrl_select_c_o,
	

	//////////////////////Module's control signals/////////////////////////
	//Exp operation control signals
	output reg exp_op_o,

	//Barrel shifter control signals
	output reg shift_value_o,

	//Internal reset signal
		output reg rst_int,
		//Ready  Signal
		output reg ready
    );


////////States///////////
//Zero Phase
parameter [3:0] start = 4'd0,//A

load_operands = 4'd1, //B) loads both operands to registers

extra64_1 = 4'd2,

add_exp = 4'd3, //C) Add both operands, evaluate underflow

subt_bias = 4'd4, //D) Subtract bias to the result, evaluate overflow, evaluate zero

mult_overf= 4'd5, //E) Evaluate overflow in Sgf multiplication for normalization case

mult_norn = 4'd6, //F) Overflow normalization, right shift significant and increment exponent

mult_no_norn = 4'd7, //G)No_normalization sgf

round_case = 4'd8, //H) Rounding evaluation. Positive= adder rounding, Negative,=Final load

adder_round =  4'd9, //I) add a 1 to the significand in case of rounding

round_norm = 4'd10, //J) Evaluate overflow in adder for normalization, Positive = normalization, same that F

final_load = 4'd11, //K) Load output registers 

ready_flag = 4'd12; //L) Ready flag, wait for ack signal



//State registers
reg [3:0] state_reg, state_next;

//State registers reset and standby logic
always @(posedge clk, posedge rst)
	if(rst)
		state_reg <= start;
	else
		state_reg <= state_next;

//Transition and Output Logic
always @*
	begin
	//STATE DEFAULT BEHAVIOR
	state_next = state_reg; //If no changes, keep the value of the register unaltered
	
	 load_0_o=0;

	/*Zero flag, Exp operation underflow, Sgf operation first reg, sign result reg*/
	 load_1_o=0;

	//Exp operation result,
	 load_2_o=0; 
	
	//Exp operation Overflow, Sgf operation second reg
	 load_3_o=0; 
	
	//Adder round register
	 load_4_o=0;
	
	//Final result registers
	 load_5_o=0;

	 load_6_o=0;
	 
	//////////////////////Multiplexers selector control signals////////////

	//Sixth Phase control signals
	 ctrl_select_a_o=0;
	 ctrl_select_b_o=0;
	 selector_b_o=2'b0;
	 ctrl_select_c_o=0;
	

	//////////////////////Module's control signals/////////////////////////
	//Exp operation control signals
	 exp_op_o=0;

	//Barrel shifter control signals
	 shift_value_o=0;

	//Internal reset signal
		 rst_int=0;
		//Ready  Signal
		 ready=0;
	
	case(state_reg)
		start:
		begin
			rst_int = 1;
			if(beg_FSM)
				state_next = load_operands; //Jump to the first state of the machine
		end
		//First Phase 
		load_operands:
		begin
			load_0_o = 1;
			state_next = extra64_1;
		end
		
		extra64_1:
		begin
		  state_next = add_exp;
        end
		
		//Zero Check
		add_exp:
		begin
			load_1_o = 1;
			load_2_o = 1;
			ctrl_select_a_o = 1;
			ctrl_select_b_o = 1;
			selector_b_o = 2'b01;
			state_next = subt_bias;
		end
		subt_bias:
		begin
			load_2_o = 1;
			load_3_o = 1;
			exp_op_o = 1;

			if(zero_flag_i)
				state_next = ready_flag;
			else
				state_next = mult_overf;

		end
		mult_overf:
		begin
			if(Mult_shift_i) begin
				ctrl_select_b_o =1;
				selector_b_o =2'b10;
				state_next = mult_norn;
			end
			else
				state_next = mult_no_norn;
		end
		//Ninth Phase
		mult_norn:
		begin
			shift_value_o =1;
			load_6_o = 1;
			load_2_o = 1;
			load_3_o = 1;
			//exp_op_o = 1;
			state_next = round_case;
		end
		mult_no_norn:
		begin
			shift_value_o =0;
			load_6_o = 1;
			state_next = round_case;
		end
		round_case:
		begin
			if(round_flag_i) begin
				ctrl_select_c_o =1;
				state_next = adder_round;
			end
			else
				state_next = final_load;
		end
		adder_round:
		begin
			load_4_o = 1;
			ctrl_select_b_o = 1;
			selector_b_o = 2'b01;
			state_next = round_norm;
		end
		round_norm:
		begin
			load_6_o = 1;
			if(Add_Overflow_i)begin
				shift_value_o =1;
				load_2_o = 1;
				load_3_o = 1;
				state_next = final_load;
			end
			else begin
				shift_value_o =0;
				state_next = final_load;
			end
		end
		
		final_load: 
		begin
			load_5_o =1;
			state_next = ready_flag;
		end
		ready_flag:
		begin
			ready = 1;
				if(ack_FSM) begin
					state_next = start;end
		end
		
		default:
		begin
			state_next =start;end
	endcase
end
				
		
endmodule
