/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : L-2016.03-SP3
// Date      : Tue Nov  1 20:37:50 2016
/////////////////////////////////////////////////////////////


module d_ff_en_W2 ( clk, rst, enable, D, Q );
  input [1:0] D;
  output [1:0] Q;
  input clk, rst, enable;
  wire   n1;

  DFFRX1TS Q_reg_0_ ( .D(D[0]), .CK(clk), .RN(n1), .Q(Q[0]) );
  DFFRX1TS Q_reg_1_ ( .D(D[1]), .CK(clk), .RN(n1), .Q(Q[1]) );
  INVX2TS U2 ( .A(rst), .Y(n1) );
initial $sdf_annotate("FPU_Interface2_DW_1STAGE_syn.sdf"); 
 endmodule


module d_ff_en_W32_1 ( clk, rst, enable, D, Q, OUT4 );
  input [31:0] D;
  output [31:0] Q;
  input clk, rst, enable;
  output OUT4;
  wire   n31;
  assign Q[22] = D[22];
  assign Q[21] = D[21];
  assign Q[20] = D[20];
  assign Q[19] = D[19];
  assign Q[18] = D[18];
  assign Q[17] = D[17];
  assign Q[16] = D[16];
  assign Q[15] = D[15];
  assign Q[14] = D[14];
  assign Q[13] = D[13];
  assign Q[12] = D[12];
  assign Q[11] = D[11];
  assign Q[10] = D[10];
  assign Q[9] = D[9];
  assign Q[8] = D[8];
  assign Q[7] = D[7];
  assign Q[6] = D[6];
  assign Q[5] = D[5];
  assign Q[4] = D[4];
  assign Q[3] = D[3];
  assign Q[2] = D[2];
  assign Q[1] = D[1];
  assign Q[0] = D[0];

  DFFRXLTS Q_reg_31_ ( .D(D[31]), .CK(clk), .RN(n31), .Q(Q[31]) );
  INVX2TS U5 ( .A(rst), .Y(OUT4) );
  INVX2TS U31 ( .A(rst), .Y(n31) );
  DFFRX1TS Q_reg_29_ ( .D(D[29]), .CK(clk), .RN(n31), .Q(Q[29]) );
  DFFRX1TS Q_reg_30_ ( .D(D[30]), .CK(clk), .RN(OUT4), .Q(Q[30]) );
  DFFRX1TS Q_reg_27_ ( .D(D[27]), .CK(clk), .RN(n31), .Q(Q[27]) );
  DFFRX1TS Q_reg_23_ ( .D(D[23]), .CK(clk), .RN(n31), .Q(Q[23]) );
  DFFRX1TS Q_reg_28_ ( .D(D[28]), .CK(clk), .RN(n31), .Q(Q[28]) );
  DFFRX1TS Q_reg_25_ ( .D(D[25]), .CK(clk), .RN(n31), .Q(Q[25]) );
  DFFRX1TS Q_reg_26_ ( .D(D[26]), .CK(clk), .RN(n31), .Q(Q[26]) );
  DFFRXLTS Q_reg_24_ ( .D(D[24]), .CK(clk), .RN(n31), .Q(Q[24]) );
initial $sdf_annotate("FPU_Interface2_DW_1STAGE_syn.sdf"); 
 endmodule


module d_ff_en_W1 ( clk, rst, enable, D, Q );
  input [0:0] D;
  output [0:0] Q;
  input clk, rst, enable;
  wire   n1;

  INVX2TS U2 ( .A(rst), .Y(n1) );
  DFFRXLTS Q_reg_0_ ( .D(D[0]), .CK(clk), .RN(n1), .Q(Q[0]) );
initial $sdf_annotate("FPU_Interface2_DW_1STAGE_syn.sdf"); 
 endmodule


module demux_1x3_1 ( data, select, ch1, ch2, ch3 );
  input [1:0] select;
  input data;
  output ch1, ch2, ch3;
  wire   n1;

  CLKAND2X2TS U2 ( .A(select[0]), .B(data), .Y(ch2) );
  NOR3BX1TS U3 ( .AN(data), .B(select[0]), .C(select[1]), .Y(ch1) );
  NOR2BX1TS U4 ( .AN(data), .B(select[0]), .Y(n1) );
  CLKAND2X2TS U5 ( .A(n1), .B(select[1]), .Y(ch3) );
initial $sdf_annotate("FPU_Interface2_DW_1STAGE_syn.sdf"); 
 endmodule


module demux_1x3_0 ( data, select, ch1, ch2, ch3 );
  input [1:0] select;
  input data;
  output ch1, ch2, ch3;
  wire   n1;

  INVX1TS U2 ( .A(select[0]), .Y(n1) );
  NOR2BX1TS U3 ( .AN(data), .B(n1), .Y(ch2) );
  AND3X1TS U4 ( .A(n1), .B(data), .C(select[1]), .Y(ch3) );
initial $sdf_annotate("FPU_Interface2_DW_1STAGE_syn.sdf"); 
 endmodule


module deco_op ( operation, op_mod_add_subt, op_mod_cordic );
  input [1:0] operation;
  output op_mod_add_subt, op_mod_cordic;


  NOR2BX1TS U3 ( .AN(operation[0]), .B(operation[1]), .Y(op_mod_add_subt) );
  CLKAND2X2TS U4 ( .A(operation[0]), .B(operation[1]), .Y(op_mod_cordic) );
initial $sdf_annotate("FPU_Interface2_DW_1STAGE_syn.sdf"); 
 endmodule


module Mux_2x1_W1_3 ( select, ch_0, ch_1, data_out );
  input [0:0] ch_0;
  input [0:0] ch_1;
  output [0:0] data_out;
  input select;
  wire   n1;

  AO22X1TS U1 ( .A0(n1), .A1(ch_0[0]), .B0(select), .B1(ch_1[0]), .Y(
        data_out[0]) );
  INVX2TS U2 ( .A(select), .Y(n1) );
initial $sdf_annotate("FPU_Interface2_DW_1STAGE_syn.sdf"); 
 endmodule


module Mux_2x1_W32_1 ( select, ch_0, ch_1, data_out );
  input [31:0] ch_0;
  input [31:0] ch_1;
  output [31:0] data_out;
  input select;
  wire   n1, n2, n3, n4, n5, n6, n7;

  CLKBUFX2TS U1 ( .A(select), .Y(n1) );
  AO22XLTS U2 ( .A0(n2), .A1(ch_1[31]), .B0(n7), .B1(ch_0[31]), .Y(
        data_out[31]) );
  AO22XLTS U3 ( .A0(n2), .A1(ch_1[8]), .B0(n4), .B1(ch_0[8]), .Y(data_out[8])
         );
  AO22XLTS U4 ( .A0(n1), .A1(ch_1[7]), .B0(n4), .B1(ch_0[7]), .Y(data_out[7])
         );
  AO22XLTS U5 ( .A0(n1), .A1(ch_1[0]), .B0(n4), .B1(ch_0[0]), .Y(data_out[0])
         );
  AO22XLTS U6 ( .A0(n1), .A1(ch_1[1]), .B0(n4), .B1(ch_0[1]), .Y(data_out[1])
         );
  AO22XLTS U7 ( .A0(n3), .A1(ch_1[2]), .B0(n4), .B1(ch_0[2]), .Y(data_out[2])
         );
  AO22XLTS U8 ( .A0(select), .A1(ch_1[12]), .B0(n5), .B1(ch_0[12]), .Y(
        data_out[12]) );
  AO22XLTS U9 ( .A0(n2), .A1(ch_1[13]), .B0(n5), .B1(ch_0[13]), .Y(
        data_out[13]) );
  AO22XLTS U10 ( .A0(n3), .A1(ch_1[29]), .B0(n6), .B1(ch_0[29]), .Y(
        data_out[29]) );
  AO22XLTS U11 ( .A0(select), .A1(ch_1[3]), .B0(n4), .B1(ch_0[3]), .Y(
        data_out[3]) );
  AO22XLTS U12 ( .A0(n2), .A1(ch_1[10]), .B0(n5), .B1(ch_0[10]), .Y(
        data_out[10]) );
  AO22XLTS U13 ( .A0(n3), .A1(ch_1[11]), .B0(n5), .B1(ch_0[11]), .Y(
        data_out[11]) );
  AO22XLTS U14 ( .A0(n3), .A1(ch_1[14]), .B0(n5), .B1(ch_0[14]), .Y(
        data_out[14]) );
  AO22XLTS U15 ( .A0(select), .A1(ch_1[15]), .B0(n5), .B1(ch_0[15]), .Y(
        data_out[15]) );
  AO22XLTS U16 ( .A0(n3), .A1(ch_1[18]), .B0(n5), .B1(ch_0[18]), .Y(
        data_out[18]) );
  AO22XLTS U17 ( .A0(select), .A1(ch_1[20]), .B0(n6), .B1(ch_0[20]), .Y(
        data_out[20]) );
  AO22XLTS U18 ( .A0(n1), .A1(ch_1[21]), .B0(n6), .B1(ch_0[21]), .Y(
        data_out[21]) );
  AO22XLTS U19 ( .A0(n2), .A1(ch_1[22]), .B0(n6), .B1(ch_0[22]), .Y(
        data_out[22]) );
  AO22XLTS U20 ( .A0(n3), .A1(ch_1[5]), .B0(n4), .B1(ch_0[5]), .Y(data_out[5])
         );
  AO22XLTS U21 ( .A0(select), .A1(ch_1[9]), .B0(n4), .B1(ch_0[9]), .Y(
        data_out[9]) );
  AO22XLTS U22 ( .A0(n2), .A1(ch_1[16]), .B0(n5), .B1(ch_0[16]), .Y(
        data_out[16]) );
  AO22XLTS U23 ( .A0(n2), .A1(ch_1[28]), .B0(n6), .B1(ch_0[28]), .Y(
        data_out[28]) );
  AO22XLTS U24 ( .A0(n1), .A1(ch_1[6]), .B0(n4), .B1(ch_0[6]), .Y(data_out[6])
         );
  AO22XLTS U25 ( .A0(n2), .A1(ch_1[19]), .B0(n5), .B1(ch_0[19]), .Y(
        data_out[19]) );
  AO22XLTS U26 ( .A0(n1), .A1(ch_1[30]), .B0(n7), .B1(ch_0[30]), .Y(
        data_out[30]) );
  AO22XLTS U27 ( .A0(select), .A1(ch_1[26]), .B0(n6), .B1(ch_0[26]), .Y(
        data_out[26]) );
  AO22XLTS U28 ( .A0(n2), .A1(ch_1[27]), .B0(n6), .B1(ch_0[27]), .Y(
        data_out[27]) );
  AO22XLTS U29 ( .A0(n3), .A1(ch_1[17]), .B0(n5), .B1(ch_0[17]), .Y(
        data_out[17]) );
  AO22XLTS U30 ( .A0(n2), .A1(ch_1[4]), .B0(n4), .B1(ch_0[4]), .Y(data_out[4])
         );
  AO22XLTS U31 ( .A0(n3), .A1(ch_1[25]), .B0(n6), .B1(ch_0[25]), .Y(
        data_out[25]) );
  AO22XLTS U32 ( .A0(n3), .A1(ch_1[23]), .B0(n6), .B1(ch_0[23]), .Y(
        data_out[23]) );
  AO22XLTS U33 ( .A0(n3), .A1(ch_1[24]), .B0(n6), .B1(ch_0[24]), .Y(
        data_out[24]) );
  BUFX3TS U34 ( .A(select), .Y(n2) );
  BUFX3TS U35 ( .A(select), .Y(n3) );
  INVX2TS U36 ( .A(n1), .Y(n7) );
  BUFX3TS U37 ( .A(n7), .Y(n4) );
  BUFX3TS U38 ( .A(n7), .Y(n5) );
  BUFX3TS U39 ( .A(n7), .Y(n6) );
initial $sdf_annotate("FPU_Interface2_DW_1STAGE_syn.sdf"); 
 endmodule


