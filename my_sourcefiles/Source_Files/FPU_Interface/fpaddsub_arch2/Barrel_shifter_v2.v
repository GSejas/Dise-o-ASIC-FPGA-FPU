

module Barrel_Shifter
    #(parameter SWR=26, parameter EWR=5)
    (
    
        input wire clk,
    input wire rst,
    input wire load_i,
    input wire [EWR-1:0] Shift_Value_i,
    input wire [SWR-1:0] Shift_Data_i,
    input wire Left_Right_i,
    input wire Bit_Shift_i,
    /////////////////////////////////////////////7
    output wire [SWR-1:0] N_mant_o
    );
////ge
wire [SWR-1:0] Data_array[EWR+1:0];

//////////////////7
genvar k;//Level
///////////////////77777


	Rotate_Mux_Array #(.SWR(SWR)) first_rotate(
		.Data_i(Shift_Data_i),
		.select_i(Left_Right_i),
		.Data_o(Data_array [0][SWR-1:0])
		);
	
	generate for (k=0; k < EWR; k=k+1) begin : SHIFT_1LVLS
		genvar j;
		for (j=0; j<=SWR-1 ; j=j+1) begin
			localparam integer sh=(2**LEVEL)+j; //value for second mux input. It changes in exponentation by 2 for each level
			case (sh>SWR-1)
				1'b1:begin
			 			assign Data_array[k+1][j] = (Shift_Value_i[k]) ? Bit_Shift_i : Data_array[k][j];
					end
				1'b0:begin
						assign Data_array[k+1][j] = (Shift_Value_i[k]) ? Data_array[k][sh] : Data_array[k][j];
					end
				endcase
			end
	endgenerate
	
	
	genvar j;//Create a variable for the loop FOR
	generate for (j=0; j <= SWR-1; j=j+1) begin : MUX_ARRAY

		case (j)

			SWR-1-j:begin : MUX_ARRAY11
				assign Data_o[j]=Data_array[EWR+1][SWR-1-j];
				end

			default:begin : MUX_ARRAY12
			Multiplexer_AC #(.W(1)) rotate_mux(
	  		    .ctrl(Left_Right_i),
	  		    .D0 (Data_array[EWR+1][j]),
	  		    .D1 (Data_array[EWR+1][SWR-1-j]),
	  		    .S (Data_o[j])
			    );
				end
			endcase
		end
	endgenerate

	RegisterAdd #(.W(SWR)) Mid_Reg(
		  .clk(clk),
		  .rst(rst),
		  .load(load_i),
		  .D(Data_o),
		  .Q(N_mant_o)
		  );
        
        
endmodule
