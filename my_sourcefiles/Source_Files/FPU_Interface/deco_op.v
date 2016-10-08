`timescale 1ns / 1ps

module deco_op
(
input wire [1:0] operation,
output reg op_mod_add_subt,
output reg op_mod_cordic
);
always @*
    begin
        case(operation)
            2'b00:
            begin
                op_mod_add_subt = 1'b0;
                op_mod_cordic = 1'b0;
            end
            2'b01:
            begin
                op_mod_add_subt = 1'b1;
                op_mod_cordic = 1'b0;
            end
            2'b10:
            begin
                op_mod_add_subt = 1'b0;
                op_mod_cordic = 1'b0;
            end
            2'b11:
            begin
                op_mod_add_subt = 1'b0;
                op_mod_cordic = 1'b1;
            end
            default:
            begin
                op_mod_add_subt = 1'b0;
                op_mod_cordic = 1'b0;
            end
        endcase
    end
endmodule
