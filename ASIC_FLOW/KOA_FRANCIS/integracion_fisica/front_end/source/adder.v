module adder
    # (parameter W = 32) (
    input wire [W-1:0] Data_A_i,
    input wire [W-1:0] Data_B_i,
    output reg [W:0] Data_S_o
    );

    always @*
        Data_S_o <= Data_A_i + Data_B_i;

endmodule
