//==================================================================================================
//  Filename      : FPU_ADD_Substract_PIPELINED.v
//  Created On    : 2016-09-27 20:11:48
//  Last Modified : 2016-09-27 20:12:02
//  Revision      :
//  Author        : Jorge Sequeira Rojas
//  Company       : Instituto Tecnologico de Costa Rica
//  Email         : jsequeira@gmail.com
//
//  Description   :
//
//
//==================================================================================================
`timescale 1ns/1ps
//==================================================================================================
//  Filename      : FPU_ADD_Substract_PIPELINED.v
//  Created On    : 2016-09-21 14:31:41
//  Last Modified : 2016-09-27 08:58:31
//  Revision      :
//  Author        : Jorge Sequeira Rojas
//  Company       : Instituto Tecnologico de Costa Rica
//  Email         : jsequeira@gmail.com
//
//  Description   : This is the TOP for the pipelined FP Addition and substraction.
//
//
//==================================================================================================

// `include "Tenth_Phase_v2.v"
// `include "Priority_Codec_32.v"
// `include "Priority_Codec_64.v"
// `include "sgn_result.v"
// `include "Shift_left_logical.v"
// `include "xor_tri.v"
// `include "RegisterAdd.v"
// `include "Multiplexer_AC.v"
// `include "FSM_input_enable.v"
// `include "MultiplexTxT.v"
// `include "shift_mux.v"
// `include "FORMATTER.v"
// `include "Rotate_Mux_Array.v"





module FPU_PIPELINED_FPADDSUB

   /*#(parameter W = 32, parameter EW = 8, parameter SW = 23,
		parameter SWR=26, parameter EWR = 5)  //Single Precision */

#(parameter W = 64, parameter EW = 11, parameter SW = 52,
		parameter SWR = 55, parameter EWR = 6) //-- Double Precision */
	(
		//FSM Signals
		input wire clk,
		input wire rst,
		input wire beg_OP,
		//input wire ack_OP,

		//Oper_Start_in signals
		input wire [W-1:0] Data_X,
		input wire [W-1:0] Data_Y,
		input wire add_subt,

		//Round signals signals
		//input wire [1:0] r_mode,

		//OUTPUT SIGNALS
    output wire busy,
		output wire overflow_flag,
		output wire underflow_flag,
    output wire zero_flag,
	  output wire ready,
		output wire [W-1:0] final_result_ieee
    );


///////////////////WE LOAD THE INPUT VALUES AND OTHER SIGNALS ////
// ONTO THE FIRST STAGE//////


wire enable_Pipeline_input;
wire FSM_enable_input_internal;
wire [6:0] Shift_reg_FLAGS_7;
wire real_input_enable;
wire enable_shift_reg;



FSM_INPUT_ENABLE inst_FSM_INPUT_ENABLE (
		.clk                   (clk),
		.rst                   (rst),
		.init_OPERATION        (beg_OP),
    .enable_input_internal (FSM_enable_input_internal),
		.enable_Pipeline_input (enable_Pipeline_input),
    .enable_shift_reg      (enable_shift_reg)
	);




  ShiftRegister #(.W(7)) inst_ShiftRegister (
      .clk(clk),
      .rst(rst),
      .load  (enable_shift_reg|enable_Pipeline_input),
      .in_bit (FSM_enable_input_internal),
      .Q(Shift_reg_FLAGS_7));






//////////////////////////////----------------INIT------------------///////////////////////////////
wire ZERO_FLAG_INIT;

wire [W-1:0] intDX_EWSW, intDY_EWSW; //BUFFER OPERAND 1, OPERAND 2
wire intAS; //ADD SUB INPUT OPERATION

wire INPUT_ACTIVE;


wire gtXY, eqXY;

/// FLAGS PIPE STAGE: INIT
wire OP_FLAG_INIT, SIGN_FLAG_INIT;
/// DATA PIPE STAGE : INIT
wire [W-2:0] DMP_INIT_EWSW, DmP_INIT_EWSW;


//////////////////////////////----------------EXP------------------///////////////////////////////


// FLAGS
wire SIGN_FLAG_EXP, OP_FLAG_EXP, ZERO_FLAG_EXP, EXP_ACTIVE;

//Whole operand declaration

wire [W-2:0] DMP_EXP_EWSW, DmP_EXP_EWSW;

/// EXPONENT DECLARATION

