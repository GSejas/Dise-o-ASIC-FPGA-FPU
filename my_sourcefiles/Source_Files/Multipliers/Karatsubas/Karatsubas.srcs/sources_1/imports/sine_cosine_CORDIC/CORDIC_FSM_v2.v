`timescale 1ns / 1ps

module CORDIC_FSM_v2
(
//Input Signals 
input wire clk,											//	Reloj del sitema.
input wire reset,										//	Reset del sitema.
input wire beg_FSM_CORDIC,								//	Señal de inicio de la maquina de estados.
input wire ACK_FSM_CORDIC,								//	Señal proveniente del modulo que recibe el resultado, indicado que el dato ha sido recibido.
input wire operation,									//	Señal que determina si lo que se requiere es realizar un coseno(1´b0) o seno (1'b1).
input wire exception,
input wire [1:0] shift_region_flag,						//	Señal que indica si el angulo a calcular se encuentra fuera del rango de calculo del algoritmo CORDIC.
input wire [1:0] cont_var,								//	Señal que indica cual varible se va a calcular. Proveniente del contador de variables.
input wire ready_add_subt,								//	Señal proveniente del módulo de suma/resta, indica que se ha terminado la operacion y que se puede disponer del resultado de dicho modulo.
input wire max_tick_iter, min_tick_iter,				//	Señales que indican la maxima y minima cuenta, respectivamente, en el contador de iteraciones.
input wire max_tick_var, min_tick_var,					//	Señales que indican la maxima y minima cuenta, respectivamente, en el contador de variables.

//Output Signals
output reg reset_reg_cordic,
output reg ready_CORDIC,								//	Señal que indica que el calculo CORDIC se ha terminado.
output reg beg_add_subt,								//	Señal que indica al modulo de suma/resta que inicie su operacion.
output reg ack_add_subt,								//	Señal que le indica al modulo de suma/resta que se ha recibido exitosamente el resultado que este entrega.
output reg sel_mux_1, sel_mux_3,						//	Señales de seleccion de mux, la primera escoge el canal 0 si es la primera iteracion, en otro caso escoge el canal 1, y la segunda escoge cual variable (X o Y) debe aparecer a la salida.
output reg [1:0] sel_mux_2,								//	Señal de seleccion de mux, que escoge entre X, Y o Z dependiendo de cual variable se deba calcular en ese momento.
output reg enab_cont_iter, load_cont_iter,				//	Señales de habilitacion y carga, respectivamente, en el contador de iteraciones.
output reg enab_cont_var,  load_cont_var,				//	Señales de habilitacion y carga, respectivamente, en el contador de variables.
output reg enab_RB1, enab_RB2,							//	Señales de habilitacion para los registros de variables de entrada y para los valores de las variables despues de los primeros mux, respectivamente.
output reg enab_d_ff_Xn, enab_d_ff_Yn, enab_d_ff_Zn,	//	Señales de habilitacion para los registros que guardan los resultados de cada variable en cada iteracion provenientes del modulo de suma/resta.
output reg enab_d_ff_out,enab_dff_5,					//	Señales de habilitacion para los registros en la salida, el primero antes del cambio de signo y el segundo es el que se encuentra en la salida.
output reg enab_RB3,
output reg enab_reg_sel_mux1,enab_reg_sel_mux2,enab_reg_sel_mux3
);

//symbolic state declaration
localparam [3:0]    est0 = 4'b0000,
                    est1 = 4'b0001,
                    est2 = 4'b0010,
                    est3 = 4'b0011,
                    est4 = 4'b0100,
                    est5 = 4'b0101, 
                    est6 = 4'b0110,
                    est7 = 4'b0111,
                    est8 = 4'b1000,
                    est9 = 4'b1001,
                    est10 = 4'b1010,
                    est11 = 4'b1011,
					est12 = 4'b1100,
					est13 = 4'b1101;
					

//signal declaration
reg [3:0] state_reg, state_next;	//	Guardan el estado actual y el estado futuro, respectivamente.

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
    ready_CORDIC = 1'b0;
    beg_add_subt = 1'b0;
    ack_add_subt = 1'b0;
    sel_mux_1 = 1'b0;
    sel_mux_2 = 2'b00;
    sel_mux_3 = 1'b0;
    enab_cont_iter = 1'b0;
    load_cont_iter = 1'b0;
    enab_cont_var = 1'b0;
    load_cont_var = 1'b0;
    enab_RB1 = 1'b0;
    enab_RB2 = 1'b0;
    enab_RB3 = 1'b0;
    enab_d_ff_Xn = 1'b0;
    enab_d_ff_Yn = 1'b0;
    enab_d_ff_Zn = 1'b0;
    enab_d_ff_out = 1'b0;
    reset_reg_cordic = 1'b0;
    enab_dff_5 = 1'b0;
    enab_reg_sel_mux1 = 1'b0;
    enab_reg_sel_mux2 = 1'b0;
    enab_reg_sel_mux3 = 1'b0;
    
        case(state_reg)
        est0:
        begin
			reset_reg_cordic = 1'b1;
			enab_reg_sel_mux1 = 1'b1;
            enab_reg_sel_mux2 = 1'b1;
            enab_reg_sel_mux3 = 1'b1;
			state_next = est1;
        end

		est1:
        begin
			if(beg_FSM_CORDIC)
			begin
				state_next = est2;
			end
			else
				state_next = est1;
		end

		est2:
		begin
			enab_RB1 = 1'b1;
			enab_cont_iter = 1'b1;
			load_cont_iter = 1'b1;
			state_next = est3;
		end

        est3:
        begin
            if(min_tick_iter)
				sel_mux_1 =	1'b0;
			else
				sel_mux_1 = 1'b1;
			enab_reg_sel_mux1 = 1'b1;
						
			state_next = est4;
        end

        est4:
        begin
			if(exception)
				state_next = est0;
			else
				state_next = est5;
            enab_RB2 = 1'b1;
        end

        est5:
        begin
			enab_RB3 = 1'b1;
			enab_cont_var = 1'b1;
			load_cont_var = 1'b1;
			state_next = est6;
        end

        est6:
        begin            
			if(max_tick_iter)
			begin
				if(operation == 1'b0)
				begin
					if(shift_region_flag == 2'b00)
						sel_mux_2 = 2'b00;
					else if(shift_region_flag == 2'b01)
						sel_mux_2 = 2'b01;
					else if(shift_region_flag == 2'b10)
						sel_mux_2 = 2'b01;
					else
						sel_mux_2 = 2'b00;
					enab_reg_sel_mux2 = 1'b1;
				end
				
				else
				begin
					if(shift_region_flag == 2'b00)
						sel_mux_2 = 2'b01;
					else if(shift_region_flag == 2'b01)
						sel_mux_2 = 2'b00;
					else if(shift_region_flag == 2'b10)
						sel_mux_2 = 2'b00;
					else
						sel_mux_2 = 2'b01;
					enab_reg_sel_mux2 = 1'b1;
				end
			end
			
			else
				sel_mux_2 = cont_var;
			
			enab_reg_sel_mux2 = 1'b1;	
			state_next = est7;	
        end        
        
        est7:
        begin            
			beg_add_subt = 1'b1;
			state_next = est8;
        end

        est8:
        begin
			if(ready_add_subt)
			begin
				if(max_tick_iter)
				begin
					if(operation == 1'b0)
					begin
						if(shift_region_flag == 2'b00)
							enab_d_ff_Xn = 1'b1;
						else if(shift_region_flag == 2'b01)
							enab_d_ff_Yn = 1'b1;
						else if(shift_region_flag == 2'b10)
							enab_d_ff_Yn = 1'b1;
						else
							enab_d_ff_Xn = 1'b1;
					end
					
					else
					begin
						if(shift_region_flag == 2'b00)
							enab_d_ff_Yn = 1'b1;
						else if(shift_region_flag == 2'b01)
							enab_d_ff_Xn = 1'b1;
						else if(shift_region_flag == 2'b10)
							enab_d_ff_Xn = 1'b1;
						else
							enab_d_ff_Yn = 1'b1;
					end
				end
				
				else
				begin
					if(min_tick_var)
						enab_d_ff_Xn = 1'b1;
					else if(max_tick_var)
						enab_d_ff_Zn = 1'b1;
					else
						enab_d_ff_Yn = 1'b1;
				end
				state_next = est9;
			end
			
			else
				state_next = est8;
        end

        est9:
        begin
			ack_add_subt = 1'b1;
			if(max_tick_iter)
			begin
				state_next = est10;
			end
			else
			begin
				if(max_tick_var)
				begin
					enab_cont_iter = 1'b1;
					state_next = est3;
				end
				
				else
				begin
					enab_cont_var = 1'b1;
					state_next = est6;
				end
			end
        end

        est10:
        begin            
			if(operation == 1'b0)
			begin
				if(shift_region_flag == 2'b00)
					sel_mux_3 = 1'b0;
				else if(shift_region_flag == 2'b01)
					sel_mux_3 = 1'b1;
				else if(shift_region_flag == 2'b10)
					sel_mux_3 = 1'b1;
				else
					sel_mux_3 = 1'b0;
				enab_reg_sel_mux3 = 1'b1;
			end
			
			else
			begin
				if(shift_region_flag == 2'b00)
					sel_mux_3 = 1'b1;
				else if(shift_region_flag == 2'b01)
					sel_mux_3 = 1'b0;
				else if(shift_region_flag == 2'b10)
					sel_mux_3 = 1'b0;
				else
					sel_mux_3 = 1'b1;
				enab_reg_sel_mux3 = 1'b1;
			end
			
			enab_reg_sel_mux3 = 1'b1;
			state_next = est11;
		end	

		est11:
		begin	    
			enab_dff_5 = 1'b1;
			state_next = est12;
		end
		
		est12:
		begin
			enab_d_ff_out = 1'b1;
			state_next = est13;
		end

		est13:
		begin
			ready_CORDIC = 1'b1;
			if(ACK_FSM_CORDIC)
				state_next = est0;
			else
				state_next = est13;
		end
        
        default : state_next = est0;
        endcase
    end
endmodule
