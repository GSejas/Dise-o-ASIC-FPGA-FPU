`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:28:50 05/03/2008
// Design Name:   ecsmul
// Module Name:   tb1.v
// Project Name:  smul_sca
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ecsmul
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb1_v;

	// Inputs
	reg clk;
	reg nrst;
	reg [31:0]key;

	// Outputs
	wire [232:0] sx;
	wire [232:0] sy;
	wire done;

	// Instantiate the Unit Under Test (UUT)
	ecsmul uut (
		.clk(clk), 
		.nrst(nrst), 
		.key(key), 
		.sx(sx), 
		.sy(sy), 
		.done(done)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		key = 32'hFFFF0000; // B9B9B9B9;
		nrst = 1'b1;


		// Wait 100 ns for global reset to finish
		#200;
		// Add stimulus here
		#10	nrst = 1'b0;
		#110 	nrst = 1'b1;
	end

	initial begin
	$dumpfile ("dump.vcd");
	$dumpvars;
	$dumpon;
#100000	$dumpoff;
	end
	
	always begin
	#100 clk =~clk;
	end 

      
endmodule