wire [EW-1:0] DMP_exp_EXP_EW, DmP_exp_EXP_EW;

/// MANTISSA OR SIGNIFICAND DECLARATION

wire [SW-1:0] DMP_mant_EXP_SW, DmP_mant_EXP_SW;

//SHIFT AMOUNT DECLARATION

wire [EW-1:0] Shift_amount_EXP_EW; //Exponent operation result


//////////////////////////////----------------SHT1------------------///////////////////////////////

//FLAGS

wire [SWR-1:0]b_shifter_one_SWR;

wire SIGN_FLAG_SHT1, OP_FLAG_SHT1, ZERO_FLAG_SHT1, SHT1_ACTIVE;


//OPERAND SIGNALS
wire [W-2:0]  DMP_SHT1_EWSW;
wire [SW-1:0] DmP_mant_SHT1_SW;
wire [EWR-1:0] Shift_amount_SHT1_EWR;
/////////////////------SIGNALS FOR THE FIRST PART OF THE SHIFTER-------//////////-///////////////////

wire [EWR-1:0] shft_value_mux_o_EWR;
wire left_right_SHT1;
wire bit_shift_SHT1;

wire [SWR-1:0] sftr_idat_SHT1_SWR; //SHIFTER INPUT DATA
wire [SWR-1:0] sftr_odat_SHT1_SWR; //SHIFTER OUTPUT DATA

///////////BARREL SHIFTER INPUT VALUE MUX SIGNALS

// TEMPORARY WIRES
wire [EWR-1:0] mux_sel_norm_EWR; //OUTPUT SIGNAL FOR MUX SHIFT VALUE
wire [SWR-1:0] Data_array_SWR[EWR+1:0]; //TEMPORARY FOR THE DIFFERENT STAGES OF THE SHIFTER

//////////////////////////////----------------SHT2------------------///////////////////////////////

//FLAGS
wire SIGN_FLAG_SHT2, OP_FLAG_SHT2, ZERO_FLAG_SHT2, SHT2_ACTIVE;


/////////////////------SIGNALS FOR THE SECOND PART OF THE SHIFTER-------//////////-///////////////////
wire [W-2:0]DMP_SHT2_EWSW;

wire [EWR-1:0] shift_value_SHT2_EWR;
wire left_right_SHT2;
wire bit_shift_SHT2;

wire [SWR-1:0] sftr_idat_SHT2_SWR; //SHIFTER INPUT DATA
wire [SWR-1:0] sftr_odat_SHT2_SWR; //SHIFTER OUTPUT DATA

wire ADD_OVRFLW_NRM2, NRM2_ACTIVE;

wire [EW-1:0]Exp_oper_1_EW;
/////////////////------SIGNALS FOR THE LAST EXPONENT OPERATION-------/////////-///////////////////

reg [EW:0] exp_rslt_NRM2_EW1;
wire [EW-1:0] ADDSUB_exp_operand_EW;

wire [EW-1:0]DMP_exp_NRM2_EW;
wire SIGN_FLAG_SHT1SHT2, ZERO_FLAG_SHT1SHT2;

//////////////////////////////----------------SGF------------------///////////////////////////////

//FLAGS
wire SIGN_FLAG_SFG, OP_FLAG_SFG, ZERO_FLAG_SFG, SFG_ACTIVE;
wire ADD_OVRFLW_SGF;

wire [SWR-1:0]    DmP_mant_SFG_SWR;
wire [SWR-1:0]    DMP_mant_SFG_SWR;

wire [EW-1:0] DMP_exp_SFG;

reg Carry_out_SGF;
reg [SWR-1:0] Raw_mant_SGF;
wire [W-2:0] DMP_SFG;

//////////////////////////////----------------NRM------------------///////////////////////////////
//Flags

wire ADD_OVRFLW_NRM, SIGN_FLAG_NRM, ZERO_FLAG_NRM, NRM_ACTIVE;

wire [EW-1:0]DMP_exp_NRM_EW;

wire [SWR-1:0] Add_Subt_LZD_SWR;
wire [SWR-1:0] Raw_mant_NRM_SWR;

wire [EW-1:0] LZD_output_NRM2_EW;
wire [EWR-1:0] LZD_raw_out_NRM2_EWR;
wire [EWR-1:0] LZD_raw_out_EWR;
wire [EW-EWR-1:0] LZD_ZFiller;


//////////////////////////////----------------FRMT------------------///////////////////////////////

