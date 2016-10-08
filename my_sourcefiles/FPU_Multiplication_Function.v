`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:36:46 09/06/2015 
// Design Name: 
// Module Name:    FPU_Multiplication_Function 
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
module FPU_Multiplication_Function
	//SINGLE PRECISION PARAMETERS
	/*# (parameter W = 32, parameter EW = 8, parameter SW = 23) // */
	//DOUBLE PRECISION PARAMETERS
	# (parameter W = 64, parameter EW = 11, parameter SW = 52) // */
	(
		input wire clk,
		input wire rst,
		input wire beg_FSM,
		input wire ack_FSM,
		
		input wire [W-1:0] Data_MX,
		input wire [W-1:0] Data_MY,
		input wire [1:0] round_mode,
		
		output wire overflow_flag,
		output wire underflow_flag,
		output wire ready,
		output wire [W-1:0] final_result_ieee
    );




//GENERAL
wire rst_int; //**


//FSM_load_signals

wire FSM_first_phase_load; //**
wire FSM_load_first_step; /*Zero flag, Exp operation underflow, Sgf operation first reg,
sign result reg*/
wire FSM_exp_operation_load_result; //Exp operation result,
wire FSM_load_second_step; //Exp operation Overflow, Sgf operation second reg
wire FSM_barrel_shifter_load;
wire FSM_adder_round_norm_load;
wire FSM_final_result_load;



//ZERO FLAG
//Op_MX;
//Op_MY
wire zero_flag;

//FIRST PHASE
wire [W-1:0] Op_MX;
wire [W-1:0] Op_MY;

//Mux S-> exp_operation OPER_A_i//////////

wire FSM_selector_A;
//D0=Op_MX[W-2:W-EW-1] 
//D1=exp_oper_result
wire [EW:0] S_Oper_A_exp;

//Mux S-> exp_operation OPER_B_i//////////

wire [1:0] FSM_selector_B;
//D0=Op_MY[W-2:W-EW-1]
//D1=LZA_output
//D2=1
wire [EW-1:0] S_Oper_B_exp;

///////////exp_operation///////////////////////////

wire FSM_exp_operation_A_S;
//oper_A= S_Oper_A_exp
//oper_B= S_Oper_B_exp
wire [EW:0] exp_oper_result;


//Sgf operation//////////////////
//Op_A={1'b1, Op_MX[SW-1:0]}
//Op_B={1'b1, Op_MY[SW-1:0]}
wire [2*SW+1:0] P_Sgf;

wire[SW:0] significand;
wire[SW:0] non_significand;
//Sign Operation

wire sign_final_result;

//barrel shifter multiplexers

wire [SW:0] S_Data_Shift;

//barrel shifter

wire [SW:0] Sgf_normalized_result;

//adder rounding

wire FSM_add_overflow_flag;
//Oper_A_i=norm result
//Oper_B_i=1
wire [SW:0] Add_result;

//round decoder

wire FSM_round_flag;

//Selecto moltiplexers
wire selector_A;
wire [1:0] selector_B;
wire load_b;
wire selector_C;

//Barrel shifter multiplexer


/////////////////////////////////////////FSM////////////////////////////////////////////

FSM_Mult_Function FS_Module (
    .clk(clk), //** 
    .rst(rst), //**
    .beg_FSM(beg_FSM), //** 
    .ack_FSM(ack_FSM), //**
	.zero_flag_i(zero_flag), 
    .Mult_shift_i(P_Sgf[2*SW+1]),
	.round_flag_i(FSM_round_flag), 	 
    .Add_Overflow_i(FSM_add_overflow_flag), 
	.load_0_o(FSM_first_phase_load),
    .load_1_o(FSM_load_first_step), 
    .load_2_o(FSM_exp_operation_load_result), 
    .load_3_o(FSM_load_second_step), 
    .load_4_o(FSM_adder_round_norm_load),
    .load_5_o(FSM_final_result_load),
    .load_6_o(FSM_barrel_shifter_load),
    .ctrl_select_a_o(selector_A), 
    .ctrl_select_b_o(load_b), 
    .selector_b_o(selector_B), 
    .ctrl_select_c_o(selector_C), 
    .exp_op_o(FSM_exp_operation_A_S), 
    .shift_value_o(FSM_Shift_Value),
    .rst_int(rst_int),                                               //
    .ready(ready)
    );

///////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////Selector's registers//////////////////////////////

RegisterAdd #(.W(1)) Sel_A ( //Selector_A register
    .clk(clk), 
    .rst(rst_int), 
    .load(selector_A), 
    .D(1'b1), 
    .Q(FSM_selector_A)
    );

RegisterAdd #(.W(1)) Sel_C ( //Selector_C register
    .clk(clk), 
    .rst(rst_int), 
    .load(selector_C), 
    .D(1'b1), 
    .Q(FSM_selector_C)
    );
    
        
RegisterAdd #(.W(2)) Sel_B ( //Selector_B register
                .clk(clk), 
                .rst(rst_int), 
                .load(load_b), 
                .D(selector_B), 
                .Q(FSM_selector_B)
                );

///////////////////////////////////////////////////////////////////////////////////////////
First_Phase_M #(.W(W)) Operands_load_reg (                          //
    .clk(clk), //**
    .rst(rst_int), //**
    .load(FSM_first_phase_load), //** 
    .Data_MX(Data_MX), //** 
    .Data_MY(Data_MY), //**
    .Op_MX(Op_MX), 
    .Op_MY(Op_MY)
    );

Zero_InfMult_Unit #(.W(W)) Zero_Result_Detect (
    .clk(clk), 
    .rst(rst_int), 
    .load(FSM_load_first_step), 
    .Data_A(Op_MX [W-2:0]), 
    .Data_B(Op_MY [W-2:0]), 
    .zero_m_flag(zero_flag)
    );

///////////Mux exp_operation OPER_A_i//////////

Multiplexer_AC #(.W(EW+1)) Exp_Oper_A_mux(
        .ctrl(FSM_selector_A),
        .D0 ({1'b0,Op_MX[W-2:W-EW-1]}),
        .D1 (exp_oper_result),
        .S (S_Oper_A_exp)
    );

///////////Mux exp_operation OPER_B_i//////////
wire [EW-1:0] Exp_oper_B_D1, Exp_oper_B_D2;

Mux_3x1 #(.W(EW)) Exp_Oper_B_mux(
                .ctrl(FSM_selector_B),
                .D0 (Op_MY[W-2:W-EW-1]),
                .D1 (Exp_oper_B_D1),
                .D2 (Exp_oper_B_D2),
                .S(S_Oper_B_exp)
            );
            

generate
    case(EW)
        8:begin
            assign Exp_oper_B_D1 = 8'd127; 
            assign Exp_oper_B_D2 = 8'd1;
        end
        default:begin
             assign Exp_oper_B_D1 = 11'd1023;
             assign Exp_oper_B_D2 = 11'd1;
        end
    endcase
endgenerate


///////////exp_operation///////////////////////////


Exp_Operation_m #(.EW(EW)) Exp_module (
    .clk(clk),
    .rst(rst_int),
    .load_a_i(FSM_load_first_step),
    .load_b_i(FSM_load_second_step),
    .load_c_i(FSM_exp_operation_load_result),
    .Data_A_i(S_Oper_A_exp),
    .Data_B_i({1'b0,S_Oper_B_exp}),
    .Add_Subt_i(FSM_exp_operation_A_S),
    .Data_Result_o(exp_oper_result),
    .Overflow_flag_o(overflow_flag),
    .Underflow_flag_o(underflow_flag)
    );

////////Sign_operation//////////////////////////////

XOR_M Sign_operation (
    .Sgn_X(Op_MX[W-1]),
    .Sgn_Y(Op_MY[W-1]),
    .Sgn_Info(sign_final_result)
    );


/////Significant_Operation//////////////////////////

Sgf_Multiplication #(.SW(SW+1)) Sgf_operation (
    .clk(clk),
    .rst(rst),
    .load_b_i(FSM_load_second_step),
    .Data_A_i({1'b1,Op_MX[SW-1:0]}),
    .Data_B_i({1'b1,Op_MY[SW-1:0]}),
    .sgf_result_o(P_Sgf)
    );
    
    //////////Mux Barrel shifter shift_Value/////////////////
    
    assign significand = P_Sgf [2*SW:SW];
    assign non_significand = P_Sgf [SW-1:0];
            
    ///////////Mux Barrel shifter Data_in//////
    
    Multiplexer_AC #(.W(SW+1)) Barrel_Shifter_D_I_mux(
        .ctrl(FSM_selector_C),
        .D0 (significand),
        .D1 (Add_result),
        .S (S_Data_Shift)
    );
    
    ///////////Barrel_Shifter//////////////////////////
    
    Barrel_Shifter_M #(.SW(SW+1)) Barrel_Shifter_module (
        .clk(clk), 
        .rst(rst_int),
        .load_i(FSM_barrel_shifter_load),
        .Shift_Value_i(FSM_Shift_Value),
        .Shift_Data_i(S_Data_Shift),
        .N_mant_o(Sgf_normalized_result)
        );
        
        
   
////Round decoder/////////////////////////////////

Round_decoder_M #(.SW(SW)) Round_Decoder (
    .Round_Bits_i(non_significand),
    .Round_Mode_i(round_mode),
    .Sign_Result_i(sign_final_result),
    .Round_Flag_o(FSM_round_flag)
    );

//rounding_adder

wire [SW:0] Add_Sgf_Oper_B;

assign Add_Sgf_Oper_B = (SW)*1'b1;

Adder_Round #(.SW(SW+1)) Adder_M (
    .clk(clk), 
    .rst(rst_int),
    .load_i(FSM_adder_round_norm_load),
    .Data_A_i(Sgf_normalized_result),
    .Data_B_i(Add_Sgf_Oper_B),
    .Data_Result_o(Add_result),
    .FSM_C_o(FSM_add_overflow_flag)
    );

////Final Result///////////////////////////////

Tenth_Phase #(.W(W),.EW(EW),.SW(SW)) final_result_ieee_Module(
    .clk(clk), 
    .rst(rst_int),
    .load_i(FSM_final_result_load),
    .sel_a_i(overflow_flag),
    .sel_b_i(underflow_flag),
    .sign_i(sign_final_result),
    .exp_ieee_i(exp_oper_result[EW-1:0]),
    .sgf_ieee_i(Sgf_normalized_result[SW-1:0]),
    .final_result_ieee_o(final_result_ieee)
    );

    


endmodule
