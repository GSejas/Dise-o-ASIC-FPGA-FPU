
`timescale 1ns/1ps

module tb_LUT_ROM_32bits (); /* this is automatically generated */
	
	parameter W         = 32;
	parameter N         = 3;
	localparam ROM_FILE = "LUT_sincos_32.txt";

	reg [N-1:0] address;
	wire [W-1:0] data_out;

	LUT_ROM_32bits #(.W(W), .N(N)) inst_LUT_ROM_32bits (.address(address), .data_out(data_out));


	// // clock
	// initial begin
	// 	clk = 0;
	// 	forever #5 clk = ~clk;
	// end

	// reset
	initial begin
		#10;
		address = 0;
		#10;
		repeat (16) begin
			#10 address = address + 1;
		end
		$finish;

		// rstb = 0;
		// srst = 0;
		// #20
		// rstb = 1;
		// repeat (5) @(posedge clk);
		// srst = 1;
		// repeat (1) @(posedge clk);
		// srst = 0;
	end

	// (*NOTE*) replace reset, clock


	// initial begin
	// 	// do something

	// 	repeat(10)@(posedge clk);
	// 	$finish;
	// end

	// // dump wave
	// initial begin
	// 	$fsdbDumpfile("tb_LUT_ROM_32bits.fsdb");
	// 	$fsdbDumpvars(0, "tb_LUT_ROM_32bits", "+mda");
	// end

endmodule