wire OVRFLW_FLAG_FRMT, UNDRFLW_FLAG_FRMT;
wire [W-1:0] formatted_number_W;


 /////////////////////////////////////FIRST STAGE "INIT" ///////////////////////////////
///////////////////////////////////// PIPELINE REGISTER = INIT//////////////////////////////////////

//////////////////////////////----------------------------------///////////////////////////////

  RegisterAdd #(.W(W)) INPUT_STAGE_OPERANDX (
  .clk(clk),
  .rst(rst),
  .load(enable_Pipeline_input),
  .D(Data_X),
  .Q(intDX_EWSW));

  RegisterAdd #(.W(W)) INPUT_STAGE_OPERANDY (
  .clk(clk),
  .rst(rst),
  .load(enable_Pipeline_input),
  .D(Data_Y),
  .Q(intDY_EWSW));

  RegisterAdd #(.W(1)) INPUT_STAGE_FLAGS (
  .clk(clk),
  .rst(rst),
  .load(enable_Pipeline_input),
  .D(add_subt),
  .Q(intAS));

// RegisterAdd #(.W(2*W+1+1)) INPUT_STAGE (
//     .clk(clk),
//     .rst(rst),
//     .load(enable_Pipeline_input),
//     .D({add_subt , Data_X, Data_Y, enable_Pipeline_input}),
//     .Q({intAS      , intDX_EWSW   , intDY_EWSW   , INPUT_ACTIVE})
//     );

//////////////////////////////----------------------------------///////////////////////////////


//////////////////////////////----------------------------------///////////////////////////////

//Compares between magnitude for DATA_X and DATA_Y and select whos bigger and if there's a equality

Comparator #(.W(W-1)) Magnitude_Comparator (
    .Data_X_i(intDX_EWSW[W-2:0]),
    .Data_Y_i(intDY_EWSW[W-2:0]),
    .gtXY_o(gtXY),
    .eqXY_o(eqXY)
    );


//Classifies in the registers the bigger value (M) and the smaller value (m)

MultiplexTxT #(.W(W-1)) MuxXY (
	.select(gtXY),
    .D0_i(intDX_EWSW[W-2:0]),
    .D1_i(intDY_EWSW[W-2:0]),
    .S0_o(DMP_INIT_EWSW),
    .S1_o(DmP_INIT_EWSW)
    );

//Operation between the DATA_X & Y's sign bit and the operation bit to find the real operation for ADDER/SUBTRACT
xor_tri #(.W(W)) Op_verification (
    .A_i(intDX_EWSW[W-1]),   //Signo de ese operando
    .B_i(intDY_EWSW[W-1]),   //Signo de ese operando
    .C_i(intAS),        //Operacion ingresada por modulo externo
    .Z_o(OP_FLAG_INIT)
    );

//Calculate the sign bit for the final result
sgn_result result_sign_bit (
    .Add_Subt_i(intAS),
    .sgn_X_i(intDX_EWSW[W-1]),
    .sgn_Y_i(intDY_EWSW[W-1]),
    .gtXY_i(gtXY),
    .eqXY_i(eqXY),
    .sgn_result_o(SIGN_FLAG_INIT)
    );

//zero flag if theres a subtraction and the variables are equal


assign ZERO_FLAG_INIT = OP_FLAG_INIT & eqXY;

//////////////////////////////----------------------------------///////////////////////////////

 ////////////////////////////////////////SECOND STAGE "EXP" ///////////////////////////////
///////////////////////////////////// PIPELINE REGISTER = EXP//////////////////////////////////////

//////////////////////////////----------------------------------///////////////////////////////

  RegisterAdd #(.W(W-1)) EXP_STAGE_DMP (
  .clk(clk),
  .rst(rst),
  .load(INPUT_ACTIVE),
  .D(DMP_INIT_EWSW),
  .Q(DMP_EXP_EWSW));
//El sintetizador puede eliminar algunos registros de acá debido a
//la no utilización de estos. Para este caso, se reducirá el tamaño
//de el registro de menor tamaño

