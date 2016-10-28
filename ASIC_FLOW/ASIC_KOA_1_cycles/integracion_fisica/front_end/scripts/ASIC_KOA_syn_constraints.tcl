####################################################################################################################################

#Institución:                          Instituto Tecnológico de Costa Rica

#Realizado por:		   Jorge Sequeira Rojas

#Proyecto:
#Herramienta:        Design Compiler
#Fecha de creación:


########Definición de las variables a utilizar###########

set LIB_NAME scx3_cmos8rf_lpvt_tt_1p2v_25c.db

set CLK_PERIOD 9.5
set CLK_NAME clk

#set CLK_2_NAME divisor_frecuencia/clk_2

set CLK_UNCERTAINTY_SETUP 0.5
set CLK_UNCERTAINTY_HOLD 0
set CLK_TRANSITION 0.5
set CLK_LATENCY_SOURCE 0.5
set CLK_LATENCY 0.5

# set the "input valid" delay to 
set INPUT_DELAY_MAX 3
#set the fastest input data arrival time to check for hold time changes to 1000pS
set INPUT_DELAY_MIN 2


# set the setup time requirements for the next block to 
set OUTPUT_DELAY_MAX 0
# set the hold time requirements for the next block to 
set OUTPUT_DELAY_MIN -3

set MAX_AREA 0
set FANOUT 10

set ALL_OUT_NAME [all_outputs]
set ALL_IN_EX_CLK_NAME [remove_from_collection [all_inputs] [get_ports $CLK_NAME]]
set INPUT_CELL TBUFX20TS

#########################################################################################################


##########################Configuación del reloj clk   ##################################################
#Se configura el clock a una frecuencia de 50 Khz                                        -> page 5-8
create_clock -period $CLK_PERIOD [get_ports $CLK_NAME]

#No colocar buffers en la red del reloj siempre y cuando los flip-flops cargen en alto
set_dont_touch_network [get_clocks $CLK_NAME]

#Configuración de clock skew (retardos entre las diferentes ramificaciones del reloj)    -> page 5-11, 7-21
set_clock_uncertainty -setup $CLK_UNCERTAINTY_SETUP [get_clocks $CLK_NAME]
set_clock_uncertainty -hold $CLK_UNCERTAINTY_HOLD [get_clocks $CLK_NAME]

#Configuración del retardo de transición del clock					 -> page 5-13
set_clock_transition $CLK_TRANSITION [get_clocks $CLK_NAME]

#Configuración del retardo del clock en la entrada                                       -> page 5-12
set_clock_latency -source $CLK_LATENCY_SOURCE [get_clocks $CLK_NAME]
set_clock_latency $CLK_LATENCY [get_clocks $CLK_NAME]
##########################################################################################################


##########################Configuación del los relojes generados internamente ############################

## reloj clk_2
#create_generated_clock -name $CLK_2_NAME -divide_by 2 -source [get_ports $CLK_NAME] [get_pins #$CLK_2_NAME]
#set_dont_touch_network [get_clocks $CLK_2_NAME]

##########################################################################################################


#Configuración del retardo de todas las señales de entrada, excepto la del clock         -> page 5-19, 7-
set_input_delay -max $INPUT_DELAY_MAX -clock $CLK_NAME $ALL_IN_EX_CLK_NAME
set_input_delay -min $INPUT_DELAY_MIN -clock $CLK_NAME $ALL_IN_EX_CLK_NAME

#Configuración del retardo en las señales de salida				         -> page 5-26, 7-18
set_output_delay -max $OUTPUT_DELAY_MAX -clock $CLK_NAME $ALL_OUT_NAME
set_output_delay -min $OUTPUT_DELAY_MIN -clock $CLK_NAME $ALL_OUT_NAME

#Configuración del fanout
set_max_fanout $FANOUT $current_design

#Optimizar el uso del área
set_max_area $MAX_AREA

#Configuración de la celda que maneja todas las entradas (cell driving inputs)   ------   pg -6-22 Chip Synthesis
set_driving_cell -lib_cell $INPUT_CELL $ALL_IN_EX_CLK_NAME

