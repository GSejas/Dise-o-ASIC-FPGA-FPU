/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : L-2016.03-SP3
// Date      : Tue Oct 11 18:36:59 2016
/////////////////////////////////////////////////////////////


module DW_rbsh_inst ( Data_i, Shift_Value_i, inst_SH_TC, Data_o );
  input [7:0] Data_i;
  input [2:0] Shift_Value_i;
  output [7:0] Data_o;
  input inst_SH_TC;
  wire   n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33,
         n34, n35, n36, n37, n38;

  AO22XLTS U28 ( .A0(Shift_Value_i[1]), .A1(Data_i[7]), .B0(n20), .B1(
        Data_i[5]), .Y(n23) );
  AO22XLTS U29 ( .A0(Shift_Value_i[1]), .A1(Data_i[3]), .B0(n20), .B1(
        Data_i[1]), .Y(n21) );
  AO22XLTS U30 ( .A0(Shift_Value_i[1]), .A1(Data_i[0]), .B0(n20), .B1(
        Data_i[6]), .Y(n24) );
  AO22XLTS U31 ( .A0(Shift_Value_i[1]), .A1(Data_i[4]), .B0(n20), .B1(
        Data_i[2]), .Y(n22) );
  AO22XLTS U32 ( .A0(Shift_Value_i[1]), .A1(Data_i[1]), .B0(n20), .B1(
        Data_i[7]), .Y(n30) );
  AO22XLTS U33 ( .A0(Shift_Value_i[1]), .A1(Data_i[2]), .B0(n20), .B1(
        Data_i[0]), .Y(n31) );
  AO22XLTS U34 ( .A0(Shift_Value_i[1]), .A1(Data_i[5]), .B0(n20), .B1(
        Data_i[3]), .Y(n27) );
  AO22XLTS U35 ( .A0(Shift_Value_i[1]), .A1(Data_i[6]), .B0(n20), .B1(
        Data_i[4]), .Y(n28) );
  AOI22XLTS U36 ( .A0(Shift_Value_i[0]), .A1(n21), .B0(n31), .B1(n29), .Y(n26)
         );
  AOI22XLTS U37 ( .A0(Shift_Value_i[0]), .A1(n24), .B0(n23), .B1(n29), .Y(n38)
         );
  AOI22XLTS U38 ( .A0(Shift_Value_i[0]), .A1(n22), .B0(n21), .B1(n29), .Y(n37)
         );
  AOI22XLTS U39 ( .A0(Shift_Value_i[0]), .A1(n30), .B0(n24), .B1(n29), .Y(n35)
         );
  AOI22XLTS U40 ( .A0(Shift_Value_i[0]), .A1(n27), .B0(n22), .B1(n29), .Y(n34)
         );
  AOI22XLTS U41 ( .A0(Shift_Value_i[0]), .A1(n31), .B0(n30), .B1(n29), .Y(n33)
         );
  AOI22XLTS U42 ( .A0(Shift_Value_i[0]), .A1(n28), .B0(n27), .B1(n29), .Y(n32)
         );
  AOI22XLTS U43 ( .A0(Shift_Value_i[2]), .A1(n38), .B0(n37), .B1(n36), .Y(
        Data_o[1]) );
  AOI22XLTS U44 ( .A0(Shift_Value_i[2]), .A1(n35), .B0(n34), .B1(n36), .Y(
        Data_o[2]) );
  AOI22XLTS U45 ( .A0(Shift_Value_i[2]), .A1(n33), .B0(n32), .B1(n36), .Y(
        Data_o[3]) );
  AOI22XLTS U46 ( .A0(Shift_Value_i[2]), .A1(n26), .B0(n25), .B1(n36), .Y(
        Data_o[4]) );
  AOI22XLTS U47 ( .A0(Shift_Value_i[2]), .A1(n37), .B0(n38), .B1(n36), .Y(
        Data_o[5]) );
  AOI22XLTS U48 ( .A0(Shift_Value_i[2]), .A1(n34), .B0(n35), .B1(n36), .Y(
        Data_o[6]) );
  AOI22XLTS U49 ( .A0(Shift_Value_i[2]), .A1(n32), .B0(n33), .B1(n36), .Y(
        Data_o[7]) );
  AOI22XLTS U50 ( .A0(Shift_Value_i[0]), .A1(n23), .B0(n28), .B1(n29), .Y(n25)
         );
  AOI22XLTS U51 ( .A0(Shift_Value_i[2]), .A1(n25), .B0(n26), .B1(n36), .Y(
        Data_o[0]) );
  INVX2TS U52 ( .A(Shift_Value_i[1]), .Y(n20) );
  INVX2TS U53 ( .A(Shift_Value_i[0]), .Y(n29) );
  INVX2TS U54 ( .A(Shift_Value_i[2]), .Y(n36) );
endmodule