//Estos warnings pueden ser ignorados.

  RegisterAdd #(.W(W-1)) EXP_STAGE_DmP (
  .clk(clk),
  .rst(rst),
  .load(INPUT_ACTIVE),
  .D(DmP_INIT_EWSW),
  .Q(DmP_EXP_EWSW));

  RegisterAdd #(.W(3))  EXP_STAGE_FLAGS (
  .clk(clk),
  .rst(rst),
  .load(INPUT_ACTIVE),
  .D({SIGN_FLAG_INIT, OP_FLAG_INIT, ZERO_FLAG_INIT}),
  .Q({SIGN_FLAG_EXP , OP_FLAG_EXP , ZERO_FLAG_EXP}));


// RegisterAdd #(.W( W - 1 + W - 1 + 3 )) EXP_STAGE (
//     .clk(clk),
//     .rst(rst),
//     .load(INPUT_ACTIVE),
//     .D({DMP_EXP_EWSW, DmP_INIT_EWSW, SIGN_FLAG_INIT, OP_FLAG_INIT, ZERO_FLAG_INIT, INPUT_ACTIVE}),
//     .Q({DMP_EXP_EWSW , DmP_EXP_EWSW , SIGN_FLAG_EXP , OP_FLAG_EXP , ZERO_FLAG_EXP , EXP_ACTIVE   })
//     );

//////////////////////////////----------------------------------///////////////////////////////


//////////////////////////////----------------------------------///////////////////////////////



//Aca pueden salir problemas por el largo del exponente.

//THE FOLLOWING IS JUST FOR SIMULATION PURPOSES
 assign DMP_exp_EXP_EW = DMP_EXP_EWSW[W-2:W-EW-1]; //We assign the exponent bits for the comming operation
 assign DmP_exp_EXP_EW = DmP_EXP_EWSW[W-2:W-EW-1]; //We assign the exponent bits for the comming operation
 assign DMP_mant_EXP_SW = DMP_EXP_EWSW[SW-1:0];
////////////WE SUBTRACT THE DIFFERENCE BETWEEN EXPONENTS (hence, the EXP name) /////////////

assign Shift_amount_EXP_EW = DMP_EXP_EWSW[W-2:SW] - DmP_EXP_EWSW[W-2:SW];

//assign DMP_mant_EXP_SW = DMP_EXP_EWSW[SW-1:0];
assign DmP_mant_EXP_SW = DmP_EXP_EWSW[SW-1:0];


//////////////////////////////----------------------------------///////////////////////////////

/////////////////////////////////////////THIRD STAGE "SFT1" ////////////////////////////
/////////////////////////////////// PIPELINE REGISTER = SFT1 /////////////////////////////

//////////////////////////////----------------------------------///////////////////////////////

// RegisterAdd #(.W(W-1+SW+EWR+4)) SHT1_STAGE (
//     .clk(clk),
//     .rst(rst),
//     .load(EXP_ACTIVE),
//     .D({DMP_EXP_EWSW , DmP_mant_EXP_SW , Shift_amount_EXP_EW , SIGN_FLAG_EXP , OP_FLAG_EXP , ZERO_FLAG_EXP , EXP_ACTIVE}),
//     .Q({DMP_SHT1_EWSW, DmP_mant_SHT1_SW, Shift_amount_SHT1_EWR, SIGN_FLAG_SHT1, OP_FLAG_SHT1, ZERO_FLAG_SHT1, SHT1_ACTIVE})
//     );
  RegisterAdd #(.W(W-1)) SHT1_STAGE_DMP (
  .clk(clk),
  .rst(rst),
  .load(EXP_ACTIVE),
  .D(DMP_EXP_EWSW),
  .Q(DMP_SHT1_EWSW));

  RegisterAdd #(.W(SW)) SHT1_STAGE_DmP_mant (
  .clk(clk),
  .rst(rst),
  .load(EXP_ACTIVE),
  .D(DmP_mant_EXP_SW),
  .Q(DmP_mant_SHT1_SW));

  RegisterAdd #(.W(EWR)) SHT1_STAGE_sft_amount (
  .clk(clk),
  .rst(rst),
  .load(EXP_ACTIVE),
  .D(Shift_amount_EXP_EW[EWR-1:0]),
  .Q(Shift_amount_SHT1_EWR));

  RegisterAdd #(.W(3)) SHT1_STAGE_FLAGS (
  .clk(clk),
  .rst(rst),
  .load(EXP_ACTIVE),
  .D({SIGN_FLAG_EXP , OP_FLAG_EXP , ZERO_FLAG_EXP}),
  .Q({SIGN_FLAG_SHT1, OP_FLAG_SHT1, ZERO_FLAG_SHT1}));
