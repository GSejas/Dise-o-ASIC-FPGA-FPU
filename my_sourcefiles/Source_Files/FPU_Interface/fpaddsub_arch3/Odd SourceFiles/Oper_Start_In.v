`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/10/2016 11:52:43 AM
// Design Name: 
// Module Name: Oper_Start_In
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


module Oper_Start_In


	# (parameter W = 32 ) // This parameter could be adjust based
	//on the desire precision format
	//W = 64 indicates the double precision format
	//W = 32 indicates the single precision format
	(
        input wire clk, //system clock
		input wire rst, //reset of the module
		input wire load_a_i,//The ctrl_x signals are used to load certain registers within the module
		input wire load_b_i,
		input wire add_subt_i, //This signal selects if the operations is an add o subtract operation
		input wire [W-1:0] Data_X_i, //Data_X and Data_y are both operands of the module
		//they are expected in ieee 754 format
		input wire [W-1:0] Data_Y_i,
		
		//////////////////////////////////////////////////////////////////////
		output wire [W-2:0] DMP_o, //Because the algorithm these outputs contain the largest and smallest operand
        output wire [W-2:0] DmP_o,
        output wire zero_flag_o, //Flag for FSM when the subt result is zero
        output wire real_op_o, //bit for real add/subt operation in case for -DataY
        output wire sign_final_result_o //bit for sign result
		
    );


//Wire Signals useful to interconnect the components of the module


wire [W-1:0] intDX; //Output of register DATA_X
wire [W-1:0] intDY; //Output of register DATA_Y
wire intAS; //Output of register add_subt
wire gtXY; //Output for magntiude_comparator (X>Y)
wire eqXY; //Output for magntiude_comparator (X=Y)
wire [W-2:0] intM; //Output of MuxXY for bigger value
wire [W-2:0] intm;  //Output of MuxXY for small value




///////////////////////////////////////////////////////////////////

RegisterAdd #(.W(W)) XRegister ( //Data X input register
    .clk(clk), 
    .rst(rst), 
    .load(load_a_i), 
    .D(Data_X_i), 
    .Q(intDX)
    );
	 
RegisterAdd #(.W(W)) YRegister ( //Data Y input register
    .clk(clk), 
    .rst(rst), 
    .load(load_a_i), 
    .D(Data_Y_i), 
    .Q(intDY)
    );

RegisterAdd #(.W(1)) ASRegister ( //Data Add_Subtract input register
    .clk(clk), 
    .rst(rst), 
    .load(load_a_i), 
    .D(add_subt_i), 
    .Q(intAS)
    );

Comparator #(.W(W-1)) Magnitude_Comparator ( //Compare between magnitude for DATA_X and DATA_Y and select whos bigger and if there's a equality
    .Data_X_i(intDX[W-2:0]),
    .Data_Y_i(intDY[W-2:0]),
    .gtXY_o(gtXY),
    .eqXY_o(eqXY)
    );

xor_tri #(.W(W)) Op_verification ( //Operation between the DATA_X & Y's sign bit and the operation bit to find the real operation for ADDER/SUBTRACT
    .A_i(intDX[W-1]),
    .B_i(intDY[W-1]),
    .C_i(intAS),
    .Z_o(real_op_o)
    );

sgn_result result_sign_bit (//Calculate the sign bit for the final result
    .Add_Subt_i(intAS),
    .sgn_X_i(intDX[W-1]),
    .sgn_Y_i(intDY[W-1]),
    .gtXY_i(gtXY),
    .eqXY_i(eqXY),
    .sgn_result_o(sign_result)
    );

MultiplexTxT #(.W(W-1)) MuxXY (//Classify in the registers the bigger value (M) and the smaller value (m)
    .select(gtXY),
    .D0_i(intDX[W-2:0]),
    .D1_i(intDY[W-2:0]),
    .S0_o(intM),
    .S1_o(intm)
    );

RegisterAdd #(.W(W-1)) MRegister ( //Data_M register
    .clk(clk), 
    .rst(rst), 
    .load(load_b_i), 
    .D(intM), 
    .Q(DMP_o)
    );

RegisterAdd #(.W(W-1)) mRegister ( //Data_m register
    .clk(clk), 
    .rst(rst), 
    .load(load_b_i), 
    .D(intm), 
    .Q(DmP_o)
    );
    
RegisterAdd #(.W(1)) SignRegister (
    .clk(clk),
    .rst(rst),
    .load(load_b_i),
    .D(sign_result),
    .Q(sign_final_result_o)
    );

assign zero_flag_o = real_op_o & eqXY;

endmodule
