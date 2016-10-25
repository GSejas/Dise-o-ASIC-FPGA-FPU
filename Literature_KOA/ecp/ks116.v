/******************************************************************************
 * File	Name			: ks116.v
 * Package Module Name	: Elliptic Curve Cryptoprocessor for GF(2^233)
 * Author		    	: Chester Rebeiro
 * Date of Creation		: 1/Apr/2008
 * Type	of file			: Verilog source code
 * Synopsis			    : Automatically generated code for karatsuba 116 bit
 ******************************************************************************/

`ifndef __KS_116_V__
`define __KS_116_V__
//`include "ks58.v"
module ks116(a, b, d);

input wire [115:0] a;
input wire [115:0] b;
output wire [230:0] d;

wire [114:0] m1;
wire [114:0] m2;
wire [114:0] m3;
wire [57:0] ahl;
wire [57:0] bhl;

ks58 ksm1(a[57:0], b[57:0], m2);
ks58 ksm2(a[115:58], b[115:58], m1);
assign ahl[57:0] = a[115:58] ^ a[57:0];
assign bhl[57:0] = b[115:58] ^ b[57:0];
ks58 ksm3(ahl, bhl, m3);

assign  d[00] = m2[00];   
assign  d[01] = m2[01];   
assign  d[02] = m2[02];   
assign  d[03] = m2[03];   
assign  d[04] = m2[04];   
assign  d[05] = m2[05];   
assign  d[06] = m2[06];   
assign  d[07] = m2[07];   
assign  d[08] = m2[08];   
assign  d[09] = m2[09];   
assign  d[10] = m2[10];   
assign  d[11] = m2[11];   
assign  d[12] = m2[12];   
assign  d[13] = m2[13];   
assign  d[14] = m2[14];   
assign  d[15] = m2[15];   
assign  d[16] = m2[16];   
assign  d[17] = m2[17];   
assign  d[18] = m2[18];   
assign  d[19] = m2[19];   
assign  d[20] = m2[20];   
assign  d[21] = m2[21];   
assign  d[22] = m2[22];   
assign  d[23] = m2[23];   
assign  d[24] = m2[24];   
assign  d[25] = m2[25];   
assign  d[26] = m2[26];   
assign  d[27] = m2[27];   
assign  d[28] = m2[28];   
assign  d[29] = m2[29];   
assign  d[30] = m2[30];   
assign  d[31] = m2[31];   
assign  d[32] = m2[32];   
assign  d[33] = m2[33];   
assign  d[34] = m2[34];   
assign  d[35] = m2[35];   
assign  d[36] = m2[36];   
assign  d[37] = m2[37];   
assign  d[38] = m2[38];   
assign  d[39] = m2[39];   
assign  d[40] = m2[40];   
assign  d[41] = m2[41];   
assign  d[42] = m2[42];   
assign  d[43] = m2[43];   
assign  d[44] = m2[44];   
assign  d[45] = m2[45];   
assign  d[46] = m2[46];   
assign  d[47] = m2[47];   
assign  d[48] = m2[48];   
assign  d[49] = m2[49];   
assign  d[50] = m2[50];   
assign  d[51] = m2[51];   
assign  d[52] = m2[52];   
assign  d[53] = m2[53];   
assign  d[54] = m2[54];   
assign  d[55] = m2[55];   
assign  d[56] = m2[56];   
assign  d[57] = m2[57];   
assign  d[58] = m2[58] ^ m1[00] ^ m2[00] ^ m3[00];   
assign  d[59] = m2[59] ^ m1[01] ^ m2[01] ^ m3[01];   
assign  d[60] = m2[60] ^ m1[02] ^ m2[02] ^ m3[02];   
assign  d[61] = m2[61] ^ m1[03] ^ m2[03] ^ m3[03];   
assign  d[62] = m2[62] ^ m1[04] ^ m2[04] ^ m3[04];   
assign  d[63] = m2[63] ^ m1[05] ^ m2[05] ^ m3[05];   
assign  d[64] = m2[64] ^ m1[06] ^ m2[06] ^ m3[06];   
assign  d[65] = m2[65] ^ m1[07] ^ m2[07] ^ m3[07];   
assign  d[66] = m2[66] ^ m1[08] ^ m2[08] ^ m3[08];   
assign  d[67] = m2[67] ^ m1[09] ^ m2[09] ^ m3[09];   
assign  d[68] = m2[68] ^ m1[10] ^ m2[10] ^ m3[10];   
assign  d[69] = m2[69] ^ m1[11] ^ m2[11] ^ m3[11];   
assign  d[70] = m2[70] ^ m1[12] ^ m2[12] ^ m3[12];   
assign  d[71] = m2[71] ^ m1[13] ^ m2[13] ^ m3[13];   
assign  d[72] = m2[72] ^ m1[14] ^ m2[14] ^ m3[14];   
assign  d[73] = m2[73] ^ m1[15] ^ m2[15] ^ m3[15];   
assign  d[74] = m2[74] ^ m1[16] ^ m2[16] ^ m3[16];   
assign  d[75] = m2[75] ^ m1[17] ^ m2[17] ^ m3[17];   
assign  d[76] = m2[76] ^ m1[18] ^ m2[18] ^ m3[18];   
assign  d[77] = m2[77] ^ m1[19] ^ m2[19] ^ m3[19];   
assign  d[78] = m2[78] ^ m1[20] ^ m2[20] ^ m3[20];   
assign  d[79] = m2[79] ^ m1[21] ^ m2[21] ^ m3[21];   
assign  d[80] = m2[80] ^ m1[22] ^ m2[22] ^ m3[22];   
assign  d[81] = m2[81] ^ m1[23] ^ m2[23] ^ m3[23];   
assign  d[82] = m2[82] ^ m1[24] ^ m2[24] ^ m3[24];   
assign  d[83] = m2[83] ^ m1[25] ^ m2[25] ^ m3[25];   
assign  d[84] = m2[84] ^ m1[26] ^ m2[26] ^ m3[26];   
assign  d[85] = m2[85] ^ m1[27] ^ m2[27] ^ m3[27];   
assign  d[86] = m2[86] ^ m1[28] ^ m2[28] ^ m3[28];   
assign  d[87] = m2[87] ^ m1[29] ^ m2[29] ^ m3[29];   
assign  d[88] = m2[88] ^ m1[30] ^ m2[30] ^ m3[30];   
assign  d[89] = m2[89] ^ m1[31] ^ m2[31] ^ m3[31];   
assign  d[90] = m2[90] ^ m1[32] ^ m2[32] ^ m3[32];   
assign  d[91] = m2[91] ^ m1[33] ^ m2[33] ^ m3[33];   
assign  d[92] = m2[92] ^ m1[34] ^ m2[34] ^ m3[34];   
assign  d[93] = m2[93] ^ m1[35] ^ m2[35] ^ m3[35];   
assign  d[94] = m2[94] ^ m1[36] ^ m2[36] ^ m3[36];   
assign  d[95] = m2[95] ^ m1[37] ^ m2[37] ^ m3[37];   
assign  d[96] = m2[96] ^ m1[38] ^ m2[38] ^ m3[38];   
assign  d[97] = m2[97] ^ m1[39] ^ m2[39] ^ m3[39];   
assign  d[98] = m2[98] ^ m1[40] ^ m2[40] ^ m3[40];   
assign  d[99] = m2[99] ^ m1[41] ^ m2[41] ^ m3[41];   
assign  d[100] = m2[100] ^ m1[42] ^ m2[42] ^ m3[42];   
assign  d[101] = m2[101] ^ m1[43] ^ m2[43] ^ m3[43];   
assign  d[102] = m2[102] ^ m1[44] ^ m2[44] ^ m3[44];   
assign  d[103] = m2[103] ^ m1[45] ^ m2[45] ^ m3[45];   
assign  d[104] = m2[104] ^ m1[46] ^ m2[46] ^ m3[46];   
assign  d[105] = m2[105] ^ m1[47] ^ m2[47] ^ m3[47];   
assign  d[106] = m2[106] ^ m1[48] ^ m2[48] ^ m3[48];   
assign  d[107] = m2[107] ^ m1[49] ^ m2[49] ^ m3[49];   
assign  d[108] = m2[108] ^ m1[50] ^ m2[50] ^ m3[50];   
assign  d[109] = m2[109] ^ m1[51] ^ m2[51] ^ m3[51];   
assign  d[110] = m2[110] ^ m1[52] ^ m2[52] ^ m3[52];   
assign  d[111] = m2[111] ^ m1[53] ^ m2[53] ^ m3[53];   
assign  d[112] = m2[112] ^ m1[54] ^ m2[54] ^ m3[54];   
assign  d[113] = m2[113] ^ m1[55] ^ m2[55] ^ m3[55];   
assign  d[114] = m2[114] ^ m1[56] ^ m2[56] ^ m3[56];   
assign  d[115] = m1[57] ^ m2[57] ^ m3[57];   
assign  d[116] = m1[58] ^ m2[58] ^ m3[58] ^ m1[00];   
assign  d[117] = m1[59] ^ m2[59] ^ m3[59] ^ m1[01];   
assign  d[118] = m1[60] ^ m2[60] ^ m3[60] ^ m1[02];   
assign  d[119] = m1[61] ^ m2[61] ^ m3[61] ^ m1[03];   
assign  d[120] = m1[62] ^ m2[62] ^ m3[62] ^ m1[04];   
assign  d[121] = m1[63] ^ m2[63] ^ m3[63] ^ m1[05];   
assign  d[122] = m1[64] ^ m2[64] ^ m3[64] ^ m1[06];   
assign  d[123] = m1[65] ^ m2[65] ^ m3[65] ^ m1[07];   
assign  d[124] = m1[66] ^ m2[66] ^ m3[66] ^ m1[08];   
assign  d[125] = m1[67] ^ m2[67] ^ m3[67] ^ m1[09];   
assign  d[126] = m1[68] ^ m2[68] ^ m3[68] ^ m1[10];   
assign  d[127] = m1[69] ^ m2[69] ^ m3[69] ^ m1[11];   
assign  d[128] = m1[70] ^ m2[70] ^ m3[70] ^ m1[12];   
assign  d[129] = m1[71] ^ m2[71] ^ m3[71] ^ m1[13];   
assign  d[130] = m1[72] ^ m2[72] ^ m3[72] ^ m1[14];   
assign  d[131] = m1[73] ^ m2[73] ^ m3[73] ^ m1[15];   
assign  d[132] = m1[74] ^ m2[74] ^ m3[74] ^ m1[16];   
assign  d[133] = m1[75] ^ m2[75] ^ m3[75] ^ m1[17];   
assign  d[134] = m1[76] ^ m2[76] ^ m3[76] ^ m1[18];   
assign  d[135] = m1[77] ^ m2[77] ^ m3[77] ^ m1[19];   
assign  d[136] = m1[78] ^ m2[78] ^ m3[78] ^ m1[20];   
assign  d[137] = m1[79] ^ m2[79] ^ m3[79] ^ m1[21];   
assign  d[138] = m1[80] ^ m2[80] ^ m3[80] ^ m1[22];   
assign  d[139] = m1[81] ^ m2[81] ^ m3[81] ^ m1[23];   
assign  d[140] = m1[82] ^ m2[82] ^ m3[82] ^ m1[24];   
assign  d[141] = m1[83] ^ m2[83] ^ m3[83] ^ m1[25];   
assign  d[142] = m1[84] ^ m2[84] ^ m3[84] ^ m1[26];   
assign  d[143] = m1[85] ^ m2[85] ^ m3[85] ^ m1[27];   
assign  d[144] = m1[86] ^ m2[86] ^ m3[86] ^ m1[28];   
assign  d[145] = m1[87] ^ m2[87] ^ m3[87] ^ m1[29];   
assign  d[146] = m1[88] ^ m2[88] ^ m3[88] ^ m1[30];   
assign  d[147] = m1[89] ^ m2[89] ^ m3[89] ^ m1[31];   
assign  d[148] = m1[90] ^ m2[90] ^ m3[90] ^ m1[32];   
assign  d[149] = m1[91] ^ m2[91] ^ m3[91] ^ m1[33];   
assign  d[150] = m1[92] ^ m2[92] ^ m3[92] ^ m1[34];   
assign  d[151] = m1[93] ^ m2[93] ^ m3[93] ^ m1[35];   
assign  d[152] = m1[94] ^ m2[94] ^ m3[94] ^ m1[36];   
assign  d[153] = m1[95] ^ m2[95] ^ m3[95] ^ m1[37];   
assign  d[154] = m1[96] ^ m2[96] ^ m3[96] ^ m1[38];   
assign  d[155] = m1[97] ^ m2[97] ^ m3[97] ^ m1[39];   
assign  d[156] = m1[98] ^ m2[98] ^ m3[98] ^ m1[40];   
assign  d[157] = m1[99] ^ m2[99] ^ m3[99] ^ m1[41];   
assign  d[158] = m1[100] ^ m2[100] ^ m3[100] ^ m1[42];   
assign  d[159] = m1[101] ^ m2[101] ^ m3[101] ^ m1[43];   
assign  d[160] = m1[102] ^ m2[102] ^ m3[102] ^ m1[44];   
assign  d[161] = m1[103] ^ m2[103] ^ m3[103] ^ m1[45];   
assign  d[162] = m1[104] ^ m2[104] ^ m3[104] ^ m1[46];   
assign  d[163] = m1[105] ^ m2[105] ^ m3[105] ^ m1[47];   
assign  d[164] = m1[106] ^ m2[106] ^ m3[106] ^ m1[48];   
assign  d[165] = m1[107] ^ m2[107] ^ m3[107] ^ m1[49];   
assign  d[166] = m1[108] ^ m2[108] ^ m3[108] ^ m1[50];   
assign  d[167] = m1[109] ^ m2[109] ^ m3[109] ^ m1[51];   
assign  d[168] = m1[110] ^ m2[110] ^ m3[110] ^ m1[52];   
assign  d[169] = m1[111] ^ m2[111] ^ m3[111] ^ m1[53];   
assign  d[170] = m1[112] ^ m2[112] ^ m3[112] ^ m1[54];   
assign  d[171] = m1[113] ^ m2[113] ^ m3[113] ^ m1[55];   
assign  d[172] = m1[114] ^ m2[114] ^ m3[114] ^ m1[56];   
assign  d[173] = m1[57];   
assign  d[174] = m1[58];   
assign  d[175] = m1[59];   
assign  d[176] = m1[60];   
assign  d[177] = m1[61];   
assign  d[178] = m1[62];   
assign  d[179] = m1[63];   
assign  d[180] = m1[64];   
assign  d[181] = m1[65];   
assign  d[182] = m1[66];   
assign  d[183] = m1[67];   
assign  d[184] = m1[68];   
assign  d[185] = m1[69];   
assign  d[186] = m1[70];   
assign  d[187] = m1[71];   
assign  d[188] = m1[72];   
assign  d[189] = m1[73];   
assign  d[190] = m1[74];   
assign  d[191] = m1[75];   
assign  d[192] = m1[76];   
assign  d[193] = m1[77];   
assign  d[194] = m1[78];   
assign  d[195] = m1[79];   
assign  d[196] = m1[80];   
assign  d[197] = m1[81];   
assign  d[198] = m1[82];   
assign  d[199] = m1[83];   
assign  d[200] = m1[84];   
assign  d[201] = m1[85];   
assign  d[202] = m1[86];   
assign  d[203] = m1[87];   
assign  d[204] = m1[88];   
assign  d[205] = m1[89];   
assign  d[206] = m1[90];   
assign  d[207] = m1[91];   
assign  d[208] = m1[92];   
assign  d[209] = m1[93];   
assign  d[210] = m1[94];   
assign  d[211] = m1[95];   
assign  d[212] = m1[96];   
assign  d[213] = m1[97];   
assign  d[214] = m1[98];   
assign  d[215] = m1[99];   
assign  d[216] = m1[100];   
assign  d[217] = m1[101];   
assign  d[218] = m1[102];   
assign  d[219] = m1[103];   
assign  d[220] = m1[104];   
assign  d[221] = m1[105];   
assign  d[222] = m1[106];   
assign  d[223] = m1[107];   
assign  d[224] = m1[108];   
assign  d[225] = m1[109];   
assign  d[226] = m1[110];   
assign  d[227] = m1[111];   
assign  d[228] = m1[112];   
assign  d[229] = m1[113];   
assign  d[230] = m1[114];   
endmodule
`endif