////////////////////////----------------------TEMPS---------------///////////////////////////////


//////////////////////////////----------------------------------///////////////////////////////

generate
    case(EW)
        8:begin
            assign b_shifter_one_SWR = 5'd1;
        end
        default:begin
            assign b_shifter_one_SWR = 6'd1;
        end
    endcase
endgenerate

generate
    case(EW)
        8:begin
            assign LZD_ZFiller =3'd0;
            assign Exp_oper_1_EW = 8'd1;
        end
        default:begin
            assign LZD_ZFiller =5'd0;
             assign Exp_oper_1_EW = 11'd1;
        end
    endcase
endgenerate
//assign mux_out = (sel) ? din_1 : din_0;
//Input variables for the shifter, depending upon the stage.


assign mux_sel_norm_EWR     = (ADD_OVRFLW_NRM) ? b_shifter_one_SWR : LZD_raw_out_EWR;
assign shft_value_mux_o_EWR = (NRM_ACTIVE)     ?  mux_sel_norm_EWR : Shift_amount_SHT1_EWR;

//assign left_right_SHT1      = (NRM_ACTIVE)     ? (~ADD_OVRFLW_NRM) : 1'b0;

assign left_right_SHT1      = (NRM_ACTIVE)&(~ADD_OVRFLW_NRM);

assign bit_shift_SHT1       = (NRM_ACTIVE)&(ADD_OVRFLW_NRM);


	Multiplexer_AC #(.W(SWR)) b_shftr_idat_mux_SHT1 (
		.ctrl(NRM_ACTIVE                   ),
		.D0  ({1'b1,DmP_mant_SHT1_SW,2'b00}),
		.D1  (Raw_mant_NRM_SWR             ),
		.S   (sftr_idat_SHT1_SWR           )
		);

////////////////////////////////////////////////////
	genvar k;			//Level//
////////////////////////////////////////////////////


	Rotate_Mux_Array #(.SWR(SWR)) first_rotate(
		.Data_i  (sftr_idat_SHT1_SWR),
		.select_i(left_right_SHT1),
		.Data_o  (Data_array_SWR [0][SWR-1:0])
		);

	generate for (k=0; k < 2; k=k+1) begin : shift_mux_array1
		shift_mux_array #(.SWR(SWR), .LEVEL(k)) shift_mux_array(
			.Data_i     (Data_array_SWR[k]),
			.select_i   (shft_value_mux_o_EWR[k]),
			.bit_shift_i(bit_shift_SHT1),
			.Data_o     (Data_array_SWR[k+1])
			);
		end
	endgenerate

assign sftr_odat_SHT1_SWR = Data_array_SWR[2];
assign Data_array_SWR[3] = sftr_idat_SHT2_SWR;



//////////////////////////////----------------------------------///////////////////////////////

/////////////////////////////////////////FOURTH STAGE "SFT2" ////////////////////////////
/////////////////////////////////// PIPELINE REGISTER = SFT2 /////////////////////////////

//////////////////////////////----------------------------------///////////////////////////////

  RegisterAdd #(.W(W-1)) SHT2_STAGE_DMP (
  .clk(clk),
  .rst(rst),
  .load(SHT1_ACTIVE),
  .D(DMP_SHT1_EWSW),
  .Q(DMP_SHT2_EWSW));

  RegisterAdd #(.W(SWR)) SHT2_SHIFT_DATA (
  .clk(clk),
  .rst(rst),
  .load((SHT1_ACTIVE|NRM_ACTIVE)),
  .D(sftr_odat_SHT1_SWR),
  .Q(sftr_idat_SHT2_SWR));

//LOS BITS 4, 3 y 2 DE ESTE REGISTRO PUEDEN SER ELIMINADOS
//GRACIAS A QUE SE UTILIZARON EN LA ETAPA ANTERIOR DE CORRIMIENTO.

  RegisterAdd #(.W(EWR)) SHT2_STAGE_SHFTVARS1 (
  .clk(clk),
  .rst(rst),
  .load(SHT1_ACTIVE|NRM_ACTIVE),
  .D({shft_value_mux_o_EWR}),
  .Q({shift_value_SHT2_EWR}));

  RegisterAdd #(.W(2)) SHT2_STAGE_SHFTVARS2 (
  .clk(clk),
  .rst(rst),
  .load(SHT1_ACTIVE|NRM_ACTIVE),
  .D({left_right_SHT1,bit_shift_SHT1}),
  .Q({left_right_SHT2, bit_shift_SHT2}));

  RegisterAdd #(.W(3)) SHT2_STAGE_FLAGS (
  .clk(clk),
  .rst(rst),
  .load(SHT1_ACTIVE),
  .D({SIGN_FLAG_SHT1, OP_FLAG_SHT1, ZERO_FLAG_SHT1}),
  .Q({SIGN_FLAG_SHT2, OP_FLAG_SHT2, ZERO_FLAG_SHT2}));

