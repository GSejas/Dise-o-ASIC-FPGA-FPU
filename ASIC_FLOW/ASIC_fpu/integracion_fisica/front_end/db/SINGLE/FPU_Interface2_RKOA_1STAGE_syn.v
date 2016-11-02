/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : L-2016.03-SP3
// Date      : Tue Nov  1 20:37:17 2016
/////////////////////////////////////////////////////////////


module d_ff_en_W2 ( clk, rst, enable, D, Q );
  input [1:0] D;
  output [1:0] Q;
  input clk, rst, enable;
  wire   n1;

  DFFRX1TS Q_reg_0_ ( .D(D[0]), .CK(clk), .RN(n1), .Q(Q[0]) );
  DFFRX1TS Q_reg_1_ ( .D(D[1]), .CK(clk), .RN(n1), .Q(Q[1]) );
  INVX2TS U2 ( .A(rst), .Y(n1) );
initial $sdf_annotate("FPU_Interface2_RKOA_1STAGE_syn.sdf"); 
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
  DFFRX1TS Q_reg_30_ ( .D(D[30]), .CK(clk), .RN(n31), .Q(Q[30]) );
  DFFRX1TS Q_reg_27_ ( .D(D[27]), .CK(clk), .RN(n31), .Q(Q[27]) );
  DFFRX1TS Q_reg_23_ ( .D(D[23]), .CK(clk), .RN(OUT4), .Q(Q[23]) );
  DFFRX1TS Q_reg_28_ ( .D(D[28]), .CK(clk), .RN(n31), .Q(Q[28]) );
  DFFRX1TS Q_reg_25_ ( .D(D[25]), .CK(clk), .RN(n31), .Q(Q[25]) );
  DFFRX1TS Q_reg_26_ ( .D(D[26]), .CK(clk), .RN(n31), .Q(Q[26]) );
  DFFRXLTS Q_reg_24_ ( .D(D[24]), .CK(clk), .RN(n31), .Q(Q[24]) );
initial $sdf_annotate("FPU_Interface2_RKOA_1STAGE_syn.sdf"); 
 endmodule


module d_ff_en_W1 ( clk, rst, enable, D, Q );
  input [0:0] D;
  output [0:0] Q;
  input clk, rst, enable;
  wire   n1;

  INVX2TS U2 ( .A(rst), .Y(n1) );
  DFFRXLTS Q_reg_0_ ( .D(D[0]), .CK(clk), .RN(n1), .Q(Q[0]) );
initial $sdf_annotate("FPU_Interface2_RKOA_1STAGE_syn.sdf"); 
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
initial $sdf_annotate("FPU_Interface2_RKOA_1STAGE_syn.sdf"); 
 endmodule


module demux_1x3_0 ( data, select, ch1, ch2, ch3 );
  input [1:0] select;
  input data;
  output ch1, ch2, ch3;
  wire   n1;

  INVX1TS U2 ( .A(select[0]), .Y(n1) );
  NOR2BX1TS U3 ( .AN(data), .B(n1), .Y(ch2) );
  AND3X1TS U4 ( .A(n1), .B(data), .C(select[1]), .Y(ch3) );
initial $sdf_annotate("FPU_Interface2_RKOA_1STAGE_syn.sdf"); 
 endmodule


module deco_op ( operation, op_mod_add_subt, op_mod_cordic );
  input [1:0] operation;
  output op_mod_add_subt, op_mod_cordic;


  NOR2BX1TS U3 ( .AN(operation[0]), .B(operation[1]), .Y(op_mod_add_subt) );
  CLKAND2X2TS U4 ( .A(operation[0]), .B(operation[1]), .Y(op_mod_cordic) );
initial $sdf_annotate("FPU_Interface2_RKOA_1STAGE_syn.sdf"); 
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
initial $sdf_annotate("FPU_Interface2_RKOA_1STAGE_syn.sdf"); 
 endmodule


module Mux_2x1_W32_1 ( select, ch_0, ch_1, data_out );
  input [31:0] ch_0;
  input [31:0] ch_1;
  output [31:0] data_out;
  input select;
  wire   n1, n2, n3, n4, n5, n6, n7;

  INVX2TS U1 ( .A(n1), .Y(n6) );
  CLKBUFX2TS U2 ( .A(select), .Y(n1) );
  AO22X1TS U3 ( .A0(n1), .A1(ch_1[17]), .B0(n5), .B1(ch_0[17]), .Y(
        data_out[17]) );
  AO22X1TS U4 ( .A0(n1), .A1(ch_1[14]), .B0(n5), .B1(ch_0[14]), .Y(
        data_out[14]) );
  AO22X1TS U5 ( .A0(n3), .A1(ch_1[19]), .B0(n5), .B1(ch_0[19]), .Y(
        data_out[19]) );
  AO22X1TS U6 ( .A0(n3), .A1(ch_1[15]), .B0(n5), .B1(ch_0[15]), .Y(
        data_out[15]) );
  AO22X1TS U7 ( .A0(n3), .A1(ch_1[18]), .B0(n5), .B1(ch_0[18]), .Y(
        data_out[18]) );
  AO22X1TS U8 ( .A0(n3), .A1(ch_1[12]), .B0(n5), .B1(ch_0[12]), .Y(
        data_out[12]) );
  AO22X1TS U9 ( .A0(select), .A1(ch_1[10]), .B0(n5), .B1(ch_0[10]), .Y(
        data_out[10]) );
  AO22X1TS U10 ( .A0(select), .A1(ch_1[13]), .B0(n5), .B1(ch_0[13]), .Y(
        data_out[13]) );
  AO22X1TS U11 ( .A0(n1), .A1(ch_1[16]), .B0(n5), .B1(ch_0[16]), .Y(
        data_out[16]) );
  AO22XLTS U12 ( .A0(n2), .A1(ch_1[21]), .B0(n6), .B1(ch_0[21]), .Y(
        data_out[21]) );
  AO22XLTS U13 ( .A0(n2), .A1(ch_1[20]), .B0(n6), .B1(ch_0[20]), .Y(
        data_out[20]) );
  AO22XLTS U14 ( .A0(n2), .A1(ch_1[22]), .B0(n6), .B1(ch_0[22]), .Y(
        data_out[22]) );
  AO22XLTS U15 ( .A0(n2), .A1(ch_1[31]), .B0(n7), .B1(ch_0[31]), .Y(
        data_out[31]) );
  AO22XLTS U16 ( .A0(select), .A1(ch_1[11]), .B0(n5), .B1(ch_0[11]), .Y(
        data_out[11]) );
  AO22XLTS U17 ( .A0(select), .A1(ch_1[9]), .B0(n4), .B1(ch_0[9]), .Y(
        data_out[9]) );
  AO22XLTS U18 ( .A0(n2), .A1(ch_1[3]), .B0(n4), .B1(ch_0[3]), .Y(data_out[3])
         );
  AO22XLTS U19 ( .A0(n1), .A1(ch_1[7]), .B0(n4), .B1(ch_0[7]), .Y(data_out[7])
         );
  AO22XLTS U20 ( .A0(n3), .A1(ch_1[8]), .B0(n4), .B1(ch_0[8]), .Y(data_out[8])
         );
  AO22XLTS U21 ( .A0(n3), .A1(ch_1[0]), .B0(n4), .B1(ch_0[0]), .Y(data_out[0])
         );
  AO22XLTS U22 ( .A0(n2), .A1(ch_1[1]), .B0(n4), .B1(ch_0[1]), .Y(data_out[1])
         );
  AO22XLTS U23 ( .A0(n2), .A1(ch_1[2]), .B0(n4), .B1(ch_0[2]), .Y(data_out[2])
         );
  AO22XLTS U24 ( .A0(n3), .A1(ch_1[28]), .B0(n7), .B1(ch_0[28]), .Y(
        data_out[28]) );
  AO22XLTS U25 ( .A0(select), .A1(ch_1[6]), .B0(n4), .B1(ch_0[6]), .Y(
        data_out[6]) );
  AO22XLTS U26 ( .A0(n2), .A1(ch_1[4]), .B0(n4), .B1(ch_0[4]), .Y(data_out[4])
         );
  AO22XLTS U27 ( .A0(select), .A1(ch_1[5]), .B0(n4), .B1(ch_0[5]), .Y(
        data_out[5]) );
  AO22XLTS U28 ( .A0(n3), .A1(ch_1[30]), .B0(n7), .B1(ch_0[30]), .Y(
        data_out[30]) );
  AO22XLTS U29 ( .A0(n1), .A1(ch_1[26]), .B0(n6), .B1(ch_0[26]), .Y(
        data_out[26]) );
  AO22XLTS U30 ( .A0(n3), .A1(ch_1[25]), .B0(n7), .B1(ch_0[25]), .Y(
        data_out[25]) );
  AO22XLTS U31 ( .A0(n2), .A1(ch_1[29]), .B0(n6), .B1(ch_0[29]), .Y(
        data_out[29]) );
  AO22XLTS U32 ( .A0(n3), .A1(ch_1[27]), .B0(n7), .B1(ch_0[27]), .Y(
        data_out[27]) );
  AO22XLTS U33 ( .A0(n2), .A1(ch_1[24]), .B0(n6), .B1(ch_0[24]), .Y(
        data_out[24]) );
  AO22XLTS U34 ( .A0(n1), .A1(ch_1[23]), .B0(n6), .B1(ch_0[23]), .Y(
        data_out[23]) );
  BUFX3TS U35 ( .A(select), .Y(n2) );
  BUFX3TS U36 ( .A(select), .Y(n3) );
  BUFX3TS U37 ( .A(n6), .Y(n4) );
  CLKBUFX2TS U38 ( .A(n6), .Y(n7) );
  BUFX3TS U39 ( .A(n7), .Y(n5) );
