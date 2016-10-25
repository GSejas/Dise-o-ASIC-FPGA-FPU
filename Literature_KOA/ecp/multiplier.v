`ifndef __MUL_V__
`define __MUL_V__
//`include "ks233.v"
//`include "mod.v"

module multiplier(a, b, d);
input wire [232:0] a;
input wire [232:0] b;
output wire [232:0] d;
wire [464:0] mout;

ks233 ks(a, b, mout);
mod   mod1(mout, d);

endmodule
`endif