/////////////////DE ACA SALE DIRECTO A LA ETAPA DE FORMATO//////////////

  RegisterAdd #(.W(EWR+EW)) SFT2FRMT_STAGE_VARS(
    .clk(clk),
    .rst(rst),
    .load(NRM_ACTIVE),
    .D({LZD_raw_out_EWR     , DMP_exp_NRM_EW }),
    .Q({LZD_raw_out_NRM2_EWR, DMP_exp_NRM2_EW})
    );

  RegisterAdd #(.W(3)) SFT2FRMT_STAGE_FLAGS (
    .clk(clk),
    .rst(rst),
    .load(NRM_ACTIVE),
    .D({ADD_OVRFLW_NRM , SIGN_FLAG_NRM     , ZERO_FLAG_NRM }),
    .Q({ADD_OVRFLW_NRM2, SIGN_FLAG_SHT1SHT2, ZERO_FLAG_SHT1SHT2}));
//////////////////////////////----------------------------------///////////////////////////////



//////////////////////////////----------------------------------///////////////////////////////

generate for (k=2; k < EWR; k=k+1) begin : shift_mux_array2
	shift_mux_array #(.SWR(SWR), .LEVEL(k)) shift_mux_array(
		.Data_i(Data_array_SWR[k+1]),
		.select_i(shift_value_SHT2_EWR[k]),
		.bit_shift_i(bit_shift_SHT2),
		.Data_o(Data_array_SWR[k+2])
		);
	end
endgenerate

	Rotate_Mux_Array #(.SWR(SWR)) last_rotate(
		.Data_i(Data_array_SWR[EWR+1]),
		.select_i(left_right_SHT2),
		.Data_o(sftr_odat_SHT2_SWR)
		);


assign LZD_output_NRM2_EW = {LZD_ZFiller, LZD_raw_out_NRM2_EWR};

////////////////////////INPUT MUX FOR ADD/SUB/////////////////////////

	assign ADDSUB_exp_operand_EW = (ADD_OVRFLW_NRM2) ? Exp_oper_1_EW : LZD_output_NRM2_EW;

////////////////////////INPUT MUX FOR ADD/SUB/////////////////////////

//////////////////////////ADDER/SUBSTRACTOR///////////////////////

	// always @* begin : ADD_SUB_NRM
	//    case (ADD_OVRFLW_NRM2)
 //        1'b0  : begin
 //                    {Carry_out_SFT2, exp_rslt_NRM2_EW1} = DMP_exp_NRM2_EW + ADDSUB_exp_operand_EW;
 //                 end
 //        1'b1  : begin
 //                    {Carry_out_SFT2, exp_rslt_NRM2_EW1} = DMP_exp_NRM2_EW - ADDSUB_exp_operand_EW;
 //                 end
 //        default: begin
 //                    {Carry_out_SFT2, exp_rslt_NRM2_EW1} = DMP_exp_NRM2_EW + ADDSUB_exp_operand_EW;
 //                 end
 //     endcase

  always @* begin
    if (ADD_OVRFLW_NRM2) begin
      exp_rslt_NRM2_EW1 = DMP_exp_NRM2_EW + ADDSUB_exp_operand_EW;
    end
    else begin
      exp_rslt_NRM2_EW1 = DMP_exp_NRM2_EW - ADDSUB_exp_operand_EW;
    end
  end
//////////////////////////ADDER/SUBSTRACTOR///////////////////////


FORMATTER #(.EW(EW+1)) array_comparators(
    .exp(exp_rslt_NRM2_EW1),
    .overflow (OVRFLW_FLAG_FRMT),
    .underflow(UNDRFLW_FLAG_FRMT));

//////////////////////////////----------------------------------///////////////////////////////

/////////////////////////////////////////FIFTH STAGE "SGF" ////////////////////////////
/////////////////////////////////// PIPELINE REGISTER = SGF /////////////////////////////

