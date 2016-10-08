//==================================================================================================
//  Filename      : FSM_input_enable.v
//  Created On    : 2016-09-21 00:26:00
//  Last Modified : 2016-09-25 21:37:40
//  Revision      :
//  Author        : Jorge Sequeira Rojas
//  Company       : Instituto Tecnologico de Costa Rica
//  Email         : jsequeira@gmail.com
//
//  Description   : FSM controlling the initialization and input of the operands and the
//		desired operation
//
//==================================================================================================

`timescale 1ns / 1ps



module FSM_INPUT_ENABLE(
	//INPUTS
	input wire clk,
	input wire rst,
	input wire init_OPERATION,

	output reg enable_input_internal,
	//output enable for the first stage of the pipeline
	output wire enable_Pipeline_input,
	output reg enable_shift_reg

    );


////////States///////////
//Zero Phase
parameter [3:0] State0 = 3'd0,

	State1 = 3'd1,

	State2 = 3'd2,

	State3 = 3'd3,

	State4 = 3'd4,

	State5= 3'd5,

	State6 = 3'd6,

	State7 = 3'd7;


//State registers
reg [2:0] state_reg, state_next;

//State registers reset and standby logic
always @(posedge clk, posedge rst)
	if(rst)
		state_reg <= State0;
	else
		state_reg <= state_next;

//Transition and Output Logic
always @*
	begin
			//DEFAULT INITIAL VALUES
	//STATE DEFAULT BEHAVIOR
	state_next = state_reg; //If no changes, keep the value of the register unaltered

	enable_input_internal=1; //It is internal because its an intermediary value
	enable_shift_reg = 0;
	case(state_reg)

		State0:
			begin
				//OUTPUT SIGNAL
				enable_input_internal=1;
				enable_shift_reg = 0;
				//NEXT STATE
				if(init_OPERATION)
					state_next = State1; //JUMP TO NEXT STATE
				else begin
					state_next = State0; //STAY
				end

			end

		State1:
			begin
				//OUTPUT SIGNAL
				enable_input_internal=1;
				enable_shift_reg = 1;
				//NEXT STATE
				state_next = State2;
			end

		State2:
			begin
				//OUTPUT SIGNAL
				enable_input_internal=1;
				enable_shift_reg = 1;
				//NEXT STATE
				state_next = State3;
			end

		State3:
			begin
				//OUTPUT SIGNAL
				enable_input_internal=0;
				enable_shift_reg = 1;
				//NEXT STATE
				state_next = State4;
			end

		State4:
			begin
				//OUTPUT SIGNAL
				enable_input_internal=0;
				enable_shift_reg = 1;
				//NEXT STATE
				state_next = State5;
			end

		State5:
			begin
				//OUTPUT SIGNAL
				enable_input_internal=0;
				enable_shift_reg = 1;
				//NEXT STATE
				state_next = State0;
			end

		// State6:
		// 	begin
		// 		//OUTPUT SIGNAL
		// 		enable_input_internal=0;
		// 		enable_shift_reg = 1;
		// 		//NEXT STATE
		// 		state_next = State7;
		// 	end

		// State7:
		// 	begin
		// 		//OUTPUT SIGNAL
		// 		enable_input_internal=0;
		// 		enable_shift_reg = 1;
		// 		//NEXT STATE
		// 		state_next = State0;
		//	end
		default:
			begin
				state_next =State0;

			end
	endcase
end


assign  enable_Pipeline_input = enable_input_internal & init_OPERATION;

endmodule
