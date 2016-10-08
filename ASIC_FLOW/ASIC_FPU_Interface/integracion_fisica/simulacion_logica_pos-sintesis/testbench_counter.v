`timescale 1ns / 1ps

module testbench;

	// Inputs
	reg enable;
	reg clk;
	reg reset;

	// Outputs
	wire [3:0] state;
	wire carry_out;

	// Instantiate the Unit Under Test (UUT)
	counter uut (
		.clk(clk), 
		.enable(enable),
		.reset(reset), 
		.state(state),
		.carry_out(carry_out)
	);

	initial begin
		// Initialize Inputs
		enable = 0;
		clk = 0;
		reset = 0;
		#10 reset = 1;
		#10 reset = 0;

		#20 enable = 1;

		#1000 reset = 1;
		#100 reset = 0;
		#50 $finish;
	end

	always begin
		#5 clk = !clk;
	end
		 
endmodule