initial $sdf_annotate("FPU_Interface2_RKOA_1STAGE_syn.sdf"); 
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
         SIGN_FLAG_NRM, SIGN_FLAG_SFG, OP_FLAG_SFG,
         inst_FSM_INPUT_ENABLE_state_next_1_, n534, n535, n536, n537, n538,
         n539, n540, n541, n542, n543, n544, n545, n546, n547, n548, n549,
         n550, n551, n552, n553, n554, n555, n556, n557, n558, n559, n560,
         n561, n562, n563, n564, n565, n566, n567, n568, n569, n570, n571,
         n572, n573, n574, n575, n576, n577, n578, n579, n580, n581, n582,
         n583, n584, n585, n586, n587, n588, n589, n590, n591, n592, n593,
         n594, n595, n596, n597, n598, n599, n600, n601, n602, n603, n604,
         n605, n606, n607, n608, n609, n610, n611, n612, n613, n614, n615,
         n616, n617, n618, n619, n620, n621, n622, n623, n624, n625, n626,
         n627, n628, n629, n630, n632, n633, n634, n635, n636, n637, n638,
         n639, n640, n641, n642, n643, n644, n645, n646, n647, n648, n649,
         n650, n651, n652, n653, n654, n655, n656, n657, n658, n659, n660,
         n661, n662, n663, n664, n665, n666, n667, n668, n669, n670, n671,
         n672, n673, n674, n675, n676, n677, n678, n679, n680, n681, n682,
         n683, n684, n685, n686, n687, n688, n689, n690, n691, n692, n693,
         n694, n695, n696, n697, n698, n699, n700, n701, n702, n703, n704,
         n705, n706, n707, n708, n709, n710, n711, n712, n713, n714, n715,
         n716, n717, n718, n719, n720, n721, n722, n723, n724, n725, n726,
         n727, n728, n729, n730, n731, n732, n733, n734, n735, n736, n737,
         n738, n739, n740, n741, n742, n743, n744, n745, n746, n747, n748,
         n749, n750, n751, n752, n753, n754, n755, n756, n757, n758, n759,
         n760, n761, n762, n763, n765, n766, n768, n769, n771, n772, n774,
         n775, n777, n778, n780, n781, n783, n784, n786, n787, n788, n789,
         n790, n791, n792, n793, n794, n795, n797, n798, n799, n800, n801,
         n802, n803, n804, n805, n806, n807, n808, n809, n810, n811, n812,
         n813, n814, n815, n816, n817, n818, n819, n820, n821, n822, n823,
         n824, n825, n826, n827, n828, n829, n830, n831, n832, n833, n835,
         n836, n837, n838, n839, n840, n841, n842, n843, n844, n845, n846,
         n847, n848, n849, n850, n851, n852, n853, n854, n855, n856, n857,
         n858, n859, n860, n861, n862, n863, n864, n865, n866, n867, n868,
         n869, n870, n871, n872, n873, n874, n875, n876, n877, n878, n879,
         n880, n881, n882, n883, n884, n885, n886, n887, n888, n889, n890,
         n891, n892, n893, n894, n895, n896, n897, n898, n899, n900, n901,
         n902, n903, n904, n905, n906, n907, n908, n909, n910, n911, n912,
         n913, n914, n915, n916, n917, n918, n919, n920, n921, n922, n923,
         n924, n925, n926, n927, n928, n929, n930, n931, n932, n933, n934,
         n935, n936, n937, n938, DP_OP_15J43_122_6956_n18,
         DP_OP_15J43_122_6956_n17, DP_OP_15J43_122_6956_n16,
         DP_OP_15J43_122_6956_n15, DP_OP_15J43_122_6956_n14,
         DP_OP_15J43_122_6956_n8, DP_OP_15J43_122_6956_n7,
         DP_OP_15J43_122_6956_n6, DP_OP_15J43_122_6956_n5,
         DP_OP_15J43_122_6956_n4, DP_OP_15J43_122_6956_n3,
         DP_OP_15J43_122_6956_n2, DP_OP_15J43_122_6956_n1, n73, n1430, n1431,
         n1432, n1433, n1434, n1435, n1437, n1438, n1439, n1440, n1441, n1442,
         n1443, n1445, n1446, n1447, n1451, n1452, n1455, n1456, n1457, n1458,
         n1459, n1460, n1461, n1462, n1463, n1464, n1465, n1467, n1469, n1477,
         n1480, n1482, n1483, n1484, n1485, n1486, n1487, n1488, n1489, n1490,
         n1491, n1492, n1493, n1494, n1495, n1496, n1499, n1500, n1501, n1502,
         n1503, n1504, n1505, n1506, n1507, n1508, n1509, n1510, n1511, n1512,
         n1513, n1514, n1515, n1516, n1517, n1518, n1519, n1520, n1521, n1522,
         n1527, n1528, n1529, n1530, n1531, n1532, n1533, n1534, n1186, n1187,
         n1580, n1581, n1582, n1583, n1584, n1585, n1586, n1587, n1588, n1589,
         n1590, n1591, n1592, n1593, n1594, n1595, n1596, n1597, n1598, n1599,
         n1600, n1601, n1602, n1603, n1604, n1605, n1606, n1607, n1608, n1609,
         n1610, n1611, n1612, n1613, n1614, n1615, n1616, n1617, n1618, n1619,
         n1620, n1621, n1622, n1623, n1624, n1625, n1626, n1627, n1628, n1629,
         n1630, n1631, n1632, n1633, n1634, n1635, n1636, n1637, n1638, n1639,
         n1640, n1641, n1642, n1643, n1644, n1645, n1646, n1647, n1648, n1649,
         n1650, n1651, n1652, n1653, n1654, n1655, n1656, n1657, n1658, n1659,
         n1660, n1661, n1662, n1663, n1664, n1665, n1666, n1667, n1668, n1669,
         n1670, n1671, n1672, n1673, n1674, n1675, n1676, n1677, n1678, n1679,
         n1680, n1681, n1682, n1683, n1684, n1685, n1686, n1687, n1688, n1689,
         n1690, n1691, n1692, n1693, n1694, n1695, n1696, n1697, n1698, n1699,
         n1700, n1701, n1702, n1703, n1704, n1705, n1706, n1707, n1708, n1709,
         n1710, n1711, n1712, n1713, n1714, n1715, n1716, n1717, n1718, n1719,
         n1720, n1721, n1722, n1723, n1724, n1725, n1726, n1727, n1728, n1729,
         n1730, n1731, n1732, n1733, n1734, n1735, n1736, n1737, n1738, n1739,
         n1740, n1741, n1742, n1743, n1744, n1745, n1746, n1747, n1748, n1749,
         n1750, n1751, n1752, n1753, n1754, n1755, n1756, n1757, n1758, n1759,
         n1760, n1761, n1762, n1763, n1764, n1765, n1766, n1767, n1768, n1769,
         n1770, n1771, n1772, n1773, n1774, n1775, n1776, n1777, n1778, n1779,
         n1780, n1781, n1782, n1783, n1784, n1785, n1786, n1787, n1788, n1789,
         n1790, n1791, n1792, n1793, n1794, n1795, n1796, n1797, n1798, n1799,
         n1800, n1801, n1802, n1803, n1804, n1805, n1806, n1807, n1808, n1809,
         n1810, n1811, n1812, n1813, n1814, n1815, n1816, n1817, n1818, n1819,
         n1820, n1821, n1822, n1823, n1824, n1825, n1826, n1827, n1828, n1829,
         n1830, n1831, n1832, n1833, n1834, n1835, n1836, n1837, n1838, n1839,
         n1840, n1841, n1842, n1843, n1844, n1845, n1846, n1847, n1848, n1849,
         n1850, n1851, n1852, n1853, n1854, n1855, n1856, n1857, n1858, n1859,
         n1860, n1861, n1862, n1863, n1864, n1865, n1866, n1867, n1868, n1869,
         n1870, n1871, n1872, n1873, n1874, n1875, n1876, n1877, n1878, n1879,
         n1880, n1881, n1882, n1883, n1884, n1885, n1886, n1887, n1888, n1889,
         n1890, n1891, n1892, n1893, n1894, n1895, n1896, n1897, n1898, n1899,
         n1900, n1901, n1902, n1903, n1904, n1905, n1906, n1907, n1908, n1909,
         n1910, n1911, n1912, n1913, n1914, n1915, n1916, n1917, n1918, n1919,
         n1920, n1921, n1922, n1923, n1924, n1925, n1926, n1927, n1928, n1929,
         n1930, n1931, n1932, n1933, n1934, n1935, n1936, n1937, n1938, n1939,
         n1940, n1941, n1942, n1943, n1944, n1945, n1946, n1947, n1948, n1949,
         n1950, n1951, n1952, n1953, n1954, n1955, n1956, n1957, n1958, n1959,
         n1960, n1961, n1962, n1963, n1964, n1965, n1966, n1967, n1968, n1969,
         n1970, n1971, n1972, n1973, n1974, n1975, n1976, n1977, n1978, n1979,
         n1980, n1981, n1982, n1983, n1984, n1985, n1986, n1987, n1988, n1989,
         n1990, n1991, n1992, n1993, n1994, n1995, n1996, n1997, n1998, n1999,
         n2000, n2001, n2002, n2003, n2004, n2005, n2006, n2007, n2008, n2009,
         n2010, n2011, n2012, n2013, n2014, n2015, n2016, n2017, n2018, n2019,
         n2020, n2021, n2022, n2023, n2024, n2025, n2026, n2027, n2028, n2029,
         n2030, n2031, n2032, n2033, n2034, n2035, n2036, n2037, n2038, n2039,
         n2040, n2041, n2042, n2043, n2044, n2045, n2046, n2047, n2048, n2049,
         n2050, n2051, n2052, n2053, n2054, n2055, n2056, n2057, n2058, n2059,
         n2060, n2061, n2062, n2063, n2064, n2065, n2066, n2067, n2068, n2069,
         n2070, n2071, n2072, n2073, n2074, n2075, n2076, n2077, n2078, n2079,
         n2080, n2081, n2082, n2083, n2084, n2085, n2086, n2087, n2088, n2089,
         n2090, n2091, n2092, n2093, n2094, n2095, n2096, n2097, n2098, n2099,
         n2100, n2101, n2102, n2103, n2104, n2105, n2106, n2107, n2108, n2109,
         n2110, n2111, n2112, n2113, n2114, n2115, n2116, n2117, n2118, n2119,
         n2120, n2121, n2122, n2123, n2124, n2125, n2126, n2127, n2128, n2129,
         n2130, n2131, n2132, n2133, n2134, n2135, n2136, n2137, n2138, n2139,
         n2140, n2141, n2142, n2143, n2144, n2145, n2146, n2147, n2148, n2149,
         n2150, n2151, n2152, n2153, n2154, n2155, n2156, n2157, n2158, n2159,
         n2160, n2161, n2162, n2163, n2164, n2165, n2166, n2167, n2168, n2169,
         n2170, n2171, n2172, n2173, n2174, n2175, n2176, n2177, n2178, n2179,
         n2180, n2181, n2182, n2183, n2184, n2185, n2186, n2187, n2188, n2189,
         n2190, n2191, n2192, n2193, n2194, n2195, n2196, n2197, n2198, n2199,
         n2200, n2201, n2202, n2203, n2204, n2205, n2206, n2207, n2208, n2209,
         n2210, n2211, n2212, n2213, n2214, n2215, n2216, n2217, n2218, n2219,
         n2220, n2221, n2222, n2223, n2224, n2225, n2226, n2227, n2228, n2229,
         n2230, n2231, n2232, n2233, n2234, n2235, n2236, n2237, n2238, n2239,
         n2240, n2241, n2242, n2243, n2244, n2245, n2246, n2247, n2248, n2249,
         n2250, n2251, n2252, n2253, n2254, n2255, n2256, n2257, n2258, n2259,
         n2260, n2261, n2262, n2263, n2264, n2265, n2266, n2267, n2268, n2269,
         n2270, n2271, n2272, n2273, n2274, n2275, n2276, n2277, n2278, n2279,
         n2280, n2281, n2282, n2283, n2284, n2285, n2286, n2287, n2288, n2289,
         n2290, n2291, n2292, n2293, n2294, n2295, n2296, n2297, n2298, n2299,
         n2300, n2301, n2302, n2303, n2304, n2305, n2306, n2307, n2308, n2309,
         n2310, n2311, n2312, n2313, n2314, n2315, n2316, n2317, n2318, n2319,
         n2320, n2321, n2322, n2323, n2324, n2325, n2326, n2327, n2328, n2329,
         n2330, n2331, n2332, n2333, n2334, n2335, n2336, n2337, n2338, n2339,
         n2340, n2341, n2342, n2343, n2344, n2345, n2346, n2347, n2348, n2349,
         n2350, n2351, n2352, n2353, n2354, n2355, n2356, n2357, n2358, n2359,
         n2360, n2361, n2362, n2363, n2364, n2365, n2366, n2367, n2368, n2369,
         n2370, n2371, n2372, n2373, n2374, n2375, n2376, n2377, n2378, n2379,
         n2380, n2381, n2382, n2383, n2384, n2385, n2386, n2387, n2388, n2389,
         n2390, n2391, n2392, n2393, n2394, n2395, n2396, n2397, n2398, n2399,
         n2400, n2401, n2402, n2403, n2404, n2405, n2406, n2407, n2408, n2409,
         n2410, n2411, n2412, n2413, n2414, n2415, n2416, n2417, n2418, n2419,
         n2420, n2421, n2422, n2423, n2424, n2425, n2426, n2427, n2428, n2429,
         n2430, n2431, n2432, n2433, n2434, n2435, n2436, n2437, n2438, n2439,
         n2440, n2441, n2442, n2443, n2444, n2445, n2446, n2447, n2448, n2449,
         n2450, n2451, n2452, n2453, n2454, n2455, n2456, n2457, n2458, n2459,
         n2460, n2461, n2462, n2463, n2464, n2465, n2466, n2467, n2468, n2469,
         n2470, n2471, n2472, n2473, n2474, n2475, n2476, n2477, n2478, n2479,
         n2480, n2481, n2482, n2483, n2484, n2485, n2486, n2487, n2488, n2489,
         n2490, n2491, n2492, n2493, n2494, n2495, n2496, n2497, n2498, n2499,
         n2500, n2501, n2502, n2503, n2504, n2505, n2506, n2507, n2508, n2509,
         n2510, n2511, n2512, n2513, n2514, n2515, n2516, n2517, n2518, n2519,
         n2520, n2521, n2522, n2523, n2524, n2525, n2526, n2527, n2528, n2529,
         n2530, n2531, n2532, n2533, n2534, n2535, n2536, n2537, n2538, n2539,
         n2540, n2541, n2542, n2543, n2544, n2545, n2546, n2547, n2548, n2549,
         n2550, n2551, n2552, n2553, n2554, n2555, n2556, n2557, n2558, n2559,
         n2560, n2561, n2562, n2563, n2564, n2565, n2566, n2567, n2568, n2569,
         n2570, n2571, n2572, n2573, n2574, n2575, n2576, n2577, n2578, n2579,
         n2580, n2581, n2582, n2583, n2584, n2585, n2586, n2587, n2588, n2589,
         n2590, n2591, n2592, n2593, n2594, n2595, n2596, n2597, n2598, n2599,
         n2600, n2601, n2602, n2603, n2604, n2605, n2606, n2607, n2608, n2609,
         n2610, n2611, n2612, n2613, n2614, n2615, n2616, n2617, n2618, n2619,
         n2620, n2621, n2622, n2623, n2624, n2625, n2626, n2627, n2628, n2629,
         n2630, n2631, n2632, n2633, n2634, n2635, n2636, n2637, n2638, n2639,
         n2640, n2641, n2642, n2643, n2644;
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
  wire   [30:0] DMP_SFG;
  wire   [25:0] DmP_mant_SFG_SWR;
  wire   [2:0] inst_FSM_INPUT_ENABLE_state_reg;

  DFFRXLTS INPUT_STAGE_FLAGS_Q_reg_0_ ( .D(n897), .CK(clk), .RN(n2631), .Q(
        intAS) );
  DFFRXLTS SHT1_STAGE_sft_amount_Q_reg_2_ ( .D(n830), .CK(clk), .RN(n2631), 
        .Q(Shift_amount_SHT1_EWR[2]) );
  DFFRXLTS SHT1_STAGE_sft_amount_Q_reg_3_ ( .D(n829), .CK(clk), .RN(n2630), 
        .Q(Shift_amount_SHT1_EWR[3]) );
  DFFRXLTS SHT1_STAGE_sft_amount_Q_reg_4_ ( .D(n828), .CK(clk), .RN(n2630), 
        .Q(Shift_amount_SHT1_EWR[4]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_0_ ( .D(n819), .CK(clk), .RN(n2630), .Q(
        DMP_EXP_EWSW[0]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_1_ ( .D(n818), .CK(clk), .RN(n2630), .Q(
        DMP_EXP_EWSW[1]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_2_ ( .D(n817), .CK(clk), .RN(n2630), .Q(
        DMP_EXP_EWSW[2]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_3_ ( .D(n816), .CK(clk), .RN(n2630), .Q(
        DMP_EXP_EWSW[3]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_4_ ( .D(n815), .CK(clk), .RN(n2630), .Q(
        DMP_EXP_EWSW[4]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_5_ ( .D(n814), .CK(clk), .RN(n2629), .Q(
        DMP_EXP_EWSW[5]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_6_ ( .D(n813), .CK(clk), .RN(n2629), .Q(
        DMP_EXP_EWSW[6]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_7_ ( .D(n812), .CK(clk), .RN(n2629), .Q(
        DMP_EXP_EWSW[7]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_8_ ( .D(n811), .CK(clk), .RN(n2629), .Q(
        DMP_EXP_EWSW[8]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_9_ ( .D(n810), .CK(clk), .RN(n2629), .Q(
        DMP_EXP_EWSW[9]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_10_ ( .D(n809), .CK(clk), .RN(n2629), .Q(
        DMP_EXP_EWSW[10]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_11_ ( .D(n808), .CK(clk), .RN(n2629), .Q(
        DMP_EXP_EWSW[11]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_12_ ( .D(n807), .CK(clk), .RN(n2628), .Q(
        DMP_EXP_EWSW[12]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_13_ ( .D(n806), .CK(clk), .RN(n2628), .Q(
        DMP_EXP_EWSW[13]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_14_ ( .D(n805), .CK(clk), .RN(n2628), .Q(
        DMP_EXP_EWSW[14]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_15_ ( .D(n804), .CK(clk), .RN(n2628), .Q(
        DMP_EXP_EWSW[15]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_16_ ( .D(n803), .CK(clk), .RN(n2628), .Q(
        DMP_EXP_EWSW[16]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_17_ ( .D(n802), .CK(clk), .RN(n2628), .Q(
        DMP_EXP_EWSW[17]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_18_ ( .D(n801), .CK(clk), .RN(n2628), .Q(
        DMP_EXP_EWSW[18]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_19_ ( .D(n800), .CK(clk), .RN(n2628), .Q(
        DMP_EXP_EWSW[19]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_20_ ( .D(n799), .CK(clk), .RN(n2627), .Q(
        DMP_EXP_EWSW[20]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_21_ ( .D(n798), .CK(clk), .RN(n2627), .Q(
        DMP_EXP_EWSW[21]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_22_ ( .D(n797), .CK(clk), .RN(n2627), .Q(
        DMP_EXP_EWSW[22]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_28_ ( .D(n791), .CK(clk), .RN(n2627), .Q(
        DMP_EXP_EWSW[28]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_29_ ( .D(n790), .CK(clk), .RN(n2626), .Q(
        DMP_EXP_EWSW[29]) );
  DFFRXLTS EXP_STAGE_DMP_Q_reg_30_ ( .D(n789), .CK(clk), .RN(n2626), .Q(
        DMP_EXP_EWSW[30]) );
  DFFRXLTS EXP_STAGE_FLAGS_Q_reg_1_ ( .D(n788), .CK(clk), .RN(n2626), .Q(
        OP_FLAG_EXP) );
  DFFRXLTS EXP_STAGE_FLAGS_Q_reg_2_ ( .D(n787), .CK(clk), .RN(n2626), .Q(
        SIGN_FLAG_EXP) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_0_ ( .D(n786), .CK(clk), .RN(n2626), .Q(
        DMP_SHT1_EWSW[0]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_0_ ( .D(n1534), .CK(clk), .RN(n2631), .Q(
        DMP_SHT2_EWSW[0]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_1_ ( .D(n783), .CK(clk), .RN(n2626), .Q(
        DMP_SHT1_EWSW[1]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_1_ ( .D(n1533), .CK(clk), .RN(n2631), .Q(
        DMP_SHT2_EWSW[1]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_2_ ( .D(n780), .CK(clk), .RN(n2626), .Q(
        DMP_SHT1_EWSW[2]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_2_ ( .D(n1532), .CK(clk), .RN(n2630), .Q(
        DMP_SHT2_EWSW[2]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_3_ ( .D(n777), .CK(clk), .RN(n2626), .Q(
        DMP_SHT1_EWSW[3]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_3_ ( .D(n1531), .CK(clk), .RN(n2630), .Q(
        DMP_SHT2_EWSW[3]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_4_ ( .D(n774), .CK(clk), .RN(n2626), .Q(
        DMP_SHT1_EWSW[4]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_4_ ( .D(n1530), .CK(clk), .RN(n2630), .Q(
        DMP_SHT2_EWSW[4]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_5_ ( .D(n771), .CK(clk), .RN(n2626), .Q(
        DMP_SHT1_EWSW[5]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_5_ ( .D(n1529), .CK(clk), .RN(n2629), .Q(
        DMP_SHT2_EWSW[5]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_6_ ( .D(n768), .CK(clk), .RN(n2625), .Q(
        DMP_SHT1_EWSW[6]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_6_ ( .D(n1528), .CK(clk), .RN(n2629), .Q(
        DMP_SHT2_EWSW[6]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_7_ ( .D(n765), .CK(clk), .RN(n2627), .Q(
        DMP_SHT1_EWSW[7]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_7_ ( .D(n1527), .CK(clk), .RN(n2629), .Q(
        DMP_SHT2_EWSW[7]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_8_ ( .D(n762), .CK(clk), .RN(n2625), .Q(
        DMP_SHT1_EWSW[8]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_8_ ( .D(n761), .CK(clk), .RN(n2628), .Q(
        DMP_SHT2_EWSW[8]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_9_ ( .D(n759), .CK(clk), .RN(n2625), .Q(
        DMP_SHT1_EWSW[9]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_9_ ( .D(n758), .CK(clk), .RN(n2628), .Q(
        DMP_SHT2_EWSW[9]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_10_ ( .D(n756), .CK(clk), .RN(n2625), .Q(
        DMP_SHT1_EWSW[10]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_10_ ( .D(n755), .CK(clk), .RN(n2627), .Q(
        DMP_SHT2_EWSW[10]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_11_ ( .D(n753), .CK(clk), .RN(n2625), .Q(
        DMP_SHT1_EWSW[11]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_11_ ( .D(n752), .CK(clk), .RN(n2627), .Q(
        DMP_SHT2_EWSW[11]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_12_ ( .D(n750), .CK(clk), .RN(n2625), .Q(
        DMP_SHT1_EWSW[12]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_12_ ( .D(n749), .CK(clk), .RN(n2627), .Q(
        DMP_SHT2_EWSW[12]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_13_ ( .D(n747), .CK(clk), .RN(n2625), .Q(
        DMP_SHT1_EWSW[13]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_13_ ( .D(n746), .CK(clk), .RN(n2627), .Q(
        DMP_SHT2_EWSW[13]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_14_ ( .D(n744), .CK(clk), .RN(n2625), .Q(
        DMP_SHT1_EWSW[14]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_14_ ( .D(n743), .CK(clk), .RN(n2625), .Q(
        DMP_SHT2_EWSW[14]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_15_ ( .D(n741), .CK(clk), .RN(n2624), .Q(
        DMP_SHT1_EWSW[15]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_15_ ( .D(n740), .CK(clk), .RN(n2624), .Q(
        DMP_SHT2_EWSW[15]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_16_ ( .D(n738), .CK(clk), .RN(n2624), .Q(
        DMP_SHT1_EWSW[16]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_16_ ( .D(n737), .CK(clk), .RN(n2624), .Q(
        DMP_SHT2_EWSW[16]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_17_ ( .D(n735), .CK(clk), .RN(n2624), .Q(
        DMP_SHT1_EWSW[17]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_17_ ( .D(n734), .CK(clk), .RN(n2624), .Q(
        DMP_SHT2_EWSW[17]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_18_ ( .D(n732), .CK(clk), .RN(n2624), .Q(
        DMP_SHT1_EWSW[18]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_18_ ( .D(n731), .CK(clk), .RN(n2624), .Q(
        DMP_SHT2_EWSW[18]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_19_ ( .D(n729), .CK(clk), .RN(n2624), .Q(
        DMP_SHT1_EWSW[19]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_19_ ( .D(n728), .CK(clk), .RN(n2624), .Q(
        DMP_SHT2_EWSW[19]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_20_ ( .D(n726), .CK(clk), .RN(n2623), .Q(
        DMP_SHT1_EWSW[20]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_20_ ( .D(n725), .CK(clk), .RN(n2623), .Q(
        DMP_SHT2_EWSW[20]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_21_ ( .D(n723), .CK(clk), .RN(n2623), .Q(
        DMP_SHT1_EWSW[21]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_21_ ( .D(n722), .CK(clk), .RN(n2623), .Q(
        DMP_SHT2_EWSW[21]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_22_ ( .D(n720), .CK(clk), .RN(n2623), .Q(
        DMP_SHT1_EWSW[22]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_22_ ( .D(n719), .CK(clk), .RN(n2623), .Q(
        DMP_SHT2_EWSW[22]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_23_ ( .D(n717), .CK(clk), .RN(n2623), .Q(
        DMP_SHT1_EWSW[23]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_23_ ( .D(n716), .CK(clk), .RN(n2623), .Q(
        DMP_SHT2_EWSW[23]) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_23_ ( .D(n715), .CK(clk), .RN(n2623), .Q(
        DMP_SFG[23]) );
  DFFRXLTS NRM_STAGE_DMP_exp_Q_reg_0_ ( .D(n714), .CK(clk), .RN(n2622), .Q(
        DMP_exp_NRM_EW[0]) );
  DFFRX1TS SFT2FRMT_STAGE_VARS_Q_reg_0_ ( .D(n713), .CK(clk), .RN(n2622), .Q(
        DMP_exp_NRM2_EW[0]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_24_ ( .D(n712), .CK(clk), .RN(n2631), .Q(
        DMP_SHT1_EWSW[24]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_24_ ( .D(n711), .CK(clk), .RN(n2631), .Q(
        DMP_SHT2_EWSW[24]) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_24_ ( .D(n710), .CK(clk), .RN(n2632), .Q(
        DMP_SFG[24]) );
  DFFRXLTS NRM_STAGE_DMP_exp_Q_reg_1_ ( .D(n709), .CK(clk), .RN(n2632), .Q(
        DMP_exp_NRM_EW[1]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_25_ ( .D(n707), .CK(clk), .RN(n2632), .Q(
        DMP_SHT1_EWSW[25]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_25_ ( .D(n706), .CK(clk), .RN(n2632), .Q(
        DMP_SHT2_EWSW[25]) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_25_ ( .D(n705), .CK(clk), .RN(n2632), .Q(
        DMP_SFG[25]) );
  DFFRXLTS NRM_STAGE_DMP_exp_Q_reg_2_ ( .D(n704), .CK(clk), .RN(n2632), .Q(
        DMP_exp_NRM_EW[2]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_26_ ( .D(n702), .CK(clk), .RN(n2632), .Q(
        DMP_SHT1_EWSW[26]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_26_ ( .D(n701), .CK(clk), .RN(n2632), .Q(
        DMP_SHT2_EWSW[26]) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_26_ ( .D(n700), .CK(clk), .RN(n2632), .Q(
        DMP_SFG[26]) );
  DFFRXLTS NRM_STAGE_DMP_exp_Q_reg_3_ ( .D(n699), .CK(clk), .RN(n2632), .Q(
        DMP_exp_NRM_EW[3]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_27_ ( .D(n697), .CK(clk), .RN(n2633), .Q(
        DMP_SHT1_EWSW[27]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_27_ ( .D(n696), .CK(clk), .RN(n2633), .Q(
        DMP_SHT2_EWSW[27]) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_27_ ( .D(n695), .CK(clk), .RN(n2633), .Q(
        DMP_SFG[27]) );
  DFFRXLTS NRM_STAGE_DMP_exp_Q_reg_4_ ( .D(n694), .CK(clk), .RN(n2633), .Q(
        DMP_exp_NRM_EW[4]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_28_ ( .D(n692), .CK(clk), .RN(n2633), .Q(
        DMP_SHT1_EWSW[28]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_28_ ( .D(n691), .CK(clk), .RN(n2633), .Q(
        DMP_SHT2_EWSW[28]) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_28_ ( .D(n690), .CK(clk), .RN(n2633), .Q(
        DMP_SFG[28]) );
  DFFRXLTS NRM_STAGE_DMP_exp_Q_reg_5_ ( .D(n689), .CK(clk), .RN(n2633), .Q(
        DMP_exp_NRM_EW[5]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_29_ ( .D(n687), .CK(clk), .RN(n2633), .Q(
        DMP_SHT1_EWSW[29]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_29_ ( .D(n686), .CK(clk), .RN(n2633), .Q(
        DMP_SHT2_EWSW[29]) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_29_ ( .D(n685), .CK(clk), .RN(n2634), .Q(
        DMP_SFG[29]) );
  DFFRXLTS NRM_STAGE_DMP_exp_Q_reg_6_ ( .D(n684), .CK(clk), .RN(n2634), .Q(
        DMP_exp_NRM_EW[6]) );
  DFFRXLTS SHT1_STAGE_DMP_Q_reg_30_ ( .D(n682), .CK(clk), .RN(n2634), .Q(
        DMP_SHT1_EWSW[30]) );
  DFFRXLTS SHT2_STAGE_DMP_Q_reg_30_ ( .D(n681), .CK(clk), .RN(n2634), .Q(
        DMP_SHT2_EWSW[30]) );
  DFFRXLTS SGF_STAGE_DMP_Q_reg_30_ ( .D(n680), .CK(clk), .RN(n2634), .Q(
        DMP_SFG[30]) );
  DFFRXLTS NRM_STAGE_DMP_exp_Q_reg_7_ ( .D(n679), .CK(clk), .RN(n2634), .Q(
        DMP_exp_NRM_EW[7]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_0_ ( .D(n677), .CK(clk), .RN(n2634), .Q(
        DmP_EXP_EWSW[0]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_0_ ( .D(n676), .CK(clk), .RN(n2634), .Q(
        DmP_mant_SHT1_SW[0]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_1_ ( .D(n675), .CK(clk), .RN(n2634), .Q(
        DmP_EXP_EWSW[1]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_1_ ( .D(n674), .CK(clk), .RN(n2634), .Q(
        DmP_mant_SHT1_SW[1]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_2_ ( .D(n673), .CK(clk), .RN(n2635), .Q(
        DmP_EXP_EWSW[2]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_2_ ( .D(n672), .CK(clk), .RN(n2635), .Q(
        DmP_mant_SHT1_SW[2]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_3_ ( .D(n671), .CK(clk), .RN(n2635), .Q(
        DmP_EXP_EWSW[3]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_3_ ( .D(n670), .CK(clk), .RN(n2635), .Q(
        DmP_mant_SHT1_SW[3]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_4_ ( .D(n669), .CK(clk), .RN(n2635), .Q(
        DmP_EXP_EWSW[4]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_4_ ( .D(n668), .CK(clk), .RN(n2635), .Q(
        DmP_mant_SHT1_SW[4]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_5_ ( .D(n667), .CK(clk), .RN(n2635), .Q(
        DmP_EXP_EWSW[5]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_5_ ( .D(n666), .CK(clk), .RN(n2635), .Q(
        DmP_mant_SHT1_SW[5]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_6_ ( .D(n665), .CK(clk), .RN(n2635), .Q(
        DmP_EXP_EWSW[6]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_6_ ( .D(n664), .CK(clk), .RN(n2636), .Q(
        DmP_mant_SHT1_SW[6]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_7_ ( .D(n663), .CK(clk), .RN(n2636), .Q(
        DmP_EXP_EWSW[7]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_7_ ( .D(n662), .CK(clk), .RN(n2636), .Q(
        DmP_mant_SHT1_SW[7]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_8_ ( .D(n661), .CK(clk), .RN(n2636), .Q(
        DmP_EXP_EWSW[8]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_8_ ( .D(n660), .CK(clk), .RN(n2636), .Q(
        DmP_mant_SHT1_SW[8]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_9_ ( .D(n659), .CK(clk), .RN(n2636), .Q(
        DmP_EXP_EWSW[9]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_9_ ( .D(n658), .CK(clk), .RN(n2636), .Q(
        DmP_mant_SHT1_SW[9]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_10_ ( .D(n657), .CK(clk), .RN(n2636), .Q(
        DmP_EXP_EWSW[10]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_10_ ( .D(n656), .CK(clk), .RN(n2636), .Q(
        DmP_mant_SHT1_SW[10]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_11_ ( .D(n655), .CK(clk), .RN(n2636), .Q(
        DmP_EXP_EWSW[11]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_11_ ( .D(n654), .CK(clk), .RN(n2637), .Q(
        DmP_mant_SHT1_SW[11]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_12_ ( .D(n653), .CK(clk), .RN(n2637), .Q(
        DmP_EXP_EWSW[12]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_12_ ( .D(n652), .CK(clk), .RN(n2637), .Q(
        DmP_mant_SHT1_SW[12]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_13_ ( .D(n651), .CK(clk), .RN(n2637), .Q(
        DmP_EXP_EWSW[13]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_13_ ( .D(n650), .CK(clk), .RN(n2637), .Q(
        DmP_mant_SHT1_SW[13]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_14_ ( .D(n649), .CK(clk), .RN(n2637), .Q(
        DmP_EXP_EWSW[14]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_14_ ( .D(n648), .CK(clk), .RN(n2637), .Q(
        DmP_mant_SHT1_SW[14]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_15_ ( .D(n647), .CK(clk), .RN(n2637), .Q(
        DmP_EXP_EWSW[15]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_15_ ( .D(n646), .CK(clk), .RN(n2637), .Q(
        DmP_mant_SHT1_SW[15]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_16_ ( .D(n645), .CK(clk), .RN(n2637), .Q(
        DmP_EXP_EWSW[16]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_16_ ( .D(n644), .CK(clk), .RN(n2638), .Q(
        DmP_mant_SHT1_SW[16]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_17_ ( .D(n643), .CK(clk), .RN(n2638), .Q(
        DmP_EXP_EWSW[17]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_17_ ( .D(n642), .CK(clk), .RN(n2638), .Q(
        DmP_mant_SHT1_SW[17]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_18_ ( .D(n641), .CK(clk), .RN(n2638), .Q(
        DmP_EXP_EWSW[18]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_18_ ( .D(n640), .CK(clk), .RN(n2638), .Q(
        DmP_mant_SHT1_SW[18]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_19_ ( .D(n639), .CK(clk), .RN(n2638), .Q(
        DmP_EXP_EWSW[19]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_19_ ( .D(n638), .CK(clk), .RN(n2638), .Q(
        DmP_mant_SHT1_SW[19]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_20_ ( .D(n637), .CK(clk), .RN(n2638), .Q(
        DmP_EXP_EWSW[20]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_20_ ( .D(n636), .CK(clk), .RN(n2638), .Q(
        DmP_mant_SHT1_SW[20]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_21_ ( .D(n635), .CK(clk), .RN(n2638), .Q(
        DmP_EXP_EWSW[21]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_21_ ( .D(n634), .CK(clk), .RN(n2639), .Q(
        DmP_mant_SHT1_SW[21]) );
  DFFRXLTS EXP_STAGE_DmP_Q_reg_22_ ( .D(n633), .CK(clk), .RN(n2639), .Q(
        DmP_EXP_EWSW[22]) );
  DFFRXLTS SHT1_STAGE_DmP_mant_Q_reg_22_ ( .D(n632), .CK(clk), .RN(n2639), .Q(
        DmP_mant_SHT1_SW[22]) );
  DFFRXLTS SHT1_STAGE_FLAGS_Q_reg_1_ ( .D(n624), .CK(clk), .RN(n2639), .Q(
        OP_FLAG_SHT1) );
  DFFRXLTS SHT2_STAGE_FLAGS_Q_reg_1_ ( .D(n623), .CK(clk), .RN(n2639), .Q(
        OP_FLAG_SHT2) );
  DFFRXLTS SHT1_STAGE_FLAGS_Q_reg_2_ ( .D(n619), .CK(clk), .RN(n2639), .Q(
        SIGN_FLAG_SHT1) );
  DFFRXLTS SHT2_STAGE_FLAGS_Q_reg_2_ ( .D(n618), .CK(clk), .RN(n2639), .Q(
        SIGN_FLAG_SHT2) );
  DFFRXLTS SGF_STAGE_FLAGS_Q_reg_2_ ( .D(n617), .CK(clk), .RN(n2639), .Q(
        SIGN_FLAG_SFG) );
  DFFRXLTS NRM_STAGE_FLAGS_Q_reg_1_ ( .D(n616), .CK(clk), .RN(n2615), .Q(
        SIGN_FLAG_NRM) );
  DFFRXLTS SFT2FRMT_STAGE_FLAGS_Q_reg_1_ ( .D(n615), .CK(clk), .RN(n2611), .Q(
        SIGN_FLAG_SHT1SHT2) );
  DFFRX4TS NRM_STAGE_Raw_mant_Q_reg_24_ ( .D(n589), .CK(clk), .RN(n2600), .Q(
        Raw_mant_NRM_SWR[24]) );
  DFFRX4TS NRM_STAGE_Raw_mant_Q_reg_25_ ( .D(n588), .CK(clk), .RN(n2600), .Q(
        Raw_mant_NRM_SWR[25]) );
  DFFRXLTS SFT2FRMT_STAGE_VARS_Q_reg_11_ ( .D(n587), .CK(clk), .RN(n2612), .Q(
        LZD_output_NRM2_EW[3]) );
  DFFRXLTS SFT2FRMT_STAGE_VARS_Q_reg_10_ ( .D(n585), .CK(clk), .RN(n1739), .Q(
        LZD_output_NRM2_EW[2]) );
  DFFRXLTS SFT2FRMT_STAGE_VARS_Q_reg_12_ ( .D(n583), .CK(clk), .RN(n1623), .Q(
        LZD_output_NRM2_EW[4]) );
  DFFRX2TS SHT2_STAGE_SHFTVARS2_Q_reg_0_ ( .D(n864), .CK(clk), .RN(n2601), 
        .QN(n1493) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_7_ ( .D(n889), .CK(clk), .RN(n2601), 
        .QN(n1459) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_24_ ( .D(n872), .CK(clk), .RN(n2603), 
        .QN(n1467) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_23_ ( .D(n906), .CK(clk), .RN(n2601), 
        .QN(n1477) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_5_ ( .D(n924), .CK(clk), .RN(n2601), 
        .QN(n1433) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_4_ ( .D(n925), .CK(clk), .RN(n2601), 
        .QN(n1434) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_6_ ( .D(n923), .CK(clk), .RN(n2601), 
        .QN(n1435) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_16_ ( .D(n913), .CK(clk), .RN(n2603), 
        .QN(n1438) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_10_ ( .D(n919), .CK(clk), .RN(n2601), 
        .QN(n1437) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_28_ ( .D(n901), .CK(clk), .RN(n2602), 
        .QN(n1432) );
  DFFRX1TS EXP_STAGE_DMP_Q_reg_25_ ( .D(n794), .CK(clk), .RN(n2611), .Q(n2644), 
        .QN(n1442) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_8_ ( .D(n845), .CK(clk), .RN(n2612), .Q(
        Data_array_SWR[8]) );
  DFFRX1TS SFT2FRMT_STAGE_VARS_Q_reg_4_ ( .D(n693), .CK(clk), .RN(n2616), .Q(
        DMP_exp_NRM2_EW[4]) );
  DFFRX1TS SFT2FRMT_STAGE_VARS_Q_reg_1_ ( .D(n708), .CK(clk), .RN(n1738), .Q(
        DMP_exp_NRM2_EW[1]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_6_ ( .D(n843), .CK(clk), .RN(n1740), .Q(
        Data_array_SWR[6]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_7_ ( .D(n844), .CK(clk), .RN(n1737), .Q(
        Data_array_SWR[7]) );
  DFFRX1TS EXP_STAGE_DmP_Q_reg_23_ ( .D(n1187), .CK(clk), .RN(n1736), .Q(
        DmP_EXP_EWSW[23]) );
  DFFRX1TS SGF_STAGE_FLAGS_Q_reg_1_ ( .D(n622), .CK(clk), .RN(n2615), .Q(
        OP_FLAG_SFG) );
  DFFRX1TS SFT2FRMT_STAGE_VARS_Q_reg_7_ ( .D(n678), .CK(clk), .RN(n2611), .Q(
        DMP_exp_NRM2_EW[7]) );
  DFFRX1TS SFT2FRMT_STAGE_VARS_Q_reg_6_ ( .D(n683), .CK(clk), .RN(n1736), .Q(
        DMP_exp_NRM2_EW[6]) );
  DFFRX1TS SFT2FRMT_STAGE_VARS_Q_reg_5_ ( .D(n688), .CK(clk), .RN(n1738), .Q(
        DMP_exp_NRM2_EW[5]) );
  DFFRX1TS SFT2FRMT_STAGE_VARS_Q_reg_3_ ( .D(n698), .CK(clk), .RN(n2613), .Q(
        DMP_exp_NRM2_EW[3]) );
  DFFRX1TS SFT2FRMT_STAGE_VARS_Q_reg_2_ ( .D(n703), .CK(clk), .RN(n1737), .Q(
        DMP_exp_NRM2_EW[2]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_2_ ( .D(n839), .CK(clk), .RN(n2616), .Q(
        Data_array_SWR[2]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_3_ ( .D(n840), .CK(clk), .RN(n2619), .Q(
        Data_array_SWR[3]) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_31_ ( .D(n865), .CK(clk), .RN(n1739), 
        .Q(intDY_EWSW[31]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_11_ ( .D(n848), .CK(clk), .RN(n2614), .Q(
        Data_array_SWR[11]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_10_ ( .D(n847), .CK(clk), .RN(n2615), .Q(
        Data_array_SWR[10]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_9_ ( .D(n846), .CK(clk), .RN(n2613), .Q(
        Data_array_SWR[9]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_5_ ( .D(n842), .CK(clk), .RN(n2612), .Q(
        Data_array_SWR[5]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_4_ ( .D(n841), .CK(clk), .RN(n2616), .Q(
        Data_array_SWR[4]) );
  DFFRX1TS EXP_STAGE_DMP_Q_reg_27_ ( .D(n792), .CK(clk), .RN(n2611), .Q(
        DMP_EXP_EWSW[27]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_1_ ( .D(n838), .CK(clk), .RN(n2615), .Q(
        Data_array_SWR[1]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_0_ ( .D(n837), .CK(clk), .RN(n1739), .Q(
        Data_array_SWR[0]) );
  DFFRX1TS EXP_STAGE_DmP_Q_reg_27_ ( .D(n627), .CK(clk), .RN(n2613), .Q(
        DmP_EXP_EWSW[27]) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_1_ ( .D(n558), .CK(clk), .RN(n2612), .QN(
        n1469) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_18_ ( .D(n541), .CK(clk), .RN(n2614), .Q(
        n2532), .QN(n1519) );
  DFFRX1TS EXP_STAGE_DMP_Q_reg_26_ ( .D(n793), .CK(clk), .RN(n2618), .Q(n2643), 
        .QN(n1446) );
  DFFRX1TS EXP_STAGE_DmP_Q_reg_26_ ( .D(n628), .CK(clk), .RN(n2618), .QN(n1445) );
  DFFRX1TS EXP_STAGE_DmP_Q_reg_25_ ( .D(n629), .CK(clk), .RN(n2618), .QN(n1447) );
  DFFRXLTS inst_ShiftRegister_Q_reg_1_ ( .D(n931), .CK(clk), .RN(n2600), .Q(
        Shift_reg_FLAGS_7[1]), .QN(n1582) );
  DFFRXLTS inst_ShiftRegister_Q_reg_2_ ( .D(n932), .CK(clk), .RN(n2601), .Q(
        Shift_reg_FLAGS_7[2]), .QN(n1640) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_2_ ( .D(n927), .CK(clk), .RN(n2612), 
        .QN(n1483) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_1_ ( .D(n928), .CK(clk), .RN(n2611), 
        .QN(n1482) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_0_ ( .D(n929), .CK(clk), .RN(n2616), 
        .QN(n1460) );
  DFFRXLTS FRMT_STAGE_FLAGS_Q_reg_1_ ( .D(n626), .CK(clk), .RN(n2639), .Q(
        underflow_flag) );
  DFFRXLTS FRMT_STAGE_FLAGS_Q_reg_2_ ( .D(n625), .CK(clk), .RN(n2639), .Q(
        overflow_flag) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_10_ ( .D(n582), .CK(clk), .RN(n2622), .Q(
        final_result_ieee[10]) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_11_ ( .D(n581), .CK(clk), .RN(n2622), .Q(
        final_result_ieee[11]) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_30_ ( .D(n820), .CK(clk), .RN(n2620), .Q(
        final_result_ieee[30]) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_31_ ( .D(n614), .CK(clk), .RN(n2620), .Q(
        final_result_ieee[31]) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_25_ ( .D(n825), .CK(clk), .RN(n2620), .Q(
        final_result_ieee[25]) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_26_ ( .D(n824), .CK(clk), .RN(n2619), .Q(
        final_result_ieee[26]) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_29_ ( .D(n821), .CK(clk), .RN(n2619), .Q(
        final_result_ieee[29]) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_9_ ( .D(n580), .CK(clk), .RN(n2622), .Q(
        final_result_ieee[9]) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_12_ ( .D(n579), .CK(clk), .RN(n2622), .Q(
        final_result_ieee[12]) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_8_ ( .D(n578), .CK(clk), .RN(n2622), .Q(
        final_result_ieee[8]) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_13_ ( .D(n577), .CK(clk), .RN(n2622), .Q(
        final_result_ieee[13]) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_7_ ( .D(n576), .CK(clk), .RN(n2621), .Q(
        final_result_ieee[7]) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_6_ ( .D(n575), .CK(clk), .RN(n2622), .Q(
        final_result_ieee[6]) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_5_ ( .D(n574), .CK(clk), .RN(n2621), .Q(
        final_result_ieee[5]) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_4_ ( .D(n573), .CK(clk), .RN(n2621), .Q(
        final_result_ieee[4]) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_3_ ( .D(n572), .CK(clk), .RN(n2621), .Q(
        final_result_ieee[3]) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_2_ ( .D(n571), .CK(clk), .RN(n2621), .Q(
        final_result_ieee[2]) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_1_ ( .D(n570), .CK(clk), .RN(n2621), .Q(
        final_result_ieee[1]) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_0_ ( .D(n569), .CK(clk), .RN(n2621), .Q(
        final_result_ieee[0]) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_14_ ( .D(n568), .CK(clk), .RN(n2621), .Q(
        final_result_ieee[14]) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_15_ ( .D(n567), .CK(clk), .RN(n2621), .Q(
        final_result_ieee[15]) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_16_ ( .D(n566), .CK(clk), .RN(n2620), .Q(
        final_result_ieee[16]) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_17_ ( .D(n565), .CK(clk), .RN(n2621), .Q(
        final_result_ieee[17]) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_18_ ( .D(n564), .CK(clk), .RN(n2620), .Q(
        final_result_ieee[18]) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_19_ ( .D(n563), .CK(clk), .RN(n2620), .Q(
        final_result_ieee[19]) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_20_ ( .D(n562), .CK(clk), .RN(n2620), .Q(
        final_result_ieee[20]) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_21_ ( .D(n561), .CK(clk), .RN(n2620), .Q(
        final_result_ieee[21]) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_22_ ( .D(n560), .CK(clk), .RN(n2620), .Q(
        final_result_ieee[22]) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_23_ ( .D(n827), .CK(clk), .RN(n2620), .Q(
        final_result_ieee[23]) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_24_ ( .D(n826), .CK(clk), .RN(n2619), .Q(
        final_result_ieee[24]) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_27_ ( .D(n823), .CK(clk), .RN(n2619), .Q(
        final_result_ieee[27]) );
  DFFRX1TS FRMT_STAGE_DATAOUT_Q_reg_28_ ( .D(n822), .CK(clk), .RN(n2619), .Q(
        final_result_ieee[28]) );
  ADDFHX2TS DP_OP_15J43_122_6956_U6 ( .A(DP_OP_15J43_122_6956_n15), .B(
        DMP_exp_NRM2_EW[3]), .CI(DP_OP_15J43_122_6956_n6), .CO(
        DP_OP_15J43_122_6956_n5), .S(exp_rslt_NRM2_EW1[3]) );
  ADDFHX2TS DP_OP_15J43_122_6956_U5 ( .A(DP_OP_15J43_122_6956_n14), .B(
        DMP_exp_NRM2_EW[4]), .CI(DP_OP_15J43_122_6956_n5), .CO(
        DP_OP_15J43_122_6956_n4), .S(exp_rslt_NRM2_EW1[4]) );
  CMPR32X2TS DP_OP_15J43_122_6956_U7 ( .A(DP_OP_15J43_122_6956_n16), .B(
        DMP_exp_NRM2_EW[2]), .C(DP_OP_15J43_122_6956_n7), .CO(
        DP_OP_15J43_122_6956_n6), .S(exp_rslt_NRM2_EW1[2]) );
  DFFRX2TS SGF_STAGE_DmP_mant_Q_reg_6_ ( .D(n553), .CK(clk), .RN(n2610), .QN(
        n1502) );
  DFFRX2TS SGF_STAGE_DmP_mant_Q_reg_7_ ( .D(n552), .CK(clk), .RN(n1736), .QN(
        n1512) );
  DFFRX2TS SGF_STAGE_DmP_mant_Q_reg_11_ ( .D(n548), .CK(clk), .RN(n2610), .Q(
        n2584), .QN(n1522) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_20_ ( .D(n593), .CK(clk), .RN(n2600), .Q(
        Raw_mant_NRM_SWR[20]), .QN(n2588) );
  DFFRX2TS SGF_STAGE_DmP_mant_Q_reg_3_ ( .D(n556), .CK(clk), .RN(n2610), .QN(
        n1514) );
  DFFRX2TS SGF_STAGE_DmP_mant_Q_reg_12_ ( .D(n547), .CK(clk), .RN(n2610), .QN(
        n1510) );
  DFFRX2TS SGF_STAGE_DMP_Q_reg_22_ ( .D(n718), .CK(clk), .RN(n2609), .Q(
        DMP_SFG[22]), .QN(n2586) );
  DFFRX2TS SGF_STAGE_DMP_Q_reg_20_ ( .D(n724), .CK(clk), .RN(n2609), .Q(
        DMP_SFG[20]), .QN(n2582) );
  DFFRX2TS SHT2_STAGE_SHFTVARS1_Q_reg_2_ ( .D(n836), .CK(clk), .RN(n2600), .Q(
        shift_value_SHT2_EWR[2]), .QN(n2539) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_23_ ( .D(n873), .CK(clk), .RN(n2604), 
        .Q(intDY_EWSW[23]), .QN(n2589) );
  DFFRXLTS Ready_reg_Q_reg_0_ ( .D(Shift_reg_FLAGS_7[0]), .CK(clk), .RN(n1623), 
        .Q(ready) );
  DFFRX2TS inst_FSM_INPUT_ENABLE_state_reg_reg_2_ ( .D(n937), .CK(clk), .RN(
        n2603), .Q(inst_FSM_INPUT_ENABLE_state_reg[2]) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_2_ ( .D(n611), .CK(clk), .RN(n2603), .Q(
        Raw_mant_NRM_SWR[2]) );
  DFFRX2TS SGF_STAGE_DMP_Q_reg_21_ ( .D(n721), .CK(clk), .RN(n2608), .Q(
        DMP_SFG[21]) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_15_ ( .D(n598), .CK(clk), .RN(n2609), .Q(
        Raw_mant_NRM_SWR[15]) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_13_ ( .D(n600), .CK(clk), .RN(n2609), .Q(
        Raw_mant_NRM_SWR[13]) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_11_ ( .D(n602), .CK(clk), .RN(n2607), .Q(
        Raw_mant_NRM_SWR[11]), .QN(n2641) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_3_ ( .D(n610), .CK(clk), .RN(n2601), .Q(
        Raw_mant_NRM_SWR[3]) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_7_ ( .D(n606), .CK(clk), .RN(n2606), .Q(
        Raw_mant_NRM_SWR[7]) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_27_ ( .D(n869), .CK(clk), .RN(n2602), 
        .Q(intDY_EWSW[27]) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_18_ ( .D(n878), .CK(clk), .RN(n2606), 
        .Q(intDY_EWSW[18]) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_14_ ( .D(n882), .CK(clk), .RN(n2604), 
        .Q(intDY_EWSW[14]) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_9_ ( .D(n887), .CK(clk), .RN(n2604), .Q(
        intDY_EWSW[9]) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_3_ ( .D(n893), .CK(clk), .RN(n2605), .Q(
        intDY_EWSW[3]) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_0_ ( .D(n896), .CK(clk), .RN(n2602), .Q(
        intDY_EWSW[0]) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_13_ ( .D(n883), .CK(clk), .RN(n2603), 
        .Q(intDY_EWSW[13]) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_11_ ( .D(n885), .CK(clk), .RN(n2605), 
        .Q(intDY_EWSW[11]) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_2_ ( .D(n894), .CK(clk), .RN(n2606), .Q(
        intDY_EWSW[2]) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_7_ ( .D(n922), .CK(clk), .RN(n2602), .Q(
        intDX_EWSW[7]) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_19_ ( .D(n877), .CK(clk), .RN(n2604), 
        .Q(intDY_EWSW[19]) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_17_ ( .D(n879), .CK(clk), .RN(n2605), 
        .Q(intDY_EWSW[17]) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_15_ ( .D(n881), .CK(clk), .RN(n2605), 
        .Q(intDY_EWSW[15]) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_1_ ( .D(n895), .CK(clk), .RN(n2605), .Q(
        intDY_EWSW[1]) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_22_ ( .D(n874), .CK(clk), .RN(n2602), 
        .Q(intDY_EWSW[22]) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_21_ ( .D(n875), .CK(clk), .RN(n2605), 
        .Q(intDY_EWSW[21]) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_20_ ( .D(n876), .CK(clk), .RN(n2603), 
        .Q(intDY_EWSW[20]) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_6_ ( .D(n890), .CK(clk), .RN(n2602), .Q(
        intDY_EWSW[6]) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_28_ ( .D(n868), .CK(clk), .RN(n2604), 
        .Q(intDY_EWSW[28]) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_16_ ( .D(n880), .CK(clk), .RN(n2603), 
        .Q(intDY_EWSW[16]) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_12_ ( .D(n884), .CK(clk), .RN(n2604), 
        .Q(intDY_EWSW[12]) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_10_ ( .D(n886), .CK(clk), .RN(n2602), 
        .Q(intDY_EWSW[10]) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_5_ ( .D(n891), .CK(clk), .RN(n2602), .Q(
        intDY_EWSW[5]) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_4_ ( .D(n892), .CK(clk), .RN(n2605), .Q(
        intDY_EWSW[4]) );
  DFFRX2TS SHT2_SHIFT_DATA_Q_reg_12_ ( .D(n849), .CK(clk), .RN(n2604), .Q(
        Data_array_SWR[12]) );
  DFFRX2TS SHT2_SHIFT_DATA_Q_reg_19_ ( .D(n856), .CK(clk), .RN(n2603), .Q(
        Data_array_SWR[19]) );
  DFFRX2TS SHT2_SHIFT_DATA_Q_reg_13_ ( .D(n850), .CK(clk), .RN(n2603), .Q(
        Data_array_SWR[13]) );
  DFFRX2TS SHT2_SHIFT_DATA_Q_reg_15_ ( .D(n852), .CK(clk), .RN(n2606), .Q(
        Data_array_SWR[15]) );
  DFFRX2TS SHT2_SHIFT_DATA_Q_reg_14_ ( .D(n851), .CK(clk), .RN(n2604), .Q(
        Data_array_SWR[14]) );
  DFFRX2TS SHT2_SHIFT_DATA_Q_reg_16_ ( .D(n853), .CK(clk), .RN(n2605), .Q(
        Data_array_SWR[16]) );
  DFFRX2TS SHT2_SHIFT_DATA_Q_reg_17_ ( .D(n854), .CK(clk), .RN(n2605), .Q(
        Data_array_SWR[17]) );
  DFFRX2TS SHT2_SHIFT_DATA_Q_reg_18_ ( .D(n855), .CK(clk), .RN(n2603), .Q(
        Data_array_SWR[18]) );
  DFFRX2TS inst_FSM_INPUT_ENABLE_state_reg_reg_1_ ( .D(
        inst_FSM_INPUT_ENABLE_state_next_1_), .CK(clk), .RN(n2606), .Q(
        inst_FSM_INPUT_ENABLE_state_reg[1]), .QN(n2571) );
  DFFRX2TS inst_ShiftRegister_Q_reg_0_ ( .D(n930), .CK(clk), .RN(n2601), .Q(
        Shift_reg_FLAGS_7[0]), .QN(n2596) );
  DFFRX2TS inst_ShiftRegister_Q_reg_4_ ( .D(n934), .CK(clk), .RN(n2606), .Q(
        busy), .QN(n2534) );
  DFFRX2TS inst_ShiftRegister_Q_reg_5_ ( .D(n935), .CK(clk), .RN(n2600), .Q(
        n2590), .QN(n1641) );
  DFFRX2TS SHT2_STAGE_SHFTVARS2_Q_reg_1_ ( .D(n863), .CK(clk), .RN(n2614), .Q(
        left_right_SHT2), .QN(n2574) );
  DFFRX2TS SGF_STAGE_DMP_Q_reg_2_ ( .D(n778), .CK(clk), .RN(n2607), .Q(
        DMP_SFG[2]), .QN(n2552) );
  DFFRX2TS SGF_STAGE_DMP_Q_reg_1_ ( .D(n781), .CK(clk), .RN(n2606), .Q(
        DMP_SFG[1]), .QN(n2553) );
  DFFRX2TS SGF_STAGE_DMP_Q_reg_14_ ( .D(n742), .CK(clk), .RN(n2607), .Q(
        DMP_SFG[14]), .QN(n2570) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_10_ ( .D(n603), .CK(clk), .RN(n2608), .Q(
        Raw_mant_NRM_SWR[10]), .QN(n2569) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_14_ ( .D(n599), .CK(clk), .RN(n1736), .Q(
        Raw_mant_NRM_SWR[14]), .QN(n2568) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_16_ ( .D(n597), .CK(clk), .RN(n2607), .Q(
        Raw_mant_NRM_SWR[16]), .QN(n2566) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_5_ ( .D(n608), .CK(clk), .RN(n2610), .Q(
        Raw_mant_NRM_SWR[5]), .QN(n2579) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_4_ ( .D(n609), .CK(clk), .RN(n2610), .Q(
        Raw_mant_NRM_SWR[4]), .QN(n2535) );
  DFFRX2TS SHT2_SHIFT_DATA_Q_reg_20_ ( .D(n857), .CK(clk), .RN(n2606), .Q(
        Data_array_SWR[20]), .QN(n2581) );
  DFFRX1TS EXP_STAGE_DMP_Q_reg_23_ ( .D(n1186), .CK(clk), .RN(n2627), .QN(
        n1492) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_15_ ( .D(n544), .CK(clk), .RN(n1740), .Q(
        n2593), .QN(n1508) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_24_ ( .D(n861), .CK(clk), .RN(n2604), .Q(
        Data_array_SWR[24]), .QN(n2587) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_3_ ( .D(n775), .CK(clk), .RN(n2607), .Q(
        DMP_SFG[3]), .QN(n2550) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_0_ ( .D(n559), .CK(clk), .RN(n2631), .Q(
        DmP_mant_SFG_SWR[0]), .QN(n2597) );
  DFFRX4TS inst_ShiftRegister_Q_reg_6_ ( .D(n936), .CK(clk), .RN(n2604), .Q(
        n2583), .QN(n2640) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_25_ ( .D(n534), .CK(clk), .RN(n2625), .Q(
        DmP_mant_SFG_SWR[25]) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_27_ ( .D(n902), .CK(clk), .RN(n2617), 
        .QN(n1464) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_3_ ( .D(n926), .CK(clk), .RN(n1739), 
        .QN(n1455) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_9_ ( .D(n920), .CK(clk), .RN(n1737), 
        .QN(n1488) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_19_ ( .D(n910), .CK(clk), .RN(n2618), 
        .QN(n1485) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_13_ ( .D(n916), .CK(clk), .RN(n2617), 
        .QN(n1456) );
  DFFRX2TS SGF_STAGE_DmP_mant_Q_reg_5_ ( .D(n554), .CK(clk), .RN(n2610), .QN(
        n1513) );
  DFFRX2TS SGF_STAGE_DmP_mant_Q_reg_4_ ( .D(n555), .CK(clk), .RN(n2612), .QN(
        n1503) );
  DFFRX2TS SGF_STAGE_DmP_mant_Q_reg_22_ ( .D(n537), .CK(clk), .RN(n2614), .QN(
        n1517) );
  DFFRX2TS SGF_STAGE_DmP_mant_Q_reg_24_ ( .D(n535), .CK(clk), .RN(n2614), .QN(
        n1516) );
  DFFRX2TS SGF_STAGE_DmP_mant_Q_reg_16_ ( .D(n543), .CK(clk), .RN(n1737), .QN(
        n1520) );
  DFFRX2TS SGF_STAGE_DmP_mant_Q_reg_19_ ( .D(n540), .CK(clk), .RN(n2614), .QN(
        n1506) );
  DFFRX2TS SGF_STAGE_DmP_mant_Q_reg_17_ ( .D(n542), .CK(clk), .RN(n1738), .QN(
        n1507) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_14_ ( .D(n915), .CK(clk), .RN(n1736), 
        .QN(n1486) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_15_ ( .D(n914), .CK(clk), .RN(n2610), 
        .QN(n1457) );
  DFFRX2TS SGF_STAGE_DmP_mant_Q_reg_8_ ( .D(n551), .CK(clk), .RN(n2615), .QN(
        n1501) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_8_ ( .D(n605), .CK(clk), .RN(n1737), .Q(
        Raw_mant_NRM_SWR[8]) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_11_ ( .D(n918), .CK(clk), .RN(n2617), 
        .QN(n1489) );
  DFFRX2TS SGF_STAGE_DmP_mant_Q_reg_20_ ( .D(n539), .CK(clk), .RN(n2614), .QN(
        n1518) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_17_ ( .D(n912), .CK(clk), .RN(n2617), 
        .QN(n1490) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_31_ ( .D(n898), .CK(clk), .RN(n1738), 
        .Q(intDX_EWSW[31]) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_29_ ( .D(n900), .CK(clk), .RN(n2618), 
        .QN(n1491) );
  DFFRX2TS SGF_STAGE_DmP_mant_Q_reg_13_ ( .D(n546), .CK(clk), .RN(n2616), .QN(
        n1509) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_22_ ( .D(n907), .CK(clk), .RN(n1740), 
        .QN(n1487) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_18_ ( .D(n911), .CK(clk), .RN(n1738), 
        .QN(n1463) );
  DFFRX2TS SGF_STAGE_DmP_mant_Q_reg_9_ ( .D(n550), .CK(clk), .RN(n2610), .QN(
        n1511) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_20_ ( .D(n909), .CK(clk), .RN(n2615), 
        .QN(n1461) );
  DFFRX1TS inst_FSM_INPUT_ENABLE_state_reg_reg_0_ ( .D(n938), .CK(clk), .RN(
        n1740), .Q(inst_FSM_INPUT_ENABLE_state_reg[0]), .QN(n2540) );
  DFFRX1TS SHT1_STAGE_sft_amount_Q_reg_0_ ( .D(n832), .CK(clk), .RN(n2631), 
        .Q(Shift_amount_SHT1_EWR[0]) );
  DFFRX1TS SHT1_STAGE_sft_amount_Q_reg_1_ ( .D(n831), .CK(clk), .RN(n2631), 
        .Q(Shift_amount_SHT1_EWR[1]) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_25_ ( .D(n904), .CK(clk), .RN(n2617), 
        .QN(n1440) );
  DFFRX1TS inst_ShiftRegister_Q_reg_3_ ( .D(n933), .CK(clk), .RN(n2631), .Q(
        Shift_reg_FLAGS_7[3]) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_12_ ( .D(n917), .CK(clk), .RN(n2613), 
        .QN(n1462) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_26_ ( .D(n903), .CK(clk), .RN(n2613), 
        .QN(n73) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_30_ ( .D(n899), .CK(clk), .RN(n2618), 
        .QN(n1465) );
  DFFRX2TS INPUT_STAGE_OPERANDX_Q_reg_21_ ( .D(n908), .CK(clk), .RN(n2617), 
        .QN(n1458) );
  DFFRX2TS INPUT_STAGE_OPERANDY_Q_reg_30_ ( .D(n866), .CK(clk), .RN(n2611), 
        .Q(intDY_EWSW[30]) );
  DFFRXLTS INPUT_STAGE_OPERANDY_Q_reg_29_ ( .D(n867), .CK(clk), .RN(n1739), 
        .QN(n1592) );
  DFFRX2TS SHT2_STAGE_SHFTVARS1_Q_reg_4_ ( .D(n833), .CK(clk), .RN(n2602), .Q(
        shift_value_SHT2_EWR[4]), .QN(n2642) );
  DFFRX4TS SFT2FRMT_STAGE_FLAGS_Q_reg_2_ ( .D(n620), .CK(clk), .RN(n2600), .Q(
        n2563), .QN(n1451) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_19_ ( .D(n594), .CK(clk), .RN(n2600), .Q(
        Raw_mant_NRM_SWR[19]) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_22_ ( .D(n591), .CK(clk), .RN(n2600), .Q(
        Raw_mant_NRM_SWR[22]) );
  DFFRX2TS NRM_STAGE_Raw_mant_Q_reg_23_ ( .D(n590), .CK(clk), .RN(n2600), .Q(
        Raw_mant_NRM_SWR[23]) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_21_ ( .D(n592), .CK(clk), .RN(n2608), .Q(
        Raw_mant_NRM_SWR[21]), .QN(n2547) );
  DFFRX1TS NRM_STAGE_FLAGS_Q_reg_2_ ( .D(n621), .CK(clk), .RN(n2623), .QN(
        n1480) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_0_ ( .D(n613), .CK(clk), .RN(n2619), .Q(
        n2542), .QN(n1499) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_19_ ( .D(n727), .CK(clk), .RN(n2609), .Q(
        DMP_SFG[19]), .QN(n2599) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_18_ ( .D(n730), .CK(clk), .RN(n2609), .Q(
        DMP_SFG[18]), .QN(n2575) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_17_ ( .D(n733), .CK(clk), .RN(n2608), .Q(
        DMP_SFG[17]), .QN(n2573) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_16_ ( .D(n736), .CK(clk), .RN(n2609), .Q(
        DMP_SFG[16]), .QN(n2533) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_15_ ( .D(n739), .CK(clk), .RN(n2608), .Q(
        DMP_SFG[15]), .QN(n2565) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_13_ ( .D(n745), .CK(clk), .RN(n2609), .Q(
        DMP_SFG[13]), .QN(n2561) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_12_ ( .D(n748), .CK(clk), .RN(n2608), .Q(
        DMP_SFG[12]), .QN(n2559) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_1_ ( .D(n612), .CK(clk), .RN(n2619), .Q(
        n2577), .QN(n1452) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_14_ ( .D(n545), .CK(clk), .RN(n2610), .Q(
        n2592), .QN(n1521) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_10_ ( .D(n549), .CK(clk), .RN(n1740), .Q(
        n2591), .QN(n1500) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_6_ ( .D(n607), .CK(clk), .RN(n2619), .Q(
        Raw_mant_NRM_SWR[6]), .QN(n2537) );
  DFFRX1TS SHT2_STAGE_SHFTVARS1_Q_reg_3_ ( .D(n835), .CK(clk), .RN(n2602), .Q(
        shift_value_SHT2_EWR[3]), .QN(n2572) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_9_ ( .D(n604), .CK(clk), .RN(n1739), .Q(
        Raw_mant_NRM_SWR[9]), .QN(n2541) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_21_ ( .D(n538), .CK(clk), .RN(n2614), .Q(
        n2598), .QN(n1505) );
  DFFRX1TS SGF_STAGE_DmP_mant_Q_reg_23_ ( .D(n536), .CK(clk), .RN(n2614), .Q(
        n2578), .QN(n1504) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_26_ ( .D(n870), .CK(clk), .RN(n2617), 
        .Q(n2555), .QN(n1431) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_25_ ( .D(n871), .CK(clk), .RN(n2617), 
        .Q(n2564), .QN(n1430) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_8_ ( .D(n921), .CK(clk), .RN(n2617), .Q(
        n2554), .QN(n1484) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_25_ ( .D(n862), .CK(clk), .RN(n2617), .Q(
        n2580), .QN(n1496) );
  DFFRX1TS INPUT_STAGE_OPERANDX_Q_reg_24_ ( .D(n905), .CK(clk), .RN(n2618), 
        .Q(n2567), .QN(n1439) );
  DFFRX1TS INPUT_STAGE_OPERANDY_Q_reg_8_ ( .D(n888), .CK(clk), .RN(n2606), .Q(
        intDY_EWSW[8]), .QN(n2536) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_23_ ( .D(n860), .CK(clk), .RN(n2618), .Q(
        n2594), .QN(n1495) );
  DFFRX1TS EXP_STAGE_DmP_Q_reg_24_ ( .D(n630), .CK(clk), .RN(n2619), .Q(n2576), 
        .QN(n1441) );
  DFFRX1TS EXP_STAGE_DMP_Q_reg_24_ ( .D(n795), .CK(clk), .RN(n2618), .Q(n2544), 
        .QN(n1443) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_22_ ( .D(n859), .CK(clk), .RN(n2618), .Q(
        n2595), .QN(n1494) );
  DFFRX1TS SFT2FRMT_STAGE_VARS_Q_reg_8_ ( .D(n586), .CK(clk), .RN(n2622), .Q(
        LZD_output_NRM2_EW[0]) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_9_ ( .D(n757), .CK(clk), .RN(n2608), .Q(
        DMP_SFG[9]), .QN(n2562) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_8_ ( .D(n760), .CK(clk), .RN(n2608), .Q(
        DMP_SFG[8]), .QN(n2557) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_7_ ( .D(n763), .CK(clk), .RN(n2607), .Q(
        DMP_SFG[7]), .QN(n2556) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_6_ ( .D(n766), .CK(clk), .RN(n2607), .Q(
        DMP_SFG[6]), .QN(n2549) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_5_ ( .D(n769), .CK(clk), .RN(n2607), .Q(
        DMP_SFG[5]), .QN(n2551) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_4_ ( .D(n772), .CK(clk), .RN(n2607), .Q(
        DMP_SFG[4]), .QN(n2548) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_11_ ( .D(n751), .CK(clk), .RN(n2608), .Q(
        DMP_SFG[11]), .QN(n2560) );
  DFFRX1TS SGF_STAGE_DMP_Q_reg_10_ ( .D(n754), .CK(clk), .RN(n2608), .Q(
        DMP_SFG[10]), .QN(n2558) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_17_ ( .D(n596), .CK(clk), .RN(n2609), .Q(
        Raw_mant_NRM_SWR[17]), .QN(n2543) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_12_ ( .D(n601), .CK(clk), .RN(n2607), .Q(
        Raw_mant_NRM_SWR[12]), .QN(n2538) );
  DFFRX1TS NRM_STAGE_Raw_mant_Q_reg_18_ ( .D(n595), .CK(clk), .RN(n2614), .Q(
        Raw_mant_NRM_SWR[18]), .QN(n2546) );
  DFFRX4TS SGF_STAGE_DmP_mant_Q_reg_2_ ( .D(n557), .CK(clk), .RN(n2609), .QN(
        n1515) );
  DFFRX2TS SFT2FRMT_STAGE_VARS_Q_reg_9_ ( .D(n584), .CK(clk), .RN(n2635), .Q(
        LZD_output_NRM2_EW[1]) );
  ADDFHX2TS DP_OP_15J43_122_6956_U4 ( .A(n1451), .B(DMP_exp_NRM2_EW[5]), .CI(
        DP_OP_15J43_122_6956_n4), .CO(DP_OP_15J43_122_6956_n3), .S(
        exp_rslt_NRM2_EW1[5]) );
  ADDFHX2TS DP_OP_15J43_122_6956_U9 ( .A(DMP_exp_NRM2_EW[0]), .B(n1451), .CI(
        DP_OP_15J43_122_6956_n18), .CO(DP_OP_15J43_122_6956_n8), .S(
        exp_rslt_NRM2_EW1[0]) );
  ADDFHX2TS DP_OP_15J43_122_6956_U8 ( .A(DP_OP_15J43_122_6956_n17), .B(
        DMP_exp_NRM2_EW[1]), .CI(DP_OP_15J43_122_6956_n8), .CO(
        DP_OP_15J43_122_6956_n7), .S(exp_rslt_NRM2_EW1[1]) );
  DFFRX1TS SHT2_SHIFT_DATA_Q_reg_21_ ( .D(n858), .CK(clk), .RN(n2605), .Q(
        Data_array_SWR[21]), .QN(n2585) );
  DFFRX2TS SGF_STAGE_DMP_Q_reg_0_ ( .D(n784), .CK(clk), .RN(n2606), .Q(
        DMP_SFG[0]), .QN(n2545) );
  CMPR32X2TS DP_OP_15J43_122_6956_U3 ( .A(n1451), .B(DMP_exp_NRM2_EW[6]), .C(
        DP_OP_15J43_122_6956_n3), .CO(DP_OP_15J43_122_6956_n2), .S(
        exp_rslt_NRM2_EW1[6]) );
  CMPR32X2TS DP_OP_15J43_122_6956_U2 ( .A(n1451), .B(DMP_exp_NRM2_EW[7]), .C(
        DP_OP_15J43_122_6956_n2), .CO(DP_OP_15J43_122_6956_n1), .S(
        exp_rslt_NRM2_EW1[7]) );
  NAND2X2TS U3 ( .A(n1602), .B(n1614), .Y(n2154) );
  BUFX3TS U4 ( .A(n2239), .Y(n2253) );
  BUFX3TS U5 ( .A(n2227), .Y(n2200) );
  INVX2TS U6 ( .A(n1583), .Y(n1618) );
  BUFX3TS U7 ( .A(n2227), .Y(n2195) );
  BUFX4TS U8 ( .A(n2411), .Y(n1612) );
  CLKBUFX2TS U9 ( .A(n2590), .Y(n2459) );
  INVX4TS U10 ( .A(n2408), .Y(n1581) );
  NAND2X2TS U11 ( .A(beg_OP), .B(n2452), .Y(n2436) );
  NAND2XLTS U12 ( .A(n1465), .B(intDY_EWSW[30]), .Y(n1797) );
  NAND2X4TS U13 ( .A(n2274), .B(n2273), .Y(n2275) );
  INVX2TS U14 ( .A(n2465), .Y(n2464) );
  AND2X2TS U15 ( .A(Shift_reg_FLAGS_7[3]), .B(n2525), .Y(n2465) );
  BUFX3TS U16 ( .A(n2596), .Y(n2525) );
  OR2X2TS U17 ( .A(n1480), .B(n2352), .Y(n2360) );
  INVX2TS U18 ( .A(n2469), .Y(n2454) );
  OA22X2TS U19 ( .A0(n1766), .A1(n1811), .B0(n1489), .B1(intDY_EWSW[11]), .Y(
        n1779) );
  BUFX3TS U20 ( .A(Shift_reg_FLAGS_7[1]), .Y(n2469) );
  NAND2X1TS U21 ( .A(LZD_output_NRM2_EW[0]), .B(n1451), .Y(
        DP_OP_15J43_122_6956_n18) );
  INVX2TS U22 ( .A(n2077), .Y(n1745) );
  NAND3X4TS U23 ( .A(n1649), .B(n1863), .C(n1648), .Y(n1837) );
  NOR2X1TS U24 ( .A(n2509), .B(n1670), .Y(n1672) );
  AOI211XLTS U25 ( .A0(intDY_EWSW[9]), .A1(n1488), .B0(n1484), .C0(
        intDY_EWSW[8]), .Y(n1773) );
  NOR2XLTS U26 ( .A(n1873), .B(n1871), .Y(n1678) );
  NAND3X2TS U27 ( .A(n1712), .B(n1849), .C(n1711), .Y(n1653) );
  NAND2X4TS U28 ( .A(n1688), .B(n2048), .Y(n2057) );
  AOI21X2TS U29 ( .A0(DMP_SFG[20]), .A1(n1517), .B0(n1665), .Y(n2319) );
  OAI21XLTS U30 ( .A0(n1951), .A1(n2503), .B0(n1950), .Y(n1952) );
  OAI21XLTS U31 ( .A0(n2504), .A1(n2503), .B0(n2502), .Y(n2505) );
  INVX2TS U32 ( .A(n2343), .Y(n2411) );
  INVX2TS U33 ( .A(n1588), .Y(n1594) );
  NAND2X2TS U34 ( .A(n1602), .B(n2424), .Y(n2152) );
  INVX2TS U35 ( .A(n2449), .Y(n2441) );
  OAI211XLTS U36 ( .A0(n2028), .A1(n1598), .B0(n1939), .C0(n2037), .Y(n538) );
  OAI21XLTS U37 ( .A0(n2517), .A1(n1825), .B0(n2518), .Y(n938) );
  OAI21XLTS U38 ( .A0(n1633), .A1(n1599), .B0(n1992), .Y(n542) );
  OAI211XLTS U39 ( .A0(n2018), .A1(n1599), .B0(n1988), .C0(n2037), .Y(n534) );
  OAI21XLTS U40 ( .A0(n1835), .A1(n2325), .B0(n1834), .Y(n600) );
  OAI211XLTS U41 ( .A0(n2032), .A1(n1595), .B0(n2031), .C0(n2041), .Y(n552) );
  OAI21XLTS U42 ( .A0(n2110), .A1(n1584), .B0(n2104), .Y(n580) );
  OAI21XLTS U43 ( .A0(n1459), .A1(n2238), .B0(n2181), .Y(n663) );
  OAI21XLTS U44 ( .A0(n1465), .A1(n2238), .B0(n2188), .Y(n789) );
  OR2X2TS U45 ( .A(n2574), .B(n2528), .Y(n1580) );
  INVX2TS U46 ( .A(n1584), .Y(n1597) );
  OAI211X1TS U47 ( .A0(n2381), .A1(n1581), .B0(n2351), .C0(n2350), .Y(n847) );
  OAI211X1TS U48 ( .A0(n2401), .A1(n2275), .B0(n2400), .C0(n2399), .Y(n856) );
  AOI2BB2X1TS U49 ( .B0(n2396), .B1(n1606), .A0N(n1637), .A1N(n1581), .Y(n2373) );
  OAI211X1TS U50 ( .A0(n2415), .A1(n1581), .B0(n2345), .C0(n2344), .Y(n860) );
  AOI2BB2X1TS U51 ( .B0(n2270), .B1(Data_array_SWR[5]), .A0N(n1581), .A1N(
        n1636), .Y(n2366) );
  AOI2BB2X1TS U52 ( .B0(n2270), .B1(Data_array_SWR[2]), .A0N(n1624), .A1N(
        n1581), .Y(n2372) );
  AO22X1TS U53 ( .A0(n1617), .A1(n1755), .B0(n2454), .B1(LZD_output_NRM2_EW[4]), .Y(n583) );
  OAI21X1TS U54 ( .A0(n2535), .A1(n2114), .B0(n2113), .Y(n1755) );
  OR2X2TS U55 ( .A(n2277), .B(n2276), .Y(n1583) );
  AO22X1TS U56 ( .A0(n1617), .A1(n2456), .B0(n2468), .B1(LZD_output_NRM2_EW[1]), .Y(n584) );
  INVX4TS U57 ( .A(n1580), .Y(n1602) );
  AO21X1TS U58 ( .A0(n2520), .A1(SIGN_FLAG_EXP), .B0(n1821), .Y(n787) );
  AO22X1TS U59 ( .A0(n1617), .A1(n2438), .B0(n2454), .B1(LZD_output_NRM2_EW[3]), .Y(n587) );
  OAI211X1TS U60 ( .A0(n2579), .A1(n2114), .B0(n2223), .C0(n2078), .Y(n2079)
         );
  AOI31X1TS U61 ( .A0(n2080), .A1(n2064), .A2(n2577), .B0(n2075), .Y(n2067) );
  OAI21X1TS U62 ( .A0(n2542), .A1(n2577), .B0(n2080), .Y(n1751) );
  AO22X1TS U63 ( .A0(n2516), .A1(n2515), .B0(final_result_ieee[31]), .B1(n2596), .Y(n614) );
  NOR3X6TS U64 ( .A(Raw_mant_NRM_SWR[4]), .B(Raw_mant_NRM_SWR[5]), .C(n2114), 
        .Y(n2080) );
  NOR2X2TS U65 ( .A(Raw_mant_NRM_SWR[5]), .B(n2114), .Y(n2074) );
  NAND2X6TS U66 ( .A(n2220), .B(n2537), .Y(n2114) );
  NAND2X4TS U67 ( .A(n2516), .B(n2457), .Y(n2528) );
  INVX2TS U68 ( .A(n1748), .Y(n1749) );
  AO22X1TS U69 ( .A0(exp_rslt_NRM2_EW1[7]), .A1(n2516), .B0(
        final_result_ieee[30]), .B1(n2596), .Y(n820) );
  AOI2BB1X1TS U70 ( .A0N(Shift_reg_FLAGS_7[0]), .A1N(overflow_flag), .B0(n2516), .Y(n625) );
  INVX1TS U71 ( .A(n1747), .Y(n1752) );
  NOR3X6TS U72 ( .A(Raw_mant_NRM_SWR[11]), .B(Raw_mant_NRM_SWR[10]), .C(n2212), 
        .Y(n1747) );
  NAND2X4TS U73 ( .A(n2221), .B(n2538), .Y(n2212) );
  INVX3TS U74 ( .A(n2205), .Y(n1746) );
  OAI21X1TS U75 ( .A0(n1824), .A1(n2503), .B0(n1823), .Y(n612) );
  OAI21X1TS U76 ( .A0(n1507), .A1(n2429), .B0(n2037), .Y(n1991) );
  OAI21X1TS U77 ( .A0(n1520), .A1(n2429), .B0(n2037), .Y(n2038) );
  OAI21X1TS U78 ( .A0(n1511), .A1(n2429), .B0(n2041), .Y(n2042) );
  OAI21X1TS U79 ( .A0(n2217), .A1(Raw_mant_NRM_SWR[25]), .B0(n2216), .Y(n2218)
         );
  AO22X1TS U80 ( .A0(n2451), .A1(Data_Y[12]), .B0(n2436), .B1(intDY_EWSW[12]), 
        .Y(n884) );
  AO22X1TS U81 ( .A0(n2447), .A1(Data_Y[2]), .B0(n2449), .B1(intDY_EWSW[2]), 
        .Y(n894) );
  NAND3X1TS U82 ( .A(n2215), .B(Raw_mant_NRM_SWR[16]), .C(n2543), .Y(n2216) );
  AND2X2TS U83 ( .A(n2215), .B(Raw_mant_NRM_SWR[18]), .Y(n2207) );
  OAI211X2TS U84 ( .A0(n1895), .A1(n1494), .B0(n1894), .C0(n1893), .Y(n2108)
         );
  NAND2BX1TS U85 ( .AN(n2306), .B(Raw_mant_NRM_SWR[22]), .Y(n2271) );
  AO22X1TS U86 ( .A0(n2444), .A1(Data_Y[0]), .B0(n2450), .B1(intDY_EWSW[0]), 
        .Y(n896) );
  AO22X1TS U87 ( .A0(n2444), .A1(Data_Y[3]), .B0(n2450), .B1(intDY_EWSW[3]), 
        .Y(n893) );
  AO22X1TS U88 ( .A0(n2447), .A1(Data_Y[13]), .B0(n2434), .B1(intDY_EWSW[13]), 
        .Y(n883) );
  AO22X1TS U89 ( .A0(n2444), .A1(Data_Y[9]), .B0(n2450), .B1(intDY_EWSW[9]), 
        .Y(n887) );
  AO22X1TS U90 ( .A0(n2444), .A1(Data_Y[14]), .B0(n2450), .B1(intDY_EWSW[14]), 
        .Y(n882) );
  AO22X1TS U91 ( .A0(n2447), .A1(Data_Y[11]), .B0(n2436), .B1(intDY_EWSW[11]), 
        .Y(n885) );
  AO22X1TS U92 ( .A0(n2444), .A1(Data_Y[18]), .B0(n2450), .B1(intDY_EWSW[18]), 
        .Y(n878) );
  AO22X1TS U93 ( .A0(n2444), .A1(Data_Y[27]), .B0(n2450), .B1(intDY_EWSW[27]), 
        .Y(n869) );
  NAND2BX1TS U94 ( .AN(n2360), .B(Raw_mant_NRM_SWR[8]), .Y(n2353) );
  INVX3TS U95 ( .A(n2497), .Y(n2333) );
  NAND2BX1TS U96 ( .AN(n2360), .B(Raw_mant_NRM_SWR[18]), .Y(n2300) );
  NAND2BX1TS U97 ( .AN(n2360), .B(Raw_mant_NRM_SWR[14]), .Y(n2361) );
  INVX4TS U98 ( .A(n2464), .Y(n2429) );
  INVX4TS U99 ( .A(n2464), .Y(n2417) );
  AOI2BB2X2TS U100 ( .B0(n1804), .B1(n1758), .A0N(n1483), .A1N(intDY_EWSW[2]), 
        .Y(n1759) );
  NAND2BX1TS U101 ( .AN(n1977), .B(n1495), .Y(n1959) );
  AOI2BB2X1TS U102 ( .B0(n1808), .B1(n1780), .A0N(n1463), .A1N(intDY_EWSW[18]), 
        .Y(n1781) );
  NAND2BX1TS U103 ( .AN(n1977), .B(n1494), .Y(n1926) );
  OAI21X1TS U104 ( .A0(Raw_mant_NRM_SWR[11]), .A1(n2569), .B0(n2538), .Y(n2065) );
  AO22X1TS U105 ( .A0(intDY_EWSW[21]), .A1(n1458), .B0(n1487), .B1(
        intDY_EWSW[22]), .Y(n1757) );
  NOR2X1TS U106 ( .A(inst_FSM_INPUT_ENABLE_state_reg[2]), .B(
        inst_FSM_INPUT_ENABLE_state_reg[1]), .Y(n2416) );
  AOI21X2TS U107 ( .A0(DMP_SFG[22]), .A1(n1516), .B0(n1668), .Y(n1669) );
  NAND2X6TS U108 ( .A(n1667), .B(n1666), .Y(n2337) );
  OAI211X1TS U109 ( .A0(n2415), .A1(n2343), .B0(n2280), .C0(n2279), .Y(n859)
         );
  OAI211X1TS U110 ( .A0(n2316), .A1(n2343), .B0(n2315), .C0(n2314), .Y(n855)
         );
  OAI211X1TS U111 ( .A0(n2375), .A1(n2343), .B0(n2310), .C0(n2309), .Y(n854)
         );
  OAI211X1TS U112 ( .A0(n2381), .A1(n2343), .B0(n2292), .C0(n2291), .Y(n846)
         );
  OAI211X1TS U113 ( .A0(n1637), .A1(n2343), .B0(n2304), .C0(n2303), .Y(n852)
         );
  OAI211X1TS U114 ( .A0(n1624), .A1(n2343), .B0(n2296), .C0(n2295), .Y(n838)
         );
  OAI211X1TS U115 ( .A0(n1636), .A1(n2343), .B0(n2286), .C0(n2285), .Y(n841)
         );
  OAI211X1TS U116 ( .A0(n2390), .A1(n2275), .B0(n2389), .C0(n2388), .Y(n849)
         );
  OAI211X1TS U117 ( .A0(n1637), .A1(n2275), .B0(n2395), .C0(n2394), .Y(n850)
         );
  OAI21X1TS U118 ( .A0(n2348), .A1(n2587), .B0(n2347), .Y(n861) );
  OAI211X1TS U119 ( .A0(n2381), .A1(n2275), .B0(n2370), .C0(n2369), .Y(n844)
         );
  OAI211X1TS U120 ( .A0(n2367), .A1(n2275), .B0(n2366), .C0(n2365), .Y(n842)
         );
  OAI211X1TS U121 ( .A0(n2387), .A1(n2275), .B0(n2364), .C0(n2363), .Y(n848)
         );
  OAI211X1TS U122 ( .A0(n1636), .A1(n2275), .B0(n2372), .C0(n2371), .Y(n839)
         );
  OAI21X1TS U123 ( .A0(n1496), .A1(n2348), .B0(n2226), .Y(n862) );
  AOI22X1TS U124 ( .A0(n2397), .A1(Data_array_SWR[19]), .B0(n1621), .B1(n2396), 
        .Y(n2400) );
  OAI211X1TS U125 ( .A0(n2357), .A1(n2275), .B0(n2356), .C0(n2355), .Y(n843)
         );
  OAI211X1TS U126 ( .A0(n2415), .A1(n2275), .B0(n2392), .C0(n2391), .Y(n857)
         );
  INVX4TS U127 ( .A(n2412), .Y(n1604) );
  AO21XLTS U128 ( .A0(n1727), .A1(n1726), .B0(n1725), .Y(n593) );
  AOI31X1TS U129 ( .A0(Shift_amount_SHT1_EWR[4]), .A1(n2526), .A2(n2472), .B0(
        n2115), .Y(n2116) );
  OAI21X1TS U130 ( .A0(n2089), .A1(n2325), .B0(n2088), .Y(n594) );
  OAI211X1TS U131 ( .A0(n2155), .A1(n2154), .B0(n2153), .C0(n2152), .Y(n573)
         );
  OAI211X1TS U132 ( .A0(n2142), .A1(n2154), .B0(n2141), .C0(n2152), .Y(n574)
         );
  OAI21X1TS U133 ( .A0(n2062), .A1(n2061), .B0(n2060), .Y(n595) );
  OAI211X1TS U134 ( .A0(n2154), .A1(n2127), .B0(n2111), .C0(n2152), .Y(n569)
         );
  OAI211X1TS U135 ( .A0(n2149), .A1(n2154), .B0(n2148), .C0(n2152), .Y(n575)
         );
  OAI211X1TS U136 ( .A0(n2145), .A1(n2154), .B0(n2144), .C0(n2152), .Y(n576)
         );
  OAI211X1TS U137 ( .A0(n2154), .A1(n2133), .B0(n2112), .C0(n2152), .Y(n570)
         );
  OAI21X1TS U138 ( .A0(n2107), .A1(n1584), .B0(n2103), .Y(n578) );
  OAI21X1TS U139 ( .A0(n1482), .A1(n2251), .B0(n2165), .Y(n675) );
  OAI21X1TS U140 ( .A0(n1487), .A1(n2238), .B0(n2191), .Y(n797) );
  OAI21X1TS U141 ( .A0(n1483), .A1(n2174), .B0(n2171), .Y(n673) );
  OAI21X1TS U142 ( .A0(n1462), .A1(n2251), .B0(n2248), .Y(n653) );
  OAI21X1TS U143 ( .A0(n1485), .A1(n2246), .B0(n2179), .Y(n639) );
  OAI21X1TS U144 ( .A0(n1460), .A1(n2251), .B0(n2244), .Y(n677) );
  OAI21X1TS U145 ( .A0(n1461), .A1(n2531), .B0(n2256), .Y(n637) );
  OAI21X1TS U146 ( .A0(n1491), .A1(n2230), .B0(n2199), .Y(n790) );
  OAI21X1TS U147 ( .A0(n1438), .A1(n2236), .B0(n2184), .Y(n803) );
  OAI21X1TS U148 ( .A0(n1457), .A1(n2236), .B0(n2233), .Y(n804) );
  OAI21X1TS U149 ( .A0(n1455), .A1(n2246), .B0(n2175), .Y(n671) );
  OAI21X1TS U150 ( .A0(n1490), .A1(n2236), .B0(n2194), .Y(n802) );
  OAI21X1TS U151 ( .A0(n2437), .A1(n2313), .B0(n2081), .Y(n836) );
  OAI21X1TS U152 ( .A0(n1437), .A1(n2251), .B0(n2243), .Y(n657) );
  OAI21X1TS U153 ( .A0(n1458), .A1(n2238), .B0(n2187), .Y(n798) );
  OAI21X1TS U154 ( .A0(n1486), .A1(n2236), .B0(n2193), .Y(n805) );
  OAI21X1TS U155 ( .A0(n1434), .A1(n2246), .B0(n2241), .Y(n669) );
  OAI21X1TS U156 ( .A0(n1432), .A1(n2238), .B0(n2185), .Y(n791) );
  OAI21X1TS U157 ( .A0(n1456), .A1(n2230), .B0(n2201), .Y(n806) );
  OAI21X1TS U158 ( .A0(n1458), .A1(n2246), .B0(n2178), .Y(n635) );
  OAI21X1TS U159 ( .A0(n2536), .A1(n2246), .B0(n2170), .Y(n811) );
  OAI21X1TS U160 ( .A0(n1461), .A1(n2238), .B0(n2186), .Y(n799) );
  OAI21X1TS U161 ( .A0(n1489), .A1(n2251), .B0(n2168), .Y(n655) );
  OAI21X1TS U162 ( .A0(n1463), .A1(n2251), .B0(n2166), .Y(n641) );
  OAI21X1TS U163 ( .A0(n1459), .A1(n2246), .B0(n2177), .Y(n812) );
  OAI21X1TS U164 ( .A0(n1460), .A1(n2530), .B0(n2197), .Y(n819) );
  OAI21X1TS U165 ( .A0(n1433), .A1(n2246), .B0(n2245), .Y(n667) );
  OAI21X1TS U166 ( .A0(n1477), .A1(n2531), .B0(n2255), .Y(n1187) );
  OAI21X1TS U167 ( .A0(n1482), .A1(n2530), .B0(n2231), .Y(n818) );
  OAI21X1TS U168 ( .A0(n1462), .A1(n2236), .B0(n2192), .Y(n807) );
  OAI21X1TS U169 ( .A0(n1483), .A1(n2530), .B0(n2228), .Y(n817) );
  OAI21X1TS U170 ( .A0(n1488), .A1(n2174), .B0(n2173), .Y(n659) );
  OAI21X1TS U171 ( .A0(n1490), .A1(n2251), .B0(n2250), .Y(n643) );
  OAI21X1TS U172 ( .A0(n1484), .A1(n2246), .B0(n2240), .Y(n661) );
  OAI21X1TS U173 ( .A0(n1488), .A1(n2238), .B0(n2234), .Y(n810) );
  OAI21X1TS U174 ( .A0(n1455), .A1(n2236), .B0(n2235), .Y(n816) );
  OAI21X1TS U175 ( .A0(n1435), .A1(n2246), .B0(n2242), .Y(n665) );
  OAI21X1TS U176 ( .A0(n1456), .A1(n2251), .B0(n2169), .Y(n651) );
  OAI21X1TS U177 ( .A0(n1464), .A1(n2246), .B0(n2176), .Y(n627) );
  OAI21X1TS U178 ( .A0(n1485), .A1(n2236), .B0(n2196), .Y(n800) );
  OAI21X1TS U179 ( .A0(n1489), .A1(n2236), .B0(n2189), .Y(n808) );
  OAI21X1TS U180 ( .A0(n1434), .A1(n2230), .B0(n2229), .Y(n815) );
  OAI21X1TS U181 ( .A0(n1464), .A1(n2238), .B0(n2237), .Y(n792) );
  OAI21X1TS U182 ( .A0(n1438), .A1(n2174), .B0(n2172), .Y(n645) );
  OAI21X1TS U183 ( .A0(n1437), .A1(n2236), .B0(n2183), .Y(n809) );
  OAI21X1TS U184 ( .A0(n1463), .A1(n2236), .B0(n2190), .Y(n801) );
  OAI21X1TS U185 ( .A0(n1487), .A1(n2531), .B0(n2258), .Y(n633) );
  OAI21X1TS U186 ( .A0(n1486), .A1(n2251), .B0(n2167), .Y(n649) );
  OAI21X1TS U187 ( .A0(n1435), .A1(n2238), .B0(n2180), .Y(n813) );
  OAI21X1TS U188 ( .A0(n1457), .A1(n2251), .B0(n2247), .Y(n647) );
  OAI21X1TS U189 ( .A0(n1433), .A1(n2238), .B0(n2182), .Y(n814) );
  INVX4TS U190 ( .A(n2198), .Y(n2236) );
  OAI21X1TS U191 ( .A0(n2110), .A1(n1580), .B0(n2109), .Y(n579) );
  OAI21X1TS U192 ( .A0(n2107), .A1(n1580), .B0(n2106), .Y(n577) );
  OAI21X1TS U193 ( .A0(n2054), .A1(n2325), .B0(n2053), .Y(n596) );
  OAI21X1TS U194 ( .A0(n1908), .A1(n1907), .B0(n1906), .Y(n599) );
  OAI21X1TS U195 ( .A0(n2013), .A1(n2503), .B0(n2012), .Y(n598) );
  NOR2X6TS U196 ( .A(n2520), .B(n2164), .Y(n2239) );
  OR2X2TS U197 ( .A(left_right_SHT2), .B(n2528), .Y(n1584) );
  OAI21X1TS U198 ( .A0(n1860), .A1(n1859), .B0(n1858), .Y(n601) );
  NOR2X1TS U199 ( .A(n2457), .B(n2596), .Y(n2458) );
  NAND2X6TS U200 ( .A(n1687), .B(n2004), .Y(n1705) );
  NOR2X6TS U201 ( .A(Raw_mant_NRM_SWR[7]), .B(n1748), .Y(n2220) );
  OAI21X1TS U202 ( .A0(n2325), .A1(n1920), .B0(n1919), .Y(n604) );
  OAI21X1TS U203 ( .A0(n1848), .A1(n1847), .B0(n1846), .Y(n603) );
  OAI21X1TS U204 ( .A0(n1878), .A1(n1877), .B0(n1876), .Y(n605) );
  OAI21X1TS U205 ( .A0(n2107), .A1(n1599), .B0(n1888), .Y(n544) );
  OAI21X1TS U206 ( .A0(n1974), .A1(n1973), .B0(n1972), .Y(n606) );
  OAI21X1TS U207 ( .A0(n1628), .A1(n2535), .B0(n1954), .Y(n609) );
  INVX1TS U208 ( .A(n2403), .Y(n2390) );
  OAI211X1TS U209 ( .A0(n2020), .A1(n1595), .B0(n2019), .C0(n2041), .Y(n558)
         );
  OAI211X1TS U210 ( .A0(n1629), .A1(n1595), .B0(n2024), .C0(n2041), .Y(n553)
         );
  OAI21X1TS U211 ( .A0(n2002), .A1(n2001), .B0(n2000), .Y(n607) );
  OAI211X1TS U212 ( .A0(n2026), .A1(n1598), .B0(n1942), .C0(n2037), .Y(n539)
         );
  OAI211X1TS U213 ( .A0(n2026), .A1(n1594), .B0(n2025), .C0(n2041), .Y(n554)
         );
  OAI21X1TS U214 ( .A0(n2046), .A1(n1599), .B0(n2040), .Y(n543) );
  OAI211X1TS U215 ( .A0(n1631), .A1(n1599), .B0(n1927), .C0(n2037), .Y(n537)
         );
  OAI211X1TS U216 ( .A0(n2028), .A1(n1594), .B0(n2027), .C0(n2041), .Y(n555)
         );
  OAI211X1TS U217 ( .A0(n2023), .A1(n1595), .B0(n2022), .C0(n2041), .Y(n557)
         );
  NAND2BX1TS U218 ( .AN(n1883), .B(n1882), .Y(n1884) );
  INVX2TS U219 ( .A(n2147), .Y(n1633) );
  INVX2TS U220 ( .A(n2129), .Y(n1631) );
  INVX2TS U221 ( .A(n2151), .Y(n1629) );
  OAI21X2TS U222 ( .A0(n1452), .A1(n2313), .B0(n2278), .Y(n1589) );
  NAND2BX1TS U223 ( .AN(n1891), .B(n1890), .Y(n1892) );
  NAND3X2TS U224 ( .A(n1713), .B(n1842), .C(n1910), .Y(n1684) );
  OAI211X2TS U225 ( .A0(n2642), .A1(n2127), .B0(n1966), .C0(n1965), .Y(n2140)
         );
  OAI21X2TS U226 ( .A0(n2537), .A1(n2360), .B0(n2284), .Y(n1585) );
  INVX2TS U227 ( .A(n1886), .Y(n1599) );
  OAI211X1TS U228 ( .A0(n2155), .A1(n1614), .B0(n1925), .C0(n1924), .Y(n2129)
         );
  OAI211X1TS U229 ( .A0(n1614), .A1(n2120), .B0(n1990), .C0(n1989), .Y(n2147)
         );
  OAI211X2TS U230 ( .A0(n2139), .A1(n1614), .B0(n1937), .C0(n1936), .Y(n2134)
         );
  INVX1TS U231 ( .A(n1886), .Y(n1598) );
  OAI211X1TS U232 ( .A0(n1614), .A1(n2133), .B0(n1963), .C0(n1962), .Y(n2151)
         );
  OAI211X2TS U233 ( .A0(n2136), .A1(n2642), .B0(n1941), .C0(n1940), .Y(n2137)
         );
  AO22X1TS U234 ( .A0(n2434), .A1(intDX_EWSW[31]), .B0(n2448), .B1(Data_X[31]), 
        .Y(n898) );
  AO22X1TS U235 ( .A0(n2451), .A1(Data_Y[31]), .B0(n2449), .B1(intDY_EWSW[31]), 
        .Y(n865) );
  AO22X1TS U236 ( .A0(n2451), .A1(Data_Y[30]), .B0(n2449), .B1(intDY_EWSW[30]), 
        .Y(n866) );
  AO22X1TS U237 ( .A0(n2451), .A1(Data_Y[29]), .B0(n2434), .B1(n1622), .Y(n867) );
  AO22X1TS U238 ( .A0(n2444), .A1(Data_Y[19]), .B0(n2435), .B1(intDY_EWSW[19]), 
        .Y(n877) );
  AO22X1TS U239 ( .A0(n2444), .A1(Data_Y[17]), .B0(n2435), .B1(intDY_EWSW[17]), 
        .Y(n879) );
  AO22X1TS U240 ( .A0(n2444), .A1(Data_Y[15]), .B0(n2435), .B1(intDY_EWSW[15]), 
        .Y(n881) );
  AO22X1TS U241 ( .A0(n2444), .A1(Data_Y[1]), .B0(n2435), .B1(intDY_EWSW[1]), 
        .Y(n895) );
  AO22X1TS U242 ( .A0(n2448), .A1(Data_Y[22]), .B0(n2434), .B1(intDY_EWSW[22]), 
        .Y(n874) );
  AO22X1TS U243 ( .A0(n2448), .A1(Data_Y[21]), .B0(n2449), .B1(intDY_EWSW[21]), 
        .Y(n875) );
  AO22X1TS U244 ( .A0(n2448), .A1(Data_Y[20]), .B0(n2435), .B1(intDY_EWSW[20]), 
        .Y(n876) );
  AO22X1TS U245 ( .A0(n2451), .A1(Data_Y[5]), .B0(n2450), .B1(intDY_EWSW[5]), 
        .Y(n891) );
  AO22X1TS U246 ( .A0(n2451), .A1(Data_Y[10]), .B0(n2449), .B1(intDY_EWSW[10]), 
        .Y(n886) );
  AO22X1TS U247 ( .A0(n2448), .A1(Data_Y[6]), .B0(n2449), .B1(intDY_EWSW[6]), 
        .Y(n890) );
  AO22X1TS U248 ( .A0(n2451), .A1(Data_Y[28]), .B0(n2450), .B1(intDY_EWSW[28]), 
        .Y(n868) );
  AO22X1TS U249 ( .A0(n2451), .A1(Data_Y[4]), .B0(n2450), .B1(intDY_EWSW[4]), 
        .Y(n892) );
  AO22X1TS U250 ( .A0(n2451), .A1(Data_Y[16]), .B0(n2449), .B1(intDY_EWSW[16]), 
        .Y(n880) );
  INVX2TS U251 ( .A(n1588), .Y(n1595) );
  OAI211X1TS U252 ( .A0(n1949), .A1(n2499), .B0(n1947), .C0(n1948), .Y(n1953)
         );
  OAI211X1TS U253 ( .A0(n2499), .A1(n2509), .B0(n2498), .C0(n2500), .Y(n2506)
         );
  AO22X1TS U254 ( .A0(n2447), .A1(Data_X[7]), .B0(n2450), .B1(intDX_EWSW[7]), 
        .Y(n922) );
  OAI211X2TS U255 ( .A0(n1895), .A1(n1495), .B0(n1885), .C0(n1893), .Y(n2105)
         );
  AND2X2TS U256 ( .A(n2429), .B(left_right_SHT2), .Y(n1886) );
  NAND2BX1TS U257 ( .AN(n2360), .B(Raw_mant_NRM_SWR[19]), .Y(n2307) );
  OAI211X2TS U258 ( .A0(n2313), .A1(n1499), .B0(n1617), .C0(n2225), .Y(n2346)
         );
  NAND4X1TS U259 ( .A(n1731), .B(n1674), .C(n1730), .D(n1866), .Y(n1681) );
  BUFX4TS U260 ( .A(n2436), .Y(n2434) );
  INVX2TS U261 ( .A(n1704), .Y(n2497) );
  CLKBUFX3TS U262 ( .A(n1923), .Y(n1593) );
  CLKBUFX3TS U263 ( .A(n1879), .Y(n1635) );
  INVX3TS U264 ( .A(n1591), .Y(n1608) );
  AO22XLTS U265 ( .A0(DMP_SHT1_EWSW[10]), .A1(n2472), .B0(DMP_SHT2_EWSW[10]), 
        .B1(n2521), .Y(n755) );
  AO22XLTS U266 ( .A0(DMP_SHT1_EWSW[11]), .A1(n2472), .B0(DMP_SHT2_EWSW[11]), 
        .B1(n2521), .Y(n752) );
  AO22XLTS U267 ( .A0(DMP_SHT1_EWSW[13]), .A1(n2472), .B0(DMP_SHT2_EWSW[13]), 
        .B1(n2521), .Y(n746) );
  AO22XLTS U268 ( .A0(DMP_SHT1_EWSW[12]), .A1(n2472), .B0(DMP_SHT2_EWSW[12]), 
        .B1(n2521), .Y(n749) );
  INVX4TS U269 ( .A(n1695), .Y(n2313) );
  AO22X1TS U270 ( .A0(n1491), .A1(n1622), .B0(n1465), .B1(intDY_EWSW[30]), .Y(
        n1805) );
  CLKAND2X2TS U271 ( .A(n1701), .B(n1699), .Y(n1657) );
  NAND2BX1TS U272 ( .AN(n2056), .B(n2055), .Y(n2061) );
  NAND2BX1TS U273 ( .AN(n2260), .B(n2259), .Y(n2263) );
  NAND2BX1TS U274 ( .AN(n2318), .B(n2317), .Y(n2320) );
  NOR2X2TS U275 ( .A(shift_value_SHT2_EWR[4]), .B(n1977), .Y(n1881) );
  OR2X2TS U276 ( .A(shift_value_SHT2_EWR[4]), .B(n1976), .Y(n1591) );
  NAND2BX1TS U277 ( .AN(n2331), .B(n2330), .Y(n2338) );
  NAND3X1TS U278 ( .A(n1776), .B(n1775), .C(n1774), .Y(n1812) );
  INVX3TS U279 ( .A(n2583), .Y(n2232) );
  NOR2X1TS U280 ( .A(LZD_output_NRM2_EW[2]), .B(n2563), .Y(
        DP_OP_15J43_122_6956_n16) );
  INVX3TS U281 ( .A(n2583), .Y(n2249) );
  INVX3TS U282 ( .A(n2583), .Y(n2254) );
  CLKAND2X2TS U283 ( .A(n1518), .B(DMP_SFG[18]), .Y(n1662) );
  NOR2X4TS U284 ( .A(Raw_mant_NRM_SWR[23]), .B(Raw_mant_NRM_SWR[22]), .Y(n2202) );
  NAND3X1TS U285 ( .A(inst_FSM_INPUT_ENABLE_state_reg[2]), .B(n2571), .C(n2540), .Y(n2518) );
  NOR2X1TS U286 ( .A(Raw_mant_NRM_SWR[11]), .B(Raw_mant_NRM_SWR[10]), .Y(n2213) );
  AOI222X2TS U287 ( .A0(intDY_EWSW[3]), .A1(n1455), .B0(intDY_EWSW[3]), .B1(
        n1759), .C0(n1455), .C1(n1759), .Y(n1762) );
  OAI22X1TS U288 ( .A0(intDY_EWSW[0]), .A1(n1460), .B0(intDY_EWSW[1]), .B1(
        n1482), .Y(n1758) );
  NAND2X4TS U289 ( .A(n2277), .B(n2274), .Y(n2343) );
  NOR2X4TS U290 ( .A(n2270), .B(n2269), .Y(n2274) );
  OAI2BB1X4TS U291 ( .A0N(DMP_SFG[16]), .A1N(n1519), .B0(n1660), .Y(n2084) );
  AO22X4TS U292 ( .A0(n2337), .A1(n2336), .B0(n2335), .B1(n2334), .Y(n2339) );
  NOR2X2TS U293 ( .A(n2508), .B(n1642), .Y(n1943) );
  NAND2BX1TS U294 ( .AN(DmP_mant_SFG_SWR[0]), .B(n1469), .Y(n2508) );
  NOR2X2TS U295 ( .A(n1663), .B(n1662), .Y(n2158) );
  OAI211X1TS U296 ( .A0(n2139), .A1(n2154), .B0(n2138), .C0(n2152), .Y(n572)
         );
  OA21X4TS U297 ( .A0(n2057), .A1(n2056), .B0(n2055), .Y(n2086) );
  OA21X4TS U298 ( .A0(n1705), .A1(n1698), .B0(n1696), .Y(n2051) );
  OR2X2TS U299 ( .A(n1515), .B(n2545), .Y(n2509) );
  OAI21X4TS U300 ( .A0(n2334), .A1(n2331), .B0(n2330), .Y(n2430) );
  OAI21X4TS U301 ( .A0(n2321), .A1(n2318), .B0(n2317), .Y(n2334) );
  OAI211X1TS U302 ( .A0(n2136), .A1(n2154), .B0(n2135), .C0(n2152), .Y(n571)
         );
  OR2X1TS U303 ( .A(n1503), .B(DMP_SFG[2]), .Y(n1643) );
  OR2X1TS U304 ( .A(n1508), .B(DMP_SFG[13]), .Y(n1702) );
  CLKAND2X2TS U305 ( .A(n2221), .B(n2065), .Y(n2072) );
  OR2X1TS U306 ( .A(intDX_EWSW[7]), .B(n1459), .Y(n1814) );
  OAI22X1TS U307 ( .A0(n1785), .A1(n1806), .B0(intDY_EWSW[23]), .B1(n1477), 
        .Y(n1786) );
  OR2X1TS U308 ( .A(n1522), .B(n2562), .Y(n1829) );
  OR2X1TS U309 ( .A(n1522), .B(DMP_SFG[9]), .Y(n1850) );
  OR2X1TS U310 ( .A(n1502), .B(DMP_SFG[4]), .Y(n1646) );
  NAND2X1TS U311 ( .A(n1502), .B(DMP_SFG[4]), .Y(n1861) );
  OR2X1TS U312 ( .A(n1500), .B(DMP_SFG[8]), .Y(n1650) );
  OR2X1TS U313 ( .A(n1508), .B(n2561), .Y(n2004) );
  AOI2BB1XLTS U314 ( .A0N(n2214), .A1N(Raw_mant_NRM_SWR[23]), .B0(
        Raw_mant_NRM_SWR[24]), .Y(n2217) );
  OR2X1TS U315 ( .A(n1513), .B(DMP_SFG[3]), .Y(n1994) );
  AOI31XLTS U316 ( .A0(n2543), .A1(n2566), .A2(Raw_mant_NRM_SWR[15]), .B0(
        Raw_mant_NRM_SWR[19]), .Y(n2203) );
  OA21X1TS U317 ( .A0(n1969), .A1(n1873), .B0(n1872), .Y(n1915) );
  OR2X1TS U318 ( .A(n1981), .B(n1930), .Y(n2015) );
  NAND2BXLTS U319 ( .AN(n1929), .B(n1928), .Y(n1930) );
  NAND2BXLTS U320 ( .AN(n1977), .B(Data_array_SWR[17]), .Y(n1928) );
  OR2X1TS U321 ( .A(n1981), .B(n1980), .Y(n2044) );
  NAND2BXLTS U322 ( .AN(n1979), .B(n1978), .Y(n1980) );
  NAND2BXLTS U323 ( .AN(n1977), .B(Data_array_SWR[16]), .Y(n1978) );
  CLKAND2X2TS U324 ( .A(n1903), .B(n1902), .Y(n2007) );
  CLKAND2X2TS U325 ( .A(n1830), .B(n1829), .Y(n1855) );
  OR2X1TS U326 ( .A(n1510), .B(n2558), .Y(n1854) );
  CLKAND2X2TS U327 ( .A(n1713), .B(n1910), .Y(n1843) );
  OR2X1TS U328 ( .A(n1500), .B(n2557), .Y(n1842) );
  CLKAND2X2TS U329 ( .A(n2308), .B(n2307), .Y(n2316) );
  CLKAND2X2TS U330 ( .A(n2301), .B(n2300), .Y(n2375) );
  AO21XLTS U331 ( .A0(Raw_mant_NRM_SWR[9]), .A1(n1695), .B0(n2297), .Y(n1586)
         );
  CLKAND2X2TS U332 ( .A(n2272), .B(n2271), .Y(n2401) );
  CLKAND2X2TS U333 ( .A(n1862), .B(n1861), .Y(n1970) );
  OA21X1TS U334 ( .A0(n1869), .A1(n1868), .B0(n1867), .Y(n1997) );
  CLKBUFX2TS U335 ( .A(n2332), .Y(n2431) );
  CLKAND2X2TS U336 ( .A(n1506), .B(DMP_SFG[17]), .Y(n1661) );
  INVX2TS U337 ( .A(n1584), .Y(n1596) );
  OAI21XLTS U338 ( .A0(n1494), .A1(n1922), .B0(n1880), .Y(n1883) );
  INVX2TS U339 ( .A(n1580), .Y(n1603) );
  NAND2BXLTS U340 ( .AN(n1977), .B(n2587), .Y(n1933) );
  CLKAND2X2TS U341 ( .A(n2354), .B(n2353), .Y(n2367) );
  CLKAND2X2TS U342 ( .A(n2362), .B(n2361), .Y(n2387) );
  AO21XLTS U343 ( .A0(Raw_mant_NRM_SWR[23]), .A1(n1695), .B0(n2293), .Y(n1590)
         );
  AO22XLTS U344 ( .A0(n1600), .A1(Raw_mant_NRM_SWR[2]), .B0(
        DmP_mant_SHT1_SW[0]), .B1(n2526), .Y(n2293) );
  AO21XLTS U345 ( .A0(Raw_mant_NRM_SWR[20]), .A1(n1695), .B0(n2281), .Y(n1587)
         );
  INVX2TS U346 ( .A(n1604), .Y(n1606) );
  AO22XLTS U347 ( .A0(n1601), .A1(Raw_mant_NRM_SWR[10]), .B0(
        DmP_mant_SHT1_SW[8]), .B1(n2526), .Y(n2287) );
  OAI211XLTS U348 ( .A0(n1753), .A1(n1752), .B0(n2211), .C0(n1751), .Y(n1754)
         );
  NOR2XLTS U349 ( .A(Raw_mant_NRM_SWR[3]), .B(Raw_mant_NRM_SWR[2]), .Y(n2064)
         );
  OR2X1TS U350 ( .A(n1504), .B(DMP_SFG[21]), .Y(n1666) );
  AO22X1TS U351 ( .A0(n2262), .A1(n2497), .B0(n2335), .B1(n2261), .Y(n2264) );
  INVX2TS U352 ( .A(n2431), .Y(n2322) );
  INVX4TS U353 ( .A(n2252), .Y(n2531) );
  NAND4XLTS U354 ( .A(n1816), .B(n1815), .C(n1814), .D(n1813), .Y(n1817) );
  NAND4BXLTS U355 ( .AN(n1805), .B(n1804), .C(n1803), .D(n1802), .Y(n1818) );
  AOI211X1TS U356 ( .A0(n1491), .A1(n1622), .B0(n1432), .C0(intDY_EWSW[28]), 
        .Y(n1798) );
  OAI211XLTS U357 ( .A0(n2018), .A1(n1595), .B0(n2017), .C0(n2041), .Y(n559)
         );
  OAI21XLTS U358 ( .A0(n1773), .A1(n1772), .B0(n1771), .Y(n1777) );
  CLKAND2X2TS U359 ( .A(intDY_EWSW[19]), .B(n1485), .Y(n1782) );
  NOR2X1TS U360 ( .A(n1675), .B(n1867), .Y(n1679) );
  OR2X1TS U361 ( .A(n1512), .B(DMP_SFG[5]), .Y(n1863) );
  NAND3X2TS U362 ( .A(n1653), .B(n1850), .C(n1652), .Y(n1827) );
  OR2X1TS U363 ( .A(n1510), .B(DMP_SFG[10]), .Y(n1652) );
  OR2X1TS U364 ( .A(n1505), .B(n2599), .Y(n2157) );
  CLKAND2X2TS U365 ( .A(intDY_EWSW[6]), .B(n1435), .Y(n1807) );
  AOI31X1TS U366 ( .A0(n2224), .A1(n2223), .A2(n2222), .B0(n2526), .Y(n2453)
         );
  NAND4XLTS U367 ( .A(Raw_mant_NRM_SWR[8]), .B(n2221), .C(n2641), .D(n2541), 
        .Y(n2222) );
  AO22XLTS U368 ( .A0(n2299), .A1(Raw_mant_NRM_SWR[2]), .B0(
        DmP_mant_SHT1_SW[21]), .B1(n2526), .Y(n2268) );
  OAI21XLTS U369 ( .A0(n1915), .A1(n1914), .B0(n1913), .Y(n1917) );
  OA21X2TS U370 ( .A0(n1722), .A1(n1720), .B0(n1721), .Y(n2160) );
  AND4X1TS U371 ( .A(exp_rslt_NRM2_EW1[7]), .B(exp_rslt_NRM2_EW1[1]), .C(n2100), .D(n2099), .Y(n2101) );
  AND4X1TS U372 ( .A(exp_rslt_NRM2_EW1[0]), .B(exp_rslt_NRM2_EW1[6]), .C(
        exp_rslt_NRM2_EW1[5]), .D(exp_rslt_NRM2_EW1[2]), .Y(n2099) );
  OAI211X1TS U373 ( .A0(n2213), .A1(n2212), .B0(n2211), .C0(n2210), .Y(n2456)
         );
  INVX2TS U374 ( .A(n1604), .Y(n1605) );
  AOI2BB1X2TS U375 ( .A0N(DMP_SFG[20]), .A1N(n1517), .B0(n2262), .Y(n1665) );
  INVX2TS U376 ( .A(rst), .Y(n1822) );
  OAI21XLTS U377 ( .A0(n2469), .A1(n1451), .B0(n2360), .Y(n620) );
  OAI21XLTS U378 ( .A0(n2348), .A1(n1614), .B0(n2116), .Y(n833) );
  AO22XLTS U379 ( .A0(n2522), .A1(Shift_amount_SHT1_EWR[1]), .B0(n2493), .B1(
        n2492), .Y(n831) );
  XOR2XLTS U380 ( .A(n2491), .B(n2490), .Y(n2492) );
  AO22XLTS U381 ( .A0(n2522), .A1(Shift_amount_SHT1_EWR[0]), .B0(n2496), .B1(
        n2495), .Y(n832) );
  OAI21XLTS U382 ( .A0(DmP_EXP_EWSW[23]), .A1(n1492), .B0(n2494), .Y(n2495) );
  AOI2BB2XLTS U383 ( .B0(beg_OP), .B1(n2571), .A0N(n2571), .A1N(
        inst_FSM_INPUT_ENABLE_state_reg[2]), .Y(n1825) );
  OAI21XLTS U384 ( .A0(n2046), .A1(n1595), .B0(n2045), .Y(n550) );
  OAI21XLTS U385 ( .A0(n1633), .A1(n1595), .B0(n2016), .Y(n551) );
  OAI211XLTS U386 ( .A0(n1629), .A1(n1599), .B0(n1964), .C0(n2037), .Y(n540)
         );
  OAI211XLTS U387 ( .A0(n2020), .A1(n1599), .B0(n1934), .C0(n2037), .Y(n535)
         );
  MX2X1TS U388 ( .A(DMP_SFG[3]), .B(DMP_SHT2_EWSW[3]), .S0(n2417), .Y(n775) );
  AOI2BB2XLTS U389 ( .B0(n2058), .B1(n2336), .A0N(n2057), .A1N(n2499), .Y(
        n2062) );
  AO21XLTS U390 ( .A0(n1735), .A1(n1734), .B0(n1733), .Y(n608) );
  AO21XLTS U391 ( .A0(n1710), .A1(n1709), .B0(n1708), .Y(n597) );
  MX2X1TS U392 ( .A(DMP_SFG[10]), .B(DMP_SHT2_EWSW[10]), .S0(n2428), .Y(n754)
         );
  MX2X1TS U393 ( .A(DMP_SFG[11]), .B(DMP_SHT2_EWSW[11]), .S0(n2428), .Y(n751)
         );
  MX2X1TS U394 ( .A(DMP_SFG[14]), .B(DMP_SHT2_EWSW[14]), .S0(n2428), .Y(n742)
         );
  MX2X1TS U395 ( .A(DMP_SFG[0]), .B(DMP_SHT2_EWSW[0]), .S0(n2417), .Y(n784) );
  MX2X1TS U396 ( .A(DMP_SFG[1]), .B(DMP_SHT2_EWSW[1]), .S0(n2417), .Y(n781) );
  MX2X1TS U397 ( .A(DMP_SFG[2]), .B(DMP_SHT2_EWSW[2]), .S0(n2417), .Y(n778) );
  MX2X1TS U398 ( .A(DMP_SFG[4]), .B(DMP_SHT2_EWSW[4]), .S0(n2417), .Y(n772) );
  MX2X1TS U399 ( .A(DMP_SFG[5]), .B(DMP_SHT2_EWSW[5]), .S0(n2417), .Y(n769) );
  MX2X1TS U400 ( .A(DMP_SFG[6]), .B(DMP_SHT2_EWSW[6]), .S0(n2417), .Y(n766) );
  MX2X1TS U401 ( .A(DMP_SFG[7]), .B(DMP_SHT2_EWSW[7]), .S0(n2417), .Y(n763) );
  MX2X1TS U402 ( .A(DMP_SFG[8]), .B(DMP_SHT2_EWSW[8]), .S0(n2417), .Y(n760) );
  MX2X1TS U403 ( .A(DMP_SFG[9]), .B(DMP_SHT2_EWSW[9]), .S0(n2417), .Y(n757) );
  OAI21XLTS U404 ( .A0(n2348), .A1(n2574), .B0(n2313), .Y(n863) );
  AOI2BB2XLTS U405 ( .B0(n1970), .B1(n2336), .A0N(n2499), .A1N(n1969), .Y(
        n1974) );
  AO21XLTS U406 ( .A0(n1719), .A1(n1718), .B0(n1717), .Y(n602) );
  AO21XLTS U407 ( .A0(LZD_output_NRM2_EW[0]), .A1(n2454), .B0(n2453), .Y(n586)
         );
  MX2X1TS U408 ( .A(DMP_SFG[21]), .B(DMP_SHT2_EWSW[21]), .S0(n2428), .Y(n721)
         );
  OAI21XLTS U409 ( .A0(n2348), .A1(n2572), .B0(n2070), .Y(n835) );
  AOI2BB2XLTS U410 ( .B0(n1998), .B1(n2336), .A0N(n1997), .A1N(n2332), .Y(
        n2002) );
  OAI21XLTS U411 ( .A0(n2107), .A1(n1595), .B0(n1887), .Y(n549) );
  OAI21XLTS U412 ( .A0(n2110), .A1(n1599), .B0(n1897), .Y(n545) );
  MX2X1TS U413 ( .A(DMP_SFG[12]), .B(DMP_SHT2_EWSW[12]), .S0(n2428), .Y(n748)
         );
  MX2X1TS U414 ( .A(DMP_SFG[13]), .B(DMP_SHT2_EWSW[13]), .S0(n2428), .Y(n745)
         );
  MX2X1TS U415 ( .A(DMP_SFG[15]), .B(DMP_SHT2_EWSW[15]), .S0(n2428), .Y(n739)
         );
  MX2X1TS U416 ( .A(DMP_SFG[16]), .B(DMP_SHT2_EWSW[16]), .S0(n2428), .Y(n736)
         );
  MX2X1TS U417 ( .A(DMP_SFG[17]), .B(DMP_SHT2_EWSW[17]), .S0(n2428), .Y(n733)
         );
  MX2X1TS U418 ( .A(DMP_SFG[18]), .B(DMP_SHT2_EWSW[18]), .S0(n2429), .Y(n730)
         );
  MX2X1TS U419 ( .A(DMP_SFG[19]), .B(DMP_SHT2_EWSW[19]), .S0(n2429), .Y(n727)
         );
  MX2X1TS U420 ( .A(DMP_SFG[20]), .B(DMP_SHT2_EWSW[20]), .S0(n2429), .Y(n724)
         );
  MX2X1TS U421 ( .A(DMP_SFG[22]), .B(DMP_SHT2_EWSW[22]), .S0(n2429), .Y(n718)
         );
  OAI21XLTS U422 ( .A0(n2110), .A1(n1595), .B0(n1896), .Y(n548) );
  NAND2BXLTS U423 ( .AN(SIGN_FLAG_SHT1SHT2), .B(n2457), .Y(n2515) );
  AO21XLTS U424 ( .A0(underflow_flag), .A1(n2596), .B0(n2458), .Y(n626) );
  MX2X1TS U425 ( .A(n1628), .B(Shift_reg_FLAGS_7[3]), .S0(n2527), .Y(n932) );
  AO22XLTS U426 ( .A0(n1617), .A1(DMP_exp_NRM_EW[2]), .B0(n2454), .B1(
        DMP_exp_NRM2_EW[2]), .Y(n703) );
  AO22XLTS U427 ( .A0(n1617), .A1(DMP_exp_NRM_EW[3]), .B0(n2468), .B1(
        DMP_exp_NRM2_EW[3]), .Y(n698) );
  AO22XLTS U428 ( .A0(n2469), .A1(DMP_exp_NRM_EW[5]), .B0(n2454), .B1(
        DMP_exp_NRM2_EW[5]), .Y(n688) );
  AO22XLTS U429 ( .A0(n2469), .A1(DMP_exp_NRM_EW[6]), .B0(n2468), .B1(
        DMP_exp_NRM2_EW[6]), .Y(n683) );
  AO22XLTS U430 ( .A0(n1617), .A1(DMP_exp_NRM_EW[7]), .B0(n2468), .B1(
        DMP_exp_NRM2_EW[7]), .Y(n678) );
  MX2X1TS U431 ( .A(OP_FLAG_SFG), .B(OP_FLAG_SHT2), .S0(n2428), .Y(n622) );
  AO22XLTS U432 ( .A0(n2469), .A1(DMP_exp_NRM_EW[1]), .B0(n2468), .B1(
        DMP_exp_NRM2_EW[1]), .Y(n708) );
  AO22XLTS U433 ( .A0(n1617), .A1(DMP_exp_NRM_EW[4]), .B0(n2468), .B1(
        DMP_exp_NRM2_EW[4]), .Y(n693) );
  OAI21XLTS U434 ( .A0(n1493), .A1(n2348), .B0(n2306), .Y(n864) );
  AOI2BB2XLTS U435 ( .B0(n1617), .B1(n2437), .A0N(LZD_output_NRM2_EW[2]), 
        .A1N(n1617), .Y(n585) );
  OAI2BB1X1TS U436 ( .A0N(n2267), .A1N(n2266), .B0(n2265), .Y(n591) );
  AO22XLTS U437 ( .A0(n2469), .A1(SIGN_FLAG_NRM), .B0(n2468), .B1(
        SIGN_FLAG_SHT1SHT2), .Y(n615) );
  AO22XLTS U438 ( .A0(n1627), .A1(SIGN_FLAG_SFG), .B0(n2523), .B1(
        SIGN_FLAG_NRM), .Y(n616) );
  AO22XLTS U439 ( .A0(n2471), .A1(SIGN_FLAG_SHT2), .B0(n2470), .B1(
        SIGN_FLAG_SFG), .Y(n617) );
  AO22XLTS U440 ( .A0(n2521), .A1(SIGN_FLAG_SHT2), .B0(n2466), .B1(
        SIGN_FLAG_SHT1), .Y(n618) );
  AO22XLTS U441 ( .A0(n2522), .A1(SIGN_FLAG_SHT1), .B0(n2476), .B1(
        SIGN_FLAG_EXP), .Y(n619) );
  AO22XLTS U442 ( .A0(n2467), .A1(OP_FLAG_SHT2), .B0(n2466), .B1(OP_FLAG_SHT1), 
        .Y(n623) );
  AO22XLTS U443 ( .A0(n2462), .A1(OP_FLAG_SHT1), .B0(n2459), .B1(OP_FLAG_EXP), 
        .Y(n624) );
  AO22XLTS U444 ( .A0(n1641), .A1(DmP_mant_SHT1_SW[22]), .B0(n2476), .B1(
        DmP_EXP_EWSW[22]), .Y(n632) );
  AO22XLTS U445 ( .A0(n2460), .A1(DmP_mant_SHT1_SW[21]), .B0(n2493), .B1(
        DmP_EXP_EWSW[21]), .Y(n634) );
  AO22XLTS U446 ( .A0(n1641), .A1(DmP_mant_SHT1_SW[20]), .B0(n2476), .B1(
        DmP_EXP_EWSW[20]), .Y(n636) );
  AO22XLTS U447 ( .A0(n2460), .A1(DmP_mant_SHT1_SW[19]), .B0(n2476), .B1(
        DmP_EXP_EWSW[19]), .Y(n638) );
  AO22XLTS U448 ( .A0(n2460), .A1(DmP_mant_SHT1_SW[18]), .B0(n2459), .B1(
        DmP_EXP_EWSW[18]), .Y(n640) );
  AO22XLTS U449 ( .A0(n2460), .A1(DmP_mant_SHT1_SW[17]), .B0(n2459), .B1(
        DmP_EXP_EWSW[17]), .Y(n642) );
  AO22XLTS U450 ( .A0(n2460), .A1(DmP_mant_SHT1_SW[16]), .B0(n2459), .B1(
        DmP_EXP_EWSW[16]), .Y(n644) );
  AO22XLTS U451 ( .A0(n2460), .A1(DmP_mant_SHT1_SW[15]), .B0(n2459), .B1(
        DmP_EXP_EWSW[15]), .Y(n646) );
  AO22XLTS U452 ( .A0(n2460), .A1(DmP_mant_SHT1_SW[14]), .B0(n2479), .B1(
        DmP_EXP_EWSW[14]), .Y(n648) );
  AO22XLTS U453 ( .A0(n2460), .A1(DmP_mant_SHT1_SW[13]), .B0(n2461), .B1(
        DmP_EXP_EWSW[13]), .Y(n650) );
  AO22XLTS U454 ( .A0(n2460), .A1(DmP_mant_SHT1_SW[12]), .B0(n2461), .B1(
        DmP_EXP_EWSW[12]), .Y(n652) );
  AO22XLTS U455 ( .A0(n2462), .A1(DmP_mant_SHT1_SW[11]), .B0(n2461), .B1(
        DmP_EXP_EWSW[11]), .Y(n654) );
  AO22XLTS U456 ( .A0(n2460), .A1(DmP_mant_SHT1_SW[10]), .B0(n2461), .B1(
        DmP_EXP_EWSW[10]), .Y(n656) );
  AO22XLTS U457 ( .A0(n2477), .A1(DmP_mant_SHT1_SW[9]), .B0(n2461), .B1(
        DmP_EXP_EWSW[9]), .Y(n658) );
  AO22XLTS U458 ( .A0(n2462), .A1(DmP_mant_SHT1_SW[8]), .B0(n2461), .B1(
        DmP_EXP_EWSW[8]), .Y(n660) );
  AO22XLTS U459 ( .A0(n2462), .A1(DmP_mant_SHT1_SW[7]), .B0(n2461), .B1(
        DmP_EXP_EWSW[7]), .Y(n662) );
  AO22XLTS U460 ( .A0(n2462), .A1(DmP_mant_SHT1_SW[6]), .B0(n2461), .B1(
        DmP_EXP_EWSW[6]), .Y(n664) );
  AO22XLTS U461 ( .A0(n2477), .A1(DmP_mant_SHT1_SW[5]), .B0(n2461), .B1(
        DmP_EXP_EWSW[5]), .Y(n666) );
  AO22XLTS U462 ( .A0(n2462), .A1(DmP_mant_SHT1_SW[4]), .B0(n2461), .B1(
        DmP_EXP_EWSW[4]), .Y(n668) );
  AO22XLTS U463 ( .A0(n2462), .A1(DmP_mant_SHT1_SW[3]), .B0(n2496), .B1(
        DmP_EXP_EWSW[3]), .Y(n670) );
  AO22XLTS U464 ( .A0(n2462), .A1(DmP_mant_SHT1_SW[2]), .B0(n2496), .B1(
        DmP_EXP_EWSW[2]), .Y(n672) );
  AO22XLTS U465 ( .A0(n2462), .A1(DmP_mant_SHT1_SW[1]), .B0(n2496), .B1(
        DmP_EXP_EWSW[1]), .Y(n674) );
  AO22XLTS U466 ( .A0(n2462), .A1(DmP_mant_SHT1_SW[0]), .B0(n2496), .B1(
        DmP_EXP_EWSW[0]), .Y(n676) );
  AO22XLTS U467 ( .A0(n1628), .A1(DMP_SFG[30]), .B0(n1640), .B1(
        DMP_exp_NRM_EW[7]), .Y(n679) );
  AO22XLTS U468 ( .A0(n2465), .A1(DMP_SHT2_EWSW[30]), .B0(n2470), .B1(
        DMP_SFG[30]), .Y(n680) );
  AO22XLTS U469 ( .A0(n2467), .A1(DMP_SHT2_EWSW[30]), .B0(n2466), .B1(
        DMP_SHT1_EWSW[30]), .Y(n681) );
  AO22XLTS U470 ( .A0(n2477), .A1(DMP_SHT1_EWSW[30]), .B0(n2496), .B1(
        DMP_EXP_EWSW[30]), .Y(n682) );
  AO22XLTS U471 ( .A0(n1627), .A1(DMP_SFG[29]), .B0(n1640), .B1(
        DMP_exp_NRM_EW[6]), .Y(n684) );
  AO22XLTS U472 ( .A0(n2471), .A1(DMP_SHT2_EWSW[29]), .B0(n2470), .B1(
        DMP_SFG[29]), .Y(n685) );
  AO22XLTS U473 ( .A0(n2467), .A1(DMP_SHT2_EWSW[29]), .B0(n2466), .B1(
        DMP_SHT1_EWSW[29]), .Y(n686) );
  AO22XLTS U474 ( .A0(n2477), .A1(DMP_SHT1_EWSW[29]), .B0(n2496), .B1(
        DMP_EXP_EWSW[29]), .Y(n687) );
  AO22XLTS U475 ( .A0(n1628), .A1(DMP_SFG[28]), .B0(n2463), .B1(
        DMP_exp_NRM_EW[5]), .Y(n689) );
  AO22XLTS U476 ( .A0(n2471), .A1(DMP_SHT2_EWSW[28]), .B0(n2464), .B1(
        DMP_SFG[28]), .Y(n690) );
  AO22XLTS U477 ( .A0(n2467), .A1(DMP_SHT2_EWSW[28]), .B0(n2466), .B1(
        DMP_SHT1_EWSW[28]), .Y(n691) );
  AO22XLTS U478 ( .A0(n2477), .A1(DMP_SHT1_EWSW[28]), .B0(n2496), .B1(
        DMP_EXP_EWSW[28]), .Y(n692) );
  AO22XLTS U479 ( .A0(n1627), .A1(DMP_SFG[27]), .B0(n2463), .B1(
        DMP_exp_NRM_EW[4]), .Y(n694) );
  AO22XLTS U480 ( .A0(n2471), .A1(DMP_SHT2_EWSW[27]), .B0(n2470), .B1(
        DMP_SFG[27]), .Y(n695) );
  AO22XLTS U481 ( .A0(n2467), .A1(DMP_SHT2_EWSW[27]), .B0(n2466), .B1(
        DMP_SHT1_EWSW[27]), .Y(n696) );
  AO22XLTS U482 ( .A0(n2477), .A1(DMP_SHT1_EWSW[27]), .B0(n2496), .B1(
        DMP_EXP_EWSW[27]), .Y(n697) );
  AO22XLTS U483 ( .A0(n1628), .A1(DMP_SFG[26]), .B0(n2463), .B1(
        DMP_exp_NRM_EW[3]), .Y(n699) );
  AO22XLTS U484 ( .A0(n2465), .A1(DMP_SHT2_EWSW[26]), .B0(n2470), .B1(
        DMP_SFG[26]), .Y(n700) );
  AO22XLTS U485 ( .A0(n2467), .A1(DMP_SHT2_EWSW[26]), .B0(n2466), .B1(
        DMP_SHT1_EWSW[26]), .Y(n701) );
  AO22XLTS U486 ( .A0(n1627), .A1(DMP_SFG[25]), .B0(n2463), .B1(
        DMP_exp_NRM_EW[2]), .Y(n704) );
  AO22XLTS U487 ( .A0(n2471), .A1(DMP_SHT2_EWSW[25]), .B0(n2470), .B1(
        DMP_SFG[25]), .Y(n705) );
  AO22XLTS U488 ( .A0(n2467), .A1(DMP_SHT2_EWSW[25]), .B0(n2466), .B1(
        DMP_SHT1_EWSW[25]), .Y(n706) );
  AO22XLTS U489 ( .A0(n1628), .A1(DMP_SFG[24]), .B0(n2463), .B1(
        DMP_exp_NRM_EW[1]), .Y(n709) );
  AO22XLTS U490 ( .A0(n2471), .A1(DMP_SHT2_EWSW[24]), .B0(n2470), .B1(
        DMP_SFG[24]), .Y(n710) );
  AO22XLTS U491 ( .A0(n2467), .A1(DMP_SHT2_EWSW[24]), .B0(n2466), .B1(
        DMP_SHT1_EWSW[24]), .Y(n711) );
  AO22XLTS U492 ( .A0(n2469), .A1(DMP_exp_NRM_EW[0]), .B0(n2468), .B1(
        DMP_exp_NRM2_EW[0]), .Y(n713) );
  AO22XLTS U493 ( .A0(n1627), .A1(DMP_SFG[23]), .B0(n2463), .B1(
        DMP_exp_NRM_EW[0]), .Y(n714) );
  AO22XLTS U494 ( .A0(n2471), .A1(DMP_SHT2_EWSW[23]), .B0(n2470), .B1(
        DMP_SFG[23]), .Y(n715) );
  AO22XLTS U495 ( .A0(n2475), .A1(DMP_SHT2_EWSW[23]), .B0(n2473), .B1(
        DMP_SHT1_EWSW[23]), .Y(n716) );
  AOI2BB2XLTS U496 ( .B0(n1492), .B1(n2493), .A0N(n2478), .A1N(
        DMP_SHT1_EWSW[23]), .Y(n717) );
  AO22XLTS U497 ( .A0(n2475), .A1(DMP_SHT2_EWSW[22]), .B0(n2473), .B1(
        DMP_SHT1_EWSW[22]), .Y(n719) );
  AO22XLTS U498 ( .A0(n2477), .A1(DMP_SHT1_EWSW[22]), .B0(n2590), .B1(
        DMP_EXP_EWSW[22]), .Y(n720) );
  AO22XLTS U499 ( .A0(n2475), .A1(DMP_SHT2_EWSW[21]), .B0(n2473), .B1(
        DMP_SHT1_EWSW[21]), .Y(n722) );
  AO22XLTS U500 ( .A0(n2477), .A1(DMP_SHT1_EWSW[21]), .B0(n2590), .B1(
        DMP_EXP_EWSW[21]), .Y(n723) );
  AO22XLTS U501 ( .A0(n2475), .A1(DMP_SHT2_EWSW[20]), .B0(n2473), .B1(
        DMP_SHT1_EWSW[20]), .Y(n725) );
  AO22XLTS U502 ( .A0(n2489), .A1(DMP_SHT1_EWSW[20]), .B0(n2590), .B1(
        DMP_EXP_EWSW[20]), .Y(n726) );
  AO22XLTS U503 ( .A0(n2475), .A1(DMP_SHT2_EWSW[19]), .B0(n2473), .B1(
        DMP_SHT1_EWSW[19]), .Y(n728) );
  AO22XLTS U504 ( .A0(n2489), .A1(DMP_SHT1_EWSW[19]), .B0(n2590), .B1(
        DMP_EXP_EWSW[19]), .Y(n729) );
  AO22XLTS U505 ( .A0(n2475), .A1(DMP_SHT2_EWSW[18]), .B0(n2473), .B1(
        DMP_SHT1_EWSW[18]), .Y(n731) );
  AO22XLTS U506 ( .A0(n2489), .A1(DMP_SHT1_EWSW[18]), .B0(n2590), .B1(
        DMP_EXP_EWSW[18]), .Y(n732) );
  AO22XLTS U507 ( .A0(n2475), .A1(DMP_SHT2_EWSW[17]), .B0(n2473), .B1(
        DMP_SHT1_EWSW[17]), .Y(n734) );
  AO22XLTS U508 ( .A0(n2489), .A1(DMP_SHT1_EWSW[17]), .B0(n2478), .B1(
        DMP_EXP_EWSW[17]), .Y(n735) );
  AO22XLTS U509 ( .A0(n2475), .A1(DMP_SHT2_EWSW[16]), .B0(n2473), .B1(
        DMP_SHT1_EWSW[16]), .Y(n737) );
  AO22XLTS U510 ( .A0(n2489), .A1(DMP_SHT1_EWSW[16]), .B0(n2479), .B1(
        DMP_EXP_EWSW[16]), .Y(n738) );
  AO22XLTS U511 ( .A0(n2475), .A1(DMP_SHT2_EWSW[15]), .B0(n2473), .B1(
        DMP_SHT1_EWSW[15]), .Y(n740) );
  AO22XLTS U512 ( .A0(n2489), .A1(DMP_SHT1_EWSW[15]), .B0(n2476), .B1(
        DMP_EXP_EWSW[15]), .Y(n741) );
  AO22XLTS U513 ( .A0(n2475), .A1(DMP_SHT2_EWSW[14]), .B0(n2474), .B1(
        DMP_SHT1_EWSW[14]), .Y(n743) );
  AO22XLTS U514 ( .A0(n2489), .A1(DMP_SHT1_EWSW[14]), .B0(n2476), .B1(
        DMP_EXP_EWSW[14]), .Y(n744) );
  AO22XLTS U515 ( .A0(n2489), .A1(DMP_SHT1_EWSW[13]), .B0(n2476), .B1(
        DMP_EXP_EWSW[13]), .Y(n747) );
  AO22XLTS U516 ( .A0(n2489), .A1(DMP_SHT1_EWSW[12]), .B0(n2478), .B1(
        DMP_EXP_EWSW[12]), .Y(n750) );
  AO22XLTS U517 ( .A0(n2477), .A1(DMP_SHT1_EWSW[11]), .B0(n2478), .B1(
        DMP_EXP_EWSW[11]), .Y(n753) );
  AO22XLTS U518 ( .A0(n2484), .A1(DMP_SHT1_EWSW[10]), .B0(n2478), .B1(
        DMP_EXP_EWSW[10]), .Y(n756) );
  AO22XLTS U519 ( .A0(DMP_SHT1_EWSW[9]), .A1(n2472), .B0(DMP_SHT2_EWSW[9]), 
        .B1(n2534), .Y(n758) );
  AO22XLTS U520 ( .A0(n2477), .A1(DMP_SHT1_EWSW[9]), .B0(n2478), .B1(
        DMP_EXP_EWSW[9]), .Y(n759) );
  AO22XLTS U521 ( .A0(DMP_SHT1_EWSW[8]), .A1(n2472), .B0(DMP_SHT2_EWSW[8]), 
        .B1(n2534), .Y(n761) );
  AO22XLTS U522 ( .A0(n2484), .A1(DMP_SHT1_EWSW[8]), .B0(n2496), .B1(
        DMP_EXP_EWSW[8]), .Y(n762) );
  AO22XLTS U523 ( .A0(DMP_SHT1_EWSW[7]), .A1(n2472), .B0(DMP_SHT2_EWSW[7]), 
        .B1(n2534), .Y(n1527) );
  AO22XLTS U524 ( .A0(n2484), .A1(DMP_SHT1_EWSW[7]), .B0(n2478), .B1(
        DMP_EXP_EWSW[7]), .Y(n765) );
  AO22XLTS U525 ( .A0(DMP_SHT1_EWSW[6]), .A1(n2472), .B0(DMP_SHT2_EWSW[6]), 
        .B1(n2534), .Y(n1528) );
  AO22XLTS U526 ( .A0(n2484), .A1(DMP_SHT1_EWSW[6]), .B0(n2478), .B1(
        DMP_EXP_EWSW[6]), .Y(n768) );
  AO22XLTS U527 ( .A0(DMP_SHT1_EWSW[5]), .A1(busy), .B0(DMP_SHT2_EWSW[5]), 
        .B1(n2534), .Y(n1529) );
  AO22XLTS U528 ( .A0(n2484), .A1(DMP_SHT1_EWSW[5]), .B0(n2493), .B1(
        DMP_EXP_EWSW[5]), .Y(n771) );
  AO22XLTS U529 ( .A0(DMP_SHT1_EWSW[4]), .A1(busy), .B0(DMP_SHT2_EWSW[4]), 
        .B1(n2534), .Y(n1530) );
  AO22XLTS U530 ( .A0(n2484), .A1(DMP_SHT1_EWSW[4]), .B0(n2479), .B1(
        DMP_EXP_EWSW[4]), .Y(n774) );
  AO22XLTS U531 ( .A0(DMP_SHT1_EWSW[3]), .A1(busy), .B0(DMP_SHT2_EWSW[3]), 
        .B1(n2534), .Y(n1531) );
  AO22XLTS U532 ( .A0(n2484), .A1(DMP_SHT1_EWSW[3]), .B0(n2479), .B1(
        DMP_EXP_EWSW[3]), .Y(n777) );
  AO22XLTS U533 ( .A0(DMP_SHT1_EWSW[2]), .A1(busy), .B0(DMP_SHT2_EWSW[2]), 
        .B1(n2534), .Y(n1532) );
  AO22XLTS U534 ( .A0(n2484), .A1(DMP_SHT1_EWSW[2]), .B0(n2590), .B1(
        DMP_EXP_EWSW[2]), .Y(n780) );
  AO22XLTS U535 ( .A0(DMP_SHT1_EWSW[1]), .A1(busy), .B0(DMP_SHT2_EWSW[1]), 
        .B1(n2534), .Y(n1533) );
  AO22XLTS U536 ( .A0(n2484), .A1(DMP_SHT1_EWSW[1]), .B0(n2493), .B1(
        DMP_EXP_EWSW[1]), .Y(n783) );
  AO22XLTS U537 ( .A0(DMP_SHT1_EWSW[0]), .A1(busy), .B0(DMP_SHT2_EWSW[0]), 
        .B1(n2534), .Y(n1534) );
  AO22XLTS U538 ( .A0(n2522), .A1(DMP_SHT1_EWSW[0]), .B0(n2493), .B1(
        DMP_EXP_EWSW[0]), .Y(n786) );
  AO22XLTS U539 ( .A0(n2520), .A1(OP_FLAG_EXP), .B0(n2583), .B1(n1741), .Y(
        n788) );
  AOI2BB2XLTS U540 ( .B0(n1801), .B1(intDX_EWSW[31]), .A0N(intDX_EWSW[31]), 
        .A1N(n1801), .Y(n1741) );
  AO22XLTS U541 ( .A0(n2484), .A1(Shift_amount_SHT1_EWR[4]), .B0(n2493), .B1(
        n2483), .Y(n828) );
  AO22XLTS U542 ( .A0(n2522), .A1(Shift_amount_SHT1_EWR[3]), .B0(n2493), .B1(
        n2486), .Y(n829) );
  AO22XLTS U543 ( .A0(n2489), .A1(Shift_amount_SHT1_EWR[2]), .B0(n2493), .B1(
        n2488), .Y(n830) );
  AOI211X2TS U544 ( .A0(n2074), .A1(n2073), .B0(n2207), .C0(n2072), .Y(n2223)
         );
  XNOR2X2TS U545 ( .A(DP_OP_15J43_122_6956_n1), .B(n2563), .Y(n2100) );
  NOR2X2TS U546 ( .A(n2273), .B(n2276), .Y(n2408) );
  INVX2TS U547 ( .A(n2102), .Y(n2457) );
  AND2X2TS U548 ( .A(n2429), .B(n2574), .Y(n1588) );
  AOI22X2TS U549 ( .A0(intDY_EWSW[1]), .A1(n1482), .B0(n1483), .B1(
        intDY_EWSW[2]), .Y(n1804) );
  INVX2TS U550 ( .A(n2306), .Y(n1600) );
  INVX2TS U551 ( .A(n2306), .Y(n1601) );
  INVX2TS U552 ( .A(n1591), .Y(n1607) );
  INVX2TS U553 ( .A(n1881), .Y(n1609) );
  INVX2TS U554 ( .A(n1609), .Y(n1610) );
  INVX2TS U555 ( .A(n1609), .Y(n1611) );
  INVX2TS U556 ( .A(shift_value_SHT2_EWR[4]), .Y(n1613) );
  INVX2TS U557 ( .A(shift_value_SHT2_EWR[4]), .Y(n1614) );
  INVX2TS U558 ( .A(n2640), .Y(n1615) );
  INVX2TS U559 ( .A(n1615), .Y(n1616) );
  INVX2TS U560 ( .A(n1582), .Y(n1617) );
  INVX2TS U561 ( .A(n1583), .Y(n1619) );
  INVX2TS U562 ( .A(n1581), .Y(n1620) );
  INVX2TS U563 ( .A(n1581), .Y(n1621) );
  INVX2TS U564 ( .A(n1592), .Y(n1622) );
  INVX2TS U565 ( .A(rst), .Y(n1623) );
  OAI32X1TS U566 ( .A0(exp_rslt_NRM2_EW1[3]), .A1(n2525), .A2(n1638), .B0(
        final_result_ieee[26]), .B1(Shift_reg_FLAGS_7[0]), .Y(n2097) );
  NOR4BBX2TS U567 ( .AN(n2091), .BN(n2090), .C(exp_rslt_NRM2_EW1[3]), .D(
        exp_rslt_NRM2_EW1[4]), .Y(n1638) );
  OAI32X1TS U568 ( .A0(exp_rslt_NRM2_EW1[2]), .A1(n2525), .A2(n1639), .B0(
        final_result_ieee[25]), .B1(Shift_reg_FLAGS_7[0]), .Y(n2098) );
  NOR4BBX2TS U569 ( .AN(n2091), .BN(n2090), .C(exp_rslt_NRM2_EW1[3]), .D(
        exp_rslt_NRM2_EW1[4]), .Y(n1639) );
  OAI21X1TS U570 ( .A0(n1694), .A1(n2325), .B0(n1693), .Y(n588) );
  OAI21XLTS U571 ( .A0(n2163), .A1(n2325), .B0(n2162), .Y(n592) );
  OAI21XLTS U572 ( .A0(n2326), .A1(n2325), .B0(n2324), .Y(n590) );
  INVX2TS U573 ( .A(n1590), .Y(n1624) );
  INVX2TS U574 ( .A(Shift_reg_FLAGS_7[2]), .Y(n1625) );
  INVX2TS U575 ( .A(n1625), .Y(n1626) );
  INVX2TS U576 ( .A(n1625), .Y(n1627) );
  INVX2TS U577 ( .A(n1625), .Y(n1628) );
  INVX2TS U578 ( .A(n2033), .Y(n2036) );
  AOI21X2TS U579 ( .A0(n1987), .A1(n1496), .B0(n1986), .Y(n2033) );
  NAND2X2TS U580 ( .A(n1493), .B(n1977), .Y(n1985) );
  OAI211XLTS U581 ( .A0(n1631), .A1(n1595), .B0(n2021), .C0(n2041), .Y(n556)
         );
  NAND2X4TS U582 ( .A(n2424), .B(n1886), .Y(n2041) );
  INVX2TS U583 ( .A(n1629), .Y(n1630) );
  INVX2TS U584 ( .A(n1631), .Y(n1632) );
  OAI211X4TS U585 ( .A0(n2036), .A1(n1614), .B0(n2035), .C0(n2034), .Y(n2143)
         );
  INVX2TS U586 ( .A(n1633), .Y(n1634) );
  AOI211X1TS U587 ( .A0(intDY_EWSW[27]), .A1(n1464), .B0(n73), .C0(n2555), .Y(
        n1793) );
  INVX2TS U588 ( .A(n1587), .Y(n1636) );
  INVX2TS U589 ( .A(n1586), .Y(n1637) );
  OAI21X2TS U590 ( .A0(n2588), .A1(n2306), .B0(n2305), .Y(n2398) );
  OAI21X2TS U591 ( .A0(n2641), .A1(n2360), .B0(n2290), .Y(n2378) );
  OAI21X2TS U592 ( .A0(n2313), .A1(n2535), .B0(n2312), .Y(n2407) );
  INVX4TS U593 ( .A(n2427), .Y(n2428) );
  NOR2X1TS U594 ( .A(LZD_output_NRM2_EW[1]), .B(n2563), .Y(
        DP_OP_15J43_122_6956_n17) );
  NOR2BX2TS U595 ( .AN(n1944), .B(n1943), .Y(n2504) );
  NOR2X2TS U596 ( .A(inst_FSM_INPUT_ENABLE_state_reg[2]), .B(n2540), .Y(n2517)
         );
  OR2X1TS U597 ( .A(n1511), .B(DMP_SFG[7]), .Y(n1839) );
  OAI211X4TS U598 ( .A0(n2142), .A1(n1614), .B0(n1958), .C0(n1957), .Y(n2125)
         );
  OR2X1TS U599 ( .A(n1509), .B(DMP_SFG[11]), .Y(n1899) );
  OR2X1TS U600 ( .A(n1509), .B(n2560), .Y(n1902) );
  AOI22X2TS U601 ( .A0(intDY_EWSW[17]), .A1(n1490), .B0(n1463), .B1(
        intDY_EWSW[18]), .Y(n1808) );
  OAI21XLTS U602 ( .A0(n1501), .A1(n2429), .B0(n2041), .Y(n2014) );
  OR2X1TS U603 ( .A(n1501), .B(DMP_SFG[6]), .Y(n1648) );
  OR2X1TS U604 ( .A(n1501), .B(n2549), .Y(n1913) );
  NAND2X1TS U605 ( .A(n1501), .B(n2549), .Y(n1912) );
  NAND2X1TS U606 ( .A(n1457), .B(intDY_EWSW[15]), .Y(n1775) );
  AOI2BB2X1TS U607 ( .B0(n1775), .B1(n1770), .A0N(n1457), .A1N(intDY_EWSW[15]), 
        .Y(n1778) );
  OAI211XLTS U608 ( .A0(n2023), .A1(n1599), .B0(n1961), .C0(n2037), .Y(n536)
         );
  OAI211XLTS U609 ( .A0(n2032), .A1(n1599), .B0(n1968), .C0(n2037), .Y(n541)
         );
  NAND2X4TS U610 ( .A(n2424), .B(n1588), .Y(n2037) );
  NAND2X1TS U611 ( .A(intDY_EWSW[14]), .B(n1486), .Y(n1774) );
  OR2X1TS U612 ( .A(n1507), .B(n2565), .Y(n2048) );
  NOR2X2TS U613 ( .A(n2539), .B(n1955), .Y(n1981) );
  OAI21X1TS U614 ( .A0(n1496), .A1(n1976), .B0(n1955), .Y(n1938) );
  NAND2BX2TS U615 ( .AN(n1493), .B(shift_value_SHT2_EWR[3]), .Y(n1955) );
  CLKBUFX3TS U616 ( .A(n1822), .Y(n1737) );
  BUFX3TS U617 ( .A(n2472), .Y(n2473) );
  AOI21X2TS U618 ( .A0(Raw_mant_NRM_SWR[23]), .A1(n1601), .B0(n2268), .Y(n2415) );
  OAI21X2TS U619 ( .A0(n2535), .A1(n2360), .B0(n2282), .Y(n2383) );
  AOI21X2TS U620 ( .A0(Raw_mant_NRM_SWR[15]), .A1(n1695), .B0(n2287), .Y(n2381) );
  OAI21X2TS U621 ( .A0(n2541), .A1(n2306), .B0(n2288), .Y(n2377) );
  NOR3X4TS U622 ( .A(exp_rslt_NRM2_EW1[7]), .B(exp_rslt_NRM2_EW1[1]), .C(n2100), .Y(n2090) );
  INVX4TS U623 ( .A(n2583), .Y(n2520) );
  AND2X4TS U624 ( .A(n2164), .B(n2583), .Y(n2227) );
  OAI31X4TS U625 ( .A0(n1800), .A1(n1799), .A2(n1798), .B0(n1797), .Y(n2164)
         );
  OR2X1TS U626 ( .A(n1514), .B(DMP_SFG[1]), .Y(n1945) );
  NAND2X2TS U627 ( .A(n1681), .B(n1680), .Y(n1682) );
  NAND3X2TS U628 ( .A(n1684), .B(n1841), .C(n1683), .Y(n1830) );
  OR2X1TS U629 ( .A(n1502), .B(n2548), .Y(n1871) );
  OR2X1TS U630 ( .A(n1511), .B(n2556), .Y(n1910) );
  OAI21XLTS U631 ( .A0(n1495), .A1(n1922), .B0(n1889), .Y(n1891) );
  NAND2X1TS U632 ( .A(n1512), .B(DMP_SFG[5]), .Y(n1865) );
  OAI21X2TS U633 ( .A0(n2261), .A1(n2260), .B0(n2259), .Y(n2321) );
  OR2X1TS U634 ( .A(n1506), .B(n2573), .Y(n2083) );
  OR2X1TS U635 ( .A(n1521), .B(n2559), .Y(n2008) );
  NOR2XLTS U636 ( .A(n2469), .B(n2521), .Y(n2069) );
  OAI32X1TS U637 ( .A0(exp_rslt_NRM2_EW1[6]), .A1(n2525), .A2(n2102), .B0(
        final_result_ieee[29]), .B1(Shift_reg_FLAGS_7[0]), .Y(n2096) );
  AOI22X1TS U638 ( .A0(n1692), .A1(n2322), .B0(Raw_mant_NRM_SWR[25]), .B1(
        n2523), .Y(n1693) );
  OAI2BB1X1TS U639 ( .A0N(n2342), .A1N(n2341), .B0(n2340), .Y(n589) );
  NOR2BX1TS U640 ( .AN(n2545), .B(n1515), .Y(n1642) );
  NAND2X1TS U641 ( .A(n1515), .B(DMP_SFG[0]), .Y(n1944) );
  NAND2X1TS U642 ( .A(n1514), .B(DMP_SFG[1]), .Y(n1946) );
  NAND2X1TS U643 ( .A(n1944), .B(n1946), .Y(n1645) );
  AND2X2TS U644 ( .A(n1945), .B(n1643), .Y(n1644) );
  OAI21X2TS U645 ( .A0(n1943), .A1(n1645), .B0(n1644), .Y(n1729) );
  NAND2X1TS U646 ( .A(n1503), .B(DMP_SFG[2]), .Y(n1728) );
  NAND2X1TS U647 ( .A(n1513), .B(DMP_SFG[3]), .Y(n1993) );
  NAND3X1TS U648 ( .A(n1729), .B(n1728), .C(n1993), .Y(n1647) );
  NAND3X4TS U649 ( .A(n1647), .B(n1646), .C(n1994), .Y(n1862) );
  NAND3X4TS U650 ( .A(n1862), .B(n1865), .C(n1861), .Y(n1649) );
  NAND2X1TS U651 ( .A(n1501), .B(DMP_SFG[6]), .Y(n1836) );
  NAND2X1TS U652 ( .A(n1511), .B(DMP_SFG[7]), .Y(n1838) );
  NAND3X4TS U653 ( .A(n1837), .B(n1836), .C(n1838), .Y(n1651) );
  NAND3X4TS U654 ( .A(n1651), .B(n1650), .C(n1839), .Y(n1712) );
  NAND2X1TS U655 ( .A(n1522), .B(DMP_SFG[9]), .Y(n1849) );
  NAND2X1TS U656 ( .A(n1500), .B(DMP_SFG[8]), .Y(n1711) );
  NAND2X1TS U657 ( .A(n1510), .B(DMP_SFG[10]), .Y(n1826) );
  NAND2X1TS U658 ( .A(n1509), .B(DMP_SFG[11]), .Y(n1898) );
  NAND3X4TS U659 ( .A(n1827), .B(n1826), .C(n1898), .Y(n1655) );
  OA21XLTS U660 ( .A0(DMP_SFG[12]), .A1(n1521), .B0(n1899), .Y(n1654) );
  NAND2X4TS U661 ( .A(n1655), .B(n1654), .Y(n1700) );
  NAND2X1TS U662 ( .A(n1508), .B(DMP_SFG[13]), .Y(n1701) );
  NAND2X1TS U663 ( .A(n1521), .B(DMP_SFG[12]), .Y(n1699) );
  OAI21X1TS U664 ( .A0(n1520), .A1(DMP_SFG[14]), .B0(n1702), .Y(n1656) );
  AOI21X4TS U665 ( .A0(n1700), .A1(n1657), .B0(n1656), .Y(n1658) );
  AOI21X4TS U666 ( .A0(n1520), .A1(DMP_SFG[14]), .B0(n1658), .Y(n2049) );
  NAND2X1TS U667 ( .A(n1507), .B(DMP_SFG[15]), .Y(n1659) );
  AOI2BB2X4TS U668 ( .B0(n2049), .B1(n1659), .A0N(DMP_SFG[15]), .A1N(n1507), 
        .Y(n2058) );
  OAI2BB1X4TS U669 ( .A0N(n2533), .A1N(n2532), .B0(n2058), .Y(n1660) );
  OAI22X4TS U670 ( .A0(n2084), .A1(n1661), .B0(n1506), .B1(DMP_SFG[17]), .Y(
        n1723) );
  AOI2BB1X4TS U671 ( .A0N(DMP_SFG[18]), .A1N(n1518), .B0(n1723), .Y(n1663) );
  OAI2BB1X4TS U672 ( .A0N(n1505), .A1N(DMP_SFG[19]), .B0(n2158), .Y(n1664) );
  OAI2BB1X4TS U673 ( .A0N(n2598), .A1N(n2599), .B0(n1664), .Y(n2262) );
  OAI2BB1X4TS U674 ( .A0N(n1504), .A1N(DMP_SFG[21]), .B0(n2319), .Y(n1667) );
  AOI2BB1X4TS U675 ( .A0N(DMP_SFG[22]), .A1N(n1516), .B0(n2337), .Y(n1668) );
  XOR2X1TS U676 ( .A(n1669), .B(DmP_mant_SFG_SWR[25]), .Y(n1694) );
  NAND2X1TS U677 ( .A(OP_FLAG_SFG), .B(n1626), .Y(n1704) );
  INVX2TS U678 ( .A(n2497), .Y(n2325) );
  AND2X2TS U679 ( .A(n1514), .B(n2553), .Y(n1670) );
  NOR2BX1TS U680 ( .AN(DMP_SFG[1]), .B(n1514), .Y(n1671) );
  NOR2X4TS U681 ( .A(n1672), .B(n1671), .Y(n1949) );
  NAND2BX1TS U682 ( .AN(n1503), .B(DMP_SFG[2]), .Y(n1673) );
  NAND2X2TS U683 ( .A(n1949), .B(n1673), .Y(n1731) );
  NAND2X2TS U684 ( .A(n1512), .B(n2551), .Y(n1676) );
  NAND2X2TS U685 ( .A(n1502), .B(n2548), .Y(n1870) );
  AND2X2TS U686 ( .A(n1676), .B(n1870), .Y(n1674) );
  NAND2X1TS U687 ( .A(n1503), .B(n2552), .Y(n1730) );
  NAND2X1TS U688 ( .A(n1513), .B(n2550), .Y(n1866) );
  INVX2TS U689 ( .A(n1674), .Y(n1675) );
  OR2X2TS U690 ( .A(n1513), .B(n2550), .Y(n1867) );
  INVX2TS U691 ( .A(n1676), .Y(n1873) );
  OR2X2TS U692 ( .A(n1512), .B(n2551), .Y(n1872) );
  NAND2X1TS U693 ( .A(n1913), .B(n1872), .Y(n1677) );
  NOR3X2TS U694 ( .A(n1679), .B(n1678), .C(n1677), .Y(n1680) );
  NAND2X1TS U695 ( .A(n1511), .B(n2556), .Y(n1909) );
  NAND3X4TS U696 ( .A(n1682), .B(n1912), .C(n1909), .Y(n1713) );
  NAND2X1TS U697 ( .A(n1500), .B(n2557), .Y(n1841) );
  NAND2X1TS U698 ( .A(n1522), .B(n2562), .Y(n1683) );
  NAND3X4TS U699 ( .A(n1830), .B(n1829), .C(n1854), .Y(n1685) );
  NAND2X1TS U700 ( .A(n1509), .B(n2560), .Y(n1828) );
  NAND2X1TS U701 ( .A(n1510), .B(n2558), .Y(n1853) );
  NAND3X4TS U702 ( .A(n1685), .B(n1828), .C(n1853), .Y(n1903) );
  NAND3X4TS U703 ( .A(n1903), .B(n1902), .C(n2008), .Y(n1686) );
  NAND2X1TS U704 ( .A(n1508), .B(n2561), .Y(n2003) );
  NAND2X1TS U705 ( .A(n1521), .B(n2559), .Y(n2006) );
  NAND3X4TS U706 ( .A(n1686), .B(n2003), .C(n2006), .Y(n1687) );
  NOR2BX1TS U707 ( .AN(DMP_SFG[14]), .B(n1520), .Y(n1698) );
  NAND2X1TS U708 ( .A(n1520), .B(n2570), .Y(n1696) );
  NAND2X1TS U709 ( .A(n1507), .B(n2565), .Y(n2047) );
  NAND2X4TS U710 ( .A(n2051), .B(n2047), .Y(n1688) );
  NOR2BX1TS U711 ( .AN(DMP_SFG[16]), .B(n1519), .Y(n2056) );
  NAND2X1TS U712 ( .A(n1519), .B(n2533), .Y(n2055) );
  NAND2X1TS U713 ( .A(n1506), .B(n2573), .Y(n2082) );
  NAND2X4TS U714 ( .A(n2086), .B(n2082), .Y(n1689) );
  NAND2X4TS U715 ( .A(n1689), .B(n2083), .Y(n1722) );
  NOR2BX1TS U716 ( .AN(DMP_SFG[18]), .B(n1518), .Y(n1720) );
  NAND2X1TS U717 ( .A(n1518), .B(n2575), .Y(n1721) );
  NAND2X1TS U718 ( .A(n1505), .B(n2599), .Y(n2156) );
  NAND2X4TS U719 ( .A(n2160), .B(n2156), .Y(n1690) );
  NAND2X8TS U720 ( .A(n1690), .B(n2157), .Y(n2261) );
  NOR2BX1TS U721 ( .AN(DMP_SFG[20]), .B(n1517), .Y(n2260) );
  NAND2X1TS U722 ( .A(n1517), .B(n2582), .Y(n2259) );
  NOR2BX1TS U723 ( .AN(n1504), .B(DMP_SFG[21]), .Y(n2318) );
  NAND2X1TS U724 ( .A(n2578), .B(DMP_SFG[21]), .Y(n2317) );
  NOR2BX1TS U725 ( .AN(DMP_SFG[22]), .B(n1516), .Y(n2331) );
  NAND2X1TS U726 ( .A(n1516), .B(n2586), .Y(n2330) );
  XOR2X1TS U727 ( .A(n2430), .B(DmP_mant_SFG_SWR[25]), .Y(n1692) );
  NOR2BX1TS U728 ( .AN(n1626), .B(OP_FLAG_SFG), .Y(n1691) );
  INVX2TS U729 ( .A(n1691), .Y(n2332) );
  INVX2TS U730 ( .A(n1626), .Y(n2463) );
  BUFX3TS U731 ( .A(n2463), .Y(n2523) );
  BUFX3TS U732 ( .A(n2454), .Y(n2468) );
  CLKBUFX2TS U733 ( .A(busy), .Y(n2474) );
  INVX2TS U734 ( .A(n2474), .Y(n2521) );
  NAND2X2TS U735 ( .A(n2468), .B(n2521), .Y(n2348) );
  AND2X2TS U736 ( .A(n1480), .B(n2469), .Y(n1695) );
  INVX2TS U737 ( .A(n1696), .Y(n1697) );
  NOR2X1TS U738 ( .A(n1698), .B(n1697), .Y(n1710) );
  NAND2X1TS U739 ( .A(n1700), .B(n1699), .Y(n2005) );
  INVX2TS U740 ( .A(n1701), .Y(n1703) );
  OAI21X1TS U741 ( .A0(n2005), .A1(n1703), .B0(n1702), .Y(n1706) );
  OAI22X1TS U742 ( .A0(n1706), .A1(n2333), .B0(n1705), .B1(n2332), .Y(n1709)
         );
  INVX2TS U743 ( .A(n1704), .Y(n2336) );
  INVX2TS U744 ( .A(n2431), .Y(n2501) );
  AOI22X1TS U745 ( .A0(n1706), .A1(n2336), .B0(n2501), .B1(n1705), .Y(n1707)
         );
  OAI22X1TS U746 ( .A0(n1707), .A1(n1710), .B0(n1628), .B1(n2566), .Y(n1708)
         );
  BUFX3TS U747 ( .A(n2454), .Y(n2352) );
  XOR2X1TS U748 ( .A(n1522), .B(DMP_SFG[9]), .Y(n1719) );
  NAND2X1TS U749 ( .A(n1712), .B(n1711), .Y(n1852) );
  INVX2TS U750 ( .A(n1841), .Y(n1714) );
  OA21XLTS U751 ( .A0(n1843), .A1(n1714), .B0(n1842), .Y(n1715) );
  OAI22X1TS U752 ( .A0(n1852), .A1(n2333), .B0(n1715), .B1(n2332), .Y(n1718)
         );
  AOI22X1TS U753 ( .A0(n1852), .A1(n2497), .B0(n2322), .B1(n1715), .Y(n1716)
         );
  OAI22X1TS U754 ( .A0(n1716), .A1(n1719), .B0(n1627), .B1(n2641), .Y(n1717)
         );
  NOR2X1TS U755 ( .A(LZD_output_NRM2_EW[3]), .B(n2563), .Y(
        DP_OP_15J43_122_6956_n15) );
  NOR2BX1TS U756 ( .AN(n1721), .B(n1720), .Y(n1727) );
  OAI22X1TS U757 ( .A0(n1723), .A1(n2333), .B0(n1722), .B1(n2332), .Y(n1726)
         );
  AOI22X1TS U758 ( .A0(n1723), .A1(n2336), .B0(n2322), .B1(n1722), .Y(n1724)
         );
  OAI22X1TS U759 ( .A0(n1724), .A1(n1727), .B0(n1627), .B1(n2588), .Y(n1725)
         );
  NOR2X1TS U760 ( .A(LZD_output_NRM2_EW[4]), .B(n2563), .Y(
        DP_OP_15J43_122_6956_n14) );
  XOR2X1TS U761 ( .A(n1513), .B(DMP_SFG[3]), .Y(n1735) );
  NAND2X1TS U762 ( .A(n1729), .B(n1728), .Y(n1996) );
  NAND2X1TS U763 ( .A(n1731), .B(n1730), .Y(n1869) );
  OAI22X1TS U764 ( .A0(n1996), .A1(n2333), .B0(n2431), .B1(n1869), .Y(n1734)
         );
  AOI22X1TS U765 ( .A0(n1996), .A1(n2497), .B0(n2335), .B1(n1869), .Y(n1732)
         );
  OAI22X1TS U766 ( .A0(n1732), .A1(n1735), .B0(n1628), .B1(n2579), .Y(n1733)
         );
  CLKBUFX2TS U767 ( .A(n1822), .Y(n1736) );
  BUFX3TS U768 ( .A(n2612), .Y(n2621) );
  BUFX3TS U769 ( .A(n2613), .Y(n2620) );
  BUFX3TS U770 ( .A(n2611), .Y(n2617) );
  BUFX3TS U771 ( .A(n2615), .Y(n2618) );
  BUFX3TS U772 ( .A(n2616), .Y(n2619) );
  CLKBUFX2TS U773 ( .A(n1822), .Y(n1738) );
  BUFX3TS U774 ( .A(n1740), .Y(n2607) );
  CLKBUFX2TS U775 ( .A(n1822), .Y(n1739) );
  BUFX3TS U776 ( .A(n1623), .Y(n2610) );
  BUFX3TS U777 ( .A(n1737), .Y(n2614) );
  BUFX3TS U778 ( .A(n1736), .Y(n2605) );
  BUFX3TS U779 ( .A(n2612), .Y(n2604) );
  BUFX3TS U780 ( .A(n1737), .Y(n2608) );
  BUFX3TS U781 ( .A(n1623), .Y(n2632) );
  BUFX3TS U782 ( .A(n2613), .Y(n2622) );
  BUFX3TS U783 ( .A(n2612), .Y(n2624) );
  BUFX3TS U784 ( .A(n2613), .Y(n2625) );
  BUFX3TS U785 ( .A(n2611), .Y(n2626) );
  BUFX3TS U786 ( .A(n2615), .Y(n2628) );
  BUFX3TS U787 ( .A(n1623), .Y(n2629) );
  BUFX3TS U788 ( .A(n1623), .Y(n2630) );
  BUFX3TS U789 ( .A(n1623), .Y(n2631) );
  BUFX3TS U790 ( .A(n2616), .Y(n2627) );
  BUFX3TS U791 ( .A(n2613), .Y(n2603) );
  CLKBUFX2TS U792 ( .A(n1822), .Y(n1740) );
  BUFX3TS U793 ( .A(n2615), .Y(n2609) );
  BUFX3TS U794 ( .A(n2611), .Y(n2602) );
  BUFX3TS U795 ( .A(n2615), .Y(n2606) );
  BUFX3TS U796 ( .A(n2616), .Y(n2601) );
  BUFX3TS U797 ( .A(n1737), .Y(n2600) );
  BUFX3TS U798 ( .A(n1738), .Y(n2623) );
  BUFX3TS U799 ( .A(n2612), .Y(n2639) );
  BUFX3TS U800 ( .A(n2611), .Y(n2638) );
  BUFX3TS U801 ( .A(n2616), .Y(n2637) );
  BUFX3TS U802 ( .A(n1737), .Y(n2636) );
  BUFX3TS U803 ( .A(n1623), .Y(n2634) );
  BUFX3TS U804 ( .A(n1623), .Y(n2633) );
  BUFX3TS U805 ( .A(n2613), .Y(n2635) );
  CLKXOR2X2TS U806 ( .A(intDY_EWSW[31]), .B(intAS), .Y(n1801) );
  BUFX3TS U807 ( .A(n2360), .Y(n2306) );
  NOR2X1TS U808 ( .A(Raw_mant_NRM_SWR[9]), .B(Raw_mant_NRM_SWR[8]), .Y(n1753)
         );
  NOR2X1TS U809 ( .A(Raw_mant_NRM_SWR[19]), .B(Raw_mant_NRM_SWR[20]), .Y(n1742) );
  NAND2X2TS U810 ( .A(n2547), .B(n1742), .Y(n2076) );
  NOR2X2TS U811 ( .A(Raw_mant_NRM_SWR[25]), .B(Raw_mant_NRM_SWR[24]), .Y(n2208) );
  INVX2TS U812 ( .A(n2208), .Y(n1744) );
  INVX2TS U813 ( .A(n2202), .Y(n1743) );
  NOR2X4TS U814 ( .A(n1744), .B(n1743), .Y(n2077) );
  NOR2X4TS U815 ( .A(n2076), .B(n1745), .Y(n2215) );
  NAND2X4TS U816 ( .A(n2546), .B(n2215), .Y(n2205) );
  OR2X2TS U817 ( .A(Raw_mant_NRM_SWR[15]), .B(Raw_mant_NRM_SWR[17]), .Y(n2204)
         );
  NOR3X2TS U818 ( .A(n2204), .B(Raw_mant_NRM_SWR[16]), .C(Raw_mant_NRM_SWR[14]), .Y(n2068) );
  NAND2X4TS U819 ( .A(n1746), .B(n2068), .Y(n2063) );
  NOR2X4TS U820 ( .A(n2063), .B(Raw_mant_NRM_SWR[13]), .Y(n2221) );
  NAND2X4TS U821 ( .A(n1753), .B(n1747), .Y(n1748) );
  OA21X4TS U822 ( .A0(Raw_mant_NRM_SWR[3]), .A1(Raw_mant_NRM_SWR[2]), .B0(
        n2080), .Y(n1750) );
  OAI31X1TS U823 ( .A0(Raw_mant_NRM_SWR[7]), .A1(n1750), .A2(
        Raw_mant_NRM_SWR[6]), .B0(n1749), .Y(n2211) );
  AOI21X1TS U824 ( .A0(Raw_mant_NRM_SWR[5]), .A1(n2220), .B0(n1754), .Y(n2113)
         );
  OAI22X1TS U825 ( .A0(n1491), .A1(n1622), .B0(n1465), .B1(intDY_EWSW[30]), 
        .Y(n1800) );
  AOI22X1TS U826 ( .A0(n1464), .A1(intDY_EWSW[27]), .B0(n73), .B1(n2555), .Y(
        n1795) );
  OAI2BB1X1TS U827 ( .A0N(n2564), .A1N(n1440), .B0(n1467), .Y(n1756) );
  OAI22X1TS U828 ( .A0(n1440), .A1(n2564), .B0(n1439), .B1(n1756), .Y(n1794)
         );
  AOI21X1TS U829 ( .A0(intDY_EWSW[23]), .A1(n1477), .B0(n1757), .Y(n1789) );
  OAI22X1TS U830 ( .A0(n1461), .A1(intDY_EWSW[20]), .B0(intDY_EWSW[21]), .B1(
        n1458), .Y(n1788) );
  AOI211X1TS U831 ( .A0(n1477), .A1(intDY_EWSW[23]), .B0(n1487), .C0(
        intDY_EWSW[22]), .Y(n1787) );
  AOI22X1TS U832 ( .A0(intDY_EWSW[19]), .A1(n1485), .B0(n1438), .B1(
        intDY_EWSW[16]), .Y(n1802) );
  AOI22X1TS U833 ( .A0(intDY_EWSW[4]), .A1(n1434), .B0(intDY_EWSW[5]), .B1(
        n1433), .Y(n1803) );
  OAI22X1TS U834 ( .A0(intDY_EWSW[4]), .A1(n1434), .B0(intDY_EWSW[5]), .B1(
        n1433), .Y(n1761) );
  NAND2X1TS U835 ( .A(intDY_EWSW[5]), .B(n1433), .Y(n1760) );
  AOI22X2TS U836 ( .A0(n1762), .A1(n1803), .B0(n1761), .B1(n1760), .Y(n1763)
         );
  OAI22X2TS U837 ( .A0(intDY_EWSW[6]), .A1(n1435), .B0(n1763), .B1(n1807), .Y(
        n1764) );
  AOI22X2TS U838 ( .A0(intDX_EWSW[7]), .A1(n1459), .B0(n1764), .B1(n1814), .Y(
        n1766) );
  AOI22X1TS U839 ( .A0(n1437), .A1(intDY_EWSW[10]), .B0(n1489), .B1(
        intDY_EWSW[11]), .Y(n1771) );
  NAND2X1TS U840 ( .A(n1488), .B(intDY_EWSW[9]), .Y(n1765) );
  OAI211X1TS U841 ( .A0(n2554), .A1(n2536), .B0(n1771), .C0(n1765), .Y(n1811)
         );
  INVX2TS U842 ( .A(n1774), .Y(n1769) );
  OAI22X1TS U843 ( .A0(n1456), .A1(intDY_EWSW[13]), .B0(intDY_EWSW[12]), .B1(
        n1462), .Y(n1767) );
  OAI2BB1X1TS U844 ( .A0N(intDY_EWSW[13]), .A1N(n1456), .B0(n1767), .Y(n1768)
         );
  OAI22X1TS U845 ( .A0(intDY_EWSW[14]), .A1(n1486), .B0(n1769), .B1(n1768), 
        .Y(n1770) );
  OAI22X1TS U846 ( .A0(n1488), .A1(intDY_EWSW[9]), .B0(n1437), .B1(
        intDY_EWSW[10]), .Y(n1772) );
  AOI22X1TS U847 ( .A0(n1456), .A1(intDY_EWSW[13]), .B0(intDY_EWSW[12]), .B1(
        n1462), .Y(n1776) );
  AOI32X1TS U848 ( .A0(n1779), .A1(n1778), .A2(n1777), .B0(n1812), .B1(n1778), 
        .Y(n1784) );
  OAI22X1TS U849 ( .A0(n1438), .A1(intDY_EWSW[16]), .B0(intDY_EWSW[17]), .B1(
        n1490), .Y(n1780) );
  OAI22X1TS U850 ( .A0(intDY_EWSW[19]), .A1(n1485), .B0(n1782), .B1(n1781), 
        .Y(n1783) );
  AOI31X1TS U851 ( .A0(n1808), .A1(n1802), .A2(n1784), .B0(n1783), .Y(n1785)
         );
  OAI2BB1X1TS U852 ( .A0N(n1461), .A1N(intDY_EWSW[20]), .B0(n1789), .Y(n1806)
         );
  AOI211X2TS U853 ( .A0(n1789), .A1(n1788), .B0(n1787), .C0(n1786), .Y(n1791)
         );
  NAND2X1TS U854 ( .A(n1440), .B(n2564), .Y(n1790) );
  OAI211X1TS U855 ( .A0(n1467), .A1(n2567), .B0(n1795), .C0(n1790), .Y(n1810)
         );
  OAI22X2TS U856 ( .A0(n1791), .A1(n1810), .B0(n1464), .B1(intDY_EWSW[27]), 
        .Y(n1792) );
  AOI211X2TS U857 ( .A0(n1795), .A1(n1794), .B0(n1793), .C0(n1792), .Y(n1796)
         );
  AOI211X2TS U858 ( .A0(n1432), .A1(intDY_EWSW[28]), .B0(n1796), .C0(n1805), 
        .Y(n1799) );
  INVX2TS U859 ( .A(n1801), .Y(n1820) );
  AOI211X1TS U860 ( .A0(n1455), .A1(intDY_EWSW[3]), .B0(n1807), .C0(n1806), 
        .Y(n1816) );
  OAI2BB1X1TS U861 ( .A0N(intDY_EWSW[0]), .A1N(n1460), .B0(n1808), .Y(n1809)
         );
  NOR4X1TS U862 ( .A(n1812), .B(n1811), .C(n1810), .D(n1809), .Y(n1815) );
  NAND2X1TS U863 ( .A(n1432), .B(intDY_EWSW[28]), .Y(n1813) );
  OAI32X1TS U864 ( .A0(intDX_EWSW[31]), .A1(n1818), .A2(n1817), .B0(n2164), 
        .B1(intDX_EWSW[31]), .Y(n1819) );
  AOI211X1TS U865 ( .A0(n2164), .A1(n1820), .B0(n1616), .C0(n1819), .Y(n1821)
         );
  BUFX3TS U866 ( .A(n1822), .Y(n2612) );
  BUFX3TS U867 ( .A(n1822), .Y(n2613) );
  BUFX3TS U868 ( .A(n1822), .Y(n2611) );
  BUFX3TS U869 ( .A(n1822), .Y(n2615) );
  CLKBUFX3TS U870 ( .A(n1822), .Y(n2616) );
  XOR2X1TS U871 ( .A(DmP_mant_SFG_SWR[0]), .B(n1469), .Y(n1824) );
  INVX2TS U872 ( .A(n2497), .Y(n2503) );
  CLKBUFX2TS U873 ( .A(n2332), .Y(n2499) );
  OA22X1TS U874 ( .A0(n2499), .A1(n1469), .B0(n1627), .B1(n1452), .Y(n1823) );
  NAND2X1TS U875 ( .A(n1827), .B(n1826), .Y(n1901) );
  NAND2X1TS U876 ( .A(n1902), .B(n1828), .Y(n1831) );
  XNOR2X1TS U877 ( .A(n1901), .B(n1831), .Y(n1835) );
  OAI2BB1X1TS U878 ( .A0N(n1854), .A1N(n1855), .B0(n1853), .Y(n1832) );
  XOR2X1TS U879 ( .A(n1832), .B(n1831), .Y(n1833) );
  BUFX3TS U880 ( .A(n2463), .Y(n2433) );
  AOI22X1TS U881 ( .A0(n1833), .A1(n2322), .B0(Raw_mant_NRM_SWR[13]), .B1(
        n2433), .Y(n1834) );
  NAND2X1TS U882 ( .A(n1837), .B(n1836), .Y(n1911) );
  INVX2TS U883 ( .A(n1838), .Y(n1840) );
  OA21XLTS U884 ( .A0(n1911), .A1(n1840), .B0(n1839), .Y(n1844) );
  AOI22X1TS U885 ( .A0(n1844), .A1(n2336), .B0(n2322), .B1(n1843), .Y(n1848)
         );
  NAND2X1TS U886 ( .A(n1842), .B(n1841), .Y(n1847) );
  OAI22X1TS U887 ( .A0(n1844), .A1(n2333), .B0(n1843), .B1(n2499), .Y(n1845)
         );
  AOI22X1TS U888 ( .A0(n1845), .A1(n1847), .B0(Raw_mant_NRM_SWR[10]), .B1(
        n2433), .Y(n1846) );
  INVX2TS U889 ( .A(n1849), .Y(n1851) );
  OA21XLTS U890 ( .A0(n1852), .A1(n1851), .B0(n1850), .Y(n1856) );
  AOI22X1TS U891 ( .A0(n1856), .A1(n2497), .B0(n2501), .B1(n1855), .Y(n1860)
         );
  NAND2X1TS U892 ( .A(n1854), .B(n1853), .Y(n1859) );
  OAI22X1TS U893 ( .A0(n1856), .A1(n2333), .B0(n1855), .B1(n2332), .Y(n1857)
         );
  AOI22X1TS U894 ( .A0(n1857), .A1(n1859), .B0(Raw_mant_NRM_SWR[12]), .B1(
        n2433), .Y(n1858) );
  INVX2TS U895 ( .A(n1863), .Y(n1864) );
  AOI21X1TS U896 ( .A0(n1970), .A1(n1865), .B0(n1864), .Y(n1874) );
  INVX2TS U897 ( .A(n1866), .Y(n1868) );
  OAI2BB1X1TS U898 ( .A0N(n1871), .A1N(n1997), .B0(n1870), .Y(n1969) );
  AOI22X1TS U899 ( .A0(n1874), .A1(n2336), .B0(n2501), .B1(n1915), .Y(n1878)
         );
  NAND2X1TS U900 ( .A(n1913), .B(n1912), .Y(n1877) );
  OAI22X1TS U901 ( .A0(n1874), .A1(n2333), .B0(n1915), .B1(n2431), .Y(n1875)
         );
  AOI22X1TS U902 ( .A0(n1875), .A1(n1877), .B0(Raw_mant_NRM_SWR[8]), .B1(n2433), .Y(n1876) );
  NAND3X1TS U903 ( .A(n1613), .B(shift_value_SHT2_EWR[2]), .C(
        shift_value_SHT2_EWR[3]), .Y(n1922) );
  NAND2X2TS U904 ( .A(shift_value_SHT2_EWR[2]), .B(n2572), .Y(n1976) );
  NAND3X1TS U905 ( .A(n2539), .B(n1613), .C(shift_value_SHT2_EWR[3]), .Y(n1895) );
  INVX2TS U906 ( .A(n1895), .Y(n1879) );
  AOI22X1TS U907 ( .A0(Data_array_SWR[14]), .A1(n1608), .B0(Data_array_SWR[18]), .B1(n1635), .Y(n1880) );
  NAND2X2TS U908 ( .A(n2539), .B(n2572), .Y(n1977) );
  NOR2X4TS U909 ( .A(n1493), .B(n1613), .Y(n2424) );
  AOI21X1TS U910 ( .A0(n1611), .A1(Data_array_SWR[10]), .B0(n2424), .Y(n1882)
         );
  INVX2TS U911 ( .A(n1884), .Y(n2107) );
  AOI22X1TS U912 ( .A0(Data_array_SWR[19]), .A1(n1608), .B0(Data_array_SWR[15]), .B1(n1881), .Y(n1885) );
  NOR2X1TS U913 ( .A(n2424), .B(n1981), .Y(n1893) );
  BUFX3TS U914 ( .A(n2464), .Y(n2470) );
  AOI22X1TS U915 ( .A0(n2105), .A1(n1886), .B0(n2591), .B1(n2470), .Y(n1887)
         );
  AOI22X1TS U916 ( .A0(n2105), .A1(n1588), .B0(n2593), .B1(n2464), .Y(n1888)
         );
  AOI22X1TS U917 ( .A0(Data_array_SWR[19]), .A1(n1635), .B0(Data_array_SWR[15]), .B1(n1607), .Y(n1889) );
  AOI21X1TS U918 ( .A0(n1881), .A1(Data_array_SWR[11]), .B0(n2424), .Y(n1890)
         );
  INVX2TS U919 ( .A(n1892), .Y(n2110) );
  AOI22X1TS U920 ( .A0(Data_array_SWR[14]), .A1(n1611), .B0(Data_array_SWR[18]), .B1(n1608), .Y(n1894) );
  AOI22X1TS U921 ( .A0(n2108), .A1(n1886), .B0(n2584), .B1(n2470), .Y(n1896)
         );
  AOI22X1TS U922 ( .A0(n2108), .A1(n1588), .B0(n2592), .B1(n2464), .Y(n1897)
         );
  INVX2TS U923 ( .A(n1898), .Y(n1900) );
  OA21XLTS U924 ( .A0(n1901), .A1(n1900), .B0(n1899), .Y(n1904) );
  AOI22X1TS U925 ( .A0(n1904), .A1(n2336), .B0(n2501), .B1(n2007), .Y(n1908)
         );
  NAND2X1TS U926 ( .A(n2008), .B(n2006), .Y(n1907) );
  OAI22X1TS U927 ( .A0(n1904), .A1(n2333), .B0(n2007), .B1(n2499), .Y(n1905)
         );
  AOI22X1TS U928 ( .A0(n1905), .A1(n1907), .B0(Raw_mant_NRM_SWR[14]), .B1(
        n2523), .Y(n1906) );
  NAND2X1TS U929 ( .A(n1910), .B(n1909), .Y(n1916) );
  XNOR2X1TS U930 ( .A(n1911), .B(n1916), .Y(n1920) );
  INVX2TS U931 ( .A(n1912), .Y(n1914) );
  XNOR2X1TS U932 ( .A(n1917), .B(n1916), .Y(n1918) );
  AOI22X1TS U933 ( .A0(n1918), .A1(n2501), .B0(Raw_mant_NRM_SWR[9]), .B1(n2523), .Y(n1919) );
  INVX2TS U934 ( .A(n1977), .Y(n1987) );
  OAI21X1TS U935 ( .A0(n1495), .A1(n1976), .B0(n1955), .Y(n1921) );
  AOI21X2TS U936 ( .A0(n1987), .A1(Data_array_SWR[19]), .B0(n1921), .Y(n2155)
         );
  AOI22X1TS U937 ( .A0(Data_array_SWR[3]), .A1(n1610), .B0(Data_array_SWR[11]), 
        .B1(n1879), .Y(n1925) );
  INVX2TS U938 ( .A(n1922), .Y(n1923) );
  AOI22X1TS U939 ( .A0(Data_array_SWR[7]), .A1(n1607), .B0(Data_array_SWR[15]), 
        .B1(n1923), .Y(n1924) );
  NAND2X2TS U940 ( .A(n1588), .B(n2642), .Y(n1967) );
  NAND2X2TS U941 ( .A(n1926), .B(n1985), .Y(n2133) );
  INVX2TS U942 ( .A(n2465), .Y(n2427) );
  INVX2TS U943 ( .A(n2427), .Y(n2029) );
  OA22X1TS U944 ( .A0(n1967), .A1(n2133), .B0(n1517), .B1(n2029), .Y(n1927) );
  NAND2X1TS U945 ( .A(shift_value_SHT2_EWR[3]), .B(n2539), .Y(n1975) );
  OAI22X1TS U946 ( .A0(n1496), .A1(n1975), .B0(n2585), .B1(n1976), .Y(n1929)
         );
  INVX2TS U947 ( .A(n2015), .Y(n2149) );
  AOI22X1TS U948 ( .A0(Data_array_SWR[13]), .A1(n1593), .B0(Data_array_SWR[5]), 
        .B1(n1608), .Y(n1932) );
  AOI22X1TS U949 ( .A0(Data_array_SWR[1]), .A1(n1611), .B0(Data_array_SWR[9]), 
        .B1(n1635), .Y(n1931) );
  OAI211X1TS U950 ( .A0(n2149), .A1(n2642), .B0(n1932), .C0(n1931), .Y(n2118)
         );
  INVX2TS U951 ( .A(n2118), .Y(n2020) );
  NAND2X1TS U952 ( .A(n1933), .B(n1985), .Y(n2120) );
  INVX2TS U953 ( .A(n2427), .Y(n2471) );
  OA22X1TS U954 ( .A0(n1967), .A1(n2120), .B0(n1516), .B1(n2471), .Y(n1934) );
  OAI21X1TS U955 ( .A0(n1976), .A1(n2587), .B0(n1955), .Y(n1935) );
  AOI21X2TS U956 ( .A0(n1987), .A1(Data_array_SWR[20]), .B0(n1935), .Y(n2139)
         );
  AOI22X1TS U957 ( .A0(Data_array_SWR[16]), .A1(n1593), .B0(Data_array_SWR[8]), 
        .B1(n1608), .Y(n1937) );
  AOI22X1TS U958 ( .A0(Data_array_SWR[4]), .A1(n1611), .B0(Data_array_SWR[12]), 
        .B1(n1635), .Y(n1936) );
  INVX2TS U959 ( .A(n2134), .Y(n2028) );
  AOI21X2TS U960 ( .A0(n1987), .A1(Data_array_SWR[21]), .B0(n1938), .Y(n2136)
         );
  OA22X1TS U961 ( .A0(n2136), .A1(n1967), .B0(n1505), .B1(n2029), .Y(n1939) );
  AOI22X1TS U962 ( .A0(Data_array_SWR[13]), .A1(n1635), .B0(Data_array_SWR[5]), 
        .B1(n1611), .Y(n1941) );
  AOI22X1TS U963 ( .A0(Data_array_SWR[9]), .A1(n1608), .B0(Data_array_SWR[17]), 
        .B1(n1593), .Y(n1940) );
  INVX2TS U964 ( .A(n2137), .Y(n2026) );
  OA22X1TS U965 ( .A0(n2139), .A1(n1967), .B0(n1518), .B1(n2029), .Y(n1942) );
  OAI2BB1X1TS U966 ( .A0N(n1946), .A1N(n2504), .B0(n1945), .Y(n1951) );
  NAND2X1TS U967 ( .A(n1951), .B(n2497), .Y(n1947) );
  XOR2X1TS U968 ( .A(n1503), .B(DMP_SFG[2]), .Y(n1948) );
  AOI21X1TS U969 ( .A0(n1949), .A1(n2501), .B0(n1948), .Y(n1950) );
  NAND2X1TS U970 ( .A(n1953), .B(n1952), .Y(n1954) );
  OAI21X1TS U971 ( .A0(n1494), .A1(n1976), .B0(n1955), .Y(n1956) );
  AOI21X2TS U972 ( .A0(n1987), .A1(Data_array_SWR[18]), .B0(n1956), .Y(n2142)
         );
  AOI22X1TS U973 ( .A0(Data_array_SWR[10]), .A1(n1635), .B0(Data_array_SWR[2]), 
        .B1(n1611), .Y(n1958) );
  AOI22X1TS U974 ( .A0(Data_array_SWR[14]), .A1(n1593), .B0(Data_array_SWR[6]), 
        .B1(n1608), .Y(n1957) );
  INVX2TS U975 ( .A(n2125), .Y(n2023) );
  INVX2TS U976 ( .A(n1967), .Y(n2039) );
  NAND2X2TS U977 ( .A(n1959), .B(n1985), .Y(n2127) );
  INVX2TS U978 ( .A(n2127), .Y(n1960) );
  AOI22X1TS U979 ( .A0(n2039), .A1(n1960), .B0(n2578), .B1(n2464), .Y(n1961)
         );
  AOI22X1TS U980 ( .A0(Data_array_SWR[14]), .A1(n1879), .B0(Data_array_SWR[6]), 
        .B1(n1610), .Y(n1963) );
  AOI22X1TS U981 ( .A0(Data_array_SWR[10]), .A1(n1607), .B0(Data_array_SWR[18]), .B1(n1593), .Y(n1962) );
  OA22X1TS U982 ( .A0(n2155), .A1(n1967), .B0(n1506), .B1(n2029), .Y(n1964) );
  AOI22X1TS U983 ( .A0(Data_array_SWR[19]), .A1(n1593), .B0(Data_array_SWR[11]), .B1(n1608), .Y(n1966) );
  AOI22X1TS U984 ( .A0(Data_array_SWR[7]), .A1(n1611), .B0(Data_array_SWR[15]), 
        .B1(n1635), .Y(n1965) );
  INVX2TS U985 ( .A(n2140), .Y(n2032) );
  OA22X1TS U986 ( .A0(n2142), .A1(n1967), .B0(n1519), .B1(n2029), .Y(n1968) );
  XOR2X1TS U987 ( .A(n1512), .B(n2551), .Y(n1973) );
  OAI2BB2XLTS U988 ( .B0(n1970), .B1(n2325), .A0N(n2335), .A1N(n1969), .Y(
        n1971) );
  AOI22X1TS U989 ( .A0(n1971), .A1(n1973), .B0(Raw_mant_NRM_SWR[7]), .B1(n2433), .Y(n1972) );
  OAI22X1TS U990 ( .A0(n2581), .A1(n1976), .B0(n2587), .B1(n1975), .Y(n1979)
         );
  INVX2TS U991 ( .A(n2044), .Y(n2145) );
  AOI22X1TS U992 ( .A0(Data_array_SWR[4]), .A1(n1608), .B0(Data_array_SWR[0]), 
        .B1(n1611), .Y(n1983) );
  AOI22X1TS U993 ( .A0(Data_array_SWR[8]), .A1(n1635), .B0(Data_array_SWR[12]), 
        .B1(n1593), .Y(n1982) );
  OAI211X1TS U994 ( .A0(n2145), .A1(n2642), .B0(n1983), .C0(n1982), .Y(n1984)
         );
  INVX2TS U995 ( .A(n1984), .Y(n2018) );
  INVX2TS U996 ( .A(n1985), .Y(n1986) );
  AOI22X1TS U997 ( .A0(n2033), .A1(n2039), .B0(DmP_mant_SFG_SWR[25]), .B1(
        n2427), .Y(n1988) );
  AOI22X1TS U998 ( .A0(Data_array_SWR[8]), .A1(n1611), .B0(Data_array_SWR[12]), 
        .B1(n1607), .Y(n1990) );
  AOI22X1TS U999 ( .A0(Data_array_SWR[20]), .A1(n1593), .B0(Data_array_SWR[16]), .B1(n1635), .Y(n1989) );
  AOI21X1TS U1000 ( .A0(n2015), .A1(n2039), .B0(n1991), .Y(n1992) );
  INVX2TS U1001 ( .A(n1993), .Y(n1995) );
  OAI21X1TS U1002 ( .A0(n1996), .A1(n1995), .B0(n1994), .Y(n1998) );
  XOR2X1TS U1003 ( .A(n1502), .B(n2548), .Y(n2001) );
  INVX2TS U1004 ( .A(n2431), .Y(n2335) );
  OAI2BB2XLTS U1005 ( .B0(n1998), .B1(n2325), .A0N(n2335), .A1N(n1997), .Y(
        n1999) );
  AOI22X1TS U1006 ( .A0(n1999), .A1(n2001), .B0(Raw_mant_NRM_SWR[6]), .B1(
        n2433), .Y(n2000) );
  NAND2X1TS U1007 ( .A(n2004), .B(n2003), .Y(n2009) );
  XNOR2X1TS U1008 ( .A(n2005), .B(n2009), .Y(n2013) );
  OAI2BB1X1TS U1009 ( .A0N(n2008), .A1N(n2007), .B0(n2006), .Y(n2010) );
  XOR2X1TS U1010 ( .A(n2010), .B(n2009), .Y(n2011) );
  AOI22X1TS U1011 ( .A0(n2011), .A1(n2335), .B0(Raw_mant_NRM_SWR[15]), .B1(
        n2523), .Y(n2012) );
  NAND2X2TS U1012 ( .A(n1886), .B(n1614), .Y(n2030) );
  INVX2TS U1013 ( .A(n2030), .Y(n2043) );
  AOI21X1TS U1014 ( .A0(n2015), .A1(n2043), .B0(n2014), .Y(n2016) );
  AOI22X1TS U1015 ( .A0(n2033), .A1(n2043), .B0(DmP_mant_SFG_SWR[0]), .B1(
        n2427), .Y(n2017) );
  OA22X1TS U1016 ( .A0(n2030), .A1(n2120), .B0(n1469), .B1(n2471), .Y(n2019)
         );
  OA22X1TS U1017 ( .A0(n2030), .A1(n2133), .B0(n1514), .B1(n2029), .Y(n2021)
         );
  OA22X1TS U1018 ( .A0(n2030), .A1(n2127), .B0(n1515), .B1(n2471), .Y(n2022)
         );
  OA22X1TS U1019 ( .A0(n2155), .A1(n2030), .B0(n1502), .B1(n2029), .Y(n2024)
         );
  OA22X1TS U1020 ( .A0(n2139), .A1(n2030), .B0(n1513), .B1(n2029), .Y(n2025)
         );
  OA22X1TS U1021 ( .A0(n2136), .A1(n2030), .B0(n1503), .B1(n2029), .Y(n2027)
         );
  OA22X1TS U1022 ( .A0(n2142), .A1(n2030), .B0(n1512), .B1(n2029), .Y(n2031)
         );
  AOI22X1TS U1023 ( .A0(Data_array_SWR[13]), .A1(n1608), .B0(Data_array_SWR[9]), .B1(n1881), .Y(n2035) );
  AOI22X1TS U1024 ( .A0(Data_array_SWR[21]), .A1(n1593), .B0(
        Data_array_SWR[17]), .B1(n1879), .Y(n2034) );
  INVX2TS U1025 ( .A(n2143), .Y(n2046) );
  AOI21X1TS U1026 ( .A0(n2044), .A1(n2039), .B0(n2038), .Y(n2040) );
  AOI21X1TS U1027 ( .A0(n2044), .A1(n2043), .B0(n2042), .Y(n2045) );
  NAND2X1TS U1028 ( .A(n2048), .B(n2047), .Y(n2050) );
  XOR2X1TS U1029 ( .A(n2049), .B(n2050), .Y(n2054) );
  XNOR2X1TS U1030 ( .A(n2051), .B(n2050), .Y(n2052) );
  AOI22X1TS U1031 ( .A0(n2052), .A1(n2335), .B0(Raw_mant_NRM_SWR[17]), .B1(
        n2523), .Y(n2053) );
  OAI2BB2XLTS U1032 ( .B0(n2058), .B1(n2325), .A0N(n2322), .A1N(n2057), .Y(
        n2059) );
  AOI22X1TS U1033 ( .A0(n2059), .A1(n2061), .B0(Raw_mant_NRM_SWR[18]), .B1(
        n2433), .Y(n2060) );
  INVX2TS U1034 ( .A(n2313), .Y(n2299) );
  AOI2BB1X1TS U1035 ( .A0N(Raw_mant_NRM_SWR[13]), .A1N(Raw_mant_NRM_SWR[11]), 
        .B0(n2063), .Y(n2075) );
  INVX2TS U1036 ( .A(n2072), .Y(n2066) );
  OAI211X1TS U1037 ( .A0(n2068), .A1(n2205), .B0(n2067), .C0(n2066), .Y(n2438)
         );
  AOI22X1TS U1038 ( .A0(n2359), .A1(n2438), .B0(n2069), .B1(
        Shift_amount_SHT1_EWR[3]), .Y(n2070) );
  AOI21X1TS U1039 ( .A0(n1452), .A1(n2542), .B0(Raw_mant_NRM_SWR[2]), .Y(n2071) );
  OAI21X1TS U1040 ( .A0(Raw_mant_NRM_SWR[3]), .A1(n2071), .B0(n2535), .Y(n2073) );
  AOI21X1TS U1041 ( .A0(n2077), .A1(n2076), .B0(n2075), .Y(n2078) );
  AOI21X1TS U1042 ( .A0(Raw_mant_NRM_SWR[3]), .A1(n2080), .B0(n2079), .Y(n2437) );
  BUFX3TS U1043 ( .A(busy), .Y(n2466) );
  OAI221XLTS U1044 ( .A0(n2521), .A1(Shift_amount_SHT1_EWR[2]), .B0(n2466), 
        .B1(shift_value_SHT2_EWR[2]), .C0(n2468), .Y(n2081) );
  NAND2X1TS U1045 ( .A(n2083), .B(n2082), .Y(n2085) );
  XNOR2X1TS U1046 ( .A(n2084), .B(n2085), .Y(n2089) );
  XNOR2X1TS U1047 ( .A(n2086), .B(n2085), .Y(n2087) );
  AOI22X1TS U1048 ( .A0(n2087), .A1(n2322), .B0(Raw_mant_NRM_SWR[19]), .B1(
        n2433), .Y(n2088) );
  NOR4X2TS U1049 ( .A(exp_rslt_NRM2_EW1[0]), .B(exp_rslt_NRM2_EW1[6]), .C(
        exp_rslt_NRM2_EW1[5]), .D(exp_rslt_NRM2_EW1[2]), .Y(n2091) );
  NOR4BBX4TS U1050 ( .AN(n2091), .BN(n2090), .C(exp_rslt_NRM2_EW1[3]), .D(
        exp_rslt_NRM2_EW1[4]), .Y(n2102) );
  OAI32X1TS U1051 ( .A0(exp_rslt_NRM2_EW1[4]), .A1(n2525), .A2(n1638), .B0(
        final_result_ieee[27]), .B1(Shift_reg_FLAGS_7[0]), .Y(n2092) );
  INVX2TS U1052 ( .A(n2092), .Y(n823) );
  OAI32X1TS U1053 ( .A0(exp_rslt_NRM2_EW1[1]), .A1(n2525), .A2(n1639), .B0(
        final_result_ieee[24]), .B1(Shift_reg_FLAGS_7[0]), .Y(n2093) );
  INVX2TS U1054 ( .A(n2093), .Y(n826) );
  OAI32X1TS U1055 ( .A0(exp_rslt_NRM2_EW1[5]), .A1(n2525), .A2(n2102), .B0(
        final_result_ieee[28]), .B1(Shift_reg_FLAGS_7[0]), .Y(n2094) );
  INVX2TS U1056 ( .A(n2094), .Y(n822) );
  OAI32X1TS U1057 ( .A0(exp_rslt_NRM2_EW1[0]), .A1(n2525), .A2(n1638), .B0(
        final_result_ieee[23]), .B1(Shift_reg_FLAGS_7[0]), .Y(n2095) );
  INVX2TS U1058 ( .A(n2095), .Y(n827) );
  INVX2TS U1059 ( .A(n2096), .Y(n821) );
  INVX2TS U1060 ( .A(n2097), .Y(n824) );
  INVX2TS U1061 ( .A(n2098), .Y(n825) );
  AOI31X4TS U1062 ( .A0(exp_rslt_NRM2_EW1[3]), .A1(exp_rslt_NRM2_EW1[4]), .A2(
        n2101), .B0(n2525), .Y(n2516) );
  BUFX3TS U1063 ( .A(n2596), .Y(n2146) );
  AOI22X1TS U1064 ( .A0(n1603), .A1(n2105), .B0(final_result_ieee[8]), .B1(
        n2146), .Y(n2103) );
  AOI22X1TS U1065 ( .A0(n1603), .A1(n2108), .B0(final_result_ieee[9]), .B1(
        n2146), .Y(n2104) );
  AOI22X1TS U1066 ( .A0(n1597), .A1(n2105), .B0(final_result_ieee[13]), .B1(
        n2146), .Y(n2106) );
  AOI22X1TS U1067 ( .A0(n1597), .A1(n2108), .B0(final_result_ieee[12]), .B1(
        n2146), .Y(n2109) );
  BUFX3TS U1068 ( .A(n2596), .Y(n2150) );
  AOI22X1TS U1069 ( .A0(n1596), .A1(n2125), .B0(final_result_ieee[0]), .B1(
        n2150), .Y(n2111) );
  AOI22X1TS U1070 ( .A0(n1596), .A1(n1632), .B0(final_result_ieee[1]), .B1(
        n2150), .Y(n2112) );
  BUFX3TS U1071 ( .A(n2454), .Y(n2526) );
  BUFX3TS U1072 ( .A(busy), .Y(n2472) );
  OAI32X1TS U1073 ( .A0(n2313), .A1(n2535), .A2(n2114), .B0(n2113), .B1(n2313), 
        .Y(n2115) );
  NAND2X4TS U1074 ( .A(n1596), .B(n2642), .Y(n2132) );
  AOI22X1TS U1075 ( .A0(n1602), .A1(n2134), .B0(final_result_ieee[19]), .B1(
        n2150), .Y(n2117) );
  NAND2X4TS U1076 ( .A(n2424), .B(n1596), .Y(n2130) );
  OAI211X1TS U1077 ( .A0(n2136), .A1(n2132), .B0(n2117), .C0(n2130), .Y(n563)
         );
  AOI22X1TS U1078 ( .A0(n1602), .A1(n2118), .B0(final_result_ieee[22]), .B1(
        n2146), .Y(n2119) );
  OAI211X1TS U1079 ( .A0(n2120), .A1(n2132), .B0(n2119), .C0(n2130), .Y(n560)
         );
  AOI22X1TS U1080 ( .A0(n1602), .A1(n1630), .B0(final_result_ieee[17]), .B1(
        n2150), .Y(n2121) );
  OAI211X1TS U1081 ( .A0(n2155), .A1(n2132), .B0(n2121), .C0(n2130), .Y(n565)
         );
  AOI22X1TS U1082 ( .A0(n1603), .A1(n2143), .B0(final_result_ieee[14]), .B1(
        n2150), .Y(n2122) );
  OAI211X1TS U1083 ( .A0(n2145), .A1(n2132), .B0(n2122), .C0(n2130), .Y(n568)
         );
  AOI22X1TS U1084 ( .A0(n1603), .A1(n1634), .B0(final_result_ieee[15]), .B1(
        n2146), .Y(n2123) );
  OAI211X1TS U1085 ( .A0(n2149), .A1(n2132), .B0(n2123), .C0(n2130), .Y(n567)
         );
  AOI22X1TS U1086 ( .A0(n1603), .A1(n2137), .B0(final_result_ieee[18]), .B1(
        n2150), .Y(n2124) );
  OAI211X1TS U1087 ( .A0(n2139), .A1(n2132), .B0(n2124), .C0(n2130), .Y(n564)
         );
  AOI22X1TS U1088 ( .A0(n1603), .A1(n2125), .B0(final_result_ieee[21]), .B1(
        n2150), .Y(n2126) );
  OAI211X1TS U1089 ( .A0(n2127), .A1(n2132), .B0(n2126), .C0(n2130), .Y(n561)
         );
  AOI22X1TS U1090 ( .A0(n1603), .A1(n2140), .B0(final_result_ieee[16]), .B1(
        n2150), .Y(n2128) );
  OAI211X1TS U1091 ( .A0(n2142), .A1(n2132), .B0(n2128), .C0(n2130), .Y(n566)
         );
  AOI22X1TS U1092 ( .A0(n1602), .A1(n1632), .B0(final_result_ieee[20]), .B1(
        n2596), .Y(n2131) );
  OAI211X1TS U1093 ( .A0(n2133), .A1(n2132), .B0(n2131), .C0(n2130), .Y(n562)
         );
  AOI22X1TS U1094 ( .A0(n1596), .A1(n2134), .B0(final_result_ieee[2]), .B1(
        n2146), .Y(n2135) );
  AOI22X1TS U1095 ( .A0(n1597), .A1(n2137), .B0(final_result_ieee[3]), .B1(
        n2150), .Y(n2138) );
  AOI22X1TS U1096 ( .A0(n1597), .A1(n2140), .B0(final_result_ieee[5]), .B1(
        n2146), .Y(n2141) );
  AOI22X1TS U1097 ( .A0(n1597), .A1(n2143), .B0(final_result_ieee[7]), .B1(
        n2146), .Y(n2144) );
  AOI22X1TS U1098 ( .A0(n1597), .A1(n1634), .B0(final_result_ieee[6]), .B1(
        n2146), .Y(n2148) );
  AOI22X1TS U1099 ( .A0(n1597), .A1(n1630), .B0(final_result_ieee[4]), .B1(
        n2150), .Y(n2153) );
  NAND2X1TS U1100 ( .A(n2157), .B(n2156), .Y(n2159) );
  XOR2X1TS U1101 ( .A(n2158), .B(n2159), .Y(n2163) );
  XNOR2X1TS U1102 ( .A(n2160), .B(n2159), .Y(n2161) );
  AOI22X1TS U1103 ( .A0(n2161), .A1(n2335), .B0(Raw_mant_NRM_SWR[21]), .B1(
        n2433), .Y(n2162) );
  INVX4TS U1104 ( .A(n2195), .Y(n2251) );
  AOI22X1TS U1105 ( .A0(n2232), .A1(DmP_EXP_EWSW[1]), .B0(intDY_EWSW[1]), .B1(
        n2239), .Y(n2165) );
  AOI22X1TS U1106 ( .A0(n2232), .A1(DmP_EXP_EWSW[18]), .B0(intDY_EWSW[18]), 
        .B1(n2239), .Y(n2166) );
  AOI22X1TS U1107 ( .A0(n2232), .A1(DmP_EXP_EWSW[14]), .B0(intDY_EWSW[14]), 
        .B1(n2239), .Y(n2167) );
  BUFX4TS U1108 ( .A(n2239), .Y(n2198) );
  AOI22X1TS U1109 ( .A0(n2232), .A1(DmP_EXP_EWSW[11]), .B0(intDY_EWSW[11]), 
        .B1(n2198), .Y(n2168) );
  AOI22X1TS U1110 ( .A0(n2232), .A1(DmP_EXP_EWSW[13]), .B0(intDY_EWSW[13]), 
        .B1(n2198), .Y(n2169) );
  INVX4TS U1111 ( .A(n2195), .Y(n2246) );
  BUFX4TS U1112 ( .A(n2239), .Y(n2257) );
  AOI22X1TS U1113 ( .A0(n2254), .A1(DMP_EXP_EWSW[8]), .B0(n2257), .B1(n2554), 
        .Y(n2170) );
  INVX2TS U1114 ( .A(n2195), .Y(n2174) );
  AOI22X1TS U1115 ( .A0(n2232), .A1(DmP_EXP_EWSW[2]), .B0(intDY_EWSW[2]), .B1(
        n2239), .Y(n2171) );
  AOI22X1TS U1116 ( .A0(n2232), .A1(DmP_EXP_EWSW[16]), .B0(intDY_EWSW[16]), 
        .B1(n2239), .Y(n2172) );
  AOI22X1TS U1117 ( .A0(n2520), .A1(DmP_EXP_EWSW[9]), .B0(intDY_EWSW[9]), .B1(
        n2198), .Y(n2173) );
  AOI22X1TS U1118 ( .A0(n2254), .A1(DmP_EXP_EWSW[3]), .B0(intDY_EWSW[3]), .B1(
        n2257), .Y(n2175) );
  AOI22X1TS U1119 ( .A0(n2520), .A1(DmP_EXP_EWSW[27]), .B0(intDY_EWSW[27]), 
        .B1(n2257), .Y(n2176) );
  AOI22X1TS U1120 ( .A0(n2640), .A1(DMP_EXP_EWSW[7]), .B0(intDX_EWSW[7]), .B1(
        n2257), .Y(n2177) );
  AOI22X1TS U1121 ( .A0(n2640), .A1(DmP_EXP_EWSW[21]), .B0(intDY_EWSW[21]), 
        .B1(n2257), .Y(n2178) );
  AOI22X1TS U1122 ( .A0(n1616), .A1(DmP_EXP_EWSW[19]), .B0(intDY_EWSW[19]), 
        .B1(n2257), .Y(n2179) );
  INVX4TS U1123 ( .A(n2198), .Y(n2238) );
  AOI22X1TS U1124 ( .A0(n2254), .A1(DMP_EXP_EWSW[6]), .B0(intDY_EWSW[6]), .B1(
        n2227), .Y(n2180) );
  AOI22X1TS U1125 ( .A0(n2520), .A1(DmP_EXP_EWSW[7]), .B0(intDX_EWSW[7]), .B1(
        n2227), .Y(n2181) );
  AOI22X1TS U1126 ( .A0(n2640), .A1(DMP_EXP_EWSW[5]), .B0(intDY_EWSW[5]), .B1(
        n2227), .Y(n2182) );
  AOI22X1TS U1127 ( .A0(n1616), .A1(DMP_EXP_EWSW[10]), .B0(intDY_EWSW[10]), 
        .B1(n2200), .Y(n2183) );
  AOI22X1TS U1128 ( .A0(n1616), .A1(DMP_EXP_EWSW[16]), .B0(intDY_EWSW[16]), 
        .B1(n2200), .Y(n2184) );
  AOI22X1TS U1129 ( .A0(n2640), .A1(DMP_EXP_EWSW[28]), .B0(intDY_EWSW[28]), 
        .B1(n2227), .Y(n2185) );
  AOI22X1TS U1130 ( .A0(n2254), .A1(DMP_EXP_EWSW[20]), .B0(intDY_EWSW[20]), 
        .B1(n2227), .Y(n2186) );
  AOI22X1TS U1131 ( .A0(n2254), .A1(DMP_EXP_EWSW[21]), .B0(intDY_EWSW[21]), 
        .B1(n2227), .Y(n2187) );
  AOI22X1TS U1132 ( .A0(n1616), .A1(DMP_EXP_EWSW[30]), .B0(intDY_EWSW[30]), 
        .B1(n2195), .Y(n2188) );
  AOI22X1TS U1133 ( .A0(n2640), .A1(DMP_EXP_EWSW[11]), .B0(intDY_EWSW[11]), 
        .B1(n2200), .Y(n2189) );
  AOI22X1TS U1134 ( .A0(n2640), .A1(DMP_EXP_EWSW[18]), .B0(intDY_EWSW[18]), 
        .B1(n2200), .Y(n2190) );
  AOI22X1TS U1135 ( .A0(n2254), .A1(DMP_EXP_EWSW[22]), .B0(intDY_EWSW[22]), 
        .B1(n2195), .Y(n2191) );
  AOI22X1TS U1136 ( .A0(n1616), .A1(DMP_EXP_EWSW[12]), .B0(intDY_EWSW[12]), 
        .B1(n2200), .Y(n2192) );
  AOI22X1TS U1137 ( .A0(n2640), .A1(DMP_EXP_EWSW[14]), .B0(intDY_EWSW[14]), 
        .B1(n2200), .Y(n2193) );
  AOI22X1TS U1138 ( .A0(n2640), .A1(DMP_EXP_EWSW[17]), .B0(intDY_EWSW[17]), 
        .B1(n2200), .Y(n2194) );
  AOI22X1TS U1139 ( .A0(n2640), .A1(DMP_EXP_EWSW[19]), .B0(intDY_EWSW[19]), 
        .B1(n2195), .Y(n2196) );
  INVX4TS U1140 ( .A(n2257), .Y(n2530) );
  AOI22X1TS U1141 ( .A0(n1616), .A1(DMP_EXP_EWSW[0]), .B0(intDY_EWSW[0]), .B1(
        n2200), .Y(n2197) );
  INVX2TS U1142 ( .A(n2198), .Y(n2230) );
  AOI22X1TS U1143 ( .A0(n2520), .A1(DMP_EXP_EWSW[29]), .B0(n1622), .B1(n2200), 
        .Y(n2199) );
  AOI22X1TS U1144 ( .A0(n1616), .A1(DMP_EXP_EWSW[13]), .B0(intDY_EWSW[13]), 
        .B1(n2200), .Y(n2201) );
  OAI31X1TS U1145 ( .A0(n2203), .A1(Raw_mant_NRM_SWR[21]), .A2(
        Raw_mant_NRM_SWR[20]), .B0(n2202), .Y(n2209) );
  NOR3X1TS U1146 ( .A(n2205), .B(n2568), .C(n2204), .Y(n2219) );
  NOR2BX1TS U1147 ( .AN(n2219), .B(Raw_mant_NRM_SWR[16]), .Y(n2206) );
  AOI211X1TS U1148 ( .A0(n2209), .A1(n2208), .B0(n2207), .C0(n2206), .Y(n2210)
         );
  AOI22X2TS U1149 ( .A0(n2359), .A1(n2456), .B0(Shift_amount_SHT1_EWR[1]), 
        .B1(n2526), .Y(n2277) );
  INVX2TS U1150 ( .A(n2277), .Y(n2273) );
  AOI21X1TS U1151 ( .A0(n2547), .A1(Raw_mant_NRM_SWR[20]), .B0(
        Raw_mant_NRM_SWR[22]), .Y(n2214) );
  AOI211X1TS U1152 ( .A0(n2220), .A1(Raw_mant_NRM_SWR[6]), .B0(n2219), .C0(
        n2218), .Y(n2224) );
  AOI211X2TS U1153 ( .A0(Shift_amount_SHT1_EWR[0]), .A1(n2526), .B0(n2453), 
        .C0(n1600), .Y(n2269) );
  NAND2X2TS U1154 ( .A(n2269), .B(n2348), .Y(n2276) );
  NAND2X1TS U1155 ( .A(n2313), .B(Raw_mant_NRM_SWR[25]), .Y(n2225) );
  AOI21X1TS U1156 ( .A0(n1621), .A1(n2346), .B0(n1601), .Y(n2226) );
  BUFX4TS U1157 ( .A(n2227), .Y(n2252) );
  AOI22X1TS U1158 ( .A0(n2232), .A1(DMP_EXP_EWSW[2]), .B0(intDY_EWSW[2]), .B1(
        n2252), .Y(n2228) );
  AOI22X1TS U1159 ( .A0(n2232), .A1(DMP_EXP_EWSW[4]), .B0(intDY_EWSW[4]), .B1(
        n2252), .Y(n2229) );
  AOI22X1TS U1160 ( .A0(n2249), .A1(DMP_EXP_EWSW[1]), .B0(intDY_EWSW[1]), .B1(
        n2252), .Y(n2231) );
  AOI22X1TS U1161 ( .A0(n2232), .A1(DMP_EXP_EWSW[15]), .B0(intDY_EWSW[15]), 
        .B1(n2252), .Y(n2233) );
  AOI22X1TS U1162 ( .A0(n2249), .A1(DMP_EXP_EWSW[9]), .B0(intDY_EWSW[9]), .B1(
        n2252), .Y(n2234) );
  AOI22X1TS U1163 ( .A0(n2249), .A1(DMP_EXP_EWSW[3]), .B0(intDY_EWSW[3]), .B1(
        n2252), .Y(n2235) );
  AOI22X1TS U1164 ( .A0(n2254), .A1(DMP_EXP_EWSW[27]), .B0(intDY_EWSW[27]), 
        .B1(n2252), .Y(n2237) );
  AOI22X1TS U1165 ( .A0(n2254), .A1(DmP_EXP_EWSW[8]), .B0(intDY_EWSW[8]), .B1(
        n2253), .Y(n2240) );
  AOI22X1TS U1166 ( .A0(n2254), .A1(DmP_EXP_EWSW[4]), .B0(intDY_EWSW[4]), .B1(
        n2253), .Y(n2241) );
  AOI22X1TS U1167 ( .A0(n2249), .A1(DmP_EXP_EWSW[6]), .B0(intDY_EWSW[6]), .B1(
        n2253), .Y(n2242) );
  AOI22X1TS U1168 ( .A0(n2249), .A1(DmP_EXP_EWSW[10]), .B0(intDY_EWSW[10]), 
        .B1(n2253), .Y(n2243) );
  AOI22X1TS U1169 ( .A0(n2249), .A1(DmP_EXP_EWSW[0]), .B0(intDY_EWSW[0]), .B1(
        n2253), .Y(n2244) );
  AOI22X1TS U1170 ( .A0(n2249), .A1(DmP_EXP_EWSW[5]), .B0(intDY_EWSW[5]), .B1(
        n2253), .Y(n2245) );
  AOI22X1TS U1171 ( .A0(n2249), .A1(DmP_EXP_EWSW[15]), .B0(intDY_EWSW[15]), 
        .B1(n2253), .Y(n2247) );
  AOI22X1TS U1172 ( .A0(n2249), .A1(DmP_EXP_EWSW[12]), .B0(intDY_EWSW[12]), 
        .B1(n2253), .Y(n2248) );
  AOI22X1TS U1173 ( .A0(n2249), .A1(DmP_EXP_EWSW[17]), .B0(intDY_EWSW[17]), 
        .B1(n2253), .Y(n2250) );
  AOI22X1TS U1174 ( .A0(n2254), .A1(DmP_EXP_EWSW[23]), .B0(intDY_EWSW[23]), 
        .B1(n2253), .Y(n2255) );
  AOI22X1TS U1175 ( .A0(n1616), .A1(DmP_EXP_EWSW[20]), .B0(intDY_EWSW[20]), 
        .B1(n2257), .Y(n2256) );
  AOI22X1TS U1176 ( .A0(n2520), .A1(DmP_EXP_EWSW[22]), .B0(intDY_EWSW[22]), 
        .B1(n2257), .Y(n2258) );
  INVX2TS U1177 ( .A(n2263), .Y(n2267) );
  OAI22X1TS U1178 ( .A0(n2262), .A1(n2333), .B0(n2261), .B1(n2332), .Y(n2266)
         );
  AOI22X1TS U1179 ( .A0(n2264), .A1(n2263), .B0(Raw_mant_NRM_SWR[22]), .B1(
        n2523), .Y(n2265) );
  INVX2TS U1180 ( .A(n2348), .Y(n2270) );
  BUFX3TS U1181 ( .A(n2270), .Y(n2409) );
  INVX2TS U1182 ( .A(n2313), .Y(n2359) );
  AOI22X1TS U1183 ( .A0(n2359), .A1(Raw_mant_NRM_SWR[3]), .B0(
        DmP_mant_SHT1_SW[20]), .B1(n2352), .Y(n2272) );
  INVX2TS U1184 ( .A(n2401), .Y(n2410) );
  AOI22X1TS U1185 ( .A0(n2409), .A1(n2595), .B0(n1621), .B1(n2410), .Y(n2280)
         );
  INVX4TS U1186 ( .A(n2275), .Y(n2412) );
  AOI22X1TS U1187 ( .A0(n1600), .A1(Raw_mant_NRM_SWR[24]), .B0(
        DmP_mant_SHT1_SW[22]), .B1(n2352), .Y(n2278) );
  AOI22X1TS U1188 ( .A0(n1605), .A1(n2346), .B0(n1618), .B1(n1589), .Y(n2279)
         );
  OAI2BB2XLTS U1189 ( .B0(n2306), .B1(n2579), .A0N(DmP_mant_SHT1_SW[3]), .A1N(
        n2526), .Y(n2281) );
  BUFX3TS U1190 ( .A(n2454), .Y(n2358) );
  AOI22X1TS U1191 ( .A0(n1695), .A1(Raw_mant_NRM_SWR[21]), .B0(
        DmP_mant_SHT1_SW[2]), .B1(n2358), .Y(n2282) );
  AOI22X1TS U1192 ( .A0(n2409), .A1(Data_array_SWR[4]), .B0(n1621), .B1(n2383), 
        .Y(n2286) );
  AOI22X1TS U1193 ( .A0(n2359), .A1(Raw_mant_NRM_SWR[18]), .B0(
        DmP_mant_SHT1_SW[5]), .B1(n2352), .Y(n2283) );
  OAI2BB1X1TS U1194 ( .A0N(Raw_mant_NRM_SWR[7]), .A1N(n1601), .B0(n2283), .Y(
        n2368) );
  AOI22X1TS U1195 ( .A0(n2299), .A1(Raw_mant_NRM_SWR[19]), .B0(
        DmP_mant_SHT1_SW[4]), .B1(n2358), .Y(n2284) );
  AOI22X1TS U1196 ( .A0(n1605), .A1(n2368), .B0(n1619), .B1(n1585), .Y(n2285)
         );
  BUFX3TS U1197 ( .A(n2270), .Y(n2397) );
  AOI22X1TS U1198 ( .A0(n2359), .A1(Raw_mant_NRM_SWR[16]), .B0(
        DmP_mant_SHT1_SW[7]), .B1(n2352), .Y(n2288) );
  AOI22X1TS U1199 ( .A0(n2397), .A1(Data_array_SWR[9]), .B0(n1620), .B1(n2377), 
        .Y(n2292) );
  AOI22X1TS U1200 ( .A0(n2359), .A1(Raw_mant_NRM_SWR[13]), .B0(
        DmP_mant_SHT1_SW[10]), .B1(n2358), .Y(n2289) );
  OAI2BB1X1TS U1201 ( .A0N(Raw_mant_NRM_SWR[12]), .A1N(n1601), .B0(n2289), .Y(
        n2386) );
  AOI22X1TS U1202 ( .A0(n2359), .A1(Raw_mant_NRM_SWR[14]), .B0(
        DmP_mant_SHT1_SW[9]), .B1(n2358), .Y(n2290) );
  AOI22X1TS U1203 ( .A0(n1606), .A1(n2386), .B0(n1618), .B1(n2378), .Y(n2291)
         );
  OAI2BB2X1TS U1204 ( .B0(n1452), .B1(n2306), .A0N(Raw_mant_NRM_SWR[24]), 
        .A1N(n2359), .Y(n2327) );
  AOI22X1TS U1205 ( .A0(n2409), .A1(Data_array_SWR[1]), .B0(n1620), .B1(n2327), 
        .Y(n2296) );
  AOI22X1TS U1206 ( .A0(n2299), .A1(Raw_mant_NRM_SWR[22]), .B0(
        DmP_mant_SHT1_SW[1]), .B1(n2358), .Y(n2294) );
  OAI2BB1X1TS U1207 ( .A0N(Raw_mant_NRM_SWR[3]), .A1N(n1601), .B0(n2294), .Y(
        n2382) );
  AOI22X1TS U1208 ( .A0(n1606), .A1(n2383), .B0(n1619), .B1(n2382), .Y(n2295)
         );
  OAI2BB2XLTS U1209 ( .B0(n2306), .B1(n2566), .A0N(DmP_mant_SHT1_SW[14]), 
        .A1N(n2352), .Y(n2297) );
  AOI22X1TS U1210 ( .A0(n1601), .A1(Raw_mant_NRM_SWR[15]), .B0(
        DmP_mant_SHT1_SW[13]), .B1(n2358), .Y(n2298) );
  OAI2BB1X1TS U1211 ( .A0N(Raw_mant_NRM_SWR[10]), .A1N(n2299), .B0(n2298), .Y(
        n2403) );
  AOI22X1TS U1212 ( .A0(n2397), .A1(Data_array_SWR[15]), .B0(n1620), .B1(n2403), .Y(n2304) );
  AOI22X1TS U1213 ( .A0(n1695), .A1(Raw_mant_NRM_SWR[7]), .B0(
        DmP_mant_SHT1_SW[16]), .B1(n2358), .Y(n2301) );
  INVX2TS U1214 ( .A(n2375), .Y(n2311) );
  AOI22X1TS U1215 ( .A0(n1695), .A1(Raw_mant_NRM_SWR[8]), .B0(
        DmP_mant_SHT1_SW[15]), .B1(n2358), .Y(n2302) );
  OAI2BB1X1TS U1216 ( .A0N(Raw_mant_NRM_SWR[17]), .A1N(n1601), .B0(n2302), .Y(
        n2404) );
  AOI22X1TS U1217 ( .A0(n1605), .A1(n2311), .B0(n1619), .B1(n2404), .Y(n2303)
         );
  AOI22X1TS U1218 ( .A0(n2397), .A1(Data_array_SWR[17]), .B0(n1621), .B1(n2404), .Y(n2310) );
  AOI22X1TS U1219 ( .A0(n2299), .A1(Raw_mant_NRM_SWR[5]), .B0(
        DmP_mant_SHT1_SW[18]), .B1(n2352), .Y(n2305) );
  AOI22X1TS U1220 ( .A0(n1695), .A1(Raw_mant_NRM_SWR[6]), .B0(
        DmP_mant_SHT1_SW[17]), .B1(n2358), .Y(n2308) );
  INVX2TS U1221 ( .A(n2316), .Y(n2396) );
  AOI22X1TS U1222 ( .A0(n1605), .A1(n2398), .B0(n1619), .B1(n2396), .Y(n2309)
         );
  AOI22X1TS U1223 ( .A0(n2409), .A1(Data_array_SWR[18]), .B0(n1620), .B1(n2311), .Y(n2315) );
  AOI22X1TS U1224 ( .A0(n1601), .A1(Raw_mant_NRM_SWR[21]), .B0(
        DmP_mant_SHT1_SW[19]), .B1(n2352), .Y(n2312) );
  AOI22X1TS U1225 ( .A0(n1605), .A1(n2407), .B0(n1618), .B1(n2398), .Y(n2314)
         );
  XOR2X1TS U1226 ( .A(n2319), .B(n2320), .Y(n2326) );
  XOR2X1TS U1227 ( .A(n2321), .B(n2320), .Y(n2323) );
  AOI22X1TS U1228 ( .A0(n2323), .A1(n2501), .B0(Raw_mant_NRM_SWR[23]), .B1(
        n2523), .Y(n2324) );
  AOI22X1TS U1229 ( .A0(n2397), .A1(Data_array_SWR[0]), .B0(
        Raw_mant_NRM_SWR[25]), .B1(n2299), .Y(n2329) );
  AOI21X1TS U1230 ( .A0(n1606), .A1(n2382), .B0(n2327), .Y(n2328) );
  OAI211X1TS U1231 ( .A0(n1624), .A1(n1583), .B0(n2329), .C0(n2328), .Y(n837)
         );
  INVX2TS U1232 ( .A(n2338), .Y(n2342) );
  OAI22X1TS U1233 ( .A0(n2337), .A1(n2333), .B0(n2334), .B1(n2332), .Y(n2341)
         );
  AOI22X1TS U1234 ( .A0(n2339), .A1(n2338), .B0(Raw_mant_NRM_SWR[24]), .B1(
        n2523), .Y(n2340) );
  AOI22X1TS U1235 ( .A0(n2397), .A1(n2594), .B0(n1618), .B1(n2346), .Y(n2345)
         );
  NAND2X1TS U1236 ( .A(n2411), .B(n1589), .Y(n2344) );
  AOI22X1TS U1237 ( .A0(n1612), .A1(n2346), .B0(n1620), .B1(n1589), .Y(n2347)
         );
  AOI22X1TS U1238 ( .A0(n2409), .A1(Data_array_SWR[10]), .B0(n1612), .B1(n2378), .Y(n2351) );
  AOI22X1TS U1239 ( .A0(n2299), .A1(Raw_mant_NRM_SWR[12]), .B0(
        DmP_mant_SHT1_SW[11]), .B1(n2352), .Y(n2349) );
  OAI2BB1X1TS U1240 ( .A0N(Raw_mant_NRM_SWR[13]), .A1N(n1601), .B0(n2349), .Y(
        n2393) );
  AOI22X1TS U1241 ( .A0(n1606), .A1(n2393), .B0(n1618), .B1(n2386), .Y(n2350)
         );
  INVX2TS U1242 ( .A(n2377), .Y(n2357) );
  AOI22X1TS U1243 ( .A0(n2397), .A1(Data_array_SWR[6]), .B0(n2408), .B1(n1585), 
        .Y(n2356) );
  AOI22X1TS U1244 ( .A0(n2299), .A1(Raw_mant_NRM_SWR[17]), .B0(
        DmP_mant_SHT1_SW[6]), .B1(n2352), .Y(n2354) );
  INVX2TS U1245 ( .A(n2367), .Y(n2376) );
  AOI22X1TS U1246 ( .A0(n1619), .A1(n2376), .B0(n2411), .B1(n2368), .Y(n2355)
         );
  AOI22X1TS U1247 ( .A0(n2359), .A1(Raw_mant_NRM_SWR[11]), .B0(
        DmP_mant_SHT1_SW[12]), .B1(n2358), .Y(n2362) );
  AOI22X1TS U1248 ( .A0(n2397), .A1(Data_array_SWR[11]), .B0(n1621), .B1(n2378), .Y(n2364) );
  AOI22X1TS U1249 ( .A0(n1619), .A1(n2393), .B0(n1612), .B1(n2386), .Y(n2363)
         );
  AOI22X1TS U1250 ( .A0(n1618), .A1(n2368), .B0(n1612), .B1(n1585), .Y(n2365)
         );
  AOI22X1TS U1251 ( .A0(n2270), .A1(Data_array_SWR[7]), .B0(n1620), .B1(n2368), 
        .Y(n2370) );
  AOI22X1TS U1252 ( .A0(n1618), .A1(n2377), .B0(n2411), .B1(n2376), .Y(n2369)
         );
  AOI22X1TS U1253 ( .A0(n1618), .A1(n2383), .B0(n1612), .B1(n2382), .Y(n2371)
         );
  AOI22X1TS U1254 ( .A0(n2409), .A1(Data_array_SWR[16]), .B0(n1612), .B1(n2404), .Y(n2374) );
  OAI211X1TS U1255 ( .A0(n2375), .A1(n1583), .B0(n2374), .C0(n2373), .Y(n853)
         );
  AOI22X1TS U1256 ( .A0(n2409), .A1(Data_array_SWR[8]), .B0(n1620), .B1(n2376), 
        .Y(n2380) );
  AOI22X1TS U1257 ( .A0(n1606), .A1(n2378), .B0(n1612), .B1(n2377), .Y(n2379)
         );
  OAI211X1TS U1258 ( .A0(n2381), .A1(n1583), .B0(n2380), .C0(n2379), .Y(n845)
         );
  AOI22X1TS U1259 ( .A0(n2397), .A1(Data_array_SWR[3]), .B0(n1621), .B1(n2382), 
        .Y(n2385) );
  AOI22X1TS U1260 ( .A0(n1606), .A1(n1585), .B0(n1612), .B1(n2383), .Y(n2384)
         );
  OAI211X1TS U1261 ( .A0(n1636), .A1(n1583), .B0(n2385), .C0(n2384), .Y(n840)
         );
  AOI22X1TS U1262 ( .A0(n2397), .A1(Data_array_SWR[12]), .B0(n1620), .B1(n2386), .Y(n2389) );
  INVX2TS U1263 ( .A(n2387), .Y(n2402) );
  AOI22X1TS U1264 ( .A0(n1618), .A1(n2402), .B0(n2411), .B1(n2393), .Y(n2388)
         );
  AOI22X1TS U1265 ( .A0(n2270), .A1(Data_array_SWR[20]), .B0(n2408), .B1(n2398), .Y(n2392) );
  AOI22X1TS U1266 ( .A0(n1619), .A1(n2410), .B0(n2411), .B1(n2407), .Y(n2391)
         );
  AOI22X1TS U1267 ( .A0(n2409), .A1(Data_array_SWR[13]), .B0(n1621), .B1(n2393), .Y(n2395) );
  AOI22X1TS U1268 ( .A0(n1619), .A1(n2403), .B0(n2411), .B1(n2402), .Y(n2394)
         );
  AOI22X1TS U1269 ( .A0(n1619), .A1(n2407), .B0(n1612), .B1(n2398), .Y(n2399)
         );
  AOI22X1TS U1270 ( .A0(n2409), .A1(Data_array_SWR[14]), .B0(n1621), .B1(n2402), .Y(n2406) );
  AOI22X1TS U1271 ( .A0(n1605), .A1(n2404), .B0(n2411), .B1(n2403), .Y(n2405)
         );
  OAI211X1TS U1272 ( .A0(n1637), .A1(n1583), .B0(n2406), .C0(n2405), .Y(n851)
         );
  AOI22X1TS U1273 ( .A0(n2409), .A1(Data_array_SWR[21]), .B0(n1620), .B1(n2407), .Y(n2414) );
  AOI22X1TS U1274 ( .A0(n1605), .A1(n1589), .B0(n2411), .B1(n2410), .Y(n2413)
         );
  OAI211X1TS U1275 ( .A0(n2415), .A1(n1583), .B0(n2414), .C0(n2413), .Y(n858)
         );
  AOI32X4TS U1276 ( .A0(inst_FSM_INPUT_ENABLE_state_reg[1]), .A1(
        inst_FSM_INPUT_ENABLE_state_reg[0]), .A2(
        inst_FSM_INPUT_ENABLE_state_reg[2]), .B0(n2416), .B1(n2540), .Y(n2527)
         );
  AOI22X1TS U1277 ( .A0(Data_array_SWR[13]), .A1(n1610), .B0(
        Data_array_SWR[21]), .B1(n1879), .Y(n2419) );
  AOI22X1TS U1278 ( .A0(Data_array_SWR[17]), .A1(n1607), .B0(n1923), .B1(n2580), .Y(n2418) );
  NAND2X1TS U1279 ( .A(n2419), .B(n2418), .Y(n2423) );
  AOI22X1TS U1280 ( .A0(Data_array_SWR[20]), .A1(n1879), .B0(
        Data_array_SWR[12]), .B1(n1610), .Y(n2421) );
  AOI22X1TS U1281 ( .A0(Data_array_SWR[16]), .A1(n1607), .B0(
        Data_array_SWR[24]), .B1(n1923), .Y(n2420) );
  NAND2X1TS U1282 ( .A(n2421), .B(n2420), .Y(n2426) );
  NOR2BX1TS U1283 ( .AN(n2426), .B(left_right_SHT2), .Y(n2422) );
  AOI211X1TS U1284 ( .A0(left_right_SHT2), .A1(n2423), .B0(n2422), .C0(n2424), 
        .Y(n2455) );
  MXI2X1TS U1285 ( .A(n2455), .B(n1510), .S0(n2427), .Y(n547) );
  NOR2BX1TS U1286 ( .AN(n2423), .B(left_right_SHT2), .Y(n2425) );
  AOI211X1TS U1287 ( .A0(n2426), .A1(left_right_SHT2), .B0(n2425), .C0(n2424), 
        .Y(n2529) );
  MXI2X1TS U1288 ( .A(n2529), .B(n1509), .S0(n2427), .Y(n546) );
  NOR2BX1TS U1289 ( .AN(n2430), .B(DmP_mant_SFG_SWR[25]), .Y(n2432) );
  OAI22X1TS U1290 ( .A0(n2432), .A1(n2431), .B0(n1627), .B1(n1480), .Y(n621)
         );
  MXI2X1TS U1291 ( .A(n2597), .B(n1499), .S0(n2433), .Y(n613) );
  AOI22X1TS U1292 ( .A0(inst_FSM_INPUT_ENABLE_state_reg[1]), .A1(n2517), .B0(
        inst_FSM_INPUT_ENABLE_state_reg[2]), .B1(n2571), .Y(n2452) );
  INVX2TS U1293 ( .A(n2436), .Y(n2447) );
  BUFX4TS U1294 ( .A(n2434), .Y(n2449) );
  INVX2TS U1295 ( .A(n2449), .Y(n2443) );
  OAI2BB2XLTS U1296 ( .B0(n2447), .B1(n1457), .A0N(n2443), .A1N(Data_X[15]), 
        .Y(n914) );
  INVX2TS U1297 ( .A(n2436), .Y(n2440) );
  OAI2BB2XLTS U1298 ( .B0(n2447), .B1(n1488), .A0N(n2440), .A1N(Data_X[9]), 
        .Y(n920) );
  INVX2TS U1299 ( .A(n2434), .Y(n2448) );
  CLKBUFX2TS U1300 ( .A(n2434), .Y(n2435) );
  INVX2TS U1301 ( .A(n2434), .Y(n2451) );
  AO22X1TS U1302 ( .A0(n2451), .A1(add_subt), .B0(n2435), .B1(intAS), .Y(n897)
         );
  INVX2TS U1303 ( .A(n2449), .Y(n2442) );
  OAI2BB2XLTS U1304 ( .B0(n2442), .B1(n1483), .A0N(n2443), .A1N(Data_X[2]), 
        .Y(n927) );
  INVX2TS U1305 ( .A(n2436), .Y(n2446) );
  OAI2BB2XLTS U1306 ( .B0(n2441), .B1(n1482), .A0N(n2446), .A1N(Data_X[1]), 
        .Y(n928) );
  OAI2BB2XLTS U1307 ( .B0(n2442), .B1(n1455), .A0N(n2448), .A1N(Data_X[3]), 
        .Y(n926) );
  OAI2BB2XLTS U1308 ( .B0(n2441), .B1(n1460), .A0N(n2440), .A1N(Data_X[0]), 
        .Y(n929) );
  OAI2BB2XLTS U1309 ( .B0(n2442), .B1(n1487), .A0N(n2448), .A1N(Data_X[22]), 
        .Y(n907) );
  OAI2BB2XLTS U1310 ( .B0(n2442), .B1(n1461), .A0N(n2448), .A1N(Data_X[20]), 
        .Y(n909) );
  OAI2BB2XLTS U1311 ( .B0(n2441), .B1(n1486), .A0N(n2448), .A1N(Data_X[14]), 
        .Y(n915) );
  OAI2BB2XLTS U1312 ( .B0(n2442), .B1(n1462), .A0N(n2440), .A1N(Data_X[12]), 
        .Y(n917) );
  OAI2BB2XLTS U1313 ( .B0(n2441), .B1(n1463), .A0N(n2448), .A1N(Data_X[18]), 
        .Y(n911) );
  INVX2TS U1314 ( .A(n2434), .Y(n2445) );
  OAI2BB2XLTS U1315 ( .B0(n2445), .B1(n1490), .A0N(n2443), .A1N(Data_X[17]), 
        .Y(n912) );
  OAI2BB2XLTS U1316 ( .B0(n2442), .B1(n1489), .A0N(n2443), .A1N(Data_X[11]), 
        .Y(n918) );
  OAI2BB2XLTS U1317 ( .B0(n2445), .B1(n1458), .A0N(n2440), .A1N(Data_X[21]), 
        .Y(n908) );
  OAI2BB2XLTS U1318 ( .B0(n2445), .B1(n1456), .A0N(n2446), .A1N(Data_X[13]), 
        .Y(n916) );
  OAI2BB2XLTS U1319 ( .B0(n2445), .B1(n1431), .A0N(n2440), .A1N(Data_Y[26]), 
        .Y(n870) );
  INVX2TS U1320 ( .A(n2436), .Y(n2444) );
  OAI2BB2XLTS U1321 ( .B0(n2442), .B1(n2536), .A0N(n2440), .A1N(Data_Y[8]), 
        .Y(n888) );
  BUFX3TS U1322 ( .A(n2436), .Y(n2450) );
  OAI2BB2XLTS U1323 ( .B0(n2445), .B1(n1440), .A0N(n2440), .A1N(Data_X[25]), 
        .Y(n904) );
  OAI2BB2XLTS U1324 ( .B0(n2445), .B1(n1430), .A0N(n2446), .A1N(Data_Y[25]), 
        .Y(n871) );
  OAI2BB2XLTS U1325 ( .B0(n2445), .B1(n1432), .A0N(n2440), .A1N(Data_X[28]), 
        .Y(n901) );
  INVX2TS U1326 ( .A(n2435), .Y(n2439) );
  OAI2BB2XLTS U1327 ( .B0(n2441), .B1(n1439), .A0N(n2439), .A1N(Data_X[24]), 
        .Y(n905) );
  OAI2BB2XLTS U1328 ( .B0(n2441), .B1(n1437), .A0N(n2440), .A1N(Data_X[10]), 
        .Y(n919) );
  OAI2BB2XLTS U1329 ( .B0(n2441), .B1(n1438), .A0N(n2446), .A1N(Data_X[16]), 
        .Y(n913) );
  OAI2BB2XLTS U1330 ( .B0(n2441), .B1(n1435), .A0N(n2443), .A1N(Data_X[6]), 
        .Y(n923) );
  OAI2BB2XLTS U1331 ( .B0(n2445), .B1(n1434), .A0N(n2443), .A1N(Data_X[4]), 
        .Y(n925) );
  OAI2BB2XLTS U1332 ( .B0(n2442), .B1(n1433), .A0N(n2443), .A1N(Data_X[5]), 
        .Y(n924) );
  OAI2BB2XLTS U1333 ( .B0(n2442), .B1(n1477), .A0N(n2440), .A1N(Data_X[23]), 
        .Y(n906) );
  OAI2BB2XLTS U1334 ( .B0(n2447), .B1(n1467), .A0N(n2443), .A1N(Data_Y[24]), 
        .Y(n872) );
  OAI2BB2XLTS U1335 ( .B0(n2441), .B1(n1459), .A0N(n2443), .A1N(Data_Y[7]), 
        .Y(n889) );
  OAI2BB2XLTS U1336 ( .B0(n2441), .B1(n1485), .A0N(n2446), .A1N(Data_X[19]), 
        .Y(n910) );
  OAI2BB2XLTS U1337 ( .B0(n2442), .B1(n1465), .A0N(n2446), .A1N(Data_X[30]), 
        .Y(n899) );
  OAI2BB2XLTS U1338 ( .B0(n2447), .B1(n1491), .A0N(n2443), .A1N(Data_X[29]), 
        .Y(n900) );
  OAI2BB2XLTS U1339 ( .B0(n2445), .B1(n1464), .A0N(n2446), .A1N(Data_X[27]), 
        .Y(n902) );
  OAI2BB2XLTS U1340 ( .B0(n2445), .B1(n2589), .A0N(n2446), .A1N(Data_Y[23]), 
        .Y(n873) );
  OAI2BB2XLTS U1341 ( .B0(n2447), .B1(n73), .A0N(n2446), .A1N(Data_X[26]), .Y(
        n903) );
  OAI2BB2XLTS U1342 ( .B0(n2447), .B1(n1484), .A0N(n2446), .A1N(Data_X[8]), 
        .Y(n921) );
  OAI2BB2XLTS U1343 ( .B0(n2527), .B1(n2520), .A0N(n2527), .A1N(n2452), .Y(
        n936) );
  OAI2BB2XLTS U1344 ( .B0(n2455), .B1(n2528), .A0N(final_result_ieee[10]), 
        .A1N(n2596), .Y(n582) );
  CLKBUFX2TS U1345 ( .A(n2590), .Y(n2479) );
  BUFX3TS U1346 ( .A(n2479), .Y(n2493) );
  INVX2TS U1347 ( .A(n2493), .Y(n2522) );
  BUFX3TS U1348 ( .A(n2459), .Y(n2476) );
  INVX2TS U1349 ( .A(n2474), .Y(n2467) );
  BUFX3TS U1350 ( .A(n2459), .Y(n2478) );
  INVX2TS U1351 ( .A(n2478), .Y(n2462) );
  INVX2TS U1352 ( .A(n2478), .Y(n2460) );
  BUFX3TS U1353 ( .A(n2590), .Y(n2461) );
  INVX2TS U1354 ( .A(n2476), .Y(n2477) );
  BUFX3TS U1355 ( .A(n2590), .Y(n2496) );
  OAI2BB2XLTS U1356 ( .B0(n2522), .B1(n1446), .A0N(n1641), .A1N(
        DMP_SHT1_EWSW[26]), .Y(n702) );
  OAI2BB2XLTS U1357 ( .B0(n2522), .B1(n1442), .A0N(n1641), .A1N(
        DMP_SHT1_EWSW[25]), .Y(n707) );
  OAI2BB2XLTS U1358 ( .B0(n2522), .B1(n1443), .A0N(n1641), .A1N(
        DMP_SHT1_EWSW[24]), .Y(n712) );
  INVX2TS U1359 ( .A(n2474), .Y(n2475) );
  INVX2TS U1360 ( .A(n2476), .Y(n2489) );
  INVX2TS U1361 ( .A(n2476), .Y(n2484) );
  NAND2X1TS U1362 ( .A(DmP_EXP_EWSW[23]), .B(n1492), .Y(n2494) );
  INVX2TS U1363 ( .A(n2494), .Y(n2491) );
  NAND2X1TS U1364 ( .A(n1441), .B(n2544), .Y(n2480) );
  AOI22X1TS U1365 ( .A0(n1443), .A1(n2576), .B0(n2491), .B1(n2480), .Y(n2487)
         );
  XNOR2X1TS U1366 ( .A(DmP_EXP_EWSW[27]), .B(DMP_EXP_EWSW[27]), .Y(n2481) );
  XOR2X1TS U1367 ( .A(n2482), .B(n2481), .Y(n2483) );
  CMPR32X2TS U1368 ( .A(n1445), .B(n2643), .C(n2485), .CO(n2482), .S(n2486) );
  CMPR32X2TS U1369 ( .A(n1447), .B(n2644), .C(n2487), .CO(n2485), .S(n2488) );
  AOI22X1TS U1370 ( .A0(n1443), .A1(n1441), .B0(n2576), .B1(n2544), .Y(n2490)
         );
  INVX2TS U1371 ( .A(n2527), .Y(n2524) );
  OAI2BB2XLTS U1372 ( .B0(n2524), .B1(n2521), .A0N(n2524), .A1N(
        Shift_reg_FLAGS_7[3]), .Y(n933) );
  NAND2X1TS U1373 ( .A(n2504), .B(n2497), .Y(n2498) );
  XOR2X1TS U1374 ( .A(n1514), .B(DMP_SFG[1]), .Y(n2500) );
  AOI21X1TS U1375 ( .A0(n2509), .A1(n2501), .B0(n2500), .Y(n2502) );
  NAND2X1TS U1376 ( .A(n2506), .B(n2505), .Y(n2507) );
  OAI2BB1X1TS U1377 ( .A0N(n2463), .A1N(Raw_mant_NRM_SWR[3]), .B0(n2507), .Y(
        n610) );
  NAND2X1TS U1378 ( .A(n2508), .B(OP_FLAG_SFG), .Y(n2512) );
  INVX2TS U1379 ( .A(n2509), .Y(n2510) );
  AOI21X1TS U1380 ( .A0(n1515), .A1(n2545), .B0(n2510), .Y(n2511) );
  XNOR2X1TS U1381 ( .A(n2512), .B(n2511), .Y(n2513) );
  NAND2X1TS U1382 ( .A(n2513), .B(n1628), .Y(n2514) );
  OAI2BB1X1TS U1383 ( .A0N(n2463), .A1N(Raw_mant_NRM_SWR[2]), .B0(n2514), .Y(
        n611) );
  INVX2TS U1384 ( .A(n2517), .Y(n2519) );
  AOI22X1TS U1385 ( .A0(inst_FSM_INPUT_ENABLE_state_reg[1]), .A1(
        inst_FSM_INPUT_ENABLE_state_reg[0]), .B0(n2519), .B1(n2571), .Y(
        inst_FSM_INPUT_ENABLE_state_next_1_) );
  NAND2X1TS U1386 ( .A(n2519), .B(n2518), .Y(n937) );
  AOI22X1TS U1387 ( .A0(n2527), .A1(n2520), .B0(n2522), .B1(n2524), .Y(n935)
         );
  AOI22X1TS U1388 ( .A0(n2527), .A1(n2522), .B0(n2521), .B1(n2524), .Y(n934)
         );
  AOI22X1TS U1389 ( .A0(n2527), .A1(n2523), .B0(n2526), .B1(n2524), .Y(n931)
         );
  AOI22X1TS U1390 ( .A0(n2527), .A1(n2526), .B0(n2525), .B1(n2524), .Y(n930)
         );
  OAI222X1TS U1391 ( .A0(n2531), .A1(n1467), .B0(n2530), .B1(n1439), .C0(n2583), .C1(n1443), .Y(n795) );
  OAI222X1TS U1392 ( .A0(n2531), .A1(n1430), .B0(n2530), .B1(n1440), .C0(n2583), .C1(n1442), .Y(n794) );
  OAI222X1TS U1393 ( .A0(n2531), .A1(n1431), .B0(n2530), .B1(n73), .C0(n1615), 
        .C1(n1446), .Y(n793) );
  OAI222X1TS U1394 ( .A0(n2530), .A1(n1467), .B0(n2531), .B1(n1439), .C0(n2583), .C1(n1441), .Y(n630) );
  OAI222X1TS U1395 ( .A0(n2530), .A1(n1430), .B0(n2531), .B1(n1440), .C0(n1615), .C1(n1447), .Y(n629) );
  OAI222X1TS U1396 ( .A0(n2530), .A1(n1431), .B0(n2531), .B1(n73), .C0(n1615), 
        .C1(n1445), .Y(n628) );
  OAI2BB2XLTS U1397 ( .B0(n2529), .B1(n2528), .A0N(final_result_ieee[11]), 
        .A1N(n2596), .Y(n581) );
  OAI222X1TS U1398 ( .A0(n2531), .A1(n2589), .B0(n2530), .B1(n1477), .C0(n1615), .C1(n1492), .Y(n1186) );
initial $sdf_annotate("FPU_Interface2_RKOA_1STAGE_syn.sdf"); 
 endmodule


module Mux_3x1_b_W32 ( select, ch_0, ch_1, ch_2, data_out );
  input [1:0] select;
  input [31:0] ch_0;
  input [31:0] ch_1;
  input [31:0] ch_2;
  output [31:0] data_out;
  wire   n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
         n87, n88;

  CLKBUFX2TS U2 ( .A(n45), .Y(n81) );
  BUFX3TS U3 ( .A(n48), .Y(n80) );
  BUFX3TS U4 ( .A(n48), .Y(n85) );
  NOR2BX4TS U5 ( .AN(select[0]), .B(select[1]), .Y(n45) );
  NOR2X2TS U6 ( .A(select[1]), .B(select[0]), .Y(n46) );
  NOR2BX4TS U7 ( .AN(select[1]), .B(select[0]), .Y(n48) );
  INVX2TS U8 ( .A(n72), .Y(data_out[14]) );
  AOI222X1TS U9 ( .A0(n87), .A1(ch_1[14]), .B0(n46), .B1(ch_0[14]), .C0(n85), 
        .C1(ch_2[14]), .Y(n72) );
  AOI222X1TS U10 ( .A0(n58), .A1(ch_1[23]), .B0(n57), .B1(ch_0[23]), .C0(n48), 
        .C1(ch_2[23]), .Y(n49) );
  BUFX3TS U11 ( .A(n46), .Y(n57) );
  AOI222X1TS U12 ( .A0(n58), .A1(ch_1[25]), .B0(n57), .B1(ch_0[25]), .C0(n48), 
        .C1(ch_2[25]), .Y(n50) );
  AOI222X1TS U13 ( .A0(n58), .A1(ch_1[24]), .B0(n57), .B1(ch_0[24]), .C0(n48), 
        .C1(ch_2[24]), .Y(n51) );
  AOI222X1TS U14 ( .A0(n58), .A1(ch_1[29]), .B0(n57), .B1(ch_0[29]), .C0(n80), 
        .C1(ch_2[29]), .Y(n52) );
  AOI222X1TS U15 ( .A0(n58), .A1(ch_1[1]), .B0(n57), .B1(ch_0[1]), .C0(n80), 
        .C1(ch_2[1]), .Y(n53) );
  AOI222X1TS U16 ( .A0(n58), .A1(ch_1[17]), .B0(n57), .B1(ch_0[17]), .C0(n80), 
        .C1(ch_2[17]), .Y(n54) );
  AOI222X1TS U17 ( .A0(n58), .A1(ch_1[20]), .B0(n57), .B1(ch_0[20]), .C0(n80), 
        .C1(ch_2[20]), .Y(n55) );
  AOI222X1TS U18 ( .A0(n58), .A1(ch_1[26]), .B0(n57), .B1(ch_0[26]), .C0(n80), 
        .C1(ch_2[26]), .Y(n59) );
  AOI222X1TS U19 ( .A0(n45), .A1(ch_1[10]), .B0(n70), .B1(ch_0[10]), .C0(n69), 
        .C1(ch_2[10]), .Y(n60) );
  BUFX3TS U20 ( .A(n46), .Y(n70) );
  BUFX3TS U21 ( .A(n80), .Y(n69) );
  AOI222X1TS U22 ( .A0(n45), .A1(ch_1[11]), .B0(n70), .B1(ch_0[11]), .C0(n69), 
        .C1(ch_2[11]), .Y(n61) );
  AOI222X1TS U23 ( .A0(n45), .A1(ch_1[9]), .B0(n70), .B1(ch_0[9]), .C0(n69), 
        .C1(ch_2[9]), .Y(n62) );
  AOI222X1TS U24 ( .A0(n45), .A1(ch_1[3]), .B0(n70), .B1(ch_0[3]), .C0(n69), 
        .C1(ch_2[3]), .Y(n63) );
  AOI222X1TS U25 ( .A0(n45), .A1(ch_1[8]), .B0(n70), .B1(ch_0[8]), .C0(n69), 
        .C1(ch_2[8]), .Y(n64) );
  AOI222X1TS U26 ( .A0(n45), .A1(ch_1[6]), .B0(n70), .B1(ch_0[6]), .C0(n69), 
        .C1(ch_2[6]), .Y(n67) );
  AOI222X1TS U27 ( .A0(n45), .A1(ch_1[7]), .B0(n70), .B1(ch_0[7]), .C0(n69), 
        .C1(ch_2[7]), .Y(n68) );
  AOI222X1TS U28 ( .A0(n81), .A1(ch_1[31]), .B0(n70), .B1(ch_0[31]), .C0(n69), 
        .C1(ch_2[31]), .Y(n71) );
  AOI222X1TS U29 ( .A0(n87), .A1(ch_1[18]), .B0(n46), .B1(ch_0[18]), .C0(n85), 
        .C1(ch_2[18]), .Y(n73) );
  AOI222X1TS U30 ( .A0(n87), .A1(ch_1[16]), .B0(n86), .B1(ch_0[16]), .C0(n85), 
        .C1(ch_2[16]), .Y(n74) );
  AOI222X1TS U31 ( .A0(n81), .A1(ch_1[4]), .B0(n86), .B1(ch_0[4]), .C0(n80), 
        .C1(ch_2[4]), .Y(n75) );
  BUFX3TS U32 ( .A(n46), .Y(n86) );
  AOI222X1TS U33 ( .A0(n87), .A1(ch_1[13]), .B0(n86), .B1(ch_0[13]), .C0(n85), 
        .C1(ch_2[13]), .Y(n76) );
  AOI222X1TS U34 ( .A0(n87), .A1(ch_1[21]), .B0(n86), .B1(ch_0[21]), .C0(n85), 
        .C1(ch_2[21]), .Y(n77) );
  AOI222X1TS U35 ( .A0(n87), .A1(ch_1[19]), .B0(n86), .B1(ch_0[19]), .C0(n85), 
        .C1(ch_2[19]), .Y(n78) );
  AOI222X1TS U36 ( .A0(n87), .A1(ch_1[15]), .B0(n86), .B1(ch_0[15]), .C0(n85), 
        .C1(ch_2[15]), .Y(n79) );
  AOI222X1TS U37 ( .A0(n81), .A1(ch_1[5]), .B0(n86), .B1(ch_0[5]), .C0(n80), 
        .C1(ch_2[5]), .Y(n82) );
  AOI222X1TS U38 ( .A0(n87), .A1(ch_1[30]), .B0(n86), .B1(ch_0[30]), .C0(n85), 
        .C1(ch_2[30]), .Y(n83) );
  AOI222X1TS U39 ( .A0(n87), .A1(ch_1[27]), .B0(n86), .B1(ch_0[27]), .C0(n85), 
        .C1(ch_2[27]), .Y(n84) );
  AOI222X1TS U40 ( .A0(n81), .A1(ch_1[28]), .B0(n70), .B1(ch_0[28]), .C0(n69), 
        .C1(ch_2[28]), .Y(n66) );
  AOI222X1TS U41 ( .A0(n58), .A1(ch_1[22]), .B0(n57), .B1(ch_0[22]), .C0(n48), 
        .C1(ch_2[22]), .Y(n47) );
  AOI222X1TS U42 ( .A0(n87), .A1(ch_1[12]), .B0(n86), .B1(ch_0[12]), .C0(n85), 
        .C1(ch_2[12]), .Y(n88) );
  BUFX3TS U43 ( .A(n81), .Y(n87) );
  AOI222X1TS U44 ( .A0(n45), .A1(ch_1[2]), .B0(n70), .B1(ch_0[2]), .C0(n69), 
        .C1(ch_2[2]), .Y(n65) );
  AOI222X1TS U45 ( .A0(n58), .A1(ch_1[0]), .B0(n57), .B1(ch_0[0]), .C0(n80), 
        .C1(ch_2[0]), .Y(n56) );
  BUFX3TS U46 ( .A(n45), .Y(n58) );
  INVX2TS U47 ( .A(n47), .Y(data_out[22]) );
  INVX2TS U48 ( .A(n49), .Y(data_out[23]) );
  INVX2TS U49 ( .A(n50), .Y(data_out[25]) );
  INVX2TS U50 ( .A(n51), .Y(data_out[24]) );
  INVX2TS U51 ( .A(n52), .Y(data_out[29]) );
  INVX2TS U52 ( .A(n53), .Y(data_out[1]) );
  INVX2TS U53 ( .A(n54), .Y(data_out[17]) );
  INVX2TS U54 ( .A(n55), .Y(data_out[20]) );
  INVX2TS U55 ( .A(n56), .Y(data_out[0]) );
  INVX2TS U56 ( .A(n59), .Y(data_out[26]) );
  INVX2TS U57 ( .A(n60), .Y(data_out[10]) );
  INVX2TS U58 ( .A(n61), .Y(data_out[11]) );
  INVX2TS U59 ( .A(n62), .Y(data_out[9]) );
  INVX2TS U60 ( .A(n63), .Y(data_out[3]) );
  INVX2TS U61 ( .A(n64), .Y(data_out[8]) );
  INVX2TS U62 ( .A(n65), .Y(data_out[2]) );
  INVX2TS U63 ( .A(n66), .Y(data_out[28]) );
  INVX2TS U64 ( .A(n67), .Y(data_out[6]) );
  INVX2TS U65 ( .A(n68), .Y(data_out[7]) );
  INVX2TS U66 ( .A(n71), .Y(data_out[31]) );
  INVX2TS U67 ( .A(n73), .Y(data_out[18]) );
  INVX2TS U68 ( .A(n74), .Y(data_out[16]) );
  INVX2TS U69 ( .A(n75), .Y(data_out[4]) );
  INVX2TS U70 ( .A(n76), .Y(data_out[13]) );
  INVX2TS U71 ( .A(n77), .Y(data_out[21]) );
  INVX2TS U72 ( .A(n78), .Y(data_out[19]) );
  INVX2TS U73 ( .A(n79), .Y(data_out[15]) );
  INVX2TS U74 ( .A(n82), .Y(data_out[5]) );
  INVX2TS U75 ( .A(n83), .Y(data_out[30]) );
  INVX2TS U76 ( .A(n84), .Y(data_out[27]) );
  INVX2TS U77 ( .A(n88), .Y(data_out[12]) );
initial $sdf_annotate("FPU_Interface2_RKOA_1STAGE_syn.sdf"); 
 endmodule


module d_ff_en_W32_0 ( clk, rst, enable, D, Q, OUT3, OUT4, OUT5 );
  input [31:0] D;
  output [31:0] Q;
  input clk, rst, enable;
  output OUT3, OUT4, OUT5;
  wire   n2, OUT5;
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
  assign OUT3 = OUT5;
  assign OUT4 = OUT5;

  DFFRXLTS Q_reg_31_ ( .D(D[31]), .CK(clk), .RN(n2), .Q(Q[31]) );
  DFFRXLTS Q_reg_29_ ( .D(D[29]), .CK(clk), .RN(n2), .Q(Q[29]) );
  DFFRXLTS Q_reg_27_ ( .D(D[27]), .CK(clk), .RN(n2), .Q(Q[27]) );
  DFFRXLTS Q_reg_25_ ( .D(D[25]), .CK(clk), .RN(n2), .Q(Q[25]) );
  INVX2TS U9 ( .A(rst), .Y(OUT5) );
  INVX2TS U33 ( .A(rst), .Y(n2) );
  DFFRX1TS Q_reg_30_ ( .D(D[30]), .CK(clk), .RN(n2), .Q(Q[30]) );
  DFFRX1TS Q_reg_28_ ( .D(D[28]), .CK(clk), .RN(n2), .Q(Q[28]) );
  DFFRX1TS Q_reg_23_ ( .D(D[23]), .CK(clk), .RN(n2), .Q(Q[23]) );
  DFFRX1TS Q_reg_26_ ( .D(D[26]), .CK(clk), .RN(n2), .Q(Q[26]) );
  DFFRX1TS Q_reg_24_ ( .D(D[24]), .CK(clk), .RN(OUT5), .Q(Q[24]) );
initial $sdf_annotate("FPU_Interface2_RKOA_1STAGE_syn.sdf"); 
 endmodule


module Mux_2x1_W32_0 ( select, ch_0, ch_1, data_out );
  input [31:0] ch_0;
  input [31:0] ch_1;
  output [31:0] data_out;
  input select;
  wire   n1, n2, n3, n4, n5, n6, n7;

  AO22XLTS U1 ( .A0(n1), .A1(ch_1[4]), .B0(n4), .B1(ch_0[4]), .Y(data_out[4])
         );
  AO22XLTS U2 ( .A0(n3), .A1(ch_1[5]), .B0(n4), .B1(ch_0[5]), .Y(data_out[5])
         );
  AO22XLTS U3 ( .A0(n3), .A1(ch_1[10]), .B0(n5), .B1(ch_0[10]), .Y(
        data_out[10]) );
  AO22XLTS U4 ( .A0(n3), .A1(ch_1[16]), .B0(n5), .B1(ch_0[16]), .Y(
        data_out[16]) );
  AO22XLTS U5 ( .A0(n1), .A1(ch_1[28]), .B0(n6), .B1(ch_0[28]), .Y(
        data_out[28]) );
  AO22XLTS U6 ( .A0(n2), .A1(ch_1[6]), .B0(n4), .B1(ch_0[6]), .Y(data_out[6])
         );
  AO22XLTS U7 ( .A0(n2), .A1(ch_1[20]), .B0(n6), .B1(ch_0[20]), .Y(
        data_out[20]) );
  AO22XLTS U8 ( .A0(n1), .A1(ch_1[21]), .B0(n6), .B1(ch_0[21]), .Y(
        data_out[21]) );
  AO22XLTS U9 ( .A0(n3), .A1(ch_1[22]), .B0(n6), .B1(ch_0[22]), .Y(
        data_out[22]) );
  AO22XLTS U10 ( .A0(n1), .A1(ch_1[1]), .B0(n4), .B1(ch_0[1]), .Y(data_out[1])
         );
  AO22XLTS U11 ( .A0(n1), .A1(ch_1[15]), .B0(n5), .B1(ch_0[15]), .Y(
        data_out[15]) );
  AO22XLTS U12 ( .A0(n2), .A1(ch_1[17]), .B0(n5), .B1(ch_0[17]), .Y(
        data_out[17]) );
  AO22XLTS U13 ( .A0(n3), .A1(ch_1[19]), .B0(n5), .B1(ch_0[19]), .Y(
        data_out[19]) );
  AO22XLTS U14 ( .A0(n3), .A1(ch_1[2]), .B0(n4), .B1(ch_0[2]), .Y(data_out[2])
         );
  AO22XLTS U15 ( .A0(n2), .A1(ch_1[11]), .B0(n5), .B1(ch_0[11]), .Y(
        data_out[11]) );
  AO22XLTS U16 ( .A0(n2), .A1(ch_1[0]), .B0(n4), .B1(ch_0[0]), .Y(data_out[0])
         );
  AO22XLTS U17 ( .A0(n2), .A1(ch_1[3]), .B0(n4), .B1(ch_0[3]), .Y(data_out[3])
         );
  AO22XLTS U18 ( .A0(n1), .A1(ch_1[9]), .B0(n4), .B1(ch_0[9]), .Y(data_out[9])
         );
  AO22XLTS U19 ( .A0(n2), .A1(ch_1[14]), .B0(n5), .B1(ch_0[14]), .Y(
        data_out[14]) );
  AO22XLTS U20 ( .A0(n1), .A1(ch_1[18]), .B0(n5), .B1(ch_0[18]), .Y(
        data_out[18]) );
  AO22XLTS U21 ( .A0(n2), .A1(ch_1[8]), .B0(n4), .B1(ch_0[8]), .Y(data_out[8])
         );
  AO22XLTS U22 ( .A0(select), .A1(ch_1[23]), .B0(n6), .B1(ch_0[23]), .Y(
        data_out[23]) );
  AO22XLTS U23 ( .A0(select), .A1(ch_1[7]), .B0(n4), .B1(ch_0[7]), .Y(
        data_out[7]) );
  AO22XLTS U24 ( .A0(n2), .A1(ch_1[29]), .B0(n6), .B1(ch_0[29]), .Y(
        data_out[29]) );
  AO22XLTS U25 ( .A0(n3), .A1(ch_1[30]), .B0(n7), .B1(ch_0[30]), .Y(
        data_out[30]) );
  AO22XLTS U26 ( .A0(n1), .A1(ch_1[12]), .B0(n5), .B1(ch_0[12]), .Y(
        data_out[12]) );
  AO22XLTS U27 ( .A0(n3), .A1(ch_1[13]), .B0(n5), .B1(ch_0[13]), .Y(
        data_out[13]) );
  AO22XLTS U28 ( .A0(n2), .A1(ch_1[27]), .B0(n6), .B1(ch_0[27]), .Y(
        data_out[27]) );
  AO22XLTS U29 ( .A0(n1), .A1(ch_1[25]), .B0(n6), .B1(ch_0[25]), .Y(
        data_out[25]) );
  AO22XLTS U30 ( .A0(n3), .A1(ch_1[26]), .B0(n6), .B1(ch_0[26]), .Y(
        data_out[26]) );
  AO22XLTS U31 ( .A0(n1), .A1(ch_1[31]), .B0(n7), .B1(ch_0[31]), .Y(
        data_out[31]) );
  AO22XLTS U32 ( .A0(n3), .A1(ch_1[24]), .B0(n6), .B1(ch_0[24]), .Y(
        data_out[24]) );
  BUFX3TS U33 ( .A(select), .Y(n1) );
  BUFX3TS U34 ( .A(select), .Y(n2) );
  BUFX3TS U35 ( .A(select), .Y(n3) );
  INVX2TS U36 ( .A(select), .Y(n7) );
  BUFX3TS U37 ( .A(n7), .Y(n4) );
  BUFX3TS U38 ( .A(n7), .Y(n5) );
  BUFX3TS U39 ( .A(n7), .Y(n6) );
initial $sdf_annotate("FPU_Interface2_RKOA_1STAGE_syn.sdf"); 
 endmodule


module Mux_2x1_W1_0 ( select, ch_0, ch_1, data_out );
  input [0:0] ch_0;
  input [0:0] ch_1;
  output [0:0] data_out;
  input select;
  wire   n1;

  INVX2TS U1 ( .A(select), .Y(n1) );
  AO22XLTS U2 ( .A0(n1), .A1(ch_0[0]), .B0(select), .B1(ch_1[0]), .Y(
        data_out[0]) );
initial $sdf_annotate("FPU_Interface2_RKOA_1STAGE_syn.sdf"); 
 endmodule


module Mux_2x1_W1_1 ( select, ch_0, ch_1, data_out );
  input [0:0] ch_0;
  input [0:0] ch_1;
  output [0:0] data_out;
  input select;
  wire   n1;

  INVX2TS U1 ( .A(select), .Y(n1) );
  AO22XLTS U2 ( .A0(n1), .A1(ch_0[0]), .B0(select), .B1(ch_1[0]), .Y(
        data_out[0]) );
initial $sdf_annotate("FPU_Interface2_RKOA_1STAGE_syn.sdf"); 
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
initial $sdf_annotate("FPU_Interface2_RKOA_1STAGE_syn.sdf"); 
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
         n72, n73, n74, n75, n76, n77, n78, n79, n80;
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

  d_ff_en_W2 operation_dff ( .clk(clk), .rst(rst), .enable(1'b1), .D({n36, n38}), .Q(operation_reg) );
  d_ff_en_W32_1 reg_dataA ( .clk(clk), .rst(rst), .enable(1'b1), .D(Data_1), 
        .Q(dataA), .OUT4(n71) );
  d_ff_en_W32_0 reg_dataB ( .clk(clk), .rst(rst), .enable(1'b1), .D(Data_2), 
        .Q(dataB), .OUT3(n76), .OUT4(n74), .OUT5(n72) );
  d_ff_en_W1 NaN_dff ( .clk(clk), .rst(rst), .enable(1'b1), .D(NaN_reg), .Q(
        NaN_flag) );
  demux_1x3_1 demux_beg_op ( .data(begin_operation), .select({n35, n41}), 
        .ch1(beg_fsm_addsubt), .ch2(beg_fsm_cordic), .ch3(beg_fsm_mult) );
  demux_1x3_0 demux_ack_op ( .data(ack_operation), .select({n36, n39}), .ch2(
        ack_fsm_cordic), .ch3(ack_fsm_mult) );
  deco_op deco_operation ( .operation({n41, operation[0]}), .op_mod_add_subt(
        op_mod_add_subt), .op_mod_cordic(op_mod_cordic) );
  Mux_2x1_W1_3 mux_beg_addsubt ( .select(n41), .ch_0(beg_fsm_addsubt), .ch_1(
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
  DFFRXLTS R_12 ( .D(n69), .CK(clk), .RN(n71), .Q(n77) );
  DFFSX1TS R_3 ( .D(n75), .CK(clk), .SN(n74), .Q(n79) );
  DFFSX1TS R_4 ( .D(n73), .CK(clk), .SN(n72), .Q(n80) );
  DFFSX1TS R_11 ( .D(n70), .CK(clk), .SN(n76), .Q(n78) );
  INVX2TS U37 ( .A(n34), .Y(n35) );
  INVX2TS U38 ( .A(n40), .Y(n38) );
  INVX2TS U39 ( .A(operation[1]), .Y(n40) );
  CLKINVX3TS U40 ( .A(n40), .Y(n41) );
  INVX4TS U41 ( .A(operation[2]), .Y(n34) );
  NAND3X1TS U42 ( .A(n52), .B(n51), .C(n50), .Y(n69) );
  NAND3X1TS U43 ( .A(n44), .B(n43), .C(n42), .Y(n45) );
  NAND3XLTS U44 ( .A(dataB[28]), .B(dataB[23]), .C(dataB[25]), .Y(n63) );
  AOI31XLTS U45 ( .A0(n61), .A1(n60), .A2(n59), .B0(n66), .Y(n64) );
  NOR3XLTS U46 ( .A(dataA[2]), .B(dataA[5]), .C(dataA[4]), .Y(n48) );
  NAND4XLTS U47 ( .A(dataA[30]), .B(dataA[27]), .C(dataA[28]), .D(dataA[26]), 
        .Y(n54) );
  NAND4XLTS U48 ( .A(dataA[29]), .B(dataA[23]), .C(dataA[25]), .D(dataA[24]), 
        .Y(n53) );
  NAND4XLTS U49 ( .A(n80), .B(n79), .C(n78), .D(n65), .Y(n67) );
  INVX2TS U50 ( .A(n34), .Y(n36) );
  INVX2TS U51 ( .A(n40), .Y(n39) );
  NOR4X1TS U52 ( .A(dataB[17]), .B(dataB[16]), .C(dataB[8]), .D(n45), .Y(n70)
         );
  NOR4X1TS U53 ( .A(dataA[13]), .B(dataA[15]), .C(dataA[17]), .D(dataA[18]), 
        .Y(n46) );
  NOR4X1TS U54 ( .A(dataA[21]), .B(dataA[19]), .C(dataA[14]), .D(dataA[20]), 
        .Y(n47) );
  NOR4X1TS U55 ( .A(dataB[4]), .B(dataB[18]), .C(dataB[20]), .D(dataB[1]), .Y(
        n43) );
  NOR4X1TS U56 ( .A(dataA[8]), .B(dataA[7]), .C(dataA[6]), .D(dataA[0]), .Y(
        n51) );
  NOR4X1TS U57 ( .A(dataB[3]), .B(dataB[5]), .C(dataB[22]), .D(dataB[0]), .Y(
        n42) );
  AOI31XLTS U58 ( .A0(n57), .A1(n56), .A2(n55), .B0(dataB[27]), .Y(n68) );
  NOR4X1TS U59 ( .A(dataB[7]), .B(dataB[9]), .C(dataB[11]), .D(dataB[6]), .Y(
        n73) );
  NOR4X1TS U60 ( .A(dataB[2]), .B(dataB[10]), .C(dataB[12]), .D(dataB[14]), 
        .Y(n75) );
  NOR4X1TS U61 ( .A(dataA[3]), .B(dataA[16]), .C(dataA[1]), .D(dataA[22]), .Y(
        n49) );
  NOR4X1TS U62 ( .A(dataB[15]), .B(dataB[19]), .C(dataB[13]), .D(dataB[21]), 
        .Y(n44) );
  NOR4X1TS U63 ( .A(dataA[12]), .B(dataA[11]), .C(dataA[10]), .D(dataA[9]), 
        .Y(n52) );
  NOR3XLTS U64 ( .A(dataB[25]), .B(dataB[31]), .C(n58), .Y(n55) );
  AND4X1TS U66 ( .A(n49), .B(n48), .C(n47), .D(n46), .Y(n50) );
  NOR4BX1TS U67 ( .AN(operation_reg[1]), .B(dataB[28]), .C(operation_reg[0]), 
        .D(dataB[23]), .Y(n57) );
  NOR4X1TS U68 ( .A(dataB[30]), .B(dataB[24]), .C(dataB[26]), .D(dataB[29]), 
        .Y(n56) );
  OR3X1TS U69 ( .A(n77), .B(n54), .C(n53), .Y(n58) );
  NOR4X1TS U70 ( .A(dataA[30]), .B(dataA[27]), .C(dataA[28]), .D(dataA[26]), 
        .Y(n61) );
  NOR4X1TS U71 ( .A(dataA[29]), .B(dataA[23]), .C(dataA[25]), .D(dataA[24]), 
        .Y(n60) );
  NOR4BX1TS U72 ( .AN(operation_reg[1]), .B(dataA[31]), .C(operation_reg[0]), 
        .D(n77), .Y(n59) );
  NOR2X1TS U73 ( .A(operation_reg[1]), .B(n58), .Y(n66) );
  NAND4XLTS U74 ( .A(dataB[30]), .B(dataB[24]), .C(dataB[26]), .D(dataB[29]), 
        .Y(n62) );
  OAI31X1TS U75 ( .A0(n64), .A1(n63), .A2(n62), .B0(dataB[27]), .Y(n65) );
  OAI2BB2XLTS U76 ( .B0(n68), .B1(n67), .A0N(n66), .A1N(operation_reg[0]), .Y(
        NaN_reg) );
initial $sdf_annotate("FPU_Interface2_RKOA_1STAGE_syn.sdf"); 
 endmodule

