// I don't support Spartan-6 any longer, but if someone wants to adapt
// this code for Spartan-6 again the following file may be useful.
//
// (Actually, the HRFP_16 format would be quite useful in a Spartan-6
// as the 18x18 bit multiplier in Spartan-6 lends itself well to the
// HRFP_16 format as compared to normal IEEE-754 format since no extra
// DSP blocks are required in the HRFP_16 case.)
module mult_35x35(input wire clk,
		  input wire [34:0]  opa, opb,
		  output wire [69:0] res);

   parameter LATENCY = 8;

   initial begin
      case(LATENCY)
	6: $display("%m: Latency is 6. OK!");
	8: $display("%m: Latency is 8. OK!");
	default: begin
	   $display("%m: Unknown latency %d. Aborting", LATENCY);
	   $stop;
	end
      endcase
   end
   
   

   // This is based on Fig 1-17 in UG389 SPARTAN-6 DSP48A1 Slice user guide
   
   // LOWLOW: A low, B low
   // HIGHLOW: A high, B low
   // LOWHIGH: A low, B high
   // HIGHHIGH: A high, B high

   wire [47:0] 			     lowlow_p,lowlow_pcout, highlow_p, highlow_pcout, highhigh_p, lowhigh_p;
   wire [17:0] 			     lowlow_bcout, highlow_bcout, lowhigh_bcout;
   // slice 1 
   DSP48A1 #(.A0REG(0),
	     .B0REG(0),
	     .A1REG(1),
	     .B1REG(1),
	     .CREG(1),
	     .DREG(1),
	     .MREG(1),
	     .PREG(1),
	     .CARRYINREG(1),
	     .OPMODEREG(1))
     lowlow(.A({1'b0, opa[16:0]}),
	       .B({1'b0, opb[16:0]}),
	       .C(48'b0),
	       .D(18'b0),
	       .P(lowlow_p),
	       .CLK(clk),
	       .OPMODE(8'b00000001), // P = A*B
	       .CEA(1'b1), .CEB(1'b1), .CEC(1'b1), .CED(1'b1), .CEM(1'b1),  .CEP(1'b1),
	       .RSTA(1'b0), .RSTB(1'b0),.RSTC(1'b0),.RSTD(1'b0),.RSTM(1'b0),.RSTP(1'b0),
	    .RSTOPMODE(1'b0),.RSTCARRYIN(1'b0),.CEOPMODE(1'b1),.CARRYIN(1'b0),.M(),.CARRYOUTF(),.CARRYOUT(),.CECARRYIN(1'b1),
	       .BCOUT(lowlow_bcout),
	       .PCIN(48'b0),
	       .PCOUT());

   reg [16:0] 			     lowlow_p1, lowlow_p2, lowlow_p3, lowlow_p4, lowlow_p5, lowhigh_p1, lowhigh_p2;
   reg [34:0] 			     opa1, opb1, opa2, opb2, opa3, opa4;

   always @(posedge clk) begin
      opa1 <= opa;
      opa2 <= opa1;
      opa3 <= opa2;
      opa4 <= opa3;
      opb1 <= opb;
      opb2 <= opb1;
      
      lowlow_p1 <= lowlow_p[16:0];
      lowlow_p2 <= lowlow_p1;
      lowlow_p3 <= lowlow_p2;
      if(LATENCY == 8) begin
	 lowlow_p4 <= lowlow_p3;
	 lowlow_p5 <= lowlow_p4;
      end

      lowhigh_p1 <= lowhigh_p;
      if(LATENCY == 8) begin
	 lowhigh_p2 <= lowhigh_p1;
      end
   end

   generate
      if(LATENCY == 6) begin
	 assign res[16:0] = lowlow_p3[16:0];
	 assign res[33:17] = lowhigh_p1[16:0];
	 assign res[69:34] = highhigh_p[35:0];
      end else if(LATENCY == 8) begin
	 assign res[16:0] = lowlow_p5[16:0];
	 assign res[33:17] = lowhigh_p2[16:0];
	 assign res[69:34] = highhigh_p[35:0];
      end
   endgenerate
      
   


   // slice 2
   DSP48A1 #(.A0REG(1),
	     .B0REG(LATENCY == 8 ? 1 : 0),
	     .A1REG(1),
	     .B1REG(1),
	     .CREG(LATENCY == 8 ? 1 : 0),
	     .DREG(1),
	     .MREG(1),
	     .PREG(1),
	     .CARRYINREG(1),
	     .OPMODEREG(1))
     highlow(.A(LATENCY == 8 ? opa1[34:17] : opa[34:17]),
	       .B(lowlow_bcout),
	       .C({ { 17 {lowlow_p[47]}}, lowlow_p[47:17]}),
	       .D(18'b0),
	       .P(highlow_p),
	       .CLK(clk),
	       .OPMODE(8'b00001101), // P = A*B + C
	       .CEA(1'b1), .CEB(1'b1), .CEC(1'b1), .CED(1'b1), .CEM(1'b1),  .CEP(1'b1),
	       .RSTA(1'b0), .RSTB(1'b0),.RSTC(1'b0),.RSTD(1'b0),.RSTM(1'b0),.RSTP(1'b0),
	    .RSTOPMODE(1'b0),.RSTCARRYIN(1'b0),.CEOPMODE(1'b1),.CARRYIN(1'b0),.M(),.CARRYOUTF(),.CARRYOUT(),.CECARRYIN(1'b1),
	       .BCOUT(),
	       .PCIN(48'b0),
	       .PCOUT(highlow_pcout));

   // slice 3
   DSP48A1 #(.A0REG(1),
	     .B0REG(1),
	     .A1REG(1),
	     .B1REG(1),
	     .CREG(0),
	     .DREG(1),
	     .MREG(1),
	     .PREG(1),
	     .CARRYINREG(1),
	     .OPMODEREG(1))
     lowhigh(.A(LATENCY == 8 ? {1'b0, opa2[16:0]} : {1'b0, opa1[16:0]}),
	       .B(LATENCY == 8 ? opb2[34:17] : opb1[34:17]),
	       .C(48'b0),
	       .D(18'b0),
	       .P(lowhigh_p),
	       .CLK(clk),
	       .OPMODE(8'b00000101), // P = A*B + PCIN
	       .CEA(1'b1), .CEB(1'b1), .CEC(1'b1), .CED(1'b1), .CEM(1'b1),  .CEP(1'b1),
	       .RSTA(1'b0), .RSTB(1'b0),.RSTC(1'b0),.RSTD(1'b0),.RSTM(1'b0),.RSTP(1'b0),
	    .RSTOPMODE(1'b0),.RSTCARRYIN(1'b0),.CEOPMODE(1'b1),.CARRYIN(1'b0),.M(),.CARRYOUTF(),.CARRYOUT(),.CECARRYIN(1'b1),
	       .BCOUT(lowhigh_bcout),
	       .PCIN(highlow_pcout),
	       .PCOUT());

   // slice 4
   DSP48A1 #(.A0REG(LATENCY == 8 ? 1 : 0),
	     .B0REG(LATENCY == 8 ? 1 : 0),
	     .A1REG(1),
	     .B1REG(1),
	     .CREG(LATENCY == 8 ? 1 : 0),
	     .DREG(1),
	     .MREG(1),
	     .PREG(1),
	     .CARRYINREG(1),
	     .OPMODEREG(1))
     highhigh(.A(LATENCY == 8 ? opa4[34:17] : opa3[34:17]),
	       .B(lowhigh_bcout),
	       .C({ {17{lowhigh_p[47]}}, lowhigh_p[47:17]}),
	       .D(18'b0),
	       .P(highhigh_p),
	       .CLK(clk),
	       .OPMODE(8'b00001101), // P = A*B + C
	       .CEA(1'b1), .CEB(1'b1), .CEC(1'b1), .CED(1'b1), .CEM(1'b1),  .CEP(1'b1),
	       .RSTA(1'b0), .RSTB(1'b0),.RSTC(1'b0),.RSTD(1'b0),.RSTM(1'b0),.RSTP(1'b0),
	    .RSTOPMODE(1'b0),.RSTCARRYIN(1'b0),.CEOPMODE(1'b1),.CARRYIN(1'b0),.M(),.CARRYOUTF(),.CARRYOUT(),.CECARRYIN(1'b1),
	       .BCOUT(),
	       .PCIN(48'b0),
	       .PCOUT());
   


endmodule

