`timescale 1ns / 1ps

module counter_d #(parameter W=4)
(
input wire clk,
input wire rst,
input wire load,
input wire enable,
input wire [W-1:0] d,
output wire max_tick,
output wire min_tick,
output wire [W-1:0] q
);
reg [W-1:0] count;
always @(posedge clk, posedge rst)
begin
	if (rst)
		count <= 0;
	else if (enable)
	begin
		if (load)
		begin
			count <= d;
		end
		else
			count <= count + 1'b1;
	end
end
assign q = count;
assign max_tick = (count == 2**W-1) ? 1'b1 : 1'b0;
assign min_tick = (count == 0) ? 1'b1 : 1'b0;
endmodule
