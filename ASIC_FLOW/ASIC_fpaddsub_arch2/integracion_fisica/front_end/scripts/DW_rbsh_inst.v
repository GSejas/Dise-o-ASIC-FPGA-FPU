module DW_rbsh_inst #(parameter SWR = 8, parameter EWR = 3) ( Data_i, Shift_Value_i, inst_SH_TC, Data_o );
//Barrel Shifter with Preferred Right Direction

input [SWR-1 : 0] Data_i;
input [EWR-1 : 0] Shift_Value_i;
input inst_SH_TC;
output [SWR-1 : 0] Data_o;

    // Instance of DW_rbsh
    DW_rbsh #(SWR, EWR) U1 (
			.A(Data_i),
			.SH(Shift_Value_i),
			.SH_TC(inst_SH_TC),
			.B(Data_o) );

endmodule
