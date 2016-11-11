
`ifndef _HRFP_DEFS
 `define _HRFP_DEFS

// This is the format of the HRFP_16 number format.
`define MSBBIT 35
`define SIGN [35]
// The IS_NAN_OR_INF bit is part of the EXPONENT field internally as
// it simplifies some calculations.
`define EXPONENT [34:27] 
`define IS_NAN_OR_INF [34]
`define HRFP_IS_NAN [33]
`define MANTISSA [26:0]

`define EXPONENTBITS 8
`define MANTISSABITS 27

`timescale 1ns / 1ps



// Experimental support to remove support for subnormal numbers in the
// multiplier.
`define MULT_SUBNORMALS

// Enable the following if you want to synthesize the adder for area in a
// Series-7 FPGA as it otherwise will most likely consume too many
// LUTs due to HOLD DELAY LUTs....
// `define IDDR_HACK_FOR_AREA

`endif
