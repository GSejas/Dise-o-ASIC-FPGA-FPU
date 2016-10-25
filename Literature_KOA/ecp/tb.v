`include "smul.v"





module tb();

reg  clk;
reg  nrst;
wire done;
reg [31:0] kmem [7:0];
reg [255:0] k; 
wire [232:0] sx, sy;

reg  [232:0] res[1:0];

integer i;

initial begin
	$readmemh("../../scratch/tv.txt", kmem);
#50
	for(i=0; i<8; i = i+1) begin
		$display("%d %h\n", i, kmem[i]);
	end
	k = {kmem[0], kmem[1], kmem[2], kmem[3], kmem[4], kmem[5], kmem[6], kmem[7]};
//	k = `KEYSIZE'hC7;
	$display("%h\n", k[`KEYSIZE - 1:0]);
	clk = 1'b0;
	nrst = 1'b1;
#10	nrst = 1'b0;
#110 nrst = 1'b1;
#100000
	$display("%h\n%h", sx, sy);
	res[0] = sx;
	res[1] = sy;
#1
	$writememh("../../scratch/res_verilog.txt", res);
	$finish;
end

initial 
begin
	$dumpfile ("dump.vcd");
	$dumpvars;
	$dumpon;
#100000	$dumpoff;
end

ecsmul ec_mul(clk, nrst, k[`KEYMSB:0], sx, sy, done);

always begin
#100 clk =~clk;
end 

endmodule


