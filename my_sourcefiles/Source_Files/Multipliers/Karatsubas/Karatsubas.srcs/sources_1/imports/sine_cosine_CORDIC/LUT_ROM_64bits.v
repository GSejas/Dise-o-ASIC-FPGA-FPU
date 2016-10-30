`timescale 1ns / 1ps

module LUT_ROM_64bits  #(parameter W=64,N=3)
(
//Input Signals
input wire [N-1:0] address,
//Output Signals
output reg [W-1:0] data_out
);
localparam ROM_FILE="/home/jeffryqf/Dropbox/Proyecto_De_Graduacion/Proyecto_De_Graduacion_2/Proyecto_De_Graduacion/Results_Sim_sincosCORDIC/Archivos_pruebas/LUT_sincos_64.txt";
reg [W-1:0] rom_test [2**N-1:0];
 initial
begin
    $readmemh(ROM_FILE, rom_test, 0, 2**N-1);
end
always @*
begin
    data_out = rom_test[address];
end
endmodule