//////////////////////////////----------------------------------///////////////////////////////
  RegisterAdd #(.W(W-1))   SGF_STAGE_DMP (
  .clk(clk),
  .rst(rst),
  .load((SHT2_ACTIVE&~NRM2_ACTIVE)),
  .D(DMP_SHT2_EWSW),
  .Q(DMP_SFG));

  RegisterAdd #(.W(SWR))  SGF_STAGE_DmP_mant (
  .clk(clk),
  .rst(rst),
  .load(SHT2_ACTIVE&~NRM2_ACTIVE),
  .D(sftr_odat_SHT2_SWR),
  .Q(DmP_mant_SFG_SWR));

  RegisterAdd #(.W(3))    SGF_STAGE_FLAGS (
  .clk(clk),
  .rst(rst),
  .load(SHT2_ACTIVE&~NRM2_ACTIVE),
  .D({SIGN_FLAG_SHT2,OP_FLAG_SHT2, ZERO_FLAG_SHT2}),
  .Q({SIGN_FLAG_SFG , OP_FLAG_SFG, ZERO_FLAG_SFG }));


// RegisterAdd #(.W(W+SWR+4)) SGF_STAGE(
// 		.clk(clk),
// 		.rst(rst),
// 		.load(SHT2_ACTIVE&~NRM2_ACTIVE),//Esto significa que si esta en NRM2, no active SGF
//     .D({DMP_SHT2_EWSW, sftr_odat_SHT2_SWR, SIGN_FLAG_SHT2,OP_FLAG_SHT2, ZERO_FLAG_SHT2, SHT2_ACTIVE}),
//     .Q({DMP_SFG , DmP_mant_SFG_SWR  , SIGN_FLAG_SFG , OP_FLAG_SFG, ZERO_FLAG_SFG , SFG_ACTIVE})
//     );

// RegisterAdd #(.W( )) NORM_2_SGF_STAGE(
//         .clk(clk),+
//         .rst(rst),
//         .load(NRM2SFT2_ACTIVE),
//         .D({, Overflow_flag_SHT2, Underflow_flag_SHT2, NRM2SFT2_ACTIVE}),
//         .Q({, OVRFLW_FLAG_FRMT, UNDRFLW_FLAG_FRMT, SFT2FRMT_ACTIVE  })
//         );

//////////////////////////////----------------------------------///////////////////////////////




//////////////////////////////----------------------------------///////////////////////////////
	assign DMP_mant_SFG_SWR = {1'b1,DMP_SFG[SW-1:0],2'b00};

	assign DMP_exp_SFG = DMP_SFG[W-2:SW];

	always @* begin : ADD_SUB_SGF
       case (OP_FLAG_SFG)
          1'b0  : begin
                      {Carry_out_SGF, Raw_mant_SGF} = DMP_mant_SFG_SWR + DmP_mant_SFG_SWR;
                   end
          1'b1  : begin
                      {Carry_out_SGF, Raw_mant_SGF} = DMP_mant_SFG_SWR - DmP_mant_SFG_SWR;
                   end
          default: begin
                      {Carry_out_SGF, Raw_mant_SGF} = DMP_mant_SFG_SWR + DmP_mant_SFG_SWR;
                   end
       endcase
  end
	assign ADD_OVRFLW_SGF = Carry_out_SGF&(~OP_FLAG_SFG);


//////////////////////////////----------------------------------///////////////////////////////

/////////////////////////////////////////SIXTH STAGE "NRM" ////////////////////////////
/////////////////////////////////// PIPELINE REGISTER = NRM /////////////////////////////

//////////////////////////////----------------------------------///////////////////////////////


