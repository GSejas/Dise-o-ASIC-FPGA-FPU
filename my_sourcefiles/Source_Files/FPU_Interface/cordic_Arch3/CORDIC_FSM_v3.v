//==================================================================================================
//  Filename      : CORDIC_FSM_v3.v
//  Created On    : 2016-10-03 15:59:21
//  Last Modified : 2016-10-28 22:39:59
//  Revision      :
//  Author        : Jorge Sequeira Rojas
//  Company       : Instituto Tecnologico de Costa Rica
//  Email         : jsequeira@gmail.com
//
//  Description   : CORDIC's FSM Unit
//
//
//==================================================================================================
`timescale 1ns / 1ps

module CORDIC_FSM_v3
(
  //Input Signals
  input wire clk,											//	Reloj del sitema.
  input wire reset,										//	Reset del sitema.
  input wire beg_FSM_CORDIC,								//	Señal de inicio de la maquina de estados.
  input wire ACK_FSM_CORDIC,								//	Señal proveniente del modulo que recibe el resultado, indicado que el dato ha sido recibido.
  input wire exception,
  input wire max_tick_iter, 			//	Señales que indican la maxima y minima cuenta, respectivamente, en el contador de iteraciones.
  input wire max_tick_var, 				//	Señales que indican la maxima y minima cuenta, respectivamente, en el contador de variables.
  input wire enab_dff_z,

  //Output Signals

  //output reg reset_reg_cordic,
  output reg ready_CORDIC,								//	Señal que indica que el calculo CORDIC se ha terminado.
  output reg beg_add_subt,								//	Señal que indica al modulo de suma/resta que inicie su operacion.
  output reg enab_cont_iter,				//	Señales de habilitacion y carga, respectivamente, en el contador de iteraciones.
  output reg enab_cont_var,				//	Señales de habilitacion y carga, respectivamente, en el contador de variables.
  output reg enab_RB1, enab_RB2, enab_RB3,
  output reg enab_d_ff5_data_out
);

//symbolic state declaration
/*localparam [3:0]    est0 = 8'b0000000,
                    est1 = 8'b0000001,
                    est2 = 8'b0000010,
                    est3 = 8'b0000100,
                    est4 = 8'b0001000,
                    est5 = 8'b0010000,
                    est6 = 8'b0100000,
                    est7 = 8'b1000000;*/
     parameter est0 = 8'b00000001;
     parameter est1 = 8'b00000010;
     parameter est2 = 8'b00000100;
     parameter est3 = 8'b00001000;
     parameter est4 = 8'b00010000;
     parameter est5 = 8'b00100000;
     parameter est6 = 8'b01000000;
     parameter est7 = 8'b10000000;

//signal declaration
reg [7:0] state_reg, state_next;	//	Guardan el estado actual y el estado futuro, respectivamente.

//state register

always @( posedge clk, posedge reset)
    begin
        if(reset)	// Si hay reset, el estado actual es el estado inicial.
            state_reg <= est0;
        else		//Si no hay reset el estado actual es igual al estado siguiente.
            state_reg <= state_next;
    end

//next-state logic and output logic

always @*
    begin
    state_next = state_reg; // default state : the same

    //declaration of default outputs.
   // reset_reg_cordic = 0;
    enab_RB1 = 0;
    enab_RB2 = 0;
    enab_RB3 = 0;
    enab_cont_var  = 0;
    enab_cont_iter = 0;
    enab_d_ff5_data_out = 0;
    ready_CORDIC = 0;
    beg_add_subt = 0;

    case(state_reg)

    est0:
    begin
//      reset_reg_cordic = 1'b1;
      enab_RB1 = 1'b1;
      if(beg_FSM_CORDIC) begin
        state_next = est1;
      end else begin
        state_next = est0;
      end
    end

		est1:
		begin
      enab_RB1 = 1'b1;
			state_next = est2;
		end

    est2:
    begin
      enab_RB2 = 1'b1;
			if(exception) begin
				state_next = est0;
			end else begin
				state_next = est3;
      end
    end

    est3:
    begin
      enab_RB3 = 1'b1;
			state_next = est4;
    end

    est4:
    begin
      enab_cont_var = 1'b1; //cont_var++
      beg_add_subt = 1'b1;
      if (max_tick_var) begin
        state_next = est5;
      end else begin
        state_next = est4;
      end
    end

    est5:
    begin
      beg_add_subt = 1'b1;
      if (enab_dff_z) begin
        state_next = est6;
      end else begin
        state_next = est5;
      end
    end

    est6:
    begin
      enab_cont_iter = 1'b1; //cont_iter++
      enab_cont_var = 1'b1; //rst cont to from 3 to 0

      if (max_tick_iter) begin
        state_next = est7; //Es la ultima iteracion, por lo tanto, seguimos a la siguiente etapa
        enab_d_ff5_data_out = 1;
      end else begin
        state_next = est2; //Seguir las iteraciones
        //
      end
    end

    est7:
    begin
      ready_CORDIC = 1'b1;
      enab_d_ff5_data_out = 1'b1;
      if(ACK_FSM_CORDIC) begin
        state_next = est0;
      end else begin
        state_next = est7;
      end
    end

    default :
      begin
        state_next = est0;
      end

    endcase
  end
endmodule
