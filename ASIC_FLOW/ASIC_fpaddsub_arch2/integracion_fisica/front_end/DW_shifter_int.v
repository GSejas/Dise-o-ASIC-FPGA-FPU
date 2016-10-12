module DW_shifter_inst( inst_data_in, inst_data_tc, inst_sh, 
                        inst_sh_tc, inst_sh_mode, data_out_inst );

  parameter data_width = 8;
  parameter sh_width = 3;
  parameter inv_mode = 0;
  input [data_width-1 : 0] inst_data_in;
  input inst_data_tc;
  input [sh_width-1 : 0] inst_sh;
  input inst_sh_tc;
  input inst_sh_mode;
  output [data_width-1 : 0] data_out_inst;

  // Instance of DW_shifter
  DW_shifter #(data_width, sh_width)
    U1 ( .data_in(inst_data_in),   .data_tc(inst_data_tc),   .sh(inst_sh),
         .sh_tc(inst_sh_tc),   .sh_mode(inst_sh_mode),
         .data_out(data_out_inst) );

endmodule