// RegisterAdd #(.W( )) NRM_STAGE(
//         .clk(clk),
//         .rst(rst),
//         .load(SFG_ACTIVE),
//         .D({Raw_mant_SGF, DMP_exp_SFG, ADD_OVRFLW_SGF, SIGN_FLAG_SFG, ZERO_FLAG_SFG, SFG_ACTIVE}),
//         .Q({Raw_mant_NRM_SWR, DMP_exp_NRM_EW, ADD_OVRFLW_NRM, SIGN_FLAG_NRM, ZERO_FLAG_NRM, NRM_ACTIVE})
//         );

  RegisterAdd #(.W(SWR)) NRM_STAGE_Raw_mant (
  .clk(clk),
  .rst(rst),
  .load(SFG_ACTIVE),
  .D(Raw_mant_SGF),
  .Q(Raw_mant_NRM_SWR));

  RegisterAdd #(.W(EW)) NRM_STAGE_DMP_exp (
  .clk(clk),
  .rst(rst),
  .load(SFG_ACTIVE),
  .D(DMP_exp_SFG),
  .Q(DMP_exp_NRM_EW));

  RegisterAdd #(.W(3)) NRM_STAGE_FLAGS (
  .clk(clk),
  .rst(rst),
  .load(SFG_ACTIVE),
  .D({ADD_OVRFLW_SGF, SIGN_FLAG_SFG, ZERO_FLAG_SFG}),
  .Q({ADD_OVRFLW_NRM, SIGN_FLAG_NRM, ZERO_FLAG_NRM}));

//////////////////////////////----------------------------------///////////////////////////////


//////////////////////////////----------------------------------///////////////////////////////
//assign mux_out = (sel) ? din_1 : din_0;



assign Add_Subt_LZD_SWR = ~Raw_mant_NRM_SWR;

/////////////////////////LZD BEGIN////////////////////////////

generate
		case (SWR)
			26:begin : LZD_SINGLE
				Priority_Codec_32 Codec_32(
					.Data_Dec_i(Add_Subt_LZD_SWR),
					.Data_Bin_o(LZD_raw_out_EWR)
					);
				end
			55:begin : LZD_DOUBLE
				Priority_Codec_64 Codec_64(
					.Data_Dec_i(Add_Subt_LZD_SWR),
					.Data_Bin_o(LZD_raw_out_EWR)
					);
				end
		endcase

endgenerate




//////////////////////////////----------------------------------///////////////////////////////

/////////////////////////////////////////SEVENTH STAGE "FRMT" ////////////////////////////
/////////////////////////////////// PIPELINE REGISTER = FRMT /////////////////////////////

//////////////////////////////----------------------------------///////////////////////////////



// NO REGISTER FOR THIS STAGE, BECAUSE WE RECYCLE THE BARREL SHIFTER



//////////////////////////////----------------------------------///////////////////////////////
//////////////////////////////----------------------------------///////////////////////////////



	FRMT_STAGE #(.W(W),.EW(EW),.SW(SW)) inst_FRMT_STAGE (
			.overflow_flag    (OVRFLW_FLAG_FRMT ),
			.underflow_flag   (UNDRFLW_FLAG_FRMT),
			.sign_i           (SIGN_FLAG_SHT1SHT2),
			.exp_ieee_i       (exp_rslt_NRM2_EW1[EW-1:0]),
			.sgf_ieee_i       (sftr_odat_SHT2_SWR[SWR-2:2]),
			.formatted_number (formatted_number_W)
		);

//////////////////////////////-------------------------------------///////////////////////////////

/////////////////////////////////////////EIGHT STAGE "DATAO" ////////////////////////////
/////////////////////////////////// PIPELINE REGISTER = DATAO /////////////////////////////

//////////////////////////////-------------------------------------///////////////////////////////
  assign {INPUT_ACTIVE,
          EXP_ACTIVE,
          SHT1_ACTIVE,
          SHT2_ACTIVE,
          SFG_ACTIVE,
          NRM_ACTIVE,
          NRM2_ACTIVE} = Shift_reg_FLAGS_7;

assign busy = SHT1_ACTIVE;

  RegisterAdd #(.W(W)) FRMT_STAGE_DATAOUT (
  .clk(clk),
  .rst(rst),
  .load(NRM2_ACTIVE),
  .D(formatted_number_W),
  .Q(final_result_ieee)
  );

  RegisterAdd #(.W(3)) FRMT_STAGE_FLAGS (
  .clk(clk),
  .rst(rst),
  .load(NRM2_ACTIVE),
  .D({OVRFLW_FLAG_FRMT,UNDRFLW_FLAG_FRMT, ZERO_FLAG_SHT1SHT2}),
  .Q({overflow_flag   , underflow_flag  , zero_flag     })
  );

  RegisterAdd #(.W(1)) Ready_reg (
  .clk(clk),
  .rst(rst),
  .load(1),
  .D(NRM2_ACTIVE),
  .Q(ready));

//////////////////////////////----------------------------------///////////////////////////////
//////////////////////////////----------------------------------///////////////////////////////


endmodule

