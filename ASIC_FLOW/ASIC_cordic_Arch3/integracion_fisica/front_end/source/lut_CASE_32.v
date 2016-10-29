// This is a simple example.
// You can make a your own template file and set its path to settings.
// (Preferences > Package Settings > Verilog Gadget > Settings - User)
//
//    "templates": [
//      [ "Default", "Packages/Verilog Gadget/template/verilog_template_default.v" ],
//      [ "FSM", "D:/template/verilog_fsm_template.v" ]
//    ]

module LUT_CASE_32bits #(parameter W=32,N=3)
(
//Input Signals
input wire [N-1:0] address,
//Output Signals
output reg [W-1:0] data_out
);

always @(*) begin

   case (address)
          4'd0 : begin
          data_out =32'h3f490fdb;
          end
          4'd1 : begin
          data_out =32'h3eed6338;
          end
          4'd2 : begin
          data_out =32'h3e7adbb0;
          end
          4'd3 : begin
          data_out =32'h3dfeadd5;
          end
          4'd4 : begin
          data_out =32'h3d7faade;
          end
          4'd5 : begin
          data_out =32'h3cffeaae;
          end
          4'd6 : begin
          data_out =32'h3c7ffaab;
          end
          4'd7 : begin
          data_out =32'h3bfffeab;
          end
          4'd8 : begin
          data_out =32'h3b7fffab;
          end
          4'd9 : begin
          data_out =32'h3affffeb;
          end
          4'd10 : begin
          data_out =32'h3a7ffffb;
          end
          4'd11 : begin
          data_out =32'h39ffffff;
          end
          4'd12 : begin
          data_out =32'h39800000;
          end
          4'd13 : begin
          data_out =32'h39000000;
         end
          4'd14 : begin
          data_out =32'h38800000;
          end
          4'd15 : begin
          data_out =32'h38000000;
          end
          default: begin
          data_out =32'h3f490fdb;
          end
   endcase

end

endmodule // template