module FPU_PIPELINED_FPADDSUB_W32_EW8_SW23_SWR26_EWR5 ( clk, rst, beg_OP, 
        Data_X, Data_Y, add_subt, busy, overflow_flag, underflow_flag, 
        zero_flag, ready, final_result_ieee );
  input [31:0] Data_X;
  input [31:0] Data_Y;
  output [31:0] final_result_ieee;
  input clk, rst, beg_OP, add_subt;
  output busy, overflow_flag, underflow_flag, zero_flag, ready;
  wire   intAS, SIGN_FLAG_EXP, OP_FLAG_EXP, SIGN_FLAG_SHT1, OP_FLAG_SHT1,
         left_right_SHT2, SIGN_FLAG_SHT2, OP_FLAG_SHT2, SIGN_FLAG_SHT1SHT2,
         SIGN_FLAG_NRM, DmP_mant_SFG_SWR_25_, SIGN_FLAG_SFG, OP_FLAG_SFG,
         inst_FSM_INPUT_ENABLE_state_next_1_, n534, n535, n536, n537, n538,
         n539, n540, n541, n542, n543, n544, n545, n546, n547, n548, n549,
         n550, n551, n552, n553, n554, n555, n557, n558, n559, n560, n561,
         n562, n563, n564, n565, n566, n567, n568, n569, n570, n571, n572,
         n573, n574, n575, n576, n577, n578, n579, n580, n581, n582, n583,
         n584, n585, n586, n587, n588, n589, n590, n591, n592, n593, n594,
         n595, n596, n597, n598, n599, n600, n601, n602, n603, n604, n605,
         n606, n607, n608, n609, n610, n611, n612, n613, n614, n615, n616,
         n617, n618, n619, n620, n621, n622, n623, n624, n625, n626, n627,
         n628, n629, n630, n632, n633, n634, n635, n636, n637, n638, n639,
         n640, n641, n642, n643, n644, n645, n646, n647, n648, n649, n650,
         n651, n652, n653, n654, n655, n656, n657, n658, n659, n660, n661,
         n662, n663, n664, n665, n666, n667, n668, n669, n670, n671, n672,
         n673, n674, n675, n676, n677, n678, n679, n680, n681, n682, n683,
         n684, n685, n686, n687, n688, n689, n690, n691, n692, n693, n694,
         n695, n696, n697, n698, n699, n700, n701, n702, n703, n704, n705,
         n706, n707, n708, n709, n710, n711, n712, n713, n714, n715, n716,
         n717, n718, n719, n720, n721, n722, n723, n724, n725, n726, n727,
         n728, n729, n730, n731, n732, n733, n734, n735, n736, n737, n738,
         n739, n740, n741, n742, n743, n744, n745, n746, n747, n748, n749,
         n750, n751, n752, n753, n754, n755, n756, n757, n758, n759, n760,
         n761, n762, n763, n765, n766, n768, n769, n771, n772, n774, n775,
         n777, n778, n780, n781, n783, n784, n786, n787, n788, n789, n790,
         n791, n792, n793, n794, n795, n797, n798, n799, n800, n801, n802,
         n803, n804, n805, n806, n807, n808, n809, n810, n811, n812, n813,
         n814, n815, n816, n817, n818, n819, n820, n828, n829, n830, n831,
         n832, n833, n835, n836, n837, n838, n839, n840, n841, n842, n843,
         n844, n845, n846, n847, n848, n849, n850, n851, n852, n853, n854,
         n855, n856, n857, n858, n859, n860, n861, n862, n863, n864, n865,
         n866, n867, n868, n869, n870, n871, n872, n873, n874, n875, n876,
         n877, n878, n879, n880, n881, n882, n883, n884, n885, n886, n887,
         n888, n889, n890, n891, n892, n893, n894, n895, n896, n897, n898,
         n899, n900, n901, n902, n903, n904, n905, n906, n907, n908, n909,
         n910, n911, n912, n913, n914, n915, n916, n917, n918, n919, n920,
         n921, n922, n923, n924, n925, n926, n927, n928, n929, n930, n931,
         n932, n933, n934, n935, n936, n937, n938, DP_OP_15J43_122_6956_n18,
         DP_OP_15J43_122_6956_n17, DP_OP_15J43_122_6956_n16,
         DP_OP_15J43_122_6956_n15, DP_OP_15J43_122_6956_n14,
         DP_OP_15J43_122_6956_n8, DP_OP_15J43_122_6956_n7,
         DP_OP_15J43_122_6956_n6, DP_OP_15J43_122_6956_n5,
         DP_OP_15J43_122_6956_n4, DP_OP_15J43_122_6956_n3,
         DP_OP_15J43_122_6956_n2, DP_OP_15J43_122_6956_n1, n73, n1430, n1431,
         n1432, n1433, n1434, n1435, n1437, n1438, n1439, n1440, n1441, n1442,
         n1443, n1445, n1446, n1447, n1452, n1455, n1456, n1457, n1458, n1459,
         n1460, n1461, n1462, n1463, n1464, n1465, n1467, n1469, n1477, n1480,
         n1482, n1483, n1485, n1486, n1487, n1488, n1489, n1490, n1491, n1492,
         n1493, n1499, n1501, n1502, n1503, n1505, n1506, n1507, n1509, n1510,
         n1511, n1512, n1513, n1514, n1515, n1516, n1517, n1518, n1519, n1520,
         n1527, n1528, n1529, n1530, n1531, n1532, n1533, n1534, n1186, n1187,
         n2533, n2535, n2536, n2545, n2548, n2551, n2556, n2557, n2558, n2559,
         n2560, n2561, n2563, n2565, n2566, n2570, n2573, n2575, n2578, n2580,
         n2582, n2584, n2586, n2589, n2591, n2592, n2593, n2594, n2595, n2597,
         n2599, n2640, n1164, n1165, n1166, n1167, n1168, n1169, n1170, n2646,
         n2647, n2648, n2649, n2650, n2651, n2652, n2653, n2654, n2655, n2656,
         n2657, n2658, n2659, n2660, n2661, n2662, n2663, n2664, n2665, n2666,
         n2667, n2668, n2669, n2670, n2671, n2672, n2673, n2674, n2675, n2676,
         n2677, n2678, n2679, n2680, n2681, n2682, n2683, n2684, n2685, n2686,
         n2687, n2688, n2689, n2690, n2691, n2692, n2693, n2694, n2695, n2696,
         n2697, n2699, n2700, n2701, n2702, n2703, n2704, n2705, n2706, n2707,
         n2708, n2709, n2710, n2711, n2712, n2713, n2714, n2715, n2716, n2717,
         n2718, n2719, n2720, n2721, n2722, n2723, n2724, n2725, n2726, n2727,
         n2728, n2729, n2730, n2731, n2732, n2733, n2734, n2735, n2736, n2737,
         n2738, n2739, n2740, n2741, n2742, n2743, n2744, n2745, n2746, n2747,
         n2748, n2749, n2750, n2751, n2752, n2753, n2754, n2755, n2756, n2757,
         n2758, n2759, n2760, n2761, n2762, n2763, n2764, n2765, n2766, n2767,
         n2768, n2769, n2770, n2771, n2772, n2773, n2774, n2775, n2776, n2777,
         n2778, n2779, n2780, n2781, n2782, n2783, n2784, n2785, n2786, n2787,
         n2788, n2789, n2790, n2791, n2792, n2793, n2794, n2795, n2796, n2797,
         n2798, n2799, n2800, n2801, n2802, n2803, n2804, n2805, n2806, n2807,
         n2808, n2809, n2810, n2811, n2812, n2813, n2814, n2815, n2816, n2817,
         n2818, n2819, n2820, n2821, n2822, n2823, n2824, n2825, n2826, n2827,
         n2828, n2829, n2830, n2831, n2832, n2833, n2834, n2835, n2836, n2837,
         n2838, n2839, n2840, n2841, n2842, n2843, n2844, n2845, n2846, n2847,
         n2848, n2849, n2850, n2851, n2852, n2853, n2854, n2855, n2856, n2857,
         n2858, n2859, n2860, n2861, n2862, n2863, n2864, n2865, n2866, n2867,
         n2868, n2869, n2870, n2871, n2872, n2873, n2874, n2875, n2876, n2877,
         n2878, n2879, n2880, n2881, n2882, n2883, n2884, n2885, n2886, n2887,
         n2888, n2889, n2890, n2891, n2892, n2893, n2894, n2895, n2896, n2897,
         n2898, n2899, n2900, n2901, n2902, n2903, n2904, n2905, n2906, n2907,
         n2908, n2909, n2910, n2911, n2912, n2913, n2914, n2915, n2916, n2917,
         n2918, n2919, n2920, n2921, n2922, n2923, n2924, n2925, n2926, n2927,
         n2928, n2929, n2930, n2931, n2932, n2933, n2934, n2935, n2936, n2937,
         n2938, n2939, n2940, n2941, n2942, n2943, n2944, n2945, n2946, n2947,
         n2948, n2949, n2950, n2951, n2952, n2953, n2954, n2955, n2956, n2957,
         n2958, n2959, n2960, n2961, n2962, n2963, n2964, n2965, n2966, n2967,
         n2968, n2969, n2970, n2971, n2972, n2973, n2974, n2975, n2976, n2977,
         n2978, n2979, n2980, n2981, n2982, n2983, n2984, n2985, n2986, n2987,
         n2988, n2989, n2990, n2991, n2992, n2993, n2994, n2995, n2996, n2997,
         n2998, n2999, n3000, n3001, n3002, n3003, n3004, n3005, n3006, n3007,
         n3008, n3009, n3010, n3011, n3012, n3013, n3014, n3015, n3016, n3017,
         n3018, n3019, n3020, n3021, n3022, n3023, n3024, n3025, n3026, n3027,
         n3028, n3029, n3030, n3031, n3032, n3033, n3034, n3035, n3036, n3037,
         n3038, n3039, n3040, n3041, n3042, n3043, n3044, n3045, n3046, n3047,
         n3048, n3049, n3050, n3051, n3052, n3053, n3054, n3055, n3056, n3057,
         n3058, n3059, n3060, n3061, n3062, n3063, n3064, n3065, n3066, n3067,
         n3068, n3069, n3070, n3071, n3072, n3073, n3074, n3075, n3076, n3077,
         n3078, n3079, n3080, n3081, n3082, n3083, n3084, n3085, n3086, n3087,
         n3088, n3089, n3090, n3091, n3092, n3093, n3094, n3095, n3096, n3097,
         n3098, n3099, n3100, n3101, n3102, n3103, n3104, n3105, n3106, n3107,
         n3108, n3109, n3110, n3111, n3112, n3113, n3114, n3115, n3116, n3117,
         n3118, n3119, n3120, n3121, n3122, n3123, n3124, n3125, n3126, n3127,
         n3128, n3129, n3130, n3131, n3132, n3133, n3134, n3135, n3136, n3137,
         n3138, n3139, n3140, n3141, n3142, n3143, n3144, n3145, n3146, n3147,
         n3148, n3149, n3150, n3151, n3152, n3153, n3154, n3155, n3156, n3157,
         n3158, n3159, n3160, n3161, n3162, n3163, n3164, n3165, n3166, n3167,
         n3168, n3169, n3170, n3171, n3172, n3173, n3174, n3175, n3176, n3177,
         n3178, n3179, n3180, n3181, n3182, n3183, n3184, n3185, n3186, n3187,
         n3188, n3189, n3190, n3191, n3192, n3193, n3194, n3195, n3196, n3197,
         n3198, n3199, n3200, n3201, n3202, n3203, n3204, n3205, n3206, n3207,
         n3208, n3209, n3210, n3211, n3212, n3213, n3214, n3215, n3216, n3217,
         n3218, n3219, n3220, n3221, n3222, n3223, n3224, n3225, n3226, n3227,
         n3228, n3229, n3230, n3231, n3232, n3233, n3234, n3235, n3236, n3237,
         n3238, n3239, n3240, n3241, n3242, n3243, n3244, n3245, n3246, n3247,
         n3248, n3249, n3250, n3251, n3252, n3253, n3254, n3255, n3256, n3257,
         n3258, n3259, n3260, n3261, n3262, n3263, n3264, n3265, n3266, n3267,
         n3268, n3269, n3270, n3271, n3272, n3273, n3274, n3275, n3276, n3277,
         n3278, n3279, n3280, n3281, n3282, n3283, n3284, n3285, n3286, n3287,
         n3288, n3289, n3290, n3291, n3292, n3293, n3294, n3295, n3296, n3297,
         n3298, n3299, n3300, n3301, n3302, n3303, n3304, n3305, n3306, n3307,
         n3308, n3309, n3310, n3311, n3312, n3313, n3314, n3315, n3316, n3317,
         n3318, n3319, n3320, n3321, n3322, n3323, n3324, n3325, n3326, n3327,
         n3328, n3329, n3330, n3331, n3332, n3333, n3334, n3335, n3336, n3337,
         n3338, n3339, n3340, n3341, n3342, n3343, n3344, n3345, n3346, n3347,
         n3348, n3349, n3350, n3351, n3352, n3353, n3354, n3355, n3356, n3357,
         n3358, n3359, n3360, n3361, n3362, n3363, n3364, n3365, n3366, n3367,
         n3368, n3369, n3370, n3371, n3372, n3373, n3374, n3375, n3376, n3377,
         n3378, n3379, n3380, n3381, n3382, n3383, n3384, n3385, n3386, n3387,
         n3388, n3389, n3390, n3391, n3392, n3393, n3394, n3395, n3396, n3397,
         n3398, n3399, n3400, n3401, n3402, n3403, n3404, n3405, n3406, n3407,
         n3408, n3409, n3410, n3411, n3412, n3413, n3414, n3415, n3416, n3417,
         n3418, n3419, n3421, n3422, n3423, n3424, n3425, n3426, n3427, n3428,
         n3429, n3430, n3431, n3432, n3433, n3434, n3435, n3436, n3437, n3438,
         n3439, n3440, n3441, n3442, n3443, n3444, n3445, n3446, n3447, n3448,
         n3449, n3450, n3451, n3452, n3453, n3454, n3455, n3456, n3457, n3458,
         n3459, n3460, n3461, n3462, n3463, n3464, n3465, n3466, n3467, n3468,
         n3469, n3470, n3471, n3472, n3473, n3474, n3475, n3476, n3477, n3478,
         n3479, n3480, n3481, n3482, n3483, n3484, n3485, n3486, n3487, n3488,
         n3489, n3490, n3491, n3492, n3493, n3494, n3495, n3496, n3497, n3498,
         n3499, n3500, n3501, n3502, n3503, n3504, n3505, n3506, n3507, n3508,
         n3509, n3510, n3511, n3512, n3513, n3514, n3515, n3516, n3517, n3518,
         n3519, n3520, n3521, n3522, n3523, n3524, n3525, n3526, n3527, n3528,
         n3529, n3530, n3531, n3532, n3533, n3534, n3535, n3536, n3537, n3538,
         n3539, n3540, n3541, n3542, n3543, n3544, n3545, n3546, n3547, n3548,
         n3549, n3550, n3551, n3552, n3553, n3554, n3555, n3556, n3557, n3558,
         n3559, n3560, n3561, n3562, n3563, n3564, n3565, n3566, n3567, n3568,
         n3569, n3570, n3571, n3572, n3573, n3574, n3575, n3576, n3577, n3578,
         n3579, n3580, n3581, n3582, n3583, n3584, n3585, n3586, n3587, n3588,
         n3589, n3590, n3591, n3592, n3593, n3594, n3595, n3596, n3597, n3598,
         n3599, n3600, n3601, n3602, n3603, n3604, n3605, n3606, n3607, n3608,
         n3609, n3610, n3611, n3612, n3613, n3614, n3615, n3616, n3617, n3618,
         n3619, n3620, n3621, n3622, n3623, n3624, n3625, n3626, n3627, n3628,
         n3629, n3630, n3631, n3632, n3633, n3634, n3635, n3636, n3637, n3638,
         n3639, n3640, n3641, n3642, n3643, n3644, n3645, n3646, n3647, n3648,
         n3649, n3650, n3651, n3652, n3653, n3654, n3655, n3656, n3657, n3658,
         n3659, n3660, n3661, n3662, n3663, n3664, n3665, n3666, n3667, n3668,
         n3669, n3670, n3671, n3672, n3673, n3674, n3675, n3676, n3677, n3678,
         n3679, n3680, n3681, n3682, n3683, n3684, n3685, n3686, n3687, n3688,
         n3689, n3690, n3691, n3692, n3693, n3694, n3695, n3696, n3697, n3698,
         n3699, n3700, n3701, n3702, n3703, n3704, n3705, n3706, n3707, n3708,
         n3709, n3710, n3711, n3712, n3713, n3714, n3715, n3716, n3717, n3718,
         n3719, n3720, n3721, n3722, n3723, n3724, n3725;
  wire   [3:0] Shift_reg_FLAGS_7;
  wire   [31:7] intDX_EWSW;
  wire   [31:0] intDY_EWSW;
  wire   [30:0] DMP_EXP_EWSW;
  wire   [27:0] DmP_EXP_EWSW;
  wire   [30:0] DMP_SHT1_EWSW;
  wire   [22:0] DmP_mant_SHT1_SW;
  wire   [4:0] Shift_amount_SHT1_EWR;
  wire   [25:2] Raw_mant_NRM_SWR;
  wire   [24:0] Data_array_SWR;
  wire   [30:0] DMP_SHT2_EWSW;
  wire   [4:2] shift_value_SHT2_EWR;
  wire   [7:0] DMP_exp_NRM2_EW;
  wire   [7:0] DMP_exp_NRM_EW;
  wire   [4:0] LZD_output_NRM2_EW;
  wire   [7:0] exp_rslt_NRM2_EW1;
  wire   [30:1] DMP_SFG;
  wire   [2:0] inst_FSM_INPUT_ENABLE_state_reg;

  DFFRXLTS SHT1_STAGE_sft_amount_Q_reg_2_ ( .D(n830), .CK(clk), .RN(n3712), 
        .Q(Shift_amount_SHT1_EWR[2]) );
  DFFRXLTS SHT1_STAGE_sft_amount_Q_reg_3_ ( .D(n829), .CK(clk), .RN(n3712), 
        .Q(Shift_amount_SHT1_EWR[3]) );
  DFFRXLTS SHT1_STAGE_sft_amount_Q_reg_4_ ( .D(n828), .CK(clk), .RN(n3712), 
        .Q(Shift_amount_SHT1_EWR[4]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_0_ ( .D(n819), .CK(clk), .RN(n3712), .Q(
        DMP_EXP_EWSW[0]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_1_ ( .D(n818), .CK(clk), .RN(n3712), .Q(
        DMP_EXP_EWSW[1]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_2_ ( .D(n817), .CK(clk), .RN(n3711), .Q(
        DMP_EXP_EWSW[2]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_3_ ( .D(n816), .CK(clk), .RN(n3711), .Q(
        DMP_EXP_EWSW[3]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_4_ ( .D(n815), .CK(clk), .RN(n3711), .Q(
        DMP_EXP_EWSW[4]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_5_ ( .D(n814), .CK(clk), .RN(n3711), .Q(
        DMP_EXP_EWSW[5]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_6_ ( .D(n813), .CK(clk), .RN(n3711), .Q(
        DMP_EXP_EWSW[6]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_7_ ( .D(n812), .CK(clk), .RN(n3711), .Q(
        DMP_EXP_EWSW[7]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_8_ ( .D(n811), .CK(clk), .RN(n3711), .Q(
        DMP_EXP_EWSW[8]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_9_ ( .D(n810), .CK(clk), .RN(n3710), .Q(
        DMP_EXP_EWSW[9]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_10_ ( .D(n809), .CK(clk), .RN(n3710), .Q(
        DMP_EXP_EWSW[10]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_11_ ( .D(n808), .CK(clk), .RN(n3710), .Q(
        DMP_EXP_EWSW[11]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_12_ ( .D(n807), .CK(clk), .RN(n3710), .Q(
        DMP_EXP_EWSW[12]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_13_ ( .D(n806), .CK(clk), .RN(n3710), .Q(
        DMP_EXP_EWSW[13]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_14_ ( .D(n805), .CK(clk), .RN(n3710), .Q(
        DMP_EXP_EWSW[14]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_15_ ( .D(n804), .CK(clk), .RN(n3710), .Q(
        DMP_EXP_EWSW[15]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_16_ ( .D(n803), .CK(clk), .RN(n3709), .Q(
        DMP_EXP_EWSW[16]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_17_ ( .D(n802), .CK(clk), .RN(n3709), .Q(
        DMP_EXP_EWSW[17]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_18_ ( .D(n801), .CK(clk), .RN(n3709), .Q(
        DMP_EXP_EWSW[18]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_19_ ( .D(n800), .CK(clk), .RN(n3709), .Q(
        DMP_EXP_EWSW[19]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_20_ ( .D(n799), .CK(clk), .RN(n3709), .Q(
        DMP_EXP_EWSW[20]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_21_ ( .D(n798), .CK(clk), .RN(n3709), .Q(
        DMP_EXP_EWSW[21]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_22_ ( .D(n797), .CK(clk), .RN(n3709), .Q(
        DMP_EXP_EWSW[22]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_28_ ( .D(n791), .CK(clk), .RN(n3708), .Q(
        DMP_EXP_EWSW[28]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_29_ ( .D(n790), .CK(clk), .RN(n3708), .Q(
        DMP_EXP_EWSW[29]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_30_ ( .D(n789), .CK(clk), .RN(n3708), .Q(
        DMP_EXP_EWSW[30]) );
  DFFRXLTS EXP_STAGE_FLAGS_Q_reg_1_ ( .D(n788), .CK(clk), .RN(n3708), .Q(
        OP_FLAG_EXP) );
  DFFRXLTS EXP_STAGE_FLAGS_Q_reg_2_ ( .D(n787), .CK(clk), .RN(n3708), .Q(
        SIGN_FLAG_EXP) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_0_ ( .D(n786), .CK(clk), .RN(n3708), .Q(
        DMP_SHT1_EWSW[0]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_0_ ( .D(n1534), .CK(clk), .RN(n3711), .Q(
        DMP_SHT2_EWSW[0]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_1_ ( .D(n783), .CK(clk), .RN(n3708), .Q(
        DMP_SHT1_EWSW[1]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_1_ ( .D(n1533), .CK(clk), .RN(n3711), .Q(
        DMP_SHT2_EWSW[1]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_2_ ( .D(n780), .CK(clk), .RN(n3707), .Q(
        DMP_SHT1_EWSW[2]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_2_ ( .D(n1532), .CK(clk), .RN(n3711), .Q(
        DMP_SHT2_EWSW[2]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_3_ ( .D(n777), .CK(clk), .RN(n3707), .Q(
        DMP_SHT1_EWSW[3]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_3_ ( .D(n1531), .CK(clk), .RN(n3712), .Q(
        DMP_SHT2_EWSW[3]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_4_ ( .D(n774), .CK(clk), .RN(n3707), .Q(
        DMP_SHT1_EWSW[4]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_4_ ( .D(n1530), .CK(clk), .RN(n3712), .Q(
        DMP_SHT2_EWSW[4]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_5_ ( .D(n771), .CK(clk), .RN(n3707), .Q(
        DMP_SHT1_EWSW[5]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_5_ ( .D(n1529), .CK(clk), .RN(n3712), .Q(
        DMP_SHT2_EWSW[5]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_6_ ( .D(n768), .CK(clk), .RN(n3707), .Q(
        DMP_SHT1_EWSW[6]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_6_ ( .D(n1528), .CK(clk), .RN(n3710), .Q(
        DMP_SHT2_EWSW[6]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_7_ ( .D(n765), .CK(clk), .RN(n3707), .Q(
        DMP_SHT1_EWSW[7]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_7_ ( .D(n1527), .CK(clk), .RN(n3710), .Q(
        DMP_SHT2_EWSW[7]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_8_ ( .D(n762), .CK(clk), .RN(n3707), .Q(
        DMP_SHT1_EWSW[8]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_8_ ( .D(n761), .CK(clk), .RN(n3710), .Q(
        DMP_SHT2_EWSW[8]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_9_ ( .D(n759), .CK(clk), .RN(n3707), .Q(
        DMP_SHT1_EWSW[9]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_9_ ( .D(n758), .CK(clk), .RN(n3709), .Q(
        DMP_SHT2_EWSW[9]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_10_ ( .D(n756), .CK(clk), .RN(n3707), .Q(
        DMP_SHT1_EWSW[10]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_10_ ( .D(n755), .CK(clk), .RN(n3709), .Q(
        DMP_SHT2_EWSW[10]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_11_ ( .D(n753), .CK(clk), .RN(n3707), .Q(
        DMP_SHT1_EWSW[11]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_11_ ( .D(n752), .CK(clk), .RN(n3709), .Q(
        DMP_SHT2_EWSW[11]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_12_ ( .D(n750), .CK(clk), .RN(n3706), .Q(
        DMP_SHT1_EWSW[12]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_12_ ( .D(n749), .CK(clk), .RN(n3708), .Q(
        DMP_SHT2_EWSW[12]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_13_ ( .D(n747), .CK(clk), .RN(n3706), .Q(
        DMP_SHT1_EWSW[13]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_13_ ( .D(n746), .CK(clk), .RN(n3708), .Q(
        DMP_SHT2_EWSW[13]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_14_ ( .D(n744), .CK(clk), .RN(n3706), .Q(
        DMP_SHT1_EWSW[14]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_14_ ( .D(n743), .CK(clk), .RN(n3706), .Q(
        DMP_SHT2_EWSW[14]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_15_ ( .D(n741), .CK(clk), .RN(n3706), .Q(
        DMP_SHT1_EWSW[15]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_15_ ( .D(n740), .CK(clk), .RN(n3706), .Q(
        DMP_SHT2_EWSW[15]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_16_ ( .D(n738), .CK(clk), .RN(n3706), .Q(
        DMP_SHT1_EWSW[16]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_16_ ( .D(n737), .CK(clk), .RN(n3706), .Q(
        DMP_SHT2_EWSW[16]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_17_ ( .D(n735), .CK(clk), .RN(n3706), .Q(
        DMP_SHT1_EWSW[17]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_17_ ( .D(n734), .CK(clk), .RN(n3706), .Q(
        DMP_SHT2_EWSW[17]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_18_ ( .D(n732), .CK(clk), .RN(n3705), .Q(
        DMP_SHT1_EWSW[18]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_18_ ( .D(n731), .CK(clk), .RN(n3705), .Q(
        DMP_SHT2_EWSW[18]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_19_ ( .D(n729), .CK(clk), .RN(n3705), .Q(
        DMP_SHT1_EWSW[19]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_19_ ( .D(n728), .CK(clk), .RN(n3705), .Q(
        DMP_SHT2_EWSW[19]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_20_ ( .D(n726), .CK(clk), .RN(n3705), .Q(
        DMP_SHT1_EWSW[20]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_20_ ( .D(n725), .CK(clk), .RN(n3705), .Q(
        DMP_SHT2_EWSW[20]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_21_ ( .D(n723), .CK(clk), .RN(n3705), .Q(
        DMP_SHT1_EWSW[21]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_21_ ( .D(n722), .CK(clk), .RN(n3705), .Q(
        DMP_SHT2_EWSW[21]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_22_ ( .D(n720), .CK(clk), .RN(n3705), .Q(
        DMP_SHT1_EWSW[22]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_22_ ( .D(n719), .CK(clk), .RN(n3705), .Q(
        DMP_SHT2_EWSW[22]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_23_ ( .D(n717), .CK(clk), .RN(n3704), .Q(
        DMP_SHT1_EWSW[23]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_23_ ( .D(n716), .CK(clk), .RN(n3704), .Q(
        DMP_SHT2_EWSW[23]) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_23_ ( .D(n715), .CK(clk), .RN(n3704), .Q(
        DMP_SFG[23]) );
  DFFRXLTS NRM_STAGE_DMP_exp_Q_reg_0_ ( .D(n714), .CK(clk), .RN(n3704), .Q(
        DMP_exp_NRM_EW[0]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_24_ ( .D(n712), .CK(clk), .RN(n3704), .Q(
        DMP_SHT1_EWSW[24]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_24_ ( .D(n711), .CK(clk), .RN(n3708), .Q(
        DMP_SHT2_EWSW[24]) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_24_ ( .D(n710), .CK(clk), .RN(n3713), .Q(
        DMP_SFG[24]) );
  DFFRXLTS NRM_STAGE_DMP_exp_Q_reg_1_ ( .D(n709), .CK(clk), .RN(n3713), .Q(
        DMP_exp_NRM_EW[1]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_25_ ( .D(n707), .CK(clk), .RN(n3713), .Q(
        DMP_SHT1_EWSW[25]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_25_ ( .D(n706), .CK(clk), .RN(n3713), .Q(
        DMP_SHT2_EWSW[25]) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_25_ ( .D(n705), .CK(clk), .RN(n3713), .Q(
        DMP_SFG[25]) );
  DFFRXLTS NRM_STAGE_DMP_exp_Q_reg_2_ ( .D(n704), .CK(clk), .RN(n3713), .Q(
        DMP_exp_NRM_EW[2]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_26_ ( .D(n702), .CK(clk), .RN(n3713), .Q(
        DMP_SHT1_EWSW[26]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_26_ ( .D(n701), .CK(clk), .RN(n3713), .Q(
        DMP_SHT2_EWSW[26]) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_26_ ( .D(n700), .CK(clk), .RN(n3713), .Q(
        DMP_SFG[26]) );
  DFFRXLTS NRM_STAGE_DMP_exp_Q_reg_3_ ( .D(n699), .CK(clk), .RN(n3713), .Q(
        DMP_exp_NRM_EW[3]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_27_ ( .D(n697), .CK(clk), .RN(n3714), .Q(
        DMP_SHT1_EWSW[27]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_27_ ( .D(n696), .CK(clk), .RN(n3714), .Q(
        DMP_SHT2_EWSW[27]) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_27_ ( .D(n695), .CK(clk), .RN(n3714), .Q(
        DMP_SFG[27]) );
  DFFRXLTS NRM_STAGE_DMP_exp_Q_reg_4_ ( .D(n694), .CK(clk), .RN(n3714), .Q(
        DMP_exp_NRM_EW[4]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_28_ ( .D(n692), .CK(clk), .RN(n3714), .Q(
        DMP_SHT1_EWSW[28]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_28_ ( .D(n691), .CK(clk), .RN(n3714), .Q(
        DMP_SHT2_EWSW[28]) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_28_ ( .D(n690), .CK(clk), .RN(n3714), .Q(
        DMP_SFG[28]) );
  DFFRXLTS NRM_STAGE_DMP_exp_Q_reg_5_ ( .D(n689), .CK(clk), .RN(n3714), .Q(
        DMP_exp_NRM_EW[5]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_29_ ( .D(n687), .CK(clk), .RN(n3714), .Q(
        DMP_SHT1_EWSW[29]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_29_ ( .D(n686), .CK(clk), .RN(n3715), .Q(
        DMP_SHT2_EWSW[29]) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_29_ ( .D(n685), .CK(clk), .RN(n3715), .Q(
        DMP_SFG[29]) );
  DFFRXLTS NRM_STAGE_DMP_exp_Q_reg_6_ ( .D(n684), .CK(clk), .RN(n3715), .Q(
        DMP_exp_NRM_EW[6]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_30_ ( .D(n682), .CK(clk), .RN(n3715), .Q(
        DMP_SHT1_EWSW[30]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_30_ ( .D(n681), .CK(clk), .RN(n3715), .Q(
        DMP_SHT2_EWSW[30]) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_30_ ( .D(n680), .CK(clk), .RN(n3715), .Q(
        DMP_SFG[30]) );
  DFFRXLTS NRM_STAGE_DMP_exp_Q_reg_7_ ( .D(n679), .CK(clk), .RN(n3715), .Q(
        DMP_exp_NRM_EW[7]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_0_ ( .D(n677), .CK(clk), .RN(n3715), .Q(
        DmP_EXP_EWSW[0]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_0_ ( .D(n676), .CK(clk), .RN(n3715), .Q(
        DmP_mant_SHT1_SW[0]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_1_ ( .D(n675), .CK(clk), .RN(n3715), .Q(
        DmP_EXP_EWSW[1]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_1_ ( .D(n674), .CK(clk), .RN(n3716), .Q(
        DmP_mant_SHT1_SW[1]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_2_ ( .D(n673), .CK(clk), .RN(n3716), .Q(
        DmP_EXP_EWSW[2]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_2_ ( .D(n672), .CK(clk), .RN(n3716), .Q(
        DmP_mant_SHT1_SW[2]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_3_ ( .D(n671), .CK(clk), .RN(n3716), .Q(
        DmP_EXP_EWSW[3]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_3_ ( .D(n670), .CK(clk), .RN(n3716), .Q(
        DmP_mant_SHT1_SW[3]), .QN(n3617) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_4_ ( .D(n669), .CK(clk), .RN(n3716), .Q(
        DmP_EXP_EWSW[4]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_4_ ( .D(n668), .CK(clk), .RN(n3716), .Q(
        DmP_mant_SHT1_SW[4]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_5_ ( .D(n667), .CK(clk), .RN(n3716), .Q(
        DmP_EXP_EWSW[5]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_5_ ( .D(n666), .CK(clk), .RN(n3716), .Q(
        DmP_mant_SHT1_SW[5]), .QN(n3673) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_6_ ( .D(n665), .CK(clk), .RN(n3716), .Q(
        DmP_EXP_EWSW[6]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_6_ ( .D(n664), .CK(clk), .RN(n3717), .Q(
        DmP_mant_SHT1_SW[6]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_7_ ( .D(n663), .CK(clk), .RN(n3717), .Q(
        DmP_EXP_EWSW[7]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_7_ ( .D(n662), .CK(clk), .RN(n3717), .Q(
        DmP_mant_SHT1_SW[7]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_8_ ( .D(n661), .CK(clk), .RN(n3717), .Q(
        DmP_EXP_EWSW[8]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_8_ ( .D(n660), .CK(clk), .RN(n3717), .Q(
        DmP_mant_SHT1_SW[8]), .QN(n3671) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_9_ ( .D(n659), .CK(clk), .RN(n3717), .Q(
        DmP_EXP_EWSW[9]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_9_ ( .D(n658), .CK(clk), .RN(n3717), .Q(
        DmP_mant_SHT1_SW[9]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_10_ ( .D(n657), .CK(clk), .RN(n3717), .Q(
        DmP_EXP_EWSW[10]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_10_ ( .D(n656), .CK(clk), .RN(n3717), .Q(
        DmP_mant_SHT1_SW[10]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_11_ ( .D(n655), .CK(clk), .RN(n3717), .Q(
        DmP_EXP_EWSW[11]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_11_ ( .D(n654), .CK(clk), .RN(n3718), .Q(
        DmP_mant_SHT1_SW[11]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_12_ ( .D(n653), .CK(clk), .RN(n3718), .Q(
        DmP_EXP_EWSW[12]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_12_ ( .D(n652), .CK(clk), .RN(n3718), .Q(
        DmP_mant_SHT1_SW[12]), .QN(n3674) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_13_ ( .D(n651), .CK(clk), .RN(n3718), .Q(
        DmP_EXP_EWSW[13]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_13_ ( .D(n650), .CK(clk), .RN(n3718), .Q(
        DmP_mant_SHT1_SW[13]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_14_ ( .D(n649), .CK(clk), .RN(n3718), .Q(
        DmP_EXP_EWSW[14]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_14_ ( .D(n648), .CK(clk), .RN(n3718), .Q(
        DmP_mant_SHT1_SW[14]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_15_ ( .D(n647), .CK(clk), .RN(n3718), .Q(
        DmP_EXP_EWSW[15]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_15_ ( .D(n646), .CK(clk), .RN(n3718), .Q(
        DmP_mant_SHT1_SW[15]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_16_ ( .D(n645), .CK(clk), .RN(n3718), .Q(
        DmP_EXP_EWSW[16]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_16_ ( .D(n644), .CK(clk), .RN(n3719), .Q(
        DmP_mant_SHT1_SW[16]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_17_ ( .D(n643), .CK(clk), .RN(n3719), .Q(
        DmP_EXP_EWSW[17]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_17_ ( .D(n642), .CK(clk), .RN(n3719), .Q(
        DmP_mant_SHT1_SW[17]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_18_ ( .D(n641), .CK(clk), .RN(n3719), .Q(
        DmP_EXP_EWSW[18]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_18_ ( .D(n640), .CK(clk), .RN(n3719), .Q(
        DmP_mant_SHT1_SW[18]), .QN(n3672) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_19_ ( .D(n639), .CK(clk), .RN(n3719), .Q(
        DmP_EXP_EWSW[19]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_19_ ( .D(n638), .CK(clk), .RN(n3719), .Q(
        DmP_mant_SHT1_SW[19]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_20_ ( .D(n637), .CK(clk), .RN(n3719), .Q(
        DmP_EXP_EWSW[20]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_20_ ( .D(n636), .CK(clk), .RN(n3719), .Q(
        DmP_mant_SHT1_SW[20]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_21_ ( .D(n635), .CK(clk), .RN(n3719), .Q(
        DmP_EXP_EWSW[21]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_21_ ( .D(n634), .CK(clk), .RN(n3720), .Q(
        DmP_mant_SHT1_SW[21]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_22_ ( .D(n633), .CK(clk), .RN(n3720), .Q(
        DmP_EXP_EWSW[22]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_22_ ( .D(n632), .CK(clk), .RN(n3720), .Q(
        DmP_mant_SHT1_SW[22]) );
  DFFRXLTS SHT1_STAGE_FLAGS_Q_reg_1_ ( .D(n624), .CK(clk), .RN(n3720), .Q(
        OP_FLAG_SHT1) );
  DFFRXLTS SHT2_STAGE_FLAGS_Q_reg_1_ ( .D(n623), .CK(clk), .RN(n3720), .Q(
        OP_FLAG_SHT2) );
  DFFRXLTS SHT1_STAGE_FLAGS_Q_reg_2_ ( .D(n619), .CK(clk), .RN(n3720), .Q(
        SIGN_FLAG_SHT1) );
  DFFRXLTS SHT2_STAGE_FLAGS_Q_reg_2_ ( .D(n618), .CK(clk), .RN(n3720), .Q(
        SIGN_FLAG_SHT2) );
  DFFRXLTS SGF_STAGE_FLAGS_Q_reg_2_ ( .D(n617), .CK(clk), .RN(n3720), .Q(
        SIGN_FLAG_SFG) );
  DFFRXLTS NRM_STAGE_FLAGS_Q_reg_1_ ( .D(n616), .CK(clk), .RN(n3720), .Q(
        SIGN_FLAG_NRM) );
  DFFRXLTS SFT2FRMT_STAGE_FLAGS_Q_reg_1_ ( .D(n615), .CK(clk), .RN(n3720), .Q(
        SIGN_FLAG_SHT1SHT2) );
  DFFRXLTS SFT2FRMT_STAGE_VARS_Q_reg_11_ ( .D(n587), .CK(clk), .RN(n3697), .Q(
        LZD_output_NRM2_EW[3]) );
  DFFRXLTS SFT2FRMT_STAGE_VARS_Q_reg_10_ ( .D(n585), .CK(clk), .RN(n2845), .Q(
        LZD_output_NRM2_EW[2]) );
  DFFRXLTS SFT2FRMT_STAGE_VARS_Q_reg_12_ ( .D(n583), .CK(clk), .RN(n3692), .Q(
        LZD_output_NRM2_EW[4]) );
  DFFRX1TS EXP_STAGE_DMP_Q_reg_25_ ( .D(n794), .CK(clk), .RN(n3704), .Q(n3666), 
        .QN(n1442) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_8_ ( .D(n845), .CK(clk), .RN(n3704), .Q(
        Data_array_SWR[8]) );
  DFFRX1TS SFT2FRMT_STAGE_VARS_Q_reg_4_ ( .D(n693), .CK(clk), .RN(n3704), .Q(
        DMP_exp_NRM2_EW[4]) );
  DFFRX1TS SFT2FRMT_STAGE_VARS_Q_reg_1_ ( .D(n708), .CK(clk), .RN(n3703), .Q(
        DMP_exp_NRM2_EW[1]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_6_ ( .D(n843), .CK(clk), .RN(n3704), .Q(
        Data_array_SWR[6]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_7_ ( .D(n844), .CK(clk), .RN(n3703), .Q(
        Data_array_SWR[7]) );
  DFFRX1TS EXP_STAGE_DmP_Q_reg_23_ ( .D(n1187), .CK(clk), .RN(n3703), .Q(
        DmP_EXP_EWSW[23]) );
  DFFRX1TS SGF_STAGE_FLAGS_Q_reg_1_ ( .D(n622), .CK(clk), .RN(n3694), .Q(
        OP_FLAG_SFG) );
  DFFRX1TS SFT2FRMT_STAGE_VARS_Q_reg_7_ ( .D(n678), .CK(clk), .RN(n3703), .Q(
        DMP_exp_NRM2_EW[7]) );
  DFFRX1TS SFT2FRMT_STAGE_VARS_Q_reg_6_ ( .D(n683), .CK(clk), .RN(n3703), .Q(
        DMP_exp_NRM2_EW[6]) );
  DFFRX1TS SFT2FRMT_STAGE_VARS_Q_reg_5_ ( .D(n688), .CK(clk), .RN(n3703), .Q(
        DMP_exp_NRM2_EW[5]) );
  DFFRX1TS SFT2FRMT_STAGE_VARS_Q_reg_3_ ( .D(n698), .CK(clk), .RN(n3703), .Q(
        DMP_exp_NRM2_EW[3]) );
  DFFRX1TS SFT2FRMT_STAGE_VARS_Q_reg_2_ ( .D(n703), .CK(clk), .RN(n3703), .Q(
        DMP_exp_NRM2_EW[2]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_3_ ( .D(n840), .CK(clk), .RN(n3703), .Q(
        Data_array_SWR[3]) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_31_ ( .D(n865), .CK(clk), .RN(n3702), 
        .Q(intDY_EWSW[31]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_11_ ( .D(n848), .CK(clk), .RN(n3702), .Q(
        Data_array_SWR[11]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_10_ ( .D(n847), .CK(clk), .RN(n3702), .Q(
        Data_array_SWR[10]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_9_ ( .D(n846), .CK(clk), .RN(n3702), .Q(
        Data_array_SWR[9]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_5_ ( .D(n842), .CK(clk), .RN(n3702), .Q(
        Data_array_SWR[5]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_4_ ( .D(n841), .CK(clk), .RN(n3702), .Q(
        Data_array_SWR[4]) );
  DFFRX1TS EXP_STAGE_DMP_Q_reg_27_ ( .D(n792), .CK(clk), .RN(n3702), .Q(
        DMP_EXP_EWSW[27]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_1_ ( .D(n838), .CK(clk), .RN(n3702), .Q(
        Data_array_SWR[1]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_0_ ( .D(n837), .CK(clk), .RN(n3702), .Q(
        Data_array_SWR[0]) );
  DFFRX1TS EXP_STAGE_DmP_Q_reg_27_ ( .D(n627), .CK(clk), .RN(n3702), .Q(
        DmP_EXP_EWSW[27]) );
  DFFRX1TS EXP_STAGE_DMP_Q_reg_26_ ( .D(n793), .CK(clk), .RN(n3701), .Q(n3665), 
        .QN(n1446) );
  DFFRXLTS Ready_reg_Q_reg_0_ ( .D(Shift_reg_FLAGS_7[0]), .CK(clk), .RN(n2684), 
        .Q(ready) );
  DFFRXLTS inst_ShiftRegister_Q_reg_6_ ( .D(n936), .CK(clk), .RN(n3681), .Q(
        n3669), .QN(n2640) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_25_ ( .D(n534), .CK(clk), .RN(n3698), .Q(
        DmP_mant_SFG_SWR_25_) );
  DFFRX1TS inst_FSM_INPUT_ENABLE_state_reg_reg_0_ ( .D(n938), .CK(clk), .RN(
        n2842), .Q(inst_FSM_INPUT_ENABLE_state_reg[0]), .QN(n3649) );
  DFFRX1TS SHT1_STAGE_sft_amount_Q_reg_0_ ( .D(n832), .CK(clk), .RN(n2846), 
        .Q(Shift_amount_SHT1_EWR[0]) );
  DFFRX1TS inst_ShiftRegister_Q_reg_3_ ( .D(n933), .CK(clk), .RN(n2843), .Q(
        Shift_reg_FLAGS_7[3]) );
  DFFRX1TS NRM_STAGE_FLAGS_Q_reg_2_ ( .D(n621), .CK(clk), .RN(n3698), .Q(n3654), .QN(n1480) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_0_ ( .D(n613), .CK(clk), .RN(n3697), .Q(
        n3646), .QN(n1499) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_26_ ( .D(n870), .CK(clk), .RN(n3696), 
        .Q(n3640), .QN(n1431) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_25_ ( .D(n871), .CK(clk), .RN(n3692), 
        .Q(n3639), .QN(n1430) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_24_ ( .D(n905), .CK(clk), .RN(n3695), 
        .Q(n3651), .QN(n1439) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_23_ ( .D(n860), .CK(clk), .RN(n2845), .Q(
        n2594), .QN(n3660) );
  DFFRX1TS EXP_STAGE_DmP_Q_reg_24_ ( .D(n630), .CK(clk), .RN(n2844), .Q(n3661), 
        .QN(n1441) );
  DFFRX1TS EXP_STAGE_DMP_Q_reg_24_ ( .D(n795), .CK(clk), .RN(n3694), .Q(n3614), 
        .QN(n1443) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_22_ ( .D(n859), .CK(clk), .RN(n2843), .Q(
        n2595), .QN(n3664) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_21_ ( .D(n858), .CK(clk), .RN(n2846), .Q(
        Data_array_SWR[21]), .QN(n3663) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_5_ ( .D(n608), .CK(clk), .RN(n3684), .Q(
        Raw_mant_NRM_SWR[5]), .QN(n3677) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_20_ ( .D(n539), .CK(clk), .RN(n3691), .Q(
        n3657), .QN(n1518) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_23_ ( .D(n873), .CK(clk), .RN(n3689), 
        .Q(n3650), .QN(n2589) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_29_ ( .D(n867), .CK(clk), .RN(n3714), 
        .Q(n3648) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_7_ ( .D(n606), .CK(clk), .RN(n3689), .Q(
        Raw_mant_NRM_SWR[7]), .QN(n3616) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_23_ ( .D(n906), .CK(clk), .RN(n3687), 
        .Q(n3611), .QN(n1477) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_19_ ( .D(n910), .CK(clk), .RN(n3684), 
        .Q(n3607), .QN(n1485) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_6_ ( .D(n923), .CK(clk), .RN(n3687), .Q(
        n3606), .QN(n1435) );
  DFFRXLTS FRMT_STAGE_FLAGS_Q_reg_1_ ( .D(n626), .CK(clk), .RN(n2684), .Q(
        underflow_flag) );
  DFFRXLTS FRMT_STAGE_FLAGS_Q_reg_2_ ( .D(n625), .CK(clk), .RN(n3704), .Q(
        overflow_flag) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_30_ ( .D(n820), .CK(clk), .RN(n3701), .Q(
        final_result_ieee[30]) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_31_ ( .D(n614), .CK(clk), .RN(n3701), .Q(
        final_result_ieee[31]) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_10_ ( .D(n582), .CK(clk), .RN(n3701), .Q(
        final_result_ieee[10]) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_11_ ( .D(n581), .CK(clk), .RN(n3701), .Q(
        final_result_ieee[11]) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_25_ ( .D(n1167), .CK(clk), .RN(n3701), .Q(
        final_result_ieee[25]) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_26_ ( .D(n1164), .CK(clk), .RN(n3697), .Q(
        final_result_ieee[26]) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_29_ ( .D(n1169), .CK(clk), .RN(n3701), .Q(
        final_result_ieee[29]) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_23_ ( .D(n1165), .CK(clk), .RN(n3693), .Q(
        final_result_ieee[23]) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_24_ ( .D(n1168), .CK(clk), .RN(n3693), .Q(
        final_result_ieee[24]) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_27_ ( .D(n1166), .CK(clk), .RN(n3692), .Q(
        final_result_ieee[27]) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_28_ ( .D(n1170), .CK(clk), .RN(n3692), .Q(
        final_result_ieee[28]) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_9_ ( .D(n580), .CK(clk), .RN(n3694), .Q(
        final_result_ieee[9]) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_12_ ( .D(n579), .CK(clk), .RN(n3695), .Q(
        final_result_ieee[12]) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_8_ ( .D(n578), .CK(clk), .RN(n2844), .Q(
        final_result_ieee[8]) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_13_ ( .D(n577), .CK(clk), .RN(n3692), .Q(
        final_result_ieee[13]) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_7_ ( .D(n576), .CK(clk), .RN(n2846), .Q(
        final_result_ieee[7]) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_6_ ( .D(n575), .CK(clk), .RN(n2843), .Q(
        final_result_ieee[6]) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_5_ ( .D(n574), .CK(clk), .RN(n2844), .Q(
        final_result_ieee[5]) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_4_ ( .D(n573), .CK(clk), .RN(n2842), .Q(
        final_result_ieee[4]) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_3_ ( .D(n572), .CK(clk), .RN(n2845), .Q(
        final_result_ieee[3]) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_2_ ( .D(n571), .CK(clk), .RN(n3696), .Q(
        final_result_ieee[2]) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_1_ ( .D(n570), .CK(clk), .RN(n3693), .Q(
        final_result_ieee[1]) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_0_ ( .D(n569), .CK(clk), .RN(n3693), .Q(
        final_result_ieee[0]) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_14_ ( .D(n568), .CK(clk), .RN(n3695), .Q(
        final_result_ieee[14]) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_15_ ( .D(n567), .CK(clk), .RN(n3693), .Q(
        final_result_ieee[15]) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_16_ ( .D(n566), .CK(clk), .RN(n3693), .Q(
        final_result_ieee[16]) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_17_ ( .D(n565), .CK(clk), .RN(n3697), .Q(
        final_result_ieee[17]) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_18_ ( .D(n564), .CK(clk), .RN(n3693), .Q(
        final_result_ieee[18]) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_19_ ( .D(n563), .CK(clk), .RN(n3693), .Q(
        final_result_ieee[19]) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_20_ ( .D(n562), .CK(clk), .RN(n3693), .Q(
        final_result_ieee[20]) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_21_ ( .D(n561), .CK(clk), .RN(n2845), .Q(
        final_result_ieee[21]) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_22_ ( .D(n560), .CK(clk), .RN(n3693), .Q(
        final_result_ieee[22]) );
  CMPR32X2TS DP_OP_15J43_122_6956_U5 ( .A(DP_OP_15J43_122_6956_n14), .B(
        DMP_exp_NRM2_EW[4]), .C(DP_OP_15J43_122_6956_n5), .CO(
        DP_OP_15J43_122_6956_n4), .S(exp_rslt_NRM2_EW1[4]) );
  CMPR32X2TS DP_OP_15J43_122_6956_U7 ( .A(DP_OP_15J43_122_6956_n16), .B(
        DMP_exp_NRM2_EW[2]), .C(DP_OP_15J43_122_6956_n7), .CO(
        DP_OP_15J43_122_6956_n6), .S(exp_rslt_NRM2_EW1[2]) );
  CMPR32X2TS DP_OP_15J43_122_6956_U2 ( .A(n3725), .B(DMP_exp_NRM2_EW[7]), .C(
        DP_OP_15J43_122_6956_n2), .CO(DP_OP_15J43_122_6956_n1), .S(
        exp_rslt_NRM2_EW1[7]) );
  DFFSX2TS SGF_STAGE_DmP_mant_Q_reg_3_ ( .D(n3601), .CK(clk), .SN(n3696), .Q(
        n1514) );
  DFFRX2TS SHT2_STAGE_SHFTVARS2_Q_reg_0_ ( .D(n864), .CK(clk), .RN(n3687), 
        .QN(n1493) );
  DFFRX2TS SGF_STAGE_DMP_Q_reg_0_ ( .D(n784), .CK(clk), .RN(n3691), .QN(n2545)
         );
  DFFRX2TS SGF_STAGE_DMP_Q_reg_7_ ( .D(n763), .CK(clk), .RN(n3700), .QN(n2556)
         );
  DFFRX2TS SGF_STAGE_DmP_mant_Q_reg_4_ ( .D(n555), .CK(clk), .RN(n3691), .QN(
        n1503) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_4_ ( .D(n609), .CK(clk), .RN(n3684), .QN(
        n2535) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_24_ ( .D(n872), .CK(clk), .RN(n3687), 
        .QN(n1467) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_25_ ( .D(n904), .CK(clk), .RN(n3686), 
        .QN(n1440) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_16_ ( .D(n913), .CK(clk), .RN(n3688), 
        .QN(n1438) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_9_ ( .D(n920), .CK(clk), .RN(n3685), 
        .QN(n1488) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_5_ ( .D(n924), .CK(clk), .RN(n3687), 
        .QN(n1433) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_4_ ( .D(n925), .CK(clk), .RN(n3687), 
        .QN(n1434) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_22_ ( .D(n907), .CK(clk), .RN(n3685), 
        .QN(n1487) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_21_ ( .D(n908), .CK(clk), .RN(n3687), 
        .QN(n1458) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_20_ ( .D(n909), .CK(clk), .RN(n3685), 
        .QN(n1461) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_18_ ( .D(n911), .CK(clk), .RN(n3686), 
        .QN(n1463) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_17_ ( .D(n912), .CK(clk), .RN(n3686), 
        .QN(n1490) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_15_ ( .D(n914), .CK(clk), .RN(n3685), 
        .QN(n1457) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_14_ ( .D(n915), .CK(clk), .RN(n3685), 
        .QN(n1486) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_11_ ( .D(n918), .CK(clk), .RN(n3685), 
        .QN(n1489) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_10_ ( .D(n919), .CK(clk), .RN(n3688), 
        .QN(n1437) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_3_ ( .D(n926), .CK(clk), .RN(n3684), 
        .QN(n1455) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_7_ ( .D(n889), .CK(clk), .RN(n3687), 
        .QN(n1459) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_27_ ( .D(n902), .CK(clk), .RN(n3684), 
        .QN(n1464) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_26_ ( .D(n903), .CK(clk), .RN(n3686), 
        .QN(n73) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_13_ ( .D(n916), .CK(clk), .RN(n3685), 
        .QN(n1456) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_12_ ( .D(n917), .CK(clk), .RN(n3686), 
        .QN(n1462) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_2_ ( .D(n927), .CK(clk), .RN(n3690), 
        .QN(n1483) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_1_ ( .D(n928), .CK(clk), .RN(n2842), 
        .QN(n1482) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_0_ ( .D(n929), .CK(clk), .RN(n2843), 
        .QN(n1460) );
  DFFRX2TS SGF_STAGE_DmP_mant_Q_reg_17_ ( .D(n542), .CK(clk), .RN(n3691), .QN(
        n1507) );
  DFFRX2TS SGF_STAGE_DMP_Q_reg_5_ ( .D(n769), .CK(clk), .RN(n3694), .QN(n2551)
         );
  DFFRX2TS SGF_STAGE_DMP_Q_reg_10_ ( .D(n754), .CK(clk), .RN(n3700), .QN(n2558) );
  DFFRX2TS SGF_STAGE_DMP_Q_reg_15_ ( .D(n739), .CK(clk), .RN(n3699), .QN(n2565) );
  DFFRX2TS SGF_STAGE_DMP_Q_reg_19_ ( .D(n727), .CK(clk), .RN(n3698), .QN(n2599) );
  DFFRX2TS SGF_STAGE_DMP_Q_reg_4_ ( .D(n772), .CK(clk), .RN(n3700), .QN(n2548)
         );
  DFFRX2TS SGF_STAGE_DMP_Q_reg_11_ ( .D(n751), .CK(clk), .RN(n3699), .QN(n2560) );
  DFFRX2TS SGF_STAGE_DMP_Q_reg_8_ ( .D(n760), .CK(clk), .RN(n3700), .QN(n2557)
         );
  DFFRX2TS SGF_STAGE_DMP_Q_reg_13_ ( .D(n745), .CK(clk), .RN(n3699), .QN(n2561) );
  DFFRX2TS SGF_STAGE_DMP_Q_reg_12_ ( .D(n748), .CK(clk), .RN(n3699), .Q(n3604), 
        .QN(n2559) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_8_ ( .D(n888), .CK(clk), .RN(n2842), 
        .QN(n2536) );
  DFFRX2TS SGF_STAGE_DmP_mant_Q_reg_21_ ( .D(n538), .CK(clk), .RN(n3698), .QN(
        n1505) );
  DFFRX2TS inst_FSM_INPUT_ENABLE_state_reg_reg_1_ ( .D(
        inst_FSM_INPUT_ENABLE_state_next_1_), .CK(clk), .RN(n3683), .Q(
        inst_FSM_INPUT_ENABLE_state_reg[1]), .QN(n3610) );
  DFFRX2TS inst_ShiftRegister_Q_reg_4_ ( .D(n934), .CK(clk), .RN(n3683), .Q(
        busy), .QN(n3723) );
  DFFRX2TS inst_ShiftRegister_Q_reg_5_ ( .D(n935), .CK(clk), .RN(n3684), .Q(
        n2699), .QN(n3722) );
  DFFRX2TS SGF_STAGE_DMP_Q_reg_2_ ( .D(n778), .CK(clk), .RN(n2846), .Q(
        DMP_SFG[2]), .QN(n3632) );
  DFFRX2TS SGF_STAGE_DMP_Q_reg_1_ ( .D(n781), .CK(clk), .RN(n3691), .Q(
        DMP_SFG[1]), .QN(n3619) );
  DFFRX2TS SHT2_STAGE_SHFTVARS2_Q_reg_1_ ( .D(n863), .CK(clk), .RN(n3685), .Q(
        left_right_SHT2), .QN(n3659) );
  DFFRX2TS SGF_STAGE_DMP_Q_reg_22_ ( .D(n718), .CK(clk), .RN(n3690), .Q(n3680), 
        .QN(n2586) );
  DFFRX2TS SGF_STAGE_DMP_Q_reg_18_ ( .D(n730), .CK(clk), .RN(n3699), .Q(n3658), 
        .QN(n2575) );
  DFFRX2TS SGF_STAGE_DMP_Q_reg_14_ ( .D(n742), .CK(clk), .RN(n3690), .Q(n3645), 
        .QN(n2570) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_1_ ( .D(n612), .CK(clk), .RN(n2846), .Q(
        n3678), .QN(n1452) );
  DFFRX2TS SHT2_STAGE_SHFTVARS1_Q_reg_2_ ( .D(n836), .CK(clk), .RN(n3689), .Q(
        shift_value_SHT2_EWR[2]), .QN(n3656) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_10_ ( .D(n603), .CK(clk), .RN(n3689), .Q(
        Raw_mant_NRM_SWR[10]), .QN(n3608) );
  DFFRX2TS SGF_STAGE_DmP_mant_Q_reg_8_ ( .D(n551), .CK(clk), .RN(n3697), .Q(
        n3631), .QN(n1501) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_3_ ( .D(n610), .CK(clk), .RN(n3688), .Q(
        Raw_mant_NRM_SWR[3]), .QN(n3676) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_9_ ( .D(n604), .CK(clk), .RN(n3698), .Q(
        Raw_mant_NRM_SWR[9]), .QN(n3615) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_17_ ( .D(n596), .CK(clk), .RN(n3698), .Q(
        Raw_mant_NRM_SWR[17]), .QN(n3643) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_6_ ( .D(n607), .CK(clk), .RN(n3692), .Q(
        Raw_mant_NRM_SWR[6]), .QN(n3633) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_11_ ( .D(n602), .CK(clk), .RN(n3689), .Q(
        Raw_mant_NRM_SWR[11]), .QN(n3636) );
  DFFRX2TS SGF_STAGE_DmP_mant_Q_reg_16_ ( .D(n543), .CK(clk), .RN(n3691), .Q(
        n3647), .QN(n1520) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_23_ ( .D(n590), .CK(clk), .RN(n3689), .Q(
        Raw_mant_NRM_SWR[23]), .QN(n3655) );
  DFFRXLTS SHT1_STAGE_sft_amount_Q_reg_1_ ( .D(n831), .CK(clk), .RN(n2842), 
        .Q(Shift_amount_SHT1_EWR[1]) );
  DFFRX2TS inst_FSM_INPUT_ENABLE_state_reg_reg_2_ ( .D(n937), .CK(clk), .RN(
        n3688), .Q(inst_FSM_INPUT_ENABLE_state_reg[2]) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_2_ ( .D(n611), .CK(clk), .RN(n3688), .Q(
        Raw_mant_NRM_SWR[2]) );
  DFFRX2TS SGF_STAGE_DMP_Q_reg_21_ ( .D(n721), .CK(clk), .RN(n3691), .Q(
        DMP_SFG[21]) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_22_ ( .D(n874), .CK(clk), .RN(n3682), 
        .Q(intDY_EWSW[22]) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_3_ ( .D(n893), .CK(clk), .RN(n3686), .Q(
        intDY_EWSW[3]) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_21_ ( .D(n875), .CK(clk), .RN(n3681), 
        .Q(intDY_EWSW[21]) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_17_ ( .D(n879), .CK(clk), .RN(n3681), 
        .Q(intDY_EWSW[17]) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_13_ ( .D(n883), .CK(clk), .RN(n3684), 
        .Q(intDY_EWSW[13]) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_11_ ( .D(n885), .CK(clk), .RN(n3684), 
        .Q(intDY_EWSW[11]) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_1_ ( .D(n895), .CK(clk), .RN(n3681), .Q(
        intDY_EWSW[1]) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_0_ ( .D(n896), .CK(clk), .RN(n3686), .Q(
        intDY_EWSW[0]) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_9_ ( .D(n887), .CK(clk), .RN(n3686), .Q(
        intDY_EWSW[9]) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_2_ ( .D(n894), .CK(clk), .RN(n3688), .Q(
        intDY_EWSW[2]) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_27_ ( .D(n869), .CK(clk), .RN(n3688), 
        .Q(intDY_EWSW[27]) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_5_ ( .D(n891), .CK(clk), .RN(n3682), .Q(
        intDY_EWSW[5]) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_7_ ( .D(n922), .CK(clk), .RN(n3681), .Q(
        intDX_EWSW[7]) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_30_ ( .D(n866), .CK(clk), .RN(n3687), 
        .Q(intDY_EWSW[30]) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_8_ ( .D(n921), .CK(clk), .RN(n2843), .Q(
        n3623) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_12_ ( .D(n884), .CK(clk), .RN(n3682), 
        .Q(intDY_EWSW[12]) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_20_ ( .D(n876), .CK(clk), .RN(n3682), 
        .Q(intDY_EWSW[20]) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_18_ ( .D(n878), .CK(clk), .RN(n3688), 
        .Q(intDY_EWSW[18]) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_16_ ( .D(n880), .CK(clk), .RN(n3682), 
        .Q(intDY_EWSW[16]) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_15_ ( .D(n881), .CK(clk), .RN(n3681), 
        .Q(intDY_EWSW[15]) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_14_ ( .D(n882), .CK(clk), .RN(n3686), 
        .Q(intDY_EWSW[14]) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_10_ ( .D(n886), .CK(clk), .RN(n3684), 
        .Q(intDY_EWSW[10]) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_4_ ( .D(n892), .CK(clk), .RN(n3682), .Q(
        intDY_EWSW[4]) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_19_ ( .D(n594), .CK(clk), .RN(n3690), .Q(
        Raw_mant_NRM_SWR[19]) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_21_ ( .D(n592), .CK(clk), .RN(n3698), .Q(
        Raw_mant_NRM_SWR[21]) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_25_ ( .D(n588), .CK(clk), .RN(n3681), .Q(
        Raw_mant_NRM_SWR[25]) );
  DFFRX2TS SHT2_SHIFT_DATA_Q_reg_13_ ( .D(n850), .CK(clk), .RN(n3683), .Q(
        Data_array_SWR[13]) );
  DFFRX2TS SHT2_SHIFT_DATA_Q_reg_18_ ( .D(n855), .CK(clk), .RN(n3683), .Q(
        Data_array_SWR[18]) );
  DFFRX2TS SHT2_SHIFT_DATA_Q_reg_19_ ( .D(n856), .CK(clk), .RN(n3683), .Q(
        Data_array_SWR[19]) );
  DFFRX2TS SHT2_SHIFT_DATA_Q_reg_16_ ( .D(n853), .CK(clk), .RN(n3683), .Q(
        Data_array_SWR[16]) );
  DFFRX2TS SHT2_SHIFT_DATA_Q_reg_17_ ( .D(n854), .CK(clk), .RN(n3683), .Q(
        Data_array_SWR[17]) );
  DFFRX2TS SHT2_SHIFT_DATA_Q_reg_20_ ( .D(n857), .CK(clk), .RN(n3684), .Q(
        Data_array_SWR[20]) );
  DFFRX2TS SHT2_SHIFT_DATA_Q_reg_12_ ( .D(n849), .CK(clk), .RN(n3682), .Q(
        Data_array_SWR[12]) );
  DFFRX2TS SHT2_SHIFT_DATA_Q_reg_14_ ( .D(n851), .CK(clk), .RN(n3683), .Q(
        Data_array_SWR[14]) );
  DFFRX2TS SHT2_SHIFT_DATA_Q_reg_15_ ( .D(n852), .CK(clk), .RN(n3683), .Q(
        Data_array_SWR[15]) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_24_ ( .D(n589), .CK(clk), .RN(n3681), .Q(
        Raw_mant_NRM_SWR[24]) );
  DFFRX2TS SGF_STAGE_DMP_Q_reg_3_ ( .D(n775), .CK(clk), .RN(n3700), .Q(
        DMP_SFG[3]) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_20_ ( .D(n724), .CK(clk), .RN(n3689), .Q(n3670), 
        .QN(n2582) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_9_ ( .D(n550), .CK(clk), .RN(n3691), .Q(
        n3638), .QN(n1511) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_14_ ( .D(n599), .CK(clk), .RN(n3689), .Q(
        Raw_mant_NRM_SWR[14]), .QN(n3612) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_14_ ( .D(n545), .CK(clk), .RN(n3699), .Q(
        n2592), .QN(n3618) );
  DFFRX4TS inst_ShiftRegister_Q_reg_0_ ( .D(n930), .CK(clk), .RN(n3683), .Q(
        Shift_reg_FLAGS_7[0]), .QN(n3721) );
  DFFRX2TS SGF_STAGE_DMP_Q_reg_6_ ( .D(n766), .CK(clk), .RN(n3700), .Q(
        DMP_SFG[6]) );
  DFFRX2TS SGF_STAGE_DmP_mant_Q_reg_23_ ( .D(n536), .CK(clk), .RN(n3698), .Q(
        n2578) );
  DFFRX2TS SHT2_SHIFT_DATA_Q_reg_25_ ( .D(n862), .CK(clk), .RN(n3696), .Q(
        n2580) );
  DFFRX2TS SGF_STAGE_DMP_Q_reg_9_ ( .D(n757), .CK(clk), .RN(n3700), .Q(
        DMP_SFG[9]) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_12_ ( .D(n601), .CK(clk), .RN(n3698), .Q(
        Raw_mant_NRM_SWR[12]), .QN(n3644) );
  DFFRX1TS INPUT_STAGE_FLAGS_Q_reg_0_ ( .D(n897), .CK(clk), .RN(n3712), .Q(
        intAS) );
  DFFRX2TS SHT2_STAGE_SHFTVARS1_Q_reg_3_ ( .D(n835), .CK(clk), .RN(n2844), .Q(
        shift_value_SHT2_EWR[3]), .QN(n3609) );
  DFFRX2TS SGF_STAGE_DmP_mant_Q_reg_24_ ( .D(n535), .CK(clk), .RN(n3690), .Q(
        n3668), .QN(n1516) );
  DFFRX2TS SHT2_SHIFT_DATA_Q_reg_24_ ( .D(n861), .CK(clk), .RN(n3697), .Q(
        Data_array_SWR[24]) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_8_ ( .D(n605), .CK(clk), .RN(n3689), .Q(
        Raw_mant_NRM_SWR[8]), .QN(n3667) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_30_ ( .D(n899), .CK(clk), .RN(n3686), 
        .Q(n3679), .QN(n1465) );
  DFFRX2TS SHT2_STAGE_SHFTVARS1_Q_reg_4_ ( .D(n833), .CK(clk), .RN(n3687), .Q(
        shift_value_SHT2_EWR[4]), .QN(n3724) );
  DFFRX2TS inst_ShiftRegister_Q_reg_2_ ( .D(n932), .CK(clk), .RN(n3712), .Q(
        n2646), .QN(n2656) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_2_ ( .D(n557), .CK(clk), .RN(n3681), .Q(
        n3627), .QN(n1515) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_16_ ( .D(n597), .CK(clk), .RN(n3690), .Q(
        n3675), .QN(n2566) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_18_ ( .D(n595), .CK(clk), .RN(n3698), .Q(
        Raw_mant_NRM_SWR[18]), .QN(n3641) );
  DFFRX2TS SGF_STAGE_DmP_mant_Q_reg_10_ ( .D(n549), .CK(clk), .RN(n3700), .Q(
        n2591), .QN(n3626) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_28_ ( .D(n901), .CK(clk), .RN(n3688), 
        .QN(n1432) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_29_ ( .D(n900), .CK(clk), .RN(n3685), 
        .QN(n1491) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_19_ ( .D(n540), .CK(clk), .RN(n3690), .Q(
        n3603), .QN(n1506) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_17_ ( .D(n733), .CK(clk), .RN(n3699), .Q(n3602), 
        .QN(n2573) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_0_ ( .D(n559), .CK(clk), .RN(n3700), .QN(
        n2597) );
  DFFRX1TS EXP_STAGE_DmP_Q_reg_26_ ( .D(n628), .CK(clk), .RN(n3701), .QN(n1445) );
  DFFRX1TS EXP_STAGE_DmP_Q_reg_25_ ( .D(n629), .CK(clk), .RN(n3701), .QN(n1447) );
  DFFRX1TS EXP_STAGE_DMP_Q_reg_23_ ( .D(n1186), .CK(clk), .RN(n3695), .QN(
        n1492) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_16_ ( .D(n736), .CK(clk), .RN(n3699), .Q(n3653), 
        .QN(n2533) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_12_ ( .D(n547), .CK(clk), .RN(n2845), .Q(
        n3629), .QN(n1510) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_13_ ( .D(n546), .CK(clk), .RN(n3690), .Q(
        n3628), .QN(n1509) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_15_ ( .D(n544), .CK(clk), .RN(n3699), .Q(
        n2593), .QN(n3635) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_11_ ( .D(n548), .CK(clk), .RN(n3696), .Q(
        n2584), .QN(n3630) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_7_ ( .D(n552), .CK(clk), .RN(n2844), .Q(
        n3637), .QN(n1512) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_6_ ( .D(n553), .CK(clk), .RN(n3694), .Q(
        n3624), .QN(n1502) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_5_ ( .D(n554), .CK(clk), .RN(n3695), .Q(
        n3622), .QN(n1513) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_19_ ( .D(n877), .CK(clk), .RN(n3682), 
        .Q(intDY_EWSW[19]), .QN(n3642) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_6_ ( .D(n890), .CK(clk), .RN(n3682), .Q(
        intDY_EWSW[6]), .QN(n3634) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_22_ ( .D(n537), .CK(clk), .RN(n3691), .Q(
        n3662), .QN(n1517) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_15_ ( .D(n598), .CK(clk), .RN(n3690), .Q(
        Raw_mant_NRM_SWR[15]), .QN(n3621) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_20_ ( .D(n593), .CK(clk), .RN(n3690), .Q(
        Raw_mant_NRM_SWR[20]), .QN(n3613) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_13_ ( .D(n600), .CK(clk), .RN(n3691), .Q(
        Raw_mant_NRM_SWR[13]), .QN(n3625) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_18_ ( .D(n541), .CK(clk), .RN(n3699), .Q(
        n3652), .QN(n1519) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_22_ ( .D(n591), .CK(clk), .RN(n3689), .Q(
        Raw_mant_NRM_SWR[22]), .QN(n3620) );
  DFFRX1TS SFT2FRMT_STAGE_VARS_Q_reg_0_ ( .D(n713), .CK(clk), .RN(n3701), .Q(
        DMP_exp_NRM2_EW[0]) );
  DFFRX1TS SFT2FRMT_STAGE_VARS_Q_reg_8_ ( .D(n586), .CK(clk), .RN(n2845), .Q(
        LZD_output_NRM2_EW[0]) );
  DFFRX1TS SFT2FRMT_STAGE_VARS_Q_reg_9_ ( .D(n584), .CK(clk), .RN(n3688), .Q(
        LZD_output_NRM2_EW[1]) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_28_ ( .D(n868), .CK(clk), .RN(n3682), 
        .Q(intDY_EWSW[28]) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_31_ ( .D(n898), .CK(clk), .RN(n3685), 
        .Q(intDX_EWSW[31]) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_1_ ( .D(n558), .CK(clk), .RN(n3700), .QN(
        n1469) );
  ADDFHX2TS DP_OP_15J43_122_6956_U6 ( .A(DP_OP_15J43_122_6956_n15), .B(
        DMP_exp_NRM2_EW[3]), .CI(DP_OP_15J43_122_6956_n6), .CO(
        DP_OP_15J43_122_6956_n5), .S(exp_rslt_NRM2_EW1[3]) );
  ADDFHX2TS DP_OP_15J43_122_6956_U3 ( .A(n3725), .B(DMP_exp_NRM2_EW[6]), .CI(
        DP_OP_15J43_122_6956_n3), .CO(DP_OP_15J43_122_6956_n2), .S(
        exp_rslt_NRM2_EW1[6]) );
  DFFRX4TS SFT2FRMT_STAGE_FLAGS_Q_reg_2_ ( .D(n620), .CK(clk), .RN(n3681), .Q(
        n2563), .QN(n3725) );
  ADDFHX2TS DP_OP_15J43_122_6956_U4 ( .A(n3725), .B(DMP_exp_NRM2_EW[5]), .CI(
        DP_OP_15J43_122_6956_n4), .CO(DP_OP_15J43_122_6956_n3), .S(
        exp_rslt_NRM2_EW1[5]) );
  DFFRXLTS SHT2_SHIFT_DATA_Q_reg_2_ ( .D(n839), .CK(clk), .RN(n3703), .Q(
        Data_array_SWR[2]) );
  CMPR32X2TS DP_OP_15J43_122_6956_U9 ( .A(DMP_exp_NRM2_EW[0]), .B(n3725), .C(
        DP_OP_15J43_122_6956_n18), .CO(DP_OP_15J43_122_6956_n8), .S(
        exp_rslt_NRM2_EW1[0]) );
  CMPR32X2TS DP_OP_15J43_122_6956_U8 ( .A(DP_OP_15J43_122_6956_n17), .B(
        DMP_exp_NRM2_EW[1]), .C(DP_OP_15J43_122_6956_n8), .CO(
        DP_OP_15J43_122_6956_n7), .S(exp_rslt_NRM2_EW1[1]) );
  DFFRX2TS inst_ShiftRegister_Q_reg_1_ ( .D(n931), .CK(clk), .RN(n3696), .Q(
        n3605), .QN(n2657) );
  NAND2X2TS U3 ( .A(n3497), .B(n3189), .Y(n3214) );
  BUFX3TS U4 ( .A(n3300), .Y(n3327) );
  INVX6TS U5 ( .A(n3388), .Y(n2680) );
  BUFX3TS U6 ( .A(n2853), .Y(n3568) );
  INVX4TS U7 ( .A(n2661), .Y(n2662) );
  BUFX3TS U8 ( .A(n2853), .Y(n3566) );
  NAND2X1TS U9 ( .A(beg_OP), .B(n3574), .Y(n2853) );
  INVX2TS U10 ( .A(n2687), .Y(n2688) );
  BUFX3TS U11 ( .A(n3598), .Y(n3595) );
  NAND2X1TS U12 ( .A(n2875), .B(n3659), .Y(n3485) );
  INVX2TS U13 ( .A(n2640), .Y(n3598) );
  INVX2TS U14 ( .A(n2673), .Y(n2674) );
  BUFX3TS U15 ( .A(n3546), .Y(n3545) );
  OR2X2TS U16 ( .A(n3543), .B(n3393), .Y(n3346) );
  INVX2TS U17 ( .A(n2646), .Y(n3591) );
  INVX2TS U18 ( .A(n3552), .Y(n3543) );
  OAI32X4TS U19 ( .A0(n2822), .A1(Raw_mant_NRM_SWR[11]), .A2(n3608), .B0(n3644), .B1(n2822), .Y(n2841) );
  INVX2TS U20 ( .A(n2675), .Y(n2676) );
  INVX2TS U21 ( .A(n2689), .Y(n2690) );
  INVX2TS U22 ( .A(n3723), .Y(n2689) );
  NOR2X1TS U23 ( .A(n2721), .B(n3022), .Y(n2728) );
  NAND2X4TS U24 ( .A(n2771), .B(n2770), .Y(n3078) );
  NAND2X1TS U25 ( .A(n3580), .B(n3581), .Y(n2973) );
  NOR2X1TS U26 ( .A(Raw_mant_NRM_SWR[20]), .B(Raw_mant_NRM_SWR[19]), .Y(n2794)
         );
  NAND2X1TS U27 ( .A(n2722), .B(n3096), .Y(n2721) );
  OA21XLTS U28 ( .A0(n2548), .A1(n3624), .B0(n3065), .Y(n3034) );
  AOI31XLTS U29 ( .A0(n2836), .A1(n2839), .A2(Raw_mant_NRM_SWR[14]), .B0(n2815), .Y(n2809) );
  OAI21XLTS U30 ( .A0(n1501), .A1(n2893), .B0(n2962), .Y(n2882) );
  NOR2XLTS U31 ( .A(n3501), .B(n2971), .Y(n2983) );
  AND4X1TS U32 ( .A(exp_rslt_NRM2_EW1[3]), .B(exp_rslt_NRM2_EW1[1]), .C(n3161), 
        .D(n3160), .Y(n3162) );
  CLKINVX3TS U33 ( .A(n3346), .Y(n3461) );
  CLKINVX3TS U34 ( .A(n3545), .Y(n3539) );
  OAI21XLTS U35 ( .A0(n2983), .A1(n2982), .B0(n2981), .Y(n2984) );
  INVX2TS U36 ( .A(n2827), .Y(n2648) );
  CLKINVX3TS U37 ( .A(n3326), .Y(n3599) );
  CLKINVX3TS U38 ( .A(n3300), .Y(n3342) );
  OAI211XLTS U39 ( .A0(n2948), .A1(n2694), .B0(n2945), .C0(n2962), .Y(n558) );
  OAI21XLTS U40 ( .A0(n3155), .A1(n3154), .B0(n3153), .Y(n593) );
  OAI211XLTS U41 ( .A0(n2969), .A1(n2694), .B0(n2963), .C0(n2962), .Y(n559) );
  OAI21XLTS U42 ( .A0(n3346), .A1(n3609), .B0(n3345), .Y(n835) );
  OAI211XLTS U43 ( .A0(n3479), .A1(n3388), .B0(n3387), .C0(n3386), .Y(n852) );
  OAI21XLTS U44 ( .A0(n3020), .A1(n3019), .B0(n3018), .Y(n604) );
  OAI21XLTS U45 ( .A0(n2559), .A1(n3550), .B0(n2863), .Y(n748) );
  OAI21XLTS U46 ( .A0(n2556), .A1(n2893), .B0(n2860), .Y(n763) );
  OAI211XLTS U47 ( .A0(n3443), .A1(n2658), .B0(n3419), .C0(n3418), .Y(n839) );
  OAI21XLTS U48 ( .A0(n1487), .A1(n3291), .B0(n3269), .Y(n633) );
  OR2X4TS U49 ( .A(n3659), .B(n3596), .Y(n2647) );
  INVX6TS U50 ( .A(n2659), .Y(n2660) );
  AOI2BB2X1TS U51 ( .B0(n3444), .B1(Data_array_SWR[21]), .A0N(n3388), .A1N(
        n3471), .Y(n3381) );
  OAI21X1TS U52 ( .A0(n3346), .A1(n3724), .B0(n3299), .Y(n833) );
  AO21X1TS U53 ( .A0(n3598), .A1(n3523), .B0(n3300), .Y(n3524) );
  INVX4TS U54 ( .A(n3326), .Y(n3291) );
  AO22X1TS U55 ( .A0(n2676), .A1(final_result_ieee[31]), .B0(n3528), .B1(n3527), .Y(n614) );
  OAI31X2TS U56 ( .A0(Raw_mant_NRM_SWR[6]), .A1(Raw_mant_NRM_SWR[7]), .A2(
        n2801), .B0(n2800), .Y(n2813) );
  AO22X1TS U57 ( .A0(exp_rslt_NRM2_EW1[7]), .A1(n3528), .B0(n2676), .B1(
        final_result_ieee[30]), .Y(n820) );
  AOI2BB1X1TS U58 ( .A0N(overflow_flag), .A1N(Shift_reg_FLAGS_7[0]), .B0(n3528), .Y(n625) );
  AOI22X2TS U59 ( .A0(n2589), .A1(n3611), .B0(n3508), .B1(n3255), .Y(n3261) );
  OAI21X1TS U60 ( .A0(n3352), .A1(n3067), .B0(n3058), .Y(n3059) );
  OAI21X1TS U61 ( .A0(n3072), .A1(n3352), .B0(n3071), .Y(n3073) );
  OAI21X1TS U62 ( .A0(n2582), .A1(n2872), .B0(n2871), .Y(n724) );
  NAND2X2TS U63 ( .A(n3002), .B(n2719), .Y(n2720) );
  OAI21X1TS U64 ( .A0(n2586), .A1(n2938), .B0(n2876), .Y(n718) );
  OAI21X1TS U65 ( .A0(n2575), .A1(n3550), .B0(n2874), .Y(n730) );
  OAI21X1TS U66 ( .A0(n2533), .A1(n2893), .B0(n2864), .Y(n736) );
  OAI21X1TS U67 ( .A0(n2558), .A1(n2938), .B0(n2869), .Y(n754) );
  OAI21X1TS U68 ( .A0(n2557), .A1(n2938), .B0(n2862), .Y(n760) );
  AOI31X1TS U69 ( .A0(n2839), .A1(n3643), .A2(n2821), .B0(n2820), .Y(n2826) );
  OAI21X1TS U70 ( .A0(n2599), .A1(n3550), .B0(n2866), .Y(n727) );
  OAI21X1TS U71 ( .A0(n2565), .A1(n2938), .B0(n2867), .Y(n739) );
  OAI21X1TS U72 ( .A0(n2561), .A1(n2893), .B0(n2861), .Y(n745) );
  OAI21X1TS U73 ( .A0(n2548), .A1(n3550), .B0(n2870), .Y(n772) );
  OAI21X1TS U74 ( .A0(n2573), .A1(n3550), .B0(n2859), .Y(n733) );
  OAI21X1TS U75 ( .A0(n2545), .A1(n2938), .B0(n2873), .Y(n784) );
  OAI21X1TS U76 ( .A0(n2560), .A1(n2893), .B0(n2858), .Y(n751) );
  OAI21X1TS U77 ( .A0(n2570), .A1(n2938), .B0(n2865), .Y(n742) );
  OAI21X1TS U78 ( .A0(n1493), .A1(n3346), .B0(n2792), .Y(n864) );
  OAI21X1TS U79 ( .A0(n3346), .A1(n3659), .B0(n2696), .Y(n863) );
  NAND2X6TS U80 ( .A(n3146), .B(n2796), .Y(n2804) );
  INVX4TS U81 ( .A(n3545), .Y(n2872) );
  INVX2TS U82 ( .A(n3545), .Y(n2875) );
  OAI222X1TS U83 ( .A0(n3506), .A1(n3231), .B0(n1434), .B1(intDY_EWSW[4]), 
        .C0(intDY_EWSW[5]), .C1(n1433), .Y(n3232) );
  CLKINVX2TS U84 ( .A(n3145), .Y(n2796) );
  NOR2X1TS U85 ( .A(n2819), .B(Raw_mant_NRM_SWR[25]), .Y(n2820) );
  INVX4TS U86 ( .A(n3595), .Y(n3316) );
  BUFX3TS U87 ( .A(n2690), .Y(n3552) );
  NOR2BX2TS U88 ( .AN(n2806), .B(Raw_mant_NRM_SWR[23]), .Y(n2795) );
  INVX3TS U89 ( .A(n2675), .Y(n3213) );
  NAND2BX1TS U90 ( .AN(DMP_SFG[6]), .B(n1501), .Y(n2751) );
  NAND2X1TS U91 ( .A(n2566), .B(n3621), .Y(n2793) );
  OAI21X1TS U92 ( .A0(n3365), .A1(n3364), .B0(n3363), .Y(n589) );
  OAI211X1TS U93 ( .A0(n3459), .A1(n2659), .B0(n3408), .C0(n3407), .Y(n842) );
  OAI211X1TS U94 ( .A0(n3429), .A1(n2659), .B0(n3428), .C0(n3427), .Y(n855) );
  OAI211X1TS U95 ( .A0(n3448), .A1(n3478), .B0(n3447), .C0(n3446), .Y(n845) );
  OAI211X1TS U96 ( .A0(n3465), .A1(n2658), .B0(n3405), .C0(n3404), .Y(n848) );
  OAI211X1TS U97 ( .A0(n3415), .A1(n2659), .B0(n3414), .C0(n3413), .Y(n847) );
  OAI211X1TS U98 ( .A0(n3399), .A1(n2659), .B0(n3398), .C0(n3397), .Y(n841) );
  OAI211X1TS U99 ( .A0(n3443), .A1(n3478), .B0(n3442), .C0(n3441), .Y(n840) );
  OAI211X1TS U100 ( .A0(n3471), .A1(n2659), .B0(n3431), .C0(n3430), .Y(n856)
         );
  OAI211X1TS U101 ( .A0(n3439), .A1(n2659), .B0(n3438), .C0(n3437), .Y(n853)
         );
  OAI211X1TS U102 ( .A0(n3411), .A1(n2659), .B0(n3410), .C0(n3409), .Y(n846)
         );
  OAI211X1TS U103 ( .A0(n3434), .A1(n2659), .B0(n3433), .C0(n3432), .Y(n854)
         );
  OAI211X1TS U104 ( .A0(n3471), .A1(n2648), .B0(n3392), .C0(n3391), .Y(n859)
         );
  OAI211X1TS U105 ( .A0(n3459), .A1(n3478), .B0(n3458), .C0(n3457), .Y(n843)
         );
  OAI211X1TS U106 ( .A0(n3471), .A1(n3478), .B0(n3470), .C0(n3469), .Y(n857)
         );
  OAI211X1TS U107 ( .A0(n3465), .A1(n3478), .B0(n3464), .C0(n3463), .Y(n849)
         );
  OAI211X1TS U108 ( .A0(n3459), .A1(n3388), .B0(n3374), .C0(n3373), .Y(n844)
         );
  OAI211X1TS U109 ( .A0(n3454), .A1(n3388), .B0(n3378), .C0(n3377), .Y(n838)
         );
  OAI21X1TS U110 ( .A0(n3297), .A1(n3296), .B0(n3295), .Y(n591) );
  OAI211X1TS U111 ( .A0(n3429), .A1(n2648), .B0(n3381), .C0(n3380), .Y(n858)
         );
  OAI211X1TS U112 ( .A0(n3454), .A1(n3478), .B0(n3453), .C0(n3452), .Y(n837)
         );
  INVX6TS U113 ( .A(n3388), .Y(n2681) );
  OAI21X1TS U114 ( .A0(n3225), .A1(n3224), .B0(n3223), .Y(n592) );
  OAI21X1TS U115 ( .A0(n1432), .A1(n3342), .B0(n3338), .Y(n791) );
  OAI21X1TS U116 ( .A0(n1489), .A1(n3325), .B0(n3306), .Y(n808) );
  OAI21X1TS U117 ( .A0(n1490), .A1(n3336), .B0(n3333), .Y(n802) );
  OAI21X1TS U118 ( .A0(n1455), .A1(n3325), .B0(n3311), .Y(n816) );
  OAI211X1TS U119 ( .A0(n2650), .A1(n3216), .B0(n3211), .C0(n3214), .Y(n568)
         );
  OAI211X1TS U120 ( .A0(n3194), .A1(n3216), .B0(n3193), .C0(n3214), .Y(n561)
         );
  OAI211X1TS U121 ( .A0(n3191), .A1(n3216), .B0(n3190), .C0(n3214), .Y(n562)
         );
  OAI21X1TS U122 ( .A0(n1462), .A1(n3342), .B0(n3310), .Y(n807) );
  OAI21X1TS U123 ( .A0(n1483), .A1(n3342), .B0(n3315), .Y(n817) );
  OAI21X1TS U124 ( .A0(n3642), .A1(n3336), .B0(n3301), .Y(n639) );
  OAI21X1TS U125 ( .A0(n2536), .A1(n3342), .B0(n3304), .Y(n661) );
  OAI21X1TS U126 ( .A0(n3634), .A1(n3325), .B0(n3302), .Y(n665) );
  OAI21X1TS U127 ( .A0(n1459), .A1(n3325), .B0(n3319), .Y(n663) );
  OAI211X1TS U128 ( .A0(n3197), .A1(n3216), .B0(n3196), .C0(n3214), .Y(n563)
         );
  OAI21X1TS U129 ( .A0(n1488), .A1(n3325), .B0(n3307), .Y(n810) );
  OAI21X1TS U130 ( .A0(n3484), .A1(n3174), .B0(n3166), .Y(n579) );
  OAI21X1TS U131 ( .A0(n1457), .A1(n3287), .B0(n3285), .Y(n647) );
  OAI21X1TS U132 ( .A0(n1457), .A1(n3336), .B0(n3330), .Y(n804) );
  OAI21X1TS U133 ( .A0(n1437), .A1(n3325), .B0(n3320), .Y(n809) );
  OAI21X1TS U134 ( .A0(n3482), .A1(n3174), .B0(n3173), .Y(n577) );
  OAI21X1TS U135 ( .A0(n1487), .A1(n3600), .B0(n3329), .Y(n797) );
  OAI21X1TS U136 ( .A0(n1463), .A1(n3287), .B0(n3281), .Y(n641) );
  OAI211X1TS U137 ( .A0(n3203), .A1(n3216), .B0(n3202), .C0(n3214), .Y(n564)
         );
  OAI21X1TS U138 ( .A0(n1433), .A1(n3287), .B0(n3286), .Y(n667) );
  OAI211X1TS U139 ( .A0(n3200), .A1(n3216), .B0(n3199), .C0(n3214), .Y(n560)
         );
  OAI21X1TS U140 ( .A0(n1461), .A1(n3342), .B0(n3341), .Y(n799) );
  OAI21X1TS U141 ( .A0(n1459), .A1(n3287), .B0(n3279), .Y(n812) );
  OAI21X1TS U142 ( .A0(n1482), .A1(n3342), .B0(n3308), .Y(n818) );
  OAI21X1TS U143 ( .A0(n1463), .A1(n3325), .B0(n3318), .Y(n801) );
  OAI21X1TS U144 ( .A0(n1490), .A1(n3287), .B0(n3278), .Y(n643) );
  OAI21X1TS U145 ( .A0(n1434), .A1(n3325), .B0(n3317), .Y(n815) );
  OAI21X1TS U146 ( .A0(n1456), .A1(n3342), .B0(n3332), .Y(n806) );
  OAI21X1TS U147 ( .A0(n1435), .A1(n3600), .B0(n3321), .Y(n813) );
  OAI21X1TS U148 ( .A0(n1438), .A1(n3336), .B0(n3335), .Y(n803) );
  OAI21X1TS U149 ( .A0(n1456), .A1(n3287), .B0(n3283), .Y(n651) );
  OAI21X1TS U150 ( .A0(n1482), .A1(n3287), .B0(n3276), .Y(n675) );
  OAI21X1TS U151 ( .A0(n1486), .A1(n3342), .B0(n3305), .Y(n805) );
  OAI21X1TS U152 ( .A0(n1485), .A1(n3325), .B0(n3309), .Y(n800) );
  OAI21X1TS U153 ( .A0(n1458), .A1(n3342), .B0(n3331), .Y(n798) );
  OAI211X1TS U154 ( .A0(n2651), .A1(n3216), .B0(n3215), .C0(n3214), .Y(n567)
         );
  OAI21X1TS U155 ( .A0(n1488), .A1(n3287), .B0(n3277), .Y(n659) );
  OAI21X1TS U156 ( .A0(n1460), .A1(n3342), .B0(n3313), .Y(n819) );
  OAI21X1TS U157 ( .A0(n1491), .A1(n3336), .B0(n3303), .Y(n790) );
  OAI211X1TS U158 ( .A0(n3209), .A1(n3216), .B0(n3208), .C0(n3214), .Y(n565)
         );
  OAI21X1TS U159 ( .A0(n1433), .A1(n3600), .B0(n3312), .Y(n814) );
  OAI211X1TS U160 ( .A0(n3206), .A1(n3216), .B0(n3205), .C0(n3214), .Y(n566)
         );
  NOR2X2TS U161 ( .A(n3368), .B(n2829), .Y(n2827) );
  OAI21X1TS U162 ( .A0(n3139), .A1(n3138), .B0(n3137), .Y(n594) );
  OAI21X1TS U163 ( .A0(n3538), .A1(n2697), .B0(n3149), .Y(n836) );
  NAND3BX1TS U164 ( .AN(n2841), .B(n2703), .C(n3143), .Y(n3344) );
  OAI21X1TS U165 ( .A0(n3109), .A1(n3108), .B0(n3107), .Y(n595) );
  OAI21X1TS U166 ( .A0(n3121), .A1(n3120), .B0(n3119), .Y(n599) );
  OAI21X1TS U167 ( .A0(n3013), .A1(n3012), .B0(n3011), .Y(n596) );
  NAND2BX1TS U168 ( .AN(SIGN_FLAG_SHT1SHT2), .B(n3536), .Y(n3527) );
  OAI21X1TS U169 ( .A0(n3082), .A1(n3081), .B0(n3080), .Y(n597) );
  OAI31X2TS U170 ( .A0(n3264), .A1(n3263), .A2(n3262), .B0(n3510), .Y(n3265)
         );
  OAI21X1TS U171 ( .A0(n3053), .A1(n3052), .B0(n3051), .Y(n600) );
  NOR2X1TS U172 ( .A(n3721), .B(n3536), .Y(n3537) );
  OAI21X1TS U173 ( .A0(n3091), .A1(n3090), .B0(n3089), .Y(n598) );
  OAI21X1TS U174 ( .A0(n3032), .A1(n3031), .B0(n3030), .Y(n601) );
  INVX1TS U175 ( .A(n3126), .Y(n3124) );
  OAI21X1TS U176 ( .A0(n3103), .A1(n3102), .B0(n3101), .Y(n602) );
  AO21XLTS U177 ( .A0(n2791), .A1(n2790), .B0(n2789), .Y(n603) );
  OAI211X1TS U178 ( .A0(n3203), .A1(n2957), .B0(n2950), .C0(n2949), .Y(n539)
         );
  OAI21X1TS U179 ( .A0(n2651), .A1(n2957), .B0(n2937), .Y(n542) );
  OAI21X1TS U180 ( .A0(n2650), .A1(n2957), .B0(n2935), .Y(n543) );
  OAI211X1TS U181 ( .A0(n3206), .A1(n2957), .B0(n2956), .C0(n2955), .Y(n541)
         );
  OAI21X1TS U182 ( .A0(n3006), .A1(n3005), .B0(n3004), .Y(n605) );
  OAI21X1TS U183 ( .A0(n2679), .A1(n3677), .B0(n3061), .Y(n608) );
  OAI21X1TS U184 ( .A0(n2679), .A1(n3676), .B0(n2995), .Y(n610) );
  OAI21X1TS U185 ( .A0(n2678), .A1(n3633), .B0(n3075), .Y(n607) );
  OAI21X1TS U186 ( .A0(n2678), .A1(n2535), .B0(n2984), .Y(n609) );
  OAI211X1TS U187 ( .A0(n3209), .A1(n2961), .B0(n2887), .C0(n2886), .Y(n553)
         );
  OAI211X1TS U188 ( .A0(n3206), .A1(n2961), .B0(n2905), .C0(n2904), .Y(n552)
         );
  OAI21X1TS U189 ( .A0(n1520), .A1(n2893), .B0(n2967), .Y(n2934) );
  OAI211X1TS U190 ( .A0(n2933), .A1(n2694), .B0(n2931), .C0(n2962), .Y(n555)
         );
  OAI21X1TS U191 ( .A0(n1507), .A1(n2893), .B0(n2967), .Y(n2936) );
  OAI211X1TS U192 ( .A0(n2925), .A1(n2694), .B0(n2921), .C0(n2962), .Y(n557)
         );
  INVX2TS U193 ( .A(n2712), .Y(n3601) );
  OAI211X1TS U194 ( .A0(n3203), .A1(n2961), .B0(n2917), .C0(n2916), .Y(n554)
         );
  OAI21X1TS U195 ( .A0(n2650), .A1(n2961), .B0(n2895), .Y(n550) );
  OAI21X1TS U196 ( .A0(n2651), .A1(n2961), .B0(n2883), .Y(n551) );
  OAI21X1TS U197 ( .A0(n1506), .A1(n2893), .B0(n2967), .Y(n2939) );
  OAI21X1TS U198 ( .A0(n3046), .A1(n3045), .B0(n3044), .Y(n606) );
  OAI211X1TS U199 ( .A0(n2990), .A1(n3095), .B0(n2989), .C0(n2992), .Y(n2991)
         );
  OAI211X1TS U200 ( .A0(n3070), .A1(n3038), .B0(n3068), .C0(n3069), .Y(n3074)
         );
  OAI211X1TS U201 ( .A0(n2928), .A1(n3485), .B0(n2711), .C0(n2962), .Y(n2712)
         );
  OAI21X1TS U202 ( .A0(n3501), .A1(n2980), .B0(n2979), .Y(n2981) );
  OAI21X1TS U203 ( .A0(n1457), .A1(intDY_EWSW[15]), .B0(n3245), .Y(n3249) );
  OAI21X1TS U204 ( .A0(n1469), .A1(n3358), .B0(n2952), .Y(n612) );
  NAND2BX1TS U205 ( .AN(n3169), .B(n3168), .Y(n3170) );
  NAND2BX1TS U206 ( .AN(n3158), .B(n3157), .Y(n3159) );
  OAI211X1TS U207 ( .A0(n3038), .A1(n3064), .B0(n3057), .C0(n3056), .Y(n3060)
         );
  AOI222X1TS U208 ( .A0(Raw_mant_NRM_SWR[23]), .A1(n2674), .B0(n3449), .B1(
        Raw_mant_NRM_SWR[2]), .C0(n2665), .C1(DmP_mant_SHT1_SW[21]), .Y(n2828)
         );
  OAI21X1TS U209 ( .A0(n2551), .A1(n3539), .B0(n2868), .Y(n769) );
  AO22X1TS U210 ( .A0(n3566), .A1(n3606), .B0(n3570), .B1(Data_X[6]), .Y(n923)
         );
  AO22X1TS U211 ( .A0(n3568), .A1(n3607), .B0(n3570), .B1(Data_X[19]), .Y(n910) );
  AO22X1TS U212 ( .A0(n3529), .A1(n3651), .B0(n3570), .B1(Data_X[24]), .Y(n905) );
  AO22X1TS U213 ( .A0(n3566), .A1(n3639), .B0(n3570), .B1(Data_Y[25]), .Y(n871) );
  AO22X1TS U214 ( .A0(n3566), .A1(n3611), .B0(n3570), .B1(Data_X[23]), .Y(n906) );
  AO22X1TS U215 ( .A0(n3566), .A1(n3640), .B0(n3563), .B1(Data_Y[26]), .Y(n870) );
  AO22X1TS U216 ( .A0(n3530), .A1(Data_Y[31]), .B0(n3529), .B1(intDY_EWSW[31]), 
        .Y(n865) );
  AO22X1TS U217 ( .A0(n3571), .A1(n3650), .B0(n3570), .B1(Data_Y[23]), .Y(n873) );
  AO22X1TS U218 ( .A0(n3529), .A1(n3648), .B0(n3563), .B1(Data_Y[29]), .Y(n867) );
  AO22X1TS U219 ( .A0(n3570), .A1(Data_Y[22]), .B0(n3529), .B1(intDY_EWSW[22]), 
        .Y(n874) );
  AO22X1TS U220 ( .A0(n3571), .A1(intDY_EWSW[12]), .B0(n3570), .B1(Data_Y[12]), 
        .Y(n884) );
  AO22X1TS U221 ( .A0(n3562), .A1(Data_Y[28]), .B0(n3561), .B1(intDY_EWSW[28]), 
        .Y(n868) );
  AO22X1TS U222 ( .A0(n3562), .A1(Data_Y[20]), .B0(n3561), .B1(intDY_EWSW[20]), 
        .Y(n876) );
  AO22X1TS U223 ( .A0(n3566), .A1(n3623), .B0(n3570), .B1(Data_X[8]), .Y(n921)
         );
  AO22X1TS U224 ( .A0(n3529), .A1(intDY_EWSW[30]), .B0(n3563), .B1(Data_Y[30]), 
        .Y(n866) );
  AO22X1TS U225 ( .A0(n3566), .A1(intDY_EWSW[6]), .B0(n3563), .B1(Data_Y[6]), 
        .Y(n890) );
  AO22X1TS U226 ( .A0(n3562), .A1(Data_X[31]), .B0(n3529), .B1(intDX_EWSW[31]), 
        .Y(n898) );
  AO22X1TS U227 ( .A0(n3530), .A1(Data_X[7]), .B0(n3561), .B1(intDX_EWSW[7]), 
        .Y(n922) );
  AO22X1TS U228 ( .A0(n3566), .A1(intDY_EWSW[19]), .B0(n3563), .B1(Data_Y[19]), 
        .Y(n877) );
  AO22X1TS U229 ( .A0(n3530), .A1(Data_Y[5]), .B0(n3561), .B1(intDY_EWSW[5]), 
        .Y(n891) );
  AO22X1TS U230 ( .A0(n3570), .A1(Data_Y[3]), .B0(n3571), .B1(intDY_EWSW[3]), 
        .Y(n893) );
  AO22X1TS U231 ( .A0(n3562), .A1(Data_Y[18]), .B0(n3561), .B1(intDY_EWSW[18]), 
        .Y(n878) );
  AO22X1TS U232 ( .A0(n3530), .A1(Data_Y[27]), .B0(n3561), .B1(intDY_EWSW[27]), 
        .Y(n869) );
  AO22X1TS U233 ( .A0(n3562), .A1(Data_Y[16]), .B0(n3561), .B1(intDY_EWSW[16]), 
        .Y(n880) );
  AO22X1TS U234 ( .A0(n3562), .A1(Data_Y[15]), .B0(n3529), .B1(intDY_EWSW[15]), 
        .Y(n881) );
  AO22X1TS U235 ( .A0(n3530), .A1(Data_Y[21]), .B0(n3529), .B1(intDY_EWSW[21]), 
        .Y(n875) );
  AO22X1TS U236 ( .A0(n3567), .A1(Data_Y[2]), .B0(n3571), .B1(intDY_EWSW[2]), 
        .Y(n894) );
  AO22X1TS U237 ( .A0(n3562), .A1(Data_Y[14]), .B0(n3571), .B1(intDY_EWSW[14]), 
        .Y(n882) );
  AO22X1TS U238 ( .A0(n3530), .A1(Data_Y[13]), .B0(n3571), .B1(intDY_EWSW[13]), 
        .Y(n883) );
  AO22X1TS U239 ( .A0(n3562), .A1(Data_Y[4]), .B0(n3561), .B1(intDY_EWSW[4]), 
        .Y(n892) );
  AO22X1TS U240 ( .A0(n3562), .A1(add_subt), .B0(n3561), .B1(intAS), .Y(n897)
         );
  AO22X1TS U241 ( .A0(n3530), .A1(Data_Y[0]), .B0(n3571), .B1(intDY_EWSW[0]), 
        .Y(n896) );
  AO22X1TS U242 ( .A0(n3530), .A1(Data_Y[11]), .B0(n3571), .B1(intDY_EWSW[11]), 
        .Y(n885) );
  AO22X1TS U243 ( .A0(n3567), .A1(Data_Y[9]), .B0(n3571), .B1(intDY_EWSW[9]), 
        .Y(n887) );
  AO22X1TS U244 ( .A0(n3530), .A1(Data_Y[17]), .B0(n3529), .B1(intDY_EWSW[17]), 
        .Y(n879) );
  AO22X1TS U245 ( .A0(n3562), .A1(Data_Y[10]), .B0(n3561), .B1(intDY_EWSW[10]), 
        .Y(n886) );
  OAI211X2TS U246 ( .A0(n3724), .A1(n3191), .B0(n2885), .C0(n2884), .Y(n3207)
         );
  OAI211X2TS U247 ( .A0(n3206), .A1(n2669), .B0(n2919), .C0(n2918), .Y(n3192)
         );
  OAI211X2TS U248 ( .A0(n3209), .A1(n3724), .B0(n2709), .C0(n2708), .Y(n3188)
         );
  OAI211X2TS U249 ( .A0(n3203), .A1(n3724), .B0(n2930), .C0(n2929), .Y(n3195)
         );
  INVX2TS U250 ( .A(n2953), .Y(n3487) );
  OAI211X2TS U251 ( .A0(n3197), .A1(n3724), .B0(n2914), .C0(n2913), .Y(n3201)
         );
  OAI211X2TS U252 ( .A0(n3724), .A1(n2964), .B0(n2892), .C0(n2891), .Y(n3210)
         );
  OAI211X2TS U253 ( .A0(n2652), .A1(n3664), .B0(n3172), .C0(n3165), .Y(n3480)
         );
  OAI211X2TS U254 ( .A0(n3200), .A1(n2669), .B0(n2881), .C0(n2880), .Y(n3212)
         );
  OAI211X2TS U255 ( .A0(n1499), .A1(n2697), .B0(n3393), .C0(n2830), .Y(n3390)
         );
  AOI222X1TS U256 ( .A0(Raw_mant_NRM_SWR[22]), .A1(n3449), .B0(n3424), .B1(
        Raw_mant_NRM_SWR[3]), .C0(n3593), .C1(DmP_mant_SHT1_SW[1]), .Y(n3376)
         );
  OAI211X2TS U257 ( .A0(n2652), .A1(n3660), .B0(n3172), .C0(n3171), .Y(n3481)
         );
  OAI211X2TS U258 ( .A0(n2669), .A1(n3194), .B0(n2903), .C0(n2902), .Y(n3204)
         );
  NOR2X1TS U259 ( .A(n3426), .B(n3677), .Y(n3421) );
  NOR2X1TS U260 ( .A(n2696), .B(n3641), .Y(n3366) );
  NOR2X1TS U261 ( .A(n2697), .B(n3621), .Y(n3370) );
  INVX2TS U262 ( .A(n3544), .Y(n2938) );
  NOR2X1TS U263 ( .A(n3426), .B(n3613), .Y(n3394) );
  NOR2X1TS U264 ( .A(n3426), .B(n3636), .Y(n3400) );
  OAI21X1TS U265 ( .A0(n3586), .A1(n2877), .B0(n3587), .Y(n938) );
  INVX3TS U266 ( .A(n2655), .Y(n2672) );
  INVX3TS U267 ( .A(n3077), .Y(n3360) );
  NAND2X2TS U268 ( .A(n2756), .B(n2755), .Y(n3092) );
  CLKBUFX3TS U269 ( .A(n3492), .Y(n2670) );
  OR2X2TS U270 ( .A(shift_value_SHT2_EWR[4]), .B(n2910), .Y(n2655) );
  INVX3TS U271 ( .A(n3595), .Y(n3334) );
  AOI21X1TS U272 ( .A0(n2976), .A1(n2972), .B0(n2715), .Y(n2716) );
  INVX3TS U273 ( .A(n3595), .Y(n3340) );
  OR2X2TS U274 ( .A(n3593), .B(n3654), .Y(n3426) );
  NOR2X1TS U275 ( .A(n2768), .B(n3084), .Y(n2764) );
  AOI211X1TS U276 ( .A0(n1438), .A1(intDY_EWSW[16]), .B0(n3248), .C0(n3247), 
        .Y(n3511) );
  NAND2BX1TS U277 ( .AN(n3134), .B(n3133), .Y(n3138) );
  NAND2BX1TS U278 ( .AN(n3008), .B(n3007), .Y(n3012) );
  AOI2BB2X1TS U279 ( .B0(n1467), .B1(n3257), .A0N(n3639), .A1N(n1440), .Y(
        n3260) );
  NAND2BX1TS U280 ( .AN(n3220), .B(n3219), .Y(n3224) );
  NAND2BX1TS U281 ( .AN(n3350), .B(n3349), .Y(n3355) );
  OAI2BB2XLTS U282 ( .B0(intDY_EWSW[18]), .B1(n1463), .A0N(n3246), .A1N(n3226), 
        .Y(n3251) );
  OAI32X1TS U283 ( .A0(n3679), .A1(n3323), .A2(intDY_EWSW[30]), .B0(n3598), 
        .B1(DMP_EXP_EWSW[30]), .Y(n2857) );
  NAND2BX1TS U284 ( .AN(n3047), .B(n3048), .Y(n3031) );
  NAND2BX1TS U285 ( .AN(n3111), .B(n3110), .Y(n3052) );
  AO22X1TS U286 ( .A0(intDY_EWSW[21]), .A1(n1458), .B0(n1487), .B1(
        intDY_EWSW[22]), .Y(n3505) );
  NAND3X1TS U287 ( .A(inst_FSM_INPUT_ENABLE_state_reg[2]), .B(n3610), .C(n3649), .Y(n3587) );
  INVX3TS U288 ( .A(n3669), .Y(n3323) );
  OR2X2TS U289 ( .A(n2560), .B(n3628), .Y(n3110) );
  NOR2X1TS U290 ( .A(LZD_output_NRM2_EW[4]), .B(n2563), .Y(
        DP_OP_15J43_122_6956_n14) );
  NOR2X1TS U291 ( .A(Raw_mant_NRM_SWR[11]), .B(Raw_mant_NRM_SWR[10]), .Y(n2810) );
  NOR2X1TS U292 ( .A(LZD_output_NRM2_EW[2]), .B(n2563), .Y(
        DP_OP_15J43_122_6956_n16) );
  OAI22X2TS U293 ( .A0(n1460), .A1(intDY_EWSW[0]), .B0(intDY_EWSW[1]), .B1(
        n1482), .Y(n3229) );
  AOI222X4TS U294 ( .A0(n3251), .A1(n3250), .B0(n3249), .B1(n3511), .C0(n3642), 
        .C1(n3607), .Y(n3252) );
  OAI21X1TS U295 ( .A0(intDX_EWSW[31]), .A1(n3525), .B0(n3524), .Y(n3526) );
  NOR3X6TS U296 ( .A(Raw_mant_NRM_SWR[8]), .B(Raw_mant_NRM_SWR[9]), .C(n2797), 
        .Y(n2800) );
  OAI211X1TS U297 ( .A0(n3479), .A1(n3478), .B0(n3477), .C0(n3476), .Y(n851)
         );
  OAI21X1TS U298 ( .A0(n3356), .A1(n3355), .B0(n3354), .Y(n590) );
  OAI2BB1X4TS U299 ( .A0N(n2702), .A1N(n2718), .B0(n3039), .Y(n3002) );
  AOI222X2TS U300 ( .A0(intDY_EWSW[20]), .A1(n3252), .B0(intDY_EWSW[20]), .B1(
        n1461), .C0(n3252), .C1(n1461), .Y(n3253) );
  OAI21X1TS U301 ( .A0(n1483), .A1(n3287), .B0(n3275), .Y(n673) );
  AO22X2TS U302 ( .A0(n3150), .A1(n2776), .B0(n2575), .B1(n1518), .Y(n3221) );
  AOI2BB1X4TS U303 ( .A0N(n2573), .A1N(n1506), .B0(n2775), .Y(n3150) );
  AOI2BB1X2TS U304 ( .A0N(n3603), .A1N(n3602), .B0(n3135), .Y(n2775) );
  NAND3X8TS U305 ( .A(n2803), .B(n3636), .C(n3608), .Y(n2797) );
  NOR2X8TS U306 ( .A(Raw_mant_NRM_SWR[12]), .B(n2822), .Y(n2803) );
  AOI22X4TS U307 ( .A0(n3105), .A1(n2738), .B0(n1519), .B1(n3653), .Y(n3132)
         );
  CLKAND2X2TS U308 ( .A(n2557), .B(n2591), .Y(n3021) );
  CLKAND2X2TS U309 ( .A(n2560), .B(n1509), .Y(n3114) );
  NAND2X1TS U310 ( .A(n2548), .B(n3624), .Y(n3036) );
  OR2X1TS U311 ( .A(n1514), .B(n3619), .Y(n2987) );
  NOR2BX1TS U312 ( .AN(n2732), .B(n2731), .Y(n2733) );
  NAND3X1TS U313 ( .A(n3016), .B(n2728), .C(n3015), .Y(n2734) );
  OR2X1TS U314 ( .A(n1520), .B(n2570), .Y(n2772) );
  NAND2BXLTS U315 ( .AN(n2898), .B(n2897), .Y(n2899) );
  NOR2XLTS U316 ( .A(n3664), .B(n2896), .Y(n2898) );
  AO21XLTS U317 ( .A0(Data_array_SWR[24]), .A1(n2889), .B0(n2888), .Y(n2890)
         );
  AO22XLTS U318 ( .A0(Data_array_SWR[20]), .A1(n2912), .B0(Data_array_SWR[16]), 
        .B1(n2906), .Y(n2888) );
  NOR2X1TS U319 ( .A(LZD_output_NRM2_EW[1]), .B(n2563), .Y(
        DP_OP_15J43_122_6956_n17) );
  OAI211XLTS U320 ( .A0(n2948), .A1(n3487), .B0(n2947), .C0(n2967), .Y(n535)
         );
  CLKAND2X2TS U321 ( .A(n3110), .B(n3048), .Y(n2722) );
  NAND2X1TS U322 ( .A(n3093), .B(n2757), .Y(n3026) );
  NAND2X2TS U323 ( .A(n2759), .B(n2758), .Y(n3025) );
  NAND2BXLTS U324 ( .AN(DMP_SFG[9]), .B(n3630), .Y(n2758) );
  OR2X1TS U325 ( .A(n2560), .B(n1509), .Y(n3113) );
  OAI21XLTS U326 ( .A0(Raw_mant_NRM_SWR[21]), .A1(n3613), .B0(n3620), .Y(n2818) );
  OA21X1TS U327 ( .A0(n2557), .A1(n3626), .B0(n2784), .Y(n3093) );
  OR2X1TS U328 ( .A(n1514), .B(DMP_SFG[1]), .Y(n2976) );
  AOI22X2TS U329 ( .A0(n1502), .A1(n3063), .B0(n2744), .B1(n2548), .Y(n2997)
         );
  NAND2BXLTS U330 ( .AN(n2592), .B(n2559), .Y(n2766) );
  AO22X1TS U331 ( .A0(n1455), .A1(intDY_EWSW[3]), .B0(n1434), .B1(
        intDY_EWSW[4]), .Y(n3506) );
  INVX2TS U332 ( .A(n3096), .Y(n3024) );
  OR2X1TS U333 ( .A(n2558), .B(n3629), .Y(n3048) );
  CLKAND2X2TS U334 ( .A(n2558), .B(n3629), .Y(n3047) );
  OA21XLTS U335 ( .A0(n3112), .A1(n3111), .B0(n3110), .Y(n3117) );
  OR2X1TS U336 ( .A(n1518), .B(n2575), .Y(n2776) );
  CLKAND2X2TS U337 ( .A(n1469), .B(n2597), .Y(n3580) );
  AO21X1TS U338 ( .A0(n3049), .A1(n3048), .B0(n3047), .Y(n3112) );
  CLKAND2X2TS U339 ( .A(n2560), .B(n3628), .Y(n3111) );
  NAND2X1TS U340 ( .A(n1520), .B(n3645), .Y(n2736) );
  CLKAND2X2TS U341 ( .A(n2570), .B(n3647), .Y(n2737) );
  NOR2XLTS U342 ( .A(n3501), .B(n2988), .Y(n2993) );
  OR2X1TS U343 ( .A(n2907), .B(n2706), .Y(n2940) );
  NAND2BXLTS U344 ( .AN(n2705), .B(n2704), .Y(n2706) );
  NOR2XLTS U345 ( .A(n3660), .B(n2896), .Y(n2705) );
  NAND2X4TS U346 ( .A(n3189), .B(n2669), .Y(n3216) );
  AO21XLTS U347 ( .A0(n2580), .A1(n2889), .B0(n2878), .Y(n2879) );
  AO22XLTS U348 ( .A0(Data_array_SWR[21]), .A1(n2912), .B0(Data_array_SWR[17]), 
        .B1(n2906), .Y(n2878) );
  INVX2TS U349 ( .A(n2647), .Y(n2668) );
  NAND2X2TS U350 ( .A(n3123), .B(n3122), .Y(n3126) );
  NOR4X1TS U351 ( .A(exp_rslt_NRM2_EW1[3]), .B(exp_rslt_NRM2_EW1[0]), .C(
        exp_rslt_NRM2_EW1[5]), .D(exp_rslt_NRM2_EW1[6]), .Y(n3122) );
  OAI21XLTS U352 ( .A0(n3055), .A1(n3035), .B0(n3034), .Y(n3037) );
  OR2X1TS U353 ( .A(n2551), .B(n3637), .Y(n3040) );
  NAND2X1TS U354 ( .A(n3637), .B(n2551), .Y(n3039) );
  OAI21XLTS U355 ( .A0(n3664), .A1(n2663), .B0(n3167), .Y(n3169) );
  AO22XLTS U356 ( .A0(Data_array_SWR[24]), .A1(n2912), .B0(Data_array_SWR[20]), 
        .B1(n2906), .Y(n2908) );
  BUFX3TS U357 ( .A(n3548), .Y(n3503) );
  INVX2TS U358 ( .A(n3595), .Y(n3589) );
  INVX2TS U359 ( .A(n3326), .Y(n3287) );
  OAI222X1TS U360 ( .A0(n3487), .A1(n3484), .B0(n2694), .B1(n3486), .C0(n3618), 
        .C1(n3539), .Y(n545) );
  AOI22X1TS U361 ( .A0(n3361), .A1(n2741), .B0(n1516), .B1(n3680), .Y(n2742)
         );
  NAND3X2TS U362 ( .A(n2997), .B(n2996), .C(n2998), .Y(n2750) );
  NAND2BXLTS U363 ( .AN(DMP_SFG[3]), .B(n1513), .Y(n2743) );
  OR2X1TS U364 ( .A(n3618), .B(n2559), .Y(n2765) );
  OR2X1TS U365 ( .A(n2551), .B(n1512), .Y(n2999) );
  OAI211XLTS U366 ( .A0(n2725), .A1(n3097), .B0(n2724), .C0(n2723), .Y(n2726)
         );
  NOR2BX1TS U367 ( .AN(n2730), .B(n2729), .Y(n2731) );
  OR2X1TS U368 ( .A(n2556), .B(n1511), .Y(n2784) );
  NAND2X1TS U369 ( .A(n3620), .B(n2795), .Y(n3145) );
  OAI22X1TS U370 ( .A0(n3261), .A1(n3513), .B0(n3260), .B1(n3259), .Y(n3262)
         );
  NAND2X1TS U371 ( .A(intDY_EWSW[2]), .B(n1483), .Y(n3507) );
  NAND3BXLTS U372 ( .AN(n3055), .B(n3033), .C(n3036), .Y(n2718) );
  NOR2BX2TS U373 ( .AN(n2813), .B(n2812), .Y(n3504) );
  OAI21XLTS U374 ( .A0(Raw_mant_NRM_SWR[15]), .A1(n3612), .B0(n2566), .Y(n2821) );
  CLKAND2X2TS U375 ( .A(n2970), .B(n2987), .Y(n2980) );
  INVX4TS U376 ( .A(n2647), .Y(n2667) );
  NAND2X2TS U377 ( .A(n3497), .B(n2667), .Y(n3185) );
  INVX2TS U378 ( .A(rst), .Y(n2856) );
  MX2X1TS U379 ( .A(n2678), .B(Shift_reg_FLAGS_7[3]), .S0(n3594), .Y(n932) );
  MX2X1TS U380 ( .A(DMP_SHT2_EWSW[9]), .B(DMP_SFG[9]), .S0(n3544), .Y(n757) );
  OAI211XLTS U381 ( .A0(n2925), .A1(n3487), .B0(n2924), .C0(n2967), .Y(n536)
         );
  MX2X1TS U382 ( .A(DMP_SHT2_EWSW[6]), .B(DMP_SFG[6]), .S0(n3545), .Y(n766) );
  OAI21XLTS U383 ( .A0(n1511), .A1(n2893), .B0(n2962), .Y(n2894) );
  MX2X1TS U384 ( .A(DMP_SHT2_EWSW[3]), .B(DMP_SFG[3]), .S0(n3544), .Y(n775) );
  AOI2BB2XLTS U385 ( .B0(n3444), .B1(Data_array_SWR[16]), .A0N(n2648), .A1N(
        n3479), .Y(n3438) );
  AOI2BB2XLTS U386 ( .B0(n3217), .B1(n3218), .A0N(n3221), .A1N(n3038), .Y(
        n3225) );
  AOI2BB2XLTS U387 ( .B0(n3132), .B1(n3218), .A0N(n3135), .A1N(n3038), .Y(
        n3139) );
  AOI2BB2XLTS U388 ( .B0(n3504), .B1(n2666), .A0N(n3605), .A1N(
        LZD_output_NRM2_EW[1]), .Y(n584) );
  AO21XLTS U389 ( .A0(n3423), .A1(LZD_output_NRM2_EW[0]), .B0(n3535), .Y(n586)
         );
  AO22XLTS U390 ( .A0(n3547), .A1(DMP_exp_NRM2_EW[0]), .B0(n3605), .B1(
        DMP_exp_NRM_EW[0]), .Y(n713) );
  MX2X1TS U391 ( .A(DMP_SHT2_EWSW[21]), .B(DMP_SFG[21]), .S0(n3546), .Y(n721)
         );
  AOI2BB2XLTS U392 ( .B0(n2678), .B1(n3585), .A0N(Raw_mant_NRM_SWR[2]), .A1N(
        n2679), .Y(n611) );
  AO22XLTS U393 ( .A0(n3577), .A1(n3532), .B0(n2688), .B1(
        Shift_amount_SHT1_EWR[1]), .Y(n831) );
  AOI2BB2XLTS U394 ( .B0(n3347), .B1(n3348), .A0N(n3351), .A1N(n3358), .Y(
        n3356) );
  AOI2BB2XLTS U395 ( .B0(n2693), .B1(n3087), .A0N(n3086), .A1N(n3095), .Y(
        n3091) );
  AOI2BB2XLTS U396 ( .B0(n2692), .B1(n3099), .A0N(n3098), .A1N(n3095), .Y(
        n3103) );
  OAI211XLTS U397 ( .A0(n2928), .A1(n3487), .B0(n2927), .C0(n2967), .Y(n537)
         );
  OAI222X1TS U398 ( .A0(n3487), .A1(n3486), .B0(n2694), .B1(n3484), .C0(n3630), 
        .C1(n3539), .Y(n548) );
  OAI222X1TS U399 ( .A0(n3487), .A1(n3482), .B0(n2694), .B1(n3483), .C0(n3635), 
        .C1(n2872), .Y(n544) );
  MX2X1TS U400 ( .A(DMP_SHT2_EWSW[1]), .B(DMP_SFG[1]), .S0(n3544), .Y(n781) );
  MX2X1TS U401 ( .A(DMP_SHT2_EWSW[2]), .B(DMP_SFG[2]), .S0(n3544), .Y(n778) );
  OAI21XLTS U402 ( .A0(n2666), .A1(n3725), .B0(n2792), .Y(n620) );
  OAI21XLTS U403 ( .A0(n2942), .A1(n3487), .B0(n2941), .Y(n540) );
  OAI21XLTS U404 ( .A0(n3352), .A1(n2978), .B0(n2977), .Y(n2982) );
  OAI32X1TS U405 ( .A0(exp_rslt_NRM2_EW1[1]), .A1(n2677), .A2(n3124), .B0(
        Shift_reg_FLAGS_7[0]), .B1(final_result_ieee[24]), .Y(n3125) );
  OAI32X1TS U406 ( .A0(exp_rslt_NRM2_EW1[0]), .A1(n2677), .A2(n3163), .B0(
        Shift_reg_FLAGS_7[0]), .B1(final_result_ieee[23]), .Y(n3128) );
  OAI32X1TS U407 ( .A0(exp_rslt_NRM2_EW1[6]), .A1(n3721), .A2(n3163), .B0(
        Shift_reg_FLAGS_7[0]), .B1(final_result_ieee[29]), .Y(n3129) );
  OAI32X1TS U408 ( .A0(exp_rslt_NRM2_EW1[2]), .A1(n3721), .A2(n3163), .B0(
        Shift_reg_FLAGS_7[0]), .B1(final_result_ieee[25]), .Y(n3127) );
  AO21XLTS U409 ( .A0(n2676), .A1(underflow_flag), .B0(n3537), .Y(n626) );
  AOI2BB2XLTS U410 ( .B0(n3042), .B1(n3348), .A0N(n3038), .A1N(n3041), .Y(
        n3046) );
  AOI2BB2XLTS U411 ( .B0(n2693), .B1(n3078), .A0N(n3076), .A1N(n3095), .Y(
        n3082) );
  AO22XLTS U412 ( .A0(n3594), .A1(n2689), .B0(n3592), .B1(Shift_reg_FLAGS_7[3]), .Y(n933) );
  AO22XLTS U413 ( .A0(n3540), .A1(n3534), .B0(n3576), .B1(
        Shift_amount_SHT1_EWR[0]), .Y(n832) );
  OAI21XLTS U414 ( .A0(DmP_EXP_EWSW[23]), .A1(n1492), .B0(n3533), .Y(n3534) );
  AOI2BB2XLTS U415 ( .B0(beg_OP), .B1(n3610), .A0N(n3610), .A1N(
        inst_FSM_INPUT_ENABLE_state_reg[2]), .Y(n2877) );
  OAI211XLTS U416 ( .A0(n2969), .A1(n3487), .B0(n2968), .C0(n2967), .Y(n534)
         );
  AO22XLTS U417 ( .A0(n3592), .A1(n3598), .B0(n3594), .B1(n3574), .Y(n936) );
  AOI2BB2XLTS U418 ( .B0(n3473), .B1(Data_array_SWR[2]), .A0N(n3454), .A1N(
        n2648), .Y(n3419) );
  AO22XLTS U419 ( .A0(n3547), .A1(DMP_exp_NRM2_EW[2]), .B0(n2666), .B1(
        DMP_exp_NRM_EW[2]), .Y(n703) );
  AO22XLTS U420 ( .A0(n2665), .A1(DMP_exp_NRM2_EW[3]), .B0(n2666), .B1(
        DMP_exp_NRM_EW[3]), .Y(n698) );
  AO22XLTS U421 ( .A0(n3423), .A1(DMP_exp_NRM2_EW[5]), .B0(n2666), .B1(
        DMP_exp_NRM_EW[5]), .Y(n688) );
  AO22XLTS U422 ( .A0(n3423), .A1(DMP_exp_NRM2_EW[6]), .B0(n3393), .B1(
        DMP_exp_NRM_EW[6]), .Y(n683) );
  AO22XLTS U423 ( .A0(n2665), .A1(DMP_exp_NRM2_EW[7]), .B0(n2666), .B1(
        DMP_exp_NRM_EW[7]), .Y(n678) );
  MX2X1TS U424 ( .A(OP_FLAG_SHT2), .B(OP_FLAG_SFG), .S0(n3544), .Y(n622) );
  AO22XLTS U425 ( .A0(n3547), .A1(DMP_exp_NRM2_EW[1]), .B0(n3605), .B1(
        DMP_exp_NRM_EW[1]), .Y(n708) );
  AO22XLTS U426 ( .A0(n2665), .A1(DMP_exp_NRM2_EW[4]), .B0(n3605), .B1(
        DMP_exp_NRM_EW[4]), .Y(n693) );
  AOI2BB2XLTS U427 ( .B0(n3461), .B1(Data_array_SWR[8]), .A0N(n2648), .A1N(
        n3459), .Y(n3447) );
  AO22XLTS U428 ( .A0(n3423), .A1(LZD_output_NRM2_EW[4]), .B0(n2666), .B1(
        n3298), .Y(n583) );
  AOI2BB2XLTS U429 ( .B0(n3538), .B1(n2666), .A0N(n3605), .A1N(
        LZD_output_NRM2_EW[2]), .Y(n585) );
  AO22XLTS U430 ( .A0(n3547), .A1(LZD_output_NRM2_EW[3]), .B0(n2666), .B1(
        n3344), .Y(n587) );
  AO22XLTS U431 ( .A0(n2657), .A1(SIGN_FLAG_SHT1SHT2), .B0(n2666), .B1(
        SIGN_FLAG_NRM), .Y(n615) );
  AO22XLTS U432 ( .A0(n2678), .A1(SIGN_FLAG_SFG), .B0(n3591), .B1(
        SIGN_FLAG_NRM), .Y(n616) );
  AO22XLTS U433 ( .A0(n2872), .A1(SIGN_FLAG_SHT2), .B0(n3545), .B1(
        SIGN_FLAG_SFG), .Y(n617) );
  AO22XLTS U434 ( .A0(n3543), .A1(SIGN_FLAG_SHT1), .B0(n3552), .B1(
        SIGN_FLAG_SHT2), .Y(n618) );
  AO22XLTS U435 ( .A0(n2687), .A1(SIGN_FLAG_EXP), .B0(n3722), .B1(
        SIGN_FLAG_SHT1), .Y(n619) );
  AO22XLTS U436 ( .A0(n3543), .A1(OP_FLAG_SHT1), .B0(n2690), .B1(OP_FLAG_SHT2), 
        .Y(n623) );
  AO22XLTS U437 ( .A0(n3540), .A1(OP_FLAG_EXP), .B0(n3722), .B1(OP_FLAG_SHT1), 
        .Y(n624) );
  AO22XLTS U438 ( .A0(n3540), .A1(DmP_EXP_EWSW[22]), .B0(n3541), .B1(
        DmP_mant_SHT1_SW[22]), .Y(n632) );
  AO22XLTS U439 ( .A0(n3540), .A1(DmP_EXP_EWSW[21]), .B0(n3541), .B1(
        DmP_mant_SHT1_SW[21]), .Y(n634) );
  AO22XLTS U440 ( .A0(n3540), .A1(DmP_EXP_EWSW[20]), .B0(n3541), .B1(
        DmP_mant_SHT1_SW[20]), .Y(n636) );
  AO22XLTS U441 ( .A0(n2699), .A1(DmP_EXP_EWSW[19]), .B0(n3541), .B1(
        DmP_mant_SHT1_SW[19]), .Y(n638) );
  AO22XLTS U442 ( .A0(n3540), .A1(DmP_EXP_EWSW[18]), .B0(n3541), .B1(
        DmP_mant_SHT1_SW[18]), .Y(n640) );
  AO22XLTS U443 ( .A0(n3540), .A1(DmP_EXP_EWSW[17]), .B0(n3541), .B1(
        DmP_mant_SHT1_SW[17]), .Y(n642) );
  AO22XLTS U444 ( .A0(n3540), .A1(DmP_EXP_EWSW[16]), .B0(n3541), .B1(
        DmP_mant_SHT1_SW[16]), .Y(n644) );
  AO22XLTS U445 ( .A0(n3540), .A1(DmP_EXP_EWSW[15]), .B0(n3541), .B1(
        DmP_mant_SHT1_SW[15]), .Y(n646) );
  AO22XLTS U446 ( .A0(n3540), .A1(DmP_EXP_EWSW[14]), .B0(n3541), .B1(
        DmP_mant_SHT1_SW[14]), .Y(n648) );
  AO22XLTS U447 ( .A0(n2699), .A1(DmP_EXP_EWSW[13]), .B0(n3541), .B1(
        DmP_mant_SHT1_SW[13]), .Y(n650) );
  AO22XLTS U448 ( .A0(n2699), .A1(DmP_EXP_EWSW[12]), .B0(n3542), .B1(
        DmP_mant_SHT1_SW[12]), .Y(n652) );
  AO22XLTS U449 ( .A0(n2699), .A1(DmP_EXP_EWSW[11]), .B0(n3542), .B1(
        DmP_mant_SHT1_SW[11]), .Y(n654) );
  AO22XLTS U450 ( .A0(n2699), .A1(DmP_EXP_EWSW[10]), .B0(n3542), .B1(
        DmP_mant_SHT1_SW[10]), .Y(n656) );
  AO22XLTS U451 ( .A0(n2699), .A1(DmP_EXP_EWSW[9]), .B0(n3542), .B1(
        DmP_mant_SHT1_SW[9]), .Y(n658) );
  AO22XLTS U452 ( .A0(n2699), .A1(DmP_EXP_EWSW[8]), .B0(n3542), .B1(
        DmP_mant_SHT1_SW[8]), .Y(n660) );
  AO22XLTS U453 ( .A0(n3579), .A1(DmP_EXP_EWSW[7]), .B0(n3542), .B1(
        DmP_mant_SHT1_SW[7]), .Y(n662) );
  AO22XLTS U454 ( .A0(n2699), .A1(DmP_EXP_EWSW[6]), .B0(n3542), .B1(
        DmP_mant_SHT1_SW[6]), .Y(n664) );
  AO22XLTS U455 ( .A0(n2699), .A1(DmP_EXP_EWSW[5]), .B0(n3542), .B1(
        DmP_mant_SHT1_SW[5]), .Y(n666) );
  AO22XLTS U456 ( .A0(n2699), .A1(DmP_EXP_EWSW[4]), .B0(n3542), .B1(
        DmP_mant_SHT1_SW[4]), .Y(n668) );
  AO22XLTS U457 ( .A0(n3579), .A1(DmP_EXP_EWSW[3]), .B0(n3542), .B1(
        DmP_mant_SHT1_SW[3]), .Y(n670) );
  AO22XLTS U458 ( .A0(n3579), .A1(DmP_EXP_EWSW[2]), .B0(n3555), .B1(
        DmP_mant_SHT1_SW[2]), .Y(n672) );
  AO22XLTS U459 ( .A0(n3579), .A1(DmP_EXP_EWSW[1]), .B0(n3555), .B1(
        DmP_mant_SHT1_SW[1]), .Y(n674) );
  AO22XLTS U460 ( .A0(n3579), .A1(DmP_EXP_EWSW[0]), .B0(n3555), .B1(
        DmP_mant_SHT1_SW[0]), .Y(n676) );
  AO22XLTS U461 ( .A0(n2679), .A1(DMP_SFG[30]), .B0(n3591), .B1(
        DMP_exp_NRM_EW[7]), .Y(n679) );
  AO22XLTS U462 ( .A0(n3550), .A1(DMP_SHT2_EWSW[30]), .B0(n3549), .B1(
        DMP_SFG[30]), .Y(n680) );
  AO22XLTS U463 ( .A0(n3543), .A1(DMP_SHT1_EWSW[30]), .B0(n3723), .B1(
        DMP_SHT2_EWSW[30]), .Y(n681) );
  AO22XLTS U464 ( .A0(n3579), .A1(DMP_EXP_EWSW[30]), .B0(n3555), .B1(
        DMP_SHT1_EWSW[30]), .Y(n682) );
  AO22XLTS U465 ( .A0(n2678), .A1(DMP_SFG[29]), .B0(n3591), .B1(
        DMP_exp_NRM_EW[6]), .Y(n684) );
  AO22XLTS U466 ( .A0(n2938), .A1(DMP_SHT2_EWSW[29]), .B0(n3549), .B1(
        DMP_SFG[29]), .Y(n685) );
  AO22XLTS U467 ( .A0(n3543), .A1(DMP_SHT1_EWSW[29]), .B0(n3723), .B1(
        DMP_SHT2_EWSW[29]), .Y(n686) );
  AO22XLTS U468 ( .A0(n3579), .A1(DMP_EXP_EWSW[29]), .B0(n3555), .B1(
        DMP_SHT1_EWSW[29]), .Y(n687) );
  AO22XLTS U469 ( .A0(n2679), .A1(DMP_SFG[28]), .B0(n3591), .B1(
        DMP_exp_NRM_EW[5]), .Y(n689) );
  AO22XLTS U470 ( .A0(n3550), .A1(DMP_SHT2_EWSW[28]), .B0(n3546), .B1(
        DMP_SFG[28]), .Y(n690) );
  AO22XLTS U471 ( .A0(n3543), .A1(DMP_SHT1_EWSW[28]), .B0(n3552), .B1(
        DMP_SHT2_EWSW[28]), .Y(n691) );
  AO22XLTS U472 ( .A0(n3579), .A1(DMP_EXP_EWSW[28]), .B0(n3555), .B1(
        DMP_SHT1_EWSW[28]), .Y(n692) );
  AO22XLTS U473 ( .A0(n2678), .A1(DMP_SFG[27]), .B0(n3591), .B1(
        DMP_exp_NRM_EW[4]), .Y(n694) );
  AO22XLTS U474 ( .A0(n2938), .A1(DMP_SHT2_EWSW[27]), .B0(n3544), .B1(
        DMP_SFG[27]), .Y(n695) );
  AO22XLTS U475 ( .A0(n3551), .A1(DMP_SHT1_EWSW[27]), .B0(n3723), .B1(
        DMP_SHT2_EWSW[27]), .Y(n696) );
  AO22XLTS U476 ( .A0(n3579), .A1(DMP_EXP_EWSW[27]), .B0(n3555), .B1(
        DMP_SHT1_EWSW[27]), .Y(n697) );
  AO22XLTS U477 ( .A0(n2679), .A1(DMP_SFG[26]), .B0(n3548), .B1(
        DMP_exp_NRM_EW[3]), .Y(n699) );
  AO22XLTS U478 ( .A0(n3550), .A1(DMP_SHT2_EWSW[26]), .B0(n3545), .B1(
        DMP_SFG[26]), .Y(n700) );
  AO22XLTS U479 ( .A0(n3551), .A1(DMP_SHT1_EWSW[26]), .B0(n2690), .B1(
        DMP_SHT2_EWSW[26]), .Y(n701) );
  AO22XLTS U480 ( .A0(n3577), .A1(n3665), .B0(n3590), .B1(DMP_SHT1_EWSW[26]), 
        .Y(n702) );
  AO22XLTS U481 ( .A0(n2678), .A1(DMP_SFG[25]), .B0(n3591), .B1(
        DMP_exp_NRM_EW[2]), .Y(n704) );
  AO22XLTS U482 ( .A0(n2938), .A1(DMP_SHT2_EWSW[25]), .B0(n3546), .B1(
        DMP_SFG[25]), .Y(n705) );
  AO22XLTS U483 ( .A0(n3551), .A1(DMP_SHT1_EWSW[25]), .B0(n3723), .B1(
        DMP_SHT2_EWSW[25]), .Y(n706) );
  AO22XLTS U484 ( .A0(n3577), .A1(n3666), .B0(n3576), .B1(DMP_SHT1_EWSW[25]), 
        .Y(n707) );
  AO22XLTS U485 ( .A0(n2679), .A1(DMP_SFG[24]), .B0(n3591), .B1(
        DMP_exp_NRM_EW[1]), .Y(n709) );
  AO22XLTS U486 ( .A0(n3550), .A1(DMP_SHT2_EWSW[24]), .B0(n3546), .B1(
        DMP_SFG[24]), .Y(n710) );
  AO22XLTS U487 ( .A0(n3551), .A1(DMP_SHT1_EWSW[24]), .B0(n2690), .B1(
        DMP_SHT2_EWSW[24]), .Y(n711) );
  AO22XLTS U488 ( .A0(n3579), .A1(n3614), .B0(n3578), .B1(DMP_SHT1_EWSW[24]), 
        .Y(n712) );
  AO22XLTS U489 ( .A0(n2678), .A1(DMP_SFG[23]), .B0(n3548), .B1(
        DMP_exp_NRM_EW[0]), .Y(n714) );
  AO22XLTS U490 ( .A0(n2938), .A1(DMP_SHT2_EWSW[23]), .B0(n3549), .B1(
        DMP_SFG[23]), .Y(n715) );
  AO22XLTS U491 ( .A0(n3551), .A1(DMP_SHT1_EWSW[23]), .B0(n3723), .B1(
        DMP_SHT2_EWSW[23]), .Y(n716) );
  AOI2BB2XLTS U492 ( .B0(n3577), .B1(n1492), .A0N(DMP_SHT1_EWSW[23]), .A1N(
        n2687), .Y(n717) );
  AO22XLTS U493 ( .A0(n3551), .A1(DMP_SHT1_EWSW[22]), .B0(n3553), .B1(
        DMP_SHT2_EWSW[22]), .Y(n719) );
  AO22XLTS U494 ( .A0(n3554), .A1(DMP_EXP_EWSW[22]), .B0(n3555), .B1(
        DMP_SHT1_EWSW[22]), .Y(n720) );
  AO22XLTS U495 ( .A0(n3551), .A1(DMP_SHT1_EWSW[21]), .B0(n3553), .B1(
        DMP_SHT2_EWSW[21]), .Y(n722) );
  AO22XLTS U496 ( .A0(n3554), .A1(DMP_EXP_EWSW[21]), .B0(n3555), .B1(
        DMP_SHT1_EWSW[21]), .Y(n723) );
  AO22XLTS U497 ( .A0(n3551), .A1(DMP_SHT1_EWSW[20]), .B0(n3553), .B1(
        DMP_SHT2_EWSW[20]), .Y(n725) );
  AO22XLTS U498 ( .A0(n3554), .A1(DMP_EXP_EWSW[20]), .B0(n3722), .B1(
        DMP_SHT1_EWSW[20]), .Y(n726) );
  AO22XLTS U499 ( .A0(n3551), .A1(DMP_SHT1_EWSW[19]), .B0(n3553), .B1(
        DMP_SHT2_EWSW[19]), .Y(n728) );
  AO22XLTS U500 ( .A0(n3554), .A1(DMP_EXP_EWSW[19]), .B0(n3722), .B1(
        DMP_SHT1_EWSW[19]), .Y(n729) );
  AO22XLTS U501 ( .A0(n3551), .A1(DMP_SHT1_EWSW[18]), .B0(n3553), .B1(
        DMP_SHT2_EWSW[18]), .Y(n731) );
  AO22XLTS U502 ( .A0(n3554), .A1(DMP_EXP_EWSW[18]), .B0(n2688), .B1(
        DMP_SHT1_EWSW[18]), .Y(n732) );
  AO22XLTS U503 ( .A0(n2689), .A1(DMP_SHT1_EWSW[17]), .B0(n3553), .B1(
        DMP_SHT2_EWSW[17]), .Y(n734) );
  AO22XLTS U504 ( .A0(n3554), .A1(DMP_EXP_EWSW[17]), .B0(n3590), .B1(
        DMP_SHT1_EWSW[17]), .Y(n735) );
  AO22XLTS U505 ( .A0(n2689), .A1(DMP_SHT1_EWSW[16]), .B0(n3553), .B1(
        DMP_SHT2_EWSW[16]), .Y(n737) );
  AO22XLTS U506 ( .A0(n3554), .A1(DMP_EXP_EWSW[16]), .B0(n3590), .B1(
        DMP_SHT1_EWSW[16]), .Y(n738) );
  AO22XLTS U507 ( .A0(n2689), .A1(DMP_SHT1_EWSW[15]), .B0(n3553), .B1(
        DMP_SHT2_EWSW[15]), .Y(n740) );
  AO22XLTS U508 ( .A0(n3554), .A1(DMP_EXP_EWSW[15]), .B0(n2688), .B1(
        DMP_SHT1_EWSW[15]), .Y(n741) );
  AO22XLTS U509 ( .A0(n2689), .A1(DMP_SHT1_EWSW[14]), .B0(n3553), .B1(
        DMP_SHT2_EWSW[14]), .Y(n743) );
  AO22XLTS U510 ( .A0(n3554), .A1(DMP_EXP_EWSW[14]), .B0(n2688), .B1(
        DMP_SHT1_EWSW[14]), .Y(n744) );
  AO22XLTS U511 ( .A0(DMP_SHT1_EWSW[13]), .A1(n3543), .B0(DMP_SHT2_EWSW[13]), 
        .B1(n3723), .Y(n746) );
  AO22XLTS U512 ( .A0(n3556), .A1(DMP_EXP_EWSW[13]), .B0(n3722), .B1(
        DMP_SHT1_EWSW[13]), .Y(n747) );
  AO22XLTS U513 ( .A0(DMP_SHT1_EWSW[12]), .A1(n3543), .B0(DMP_SHT2_EWSW[12]), 
        .B1(n3552), .Y(n749) );
  AO22XLTS U514 ( .A0(n3556), .A1(DMP_EXP_EWSW[12]), .B0(n3722), .B1(
        DMP_SHT1_EWSW[12]), .Y(n750) );
  AO22XLTS U515 ( .A0(DMP_SHT1_EWSW[11]), .A1(n3543), .B0(DMP_SHT2_EWSW[11]), 
        .B1(n2690), .Y(n752) );
  AO22XLTS U516 ( .A0(n3556), .A1(DMP_EXP_EWSW[11]), .B0(n3722), .B1(
        DMP_SHT1_EWSW[11]), .Y(n753) );
  AO22XLTS U517 ( .A0(DMP_SHT1_EWSW[10]), .A1(n3543), .B0(DMP_SHT2_EWSW[10]), 
        .B1(n3552), .Y(n755) );
  AO22XLTS U518 ( .A0(n3554), .A1(DMP_EXP_EWSW[10]), .B0(n3578), .B1(
        DMP_SHT1_EWSW[10]), .Y(n756) );
  AO22XLTS U519 ( .A0(DMP_SHT1_EWSW[9]), .A1(n2689), .B0(DMP_SHT2_EWSW[9]), 
        .B1(n3723), .Y(n758) );
  AO22XLTS U520 ( .A0(n3556), .A1(DMP_EXP_EWSW[9]), .B0(n3578), .B1(
        DMP_SHT1_EWSW[9]), .Y(n759) );
  AO22XLTS U521 ( .A0(DMP_SHT1_EWSW[8]), .A1(busy), .B0(DMP_SHT2_EWSW[8]), 
        .B1(n2690), .Y(n761) );
  AO22XLTS U522 ( .A0(n3556), .A1(DMP_EXP_EWSW[8]), .B0(n3555), .B1(
        DMP_SHT1_EWSW[8]), .Y(n762) );
  AO22XLTS U523 ( .A0(DMP_SHT1_EWSW[7]), .A1(busy), .B0(DMP_SHT2_EWSW[7]), 
        .B1(n3723), .Y(n1527) );
  AO22XLTS U524 ( .A0(n3556), .A1(DMP_EXP_EWSW[7]), .B0(n3578), .B1(
        DMP_SHT1_EWSW[7]), .Y(n765) );
  AO22XLTS U525 ( .A0(DMP_SHT1_EWSW[6]), .A1(busy), .B0(DMP_SHT2_EWSW[6]), 
        .B1(n2690), .Y(n1528) );
  AO22XLTS U526 ( .A0(n3556), .A1(DMP_EXP_EWSW[6]), .B0(n3578), .B1(
        DMP_SHT1_EWSW[6]), .Y(n768) );
  AO22XLTS U527 ( .A0(DMP_SHT1_EWSW[5]), .A1(busy), .B0(DMP_SHT2_EWSW[5]), 
        .B1(n2690), .Y(n1529) );
  AO22XLTS U528 ( .A0(n3556), .A1(DMP_EXP_EWSW[5]), .B0(n3578), .B1(
        DMP_SHT1_EWSW[5]), .Y(n771) );
  AO22XLTS U529 ( .A0(DMP_SHT1_EWSW[4]), .A1(busy), .B0(DMP_SHT2_EWSW[4]), 
        .B1(n2690), .Y(n1530) );
  AO22XLTS U530 ( .A0(n3556), .A1(DMP_EXP_EWSW[4]), .B0(n3578), .B1(
        DMP_SHT1_EWSW[4]), .Y(n774) );
  AO22XLTS U531 ( .A0(DMP_SHT1_EWSW[3]), .A1(busy), .B0(DMP_SHT2_EWSW[3]), 
        .B1(n3552), .Y(n1531) );
  AO22XLTS U532 ( .A0(n3577), .A1(DMP_EXP_EWSW[3]), .B0(n3578), .B1(
        DMP_SHT1_EWSW[3]), .Y(n777) );
  AO22XLTS U533 ( .A0(DMP_SHT1_EWSW[2]), .A1(busy), .B0(DMP_SHT2_EWSW[2]), 
        .B1(n3552), .Y(n1532) );
  AO22XLTS U534 ( .A0(n3577), .A1(DMP_EXP_EWSW[2]), .B0(n3578), .B1(
        DMP_SHT1_EWSW[2]), .Y(n780) );
  AO22XLTS U535 ( .A0(DMP_SHT1_EWSW[1]), .A1(busy), .B0(DMP_SHT2_EWSW[1]), 
        .B1(n3552), .Y(n1533) );
  AO22XLTS U536 ( .A0(n3577), .A1(DMP_EXP_EWSW[1]), .B0(n3578), .B1(
        DMP_SHT1_EWSW[1]), .Y(n783) );
  AO22XLTS U537 ( .A0(DMP_SHT1_EWSW[0]), .A1(busy), .B0(DMP_SHT2_EWSW[0]), 
        .B1(n3552), .Y(n1534) );
  AO22XLTS U538 ( .A0(n3577), .A1(DMP_EXP_EWSW[0]), .B0(n3590), .B1(
        DMP_SHT1_EWSW[0]), .Y(n786) );
  AO22XLTS U539 ( .A0(n3340), .A1(OP_FLAG_EXP), .B0(n3595), .B1(n2847), .Y(
        n788) );
  AOI2BB2XLTS U540 ( .B0(intDX_EWSW[31]), .B1(n3523), .A0N(n3523), .A1N(
        intDX_EWSW[31]), .Y(n2847) );
  AO22XLTS U541 ( .A0(n3577), .A1(n3560), .B0(n3590), .B1(
        Shift_amount_SHT1_EWR[4]), .Y(n828) );
  AO22XLTS U542 ( .A0(n3577), .A1(n2852), .B0(n3590), .B1(
        Shift_amount_SHT1_EWR[3]), .Y(n829) );
  AO22XLTS U543 ( .A0(n3556), .A1(n2850), .B0(n3590), .B1(
        Shift_amount_SHT1_EWR[2]), .Y(n830) );
  OA21X4TS U544 ( .A0(n2973), .A1(n2717), .B0(n2716), .Y(n3055) );
  AOI22X4TS U545 ( .A0(n3151), .A1(n2739), .B0(n1518), .B1(n3658), .Y(n3217)
         );
  NAND2X6TS U546 ( .A(n2840), .B(n3625), .Y(n2822) );
  NOR2X4TS U547 ( .A(Raw_mant_NRM_SWR[25]), .B(Raw_mant_NRM_SWR[24]), .Y(n2806) );
  INVX4TS U548 ( .A(n2648), .Y(n2682) );
  INVX2TS U549 ( .A(n3189), .Y(n2661) );
  NOR2X4TS U550 ( .A(left_right_SHT2), .B(n3596), .Y(n3189) );
  OAI21X2TS U551 ( .A0(n2535), .A1(n2673), .B0(n3375), .Y(n2649) );
  INVX2TS U552 ( .A(n2792), .Y(n3424) );
  NOR2X2TS U553 ( .A(n3164), .B(n2890), .Y(n2650) );
  NOR2X2TS U554 ( .A(n3164), .B(n2879), .Y(n2651) );
  OR3X2TS U555 ( .A(shift_value_SHT2_EWR[4]), .B(shift_value_SHT2_EWR[2]), .C(
        n3609), .Y(n2652) );
  AND2X2TS U556 ( .A(n3369), .B(n3368), .Y(n2653) );
  OAI21X2TS U557 ( .A0(n2673), .A1(n3633), .B0(n3396), .Y(n2654) );
  NOR2X4TS U558 ( .A(shift_value_SHT2_EWR[4]), .B(n2896), .Y(n3492) );
  OAI2BB2X4TS U559 ( .B0(n3086), .B1(n2735), .A0N(n2561), .A1N(n2593), .Y(
        n3076) );
  INVX2TS U560 ( .A(n2653), .Y(n2658) );
  INVX4TS U561 ( .A(n2653), .Y(n2659) );
  INVX2TS U562 ( .A(n3491), .Y(n2663) );
  INVX2TS U563 ( .A(n2663), .Y(n2664) );
  INVX2TS U564 ( .A(n3393), .Y(n2665) );
  INVX2TS U565 ( .A(n2665), .Y(n2666) );
  INVX2TS U566 ( .A(shift_value_SHT2_EWR[4]), .Y(n2669) );
  INVX2TS U567 ( .A(n2655), .Y(n2671) );
  INVX2TS U568 ( .A(n3424), .Y(n2673) );
  INVX2TS U569 ( .A(n3721), .Y(n2675) );
  INVX2TS U570 ( .A(n2675), .Y(n2677) );
  INVX2TS U571 ( .A(n2656), .Y(n2678) );
  INVX2TS U572 ( .A(n2656), .Y(n2679) );
  INVX4TS U573 ( .A(n2648), .Y(n2683) );
  OAI211X1TS U574 ( .A0(n2650), .A1(n3724), .B0(n2959), .C0(n2958), .Y(n2960)
         );
  INVX2TS U575 ( .A(rst), .Y(n2684) );
  NOR2X2TS U576 ( .A(n3656), .B(n2909), .Y(n3164) );
  NOR2X2TS U577 ( .A(n3393), .B(n3553), .Y(n3343) );
  NAND2X2TS U578 ( .A(n2901), .B(n2900), .Y(n3194) );
  NAND2X2TS U579 ( .A(n1493), .B(n2910), .Y(n2900) );
  AOI21X2TS U580 ( .A0(n3424), .A1(n3675), .B0(n3382), .Y(n3479) );
  INVX2TS U581 ( .A(n2652), .Y(n2685) );
  INVX2TS U582 ( .A(n2652), .Y(n2686) );
  NOR2X4TS U583 ( .A(n3545), .B(n3659), .Y(n2953) );
  INVX2TS U584 ( .A(n3722), .Y(n2687) );
  NAND2X4TS U585 ( .A(n2953), .B(n2669), .Y(n2961) );
  BUFX4TS U586 ( .A(n3440), .Y(n2691) );
  INVX2TS U587 ( .A(n3440), .Y(n3478) );
  BUFX3TS U588 ( .A(n2781), .Y(n2692) );
  BUFX3TS U589 ( .A(n2781), .Y(n2693) );
  OAI2BB2XLTS U590 ( .B0(n3217), .B1(n3352), .A0N(n2692), .A1N(n3221), .Y(
        n3222) );
  OAI2BB2XLTS U591 ( .B0(n3347), .B1(n3352), .A0N(n2781), .A1N(n3351), .Y(
        n3353) );
  NOR2X2TS U592 ( .A(n3503), .B(OP_FLAG_SFG), .Y(n2781) );
  NOR2X2TS U593 ( .A(n3401), .B(n3400), .Y(n3465) );
  NOR2X2TS U594 ( .A(inst_FSM_INPUT_ENABLE_state_reg[2]), .B(n3649), .Y(n3586)
         );
  NOR2X2TS U595 ( .A(n3395), .B(n3394), .Y(n3443) );
  NOR2XLTS U596 ( .A(n3360), .B(n2985), .Y(n2994) );
  OAI21X2TS U597 ( .A0(n2910), .A1(n2580), .B0(n2900), .Y(n2964) );
  BUFX3TS U598 ( .A(n2856), .Y(n2845) );
  OAI21X2TS U599 ( .A0(n2910), .A1(Data_array_SWR[24]), .B0(n2900), .Y(n3200)
         );
  INVX2TS U600 ( .A(n2923), .Y(n2694) );
  NOR2X4TS U601 ( .A(n3485), .B(shift_value_SHT2_EWR[4]), .Y(n2965) );
  INVX2TS U602 ( .A(n2697), .Y(n2695) );
  AOI222X4TS U603 ( .A0(Raw_mant_NRM_SWR[13]), .A1(n3424), .B0(
        Raw_mant_NRM_SWR[12]), .B1(n3449), .C0(n3547), .C1(
        DmP_mant_SHT1_SW[11]), .Y(n3415) );
  INVX2TS U604 ( .A(n3426), .Y(n3449) );
  BUFX3TS U605 ( .A(n3426), .Y(n2696) );
  BUFX3TS U606 ( .A(n3426), .Y(n2697) );
  OAI21X2TS U607 ( .A0(n2535), .A1(n2697), .B0(n3379), .Y(n3467) );
  OAI21X2TS U608 ( .A0(n2566), .A1(n2696), .B0(n3372), .Y(n3456) );
  OAI21X2TS U609 ( .A0(n1452), .A1(n2697), .B0(n2833), .Y(n3389) );
  OAI21X2TS U610 ( .A0(n2696), .A1(n3616), .B0(n3384), .Y(n3436) );
  OAI21X2TS U611 ( .A0(n3667), .A1(n2696), .B0(n3385), .Y(n3475) );
  OAI21X2TS U612 ( .A0(n3608), .A1(n2697), .B0(n3383), .Y(n3474) );
  OAI21X2TS U613 ( .A0(n3633), .A1(n2696), .B0(n3425), .Y(n3435) );
  OAI21X2TS U614 ( .A0(n3612), .A1(n2697), .B0(n3403), .Y(n3445) );
  OAI21X2TS U615 ( .A0(n3625), .A1(n2696), .B0(n3402), .Y(n3462) );
  NAND2X1TS U616 ( .A(n1501), .B(DMP_SFG[6]), .Y(n2719) );
  OA21X4TS U617 ( .A0(n3076), .A1(n2737), .B0(n2736), .Y(n2700) );
  XNOR2X1TS U618 ( .A(n2742), .B(DmP_mant_SFG_SWR_25_), .Y(n2701) );
  OA21XLTS U619 ( .A0(n2713), .A1(n3034), .B0(n3040), .Y(n2702) );
  AOI21X1TS U620 ( .A0(n2839), .A1(n2838), .B0(n2837), .Y(n2703) );
  AOI31XLTS U621 ( .A0(n2536), .A1(n3234), .A2(n3623), .B0(n3233), .Y(n3237)
         );
  OA22X1TS U622 ( .A0(n3237), .A1(n3236), .B0(intDY_EWSW[11]), .B1(n1489), .Y(
        n3238) );
  OAI2BB2XLTS U623 ( .B0(intDY_EWSW[14]), .B1(n1486), .A0N(n3241), .A1N(n3240), 
        .Y(n3242) );
  AOI2BB1X2TS U624 ( .A0N(intDY_EWSW[21]), .A1N(n1458), .B0(n3253), .Y(n3254)
         );
  NAND2X1TS U625 ( .A(n1457), .B(intDY_EWSW[15]), .Y(n3243) );
  INVX2TS U626 ( .A(n2722), .Y(n2725) );
  AOI31XLTS U627 ( .A0(n3643), .A1(n2566), .A2(Raw_mant_NRM_SWR[15]), .B0(
        Raw_mant_NRM_SWR[19]), .Y(n2805) );
  INVX2TS U628 ( .A(n3014), .Y(n2730) );
  NOR4X1TS U629 ( .A(exp_rslt_NRM2_EW1[7]), .B(exp_rslt_NRM2_EW1[4]), .C(
        exp_rslt_NRM2_EW1[2]), .D(n3160), .Y(n3123) );
  NAND2X1TS U630 ( .A(n2556), .B(n1511), .Y(n2786) );
  OAI21XLTS U631 ( .A0(n3660), .A1(n2663), .B0(n3156), .Y(n3158) );
  OR2X1TS U632 ( .A(n3055), .B(n3054), .Y(n3067) );
  OAI2BB1X2TS U633 ( .A0N(n1517), .A1N(n2582), .B0(n2778), .Y(n3351) );
  BUFX3TS U634 ( .A(n3300), .Y(n3289) );
  NAND2X2TS U635 ( .A(n2667), .B(n2669), .Y(n3187) );
  OAI211XLTS U636 ( .A0(n2933), .A1(n3487), .B0(n2932), .C0(n2967), .Y(n538)
         );
  NOR2X2TS U637 ( .A(n1493), .B(n3609), .Y(n2907) );
  NAND2X2TS U638 ( .A(shift_value_SHT2_EWR[2]), .B(n3609), .Y(n2896) );
  NOR2X4TS U639 ( .A(shift_value_SHT2_EWR[2]), .B(shift_value_SHT2_EWR[3]), 
        .Y(n2906) );
  NAND2X1TS U640 ( .A(n2906), .B(Data_array_SWR[19]), .Y(n2704) );
  INVX2TS U641 ( .A(n2940), .Y(n3209) );
  NOR3X1TS U642 ( .A(shift_value_SHT2_EWR[4]), .B(n3656), .C(n3609), .Y(n2707)
         );
  BUFX3TS U643 ( .A(n2707), .Y(n3491) );
  AOI22X1TS U644 ( .A0(Data_array_SWR[15]), .A1(n2664), .B0(Data_array_SWR[7]), 
        .B1(n2670), .Y(n2709) );
  INVX2TS U645 ( .A(n2906), .Y(n2910) );
  AOI22X1TS U646 ( .A0(Data_array_SWR[11]), .A1(n2686), .B0(Data_array_SWR[3]), 
        .B1(n2671), .Y(n2708) );
  INVX2TS U647 ( .A(n3188), .Y(n2928) );
  NAND2X2TS U648 ( .A(n2676), .B(Shift_reg_FLAGS_7[3]), .Y(n3546) );
  NAND2X1TS U649 ( .A(n2906), .B(n3664), .Y(n2710) );
  NAND2X2TS U650 ( .A(n2710), .B(n2900), .Y(n3191) );
  OA22X1TS U651 ( .A0(n3191), .A1(n2961), .B0(n1514), .B1(n2875), .Y(n2711) );
  NOR2X4TS U652 ( .A(n1493), .B(n2669), .Y(n3497) );
  NAND2X2TS U653 ( .A(n3497), .B(n2953), .Y(n2962) );
  INVX2TS U654 ( .A(n3036), .Y(n2713) );
  NAND2X1TS U655 ( .A(DMP_SFG[3]), .B(n1513), .Y(n3065) );
  NAND2X1TS U656 ( .A(n2545), .B(n3627), .Y(n3581) );
  INVX2TS U657 ( .A(n2976), .Y(n2717) );
  NOR2X1TS U658 ( .A(n2545), .B(n3627), .Y(n2972) );
  NAND2X1TS U659 ( .A(n1514), .B(DMP_SFG[1]), .Y(n2974) );
  NAND2X1TS U660 ( .A(n1503), .B(DMP_SFG[2]), .Y(n2714) );
  NAND2X1TS U661 ( .A(n2974), .B(n2714), .Y(n2715) );
  NOR2X1TS U662 ( .A(n1513), .B(DMP_SFG[3]), .Y(n3066) );
  NOR2X1TS U663 ( .A(n1503), .B(DMP_SFG[2]), .Y(n3054) );
  NOR2X1TS U664 ( .A(n3066), .B(n3054), .Y(n3033) );
  OAI21X4TS U665 ( .A0(DMP_SFG[6]), .A1(n1501), .B0(n2720), .Y(n3016) );
  NAND2BX1TS U666 ( .AN(n2584), .B(DMP_SFG[9]), .Y(n3096) );
  NOR2X1TS U667 ( .A(n2591), .B(n2557), .Y(n3022) );
  NAND2BX1TS U668 ( .AN(n2556), .B(n1511), .Y(n3015) );
  INVX2TS U669 ( .A(n2721), .Y(n2727) );
  NAND2BX1TS U670 ( .AN(DMP_SFG[9]), .B(n2584), .Y(n3097) );
  AOI21X1TS U671 ( .A0(n2592), .A1(n2559), .B0(n3111), .Y(n2724) );
  NAND2X1TS U672 ( .A(n3110), .B(n3047), .Y(n2723) );
  AOI21X1TS U673 ( .A0(n2727), .A1(n3021), .B0(n2726), .Y(n2732) );
  NAND2X1TS U674 ( .A(n3638), .B(n2556), .Y(n3014) );
  INVX2TS U675 ( .A(n2728), .Y(n2729) );
  AO22X4TS U676 ( .A0(n2734), .A1(n2733), .B0(n3618), .B1(n3604), .Y(n3086) );
  NOR2X1TS U677 ( .A(n2593), .B(n2561), .Y(n2735) );
  NAND2BX1TS U678 ( .AN(n2565), .B(n1507), .Y(n3007) );
  NOR2BX1TS U679 ( .AN(n2565), .B(n1507), .Y(n3008) );
  AOI21X4TS U680 ( .A0(n2700), .A1(n3007), .B0(n3008), .Y(n3105) );
  NAND2X1TS U681 ( .A(n3652), .B(n2533), .Y(n2738) );
  NAND2BX1TS U682 ( .AN(n2573), .B(n1506), .Y(n3133) );
  NOR2BX1TS U683 ( .AN(n2573), .B(n1506), .Y(n3134) );
  AOI21X4TS U684 ( .A0(n3132), .A1(n3133), .B0(n3134), .Y(n3151) );
  NAND2X1TS U685 ( .A(n2575), .B(n3657), .Y(n2739) );
  NAND2BX1TS U686 ( .AN(n2599), .B(n1505), .Y(n3219) );
  NOR2BX1TS U687 ( .AN(n2599), .B(n1505), .Y(n3220) );
  AOI21X4TS U688 ( .A0(n3217), .A1(n3219), .B0(n3220), .Y(n3293) );
  NAND2X1TS U689 ( .A(n3662), .B(n2582), .Y(n2740) );
  AOI22X4TS U690 ( .A0(n3293), .A1(n2740), .B0(n1517), .B1(n3670), .Y(n3347)
         );
  NAND2BX1TS U691 ( .AN(n2578), .B(DMP_SFG[21]), .Y(n3349) );
  NOR2BX1TS U692 ( .AN(n2578), .B(DMP_SFG[21]), .Y(n3350) );
  AOI21X4TS U693 ( .A0(n3347), .A1(n3349), .B0(n3350), .Y(n3361) );
  NAND2X1TS U694 ( .A(n3668), .B(n2586), .Y(n2741) );
  AND2X2TS U695 ( .A(n2679), .B(OP_FLAG_SFG), .Y(n3218) );
  CLKBUFX2TS U696 ( .A(n3218), .Y(n3077) );
  INVX2TS U697 ( .A(n2743), .Y(n3063) );
  NAND2X1TS U698 ( .A(n2743), .B(n3624), .Y(n2744) );
  NOR2X2TS U699 ( .A(n2545), .B(n1515), .Y(n2988) );
  NAND2X1TS U700 ( .A(n1514), .B(n3619), .Y(n2986) );
  NAND2X2TS U701 ( .A(n2988), .B(n2986), .Y(n2970) );
  NAND2BX1TS U702 ( .AN(n1503), .B(DMP_SFG[2]), .Y(n2745) );
  NAND3X1TS U703 ( .A(n2970), .B(n2987), .C(n2745), .Y(n2747) );
  NAND2X1TS U704 ( .A(n1503), .B(n3632), .Y(n2746) );
  NAND2X2TS U705 ( .A(n2747), .B(n2746), .Y(n3064) );
  NAND2X1TS U706 ( .A(n3622), .B(DMP_SFG[3]), .Y(n3062) );
  OA21XLTS U707 ( .A0(n2548), .A1(n1502), .B0(n3062), .Y(n2748) );
  NAND2X2TS U708 ( .A(n3064), .B(n2748), .Y(n2996) );
  NAND2X1TS U709 ( .A(n2551), .B(n1512), .Y(n2998) );
  NAND2X1TS U710 ( .A(n3631), .B(DMP_SFG[6]), .Y(n2749) );
  NAND3X2TS U711 ( .A(n2750), .B(n2749), .C(n2999), .Y(n2752) );
  NAND2X4TS U712 ( .A(n2752), .B(n2751), .Y(n3094) );
  NAND2X1TS U713 ( .A(DMP_SFG[9]), .B(n2584), .Y(n2757) );
  NOR2X1TS U714 ( .A(n1510), .B(n2558), .Y(n2760) );
  NOR2X1TS U715 ( .A(n3026), .B(n2760), .Y(n2753) );
  NAND2X2TS U716 ( .A(n3094), .B(n2753), .Y(n2763) );
  NAND2X2TS U717 ( .A(n2786), .B(n2591), .Y(n2754) );
  NAND2X1TS U718 ( .A(n2754), .B(n2557), .Y(n2756) );
  OR2X2TS U719 ( .A(n2591), .B(n2786), .Y(n2755) );
  NAND2X2TS U720 ( .A(n3092), .B(n2757), .Y(n2759) );
  INVX2TS U721 ( .A(n2760), .Y(n2761) );
  AOI22X1TS U722 ( .A0(n3025), .A1(n2761), .B0(n1510), .B1(n2558), .Y(n2762)
         );
  NAND2X4TS U723 ( .A(n2763), .B(n2762), .Y(n3115) );
  NOR2BX1TS U724 ( .AN(n2593), .B(n2561), .Y(n2768) );
  NAND2X1TS U725 ( .A(n2765), .B(n3113), .Y(n3084) );
  NAND2X2TS U726 ( .A(n3115), .B(n2764), .Y(n2771) );
  NAND2X1TS U727 ( .A(n2765), .B(n3114), .Y(n2767) );
  NAND2X1TS U728 ( .A(n2767), .B(n2766), .Y(n3083) );
  INVX2TS U729 ( .A(n2768), .Y(n2769) );
  AOI22X1TS U730 ( .A0(n3083), .A1(n2769), .B0(n2561), .B1(n3635), .Y(n2770)
         );
  AOI22X4TS U731 ( .A0(n3078), .A1(n2772), .B0(n2570), .B1(n1520), .Y(n3009)
         );
  NAND2X1TS U732 ( .A(n2565), .B(n1507), .Y(n2773) );
  AOI2BB2X4TS U733 ( .B0(n3009), .B1(n2773), .A0N(n2565), .A1N(n1507), .Y(
        n3104) );
  OAI2BB1X4TS U734 ( .A0N(n3652), .A1N(n3653), .B0(n3104), .Y(n2774) );
  OAI2BB1X4TS U735 ( .A0N(n1519), .A1N(n2533), .B0(n2774), .Y(n3135) );
  AOI21X4TS U736 ( .A0(n2599), .A1(n1505), .B0(n3221), .Y(n2777) );
  AOI2BB1X4TS U737 ( .A0N(n2599), .A1N(n1505), .B0(n2777), .Y(n3292) );
  OAI2BB1X4TS U738 ( .A0N(n3662), .A1N(n3670), .B0(n3292), .Y(n2778) );
  AOI2BB1X4TS U739 ( .A0N(DMP_SFG[21]), .A1N(n2578), .B0(n3351), .Y(n2779) );
  AOI21X4TS U740 ( .A0(DMP_SFG[21]), .A1(n2578), .B0(n2779), .Y(n3359) );
  OAI21X4TS U741 ( .A0(n1516), .A1(n2586), .B0(n3359), .Y(n2780) );
  OAI2BB1X4TS U742 ( .A0N(n1516), .A1N(n2586), .B0(n2780), .Y(n3500) );
  XOR2X1TS U743 ( .A(n3500), .B(DmP_mant_SFG_SWR_25_), .Y(n2782) );
  BUFX3TS U744 ( .A(n3591), .Y(n3548) );
  AOI22X2TS U745 ( .A0(n2782), .A1(n2692), .B0(Raw_mant_NRM_SWR[25]), .B1(
        n3548), .Y(n2783) );
  OAI2BB1X4TS U746 ( .A0N(n2701), .A1N(n3077), .B0(n2783), .Y(n588) );
  XOR2X1TS U747 ( .A(n2557), .B(n2591), .Y(n2791) );
  OAI21X2TS U748 ( .A0(n3016), .A1(n2730), .B0(n3015), .Y(n3023) );
  INVX2TS U749 ( .A(n3094), .Y(n3027) );
  INVX2TS U750 ( .A(n2784), .Y(n2785) );
  AOI21X1TS U751 ( .A0(n3027), .A1(n2786), .B0(n2785), .Y(n2787) );
  INVX2TS U752 ( .A(n2781), .Y(n3038) );
  BUFX3TS U753 ( .A(n3038), .Y(n3358) );
  OAI22X1TS U754 ( .A0(n3023), .A1(n3360), .B0(n2787), .B1(n3358), .Y(n2790)
         );
  CLKBUFX2TS U755 ( .A(n3218), .Y(n3357) );
  BUFX3TS U756 ( .A(n3357), .Y(n3348) );
  AOI22X1TS U757 ( .A0(n3023), .A1(n3348), .B0(n2692), .B1(n2787), .Y(n2788)
         );
  OAI22X1TS U758 ( .A0(n2788), .A1(n2791), .B0(n2679), .B1(n3608), .Y(n2789)
         );
  NAND2X2TS U759 ( .A(LZD_output_NRM2_EW[0]), .B(n3725), .Y(
        DP_OP_15J43_122_6956_n18) );
  BUFX3TS U760 ( .A(n3605), .Y(n3393) );
  INVX4TS U761 ( .A(n3605), .Y(n3593) );
  OR2X2TS U762 ( .A(n3593), .B(n1480), .Y(n2792) );
  NOR2X1TS U763 ( .A(LZD_output_NRM2_EW[3]), .B(n2563), .Y(
        DP_OP_15J43_122_6956_n15) );
  NOR2X2TS U764 ( .A(n2793), .B(Raw_mant_NRM_SWR[17]), .Y(n2836) );
  NOR2BX4TS U765 ( .AN(n2794), .B(Raw_mant_NRM_SWR[21]), .Y(n3146) );
  NOR4BX4TS U766 ( .AN(n2836), .B(n2804), .C(Raw_mant_NRM_SWR[14]), .D(
        Raw_mant_NRM_SWR[18]), .Y(n2840) );
  NOR2BX4TS U767 ( .AN(n2800), .B(Raw_mant_NRM_SWR[7]), .Y(n2824) );
  NAND2X4TS U768 ( .A(n2824), .B(n3633), .Y(n3142) );
  NOR2X4TS U769 ( .A(Raw_mant_NRM_SWR[5]), .B(n3142), .Y(n2817) );
  NAND2X4TS U770 ( .A(n2535), .B(n2817), .Y(n3141) );
  AOI21X1TS U771 ( .A0(n1499), .A1(n1452), .B0(n3141), .Y(n2799) );
  AOI21X1TS U772 ( .A0(n3667), .A1(n3615), .B0(n2797), .Y(n2798) );
  AOI211X1TS U773 ( .A0(Raw_mant_NRM_SWR[5]), .A1(n2824), .B0(n2799), .C0(
        n2798), .Y(n2802) );
  AOI2BB1X2TS U774 ( .A0N(Raw_mant_NRM_SWR[3]), .A1N(Raw_mant_NRM_SWR[2]), 
        .B0(n3141), .Y(n2801) );
  OAI211X1TS U775 ( .A0(n2535), .A1(n3142), .B0(n2802), .C0(n2813), .Y(n3298)
         );
  CLKINVX1TS U776 ( .A(n2803), .Y(n2811) );
  INVX2TS U777 ( .A(n2804), .Y(n2839) );
  NOR2X1TS U778 ( .A(n2804), .B(n3641), .Y(n2815) );
  NOR3X1TS U779 ( .A(n2805), .B(Raw_mant_NRM_SWR[21]), .C(Raw_mant_NRM_SWR[20]), .Y(n2807) );
  OAI31X1TS U780 ( .A0(n2807), .A1(Raw_mant_NRM_SWR[23]), .A2(
        Raw_mant_NRM_SWR[22]), .B0(n2806), .Y(n2808) );
  OAI211X1TS U781 ( .A0(n2811), .A1(n2810), .B0(n2809), .C0(n2808), .Y(n2812)
         );
  INVX2TS U782 ( .A(n3393), .Y(n3547) );
  OAI2BB2X2TS U783 ( .B0(n3504), .B1(n3426), .A0N(n3423), .A1N(
        Shift_amount_SHT1_EWR[1]), .Y(n3368) );
  AOI21X1TS U784 ( .A0(n1452), .A1(n3646), .B0(Raw_mant_NRM_SWR[2]), .Y(n2814)
         );
  OAI21X1TS U785 ( .A0(Raw_mant_NRM_SWR[3]), .A1(n2814), .B0(n2535), .Y(n2816)
         );
  AOI211X2TS U786 ( .A0(n2817), .A1(n2816), .B0(n2841), .C0(n2815), .Y(n3144)
         );
  AOI21X1TS U787 ( .A0(n2818), .A1(n3655), .B0(Raw_mant_NRM_SWR[24]), .Y(n2819) );
  NOR3X1TS U788 ( .A(Raw_mant_NRM_SWR[11]), .B(Raw_mant_NRM_SWR[9]), .C(n2822), 
        .Y(n2823) );
  AOI22X1TS U789 ( .A0(Raw_mant_NRM_SWR[6]), .A1(n2824), .B0(
        Raw_mant_NRM_SWR[8]), .B1(n2823), .Y(n2825) );
  AOI31X1TS U790 ( .A0(n3144), .A1(n2826), .A2(n2825), .B0(n3593), .Y(n3535)
         );
  AOI211X2TS U791 ( .A0(n3593), .A1(Shift_amount_SHT1_EWR[0]), .B0(n3535), 
        .C0(n2674), .Y(n2831) );
  NAND2X2TS U792 ( .A(n2831), .B(n3346), .Y(n2829) );
  INVX2TS U793 ( .A(n2828), .Y(n3468) );
  AOI22X1TS U794 ( .A0(n3461), .A1(n2594), .B0(n2682), .B1(n3468), .Y(n2835)
         );
  INVX2TS U795 ( .A(n3368), .Y(n2832) );
  NOR2X8TS U796 ( .A(n2832), .B(n2829), .Y(n3440) );
  NAND2X1TS U797 ( .A(n2697), .B(Raw_mant_NRM_SWR[25]), .Y(n2830) );
  INVX2TS U798 ( .A(n3346), .Y(n3444) );
  NOR2X2TS U799 ( .A(n3473), .B(n2831), .Y(n3369) );
  NAND2X2TS U800 ( .A(n3369), .B(n2832), .Y(n3388) );
  INVX2TS U801 ( .A(n3393), .Y(n3423) );
  AOI22X1TS U802 ( .A0(n3424), .A1(Raw_mant_NRM_SWR[24]), .B0(n3423), .B1(
        DmP_mant_SHT1_SW[22]), .Y(n2833) );
  AOI22X1TS U803 ( .A0(n2691), .A1(n3390), .B0(n2681), .B1(n3389), .Y(n2834)
         );
  NAND2X1TS U804 ( .A(n2835), .B(n2834), .Y(n860) );
  AOI21X1TS U805 ( .A0(n2836), .A1(n3612), .B0(Raw_mant_NRM_SWR[18]), .Y(n2838) );
  NOR4X1TS U806 ( .A(Raw_mant_NRM_SWR[3]), .B(Raw_mant_NRM_SWR[2]), .C(n1452), 
        .D(n3141), .Y(n2837) );
  OAI21X1TS U807 ( .A0(Raw_mant_NRM_SWR[13]), .A1(Raw_mant_NRM_SWR[11]), .B0(
        n2840), .Y(n3143) );
  CLKBUFX2TS U808 ( .A(n2856), .Y(n2846) );
  BUFX3TS U809 ( .A(n2845), .Y(n3703) );
  BUFX3TS U810 ( .A(n3696), .Y(n3702) );
  BUFX3TS U811 ( .A(n3694), .Y(n3682) );
  BUFX3TS U812 ( .A(n2845), .Y(n3685) );
  BUFX3TS U813 ( .A(n2846), .Y(n3686) );
  CLKBUFX2TS U814 ( .A(n2856), .Y(n2843) );
  BUFX3TS U815 ( .A(n3696), .Y(n3690) );
  CLKBUFX2TS U816 ( .A(n2856), .Y(n2844) );
  BUFX3TS U817 ( .A(n3696), .Y(n3711) );
  BUFX3TS U818 ( .A(n3692), .Y(n3710) );
  CLKBUFX2TS U819 ( .A(n2856), .Y(n2842) );
  BUFX3TS U820 ( .A(n2684), .Y(n3707) );
  BUFX3TS U821 ( .A(n2684), .Y(n3709) );
  BUFX3TS U822 ( .A(n2684), .Y(n3706) );
  BUFX3TS U823 ( .A(n2684), .Y(n3705) );
  BUFX3TS U824 ( .A(n2684), .Y(n3708) );
  BUFX3TS U825 ( .A(n2842), .Y(n3712) );
  BUFX3TS U826 ( .A(n2844), .Y(n3713) );
  BUFX3TS U827 ( .A(n2843), .Y(n3715) );
  BUFX3TS U828 ( .A(n3692), .Y(n3716) );
  BUFX3TS U829 ( .A(n3697), .Y(n3717) );
  BUFX3TS U830 ( .A(n3695), .Y(n3718) );
  BUFX3TS U831 ( .A(n3694), .Y(n3719) );
  BUFX3TS U832 ( .A(n2845), .Y(n3720) );
  BUFX3TS U833 ( .A(n2684), .Y(n3688) );
  BUFX3TS U834 ( .A(n3697), .Y(n3691) );
  BUFX3TS U835 ( .A(n3696), .Y(n3681) );
  BUFX3TS U836 ( .A(n3692), .Y(n3701) );
  BUFX3TS U837 ( .A(n2684), .Y(n3704) );
  BUFX3TS U838 ( .A(n3692), .Y(n3684) );
  BUFX3TS U839 ( .A(n3697), .Y(n3687) );
  BUFX3TS U840 ( .A(n3695), .Y(n3683) );
  BUFX3TS U841 ( .A(n3695), .Y(n3714) );
  BUFX3TS U842 ( .A(n3697), .Y(n3700) );
  BUFX3TS U843 ( .A(n3694), .Y(n3693) );
  BUFX3TS U844 ( .A(n3695), .Y(n3689) );
  BUFX3TS U845 ( .A(n2845), .Y(n3698) );
  BUFX3TS U846 ( .A(n3694), .Y(n3699) );
  CLKXOR2X2TS U847 ( .A(intAS), .B(intDY_EWSW[31]), .Y(n3523) );
  CLKBUFX2TS U848 ( .A(n2688), .Y(n3576) );
  INVX2TS U849 ( .A(n3576), .Y(n3556) );
  NAND2X1TS U850 ( .A(DmP_EXP_EWSW[23]), .B(n1492), .Y(n3533) );
  INVX2TS U851 ( .A(n3533), .Y(n2849) );
  NAND2X1TS U852 ( .A(n1441), .B(n3614), .Y(n2848) );
  AOI22X1TS U853 ( .A0(n1443), .A1(n3661), .B0(n2849), .B1(n2848), .Y(n2851)
         );
  BUFX3TS U854 ( .A(n2688), .Y(n3590) );
  INVX2TS U855 ( .A(n3590), .Y(n3577) );
  CMPR32X2TS U856 ( .A(n1447), .B(n3666), .C(n2851), .CO(n3557), .S(n2850) );
  AOI22X1TS U857 ( .A0(inst_FSM_INPUT_ENABLE_state_reg[1]), .A1(n3586), .B0(
        inst_FSM_INPUT_ENABLE_state_reg[2]), .B1(n3610), .Y(n3574) );
  INVX2TS U858 ( .A(n3568), .Y(n3563) );
  BUFX3TS U859 ( .A(n2853), .Y(n3529) );
  INVX2TS U860 ( .A(n3568), .Y(n3570) );
  INVX2TS U861 ( .A(n3346), .Y(n3473) );
  AOI22X1TS U862 ( .A0(n3444), .A1(n2580), .B0(n2683), .B1(n3390), .Y(n2854)
         );
  NAND2X1TS U863 ( .A(n2854), .B(n2792), .Y(n862) );
  AOI22X1TS U864 ( .A0(n2682), .A1(n3389), .B0(n2681), .B1(n3390), .Y(n2855)
         );
  OAI2BB1X1TS U865 ( .A0N(n3461), .A1N(Data_array_SWR[24]), .B0(n2855), .Y(
        n861) );
  BUFX3TS U866 ( .A(n2856), .Y(n3692) );
  BUFX3TS U867 ( .A(n2856), .Y(n3697) );
  BUFX3TS U868 ( .A(n2856), .Y(n3696) );
  CLKBUFX3TS U869 ( .A(n2856), .Y(n3695) );
  CLKBUFX3TS U870 ( .A(n2856), .Y(n3694) );
  INVX2TS U871 ( .A(n2857), .Y(n789) );
  BUFX3TS U872 ( .A(n3546), .Y(n3544) );
  INVX2TS U873 ( .A(n3544), .Y(n2893) );
  NAND2X1TS U874 ( .A(n2875), .B(DMP_SHT2_EWSW[11]), .Y(n2858) );
  NAND2X1TS U875 ( .A(n3539), .B(DMP_SHT2_EWSW[17]), .Y(n2859) );
  NAND2X1TS U876 ( .A(n3539), .B(DMP_SHT2_EWSW[7]), .Y(n2860) );
  NAND2X1TS U877 ( .A(n2872), .B(DMP_SHT2_EWSW[13]), .Y(n2861) );
  NAND2X1TS U878 ( .A(n2875), .B(DMP_SHT2_EWSW[8]), .Y(n2862) );
  NAND2X1TS U879 ( .A(n2872), .B(DMP_SHT2_EWSW[12]), .Y(n2863) );
  NAND2X1TS U880 ( .A(n2875), .B(DMP_SHT2_EWSW[16]), .Y(n2864) );
  NAND2X1TS U881 ( .A(n2875), .B(DMP_SHT2_EWSW[14]), .Y(n2865) );
  NAND2X1TS U882 ( .A(n3539), .B(DMP_SHT2_EWSW[19]), .Y(n2866) );
  NAND2X1TS U883 ( .A(n3539), .B(DMP_SHT2_EWSW[15]), .Y(n2867) );
  NAND2X1TS U884 ( .A(n3539), .B(DMP_SHT2_EWSW[5]), .Y(n2868) );
  NAND2X1TS U885 ( .A(n3539), .B(DMP_SHT2_EWSW[10]), .Y(n2869) );
  NAND2X1TS U886 ( .A(n2872), .B(DMP_SHT2_EWSW[4]), .Y(n2870) );
  NAND2X1TS U887 ( .A(n2872), .B(DMP_SHT2_EWSW[20]), .Y(n2871) );
  NAND2X1TS U888 ( .A(n2872), .B(DMP_SHT2_EWSW[0]), .Y(n2873) );
  NAND2X1TS U889 ( .A(n2872), .B(DMP_SHT2_EWSW[18]), .Y(n2874) );
  NAND2X1TS U890 ( .A(n2872), .B(DMP_SHT2_EWSW[22]), .Y(n2876) );
  INVX2TS U891 ( .A(n2907), .Y(n2909) );
  NOR2X1TS U892 ( .A(shift_value_SHT2_EWR[2]), .B(n3609), .Y(n2889) );
  INVX2TS U893 ( .A(n2896), .Y(n2912) );
  AOI22X1TS U894 ( .A0(Data_array_SWR[12]), .A1(n3492), .B0(Data_array_SWR[8]), 
        .B1(n2672), .Y(n2881) );
  AOI22X1TS U895 ( .A0(Data_array_SWR[20]), .A1(n3491), .B0(Data_array_SWR[16]), .B1(n2686), .Y(n2880) );
  INVX2TS U896 ( .A(n3485), .Y(n2923) );
  AOI21X1TS U897 ( .A0(n3212), .A1(n2923), .B0(n2882), .Y(n2883) );
  AOI22X1TS U898 ( .A0(Data_array_SWR[10]), .A1(n3492), .B0(Data_array_SWR[18]), .B1(n3491), .Y(n2885) );
  AOI22X1TS U899 ( .A0(Data_array_SWR[6]), .A1(n2672), .B0(Data_array_SWR[14]), 
        .B1(n2686), .Y(n2884) );
  NAND2X1TS U900 ( .A(n3207), .B(n2923), .Y(n2887) );
  BUFX3TS U901 ( .A(n3546), .Y(n3549) );
  INVX2TS U902 ( .A(n2962), .Y(n2915) );
  AOI21X1TS U903 ( .A0(n3624), .A1(n3549), .B0(n2915), .Y(n2886) );
  AOI22X1TS U904 ( .A0(Data_array_SWR[9]), .A1(n2672), .B0(Data_array_SWR[13]), 
        .B1(n3492), .Y(n2892) );
  AOI22X1TS U905 ( .A0(Data_array_SWR[17]), .A1(n2686), .B0(Data_array_SWR[21]), .B1(n3491), .Y(n2891) );
  AOI21X1TS U906 ( .A0(n3210), .A1(n2923), .B0(n2894), .Y(n2895) );
  NAND2X1TS U907 ( .A(n2906), .B(Data_array_SWR[18]), .Y(n2897) );
  NOR2X2TS U908 ( .A(n2907), .B(n2899), .Y(n3206) );
  NAND2X1TS U909 ( .A(n2906), .B(n3660), .Y(n2901) );
  AOI22X1TS U910 ( .A0(Data_array_SWR[19]), .A1(n3491), .B0(Data_array_SWR[11]), .B1(n3492), .Y(n2903) );
  AOI22X1TS U911 ( .A0(Data_array_SWR[15]), .A1(n2686), .B0(Data_array_SWR[7]), 
        .B1(n2671), .Y(n2902) );
  NAND2X1TS U912 ( .A(n3204), .B(n2923), .Y(n2905) );
  AOI21X1TS U913 ( .A0(n3637), .A1(n3549), .B0(n2915), .Y(n2904) );
  NOR2X2TS U914 ( .A(n2908), .B(n2907), .Y(n3203) );
  OAI21X1TS U915 ( .A0(n2910), .A1(n3663), .B0(n2909), .Y(n2911) );
  AOI21X2TS U916 ( .A0(n2912), .A1(n2580), .B0(n2911), .Y(n3197) );
  AOI22X1TS U917 ( .A0(Data_array_SWR[17]), .A1(n2707), .B0(Data_array_SWR[9]), 
        .B1(n3492), .Y(n2914) );
  AOI22X1TS U918 ( .A0(Data_array_SWR[13]), .A1(n2685), .B0(Data_array_SWR[5]), 
        .B1(n2672), .Y(n2913) );
  NAND2X1TS U919 ( .A(n3201), .B(n2923), .Y(n2917) );
  AOI21X1TS U920 ( .A0(n3622), .A1(n3549), .B0(n2915), .Y(n2916) );
  AOI22X1TS U921 ( .A0(Data_array_SWR[6]), .A1(n3492), .B0(Data_array_SWR[14]), 
        .B1(n3491), .Y(n2919) );
  AOI22X1TS U922 ( .A0(Data_array_SWR[10]), .A1(n2686), .B0(Data_array_SWR[2]), 
        .B1(n2672), .Y(n2918) );
  INVX2TS U923 ( .A(n3192), .Y(n2925) );
  INVX2TS U924 ( .A(n3194), .Y(n2922) );
  INVX2TS U925 ( .A(n2961), .Y(n2920) );
  AOI22X1TS U926 ( .A0(n2922), .A1(n2920), .B0(n3627), .B1(n3549), .Y(n2921)
         );
  AOI22X1TS U927 ( .A0(n2922), .A1(n2965), .B0(n2578), .B1(n3544), .Y(n2924)
         );
  NAND2X2TS U928 ( .A(n3497), .B(n2923), .Y(n2967) );
  INVX2TS U929 ( .A(n3191), .Y(n2926) );
  AOI22X1TS U930 ( .A0(n2926), .A1(n2965), .B0(n3662), .B1(n3549), .Y(n2927)
         );
  AOI22X1TS U931 ( .A0(Data_array_SWR[16]), .A1(n3491), .B0(Data_array_SWR[8]), 
        .B1(n3492), .Y(n2930) );
  AOI22X1TS U932 ( .A0(Data_array_SWR[4]), .A1(n2671), .B0(Data_array_SWR[12]), 
        .B1(n2686), .Y(n2929) );
  INVX2TS U933 ( .A(n3195), .Y(n2933) );
  OA22X1TS U934 ( .A0(n3197), .A1(n2961), .B0(n1503), .B1(n2875), .Y(n2931) );
  INVX2TS U935 ( .A(n2965), .Y(n2957) );
  OA22X1TS U936 ( .A0(n3197), .A1(n2957), .B0(n1505), .B1(n2875), .Y(n2932) );
  AOI21X1TS U937 ( .A0(n3210), .A1(n2953), .B0(n2934), .Y(n2935) );
  AOI21X1TS U938 ( .A0(n3212), .A1(n2953), .B0(n2936), .Y(n2937) );
  INVX2TS U939 ( .A(n3207), .Y(n2942) );
  AOI21X1TS U940 ( .A0(n2965), .A1(n2940), .B0(n2939), .Y(n2941) );
  AOI22X1TS U941 ( .A0(Data_array_SWR[13]), .A1(n3491), .B0(Data_array_SWR[5]), 
        .B1(n2670), .Y(n2944) );
  AOI22X1TS U942 ( .A0(Data_array_SWR[9]), .A1(n2686), .B0(Data_array_SWR[1]), 
        .B1(n2671), .Y(n2943) );
  OAI211X1TS U943 ( .A0(n2651), .A1(n3724), .B0(n2944), .C0(n2943), .Y(n3198)
         );
  INVX2TS U944 ( .A(n3198), .Y(n2948) );
  OA22X1TS U945 ( .A0(n3200), .A1(n2961), .B0(n1469), .B1(n2875), .Y(n2945) );
  INVX2TS U946 ( .A(n3200), .Y(n2946) );
  AOI22X1TS U947 ( .A0(n2946), .A1(n2965), .B0(n3668), .B1(n3545), .Y(n2947)
         );
  NAND2X1TS U948 ( .A(n3201), .B(n2953), .Y(n2950) );
  INVX2TS U949 ( .A(n2967), .Y(n2954) );
  AOI21X1TS U950 ( .A0(n3657), .A1(n3549), .B0(n2954), .Y(n2949) );
  XOR2X1TS U951 ( .A(n1469), .B(n2597), .Y(n2951) );
  AOI22X1TS U952 ( .A0(n3503), .A1(n3678), .B0(n2951), .B1(n3218), .Y(n2952)
         );
  NAND2X1TS U953 ( .A(n3204), .B(n2953), .Y(n2956) );
  AOI21X1TS U954 ( .A0(n3652), .A1(n3549), .B0(n2954), .Y(n2955) );
  AOI22X1TS U955 ( .A0(Data_array_SWR[4]), .A1(n2670), .B0(Data_array_SWR[12]), 
        .B1(n3491), .Y(n2959) );
  AOI22X1TS U956 ( .A0(Data_array_SWR[8]), .A1(n2686), .B0(Data_array_SWR[0]), 
        .B1(n2672), .Y(n2958) );
  INVX2TS U957 ( .A(n2960), .Y(n2969) );
  OA22X1TS U958 ( .A0(n2964), .A1(n2961), .B0(n2597), .B1(n2875), .Y(n2963) );
  INVX2TS U959 ( .A(n2964), .Y(n2966) );
  AOI22X1TS U960 ( .A0(n2966), .A1(n2965), .B0(DmP_mant_SFG_SWR_25_), .B1(
        n3546), .Y(n2968) );
  BUFX3TS U961 ( .A(n3038), .Y(n3501) );
  INVX2TS U962 ( .A(n2980), .Y(n2971) );
  INVX2TS U963 ( .A(n3077), .Y(n3352) );
  INVX2TS U964 ( .A(n2972), .Y(n3582) );
  NAND2X1TS U965 ( .A(n2973), .B(n3582), .Y(n2990) );
  INVX2TS U966 ( .A(n2974), .Y(n2975) );
  AOI21X1TS U967 ( .A0(n2990), .A1(n2976), .B0(n2975), .Y(n2978) );
  XNOR2X1TS U968 ( .A(n1503), .B(DMP_SFG[2]), .Y(n2977) );
  AOI21X1TS U969 ( .A0(n3218), .A1(n2978), .B0(n2977), .Y(n2979) );
  INVX2TS U970 ( .A(n2990), .Y(n2985) );
  NAND2X1TS U971 ( .A(n2987), .B(n2986), .Y(n2992) );
  INVX2TS U972 ( .A(n3077), .Y(n3095) );
  NAND2X1TS U973 ( .A(n2693), .B(n2988), .Y(n2989) );
  OAI31X1TS U974 ( .A0(n2994), .A1(n2993), .A2(n2992), .B0(n2991), .Y(n2995)
         );
  NAND2X1TS U975 ( .A(n2997), .B(n2996), .Y(n3041) );
  INVX2TS U976 ( .A(n2998), .Y(n3000) );
  OAI21X1TS U977 ( .A0(n3041), .A1(n3000), .B0(n2999), .Y(n3001) );
  AOI22X1TS U978 ( .A0(n3002), .A1(n3348), .B0(n2692), .B1(n3001), .Y(n3006)
         );
  XNOR2X1TS U979 ( .A(DMP_SFG[6]), .B(n1501), .Y(n3005) );
  OAI22X1TS U980 ( .A0(n3002), .A1(n3360), .B0(n3501), .B1(n3001), .Y(n3003)
         );
  AOI22X1TS U981 ( .A0(n3003), .A1(n3005), .B0(Raw_mant_NRM_SWR[8]), .B1(n3503), .Y(n3004) );
  AOI22X1TS U982 ( .A0(n2700), .A1(n3218), .B0(n3009), .B1(n2692), .Y(n3013)
         );
  OAI22X1TS U983 ( .A0(n2700), .A1(n3360), .B0(n3009), .B1(n3358), .Y(n3010)
         );
  AOI22X1TS U984 ( .A0(n3010), .A1(n3012), .B0(Raw_mant_NRM_SWR[17]), .B1(
        n2656), .Y(n3011) );
  AOI22X1TS U985 ( .A0(n3016), .A1(n3348), .B0(n2693), .B1(n3027), .Y(n3020)
         );
  NAND2X1TS U986 ( .A(n3015), .B(n3014), .Y(n3019) );
  OAI22X1TS U987 ( .A0(n3016), .A1(n3360), .B0(n3027), .B1(n3358), .Y(n3017)
         );
  AOI22X1TS U988 ( .A0(n3017), .A1(n3019), .B0(Raw_mant_NRM_SWR[9]), .B1(n3503), .Y(n3018) );
  AOI2BB1X2TS U989 ( .A0N(n3023), .A1N(n3022), .B0(n3021), .Y(n3098) );
  AOI21X2TS U990 ( .A0(n3098), .A1(n3097), .B0(n3024), .Y(n3049) );
  AOI2BB1X1TS U991 ( .A0N(n3027), .A1N(n3026), .B0(n3025), .Y(n3028) );
  AOI22X1TS U992 ( .A0(n3049), .A1(n3348), .B0(n2693), .B1(n3028), .Y(n3032)
         );
  OAI22X1TS U993 ( .A0(n3049), .A1(n3352), .B0(n3028), .B1(n3501), .Y(n3029)
         );
  AOI22X1TS U994 ( .A0(n3029), .A1(n3031), .B0(Raw_mant_NRM_SWR[12]), .B1(
        n3591), .Y(n3030) );
  INVX2TS U995 ( .A(n3033), .Y(n3035) );
  NAND2X1TS U996 ( .A(n3037), .B(n3036), .Y(n3042) );
  NAND2X1TS U997 ( .A(n3040), .B(n3039), .Y(n3045) );
  OAI2BB2XLTS U998 ( .B0(n3042), .B1(n3352), .A0N(n2692), .A1N(n3041), .Y(
        n3043) );
  AOI22X1TS U999 ( .A0(n3043), .A1(n3045), .B0(Raw_mant_NRM_SWR[7]), .B1(n3503), .Y(n3044) );
  INVX2TS U1000 ( .A(n3115), .Y(n3085) );
  AOI22X1TS U1001 ( .A0(n3112), .A1(n3348), .B0(n3085), .B1(n2693), .Y(n3053)
         );
  OAI22X1TS U1002 ( .A0(n3112), .A1(n3360), .B0(n3085), .B1(n3358), .Y(n3050)
         );
  AOI22X1TS U1003 ( .A0(n3050), .A1(n3052), .B0(Raw_mant_NRM_SWR[13]), .B1(
        n3503), .Y(n3051) );
  XOR2X1TS U1004 ( .A(DMP_SFG[3]), .B(n1513), .Y(n3057) );
  NAND2X1TS U1005 ( .A(n3067), .B(n3348), .Y(n3056) );
  AOI21X1TS U1006 ( .A0(n2692), .A1(n3064), .B0(n3057), .Y(n3058) );
  NAND2X1TS U1007 ( .A(n3060), .B(n3059), .Y(n3061) );
  OAI21X1TS U1008 ( .A0(n3064), .A1(n3063), .B0(n3062), .Y(n3070) );
  OAI21X1TS U1009 ( .A0(n3067), .A1(n3066), .B0(n3065), .Y(n3072) );
  NAND2X1TS U1010 ( .A(n3072), .B(n3348), .Y(n3068) );
  XOR2X1TS U1011 ( .A(n2548), .B(n1502), .Y(n3069) );
  AOI21X1TS U1012 ( .A0(n2693), .A1(n3070), .B0(n3069), .Y(n3071) );
  NAND2X1TS U1013 ( .A(n3074), .B(n3073), .Y(n3075) );
  XNOR2X1TS U1014 ( .A(n1520), .B(n2570), .Y(n3081) );
  OAI2BB2XLTS U1015 ( .B0(n3501), .B1(n3078), .A0N(n3077), .A1N(n3076), .Y(
        n3079) );
  AOI22X1TS U1016 ( .A0(n3079), .A1(n3081), .B0(n3675), .B1(n2656), .Y(n3080)
         );
  AOI2BB1X1TS U1017 ( .A0N(n3085), .A1N(n3084), .B0(n3083), .Y(n3087) );
  XNOR2X1TS U1018 ( .A(n2561), .B(n2593), .Y(n3090) );
  OAI2BB2XLTS U1019 ( .B0(n3087), .B1(n3501), .A0N(n3218), .A1N(n3086), .Y(
        n3088) );
  AOI22X1TS U1020 ( .A0(n3088), .A1(n3090), .B0(Raw_mant_NRM_SWR[15]), .B1(
        n3548), .Y(n3089) );
  AOI21X1TS U1021 ( .A0(n3094), .A1(n3093), .B0(n3092), .Y(n3099) );
  NAND2X1TS U1022 ( .A(n3097), .B(n3096), .Y(n3102) );
  OAI2BB2XLTS U1023 ( .B0(n3099), .B1(n3501), .A0N(n3348), .A1N(n3098), .Y(
        n3100) );
  AOI22X1TS U1024 ( .A0(n3100), .A1(n3102), .B0(Raw_mant_NRM_SWR[11]), .B1(
        n3503), .Y(n3101) );
  AOI22X1TS U1025 ( .A0(n3105), .A1(n3357), .B0(n3104), .B1(n2692), .Y(n3109)
         );
  XNOR2X1TS U1026 ( .A(n1519), .B(n2533), .Y(n3108) );
  OAI22X1TS U1027 ( .A0(n3105), .A1(n3360), .B0(n3104), .B1(n3358), .Y(n3106)
         );
  AOI22X1TS U1028 ( .A0(n3106), .A1(n3108), .B0(Raw_mant_NRM_SWR[18]), .B1(
        n3503), .Y(n3107) );
  OAI21X1TS U1029 ( .A0(n3115), .A1(n3114), .B0(n3113), .Y(n3116) );
  AOI22X1TS U1030 ( .A0(n3117), .A1(n3357), .B0(n2693), .B1(n3116), .Y(n3121)
         );
  XNOR2X1TS U1031 ( .A(n2559), .B(n2592), .Y(n3120) );
  OAI22X1TS U1032 ( .A0(n3117), .A1(n3360), .B0(n3501), .B1(n3116), .Y(n3118)
         );
  AOI22X1TS U1033 ( .A0(n3118), .A1(n3120), .B0(Raw_mant_NRM_SWR[14]), .B1(
        n3503), .Y(n3119) );
  XNOR2X2TS U1034 ( .A(DP_OP_15J43_122_6956_n1), .B(n2563), .Y(n3160) );
  INVX2TS U1035 ( .A(n3125), .Y(n1168) );
  NOR2X8TS U1036 ( .A(n3126), .B(exp_rslt_NRM2_EW1[1]), .Y(n3163) );
  INVX2TS U1037 ( .A(n3127), .Y(n1167) );
  INVX2TS U1038 ( .A(n3128), .Y(n1165) );
  INVX2TS U1039 ( .A(n3129), .Y(n1169) );
  OAI32X1TS U1040 ( .A0(exp_rslt_NRM2_EW1[3]), .A1(n2677), .A2(n3163), .B0(
        Shift_reg_FLAGS_7[0]), .B1(final_result_ieee[26]), .Y(n3130) );
  INVX2TS U1041 ( .A(n3130), .Y(n1164) );
  OAI32X1TS U1042 ( .A0(exp_rslt_NRM2_EW1[4]), .A1(n2677), .A2(n3163), .B0(
        Shift_reg_FLAGS_7[0]), .B1(final_result_ieee[27]), .Y(n3131) );
  INVX2TS U1043 ( .A(n3131), .Y(n1166) );
  OAI2BB2XLTS U1044 ( .B0(n3132), .B1(n3352), .A0N(n2781), .A1N(n3135), .Y(
        n3136) );
  AOI22X1TS U1045 ( .A0(n3136), .A1(n3138), .B0(Raw_mant_NRM_SWR[19]), .B1(
        n2656), .Y(n3137) );
  OAI32X1TS U1046 ( .A0(exp_rslt_NRM2_EW1[5]), .A1(n2677), .A2(n3163), .B0(
        Shift_reg_FLAGS_7[0]), .B1(final_result_ieee[28]), .Y(n3140) );
  INVX2TS U1047 ( .A(n3140), .Y(n1170) );
  OAI22X1TS U1048 ( .A0(n3142), .A1(n3677), .B0(n3676), .B1(n3141), .Y(n3148)
         );
  OAI211XLTS U1049 ( .A0(n3146), .A1(n3145), .B0(n3144), .C0(n3143), .Y(n3147)
         );
  NOR2X1TS U1050 ( .A(n3148), .B(n3147), .Y(n3538) );
  BUFX3TS U1051 ( .A(n2690), .Y(n3553) );
  AOI22X1TS U1052 ( .A0(n3473), .A1(shift_value_SHT2_EWR[2]), .B0(n3343), .B1(
        Shift_amount_SHT1_EWR[2]), .Y(n3149) );
  AOI22X1TS U1053 ( .A0(n3151), .A1(n3357), .B0(n3150), .B1(n2692), .Y(n3155)
         );
  XOR2X1TS U1054 ( .A(n2575), .B(n3657), .Y(n3154) );
  OAI22X1TS U1055 ( .A0(n3151), .A1(n3352), .B0(n3150), .B1(n3358), .Y(n3152)
         );
  AOI22X1TS U1056 ( .A0(n3152), .A1(n3154), .B0(Raw_mant_NRM_SWR[20]), .B1(
        n2656), .Y(n3153) );
  AOI22X1TS U1057 ( .A0(Data_array_SWR[19]), .A1(n2685), .B0(
        Data_array_SWR[15]), .B1(n2670), .Y(n3156) );
  AOI21X1TS U1058 ( .A0(n2672), .A1(Data_array_SWR[11]), .B0(n3497), .Y(n3157)
         );
  INVX2TS U1059 ( .A(n3159), .Y(n3484) );
  AND4X2TS U1060 ( .A(exp_rslt_NRM2_EW1[6]), .B(exp_rslt_NRM2_EW1[7]), .C(
        exp_rslt_NRM2_EW1[4]), .D(exp_rslt_NRM2_EW1[2]), .Y(n3161) );
  AOI31X4TS U1061 ( .A0(exp_rslt_NRM2_EW1[5]), .A1(exp_rslt_NRM2_EW1[0]), .A2(
        n3162), .B0(n3721), .Y(n3528) );
  INVX4TS U1062 ( .A(n3163), .Y(n3536) );
  NAND2X6TS U1063 ( .A(n3528), .B(n3536), .Y(n3596) );
  INVX2TS U1064 ( .A(n2667), .Y(n3174) );
  NOR2X1TS U1065 ( .A(n3497), .B(n3164), .Y(n3172) );
  AOI22X1TS U1066 ( .A0(Data_array_SWR[18]), .A1(n3492), .B0(
        Data_array_SWR[14]), .B1(n2672), .Y(n3165) );
  AOI22X1TS U1067 ( .A0(n3721), .A1(final_result_ieee[12]), .B0(n2662), .B1(
        n3480), .Y(n3166) );
  AOI22X1TS U1068 ( .A0(Data_array_SWR[18]), .A1(n2685), .B0(
        Data_array_SWR[14]), .B1(n2670), .Y(n3167) );
  AOI21X1TS U1069 ( .A0(n2672), .A1(Data_array_SWR[10]), .B0(n3497), .Y(n3168)
         );
  INVX2TS U1070 ( .A(n3170), .Y(n3482) );
  AOI22X1TS U1071 ( .A0(Data_array_SWR[19]), .A1(n3492), .B0(
        Data_array_SWR[15]), .B1(n2672), .Y(n3171) );
  AOI22X1TS U1072 ( .A0(n3721), .A1(final_result_ieee[13]), .B0(n2662), .B1(
        n3481), .Y(n3173) );
  INVX2TS U1073 ( .A(n2662), .Y(n3177) );
  AOI22X1TS U1074 ( .A0(n3721), .A1(final_result_ieee[9]), .B0(n2668), .B1(
        n3480), .Y(n3175) );
  OAI21X1TS U1075 ( .A0(n3484), .A1(n3177), .B0(n3175), .Y(n580) );
  AOI22X1TS U1076 ( .A0(n2677), .A1(final_result_ieee[8]), .B0(n2668), .B1(
        n3481), .Y(n3176) );
  OAI21X1TS U1077 ( .A0(n3482), .A1(n3177), .B0(n3176), .Y(n578) );
  AOI22X1TS U1078 ( .A0(n2677), .A1(final_result_ieee[0]), .B0(n2662), .B1(
        n3192), .Y(n3178) );
  OAI211X1TS U1079 ( .A0(n3187), .A1(n3194), .B0(n3178), .C0(n3185), .Y(n569)
         );
  AOI22X1TS U1080 ( .A0(n3213), .A1(final_result_ieee[6]), .B0(n3189), .B1(
        n3212), .Y(n3179) );
  OAI211X1TS U1081 ( .A0(n2651), .A1(n3187), .B0(n3179), .C0(n3185), .Y(n575)
         );
  AOI22X1TS U1082 ( .A0(n3213), .A1(final_result_ieee[3]), .B0(n3189), .B1(
        n3201), .Y(n3180) );
  OAI211X1TS U1083 ( .A0(n3203), .A1(n3187), .B0(n3180), .C0(n3185), .Y(n572)
         );
  AOI22X1TS U1084 ( .A0(n3213), .A1(final_result_ieee[2]), .B0(n3189), .B1(
        n3195), .Y(n3181) );
  OAI211X1TS U1085 ( .A0(n3197), .A1(n3187), .B0(n3181), .C0(n3185), .Y(n571)
         );
  AOI22X1TS U1086 ( .A0(n2676), .A1(final_result_ieee[7]), .B0(n2662), .B1(
        n3210), .Y(n3182) );
  OAI211X1TS U1087 ( .A0(n2650), .A1(n3187), .B0(n3182), .C0(n3185), .Y(n576)
         );
  AOI22X1TS U1088 ( .A0(n2677), .A1(final_result_ieee[4]), .B0(n2662), .B1(
        n3207), .Y(n3183) );
  OAI211X1TS U1089 ( .A0(n3209), .A1(n3187), .B0(n3183), .C0(n3185), .Y(n573)
         );
  AOI22X1TS U1090 ( .A0(n3721), .A1(final_result_ieee[1]), .B0(n2662), .B1(
        n3188), .Y(n3184) );
  OAI211X1TS U1091 ( .A0(n3191), .A1(n3187), .B0(n3184), .C0(n3185), .Y(n570)
         );
  AOI22X1TS U1092 ( .A0(n2677), .A1(final_result_ieee[5]), .B0(n2662), .B1(
        n3204), .Y(n3186) );
  OAI211X1TS U1093 ( .A0(n3206), .A1(n3187), .B0(n3186), .C0(n3185), .Y(n574)
         );
  AOI22X1TS U1094 ( .A0(n3721), .A1(final_result_ieee[20]), .B0(n2668), .B1(
        n3188), .Y(n3190) );
  AOI22X1TS U1095 ( .A0(n3213), .A1(final_result_ieee[21]), .B0(n2667), .B1(
        n3192), .Y(n3193) );
  AOI22X1TS U1096 ( .A0(n3213), .A1(final_result_ieee[19]), .B0(n2668), .B1(
        n3195), .Y(n3196) );
  AOI22X1TS U1097 ( .A0(n3213), .A1(final_result_ieee[22]), .B0(n2667), .B1(
        n3198), .Y(n3199) );
  AOI22X1TS U1098 ( .A0(n3213), .A1(final_result_ieee[18]), .B0(n2668), .B1(
        n3201), .Y(n3202) );
  AOI22X1TS U1099 ( .A0(n2676), .A1(final_result_ieee[16]), .B0(n2668), .B1(
        n3204), .Y(n3205) );
  AOI22X1TS U1100 ( .A0(n3213), .A1(final_result_ieee[17]), .B0(n2668), .B1(
        n3207), .Y(n3208) );
  AOI22X1TS U1101 ( .A0(n3213), .A1(final_result_ieee[14]), .B0(n2668), .B1(
        n3210), .Y(n3211) );
  AOI22X1TS U1102 ( .A0(n3213), .A1(final_result_ieee[15]), .B0(n2668), .B1(
        n3212), .Y(n3215) );
  AOI22X1TS U1103 ( .A0(n3222), .A1(n3224), .B0(Raw_mant_NRM_SWR[21]), .B1(
        n3548), .Y(n3223) );
  OA22X1TS U1104 ( .A0(n3648), .A1(n1491), .B0(intDY_EWSW[30]), .B1(n1465), 
        .Y(n3266) );
  AOI211X1TS U1105 ( .A0(n1464), .A1(intDY_EWSW[27]), .B0(n73), .C0(n3640), 
        .Y(n3264) );
  OAI22X1TS U1106 ( .A0(intDY_EWSW[27]), .A1(n1464), .B0(intDY_EWSW[28]), .B1(
        n1432), .Y(n3263) );
  NAND2X1TS U1107 ( .A(n1477), .B(n3650), .Y(n3508) );
  AOI22X1TS U1108 ( .A0(intDY_EWSW[18]), .A1(n1463), .B0(n1490), .B1(
        intDY_EWSW[17]), .Y(n3246) );
  OAI22X1TS U1109 ( .A0(n1438), .A1(intDY_EWSW[16]), .B0(n1490), .B1(
        intDY_EWSW[17]), .Y(n3226) );
  NAND2X1TS U1110 ( .A(n1485), .B(intDY_EWSW[19]), .Y(n3250) );
  INVX2TS U1111 ( .A(n3243), .Y(n3228) );
  AOI22X1TS U1112 ( .A0(intDY_EWSW[14]), .A1(n1486), .B0(intDY_EWSW[13]), .B1(
        n1456), .Y(n3241) );
  INVX2TS U1113 ( .A(n3241), .Y(n3227) );
  AOI211X2TS U1114 ( .A0(intDY_EWSW[12]), .A1(n1462), .B0(n3228), .C0(n3227), 
        .Y(n3512) );
  NAND2X2TS U1115 ( .A(intDY_EWSW[1]), .B(n1482), .Y(n3518) );
  OAI2BB2X2TS U1116 ( .B0(intDY_EWSW[2]), .B1(n1483), .A0N(n3229), .A1N(n3518), 
        .Y(n3230) );
  AOI2BB2X2TS U1117 ( .B0(n3507), .B1(n3230), .A0N(n1455), .A1N(intDY_EWSW[3]), 
        .Y(n3231) );
  AOI22X1TS U1118 ( .A0(intDY_EWSW[5]), .A1(n1433), .B0(n1435), .B1(
        intDY_EWSW[6]), .Y(n3522) );
  AOI222X2TS U1119 ( .A0(n3634), .A1(n3606), .B0(intDX_EWSW[7]), .B1(n1459), 
        .C0(n3232), .C1(n3522), .Y(n3239) );
  NOR2X1TS U1120 ( .A(n1459), .B(intDX_EWSW[7]), .Y(n3517) );
  AOI22X1TS U1121 ( .A0(intDY_EWSW[11]), .A1(n1489), .B0(n1437), .B1(
        intDY_EWSW[10]), .Y(n3235) );
  NAND2X1TS U1122 ( .A(intDY_EWSW[9]), .B(n1488), .Y(n3234) );
  OAI211X1TS U1123 ( .A0(n2536), .A1(n3623), .B0(n3235), .C0(n3234), .Y(n3514)
         );
  OAI22X1TS U1124 ( .A0(n1437), .A1(intDY_EWSW[10]), .B0(intDY_EWSW[9]), .B1(
        n1488), .Y(n3233) );
  INVX2TS U1125 ( .A(n3235), .Y(n3236) );
  OAI31X1TS U1126 ( .A0(n3239), .A1(n3517), .A2(n3514), .B0(n3238), .Y(n3244)
         );
  OAI22X1TS U1127 ( .A0(intDY_EWSW[13]), .A1(n1456), .B0(intDY_EWSW[12]), .B1(
        n1462), .Y(n3240) );
  AOI22X2TS U1128 ( .A0(n3512), .A1(n3244), .B0(n3243), .B1(n3242), .Y(n3245)
         );
  INVX2TS U1129 ( .A(n3250), .Y(n3248) );
  INVX2TS U1130 ( .A(n3246), .Y(n3247) );
  OAI22X4TS U1131 ( .A0(n1487), .A1(intDY_EWSW[22]), .B0(n3254), .B1(n3505), 
        .Y(n3255) );
  AOI22X1TS U1132 ( .A0(intDY_EWSW[27]), .A1(n1464), .B0(n73), .B1(n3640), .Y(
        n3258) );
  NAND2X1TS U1133 ( .A(n1440), .B(n3639), .Y(n3256) );
  OAI211X1TS U1134 ( .A0(n1467), .A1(n3651), .B0(n3258), .C0(n3256), .Y(n3513)
         );
  AOI21X1TS U1135 ( .A0(n1440), .A1(n3639), .B0(n1439), .Y(n3257) );
  INVX2TS U1136 ( .A(n3258), .Y(n3259) );
  AOI22X1TS U1137 ( .A0(intDY_EWSW[28]), .A1(n1432), .B0(n1491), .B1(n3648), 
        .Y(n3510) );
  AOI22X4TS U1138 ( .A0(n1465), .A1(intDY_EWSW[30]), .B0(n3266), .B1(n3265), 
        .Y(n3519) );
  NOR2X8TS U1139 ( .A(n3316), .B(n3519), .Y(n3326) );
  AND2X8TS U1140 ( .A(n3519), .B(n3595), .Y(n3300) );
  AOI22X1TS U1141 ( .A0(n3337), .A1(DmP_EXP_EWSW[20]), .B0(intDY_EWSW[20]), 
        .B1(n3327), .Y(n3267) );
  OAI21X1TS U1142 ( .A0(n1461), .A1(n3291), .B0(n3267), .Y(n637) );
  AOI22X1TS U1143 ( .A0(n3340), .A1(DmP_EXP_EWSW[12]), .B0(intDY_EWSW[12]), 
        .B1(n3327), .Y(n3268) );
  OAI21X1TS U1144 ( .A0(n1462), .A1(n3291), .B0(n3268), .Y(n653) );
  AOI22X1TS U1145 ( .A0(n3323), .A1(DmP_EXP_EWSW[22]), .B0(intDY_EWSW[22]), 
        .B1(n3300), .Y(n3269) );
  AOI22X1TS U1146 ( .A0(n3334), .A1(DmP_EXP_EWSW[0]), .B0(intDY_EWSW[0]), .B1(
        n3327), .Y(n3270) );
  OAI21X1TS U1147 ( .A0(n1460), .A1(n3291), .B0(n3270), .Y(n677) );
  AOI22X1TS U1148 ( .A0(n3323), .A1(DmP_EXP_EWSW[16]), .B0(intDY_EWSW[16]), 
        .B1(n3327), .Y(n3271) );
  OAI21X1TS U1149 ( .A0(n1438), .A1(n3291), .B0(n3271), .Y(n645) );
  AOI22X1TS U1150 ( .A0(n3323), .A1(DmP_EXP_EWSW[14]), .B0(intDY_EWSW[14]), 
        .B1(n3300), .Y(n3272) );
  OAI21X1TS U1151 ( .A0(n1486), .A1(n3599), .B0(n3272), .Y(n649) );
  AOI22X1TS U1152 ( .A0(n3316), .A1(DmP_EXP_EWSW[27]), .B0(intDY_EWSW[27]), 
        .B1(n3327), .Y(n3273) );
  OAI21X1TS U1153 ( .A0(n1464), .A1(n3291), .B0(n3273), .Y(n627) );
  INVX2TS U1154 ( .A(n3595), .Y(n3337) );
  AOI22X1TS U1155 ( .A0(n3316), .A1(DMP_EXP_EWSW[8]), .B0(n3300), .B1(n3623), 
        .Y(n3274) );
  OAI21X1TS U1156 ( .A0(n2536), .A1(n3599), .B0(n3274), .Y(n811) );
  AOI22X1TS U1157 ( .A0(n3589), .A1(DmP_EXP_EWSW[2]), .B0(intDY_EWSW[2]), .B1(
        n3327), .Y(n3275) );
  AOI22X1TS U1158 ( .A0(n3337), .A1(DmP_EXP_EWSW[1]), .B0(intDY_EWSW[1]), .B1(
        n3327), .Y(n3276) );
  AOI22X1TS U1159 ( .A0(n3589), .A1(DmP_EXP_EWSW[9]), .B0(intDY_EWSW[9]), .B1(
        n3327), .Y(n3277) );
  AOI22X1TS U1160 ( .A0(n3316), .A1(DmP_EXP_EWSW[17]), .B0(intDY_EWSW[17]), 
        .B1(n3327), .Y(n3278) );
  AOI22X1TS U1161 ( .A0(n3589), .A1(DMP_EXP_EWSW[7]), .B0(intDX_EWSW[7]), .B1(
        n3289), .Y(n3279) );
  AOI22X1TS U1162 ( .A0(n3316), .A1(DmP_EXP_EWSW[21]), .B0(intDY_EWSW[21]), 
        .B1(n3289), .Y(n3280) );
  OAI21X1TS U1163 ( .A0(n1458), .A1(n3599), .B0(n3280), .Y(n635) );
  AOI22X1TS U1164 ( .A0(n3337), .A1(DmP_EXP_EWSW[18]), .B0(intDY_EWSW[18]), 
        .B1(n3289), .Y(n3281) );
  AOI22X1TS U1165 ( .A0(n3589), .A1(DmP_EXP_EWSW[11]), .B0(intDY_EWSW[11]), 
        .B1(n3289), .Y(n3282) );
  OAI21X1TS U1166 ( .A0(n1489), .A1(n3291), .B0(n3282), .Y(n655) );
  AOI22X1TS U1167 ( .A0(n3337), .A1(DmP_EXP_EWSW[13]), .B0(intDY_EWSW[13]), 
        .B1(n3289), .Y(n3283) );
  AOI22X1TS U1168 ( .A0(n3316), .A1(DmP_EXP_EWSW[10]), .B0(intDY_EWSW[10]), 
        .B1(n3289), .Y(n3284) );
  OAI21X1TS U1169 ( .A0(n1437), .A1(n3291), .B0(n3284), .Y(n657) );
  AOI22X1TS U1170 ( .A0(n3323), .A1(DmP_EXP_EWSW[15]), .B0(intDY_EWSW[15]), 
        .B1(n3289), .Y(n3285) );
  AOI22X1TS U1171 ( .A0(n3340), .A1(DmP_EXP_EWSW[5]), .B0(intDY_EWSW[5]), .B1(
        n3289), .Y(n3286) );
  AOI22X1TS U1172 ( .A0(n3340), .A1(DmP_EXP_EWSW[4]), .B0(intDY_EWSW[4]), .B1(
        n3289), .Y(n3288) );
  OAI21X1TS U1173 ( .A0(n1434), .A1(n3291), .B0(n3288), .Y(n669) );
  AOI22X1TS U1174 ( .A0(n3334), .A1(DmP_EXP_EWSW[3]), .B0(intDY_EWSW[3]), .B1(
        n3289), .Y(n3290) );
  OAI21X1TS U1175 ( .A0(n1455), .A1(n3291), .B0(n3290), .Y(n671) );
  AOI22X1TS U1176 ( .A0(n3293), .A1(n3357), .B0(n3292), .B1(n2693), .Y(n3297)
         );
  XNOR2X1TS U1177 ( .A(n1517), .B(n2582), .Y(n3296) );
  OAI22X1TS U1178 ( .A0(n3293), .A1(n3360), .B0(n3292), .B1(n3358), .Y(n3294)
         );
  AOI22X1TS U1179 ( .A0(n3294), .A1(n3296), .B0(Raw_mant_NRM_SWR[22]), .B1(
        n2656), .Y(n3295) );
  AOI22X1TS U1180 ( .A0(n2695), .A1(n3298), .B0(Shift_amount_SHT1_EWR[4]), 
        .B1(n3343), .Y(n3299) );
  INVX2TS U1181 ( .A(n3300), .Y(n3336) );
  BUFX4TS U1182 ( .A(n3326), .Y(n3322) );
  AOI22X1TS U1183 ( .A0(n3340), .A1(DmP_EXP_EWSW[19]), .B0(n3322), .B1(n3607), 
        .Y(n3301) );
  INVX4TS U1184 ( .A(n3300), .Y(n3325) );
  AOI22X1TS U1185 ( .A0(n3340), .A1(DmP_EXP_EWSW[6]), .B0(n3322), .B1(n3606), 
        .Y(n3302) );
  AOI22X1TS U1186 ( .A0(n3334), .A1(DMP_EXP_EWSW[29]), .B0(n3322), .B1(n3648), 
        .Y(n3303) );
  AOI22X1TS U1187 ( .A0(n3334), .A1(DmP_EXP_EWSW[8]), .B0(n3322), .B1(n3623), 
        .Y(n3304) );
  BUFX4TS U1188 ( .A(n3326), .Y(n3314) );
  AOI22X1TS U1189 ( .A0(n3589), .A1(DMP_EXP_EWSW[14]), .B0(intDY_EWSW[14]), 
        .B1(n3314), .Y(n3305) );
  AOI22X1TS U1190 ( .A0(n3589), .A1(DMP_EXP_EWSW[11]), .B0(intDY_EWSW[11]), 
        .B1(n3314), .Y(n3306) );
  AOI22X1TS U1191 ( .A0(n3337), .A1(DMP_EXP_EWSW[9]), .B0(intDY_EWSW[9]), .B1(
        n3314), .Y(n3307) );
  AOI22X1TS U1192 ( .A0(n3334), .A1(DMP_EXP_EWSW[1]), .B0(intDY_EWSW[1]), .B1(
        n3314), .Y(n3308) );
  AOI22X1TS U1193 ( .A0(n3340), .A1(DMP_EXP_EWSW[19]), .B0(intDY_EWSW[19]), 
        .B1(n3314), .Y(n3309) );
  AOI22X1TS U1194 ( .A0(n3589), .A1(DMP_EXP_EWSW[12]), .B0(intDY_EWSW[12]), 
        .B1(n3314), .Y(n3310) );
  AOI22X1TS U1195 ( .A0(n3334), .A1(DMP_EXP_EWSW[3]), .B0(intDY_EWSW[3]), .B1(
        n3314), .Y(n3311) );
  INVX4TS U1196 ( .A(n3300), .Y(n3600) );
  AOI22X1TS U1197 ( .A0(n3323), .A1(DMP_EXP_EWSW[5]), .B0(intDY_EWSW[5]), .B1(
        n3314), .Y(n3312) );
  AOI22X1TS U1198 ( .A0(n3337), .A1(DMP_EXP_EWSW[0]), .B0(intDY_EWSW[0]), .B1(
        n3314), .Y(n3313) );
  AOI22X1TS U1199 ( .A0(n3340), .A1(DMP_EXP_EWSW[2]), .B0(intDY_EWSW[2]), .B1(
        n3314), .Y(n3315) );
  AOI22X1TS U1200 ( .A0(n3316), .A1(DMP_EXP_EWSW[4]), .B0(intDY_EWSW[4]), .B1(
        n3322), .Y(n3317) );
  AOI22X1TS U1201 ( .A0(n3323), .A1(DMP_EXP_EWSW[18]), .B0(intDY_EWSW[18]), 
        .B1(n3322), .Y(n3318) );
  AOI22X1TS U1202 ( .A0(n3589), .A1(DmP_EXP_EWSW[7]), .B0(intDX_EWSW[7]), .B1(
        n3322), .Y(n3319) );
  AOI22X1TS U1203 ( .A0(n3323), .A1(DMP_EXP_EWSW[10]), .B0(intDY_EWSW[10]), 
        .B1(n3322), .Y(n3320) );
  AOI22X1TS U1204 ( .A0(n3323), .A1(DMP_EXP_EWSW[6]), .B0(intDY_EWSW[6]), .B1(
        n3322), .Y(n3321) );
  AOI22X1TS U1205 ( .A0(n3323), .A1(DMP_EXP_EWSW[27]), .B0(intDY_EWSW[27]), 
        .B1(n3322), .Y(n3324) );
  OAI21X1TS U1206 ( .A0(n1464), .A1(n3325), .B0(n3324), .Y(n792) );
  BUFX4TS U1207 ( .A(n3326), .Y(n3339) );
  AOI222X1TS U1208 ( .A0(DmP_EXP_EWSW[23]), .A1(n3334), .B0(n3339), .B1(n3611), 
        .C0(n3327), .C1(n3650), .Y(n3328) );
  INVX2TS U1209 ( .A(n3328), .Y(n1187) );
  AOI22X1TS U1210 ( .A0(n3589), .A1(DMP_EXP_EWSW[22]), .B0(intDY_EWSW[22]), 
        .B1(n3339), .Y(n3329) );
  AOI22X1TS U1211 ( .A0(n3337), .A1(DMP_EXP_EWSW[15]), .B0(intDY_EWSW[15]), 
        .B1(n3339), .Y(n3330) );
  AOI22X1TS U1212 ( .A0(n3337), .A1(DMP_EXP_EWSW[21]), .B0(intDY_EWSW[21]), 
        .B1(n3339), .Y(n3331) );
  AOI22X1TS U1213 ( .A0(n3340), .A1(DMP_EXP_EWSW[13]), .B0(intDY_EWSW[13]), 
        .B1(n3339), .Y(n3332) );
  AOI22X1TS U1214 ( .A0(n3316), .A1(DMP_EXP_EWSW[17]), .B0(intDY_EWSW[17]), 
        .B1(n3339), .Y(n3333) );
  AOI22X1TS U1215 ( .A0(n3340), .A1(DMP_EXP_EWSW[16]), .B0(intDY_EWSW[16]), 
        .B1(n3339), .Y(n3335) );
  AOI22X1TS U1216 ( .A0(n3334), .A1(DMP_EXP_EWSW[28]), .B0(intDY_EWSW[28]), 
        .B1(n3339), .Y(n3338) );
  AOI22X1TS U1217 ( .A0(n3334), .A1(DMP_EXP_EWSW[20]), .B0(intDY_EWSW[20]), 
        .B1(n3339), .Y(n3341) );
  AOI22X1TS U1218 ( .A0(n2695), .A1(n3344), .B0(n3343), .B1(
        Shift_amount_SHT1_EWR[3]), .Y(n3345) );
  AOI22X1TS U1219 ( .A0(n3353), .A1(n3355), .B0(Raw_mant_NRM_SWR[23]), .B1(
        n3548), .Y(n3354) );
  AOI22X1TS U1220 ( .A0(n3361), .A1(n3357), .B0(n3359), .B1(n2693), .Y(n3365)
         );
  XNOR2X1TS U1221 ( .A(n1516), .B(n2586), .Y(n3364) );
  OAI22X1TS U1222 ( .A0(n3361), .A1(n3360), .B0(n3359), .B1(n3358), .Y(n3362)
         );
  AOI22X1TS U1223 ( .A0(n3362), .A1(n3364), .B0(Raw_mant_NRM_SWR[24]), .B1(
        n2656), .Y(n3363) );
  AOI222X4TS U1224 ( .A0(Raw_mant_NRM_SWR[17]), .A1(n3449), .B0(n2674), .B1(
        Raw_mant_NRM_SWR[8]), .C0(n2665), .C1(DmP_mant_SHT1_SW[6]), .Y(n3459)
         );
  OAI22X1TS U1225 ( .A0(n2673), .A1(n3616), .B0(n3605), .B1(n3673), .Y(n3367)
         );
  NOR2X1TS U1226 ( .A(n3367), .B(n3366), .Y(n3399) );
  INVX2TS U1227 ( .A(n3399), .Y(n3455) );
  AOI22X1TS U1228 ( .A0(n3473), .A1(Data_array_SWR[7]), .B0(n2682), .B1(n3455), 
        .Y(n3374) );
  OAI22X1TS U1229 ( .A0(n2792), .A1(n3608), .B0(n3393), .B1(n3671), .Y(n3371)
         );
  NOR2X1TS U1230 ( .A(n3371), .B(n3370), .Y(n3448) );
  INVX2TS U1231 ( .A(n3448), .Y(n3412) );
  AOI22X1TS U1232 ( .A0(n2674), .A1(Raw_mant_NRM_SWR[9]), .B0(n3547), .B1(
        DmP_mant_SHT1_SW[7]), .Y(n3372) );
  AOI22X1TS U1233 ( .A0(n2660), .A1(n3412), .B0(n3440), .B1(n3456), .Y(n3373)
         );
  AOI222X4TS U1234 ( .A0(Raw_mant_NRM_SWR[23]), .A1(n2695), .B0(n2674), .B1(
        Raw_mant_NRM_SWR[2]), .C0(n3547), .C1(DmP_mant_SHT1_SW[0]), .Y(n3454)
         );
  OAI2BB2X1TS U1235 ( .B0(n1452), .B1(n2792), .A0N(Raw_mant_NRM_SWR[24]), 
        .A1N(n3449), .Y(n3450) );
  AOI22X1TS U1236 ( .A0(n3461), .A1(Data_array_SWR[1]), .B0(n2683), .B1(n3450), 
        .Y(n3378) );
  AOI22X1TS U1237 ( .A0(n3449), .A1(Raw_mant_NRM_SWR[21]), .B0(n3547), .B1(
        DmP_mant_SHT1_SW[2]), .Y(n3375) );
  INVX2TS U1238 ( .A(n3376), .Y(n3451) );
  AOI22X1TS U1239 ( .A0(n2660), .A1(n2649), .B0(n3440), .B1(n3451), .Y(n3377)
         );
  AOI22X1TS U1240 ( .A0(n3424), .A1(Raw_mant_NRM_SWR[21]), .B0(n3423), .B1(
        DmP_mant_SHT1_SW[19]), .Y(n3379) );
  INVX2TS U1241 ( .A(n3467), .Y(n3429) );
  AOI222X4TS U1242 ( .A0(Raw_mant_NRM_SWR[22]), .A1(n3424), .B0(n3449), .B1(
        Raw_mant_NRM_SWR[3]), .C0(n3593), .C1(DmP_mant_SHT1_SW[20]), .Y(n3471)
         );
  AOI22X1TS U1243 ( .A0(n2660), .A1(n3389), .B0(n3440), .B1(n3468), .Y(n3380)
         );
  OAI2BB2XLTS U1244 ( .B0(n3426), .B1(n3615), .A0N(n3593), .A1N(
        DmP_mant_SHT1_SW[14]), .Y(n3382) );
  AOI22X1TS U1245 ( .A0(n3424), .A1(Raw_mant_NRM_SWR[15]), .B0(n3423), .B1(
        DmP_mant_SHT1_SW[13]), .Y(n3383) );
  AOI22X1TS U1246 ( .A0(n3461), .A1(Data_array_SWR[15]), .B0(n2682), .B1(n3474), .Y(n3387) );
  AOI22X1TS U1247 ( .A0(n2674), .A1(Raw_mant_NRM_SWR[18]), .B0(n3547), .B1(
        DmP_mant_SHT1_SW[16]), .Y(n3384) );
  AOI22X1TS U1248 ( .A0(n3424), .A1(Raw_mant_NRM_SWR[17]), .B0(n2665), .B1(
        DmP_mant_SHT1_SW[15]), .Y(n3385) );
  AOI22X1TS U1249 ( .A0(n2653), .A1(n3436), .B0(n3440), .B1(n3475), .Y(n3386)
         );
  AOI22X1TS U1250 ( .A0(n3444), .A1(n2595), .B0(n2681), .B1(n3468), .Y(n3392)
         );
  AOI22X1TS U1251 ( .A0(n2660), .A1(n3390), .B0(n3440), .B1(n3389), .Y(n3391)
         );
  OAI22X1TS U1252 ( .A0(n2792), .A1(n3677), .B0(n3393), .B1(n3617), .Y(n3395)
         );
  INVX2TS U1253 ( .A(n3443), .Y(n3406) );
  AOI22X1TS U1254 ( .A0(n3461), .A1(Data_array_SWR[4]), .B0(n2681), .B1(n3406), 
        .Y(n3398) );
  AOI22X1TS U1255 ( .A0(n3449), .A1(Raw_mant_NRM_SWR[19]), .B0(n2657), .B1(
        DmP_mant_SHT1_SW[4]), .Y(n3396) );
  AOI22X1TS U1256 ( .A0(n2691), .A1(n2654), .B0(n2682), .B1(n2649), .Y(n3397)
         );
  OAI22X1TS U1257 ( .A0(n2792), .A1(n3612), .B0(n3393), .B1(n3674), .Y(n3401)
         );
  AOI22X1TS U1258 ( .A0(Raw_mant_NRM_SWR[12]), .A1(n2674), .B0(n3593), .B1(
        DmP_mant_SHT1_SW[10]), .Y(n3402) );
  AOI22X1TS U1259 ( .A0(n3473), .A1(Data_array_SWR[11]), .B0(n2680), .B1(n3462), .Y(n3405) );
  AOI22X1TS U1260 ( .A0(n2674), .A1(Raw_mant_NRM_SWR[11]), .B0(n3423), .B1(
        DmP_mant_SHT1_SW[9]), .Y(n3403) );
  INVX2TS U1261 ( .A(n3415), .Y(n3460) );
  AOI22X1TS U1262 ( .A0(n2682), .A1(n3445), .B0(n3440), .B1(n3460), .Y(n3404)
         );
  AOI22X1TS U1263 ( .A0(n3444), .A1(Data_array_SWR[5]), .B0(n2681), .B1(n2654), 
        .Y(n3408) );
  AOI22X1TS U1264 ( .A0(n2691), .A1(n3455), .B0(n2683), .B1(n3406), .Y(n3407)
         );
  INVX2TS U1265 ( .A(n3462), .Y(n3411) );
  AOI22X1TS U1266 ( .A0(n3444), .A1(Data_array_SWR[9]), .B0(n2683), .B1(n3456), 
        .Y(n3410) );
  AOI22X1TS U1267 ( .A0(n2691), .A1(n3445), .B0(n2681), .B1(n3412), .Y(n3409)
         );
  AOI22X1TS U1268 ( .A0(n3461), .A1(Data_array_SWR[10]), .B0(n2681), .B1(n3445), .Y(n3414) );
  AOI22X1TS U1269 ( .A0(n2691), .A1(n3462), .B0(n2682), .B1(n3412), .Y(n3413)
         );
  INVX2TS U1270 ( .A(n3465), .Y(n3472) );
  AOI22X1TS U1271 ( .A0(n3461), .A1(Data_array_SWR[13]), .B0(n2680), .B1(n3472), .Y(n3417) );
  AOI22X1TS U1272 ( .A0(n3440), .A1(n3474), .B0(n2682), .B1(n3460), .Y(n3416)
         );
  OAI211X1TS U1273 ( .A0(n3479), .A1(n2659), .B0(n3417), .C0(n3416), .Y(n850)
         );
  AOI22X1TS U1274 ( .A0(n2691), .A1(n2649), .B0(n2680), .B1(n3451), .Y(n3418)
         );
  AOI22X1TS U1275 ( .A0(n3461), .A1(Data_array_SWR[18]), .B0(n2683), .B1(n3436), .Y(n3428) );
  OAI22X1TS U1276 ( .A0(n2792), .A1(n3613), .B0(n3605), .B1(n3672), .Y(n3422)
         );
  NOR2X1TS U1277 ( .A(n3422), .B(n3421), .Y(n3434) );
  INVX2TS U1278 ( .A(n3434), .Y(n3466) );
  AOI22X1TS U1279 ( .A0(n2674), .A1(Raw_mant_NRM_SWR[19]), .B0(n2665), .B1(
        DmP_mant_SHT1_SW[17]), .Y(n3425) );
  AOI22X1TS U1280 ( .A0(n2691), .A1(n3466), .B0(n2680), .B1(n3435), .Y(n3427)
         );
  AOI22X1TS U1281 ( .A0(n3444), .A1(Data_array_SWR[19]), .B0(n2683), .B1(n3435), .Y(n3431) );
  AOI22X1TS U1282 ( .A0(n2691), .A1(n3467), .B0(n2680), .B1(n3466), .Y(n3430)
         );
  AOI22X1TS U1283 ( .A0(n3444), .A1(Data_array_SWR[17]), .B0(n2682), .B1(n3475), .Y(n3433) );
  AOI22X1TS U1284 ( .A0(n3440), .A1(n3435), .B0(n2680), .B1(n3436), .Y(n3432)
         );
  INVX2TS U1285 ( .A(n3435), .Y(n3439) );
  AOI22X1TS U1286 ( .A0(n2691), .A1(n3436), .B0(n2680), .B1(n3475), .Y(n3437)
         );
  AOI22X1TS U1287 ( .A0(n3473), .A1(Data_array_SWR[3]), .B0(n2681), .B1(n2649), 
        .Y(n3442) );
  AOI22X1TS U1288 ( .A0(n2653), .A1(n2654), .B0(n2683), .B1(n3451), .Y(n3441)
         );
  AOI22X1TS U1289 ( .A0(n2660), .A1(n3445), .B0(n2681), .B1(n3456), .Y(n3446)
         );
  AOI22X1TS U1290 ( .A0(n2695), .A1(Raw_mant_NRM_SWR[25]), .B0(n3473), .B1(
        Data_array_SWR[0]), .Y(n3453) );
  AOI21X1TS U1291 ( .A0(n2660), .A1(n3451), .B0(n3450), .Y(n3452) );
  AOI22X1TS U1292 ( .A0(n3444), .A1(Data_array_SWR[6]), .B0(n2683), .B1(n2654), 
        .Y(n3458) );
  AOI22X1TS U1293 ( .A0(n2653), .A1(n3456), .B0(n2681), .B1(n3455), .Y(n3457)
         );
  AOI22X1TS U1294 ( .A0(n3461), .A1(Data_array_SWR[12]), .B0(n2680), .B1(n3460), .Y(n3464) );
  AOI22X1TS U1295 ( .A0(n2660), .A1(n3474), .B0(n2827), .B1(n3462), .Y(n3463)
         );
  AOI22X1TS U1296 ( .A0(n3473), .A1(Data_array_SWR[20]), .B0(n2683), .B1(n3466), .Y(n3470) );
  AOI22X1TS U1297 ( .A0(n2660), .A1(n3468), .B0(n2680), .B1(n3467), .Y(n3469)
         );
  AOI22X1TS U1298 ( .A0(n3473), .A1(Data_array_SWR[14]), .B0(n2682), .B1(n3472), .Y(n3477) );
  AOI22X1TS U1299 ( .A0(n2660), .A1(n3475), .B0(n2680), .B1(n3474), .Y(n3476)
         );
  INVX2TS U1300 ( .A(n3480), .Y(n3486) );
  INVX2TS U1301 ( .A(n3481), .Y(n3483) );
  OAI222X1TS U1302 ( .A0(n3487), .A1(n3483), .B0(n2694), .B1(n3482), .C0(n3626), .C1(n3539), .Y(n549) );
  NOR2XLTS U1303 ( .A(inst_FSM_INPUT_ENABLE_state_reg[2]), .B(
        inst_FSM_INPUT_ENABLE_state_reg[1]), .Y(n3488) );
  AOI32X4TS U1304 ( .A0(inst_FSM_INPUT_ENABLE_state_reg[1]), .A1(
        inst_FSM_INPUT_ENABLE_state_reg[0]), .A2(
        inst_FSM_INPUT_ENABLE_state_reg[2]), .B0(n3488), .B1(n3649), .Y(n3594)
         );
  AOI22X1TS U1305 ( .A0(Data_array_SWR[13]), .A1(n2671), .B0(
        Data_array_SWR[21]), .B1(n2685), .Y(n3490) );
  AOI22X1TS U1306 ( .A0(Data_array_SWR[17]), .A1(n2670), .B0(n2580), .B1(n2664), .Y(n3489) );
  NAND2X1TS U1307 ( .A(n3490), .B(n3489), .Y(n3496) );
  AOI22X1TS U1308 ( .A0(Data_array_SWR[12]), .A1(n2671), .B0(
        Data_array_SWR[20]), .B1(n2685), .Y(n3494) );
  AOI22X1TS U1309 ( .A0(Data_array_SWR[16]), .A1(n2670), .B0(
        Data_array_SWR[24]), .B1(n2664), .Y(n3493) );
  NAND2X1TS U1310 ( .A(n3494), .B(n3493), .Y(n3499) );
  NOR2BX1TS U1311 ( .AN(n3499), .B(left_right_SHT2), .Y(n3495) );
  AOI211X1TS U1312 ( .A0(n3496), .A1(left_right_SHT2), .B0(n3495), .C0(n3497), 
        .Y(n3575) );
  MXI2X1TS U1313 ( .A(n3575), .B(n1510), .S0(n3545), .Y(n547) );
  NOR2BX1TS U1314 ( .AN(n3496), .B(left_right_SHT2), .Y(n3498) );
  AOI211X1TS U1315 ( .A0(left_right_SHT2), .A1(n3499), .B0(n3498), .C0(n3497), 
        .Y(n3597) );
  MXI2X1TS U1316 ( .A(n3597), .B(n1509), .S0(n3545), .Y(n546) );
  NOR2BX1TS U1317 ( .AN(n3500), .B(DmP_mant_SFG_SWR_25_), .Y(n3502) );
  OAI22X1TS U1318 ( .A0(n3502), .A1(n3501), .B0(n2678), .B1(n1480), .Y(n621)
         );
  MXI2X1TS U1319 ( .A(n2597), .B(n1499), .S0(n3503), .Y(n613) );
  AOI211XLTS U1320 ( .A0(n1460), .A1(intDY_EWSW[0]), .B0(n3506), .C0(n3505), 
        .Y(n3521) );
  AOI22X1TS U1321 ( .A0(intDY_EWSW[20]), .A1(n1461), .B0(intDY_EWSW[30]), .B1(
        n1465), .Y(n3509) );
  NAND4XLTS U1322 ( .A(n3510), .B(n3509), .C(n3508), .D(n3507), .Y(n3516) );
  NAND4BBX1TS U1323 ( .AN(n3514), .BN(n3513), .C(n3512), .D(n3511), .Y(n3515)
         );
  NOR4BX1TS U1324 ( .AN(n3518), .B(n3517), .C(n3516), .D(n3515), .Y(n3520) );
  AOI31XLTS U1325 ( .A0(n3522), .A1(n3521), .A2(n3520), .B0(n3519), .Y(n3525)
         );
  OAI2BB1X1TS U1326 ( .A0N(n3334), .A1N(SIGN_FLAG_EXP), .B0(n3526), .Y(n787)
         );
  BUFX3TS U1327 ( .A(n3568), .Y(n3571) );
  INVX2TS U1328 ( .A(n3568), .Y(n3567) );
  INVX2TS U1329 ( .A(n3568), .Y(n3530) );
  INVX2TS U1330 ( .A(n3566), .Y(n3562) );
  BUFX3TS U1331 ( .A(n3568), .Y(n3561) );
  AO22X1TS U1332 ( .A0(n3530), .A1(Data_Y[1]), .B0(n3529), .B1(intDY_EWSW[1]), 
        .Y(n895) );
  AOI22X1TS U1333 ( .A0(n1443), .A1(n1441), .B0(n3661), .B1(n3614), .Y(n3531)
         );
  XNOR2X1TS U1334 ( .A(n3533), .B(n3531), .Y(n3532) );
  INVX2TS U1335 ( .A(n2688), .Y(n3540) );
  BUFX3TS U1336 ( .A(n3576), .Y(n3541) );
  BUFX3TS U1337 ( .A(n3722), .Y(n3542) );
  INVX2TS U1338 ( .A(n3576), .Y(n3579) );
  BUFX3TS U1339 ( .A(n2688), .Y(n3555) );
  INVX2TS U1340 ( .A(n3544), .Y(n3550) );
  INVX2TS U1341 ( .A(n3552), .Y(n3551) );
  INVX2TS U1342 ( .A(n3576), .Y(n3554) );
  BUFX3TS U1343 ( .A(n3722), .Y(n3578) );
  CMPR32X2TS U1344 ( .A(n1445), .B(n3665), .C(n3557), .CO(n3559), .S(n2852) );
  XNOR2X1TS U1345 ( .A(DmP_EXP_EWSW[27]), .B(DMP_EXP_EWSW[27]), .Y(n3558) );
  XOR2X1TS U1346 ( .A(n3559), .B(n3558), .Y(n3560) );
  INVX2TS U1347 ( .A(n3568), .Y(n3564) );
  INVX2TS U1348 ( .A(n3568), .Y(n3572) );
  OAI2BB2XLTS U1349 ( .B0(n3564), .B1(n1457), .A0N(n3572), .A1N(Data_X[15]), 
        .Y(n914) );
  INVX2TS U1350 ( .A(n3568), .Y(n3569) );
  OAI2BB2XLTS U1351 ( .B0(n3567), .B1(n1488), .A0N(n3569), .A1N(Data_X[9]), 
        .Y(n920) );
  INVX2TS U1352 ( .A(n3566), .Y(n3573) );
  OAI2BB2XLTS U1353 ( .B0(n3573), .B1(n1483), .A0N(n3569), .A1N(Data_X[2]), 
        .Y(n927) );
  OAI2BB2XLTS U1354 ( .B0(n3573), .B1(n1482), .A0N(n3569), .A1N(Data_X[1]), 
        .Y(n928) );
  OAI2BB2XLTS U1355 ( .B0(n3564), .B1(n1455), .A0N(n3569), .A1N(Data_X[3]), 
        .Y(n926) );
  OAI2BB2XLTS U1356 ( .B0(n3573), .B1(n1460), .A0N(n3572), .A1N(Data_X[0]), 
        .Y(n929) );
  OAI2BB2XLTS U1357 ( .B0(n3564), .B1(n1487), .A0N(n3569), .A1N(Data_X[22]), 
        .Y(n907) );
  INVX2TS U1358 ( .A(n3566), .Y(n3565) );
  OAI2BB2XLTS U1359 ( .B0(n3564), .B1(n1461), .A0N(n3565), .A1N(Data_X[20]), 
        .Y(n909) );
  OAI2BB2XLTS U1360 ( .B0(n3564), .B1(n1486), .A0N(n3565), .A1N(Data_X[14]), 
        .Y(n915) );
  OAI2BB2XLTS U1361 ( .B0(n3573), .B1(n1462), .A0N(n3565), .A1N(Data_X[12]), 
        .Y(n917) );
  OAI2BB2XLTS U1362 ( .B0(n3564), .B1(n1463), .A0N(n3565), .A1N(Data_X[18]), 
        .Y(n911) );
  OAI2BB2XLTS U1363 ( .B0(n3564), .B1(n1490), .A0N(n3563), .A1N(Data_X[17]), 
        .Y(n912) );
  OAI2BB2XLTS U1364 ( .B0(n3564), .B1(n1489), .A0N(n3565), .A1N(Data_X[11]), 
        .Y(n918) );
  OAI2BB2XLTS U1365 ( .B0(n3564), .B1(n1458), .A0N(n3563), .A1N(Data_X[21]), 
        .Y(n908) );
  OAI2BB2XLTS U1366 ( .B0(n3573), .B1(n1456), .A0N(n3563), .A1N(Data_X[13]), 
        .Y(n916) );
  OAI2BB2XLTS U1367 ( .B0(n3567), .B1(n2536), .A0N(n3563), .A1N(Data_Y[8]), 
        .Y(n888) );
  OAI2BB2XLTS U1368 ( .B0(n3567), .B1(n1440), .A0N(n3565), .A1N(Data_X[25]), 
        .Y(n904) );
  OAI2BB2XLTS U1369 ( .B0(n3567), .B1(n1432), .A0N(n3563), .A1N(Data_X[28]), 
        .Y(n901) );
  OAI2BB2XLTS U1370 ( .B0(n3564), .B1(n1437), .A0N(n3565), .A1N(Data_X[10]), 
        .Y(n919) );
  OAI2BB2XLTS U1371 ( .B0(n3567), .B1(n1438), .A0N(n3565), .A1N(Data_X[16]), 
        .Y(n913) );
  OAI2BB2XLTS U1372 ( .B0(n3567), .B1(n1434), .A0N(n3565), .A1N(Data_X[4]), 
        .Y(n925) );
  OAI2BB2XLTS U1373 ( .B0(n3567), .B1(n1433), .A0N(n3565), .A1N(Data_X[5]), 
        .Y(n924) );
  OAI2BB2XLTS U1374 ( .B0(n3567), .B1(n1467), .A0N(n3569), .A1N(Data_Y[24]), 
        .Y(n872) );
  OAI2BB2XLTS U1375 ( .B0(n3573), .B1(n1459), .A0N(n3569), .A1N(Data_Y[7]), 
        .Y(n889) );
  OAI2BB2XLTS U1376 ( .B0(n3573), .B1(n1465), .A0N(n3569), .A1N(Data_X[30]), 
        .Y(n899) );
  OAI2BB2XLTS U1377 ( .B0(n3573), .B1(n1491), .A0N(n3569), .A1N(Data_X[29]), 
        .Y(n900) );
  OAI2BB2XLTS U1378 ( .B0(n3573), .B1(n1464), .A0N(n3569), .A1N(Data_X[27]), 
        .Y(n902) );
  OAI2BB2XLTS U1379 ( .B0(n3573), .B1(n73), .A0N(n3572), .A1N(Data_X[26]), .Y(
        n903) );
  INVX2TS U1380 ( .A(n3594), .Y(n3592) );
  OAI2BB2XLTS U1381 ( .B0(n3575), .B1(n3596), .A0N(n2676), .A1N(
        final_result_ieee[10]), .Y(n582) );
  NOR2BX1TS U1382 ( .AN(OP_FLAG_SFG), .B(n3580), .Y(n3584) );
  NAND2X1TS U1383 ( .A(n3582), .B(n3581), .Y(n3583) );
  XNOR2X1TS U1384 ( .A(n3584), .B(n3583), .Y(n3585) );
  INVX2TS U1385 ( .A(n3586), .Y(n3588) );
  AOI22X1TS U1386 ( .A0(inst_FSM_INPUT_ENABLE_state_reg[1]), .A1(
        inst_FSM_INPUT_ENABLE_state_reg[0]), .B0(n3588), .B1(n3610), .Y(
        inst_FSM_INPUT_ENABLE_state_next_1_) );
  NAND2X1TS U1387 ( .A(n3588), .B(n3587), .Y(n937) );
  AOI22X1TS U1388 ( .A0(n3594), .A1(n3337), .B0(n3590), .B1(n3592), .Y(n935)
         );
  AOI22X1TS U1389 ( .A0(n3594), .A1(n3590), .B0(n3723), .B1(n3592), .Y(n934)
         );
  AOI22X1TS U1390 ( .A0(n3594), .A1(n3591), .B0(n3593), .B1(n3592), .Y(n931)
         );
  AOI22X1TS U1391 ( .A0(n3594), .A1(n3593), .B0(n2676), .B1(n3592), .Y(n930)
         );
  OAI222X1TS U1392 ( .A0(n3600), .A1(n1439), .B0(n3599), .B1(n1467), .C0(n3598), .C1(n1443), .Y(n795) );
  OAI222X1TS U1393 ( .A0(n3599), .A1(n1430), .B0(n3600), .B1(n1440), .C0(n3598), .C1(n1442), .Y(n794) );
  OAI222X1TS U1394 ( .A0(n3599), .A1(n1431), .B0(n3600), .B1(n73), .C0(n3598), 
        .C1(n1446), .Y(n793) );
  OAI222X1TS U1395 ( .A0(n3599), .A1(n1439), .B0(n3600), .B1(n1467), .C0(n3598), .C1(n1441), .Y(n630) );
  OAI222X1TS U1396 ( .A0(n3600), .A1(n1430), .B0(n3599), .B1(n1440), .C0(n3595), .C1(n1447), .Y(n629) );
  OAI222X1TS U1397 ( .A0(n3600), .A1(n1431), .B0(n3599), .B1(n73), .C0(n3595), 
        .C1(n1445), .Y(n628) );
  OAI2BB2XLTS U1398 ( .B0(n3597), .B1(n3596), .A0N(n2676), .A1N(
        final_result_ieee[11]), .Y(n581) );
  OAI222X1TS U1399 ( .A0(n3600), .A1(n1477), .B0(n3599), .B1(n2589), .C0(n3598), .C1(n1492), .Y(n1186) );
initial $sdf_annotate("FPU_Interface2_DW_1STAGE_syn.sdf"); 
 endmodule


module Mux_3x1_b_W32 ( select, ch_0, ch_1, ch_2, data_out );
  input [1:0] select;
  input [31:0] ch_0;
  input [31:0] ch_1;
  input [31:0] ch_2;
  output [31:0] data_out;
  wire   n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101,
         n102, n103, n104, n105, n106, n107, n108, n109, n110, n111, n112,
         n113, n114, n115, n116, n117, n118, n119, n120, n121, n122, n123,
         n124, n125, n126, n127, n128, n129, n130, n131, n132;

  BUFX3TS U2 ( .A(n94), .Y(n116) );
  BUFX3TS U3 ( .A(n116), .Y(n129) );
  BUFX3TS U4 ( .A(n89), .Y(n102) );
  BUFX3TS U5 ( .A(n90), .Y(n114) );
  INVX2TS U6 ( .A(n117), .Y(data_out[24]) );
  NOR2X2TS U7 ( .A(select[1]), .B(select[0]), .Y(n90) );
  NOR2BX4TS U8 ( .AN(select[0]), .B(select[1]), .Y(n89) );
  NOR2BX2TS U9 ( .AN(select[1]), .B(select[0]), .Y(n94) );
  AOI222X1TS U10 ( .A0(n122), .A1(ch_1[27]), .B0(n130), .B1(ch_0[27]), .C0(
        n116), .C1(ch_2[27]), .Y(n121) );
  AOI222X1TS U11 ( .A0(n122), .A1(ch_1[12]), .B0(n130), .B1(ch_0[12]), .C0(
        n116), .C1(ch_2[12]), .Y(n123) );
  BUFX3TS U12 ( .A(n90), .Y(n130) );
  AOI222X1TS U13 ( .A0(n131), .A1(ch_1[24]), .B0(n90), .B1(ch_0[24]), .C0(n129), .C1(ch_2[24]), .Y(n117) );
  BUFX3TS U14 ( .A(n122), .Y(n131) );
  AOI222X1TS U15 ( .A0(n102), .A1(ch_1[3]), .B0(n101), .B1(ch_0[3]), .C0(n116), 
        .C1(ch_2[3]), .Y(n91) );
  AOI222X1TS U16 ( .A0(n102), .A1(ch_1[11]), .B0(n101), .B1(ch_0[11]), .C0(
        n116), .C1(ch_2[11]), .Y(n92) );
  BUFX3TS U17 ( .A(n90), .Y(n101) );
  AOI222X1TS U18 ( .A0(n102), .A1(ch_1[8]), .B0(n101), .B1(ch_0[8]), .C0(n116), 
        .C1(ch_2[8]), .Y(n93) );
  AOI222X1TS U19 ( .A0(n102), .A1(ch_1[9]), .B0(n101), .B1(ch_0[9]), .C0(n94), 
        .C1(ch_2[9]), .Y(n95) );
  AOI222X1TS U20 ( .A0(n102), .A1(ch_1[6]), .B0(n101), .B1(ch_0[6]), .C0(n116), 
        .C1(ch_2[6]), .Y(n96) );
  AOI222X1TS U21 ( .A0(n102), .A1(ch_1[25]), .B0(n101), .B1(ch_0[25]), .C0(
        n116), .C1(ch_2[25]), .Y(n98) );
  AOI222X1TS U22 ( .A0(n102), .A1(ch_1[10]), .B0(n101), .B1(ch_0[10]), .C0(
        n116), .C1(ch_2[10]), .Y(n99) );
  AOI222X1TS U23 ( .A0(n102), .A1(ch_1[7]), .B0(n101), .B1(ch_0[7]), .C0(n94), 
        .C1(ch_2[7]), .Y(n100) );
  AOI222X1TS U24 ( .A0(n102), .A1(ch_1[23]), .B0(n101), .B1(ch_0[23]), .C0(n94), .C1(ch_2[23]), .Y(n103) );
  AOI222X1TS U25 ( .A0(n122), .A1(ch_1[28]), .B0(n114), .B1(ch_0[28]), .C0(
        n113), .C1(ch_2[28]), .Y(n104) );
  BUFX3TS U26 ( .A(n116), .Y(n113) );
  AOI222X1TS U27 ( .A0(n89), .A1(ch_1[21]), .B0(n114), .B1(ch_0[21]), .C0(n113), .C1(ch_2[21]), .Y(n105) );
  AOI222X1TS U28 ( .A0(n89), .A1(ch_1[30]), .B0(n114), .B1(ch_0[30]), .C0(n113), .C1(ch_2[30]), .Y(n106) );
  AOI222X1TS U29 ( .A0(n89), .A1(ch_1[13]), .B0(n114), .B1(ch_0[13]), .C0(n113), .C1(ch_2[13]), .Y(n107) );
  AOI222X1TS U30 ( .A0(n89), .A1(ch_1[19]), .B0(n114), .B1(ch_0[19]), .C0(n113), .C1(ch_2[19]), .Y(n108) );
  AOI222X1TS U31 ( .A0(n89), .A1(ch_1[18]), .B0(n114), .B1(ch_0[18]), .C0(n113), .C1(ch_2[18]), .Y(n109) );
  AOI222X1TS U32 ( .A0(n89), .A1(ch_1[15]), .B0(n114), .B1(ch_0[15]), .C0(n113), .C1(ch_2[15]), .Y(n111) );
  AOI222X1TS U33 ( .A0(n89), .A1(ch_1[14]), .B0(n114), .B1(ch_0[14]), .C0(n113), .C1(ch_2[14]), .Y(n112) );
  AOI222X1TS U34 ( .A0(n89), .A1(ch_1[16]), .B0(n114), .B1(ch_0[16]), .C0(n113), .C1(ch_2[16]), .Y(n115) );
  AOI222X1TS U35 ( .A0(n131), .A1(ch_1[29]), .B0(n90), .B1(ch_0[29]), .C0(n129), .C1(ch_2[29]), .Y(n118) );
  AOI222X1TS U36 ( .A0(n131), .A1(ch_1[31]), .B0(n130), .B1(ch_0[31]), .C0(
        n129), .C1(ch_2[31]), .Y(n119) );
  AOI222X1TS U37 ( .A0(n131), .A1(ch_1[22]), .B0(n130), .B1(ch_0[22]), .C0(
        n129), .C1(ch_2[22]), .Y(n120) );
  AOI222X1TS U38 ( .A0(n131), .A1(ch_1[1]), .B0(n130), .B1(ch_0[1]), .C0(n129), 
        .C1(ch_2[1]), .Y(n124) );
  AOI222X1TS U39 ( .A0(n131), .A1(ch_1[20]), .B0(n130), .B1(ch_0[20]), .C0(
        n129), .C1(ch_2[20]), .Y(n125) );
  AOI222X1TS U40 ( .A0(n131), .A1(ch_1[26]), .B0(n130), .B1(ch_0[26]), .C0(
        n129), .C1(ch_2[26]), .Y(n126) );
  AOI222X1TS U41 ( .A0(n131), .A1(ch_1[17]), .B0(n130), .B1(ch_0[17]), .C0(
        n129), .C1(ch_2[17]), .Y(n127) );
  AOI222X1TS U42 ( .A0(n131), .A1(ch_1[4]), .B0(n130), .B1(ch_0[4]), .C0(n129), 
        .C1(ch_2[4]), .Y(n128) );
  AOI222X1TS U43 ( .A0(n122), .A1(ch_1[5]), .B0(n114), .B1(ch_0[5]), .C0(n113), 
        .C1(ch_2[5]), .Y(n110) );
  AOI222X1TS U44 ( .A0(n102), .A1(ch_1[2]), .B0(n101), .B1(ch_0[2]), .C0(n94), 
        .C1(ch_2[2]), .Y(n97) );
  AOI222X1TS U45 ( .A0(n131), .A1(ch_1[0]), .B0(n130), .B1(ch_0[0]), .C0(n129), 
        .C1(ch_2[0]), .Y(n132) );
  CLKBUFX2TS U46 ( .A(n89), .Y(n122) );
  INVX2TS U47 ( .A(n91), .Y(data_out[3]) );
  INVX2TS U48 ( .A(n92), .Y(data_out[11]) );
  INVX2TS U49 ( .A(n93), .Y(data_out[8]) );
  INVX2TS U50 ( .A(n95), .Y(data_out[9]) );
  INVX2TS U51 ( .A(n96), .Y(data_out[6]) );
  INVX2TS U52 ( .A(n97), .Y(data_out[2]) );
  INVX2TS U53 ( .A(n98), .Y(data_out[25]) );
  INVX2TS U54 ( .A(n99), .Y(data_out[10]) );
  INVX2TS U55 ( .A(n100), .Y(data_out[7]) );
  INVX2TS U56 ( .A(n103), .Y(data_out[23]) );
  INVX2TS U57 ( .A(n104), .Y(data_out[28]) );
  INVX2TS U58 ( .A(n105), .Y(data_out[21]) );
  INVX2TS U59 ( .A(n106), .Y(data_out[30]) );
  INVX2TS U60 ( .A(n107), .Y(data_out[13]) );
  INVX2TS U61 ( .A(n108), .Y(data_out[19]) );
  INVX2TS U62 ( .A(n109), .Y(data_out[18]) );
  INVX2TS U63 ( .A(n110), .Y(data_out[5]) );
  INVX2TS U64 ( .A(n111), .Y(data_out[15]) );
  INVX2TS U65 ( .A(n112), .Y(data_out[14]) );
  INVX2TS U66 ( .A(n115), .Y(data_out[16]) );
  INVX2TS U67 ( .A(n118), .Y(data_out[29]) );
  INVX2TS U68 ( .A(n119), .Y(data_out[31]) );
  INVX2TS U69 ( .A(n120), .Y(data_out[22]) );
  INVX2TS U70 ( .A(n121), .Y(data_out[27]) );
  INVX2TS U71 ( .A(n123), .Y(data_out[12]) );
  INVX2TS U72 ( .A(n124), .Y(data_out[1]) );
  INVX2TS U73 ( .A(n125), .Y(data_out[20]) );
  INVX2TS U74 ( .A(n126), .Y(data_out[26]) );
  INVX2TS U75 ( .A(n127), .Y(data_out[17]) );
  INVX2TS U76 ( .A(n128), .Y(data_out[4]) );
  INVX2TS U77 ( .A(n132), .Y(data_out[0]) );
initial $sdf_annotate("FPU_Interface2_DW_1STAGE_syn.sdf"); 
 endmodule


module d_ff_en_W32_0 ( clk, rst, enable, D, Q, OUT3, OUT4, OUT5 );
  input [31:0] D;
  output [31:0] Q;
  input clk, rst, enable;
  output OUT3, OUT4, OUT5;
  wire   n2, OUT4;
  assign Q[22] = D[22];
  assign Q[21] = D[21];
  assign Q[20] = D[20];
  assign Q[19] = D[19];
  assign Q[18] = D[18];
  assign Q[17] = D[17];
  assign Q[16] = D[16];
  assign Q[15] = D[15];
  assign Q[14] = D[14];
  assign Q[13] = D[13];
  assign Q[12] = D[12];
  assign Q[11] = D[11];
  assign Q[10] = D[10];
  assign Q[9] = D[9];
  assign Q[8] = D[8];
  assign Q[7] = D[7];
  assign Q[6] = D[6];
  assign Q[5] = D[5];
  assign Q[4] = D[4];
  assign Q[3] = D[3];
  assign Q[2] = D[2];
  assign Q[1] = D[1];
  assign Q[0] = D[0];
  assign OUT3 = OUT4;
  assign OUT5 = OUT4;

  DFFRXLTS Q_reg_31_ ( .D(D[31]), .CK(clk), .RN(OUT4), .Q(Q[31]) );
  DFFRXLTS Q_reg_29_ ( .D(D[29]), .CK(clk), .RN(n2), .Q(Q[29]) );
  DFFRXLTS Q_reg_27_ ( .D(D[27]), .CK(clk), .RN(n2), .Q(Q[27]) );
  DFFRXLTS Q_reg_25_ ( .D(D[25]), .CK(clk), .RN(n2), .Q(Q[25]) );
  INVX2TS U4 ( .A(rst), .Y(OUT4) );
  INVX2TS U31 ( .A(rst), .Y(n2) );
  DFFRX1TS Q_reg_30_ ( .D(D[30]), .CK(clk), .RN(n2), .Q(Q[30]) );
  DFFRX1TS Q_reg_28_ ( .D(D[28]), .CK(clk), .RN(n2), .Q(Q[28]) );
  DFFRX1TS Q_reg_23_ ( .D(D[23]), .CK(clk), .RN(n2), .Q(Q[23]) );
  DFFRX1TS Q_reg_26_ ( .D(D[26]), .CK(clk), .RN(n2), .Q(Q[26]) );
  DFFRX1TS Q_reg_24_ ( .D(D[24]), .CK(clk), .RN(n2), .Q(Q[24]) );
initial $sdf_annotate("FPU_Interface2_DW_1STAGE_syn.sdf"); 
 endmodule


module Mux_2x1_W32_0 ( select, ch_0, ch_1, data_out );
  input [31:0] ch_0;
  input [31:0] ch_1;
  output [31:0] data_out;
  input select;
  wire   n1, n2, n3, n4, n5, n6, n7;

  AO22XLTS U1 ( .A0(n2), .A1(ch_1[10]), .B0(n5), .B1(ch_0[10]), .Y(
        data_out[10]) );
  AO22XLTS U2 ( .A0(n2), .A1(ch_1[14]), .B0(n5), .B1(ch_0[14]), .Y(
        data_out[14]) );
  AO22XLTS U3 ( .A0(n1), .A1(ch_1[15]), .B0(n5), .B1(ch_0[15]), .Y(
        data_out[15]) );
  AO22XLTS U4 ( .A0(n3), .A1(ch_1[16]), .B0(n5), .B1(ch_0[16]), .Y(
        data_out[16]) );
  AO22XLTS U5 ( .A0(n1), .A1(ch_1[18]), .B0(n5), .B1(ch_0[18]), .Y(
        data_out[18]) );
  AO22XLTS U6 ( .A0(n3), .A1(ch_1[20]), .B0(n6), .B1(ch_0[20]), .Y(
        data_out[20]) );
  AO22XLTS U7 ( .A0(n2), .A1(ch_1[28]), .B0(n6), .B1(ch_0[28]), .Y(
        data_out[28]) );
  AO22XLTS U8 ( .A0(n1), .A1(ch_1[12]), .B0(n5), .B1(ch_0[12]), .Y(
        data_out[12]) );
  AO22XLTS U9 ( .A0(n1), .A1(ch_1[5]), .B0(n4), .B1(ch_0[5]), .Y(data_out[5])
         );
  AO22XLTS U10 ( .A0(n1), .A1(ch_1[2]), .B0(n4), .B1(ch_0[2]), .Y(data_out[2])
         );
  AO22XLTS U11 ( .A0(n3), .A1(ch_1[9]), .B0(n4), .B1(ch_0[9]), .Y(data_out[9])
         );
  AO22XLTS U12 ( .A0(n3), .A1(ch_1[0]), .B0(n4), .B1(ch_0[0]), .Y(data_out[0])
         );
  AO22XLTS U13 ( .A0(n2), .A1(ch_1[1]), .B0(n4), .B1(ch_0[1]), .Y(data_out[1])
         );
  AO22XLTS U14 ( .A0(n1), .A1(ch_1[11]), .B0(n5), .B1(ch_0[11]), .Y(
        data_out[11]) );
  AO22XLTS U15 ( .A0(n3), .A1(ch_1[13]), .B0(n5), .B1(ch_0[13]), .Y(
        data_out[13]) );
  AO22XLTS U16 ( .A0(n2), .A1(ch_1[21]), .B0(n6), .B1(ch_0[21]), .Y(
        data_out[21]) );
  AO22XLTS U17 ( .A0(n3), .A1(ch_1[3]), .B0(n4), .B1(ch_0[3]), .Y(data_out[3])
         );
  AO22XLTS U18 ( .A0(n1), .A1(ch_1[22]), .B0(n6), .B1(ch_0[22]), .Y(
        data_out[22]) );
  AO22XLTS U19 ( .A0(n3), .A1(ch_1[6]), .B0(n4), .B1(ch_0[6]), .Y(data_out[6])
         );
  AO22XLTS U20 ( .A0(n2), .A1(ch_1[19]), .B0(n5), .B1(ch_0[19]), .Y(
        data_out[19]) );
  AO22XLTS U21 ( .A0(select), .A1(ch_1[8]), .B0(n4), .B1(ch_0[8]), .Y(
        data_out[8]) );
  AO22XLTS U22 ( .A0(select), .A1(ch_1[7]), .B0(n4), .B1(ch_0[7]), .Y(
        data_out[7]) );
  AO22XLTS U23 ( .A0(n3), .A1(ch_1[29]), .B0(n6), .B1(ch_0[29]), .Y(
        data_out[29]) );
  AO22XLTS U24 ( .A0(n2), .A1(ch_1[4]), .B0(n4), .B1(ch_0[4]), .Y(data_out[4])
         );
  AO22XLTS U25 ( .A0(n2), .A1(ch_1[30]), .B0(n7), .B1(ch_0[30]), .Y(
        data_out[30]) );
  AO22XLTS U26 ( .A0(n3), .A1(ch_1[27]), .B0(n6), .B1(ch_0[27]), .Y(
        data_out[27]) );
  AO22XLTS U27 ( .A0(n2), .A1(ch_1[17]), .B0(n5), .B1(ch_0[17]), .Y(
        data_out[17]) );
  AO22XLTS U28 ( .A0(n3), .A1(ch_1[24]), .B0(n6), .B1(ch_0[24]), .Y(
        data_out[24]) );
  AO22XLTS U29 ( .A0(n2), .A1(ch_1[23]), .B0(n6), .B1(ch_0[23]), .Y(
        data_out[23]) );
  AO22XLTS U30 ( .A0(n1), .A1(ch_1[25]), .B0(n6), .B1(ch_0[25]), .Y(
        data_out[25]) );
  AO22XLTS U31 ( .A0(n1), .A1(ch_1[26]), .B0(n6), .B1(ch_0[26]), .Y(
        data_out[26]) );
  AO22XLTS U32 ( .A0(n1), .A1(ch_1[31]), .B0(n7), .B1(ch_0[31]), .Y(
        data_out[31]) );
  BUFX3TS U33 ( .A(select), .Y(n1) );
  BUFX3TS U34 ( .A(select), .Y(n2) );
  BUFX3TS U35 ( .A(select), .Y(n3) );
  INVX2TS U36 ( .A(select), .Y(n7) );
  BUFX3TS U37 ( .A(n7), .Y(n4) );
  BUFX3TS U38 ( .A(n7), .Y(n5) );
  BUFX3TS U39 ( .A(n7), .Y(n6) );
initial $sdf_annotate("FPU_Interface2_DW_1STAGE_syn.sdf"); 
 endmodule


module Mux_2x1_W1_0 ( select, ch_0, ch_1, data_out );
  input [0:0] ch_0;
  input [0:0] ch_1;
  output [0:0] data_out;
  input select;
  wire   n1;

  INVX1TS U1 ( .A(select), .Y(n1) );
  AO22XLTS U2 ( .A0(n1), .A1(ch_0[0]), .B0(select), .B1(ch_1[0]), .Y(
        data_out[0]) );
initial $sdf_annotate("FPU_Interface2_DW_1STAGE_syn.sdf"); 
 endmodule


module Mux_2x1_W1_1 ( select, ch_0, ch_1, data_out );
  input [0:0] ch_0;
  input [0:0] ch_1;
  output [0:0] data_out;
  input select;
  wire   n1;

  INVX1TS U1 ( .A(select), .Y(n1) );
  AO22XLTS U2 ( .A0(n1), .A1(ch_0[0]), .B0(select), .B1(ch_1[0]), .Y(
        data_out[0]) );
initial $sdf_annotate("FPU_Interface2_DW_1STAGE_syn.sdf"); 
 endmodule


module Mux_2x1_W1_2 ( select, ch_0, ch_1, data_out );
  input [0:0] ch_0;
  input [0:0] ch_1;
  output [0:0] data_out;
  input select;
  wire   n1;

  INVX1TS U1 ( .A(select), .Y(n1) );
  AO22XLTS U2 ( .A0(n1), .A1(ch_0[0]), .B0(select), .B1(ch_1[0]), .Y(
        data_out[0]) );
initial $sdf_annotate("FPU_Interface2_DW_1STAGE_syn.sdf"); 
 endmodule


module FPU_Interface2_W32_EW8_SW23_SWR26_EWR5 ( clk, rst, begin_operation, 
        ack_operation, operation, region_flag, Data_1, Data_2, r_mode, 
        overflow_flag, underflow_flag, NaN_flag, operation_ready, op_result, 
        busy );
  input [2:0] operation;
  input [1:0] region_flag;
  input [31:0] Data_1;
  input [31:0] Data_2;
  input [1:0] r_mode;
  output [31:0] op_result;
  input clk, rst, begin_operation, ack_operation;
  output overflow_flag, underflow_flag, NaN_flag, operation_ready, busy;
  wire   NaN_reg, beg_fsm_addsubt, beg_fsm_cordic, beg_fsm_mult,
         ack_fsm_cordic, ack_fsm_mult, op_mod_add_subt, op_mod_cordic,
         beg_add_subt_cordic, beg_add_subt, op_addsubt_cordic, op_addsubt,
         ready_cordic, ready_add_subt, enab_cont_iter, overflow_flag_mult,
         underflow_flag_mult, ready_mult, n_4_net_, overflow_flag_addsubt,
         underflow_flag_addsubt, n34, n35, n36, n38, n39, n40, n41, n42, n43,
         n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57,
         n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71,
         n72, n73, n74, n75, n76, n77, n78, n79, n80, n81;
  wire   [1:0] operation_reg;
  wire   [31:0] dataA;
  wire   [31:0] dataB;
  wire   [31:0] add_subt_dataA;
  wire   [31:0] add_subt_data1;
  wire   [31:0] add_subt_dataB;
  wire   [31:0] add_subt_data2;
  wire   [31:0] cordic_result;
  wire   [31:0] result_add_subt;
  wire   [31:0] mult_result;

  d_ff_en_W2 operation_dff ( .clk(clk), .rst(rst), .enable(1'b1), .D({n36, n42}), .Q(operation_reg) );
  d_ff_en_W32_1 reg_dataA ( .clk(clk), .rst(rst), .enable(1'b1), .D(Data_1), 
        .Q(dataA), .OUT4(n72) );
  d_ff_en_W32_0 reg_dataB ( .clk(clk), .rst(rst), .enable(1'b1), .D(Data_2), 
        .Q(dataB), .OUT3(n77), .OUT4(n75), .OUT5(n73) );
  d_ff_en_W1 NaN_dff ( .clk(clk), .rst(rst), .enable(1'b1), .D(NaN_reg), .Q(
        NaN_flag) );
  demux_1x3_1 demux_beg_op ( .data(begin_operation), .select({n36, n42}), 
        .ch1(beg_fsm_addsubt), .ch2(beg_fsm_cordic), .ch3(beg_fsm_mult) );
  demux_1x3_0 demux_ack_op ( .data(ack_operation), .select({n36, n39}), .ch2(
        ack_fsm_cordic), .ch3(ack_fsm_mult) );
  deco_op deco_operation ( .operation({n42, operation[0]}), .op_mod_add_subt(
        op_mod_add_subt), .op_mod_cordic(op_mod_cordic) );
  Mux_2x1_W1_3 mux_beg_addsubt ( .select(n42), .ch_0(beg_fsm_addsubt), .ch_1(
        beg_add_subt_cordic), .data_out(beg_add_subt) );
  Mux_2x1_W1_2 mux_operation_add_cordic ( .select(n39), .ch_0(op_mod_add_subt), 
        .ch_1(op_addsubt_cordic), .data_out(op_addsubt) );
  Mux_2x1_W32_1 mux_data_in1 ( .select(n38), .ch_0(Data_1), .ch_1(
        add_subt_dataA), .data_out(add_subt_data1) );
  Mux_2x1_W32_0 mux_data_in2 ( .select(n39), .ch_0(Data_2), .ch_1(
        add_subt_dataB), .data_out(add_subt_data2) );
  CORDIC_Arch3v1 FPSENCOS ( .clk(clk), .rst(rst), .beg_fsm_cordic(
        beg_fsm_cordic), .ack_cordic(ack_fsm_cordic), .operation(op_mod_cordic), .data_in(Data_1), .shift_region_flag(region_flag), .ready_cordic(
        ready_cordic), .data_output(cordic_result), .beg_add_subt(
        beg_add_subt_cordic), .add_subt_dataA(add_subt_dataA), 
        .add_subt_dataB(add_subt_dataB), .result_add_subt(result_add_subt), 
        .op_add_subt(op_addsubt_cordic), .ready_add_subt(ready_add_subt), 
        .enab_cont_iter(enab_cont_iter) );
  FPU_Multiplication_Function FPMULT ( .clk(clk), .rst(rst), .beg_FSM(
        beg_fsm_mult), .ack_FSM(ack_fsm_mult), .Data_MX(Data_1), .Data_MY(
        Data_2), .round_mode(r_mode), .overflow_flag(overflow_flag_mult), 
        .underflow_flag(underflow_flag_mult), .ready(ready_mult), 
        .final_result_ieee(mult_result) );
  FPU_PIPELINED_FPADDSUB_W32_EW8_SW23_SWR26_EWR5 FPADDSUB ( .clk(clk), .rst(
        n_4_net_), .beg_OP(beg_add_subt), .Data_X(add_subt_data1), .Data_Y(
        add_subt_data2), .add_subt(op_addsubt), .busy(busy), .overflow_flag(
        overflow_flag_addsubt), .underflow_flag(underflow_flag_addsubt), 
        .ready(ready_add_subt), .final_result_ieee(result_add_subt) );
  Mux_2x1_W1_1 overflow_flag_mux ( .select(n36), .ch_0(overflow_flag_addsubt), 
        .ch_1(overflow_flag_mult), .data_out(overflow_flag) );
  Mux_2x1_W1_0 underflow_flag_mux ( .select(n36), .ch_0(underflow_flag_addsubt), .ch_1(underflow_flag_mult), .data_out(underflow_flag) );
  Mux_3x1_b mux_ready_op ( .select(operation[2:1]), .ch_0(ready_add_subt), 
        .ch_1(ready_cordic), .ch_2(ready_mult), .data_out(operation_ready) );
  Mux_3x1_b_W32 mux_result_op ( .select({n35, n41}), .ch_0(result_add_subt), 
        .ch_1(cordic_result), .ch_2(mult_result), .data_out(op_result) );
  OR2X1TS U35 ( .A(enab_cont_iter), .B(rst), .Y(n_4_net_) );
  DFFRXLTS R_12 ( .D(n70), .CK(clk), .RN(n72), .Q(n78) );
  DFFSX1TS R_3 ( .D(n76), .CK(clk), .SN(n75), .Q(n80) );
  DFFSX1TS R_4 ( .D(n74), .CK(clk), .SN(n73), .Q(n81) );
  DFFSX1TS R_11 ( .D(n71), .CK(clk), .SN(n77), .Q(n79) );
  INVX2TS U37 ( .A(n34), .Y(n35) );
  INVX2TS U38 ( .A(n40), .Y(n42) );
  INVX6TS U39 ( .A(operation[1]), .Y(n40) );
  INVX4TS U40 ( .A(operation[2]), .Y(n34) );
  NAND3X1TS U41 ( .A(n53), .B(n52), .C(n51), .Y(n70) );
  NAND3X1TS U42 ( .A(n45), .B(n44), .C(n43), .Y(n46) );
  NAND3XLTS U43 ( .A(dataB[28]), .B(dataB[23]), .C(dataB[25]), .Y(n64) );
  AOI31XLTS U44 ( .A0(n62), .A1(n61), .A2(n60), .B0(n67), .Y(n65) );
  NOR3XLTS U45 ( .A(dataA[2]), .B(dataA[5]), .C(dataA[4]), .Y(n49) );
  NAND4XLTS U46 ( .A(dataA[30]), .B(dataA[27]), .C(dataA[28]), .D(dataA[26]), 
        .Y(n55) );
  NAND4XLTS U47 ( .A(dataA[29]), .B(dataA[23]), .C(dataA[25]), .D(dataA[24]), 
        .Y(n54) );
  NAND4XLTS U48 ( .A(n81), .B(n80), .C(n79), .D(n66), .Y(n68) );
  INVX2TS U49 ( .A(n40), .Y(n38) );
  INVX2TS U50 ( .A(n34), .Y(n36) );
  INVX2TS U51 ( .A(n40), .Y(n39) );
  INVX2TS U52 ( .A(n40), .Y(n41) );
  NOR4X1TS U53 ( .A(dataB[17]), .B(dataB[16]), .C(dataB[8]), .D(n46), .Y(n71)
         );
  NOR4X1TS U54 ( .A(dataA[13]), .B(dataA[15]), .C(dataA[17]), .D(dataA[18]), 
        .Y(n47) );
  NOR4X1TS U55 ( .A(dataA[21]), .B(dataA[19]), .C(dataA[14]), .D(dataA[20]), 
        .Y(n48) );
  NOR4X1TS U56 ( .A(dataB[4]), .B(dataB[18]), .C(dataB[20]), .D(dataB[1]), .Y(
        n44) );
  NOR4X1TS U57 ( .A(dataA[8]), .B(dataA[7]), .C(dataA[6]), .D(dataA[0]), .Y(
        n52) );
  NOR4X1TS U58 ( .A(dataB[3]), .B(dataB[5]), .C(dataB[22]), .D(dataB[0]), .Y(
        n43) );
  AOI31XLTS U59 ( .A0(n58), .A1(n57), .A2(n56), .B0(dataB[27]), .Y(n69) );
  NOR4X1TS U60 ( .A(dataB[7]), .B(dataB[9]), .C(dataB[11]), .D(dataB[6]), .Y(
        n74) );
  NOR4X1TS U61 ( .A(dataB[2]), .B(dataB[10]), .C(dataB[12]), .D(dataB[14]), 
        .Y(n76) );
  NOR4X1TS U62 ( .A(dataA[3]), .B(dataA[16]), .C(dataA[1]), .D(dataA[22]), .Y(
        n50) );
  NOR4X1TS U63 ( .A(dataB[15]), .B(dataB[19]), .C(dataB[13]), .D(dataB[21]), 
        .Y(n45) );
  NOR4X1TS U64 ( .A(dataA[12]), .B(dataA[11]), .C(dataA[10]), .D(dataA[9]), 
        .Y(n53) );
  NOR3XLTS U65 ( .A(dataB[25]), .B(dataB[31]), .C(n59), .Y(n56) );
  AND4X1TS U67 ( .A(n50), .B(n49), .C(n48), .D(n47), .Y(n51) );
  NOR4BX1TS U68 ( .AN(operation_reg[1]), .B(dataB[28]), .C(operation_reg[0]), 
        .D(dataB[23]), .Y(n58) );
  NOR4X1TS U69 ( .A(dataB[30]), .B(dataB[24]), .C(dataB[26]), .D(dataB[29]), 
        .Y(n57) );
  OR3X1TS U70 ( .A(n78), .B(n55), .C(n54), .Y(n59) );
  NOR4X1TS U71 ( .A(dataA[30]), .B(dataA[27]), .C(dataA[28]), .D(dataA[26]), 
        .Y(n62) );
  NOR4X1TS U72 ( .A(dataA[29]), .B(dataA[23]), .C(dataA[25]), .D(dataA[24]), 
        .Y(n61) );
  NOR4BX1TS U73 ( .AN(operation_reg[1]), .B(dataA[31]), .C(operation_reg[0]), 
        .D(n78), .Y(n60) );
  NOR2X1TS U74 ( .A(operation_reg[1]), .B(n59), .Y(n67) );
  NAND4XLTS U75 ( .A(dataB[30]), .B(dataB[24]), .C(dataB[26]), .D(dataB[29]), 
        .Y(n63) );
  OAI31X1TS U76 ( .A0(n65), .A1(n64), .A2(n63), .B0(dataB[27]), .Y(n66) );
  OAI2BB2XLTS U77 ( .B0(n69), .B1(n68), .A0N(n67), .A1N(operation_reg[0]), .Y(
        NaN_reg) );
initial $sdf_annotate("FPU_Interface2_DW_1STAGE_syn.sdf"); 
 endmodule

