// This is a simple example.
// You can make a your own template file and set its path to settings.
// (Preferences > Package Settings > Verilog Gadget > Settings - User)
//
//    "templates": [
//      [ "Default", "Packages/Verilog Gadget/template/verilog_template_default.v" ],
//      [ "FSM", "D:/template/verilog_fsm_template.v" ]
//    ]

module LUT_CASE_64bits #(parameter W=64,N=4)
(
//Input Signals
input wire [N-1:0] address,
//Output Signals
output reg [W-1:0] data_out
);

always @(*) begin

   case (address)
          4'd0 : begin
          data_out =64'h3fe921fb54442d18;
          end
          4'd1 : begin
          data_out =64'h3fddac670561bb4f;
          end
          4'd2 : begin
          data_out =64'h3fcf5b75f92c80dd;
          end
          4'd3 : begin
          data_out =64'h3fbfd5ba9aac2f6e;
          end
          4'd4 : begin
          data_out =64'h3faff55bb72cfdea;
          end
          4'd5 : begin
          data_out =64'h3f9ffd55bba97625;
          end
          4'd6 : begin
          data_out =64'h3f8fff555bbb729b;
          end
          4'd7 : begin
          data_out =64'h3f7fffd555bbba97;
          end
          4'd8 : begin
          data_out =64'h3f6ffff5555bbbb7;
          end
          4'd9 : begin
          data_out =64'h3f5ffffd5555bbbc;
          end
          4'd10 : begin
          data_out =64'h3f4fffff55555bbc;
          end
          4'd11 : begin
          data_out =64'h3f3fffffd55555bc;
          end
          4'd12 : begin
          data_out =64'h3f2ffffff555555c;
          end
          4'd13 : begin
          data_out =64'h3f1ffffffd555556;
          end
          4'd14 : begin
          data_out =64'h3f0fffffff555555;
          end
          4'd15 : begin
          data_out =64'h3effffffffd55555;
          end
          default: begin
          data_out =64'h3fe921fb54442d18;
          end
   endcase

end

endmodule // template
