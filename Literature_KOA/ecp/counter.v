/******************************************************************************
 * File	Name			: counter.v
 * Package Module Name	: Elliptic Curve Cryptoprocessor for GF(2^233)
 * Author		    	: Chester Rebeiro
 * Date of Creation		: 3/Apr/2008
 * Type	of file			: Verilog source code
 * Synopsis			    : counts down from 233 to 0. When 0 is reached e is
 *                        set to indicate count is done.
 ******************************************************************************/

`ifndef __COUNTER_V__
`define __COUNTER_V__

`define KEYSIZE         32
`define KEYMSB         	31 

/*---------------------------------------------------------------------------
* Module Name	: counter
* Synopsis		: 
* The counter will start from 233 and go downto 0.
* Load counter with nrst low.
* Counter ends when e goes low for one clock cycle.
---------------------------------------------------------------------------*/
module counter (clk, nrst, e);
input wire clk;            /* clock used for the counter */
input wire nrst;           /* active low reset */
output wire e;             /* set to 0 if count = 0 */

reg [7:0] count;           /* ...and the register which actually decrements */

/* activate e when count reaches 0 */
assign e = |count;

always @(posedge clk or negedge nrst) begin
	if(nrst == 1'b0)
		count <= 8'd`KEYMSB;
	else
		count <= count - 1'b1;
end



endmodule
`endif
