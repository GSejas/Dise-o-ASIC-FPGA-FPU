/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : L-2016.03-SP3
// Date      : Tue Nov  8 02:12:08 2016
/////////////////////////////////////////////////////////////


module CORDIC_Arch3v1_W32_EW8_SW23_SWR26_EWR5 ( clk, rst, beg_fsm_cordic, 
        ack_cordic, operation, data_in, shift_region_flag, ready_cordic, 
        data_output, beg_add_subt, add_subt_dataA, add_subt_dataB, 
        result_add_subt, op_add_subt, ready_add_subt, enab_cont_iter );
  input [31:0] data_in;
  input [1:0] shift_region_flag;
  output [31:0] data_output;
  output [31:0] add_subt_dataA;
  output [31:0] add_subt_dataB;
  input [31:0] result_add_subt;
  input clk, rst, beg_fsm_cordic, ack_cordic, operation, ready_add_subt;
  output ready_cordic, beg_add_subt, op_add_subt, enab_cont_iter;
  wire   d_ff3_sign_out, n640, n641, n642, n643, n645, n646, n647, n648, n649,
         n650, n651, n652, n653, n654, n655, n656, n657, n658, n659, n660,
         n661, n662, n663, n664, n665, n666, n667, n668, n669, n670, n671,
         n672, n673, n674, n675, n676, n677, n678, n679, n680, n681, n682,
         n683, n684, n685, n686, n687, n688, n689, n690, n691, n692, n693,
         n694, n695, n696, n697, n698, n699, n700, n701, n702, n703, n704,
         n705, n707, n708, n709, n710, n711, n712, n713, n714, n715, n716,
         n717, n718, n719, n720, n721, n722, n723, n724, n725, n726, n727,
         n728, n729, n730, n731, n732, n733, n734, n735, n736, n737, n738,
         n739, n740, n741, n742, n743, n744, n745, n746, n747, n748, n749,
         n750, n751, n752, n753, n754, n755, n756, n757, n758, n759, n760,
         n761, n762, n763, n764, n765, n766, n767, n768, n801, n802, n804,
         n805, n806, n807, n808, n809, n810, n811, n812, n813, n814, n815,
         n816, n817, n818, n819, n820, n821, n854, n855, n856, n857, n858,
         n859, n860, n861, n862, n863, n864, n865, n866, n867, n868, n869,
         n870, n871, n872, n873, n874, n875, n876, n877, n878, n879, n880,
         n881, n882, n883, n884, n885, n886, n887, n888, n889, n890, n891,
         n892, n893, n894, n895, n896, n897, n898, n899, n900, n901, n902,
         n903, n904, n905, n906, n907, n908, n909, n910, n911, n912, n913,
         n914, n915, n916, n917, n950, n951, n952, n953, n954, n955, n956,
         n957, n959, n960, n961, n962, n963, n964, n965, n966, n967, n968,
         n969, n970, n971, n972, n973, n974, n975, n976, n977, n978, n979,
         n980, n981, n982, n983, n984, n985, n986, n988, n990, net23562,
         net23567, net27489, net27486, net27561, net27844, net27858, net27861,
         net27868, inst_CORDIC_FSM_v3_state_reg_0_, net27998, net27999,
         net28000, net28181, net28182, net28183, net28336, net28350, net28353,
         net28357, net28360, net28374, net28420, net28436, net34235, net34237,
         net34246, net34251, net34260, net34265, net34395, net34449, net34453,
         net34460, net34486, net34489, net34495, net34498, net34525, net34533,
         net34538, net34540, net34700, net34732, net34742, net34745, net34771,
         net34772, net34828, net34830, net34833, net34843, net34855, net34875,
         net34887, net34898, net34901, net34944, net34982, net34983, net34987,
         net35006, net35015, net35017, net35027, net35039, net35054, net35106,
         net35109, net35299, net35306, net35328, net35334, net35335, net35336,
         net35368, net35371, net35372, net35373, net35383, net35393, net35421,
         net35481, net35492, net35498, net35575, net35581, net35596, net35652,
         net35665, net35684, net35705, net35718, net35717, net35729, net35733,
         net35813, net35832, net35831, net35844, net35843, net35846, net35849,
         net35873, net35877, net35880, net35923, net35927, net35977, net35976,
         net36078, net36143, net36152, net36258, net36257, net36274, net36282,
         net36293, net36302, net36390, net36400, net36422, net36489, net36493,
         net36503, net36545, net36548, net36617, net36640, net36779, net36827,
         net36990, net36991, net36998, net37058, net37099, net37108, net37160,
         net37196, net37583, net37627, net37201, net37158, net35303, net36594,
         net36122, net35428, net35392, net35324, net35309, net34914, net34831,
         net35323, net35004, net34832, net34546, net37107, net34779, net34778,
         net37029, net34740, net35476, net37548, net37547, net37546, net37544,
         net36296, net36058, net35508, net35501, net35356, net34567, net37190,
         net35427, net35341, net35003, net34959, net34856, net34782, net34781,
         net35442, net36997, net26466, net26474, n1056, n1057, n1058, n1059,
         n1060, n1061, n1062, n1063, n1064, n1065, n1066, n1067, n1068, n1069,
         n1071, n1072, n1073, n1074, n1075, n1076, n1077, n1078, n1079, n1080,
         n1081, n1082, n1083, n1084, n1085, n1086, n1087, n1088, n1089, n1090,
         n1091, n1092, n1093, n1094, n1095, n1096, n1097, n1098, n1099, n1100,
         n1101, n1102, n1103, n1104, n1105, n1106, n1107, n1108, n1110, n1111,
         n1112, n1113, n1114, n1115, n1116, n1117, n1118, n1119, n1120, n1121,
         n1122, n1123, n1124, n1125, n1126, n1127, n1128, n1129, n1130, n1131,
         n1132, n1133, n1134, n1135, n1136, n1137, n1138, n1139, n1140, n1141,
         n1142, n1143, n1144, n1145, n1146, n1147, n1148, n1149, n1150, n1151,
         n1152, n1153, n1154, n1155, n1156, n1157, n1158, n1159, n1160, n1161,
         n1162, n1163, n1164, n1165, n1166, n1167, n1168, n1169, n1170, n1171,
         n1172, n1173, n1174, n1175, n1176, n1177, n1178, n1179, n1180, n1181,
         n1182, n1183, n1184, n1185, n1187, n1188, n1189, n1190, n1191, n1192,
         n1193, n1194, n1195, n1196, n1197, n1198, n1199, n1200, n1201, n1202,
         n1203, n1204, n1205, n1206, n1207, n1208, n1209, n1210, n1211, n1212,
         n1213, n1214, n1215, n1216, n1217, n1218, n1219, n1220, n1221, n1222,
         n1223, n1224, n1225, n1226, n1227, n1228, n1229, n1230, n1231, n1232,
         n1233, n1234, n1235, n1236, n1237, n1238, n1239, n1241, n1242, n1243,
         n1244, n1245, n1249, n1250, n1251, n1252, n1253, n1254, n1255, n1256,
         n1257, n1258, n1259, n1260, n1261, n1262, n1263, n1264, n1265, n1266,
         n1267, n1268, n1270, n1271, n1272, n1273, n1274, n1275, n1276, n1277,
         n1278, n1279, n1280, n1281, n1282, n1283, n1284, n1285, n1286, n1287,
         n1288, n1289, n1290, n1292, n1293, n1294, n1295, n1296, n1297, n1298,
         n1299, n1300, n1301, n1302, n1303, n1304, n1305, n1306, n1307, n1308,
         n1309, n1311, n1314, n1315, n1317, n1318, n1319, n1320, n1321, n1322,
         n1323, n1325, n1326, n1327, n1328, n1329, n1330, n1331, n1332, n1333,
         n1334, n1335, n1336, n1337, n1338, n1339, n1340, n1341, n1342, n1343,
         n1344, n1345, n1346, n1347, n1348, n1349, n1350, n1351, n1353, n1354,
         n1355, n1356, n1357, n1358, n1359, n1360, n1361, n1362, n1363, n1364,
         n1365, n1366, n1367, n1368, n1369, n1370, n1371, n1372, n1373, n1374,
         n1375, n1376, n1377, n1378, n1379, n1380, n1381, n1382, n1383, n1384,
         n1385, n1386, n1387, n1388, n1389, n1390, n1391, n1392, n1393, n1394,
         n1395, n1396, n1397, n1398, n1399, n1400, n1401, n1402, n1403, n1404,
         n1405, n1406, n1407, n1408, n1409, n1410, n1411, n1412, n1413, n1414,
         n1415, n1416, n1417, n1418, n1419, n1420, n1421, n1422, n1423, n1424,
         n1425, n1426, n1427, n1428, n1429, n1430, n1431, n1432, n1433, n1434,
         n1435, n1436, n1437, n1438, n1439, n1440, n1441, n1442, n1443, n1444,
         n1445, n1446, n1447, n1448, n1449, n1450, n1451, n1452, n1453, n1454,
         n1455, n1456, n1457, n1458, n1459, n1460, n1461, n1462, n1463, n1464,
         n1465, n1466, n1467, n1468, n1469, n1470, n1471, n1472, n1473, n1474,
         n1475, n1476, n1477, n1478, n1479, n1480, n1481, n1482, n1483, n1484,
         n1485, n1486, n1487, n1488, n1489, n1490, n1491, n1492, n1493, n1494,
         n1495, n1496, n1497, n1498, n1499, n1500, n1501, n1502, n1503, n1504,
         n1505, n1506, n1507, n1508, n1509, n1510, n1511, n1512, n1513, n1514,
         n1515, n1516, n1517, n1518, n1519, n1520, n1521, n1522, n1523, n1524,
         n1525, n1526, n1527, n1528, n1529, n1530, n1531, n1532, n1533, n1534,
         n1535, n1536, n1537, n1538, n1539, n1540, n1541, n1542, n1543, n1544,
         n1545, n1546, n1547, n1548, n1549, n1550, n1551, n1552, n1553, n1554,
         n1555, n1556, n1557, n1558, n1559, n1560, n1561, n1562, n1563, n1564,
         n1565, n1566, n1567, n1568, n1569, n1570, n1571, n1572, n1573, n1574,
         n1575, n1576, n1577, n1578, n1579, n1580, n1581, n1582, n1583, n1584,
         n1585, n1586, n1587, n1588, n1589, n1590, n1591, n1592, n1593, n1594,
         n1595, n1596, n1597, n1598, n1599, n1600, n1601, n1602, n1603, n1604,
         n1605, n1606, n1607, n1608, n1609, n1610, n1611, n1612, n1613, n1614,
         n1615, n1616, n1617, n1618, n1619, n1620, n1621, n1622, n1623, n1624,
         n1625, n1626, n1627, n1628, n1629, n1630, n1631, n1632, n1633, n1634,
         n1635, n1636, n1637, n1638, n1639, n1640, n1641, n1642, n1643, n1644,
         n1645, n1646, n1647, n1648, n1649, n1650, n1651, n1652, n1653, n1654,
         n1655, n1656, n1657, n1658, n1659, n1660, n1661, n1662, n1663, n1664,
         n1665, n1666, n1667, n1668, n1669, n1670, n1671, n1672, n1673, n1674,
         n1675, n1676, n1677, n1678, n1679, n1680, n1681, n1682, n1683, n1684,
         n1685, n1686, n1687, n1688, n1689, n1690, n1691, n1692, n1693, n1694,
         n1695, n1696, n1697, n1698, n1699, n1700, n1701, n1702, n1703, n1704,
         n1705, n1706, n1707, n1708, n1709, n1710, n1711, n1712, n1713, n1714,
         n1715, n1716, n1717, n1718, n1719, n1720, n1721, n1722, n1723, n1724,
         n1725, n1726, n1727, n1728, n1729, n1730, n1731, n1732, n1733, n1734,
         n1735, n1736, n1737, n1738, n1739, n1740, n1741, n1742, n1743, n1744,
         n1745, n1746, n1747, n1748, n1749, n1750, n1751, n1752, n1753, n1754,
         n1755, n1756, n1757, n1758, n1759, n1760, n1761, n1762, n1763, n1764,
         n1765, n1766, n1767, n1768, n1769, n1770, n1771, n1772, n1773, n1774,
         n1775, n1776, n1777, n1778, n1779, n1780, n1781, n1782, n1783, n1784,
         n1785, n1786, n1787, n1788, n1789, n1790, n1791, n1792, n1793, n1794,
         n1795, n1796, n1797, n1798, n1799, n1800, n1801, n1802, n1803, n1804,
         n1805, n1806, n1807, n1808, n1809, n1810, n1811, n1812, n1813, n1814,
         n1815, n1816, n1817, n1818, n1819, n1820, n1821, n1822, n1823, n1824,
         n1825, n1826, n1827, n1828, n1829, n1830, n1831, n1832, n1833, n1834,
         n1835, n1836, n1837, n1838, n1839, n1840, n1841, n1842, n1843, n1844,
         n1845, n1846, n1847, n1848, n1849, n1850, n1851, n1852, n1853, n1854,
         n1855, n1856, n1857, n1858, n1859, n1860, n1861, n1862, n1863, n1864,
         n1865, n1866, n1867, n1868, n1869, n1870, n1871, n1872, n1873, n1874,
         n1875, n1876, n1877, n1878, n1879, n1880, n1881, n1882, n1883, n1884,
         n1885, n1886, n1887, n1888, n1889, n1890, n1891, n1892, n1893, n1894,
         n1895, n1896, n1897, n1898, n1899, n1900, n1901, n1902, n1903, n1904,
         n1905, n1906, n1907, n1908, n1909, n1910, n1911, n1912, n1913, n1914,
         n1915, n1916, n1917, n1918, n1919, n1920, n1921, n1922, n1923, n1924,
         n1925, n1926, n1927, n1928, n1929, n1930, n1931, n1932, n1933, n1934,
         n1935, n1936, n1937, n1938, n1939, n1940, n1941, n1942, n1943, n1944,
         n1945, n1946, n1947, n1948, n1949, n1950, n1951, n1952, n1953, n1954,
         n1955, n1956, n1957, n1958, n1959, n1960, n1961, n1962, n1963, n1964,
         n1965, n1966, n1967, n1968, n1969, n1970, n1971, n1972, n1973, n1974,
         n1975, n1976, n1977, n1978, n1979, n1980, n1981, n1982, n1983, n1984,
         n1985, n1986, n1987, n1988, n1989, n1990, n1991, n1992, n1993, n1994,
         n1995, n1996, n1997, n1998, n1999, n2000, n2001, n2002, n2003, n2004,
         n2005, n2006, n2007, n2008, n2009, n2010, n2011, n2012, n2013, n2014,
         n2015, n2016, n2017, n2018, n2019, n2020, n2021, n2022, n2023, n2024,
         n2025, n2026, n2027, n2028, n2029, n2030, n2031, n2032, n2033, n2037,
         n2038, n2039, n2040, n2041, n2042, n2043, n2044, n2045, n2046, n2047,
         n2048, n2049, n2050, n2051, n2052, n2053, n2054, n2055, n2056, n2057,
         n2058, n2059, n2060, n2061, n2062, n2063, n2064, n2065, n2066, n2067,
         n2068, n2069, n2070, n2071, n2072, n2073, n2074, n2075, n2076, n2077,
         n2078, n2079, n2080, n2081, n2082, n2083, n2084, n2085, n2086, n2087,
         n2088, n2089, n2090, n2091, n2092, n2093, n2094, n2095, n2096, n2097,
         n2098, n2099, n2100, n2101, n2102, n2103, n2104, n2105, n2106, n2107,
         n2108, n2109, n2110, n2111, n2112, n2113, n2114, n2115, n2116, n2117,
         n2118, n2119, n2120, n2121, n2122, n2123, n2124, n2125, n2126, n2127,
         n2128, n2129, n2130, n2131, n2132, n2133, n2134, n2135, n2136, n2137,
         n2138, n2139, n2140, n2141, n2142, n2143, n2144, n2145, n2146, n2147,
         n2148, n2149, n2150, n2151, n2152, n2153, n2154, n2155, n2156, n2157,
         n2158, n2159, n2160, n2161, n2162, n2163, n2164, n2165, n2166, n2167,
         n2168, n2169, n2170, n2171, n2172, n2173, n2174, n2175, n2176, n2177,
         n2178, n2179, n2180, n2181, n2182, n2183, n2184, n2185, n2186, n2187,
         n2188, n2189, n2190, n2191, n2192, n2193, n2194, n2195, n2196, n2197,
         n2198, n2199, n2200, n2201, n2202, n2203, n2204, n2205, n2206, n2207,
         n2208, n2209, n2210, n2211, n2212, n2213, n2214, n2215, n2216, n2217,
         n2218, n2219, n2220, n2221, n2222, n2223, n2224, n2225, n2226, n2227,
         n2228, n2229, n2230, n2231, n2232, n2233, n2235, n2236, n2237, n2238,
         n2239, n2240, n2241, n2242, n2243, n2244, n2245, n2246, n2247, n2248,
         n2249, n2250, n2251, n2252, n2253, n2254, n2255, n2256, n2257, n2258,
         n2259, n2260, n2261, n2262, n2263, n2264, n2265, n2266, n2267, n2268,
         n2269, n2270, n2271, n2272, n2273, n2274, n2275, n2276, n2277, n2278,
         n2279, n2280, n2281, n2282, n2283, n2284, n2285, n2286, n2287, n2288,
         n2289, n2290, n2291, n2292, n2293, n2294, n2295, n2296, n2297, n2298,
         n2299, n2300, n2301, n2302, n2303, n2304, n2305, n2306, n2307, n2308,
         n2309, n2310, n2311, n2312, n2313, n2314, n2315, n2316, n2317, n2318,
         n2319, n2320, n2321, n2322, n2323, n2324, n2325, n2326, n2327, n2328,
         n2329, n2330, n2331, n2332, n2333, n2334, n2335, n2336, n2337, n2338,
         n2339, n2340, n2341, n2342, n2343, n2345, n2346, n2347, n2348, n2349,
         n2350, n2353, n2354, n2355, n2356, n2357, n2358, n2359, n2360, n2361,
         n2362, n2363, n2364, n2365, n2366, n2367, n2368, n2369, n2370, n2371,
         n2372, n2373, n2374, n2376;
  wire   [30:0] d_ff1_Z;
  wire   [31:0] d_ff_Xn;
  wire   [29:0] d_ff_Yn;
  wire   [30:0] d_ff2_X;
  wire   [31:0] d_ff2_Y;
  wire   [31:0] d_ff2_Z;
  wire   [31:0] d_ff3_sh_x_out;
  wire   [31:0] d_ff3_sh_y_out;
  wire   [26:0] d_ff3_LUT_out;
  wire   [7:0] inst_CORDIC_FSM_v3_state_next;

  DFFRXLTS reg_Z0_Q_reg_3_ ( .D(n978), .CK(clk), .RN(n1454), .Q(d_ff1_Z[3]), 
        .QN(n2099) );
  DFFRXLTS reg_Z0_Q_reg_7_ ( .D(n974), .CK(clk), .RN(n2240), .Q(d_ff1_Z[7]), 
        .QN(n2107) );
  DFFRXLTS reg_Z0_Q_reg_9_ ( .D(n972), .CK(clk), .RN(n1455), .Q(d_ff1_Z[9]), 
        .QN(n2071) );
  DFFRXLTS reg_Z0_Q_reg_10_ ( .D(n971), .CK(clk), .RN(n1455), .Q(d_ff1_Z[10]), 
        .QN(n2100) );
  DFFRX1TS d_ff4_Yn_Q_reg_18_ ( .D(n899), .CK(clk), .RN(n1065), .Q(d_ff_Yn[18]), .QN(n2129) );
  DFFRX2TS d_ff4_Xn_Q_reg_1_ ( .D(n884), .CK(clk), .RN(n2251), .Q(d_ff_Xn[1]), 
        .QN(n2037) );
  DFFRX2TS d_ff4_Xn_Q_reg_5_ ( .D(n880), .CK(clk), .RN(n2248), .Q(d_ff_Xn[5]), 
        .QN(n2040) );
  DFFRX2TS d_ff4_Xn_Q_reg_6_ ( .D(n879), .CK(clk), .RN(n1450), .Q(d_ff_Xn[6]), 
        .QN(n2041) );
  DFFRX1TS d_ff4_Xn_Q_reg_15_ ( .D(n870), .CK(clk), .RN(n2243), .Q(d_ff_Xn[15]), .QN(n2123) );
  DFFRX1TS reg_LUT_Q_reg_3_ ( .D(n818), .CK(clk), .RN(n2250), .Q(
        d_ff3_LUT_out[3]), .QN(n2066) );
  DFFRX1TS reg_LUT_Q_reg_4_ ( .D(n817), .CK(clk), .RN(n2249), .Q(
        d_ff3_LUT_out[4]) );
  DFFRXLTS reg_LUT_Q_reg_12_ ( .D(n810), .CK(clk), .RN(n2245), .Q(
        d_ff3_LUT_out[12]), .QN(n1482) );
  DFFRX1TS reg_LUT_Q_reg_15_ ( .D(n808), .CK(clk), .RN(n2243), .Q(
        d_ff3_LUT_out[15]), .QN(n2067) );
  DFFRXLTS reg_LUT_Q_reg_21_ ( .D(n806), .CK(clk), .RN(n2240), .Q(
        d_ff3_LUT_out[21]) );
  DFFRX1TS reg_shift_y_Q_reg_28_ ( .D(n708), .CK(clk), .RN(n2263), .Q(
        d_ff3_sh_y_out[28]) );
  DFFRX1TS reg_shift_y_Q_reg_29_ ( .D(n707), .CK(clk), .RN(n2263), .Q(
        d_ff3_sh_y_out[29]) );
  DFFRX1TS reg_shift_y_Q_reg_30_ ( .D(n2311), .CK(clk), .RN(n2262), .Q(
        d_ff3_sh_y_out[30]) );
  DFFRXLTS reg_shift_x_Q_reg_26_ ( .D(n646), .CK(clk), .RN(n2264), .Q(
        d_ff3_sh_x_out[26]), .QN(n2069) );
  DFFRX1TS reg_shift_x_Q_reg_27_ ( .D(n645), .CK(clk), .RN(n2264), .Q(
        d_ff3_sh_x_out[27]) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_0_ ( .D(n2343), .CK(clk), .RN(n1450), .Q(
        d_ff2_Z[0]), .QN(n2229) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_5_ ( .D(n2338), .CK(clk), .RN(n1453), .Q(
        d_ff2_Z[5]), .QN(n2233) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_6_ ( .D(n2337), .CK(clk), .RN(n2259), .Q(
        d_ff2_Z[6]), .QN(n2228) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_8_ ( .D(n2335), .CK(clk), .RN(n2258), .Q(
        d_ff2_Z[8]), .QN(net27868) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_19_ ( .D(net23562), .CK(clk), .RN(n2260), 
        .Q(d_ff2_Z[19]), .QN(net27844) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_20_ ( .D(net23567), .CK(clk), .RN(n1454), 
        .Q(d_ff2_Z[20]), .QN(net27858) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_22_ ( .D(n2323), .CK(clk), .RN(n1457), 
        .Q(d_ff2_Z[22]), .QN(n2231) );
  DFFRXLTS reg_val_muxZ_2stage_Q_reg_28_ ( .D(n2317), .CK(clk), .RN(n1065), 
        .Q(d_ff2_Z[28]), .QN(n1407) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_2_ ( .D(n763), .CK(clk), .RN(n2250), .Q(
        d_ff2_Y[2]), .QN(n2078) );
  DFFRX1TS reg_shift_y_Q_reg_3_ ( .D(n760), .CK(clk), .RN(n2249), .Q(
        d_ff3_sh_y_out[3]) );
  DFFRX1TS reg_shift_y_Q_reg_5_ ( .D(n756), .CK(clk), .RN(n2248), .Q(
        d_ff3_sh_y_out[5]) );
  DFFRX1TS reg_shift_y_Q_reg_7_ ( .D(n752), .CK(clk), .RN(n1446), .Q(
        d_ff3_sh_y_out[7]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_11_ ( .D(n745), .CK(clk), .RN(n2246), .Q(
        d_ff2_Y[11]), .QN(n2085) );
  DFFRX1TS reg_shift_y_Q_reg_11_ ( .D(n744), .CK(clk), .RN(n2246), .Q(
        d_ff3_sh_y_out[11]) );
  DFFRX1TS reg_shift_y_Q_reg_13_ ( .D(n740), .CK(clk), .RN(n2244), .Q(
        d_ff3_sh_y_out[13]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_14_ ( .D(n739), .CK(clk), .RN(n2244), .Q(
        d_ff2_Y[14]), .QN(n2087) );
  DFFRX1TS reg_shift_y_Q_reg_14_ ( .D(n738), .CK(clk), .RN(n2244), .Q(
        d_ff3_sh_y_out[14]) );
  DFFRX1TS reg_shift_y_Q_reg_15_ ( .D(n736), .CK(clk), .RN(n2243), .Q(
        d_ff3_sh_y_out[15]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_16_ ( .D(n735), .CK(clk), .RN(n2243), .Q(
        d_ff2_Y[16]), .QN(n2088) );
  DFFRX1TS reg_shift_y_Q_reg_16_ ( .D(n734), .CK(clk), .RN(n2242), .Q(
        d_ff3_sh_y_out[16]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_17_ ( .D(n733), .CK(clk), .RN(n2242), .Q(
        d_ff2_Y[17]), .QN(n2089) );
  DFFRX1TS reg_shift_y_Q_reg_17_ ( .D(n732), .CK(clk), .RN(n2242), .Q(
        d_ff3_sh_y_out[17]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_18_ ( .D(n731), .CK(clk), .RN(n1065), .Q(
        d_ff2_Y[18]), .QN(n2075) );
  DFFRX1TS reg_shift_y_Q_reg_18_ ( .D(n730), .CK(clk), .RN(n1063), .Q(
        d_ff3_sh_y_out[18]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_19_ ( .D(n729), .CK(clk), .RN(n1444), .Q(
        d_ff2_Y[19]), .QN(n2076) );
  DFFRX1TS reg_shift_y_Q_reg_19_ ( .D(n728), .CK(clk), .RN(n1065), .Q(
        d_ff3_sh_y_out[19]) );
  DFFRX1TS reg_shift_y_Q_reg_20_ ( .D(n726), .CK(clk), .RN(n2376), .Q(
        d_ff3_sh_y_out[20]), .QN(n1410) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_22_ ( .D(n723), .CK(clk), .RN(n2239), .Q(
        d_ff2_Y[22]), .QN(n2090) );
  DFFRX1TS reg_shift_y_Q_reg_22_ ( .D(n722), .CK(clk), .RN(n2239), .Q(
        d_ff3_sh_y_out[22]) );
  DFFRX4TS reg_val_muxY_2stage_Q_reg_28_ ( .D(n716), .CK(clk), .RN(n2263), .Q(
        d_ff2_Y[28]), .QN(n2132) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_31_ ( .D(n705), .CK(clk), .RN(n2262), .Q(
        d_ff2_Y[31]) );
  DFFRX1TS reg_shift_y_Q_reg_31_ ( .D(n704), .CK(clk), .RN(n2262), .Q(
        d_ff3_sh_y_out[31]) );
  DFFRXLTS reg_shift_x_Q_reg_0_ ( .D(n702), .CK(clk), .RN(n2251), .Q(
        d_ff3_sh_x_out[0]), .QN(n1467) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_1_ ( .D(n701), .CK(clk), .RN(n2251), .Q(
        d_ff2_X[1]) );
  DFFRXLTS reg_shift_x_Q_reg_2_ ( .D(n698), .CK(clk), .RN(n2250), .Q(
        d_ff3_sh_x_out[2]), .QN(n1469) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_3_ ( .D(n697), .CK(clk), .RN(n2249), .Q(
        d_ff2_X[3]), .QN(n1271) );
  DFFRXLTS reg_shift_x_Q_reg_4_ ( .D(n694), .CK(clk), .RN(n2248), .Q(
        d_ff3_sh_x_out[4]), .QN(n1471) );
  DFFRX1TS reg_shift_x_Q_reg_5_ ( .D(n692), .CK(clk), .RN(n2248), .Q(
        d_ff3_sh_x_out[5]) );
  DFFRXLTS reg_shift_x_Q_reg_6_ ( .D(n690), .CK(clk), .RN(n1801), .Q(
        d_ff3_sh_x_out[6]), .QN(n1473) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_7_ ( .D(n689), .CK(clk), .RN(n2247), .Q(
        d_ff2_X[7]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_9_ ( .D(n685), .CK(clk), .RN(n1444), .Q(
        d_ff2_X[9]), .QN(n2059) );
  DFFRX1TS reg_shift_x_Q_reg_11_ ( .D(n680), .CK(clk), .RN(n2245), .Q(
        d_ff3_sh_x_out[11]) );
  DFFRXLTS reg_shift_x_Q_reg_12_ ( .D(n678), .CK(clk), .RN(n2245), .Q(
        d_ff3_sh_x_out[12]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_13_ ( .D(n677), .CK(clk), .RN(n2244), .Q(
        d_ff2_X[13]) );
  DFFRX1TS reg_shift_x_Q_reg_13_ ( .D(n676), .CK(clk), .RN(n2244), .Q(
        d_ff3_sh_x_out[13]) );
  DFFRX1TS reg_shift_x_Q_reg_14_ ( .D(n674), .CK(clk), .RN(n2243), .Q(
        d_ff3_sh_x_out[14]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_15_ ( .D(n673), .CK(clk), .RN(n2243), .Q(
        d_ff2_X[15]), .QN(n2060) );
  DFFRX1TS reg_shift_x_Q_reg_15_ ( .D(n672), .CK(clk), .RN(n2243), .Q(
        d_ff3_sh_x_out[15]) );
  DFFRX1TS reg_shift_x_Q_reg_16_ ( .D(n670), .CK(clk), .RN(n2242), .Q(
        d_ff3_sh_x_out[16]) );
  DFFRX1TS reg_shift_x_Q_reg_17_ ( .D(n668), .CK(clk), .RN(n2242), .Q(
        d_ff3_sh_x_out[17]), .QN(n1253) );
  DFFRX1TS reg_shift_x_Q_reg_18_ ( .D(n666), .CK(clk), .RN(n2241), .Q(
        d_ff3_sh_x_out[18]), .QN(n1418) );
  DFFRX1TS reg_shift_x_Q_reg_19_ ( .D(n664), .CK(clk), .RN(n1464), .Q(
        d_ff3_sh_x_out[19]) );
  DFFRX1TS reg_shift_x_Q_reg_20_ ( .D(n662), .CK(clk), .RN(n2257), .Q(
        d_ff3_sh_x_out[20]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_21_ ( .D(n661), .CK(clk), .RN(n2239), .Q(
        d_ff2_X[21]), .QN(n2062) );
  DFFRX1TS reg_shift_x_Q_reg_22_ ( .D(n658), .CK(clk), .RN(n1448), .Q(
        d_ff3_sh_x_out[22]) );
  DFFRX1TS reg_shift_x_Q_reg_31_ ( .D(n640), .CK(clk), .RN(n1450), .Q(
        d_ff3_sh_x_out[31]), .QN(n1270) );
  DFFRX1TS reg_shift_x_Q_reg_29_ ( .D(n643), .CK(clk), .RN(n2262), .Q(
        d_ff3_sh_x_out[29]) );
  DFFRXLTS reg_Z0_Q_reg_27_ ( .D(n954), .CK(clk), .RN(n2255), .Q(d_ff1_Z[27]), 
        .QN(net28353) );
  DFFRXLTS reg_Z0_Q_reg_24_ ( .D(n957), .CK(clk), .RN(n1457), .Q(d_ff1_Z[24]), 
        .QN(net28350) );
  DFFRXLTS reg_Z0_Q_reg_19_ ( .D(n962), .CK(clk), .RN(n2254), .Q(d_ff1_Z[19]), 
        .QN(net28360) );
  DFFRXLTS reg_Z0_Q_reg_15_ ( .D(n966), .CK(clk), .RN(n2260), .Q(d_ff1_Z[15]), 
        .QN(n2093) );
  DFFRXLTS reg_Z0_Q_reg_0_ ( .D(n981), .CK(clk), .RN(n1450), .Q(d_ff1_Z[0]), 
        .QN(n2111) );
  DFFSX2TS R_23 ( .D(net26466), .CK(clk), .SN(n1454), .Q(net27999) );
  DFFSX2TS R_26 ( .D(n1207), .CK(clk), .SN(n1445), .Q(n2219) );
  DFFSX2TS R_29 ( .D(n1266), .CK(clk), .SN(n2241), .Q(n2216) );
  DFFSX2TS R_32 ( .D(n1306), .CK(clk), .SN(n1066), .Q(n2213) );
  DFFSX2TS R_35 ( .D(net36143), .CK(clk), .SN(n1445), .Q(n2211) );
  DFFSX2TS R_38 ( .D(n1206), .CK(clk), .SN(n1800), .Q(n2209) );
  DFFSX2TS R_41 ( .D(n1256), .CK(clk), .SN(n2376), .Q(n2206) );
  DFFSX2TS R_44 ( .D(n1200), .CK(clk), .SN(n1445), .Q(n2203) );
  DFFSX2TS R_47 ( .D(n2300), .CK(clk), .SN(n1457), .Q(n2200) );
  DFFSX2TS R_50 ( .D(n2292), .CK(clk), .SN(n1066), .Q(n2198) );
  DFFSX2TS R_53 ( .D(n1209), .CK(clk), .SN(n2240), .Q(n2195) );
  DFFSX2TS R_56 ( .D(n1205), .CK(clk), .SN(n1458), .Q(n2192) );
  DFFSX2TS R_59 ( .D(n1212), .CK(clk), .SN(n1458), .Q(n2189) );
  DFFSX2TS R_62 ( .D(n2288), .CK(clk), .SN(n2258), .Q(n2186) );
  DFFSX2TS R_65 ( .D(n1073), .CK(clk), .SN(n1456), .Q(n2183) );
  DFFSX2TS R_68 ( .D(n1201), .CK(clk), .SN(n1458), .Q(n2180) );
  DFFSX2TS R_71 ( .D(n1208), .CK(clk), .SN(n2258), .Q(n2177) );
  DFFSX2TS R_74 ( .D(n1075), .CK(clk), .SN(n1455), .Q(n2174) );
  DFFSX2TS R_77 ( .D(n1211), .CK(clk), .SN(n2259), .Q(n2171) );
  DFFSX2TS R_80 ( .D(n1204), .CK(clk), .SN(n1455), .Q(n2168) );
  DFFSX2TS R_83 ( .D(net37058), .CK(clk), .SN(n2376), .Q(n2165) );
  DFFSX2TS R_86 ( .D(n1203), .CK(clk), .SN(n1453), .Q(n2162) );
  DFFSX2TS R_89 ( .D(n1210), .CK(clk), .SN(n1451), .Q(n2159) );
  DFFSX2TS R_92 ( .D(n1202), .CK(clk), .SN(n2240), .Q(n2156) );
  DFFSX2TS R_95 ( .D(net26474), .CK(clk), .SN(n2240), .Q(net28182) );
  DFFSX2TS R_98 ( .D(n1199), .CK(clk), .SN(n1801), .Q(n2153) );
  DFFSX2TS R_101 ( .D(n1198), .CK(clk), .SN(n2258), .Q(n2150) );
  DFFSX2TS R_104 ( .D(n2282), .CK(clk), .SN(n1455), .Q(n2147) );
  DFFSX2TS R_107 ( .D(n1197), .CK(clk), .SN(n1454), .Q(n2144) );
  DFFSX2TS R_110 ( .D(n1196), .CK(clk), .SN(n2261), .Q(n2141) );
  DFFSX2TS R_113 ( .D(n1195), .CK(clk), .SN(n1452), .Q(n2138) );
  DFFSX2TS R_116 ( .D(n1194), .CK(clk), .SN(n1451), .Q(n2135) );
  DFFSX2TS R_22 ( .D(n2295), .CK(clk), .SN(n2260), .Q(net27998) );
  DFFSX2TS R_25 ( .D(n2306), .CK(clk), .SN(n2260), .Q(n2220) );
  DFFSX2TS R_28 ( .D(n2305), .CK(clk), .SN(n1066), .Q(n2217) );
  DFFSX2TS R_31 ( .D(n2304), .CK(clk), .SN(n2254), .Q(n2214) );
  DFFSX2TS R_40 ( .D(n2291), .CK(clk), .SN(n2257), .Q(n2207) );
  DFFSX2TS R_43 ( .D(n2302), .CK(clk), .SN(n2254), .Q(n2204) );
  DFFSX2TS R_46 ( .D(n2301), .CK(clk), .SN(n1458), .Q(n2201) );
  DFFSX2TS R_49 ( .D(n2293), .CK(clk), .SN(n2257), .Q(n2199) );
  DFFSX2TS R_52 ( .D(n2287), .CK(clk), .SN(n2259), .Q(n2196) );
  DFFSX2TS R_55 ( .D(n2299), .CK(clk), .SN(n1458), .Q(n2193) );
  DFFSX2TS R_58 ( .D(n2298), .CK(clk), .SN(n1458), .Q(n2190) );
  DFFSX2TS R_61 ( .D(n2289), .CK(clk), .SN(n2254), .Q(n2187) );
  DFFSX2TS R_64 ( .D(n2284), .CK(clk), .SN(n1456), .Q(n2184) );
  DFFSX2TS R_67 ( .D(n2297), .CK(clk), .SN(n1458), .Q(n2181) );
  DFFSX2TS R_70 ( .D(n2296), .CK(clk), .SN(n2260), .Q(n2178) );
  DFFSX2TS R_73 ( .D(n2285), .CK(clk), .SN(n1456), .Q(n2175) );
  DFFSX2TS R_76 ( .D(n2280), .CK(clk), .SN(n2260), .Q(n2172) );
  DFFSX2TS R_79 ( .D(n2281), .CK(clk), .SN(n1456), .Q(n2169) );
  DFFSX2TS R_82 ( .D(n2277), .CK(clk), .SN(n2259), .Q(n2166) );
  DFFSX2TS R_85 ( .D(n2278), .CK(clk), .SN(n2240), .Q(n2163) );
  DFFSX2TS R_88 ( .D(n2274), .CK(clk), .SN(n1452), .Q(n2160) );
  DFFSX2TS R_91 ( .D(n2275), .CK(clk), .SN(n2261), .Q(n2157) );
  DFFSX2TS R_94 ( .D(n2294), .CK(clk), .SN(n2259), .Q(net28181) );
  DFFSX2TS R_97 ( .D(n2290), .CK(clk), .SN(n1452), .Q(n2154) );
  DFFSX2TS R_100 ( .D(n2286), .CK(clk), .SN(n1454), .Q(n2151) );
  DFFSX2TS R_103 ( .D(n2283), .CK(clk), .SN(n1456), .Q(n2148) );
  DFFSX2TS R_106 ( .D(n2279), .CK(clk), .SN(n1453), .Q(n2145) );
  DFFSX2TS R_109 ( .D(n2276), .CK(clk), .SN(n1454), .Q(n2142) );
  DFFSX2TS R_112 ( .D(n2273), .CK(clk), .SN(n1451), .Q(n2139) );
  DFFSX2TS R_115 ( .D(n2272), .CK(clk), .SN(n1452), .Q(n2136) );
  DFFSX2TS R_2 ( .D(n2307), .CK(clk), .SN(n2258), .Q(n2224) );
  DFFSX2TS R_5 ( .D(n2309), .CK(clk), .SN(n1447), .Q(n2221) );
  DFFSX2TS R_4 ( .D(net36302), .CK(clk), .SN(n1447), .Q(n2222) );
  DFFSX2TS R_0 ( .D(n2308), .CK(clk), .SN(n1066), .Q(n2226) );
  DFFSX2TS R_3 ( .D(n2310), .CK(clk), .SN(n1448), .Q(n2223) );
  DFFSX2TS R_24 ( .D(n2235), .CK(clk), .SN(n2258), .Q(net28000) );
  DFFSX2TS R_27 ( .D(n2237), .CK(clk), .SN(n2241), .Q(n2218) );
  DFFSX2TS R_30 ( .D(n2235), .CK(clk), .SN(n1445), .Q(n2215) );
  DFFSX2TS R_39 ( .D(n2237), .CK(clk), .SN(n2238), .Q(n2208) );
  DFFSX2TS R_42 ( .D(n2235), .CK(clk), .SN(n2257), .Q(n2205) );
  DFFSX2TS R_45 ( .D(n2236), .CK(clk), .SN(n2255), .Q(n2202) );
  DFFSX2TS R_51 ( .D(n2237), .CK(clk), .SN(n2257), .Q(n2197) );
  DFFSX2TS R_54 ( .D(n2235), .CK(clk), .SN(n2261), .Q(n2194) );
  DFFSX2TS R_57 ( .D(n2237), .CK(clk), .SN(n1457), .Q(n2191) );
  DFFSX2TS R_60 ( .D(n2235), .CK(clk), .SN(n1457), .Q(n2188) );
  DFFSX2TS R_63 ( .D(n2237), .CK(clk), .SN(n2254), .Q(n2185) );
  DFFSX2TS R_66 ( .D(n2235), .CK(clk), .SN(n1456), .Q(n2182) );
  DFFSX2TS R_69 ( .D(n2236), .CK(clk), .SN(n1457), .Q(n2179) );
  DFFSX2TS R_72 ( .D(n2235), .CK(clk), .SN(n1454), .Q(n2176) );
  DFFSX2TS R_75 ( .D(n2237), .CK(clk), .SN(n1456), .Q(n2173) );
  DFFSX2TS R_78 ( .D(n2235), .CK(clk), .SN(n1453), .Q(n2170) );
  DFFSX2TS R_81 ( .D(n2237), .CK(clk), .SN(n1456), .Q(n2167) );
  DFFSX2TS R_84 ( .D(n2235), .CK(clk), .SN(n1453), .Q(n2164) );
  DFFSX2TS R_87 ( .D(n2237), .CK(clk), .SN(n2259), .Q(n2161) );
  DFFSX2TS R_90 ( .D(n2235), .CK(clk), .SN(n1451), .Q(n2158) );
  DFFSX2TS R_93 ( .D(n2237), .CK(clk), .SN(n2240), .Q(n2155) );
  DFFSX2TS R_96 ( .D(n2236), .CK(clk), .SN(n2254), .Q(net28183) );
  DFFSX2TS R_99 ( .D(n2236), .CK(clk), .SN(n1464), .Q(n2152) );
  DFFSX2TS R_102 ( .D(n2236), .CK(clk), .SN(n2261), .Q(n2149) );
  DFFSX2TS R_105 ( .D(n2236), .CK(clk), .SN(n1455), .Q(n2146) );
  DFFSX2TS R_108 ( .D(n2236), .CK(clk), .SN(n2260), .Q(n2143) );
  DFFSX2TS R_111 ( .D(n2236), .CK(clk), .SN(n2254), .Q(n2140) );
  DFFSX2TS R_114 ( .D(n2236), .CK(clk), .SN(n1452), .Q(n2137) );
  DFFSX2TS R_117 ( .D(n2236), .CK(clk), .SN(n1451), .Q(n2134) );
  DFFRXLTS d_ff5_data_out_Q_reg_3_ ( .D(n2371), .CK(clk), .RN(n1800), .Q(
        data_output[3]) );
  DFFRXLTS d_ff5_data_out_Q_reg_27_ ( .D(n2348), .CK(clk), .RN(n2241), .Q(
        data_output[27]) );
  DFFRX4TS reg_val_muxY_2stage_Q_reg_29_ ( .D(n715), .CK(clk), .RN(n2263), .Q(
        d_ff2_Y[29]), .QN(n2133) );
  DFFRX4TS reg_val_muxX_2stage_Q_reg_25_ ( .D(n655), .CK(clk), .RN(n2265), .Q(
        d_ff2_X[25]), .QN(n2108) );
  DFFRHQX2TS d_ff4_Yn_Q_reg_26_ ( .D(n891), .CK(clk), .RN(n2376), .Q(
        d_ff_Yn[26]) );
  DFFRX4TS reg_LUT_Q_reg_27_ ( .D(n801), .CK(clk), .RN(n2376), .QN(n2270) );
  DFFRHQX2TS d_ff4_Yn_Q_reg_29_ ( .D(n888), .CK(clk), .RN(n1464), .Q(
        d_ff_Yn[29]) );
  DFFRHQX8TS reg_LUT_Q_reg_13_ ( .D(n809), .CK(clk), .RN(n2376), .Q(
        d_ff3_LUT_out[13]) );
  DFFSRHQX4TS reg_shift_y_Q_reg_9_ ( .D(n748), .CK(clk), .SN(1'b1), .RN(n1464), 
        .Q(d_ff3_sh_y_out[9]) );
  DFFSRHQX4TS reg_shift_x_Q_reg_7_ ( .D(n688), .CK(clk), .SN(1'b1), .RN(n1450), 
        .Q(d_ff3_sh_x_out[7]) );
  DFFRHQX2TS d_ff4_Xn_Q_reg_31_ ( .D(n854), .CK(clk), .RN(n1444), .Q(
        d_ff_Xn[31]) );
  DFFSHQX8TS ITER_CONT_temp_reg_0_ ( .D(n1255), .CK(clk), .SN(n1448), .Q(
        net27561) );
  DFFRX1TS reg_shift_y_Q_reg_23_ ( .D(n713), .CK(clk), .RN(n1446), .Q(
        d_ff3_sh_y_out[23]) );
  DFFRX4TS reg_shift_y_Q_reg_26_ ( .D(n710), .CK(clk), .RN(n2265), .Q(n1265), 
        .QN(n2269) );
  DFFRX1TS reg_LUT_Q_reg_19_ ( .D(n807), .CK(clk), .RN(n1063), .QN(n2131) );
  DFFSRHQX4TS d_ff5_data_out_Q_reg_20_ ( .D(n2354), .CK(clk), .SN(1'b1), .RN(
        n2376), .Q(data_output[20]) );
  DFFRX1TS reg_shift_x_Q_reg_23_ ( .D(n649), .CK(clk), .RN(n1446), .Q(
        d_ff3_sh_x_out[23]) );
  DFFRX4TS reg_val_muxX_2stage_Q_reg_17_ ( .D(n669), .CK(clk), .RN(n2242), .Q(
        d_ff2_X[17]), .QN(n1442) );
  DFFRHQX8TS inst_CORDIC_FSM_v3_state_reg_reg_3_ ( .D(net34745), .CK(clk), 
        .RN(n2252), .Q(net35717) );
  DFFRHQX8TS ITER_CONT_temp_reg_2_ ( .D(n1258), .CK(clk), .RN(n2252), .Q(
        net35729) );
  DFFRHQX8TS ITER_CONT_temp_reg_1_ ( .D(n988), .CK(clk), .RN(n2252), .Q(
        net35733) );
  DFFRX2TS d_ff5_data_out_Q_reg_10_ ( .D(n2364), .CK(clk), .RN(n2265), .Q(
        data_output[10]) );
  DFFRX4TS reg_val_muxY_2stage_Q_reg_0_ ( .D(n767), .CK(clk), .RN(n1062), .Q(
        d_ff2_Y[0]), .QN(n1440) );
  DFFRX4TS reg_shift_x_Q_reg_24_ ( .D(n648), .CK(clk), .RN(n2266), .Q(
        d_ff3_sh_x_out[24]), .QN(n1438) );
  DFFRHQX4TS reg_val_muxZ_2stage_Q_reg_21_ ( .D(n2324), .CK(clk), .RN(n2254), 
        .Q(n1431) );
  DFFRHQX4TS reg_val_muxZ_2stage_Q_reg_11_ ( .D(n2332), .CK(clk), .RN(n1455), 
        .Q(n1427) );
  DFFRHQX8TS reg_region_flag_Q_reg_1_ ( .D(n982), .CK(clk), .RN(n2241), .Q(
        n1423) );
  DFFRHQX4TS reg_val_muxZ_2stage_Q_reg_29_ ( .D(n2316), .CK(clk), .RN(n2241), 
        .Q(n1419) );
  DFFRX4TS reg_val_muxX_2stage_Q_reg_18_ ( .D(n667), .CK(clk), .RN(n1444), 
        .QN(n2061) );
  DFFRHQX8TS inst_CORDIC_FSM_v3_state_reg_reg_5_ ( .D(
        inst_CORDIC_FSM_v3_state_next[5]), .CK(clk), .RN(n2252), .Q(net35843)
         );
  DFFRHQX8TS inst_CORDIC_FSM_v3_state_reg_reg_2_ ( .D(n2313), .CK(clk), .RN(
        n2252), .Q(net35846) );
  DFFRX4TS reg_val_muxX_2stage_Q_reg_16_ ( .D(n671), .CK(clk), .RN(n2242), .Q(
        d_ff2_X[16]), .QN(n1415) );
  DFFRX4TS reg_val_muxZ_2stage_Q_reg_7_ ( .D(n2336), .CK(clk), .RN(n2258), .Q(
        d_ff2_Z[7]) );
  DFFRX1TS reg_val_muxZ_2stage_Q_reg_13_ ( .D(n2330), .CK(clk), .RN(n2258), 
        .Q(d_ff2_Z[13]) );
  DFFRX1TS reg_shift_y_Q_reg_24_ ( .D(n712), .CK(clk), .RN(n2266), .Q(n1411), 
        .QN(n2267) );
  DFFRX4TS reg_val_muxY_2stage_Q_reg_20_ ( .D(n727), .CK(clk), .RN(n2257), .Q(
        d_ff2_Y[20]), .QN(n2077) );
  DFFRX4TS reg_val_muxZ_2stage_Q_reg_24_ ( .D(n2321), .CK(clk), .RN(n1457), 
        .Q(d_ff2_Z[24]), .QN(n2232) );
  DFFRX4TS reg_val_muxZ_2stage_Q_reg_23_ ( .D(n2322), .CK(clk), .RN(n1457), 
        .Q(d_ff2_Z[23]), .QN(net35880) );
  DFFRX4TS reg_val_muxZ_2stage_Q_reg_1_ ( .D(n2342), .CK(clk), .RN(n1452), .Q(
        d_ff2_Z[1]), .QN(n1276) );
  DFFRX4TS d_ff4_Xn_Q_reg_16_ ( .D(n869), .CK(clk), .RN(n2242), .Q(d_ff_Xn[16]), .QN(n2046) );
  DFFRX4TS d_ff4_Xn_Q_reg_27_ ( .D(n858), .CK(clk), .RN(n2264), .Q(d_ff_Xn[27]), .QN(n2053) );
  DFFRX4TS d_ff4_Xn_Q_reg_19_ ( .D(n866), .CK(clk), .RN(n1464), .Q(d_ff_Xn[19]), .QN(n2048) );
  DFFRX4TS d_ff4_Xn_Q_reg_13_ ( .D(n872), .CK(clk), .RN(n2244), .Q(d_ff_Xn[13]), .QN(n2045) );
  DFFRX4TS d_ff4_Xn_Q_reg_12_ ( .D(n873), .CK(clk), .RN(n2245), .QN(n2044) );
  DFFRX2TS reg_val_muxX_2stage_Q_reg_20_ ( .D(n663), .CK(clk), .RN(n1446), .Q(
        d_ff2_X[20]) );
  DFFRX2TS reg_val_muxX_2stage_Q_reg_19_ ( .D(n665), .CK(clk), .RN(n2257), .Q(
        d_ff2_X[19]) );
  DFFRX2TS reg_val_muxY_2stage_Q_reg_5_ ( .D(n757), .CK(clk), .RN(n2248), .Q(
        d_ff2_Y[5]), .QN(n2073) );
  DFFRX2TS reg_val_muxX_2stage_Q_reg_2_ ( .D(n699), .CK(clk), .RN(n2250), .Q(
        d_ff2_X[2]) );
  DFFRX2TS reg_val_muxX_2stage_Q_reg_6_ ( .D(n691), .CK(clk), .RN(n1448), .Q(
        d_ff2_X[6]) );
  DFFRX2TS reg_val_muxX_2stage_Q_reg_5_ ( .D(n693), .CK(clk), .RN(n2248), .Q(
        d_ff2_X[5]) );
  DFFRX4TS reg_val_muxX_2stage_Q_reg_10_ ( .D(n683), .CK(clk), .RN(n2246), .Q(
        d_ff2_X[10]) );
  DFFRHQX8TS inst_CORDIC_FSM_v3_state_reg_reg_7_ ( .D(
        inst_CORDIC_FSM_v3_state_next[7]), .CK(clk), .RN(n1447), .Q(net35923)
         );
  DFFRX4TS d_ff4_Xn_Q_reg_23_ ( .D(n862), .CK(clk), .RN(n1447), .Q(d_ff_Xn[23]), .QN(n2125) );
  DFFRHQX2TS reg_val_muxX_2stage_Q_reg_29_ ( .D(n651), .CK(clk), .RN(n2263), 
        .Q(n1405) );
  DFFRX4TS d_ff5_data_out_Q_reg_17_ ( .D(n2357), .CK(clk), .RN(n2266), .Q(
        data_output[17]) );
  DFFRHQX2TS d_ff5_data_out_Q_reg_14_ ( .D(n2360), .CK(clk), .RN(n2266), .Q(
        data_output[14]) );
  DFFRHQX8TS reg_region_flag_Q_reg_0_ ( .D(n983), .CK(clk), .RN(n2258), .Q(
        n1350) );
  DFFRHQX8TS ITER_CONT_temp_reg_3_ ( .D(n986), .CK(clk), .RN(n2238), .Q(
        net36152) );
  DFFRHQX8TS reg_val_muxY_2stage_Q_reg_26_ ( .D(n718), .CK(clk), .RN(n2265), 
        .Q(n1347) );
  DFFRHQX4TS d_ff4_Yn_Q_reg_9_ ( .D(n908), .CK(clk), .RN(n1446), .Q(n1388) );
  DFFRHQX4TS d_ff4_Yn_Q_reg_15_ ( .D(n902), .CK(clk), .RN(n2243), .Q(n1390) );
  DFFRHQX4TS d_ff4_Yn_Q_reg_13_ ( .D(n904), .CK(clk), .RN(n2245), .Q(n1372) );
  DFFRHQX8TS d_ff4_Yn_Q_reg_31_ ( .D(n886), .CK(clk), .RN(n2262), .Q(n1364) );
  DFFRHQX8TS reg_val_muxY_2stage_Q_reg_23_ ( .D(n721), .CK(clk), .RN(n1446), 
        .Q(net36257) );
  DFFRHQX2TS d_ff5_data_out_Q_reg_25_ ( .D(n2350), .CK(clk), .RN(n1066), .Q(
        data_output[25]) );
  DFFRHQX8TS reg_val_muxY_2stage_Q_reg_25_ ( .D(n719), .CK(clk), .RN(n2266), 
        .Q(n1321) );
  DFFRHQX8TS VAR_CONT_temp_reg_1_ ( .D(n990), .CK(clk), .RN(n2252), .Q(n1333)
         );
  DFFRHQX2TS reg_shift_x_Q_reg_30_ ( .D(n642), .CK(clk), .RN(n2262), .Q(n1319)
         );
  DFFRHQX8TS reg_val_muxX_2stage_Q_reg_26_ ( .D(n654), .CK(clk), .RN(n2264), 
        .Q(n1317) );
  DFFRHQX2TS d_ff5_data_out_Q_reg_19_ ( .D(n2355), .CK(clk), .RN(n1448), .Q(
        data_output[19]) );
  DFFSX4TS R_33 ( .D(n2237), .CK(clk), .SN(n2255), .QN(n1307) );
  DFFRHQX8TS reg_val_muxX_2stage_Q_reg_24_ ( .D(n656), .CK(clk), .RN(n2266), 
        .Q(n1302) );
  DFFRHQX2TS d_ff4_Yn_Q_reg_23_ ( .D(n894), .CK(clk), .RN(n1448), .Q(n1399) );
  DFFRHQX2TS reg_LUT_Q_reg_6_ ( .D(n815), .CK(clk), .RN(n2248), .Q(n1296) );
  DFFRHQX2TS reg_val_muxX_2stage_Q_reg_28_ ( .D(n652), .CK(clk), .RN(n2263), 
        .Q(n1294) );
  DFFRX2TS d_ff5_data_out_Q_reg_28_ ( .D(n2347), .CK(clk), .RN(n1062), .Q(
        data_output[28]) );
  DFFRX1TS reg_Z0_Q_reg_23_ ( .D(n1257), .CK(clk), .RN(n1457), .Q(d_ff1_Z[23])
         );
  DFFRHQX2TS d_ff5_data_out_Q_reg_30_ ( .D(n2345), .CK(clk), .RN(n2259), .Q(
        data_output[30]) );
  DFFRX4TS reg_val_muxX_2stage_Q_reg_0_ ( .D(n703), .CK(clk), .RN(n2251), .Q(
        d_ff2_X[0]), .QN(n2056) );
  DFFRHQX2TS reg_shift_y_Q_reg_27_ ( .D(n709), .CK(clk), .RN(n2264), .Q(n1284)
         );
  DFFRHQX2TS reg_shift_x_Q_reg_28_ ( .D(n2130), .CK(clk), .RN(n2263), .Q(n1282) );
  DFFRHQX2TS reg_LUT_Q_reg_2_ ( .D(n819), .CK(clk), .RN(n2250), .Q(n1277) );
  DFFRX4TS reg_val_muxX_2stage_Q_reg_31_ ( .D(n641), .CK(clk), .RN(n1450), 
        .QN(n2064) );
  DFFRHQX2TS d_ff5_data_out_Q_reg_9_ ( .D(n2365), .CK(clk), .RN(n2247), .Q(
        data_output[9]) );
  DFFRX1TS reg_LUT_Q_reg_7_ ( .D(n814), .CK(clk), .RN(n1801), .Q(
        d_ff3_LUT_out[7]), .QN(n2068) );
  DFFRX2TS reg_LUT_Q_reg_8_ ( .D(n813), .CK(clk), .RN(n2247), .Q(
        d_ff3_LUT_out[8]) );
  DFFRX2TS reg_LUT_Q_reg_24_ ( .D(n804), .CK(clk), .RN(n2246), .Q(
        d_ff3_LUT_out[24]) );
  DFFRX2TS reg_shift_x_Q_reg_21_ ( .D(n660), .CK(clk), .RN(n2239), .Q(
        d_ff3_sh_x_out[21]) );
  DFFRX4TS reg_LUT_Q_reg_26_ ( .D(n802), .CK(clk), .RN(n2265), .Q(
        d_ff3_LUT_out[26]) );
  DFFRX2TS reg_LUT_Q_reg_23_ ( .D(n805), .CK(clk), .RN(n1448), .Q(
        d_ff3_LUT_out[23]) );
  DFFRX4TS reg_sign_Q_reg_0_ ( .D(n768), .CK(clk), .RN(n1458), .Q(
        d_ff3_sign_out) );
  DFFSHQX8TS inst_CORDIC_FSM_v3_state_reg_reg_0_ ( .D(
        inst_CORDIC_FSM_v3_state_next[0]), .CK(clk), .SN(n1464), .Q(
        inst_CORDIC_FSM_v3_state_reg_0_) );
  DFFRX4TS reg_val_muxX_2stage_Q_reg_8_ ( .D(n687), .CK(clk), .RN(n2247), .Q(
        d_ff2_X[8]), .QN(n2058) );
  DFFRX1TS reg_Z0_Q_reg_31_ ( .D(n950), .CK(clk), .RN(n1464), .QN(n2116) );
  DFFRHQX2TS d_ff5_data_out_Q_reg_11_ ( .D(n2363), .CK(clk), .RN(n2245), .Q(
        data_output[11]) );
  DFFRHQX2TS d_ff5_data_out_Q_reg_18_ ( .D(n2356), .CK(clk), .RN(n2263), .Q(
        data_output[18]) );
  DFFRHQX2TS d_ff5_data_out_Q_reg_13_ ( .D(n2361), .CK(clk), .RN(n1452), .Q(
        data_output[13]) );
  DFFRX4TS reg_val_muxY_2stage_Q_reg_9_ ( .D(n749), .CK(clk), .RN(n1453), .Q(
        d_ff2_Y[9]), .QN(n2074) );
  DFFRX4TS reg_val_muxY_2stage_Q_reg_7_ ( .D(n753), .CK(clk), .RN(n1445), .Q(
        d_ff2_Y[7]), .QN(n2082) );
  DFFRX4TS reg_val_muxX_2stage_Q_reg_30_ ( .D(n650), .CK(clk), .RN(n2262), .Q(
        d_ff2_X[30]), .QN(n2065) );
  DFFRX4TS reg_val_muxY_2stage_Q_reg_13_ ( .D(n741), .CK(clk), .RN(n2244), .Q(
        d_ff2_Y[13]) );
  DFFRHQX2TS reg_val_muxZ_2stage_Q_reg_16_ ( .D(n2327), .CK(clk), .RN(n2261), 
        .Q(n1243) );
  DFFRHQX2TS reg_val_muxZ_2stage_Q_reg_10_ ( .D(n2333), .CK(clk), .RN(n1455), 
        .Q(n1241) );
  DFFRHQX2TS d_ff5_data_out_Q_reg_7_ ( .D(n2367), .CK(clk), .RN(n2260), .Q(
        data_output[7]) );
  DFFRX4TS reg_val_muxZ_2stage_Q_reg_31_ ( .D(n2314), .CK(clk), .RN(n2238), 
        .Q(d_ff2_Z[31]) );
  DFFRHQX4TS reg_val_muxZ_2stage_Q_reg_15_ ( .D(n2328), .CK(clk), .RN(n1454), 
        .Q(n1238) );
  DFFRHQX2TS reg_val_muxZ_2stage_Q_reg_18_ ( .D(n2325), .CK(clk), .RN(n2259), 
        .Q(n1237) );
  DFFSX2TS R_1 ( .D(net27486), .CK(clk), .SN(n1445), .Q(n2225) );
  DFFRHQX2TS reg_val_muxZ_2stage_Q_reg_9_ ( .D(n2334), .CK(clk), .RN(n1455), 
        .Q(n1235) );
  DFFRX1TS d_ff5_data_out_Q_reg_15_ ( .D(n2359), .CK(clk), .RN(n1801), .Q(
        data_output[15]) );
  DFFRHQX2TS reg_val_muxX_2stage_Q_reg_23_ ( .D(n657), .CK(clk), .RN(n1446), 
        .Q(n1360) );
  DFFRHQX2TS reg_val_muxY_2stage_Q_reg_1_ ( .D(n765), .CK(clk), .RN(n2251), 
        .Q(n1232) );
  DFFRX4TS d_ff5_data_out_Q_reg_4_ ( .D(n2370), .CK(clk), .RN(n1444), .Q(
        data_output[4]) );
  DFFRHQX2TS d_ff4_Yn_Q_reg_17_ ( .D(n900), .CK(clk), .RN(n2242), .Q(n1385) );
  DFFRX4TS reg_val_muxZ_2stage_Q_reg_17_ ( .D(n2326), .CK(clk), .RN(n2261), 
        .Q(d_ff2_Z[17]), .QN(net27861) );
  DFFRHQX2TS d_ff4_Yn_Q_reg_30_ ( .D(n887), .CK(clk), .RN(n2262), .Q(n1394) );
  DFFRX4TS reg_LUT_Q_reg_25_ ( .D(n2312), .CK(clk), .RN(n2265), .Q(
        d_ff3_LUT_out[25]), .QN(n1465) );
  DFFRHQX2TS d_ff4_Yn_Q_reg_4_ ( .D(n913), .CK(clk), .RN(n2249), .Q(n1383) );
  DFFRX4TS reg_val_muxZ_2stage_Q_reg_3_ ( .D(n2340), .CK(clk), .RN(n2260), .Q(
        d_ff2_Z[3]), .QN(n2230) );
  DFFRHQX8TS inst_CORDIC_FSM_v3_state_reg_reg_1_ ( .D(
        inst_CORDIC_FSM_v3_state_next[1]), .CK(clk), .RN(n1448), .Q(net35813)
         );
  DFFSX2TS R_122 ( .D(net35109), .CK(clk), .SN(n1063), .Q(n1219) );
  DFFSX2TS R_124 ( .D(n1228), .CK(clk), .SN(n1063), .Q(n1217) );
  DFFRX2TS R_123 ( .D(net36640), .CK(clk), .RN(n1062), .Q(n1218) );
  DFFRHQX8TS inst_CORDIC_FSM_v3_state_reg_reg_6_ ( .D(
        inst_CORDIC_FSM_v3_state_next[6]), .CK(clk), .RN(n2252), .Q(net35927)
         );
  DFFRHQX8TS inst_CORDIC_FSM_v3_state_reg_reg_4_ ( .D(
        inst_CORDIC_FSM_v3_state_next[4]), .CK(clk), .RN(n2252), .Q(net35831)
         );
  DFFSX2TS R_127 ( .D(net27486), .CK(clk), .SN(n1066), .Q(n1215) );
  DFFSX2TS R_128 ( .D(n1753), .CK(clk), .SN(n1066), .Q(n1214) );
  DFFSX2TS R_129 ( .D(n1752), .CK(clk), .SN(n1066), .Q(n1213) );
  DFFSX2TS R_37 ( .D(n2271), .CK(clk), .SN(n1456), .Q(n2210) );
  DFFSX2TS R_133 ( .D(n2227), .CK(clk), .SN(n2241), .Q(n1193), .QN(n1192) );
  DFFRHQX2TS reg_val_muxZ_2stage_Q_reg_2_ ( .D(n2341), .CK(clk), .RN(n2259), 
        .Q(n1190) );
  DFFRHQX2TS d_ff4_Yn_Q_reg_22_ ( .D(n895), .CK(clk), .RN(n2239), .Q(n1377) );
  DFFRHQX2TS d_ff4_Yn_Q_reg_14_ ( .D(n903), .CK(clk), .RN(n2244), .Q(n1381) );
  DFFRHQX2TS d_ff4_Yn_Q_reg_10_ ( .D(n907), .CK(clk), .RN(n1458), .Q(n1379) );
  DFFRHQX2TS reg_val_muxZ_2stage_Q_reg_30_ ( .D(n2315), .CK(clk), .RN(n1063), 
        .Q(n1421) );
  DFFRHQX4TS d_ff5_data_out_Q_reg_21_ ( .D(n2353), .CK(clk), .RN(n2241), .Q(
        data_output[21]) );
  DFFRHQX2TS d_ff4_Yn_Q_reg_24_ ( .D(n893), .CK(clk), .RN(n2266), .Q(n1403) );
  DFFRHQX2TS d_ff4_Yn_Q_reg_1_ ( .D(n916), .CK(clk), .RN(n2251), .Q(n1401) );
  DFFRHQX2TS d_ff4_Yn_Q_reg_6_ ( .D(n911), .CK(clk), .RN(n1445), .Q(n1397) );
  DFFRHQX2TS d_ff4_Yn_Q_reg_28_ ( .D(n889), .CK(clk), .RN(n2264), .Q(net35976)
         );
  DFFRHQX2TS d_ff4_Yn_Q_reg_25_ ( .D(n892), .CK(clk), .RN(n2266), .Q(n1395) );
  DFFRHQX2TS d_ff4_Yn_Q_reg_7_ ( .D(n910), .CK(clk), .RN(n1447), .Q(n1392) );
  DFFRHQX4TS VAR_CONT_temp_reg_0_ ( .D(n985), .CK(clk), .RN(n2252), .Q(n1331)
         );
  DFFRHQX4TS reg_val_muxX_2stage_Q_reg_27_ ( .D(n653), .CK(clk), .RN(n2264), 
        .Q(n1297) );
  DFFRX2TS d_ff4_Yn_Q_reg_2_ ( .D(n915), .CK(clk), .RN(n2250), .Q(d_ff_Yn[2]), 
        .QN(n2127) );
  DFFRX1TS reg_Z0_Q_reg_30_ ( .D(n951), .CK(clk), .RN(n2241), .Q(d_ff1_Z[30]), 
        .QN(n2094) );
  DFFRX1TS reg_Z0_Q_reg_13_ ( .D(n968), .CK(clk), .RN(n1453), .Q(d_ff1_Z[13]), 
        .QN(n2096) );
  DFFRX1TS reg_Z0_Q_reg_18_ ( .D(n963), .CK(clk), .RN(n2259), .Q(d_ff1_Z[18]), 
        .QN(n2097) );
  DFFRX1TS reg_Z0_Q_reg_25_ ( .D(n956), .CK(clk), .RN(n2255), .Q(d_ff1_Z[25]), 
        .QN(n2114) );
  DFFRX1TS reg_Z0_Q_reg_5_ ( .D(n976), .CK(clk), .RN(n2240), .Q(d_ff1_Z[5]), 
        .QN(n2092) );
  DFFRX1TS reg_Z0_Q_reg_12_ ( .D(n969), .CK(clk), .RN(n2257), .Q(d_ff1_Z[12]), 
        .QN(n2101) );
  DFFRX1TS reg_Z0_Q_reg_22_ ( .D(n959), .CK(clk), .RN(n1457), .Q(d_ff1_Z[22]), 
        .QN(n2115) );
  DFFRX1TS reg_Z0_Q_reg_16_ ( .D(n965), .CK(clk), .RN(n2254), .Q(d_ff1_Z[16]), 
        .QN(n2103) );
  DFFRHQX4TS d_ff5_data_out_Q_reg_8_ ( .D(n2366), .CK(clk), .RN(n1799), .Q(
        data_output[8]) );
  DFFRHQX4TS d_ff5_data_out_Q_reg_1_ ( .D(n2373), .CK(clk), .RN(n1799), .Q(
        data_output[1]) );
  DFFRX1TS d_ff5_data_out_Q_reg_6_ ( .D(n2368), .CK(clk), .RN(n2252), .Q(
        data_output[6]) );
  DFFRX1TS d_ff5_data_out_Q_reg_0_ ( .D(n2374), .CK(clk), .RN(n1451), .Q(
        data_output[0]) );
  DFFRX1TS d_ff5_data_out_Q_reg_26_ ( .D(n2349), .CK(clk), .RN(n1445), .Q(
        data_output[26]) );
  DFFRX2TS d_ff4_Xn_Q_reg_10_ ( .D(n875), .CK(clk), .RN(n2246), .Q(d_ff_Xn[10]), .QN(n2043) );
  DFFRX1TS d_ff5_data_out_Q_reg_29_ ( .D(n2346), .CK(clk), .RN(n1444), .Q(
        data_output[29]) );
  DFFRX1TS reg_shift_y_Q_reg_2_ ( .D(n762), .CK(clk), .RN(n2250), .Q(
        d_ff3_sh_y_out[2]) );
  DFFRX1TS d_ff5_data_out_Q_reg_2_ ( .D(n2372), .CK(clk), .RN(n1800), .Q(
        data_output[2]) );
  DFFRX1TS reg_Z0_Q_reg_29_ ( .D(n952), .CK(clk), .RN(n1444), .Q(d_ff1_Z[29]), 
        .QN(n2110) );
  DFFRX1TS reg_Z0_Q_reg_20_ ( .D(n961), .CK(clk), .RN(n1453), .Q(d_ff1_Z[20]), 
        .QN(net28374) );
  DFFRX1TS reg_Z0_Q_reg_2_ ( .D(n979), .CK(clk), .RN(n2260), .Q(d_ff1_Z[2]), 
        .QN(n2098) );
  DFFRX1TS reg_Z0_Q_reg_4_ ( .D(n977), .CK(clk), .RN(n2258), .Q(d_ff1_Z[4]), 
        .QN(n2091) );
  DFFRX1TS reg_Z0_Q_reg_11_ ( .D(n970), .CK(clk), .RN(n1455), .Q(d_ff1_Z[11]), 
        .QN(n2104) );
  DFFRX1TS reg_Z0_Q_reg_21_ ( .D(n960), .CK(clk), .RN(n2240), .Q(d_ff1_Z[21]), 
        .QN(net28357) );
  DFFRX1TS reg_Z0_Q_reg_14_ ( .D(n967), .CK(clk), .RN(n2261), .Q(d_ff1_Z[14]), 
        .QN(n2106) );
  DFFRX1TS reg_shift_y_Q_reg_6_ ( .D(n754), .CK(clk), .RN(n1447), .Q(
        d_ff3_sh_y_out[6]) );
  DFFRX1TS reg_shift_y_Q_reg_4_ ( .D(n758), .CK(clk), .RN(n2249), .Q(
        d_ff3_sh_y_out[4]) );
  DFFRX1TS reg_shift_y_Q_reg_8_ ( .D(n750), .CK(clk), .RN(n2247), .Q(
        d_ff3_sh_y_out[8]) );
  DFFRX1TS reg_shift_y_Q_reg_12_ ( .D(n742), .CK(clk), .RN(n2245), .Q(
        d_ff3_sh_y_out[12]) );
  DFFRX1TS reg_shift_y_Q_reg_21_ ( .D(n724), .CK(clk), .RN(n2239), .Q(
        d_ff3_sh_y_out[21]) );
  DFFRX1TS d_ff5_data_out_Q_reg_12_ ( .D(n2362), .CK(clk), .RN(n2264), .Q(
        data_output[12]) );
  DFFRX1TS d_ff5_data_out_Q_reg_5_ ( .D(n2369), .CK(clk), .RN(n1452), .Q(
        data_output[5]) );
  DFFRX1TS d_ff5_data_out_Q_reg_16_ ( .D(n2358), .CK(clk), .RN(n1062), .Q(
        data_output[16]) );
  DFFRXLTS reg_shift_x_Q_reg_3_ ( .D(n696), .CK(clk), .RN(n2249), .Q(
        d_ff3_sh_x_out[3]), .QN(n1272) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_6_ ( .D(n755), .CK(clk), .RN(n2238), .Q(
        d_ff2_Y[6]), .QN(n2081) );
  DFFRHQX2TS reg_val_muxZ_2stage_Q_reg_4_ ( .D(n2339), .CK(clk), .RN(n2261), 
        .Q(n1337) );
  DFFRHQX2TS reg_val_muxZ_2stage_Q_reg_27_ ( .D(n2318), .CK(clk), .RN(n2255), 
        .Q(n1304) );
  DFFRXLTS reg_LUT_Q_reg_0_ ( .D(n821), .CK(clk), .RN(n1799), .Q(
        d_ff3_LUT_out[0]), .QN(n1287) );
  DFFRX1TS reg_shift_y_Q_reg_0_ ( .D(n766), .CK(clk), .RN(n2251), .Q(
        d_ff3_sh_y_out[0]) );
  DFFRX1TS reg_shift_y_Q_reg_1_ ( .D(n764), .CK(clk), .RN(n2251), .Q(
        d_ff3_sh_y_out[1]) );
  DFFRX1TS reg_Z0_Q_reg_28_ ( .D(n953), .CK(clk), .RN(n2255), .Q(d_ff1_Z[28]), 
        .QN(n2113) );
  DFFRX1TS reg_Z0_Q_reg_17_ ( .D(n964), .CK(clk), .RN(n2240), .Q(d_ff1_Z[17]), 
        .QN(n2102) );
  DFFRX4TS reg_shift_x_Q_reg_9_ ( .D(n684), .CK(clk), .RN(n2376), .Q(
        d_ff3_sh_x_out[9]), .QN(n1477) );
  DFFRHQX4TS reg_operation_Q_reg_0_ ( .D(n984), .CK(clk), .RN(n1444), .Q(n1416) );
  DFFRHQX4TS reg_val_muxY_2stage_Q_reg_24_ ( .D(n720), .CK(clk), .RN(n2266), 
        .Q(n1340) );
  DFFRHQX4TS reg_val_muxY_2stage_Q_reg_27_ ( .D(n717), .CK(clk), .RN(n2264), 
        .Q(n1314) );
  DFFRHQX4TS d_ff4_Yn_Q_reg_11_ ( .D(n906), .CK(clk), .RN(n2246), .Q(n1373) );
  DFFRX2TS d_ff4_Xn_Q_reg_11_ ( .D(n874), .CK(clk), .RN(n2246), .Q(d_ff_Xn[11]), .QN(net28336) );
  DFFRX2TS d_ff4_Xn_Q_reg_8_ ( .D(n877), .CK(clk), .RN(n2247), .QN(n2121) );
  DFFRX2TS reg_shift_x_Q_reg_8_ ( .D(n686), .CK(clk), .RN(n2247), .Q(
        d_ff3_sh_x_out[8]), .QN(n1475) );
  DFFRX2TS reg_shift_x_Q_reg_10_ ( .D(n682), .CK(clk), .RN(n2246), .Q(
        d_ff3_sh_x_out[10]), .QN(n1479) );
  DFFRHQX4TS reg_LUT_Q_reg_5_ ( .D(n816), .CK(clk), .RN(n2248), .Q(n1335) );
  DFFRHQX2TS d_ff4_Yn_Q_reg_3_ ( .D(n914), .CK(clk), .RN(n2250), .Q(n1375) );
  DFFRHQX2TS reg_val_muxZ_2stage_Q_reg_14_ ( .D(n2329), .CK(clk), .RN(n1453), 
        .Q(n1429) );
  DFFRHQX2TS reg_val_muxZ_2stage_Q_reg_12_ ( .D(n2331), .CK(clk), .RN(n1454), 
        .Q(n1413) );
  DFFRX1TS d_ff4_Xn_Q_reg_30_ ( .D(n855), .CK(clk), .RN(n2262), .Q(d_ff_Xn[30]), .QN(n2072) );
  DFFSX1TS R_34 ( .D(n2303), .CK(clk), .SN(n2255), .Q(n2212) );
  DFFRX2TS d_ff4_Xn_Q_reg_0_ ( .D(n885), .CK(clk), .RN(n2251), .Q(d_ff_Xn[0]), 
        .QN(n2119) );
  DFFRX2TS d_ff4_Xn_Q_reg_4_ ( .D(n881), .CK(clk), .RN(n2249), .Q(d_ff_Xn[4]), 
        .QN(n2120) );
  DFFRX2TS d_ff4_Yn_Q_reg_0_ ( .D(n917), .CK(clk), .RN(n1446), .Q(d_ff_Yn[0]), 
        .QN(n2126) );
  DFFRX2TS reg_Z0_Q_reg_1_ ( .D(n980), .CK(clk), .RN(n1450), .Q(d_ff1_Z[1]), 
        .QN(n2112) );
  DFFRX2TS d_ff4_Xn_Q_reg_18_ ( .D(n867), .CK(clk), .RN(n2241), .Q(d_ff_Xn[18]), .QN(n2124) );
  DFFRX2TS d_ff4_Xn_Q_reg_20_ ( .D(n865), .CK(clk), .RN(n2257), .QN(n2049) );
  DFFRX2TS d_ff4_Xn_Q_reg_17_ ( .D(n868), .CK(clk), .RN(n2242), .QN(n2047) );
  DFFRHQX2TS reg_val_muxZ_2stage_Q_reg_25_ ( .D(n2320), .CK(clk), .RN(n2255), 
        .Q(n1422) );
  DFFRHQX2TS reg_LUT_Q_reg_10_ ( .D(n811), .CK(clk), .RN(n1456), .Q(n1295) );
  DFFRHQX2TS reg_val_muxZ_2stage_Q_reg_26_ ( .D(n2319), .CK(clk), .RN(n2255), 
        .Q(n1420) );
  DFFRHQX2TS reg_val_muxY_2stage_Q_reg_30_ ( .D(n714), .CK(clk), .RN(n2262), 
        .Q(n1290) );
  DFFRX1TS reg_shift_x_Q_reg_1_ ( .D(n700), .CK(clk), .RN(n2250), .Q(
        d_ff3_sh_x_out[1]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_12_ ( .D(n743), .CK(clk), .RN(n2245), .Q(
        d_ff2_Y[12]), .QN(n2086) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_3_ ( .D(n761), .CK(clk), .RN(n2249), .Q(
        d_ff2_Y[3]), .QN(n2079) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_4_ ( .D(n759), .CK(clk), .RN(n2249), .Q(
        d_ff2_Y[4]), .QN(n2080) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_8_ ( .D(n751), .CK(clk), .RN(n2247), .Q(
        d_ff2_Y[8]), .QN(n2083) );
  DFFRX1TS reg_LUT_Q_reg_9_ ( .D(n812), .CK(clk), .RN(n2261), .Q(
        d_ff3_LUT_out[9]) );
  DFFRX1TS reg_val_muxY_2stage_Q_reg_10_ ( .D(n747), .CK(clk), .RN(n1445), .Q(
        d_ff2_Y[10]), .QN(n2084) );
  DFFRX1TS reg_LUT_Q_reg_1_ ( .D(n820), .CK(clk), .RN(n2251), .Q(
        d_ff3_LUT_out[1]) );
  DFFRX2TS reg_val_muxY_2stage_Q_reg_21_ ( .D(n725), .CK(clk), .RN(n2239), .Q(
        d_ff2_Y[21]) );
  DFFRX2TS reg_val_muxY_2stage_Q_reg_15_ ( .D(n737), .CK(clk), .RN(n2243), .Q(
        d_ff2_Y[15]) );
  DFFRX2TS reg_shift_x_Q_reg_25_ ( .D(n647), .CK(clk), .RN(n2265), .QN(n2070)
         );
  DFFRX2TS reg_val_muxX_2stage_Q_reg_11_ ( .D(n681), .CK(clk), .RN(n2246), .Q(
        d_ff2_X[11]), .QN(net28420) );
  DFFRHQX2TS d_ff4_Yn_Q_reg_27_ ( .D(n890), .CK(clk), .RN(n2264), .Q(n1366) );
  DFFRHQX2TS d_ff4_Yn_Q_reg_5_ ( .D(n912), .CK(clk), .RN(n2248), .Q(n1368) );
  DFFRHQX2TS d_ff4_Yn_Q_reg_20_ ( .D(n897), .CK(clk), .RN(n1447), .Q(n1363) );
  DFFRHQX2TS d_ff4_Yn_Q_reg_8_ ( .D(n909), .CK(clk), .RN(n2247), .Q(n1371) );
  DFFRHQX2TS d_ff4_Yn_Q_reg_19_ ( .D(n898), .CK(clk), .RN(n1063), .Q(n1362) );
  DFFRHQX2TS d_ff4_Yn_Q_reg_21_ ( .D(n896), .CK(clk), .RN(n2239), .Q(n1369) );
  DFFRHQX1TS d_ff4_Yn_Q_reg_16_ ( .D(n901), .CK(clk), .RN(n2243), .Q(n1387) );
  DFFRX1TS d_ff4_Xn_Q_reg_21_ ( .D(n864), .CK(clk), .RN(n2239), .Q(d_ff_Xn[21]), .QN(n2117) );
  DFFRX1TS reg_Z0_Q_reg_26_ ( .D(n955), .CK(clk), .RN(n2255), .QN(n2109) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_22_ ( .D(n659), .CK(clk), .RN(n1447), .Q(
        d_ff2_X[22]), .QN(n2063) );
  DFFRX2TS reg_Z0_Q_reg_8_ ( .D(n973), .CK(clk), .RN(n1454), .QN(n2105) );
  DFFRX2TS d_ff4_Xn_Q_reg_2_ ( .D(n883), .CK(clk), .RN(n2250), .Q(d_ff_Xn[2]), 
        .QN(n2038) );
  DFFRX2TS d_ff4_Xn_Q_reg_22_ ( .D(n863), .CK(clk), .RN(n2239), .Q(d_ff_Xn[22]), .QN(n2118) );
  DFFRX2TS d_ff4_Xn_Q_reg_25_ ( .D(n860), .CK(clk), .RN(n2265), .Q(d_ff_Xn[25]), .QN(n2051) );
  DFFRX2TS d_ff4_Xn_Q_reg_9_ ( .D(n876), .CK(clk), .RN(n1062), .Q(d_ff_Xn[9]), 
        .QN(n2122) );
  DFFRX2TS reg_Z0_Q_reg_6_ ( .D(n975), .CK(clk), .RN(n2254), .QN(n2095) );
  DFFRX2TS d_ff4_Xn_Q_reg_7_ ( .D(n878), .CK(clk), .RN(n2247), .Q(d_ff_Xn[7]), 
        .QN(n2042) );
  DFFRX2TS d_ff4_Xn_Q_reg_14_ ( .D(n871), .CK(clk), .RN(n2244), .Q(d_ff_Xn[14]), .QN(net28436) );
  DFFRX2TS d_ff4_Xn_Q_reg_3_ ( .D(n882), .CK(clk), .RN(n2249), .Q(d_ff_Xn[3]), 
        .QN(n2039) );
  DFFRX2TS d_ff4_Xn_Q_reg_26_ ( .D(n859), .CK(clk), .RN(n2265), .Q(d_ff_Xn[26]), .QN(n2052) );
  DFFRX2TS d_ff4_Xn_Q_reg_28_ ( .D(n857), .CK(clk), .RN(n2263), .Q(d_ff_Xn[28]), .QN(n2054) );
  DFFRX2TS d_ff4_Xn_Q_reg_29_ ( .D(n856), .CK(clk), .RN(n2263), .Q(d_ff_Xn[29]), .QN(n2055) );
  DFFRX2TS d_ff4_Yn_Q_reg_12_ ( .D(n905), .CK(clk), .RN(n2245), .Q(d_ff_Yn[12]), .QN(n2128) );
  DFFRX1TS reg_shift_y_Q_reg_25_ ( .D(n711), .CK(clk), .RN(n2265), .QN(n2268)
         );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_14_ ( .D(n675), .CK(clk), .RN(n2244), .Q(
        d_ff2_X[14]), .QN(net35877) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_4_ ( .D(n695), .CK(clk), .RN(n2248), .Q(
        d_ff2_X[4]), .QN(n2057) );
  DFFRX2TS reg_shift_y_Q_reg_10_ ( .D(n746), .CK(clk), .RN(n2246), .Q(
        d_ff3_sh_y_out[10]) );
  DFFRX1TS reg_val_muxX_2stage_Q_reg_12_ ( .D(n679), .CK(clk), .RN(n2245), .Q(
        d_ff2_X[12]) );
  DFFRX1TS d_ff4_Xn_Q_reg_24_ ( .D(n861), .CK(clk), .RN(n2266), .Q(d_ff_Xn[24]), .QN(n2050) );
  CLKMX2X3TS U705 ( .A(d_ff2_Y[13]), .B(d_ff3_sh_y_out[13]), .S0(net34235), 
        .Y(n740) );
  CLKMX2X3TS U706 ( .A(d_ff2_Y[19]), .B(d_ff3_sh_y_out[19]), .S0(net36779), 
        .Y(n728) );
  CLKMX2X3TS U707 ( .A(d_ff2_X[10]), .B(d_ff3_sh_x_out[10]), .S0(net34395), 
        .Y(n682) );
  INVX2TS U708 ( .A(n1064), .Y(n1066) );
  CLKINVX2TS U709 ( .A(n1061), .Y(n1062) );
  CLKINVX2TS U710 ( .A(n1061), .Y(n1063) );
  CLKINVX2TS U711 ( .A(n1064), .Y(n1065) );
  NAND3X4TS U712 ( .A(n1658), .B(n1659), .C(n1660), .Y(n2319) );
  MXI2X2TS U713 ( .A(net34525), .B(n2271), .S0(n1343), .Y(n854) );
  CLKMX2X3TS U714 ( .A(d_ff2_X[8]), .B(d_ff3_sh_x_out[8]), .S0(net34395), .Y(
        n686) );
  NAND2X1TS U715 ( .A(net35371), .B(n1817), .Y(n1663) );
  NAND2X2TS U716 ( .A(net34898), .B(d_ff2_X[22]), .Y(n1134) );
  NAND2X2TS U717 ( .A(net34898), .B(d_ff2_Y[15]), .Y(n1133) );
  NAND3X2TS U718 ( .A(net35481), .B(d_ff1_Z[16]), .C(n1079), .Y(n1609) );
  NAND3X2TS U719 ( .A(net35481), .B(d_ff1_Z[18]), .C(n1079), .Y(n1607) );
  OR2X4TS U720 ( .A(net35481), .B(n1432), .Y(n1618) );
  OR2X4TS U721 ( .A(net35481), .B(n1430), .Y(n1668) );
  NAND2X1TS U722 ( .A(net35652), .B(n1803), .Y(n1619) );
  NAND2X6TS U723 ( .A(n1848), .B(n1849), .Y(n1281) );
  INVX12TS U724 ( .A(n1489), .Y(n1895) );
  NAND2X2TS U725 ( .A(n1176), .B(data_output[12]), .Y(n1540) );
  OR2X4TS U726 ( .A(net36422), .B(n1236), .Y(n1610) );
  NAND2X2TS U727 ( .A(net35372), .B(n1363), .Y(n1627) );
  BUFX4TS U728 ( .A(n1141), .Y(n1140) );
  NAND2X2TS U729 ( .A(net35303), .B(d_ff_Xn[31]), .Y(net34944) );
  NAND3BX2TS U730 ( .AN(enab_cont_iter), .B(n2012), .C(n1837), .Y(n1838) );
  NAND2BX2TS U731 ( .AN(net34449), .B(d_ff2_Z[7]), .Y(n1623) );
  NAND3X1TS U732 ( .A(net34772), .B(d_ff1_Z[10]), .C(n1079), .Y(n1605) );
  NAND2X2TS U733 ( .A(net35705), .B(n1335), .Y(n1712) );
  NAND2X4TS U734 ( .A(net37196), .B(n1397), .Y(n1689) );
  AO22X2TS U735 ( .A0(n1792), .A1(d_ff_Xn[19]), .B0(n1516), .B1(n1362), .Y(
        n1433) );
  INVX2TS U736 ( .A(result_add_subt[5]), .Y(n2277) );
  INVX2TS U737 ( .A(result_add_subt[31]), .Y(n2271) );
  NAND2X2TS U738 ( .A(net34898), .B(d_ff2_Z[13]), .Y(n1655) );
  NAND2BX2TS U739 ( .AN(n2233), .B(net36545), .Y(n1164) );
  NAND2X4TS U740 ( .A(n1108), .B(data_output[18]), .Y(n1715) );
  OAI2BB1X1TS U741 ( .A0N(n2027), .A1N(n1522), .B0(n1915), .Y(n1632) );
  INVX1TS U742 ( .A(n1387), .Y(n1531) );
  NAND2X4TS U743 ( .A(net36302), .B(data_output[19]), .Y(n1791) );
  INVX2TS U744 ( .A(result_add_subt[20]), .Y(n2295) );
  NAND2X6TS U745 ( .A(n1702), .B(n1274), .Y(n1708) );
  INVX2TS U746 ( .A(result_add_subt[1]), .Y(n2273) );
  INVX2TS U747 ( .A(result_add_subt[17]), .Y(n2291) );
  NAND2X2TS U748 ( .A(n1328), .B(n1880), .Y(n1713) );
  NOR2X4TS U749 ( .A(n1181), .B(n1180), .Y(n1179) );
  NAND3X2TS U750 ( .A(net35334), .B(d_ff1_Z[30]), .C(net35106), .Y(n1653) );
  INVX2TS U751 ( .A(result_add_subt[13]), .Y(n2286) );
  INVX2TS U752 ( .A(result_add_subt[19]), .Y(n2294) );
  NAND2X2TS U753 ( .A(n2033), .B(n1099), .Y(n2026) );
  NAND2X2TS U754 ( .A(net37108), .B(n1394), .Y(n1559) );
  NAND2X2TS U755 ( .A(net34265), .B(n1283), .Y(n1591) );
  NAND2BX2TS U756 ( .AN(n1239), .B(net36991), .Y(n1602) );
  BUFX3TS U757 ( .A(n1453), .Y(n1799) );
  NAND2X2TS U758 ( .A(n1513), .B(n1512), .Y(n1535) );
  NAND3X2TS U759 ( .A(net34453), .B(d_ff1_Z[4]), .C(net36078), .Y(n1666) );
  NAND2X2TS U760 ( .A(net34898), .B(n1237), .Y(n1606) );
  INVX2TS U761 ( .A(result_add_subt[10]), .Y(n2283) );
  INVX2TS U762 ( .A(result_add_subt[22]), .Y(n2297) );
  INVX2TS U763 ( .A(result_add_subt[14]), .Y(n2287) );
  INVX2TS U764 ( .A(result_add_subt[0]), .Y(n2272) );
  NAND2X2TS U765 ( .A(net34235), .B(d_ff3_LUT_out[9]), .Y(n1694) );
  NAND3X4TS U766 ( .A(net35334), .B(d_ff1_Z[23]), .C(n1079), .Y(n1835) );
  NAND3X6TS U767 ( .A(net36779), .B(n1092), .C(net34875), .Y(n1546) );
  OR2X4TS U768 ( .A(n1104), .B(n1266), .Y(n1598) );
  INVX2TS U769 ( .A(result_add_subt[24]), .Y(n2299) );
  INVX2TS U770 ( .A(result_add_subt[7]), .Y(n2279) );
  INVX2TS U771 ( .A(result_add_subt[6]), .Y(n2278) );
  INVX2TS U772 ( .A(result_add_subt[25]), .Y(n2301) );
  INVX2TS U773 ( .A(result_add_subt[3]), .Y(n2275) );
  INVX2TS U774 ( .A(result_add_subt[9]), .Y(n2281) );
  OR2X4TS U775 ( .A(net35306), .B(n1073), .Y(n1617) );
  INVX2TS U776 ( .A(result_add_subt[18]), .Y(n2293) );
  INVX2TS U777 ( .A(result_add_subt[12]), .Y(n2285) );
  NAND2X2TS U778 ( .A(n1879), .B(n2024), .Y(n1263) );
  INVX2TS U779 ( .A(result_add_subt[4]), .Y(n2276) );
  INVX2TS U780 ( .A(result_add_subt[29]), .Y(n2305) );
  INVX2TS U781 ( .A(result_add_subt[26]), .Y(n2302) );
  INVX2TS U782 ( .A(n2256), .Y(n1061) );
  NAND2X4TS U783 ( .A(net35368), .B(n1807), .Y(n1131) );
  NAND2X4TS U784 ( .A(n1147), .B(data_output[20]), .Y(n1751) );
  NAND2BX1TS U785 ( .AN(n1244), .B(net36991), .Y(n1608) );
  NAND2BX1TS U786 ( .AN(n1242), .B(net36991), .Y(n1604) );
  INVX2TS U787 ( .A(n2253), .Y(n1064) );
  NAND3X2TS U788 ( .A(net35481), .B(d_ff1_Z[15]), .C(net36078), .Y(n1603) );
  MXI2X2TS U789 ( .A(d_ff_Xn[7]), .B(n1392), .S0(n1355), .Y(n1520) );
  INVX2TS U790 ( .A(result_add_subt[2]), .Y(n2274) );
  INVX2TS U791 ( .A(result_add_subt[15]), .Y(n2289) );
  INVX2TS U792 ( .A(result_add_subt[21]), .Y(n2296) );
  INVX2TS U793 ( .A(result_add_subt[28]), .Y(n2304) );
  INVX2TS U794 ( .A(result_add_subt[11]), .Y(n2284) );
  INVX2TS U795 ( .A(result_add_subt[27]), .Y(n2303) );
  INVX2TS U796 ( .A(result_add_subt[23]), .Y(n2298) );
  INVX2TS U797 ( .A(result_add_subt[16]), .Y(n2290) );
  NAND2X1TS U798 ( .A(n1462), .B(d_ff3_sh_x_out[27]), .Y(n1956) );
  NOR2X4TS U799 ( .A(n2124), .B(n1794), .Y(n1714) );
  BUFX3TS U800 ( .A(n1452), .Y(n1453) );
  INVX12TS U801 ( .A(net34449), .Y(net34987) );
  INVX6TS U802 ( .A(n1792), .Y(n1060) );
  BUFX16TS U803 ( .A(n1176), .Y(n1108) );
  INVX8TS U804 ( .A(net34540), .Y(net36489) );
  NAND2X1TS U805 ( .A(n1643), .B(n1571), .Y(n1264) );
  XNOR2X2TS U806 ( .A(d_ff2_X[25]), .B(n1188), .Y(n1638) );
  BUFX16TS U807 ( .A(net35106), .Y(net36078) );
  AND2X2TS U808 ( .A(net37190), .B(d_ff1_Z[21]), .Y(n1166) );
  CLKINVX3TS U809 ( .A(n1958), .Y(n1763) );
  NAND2X6TS U810 ( .A(n1883), .B(n1492), .Y(n1918) );
  AND2X2TS U811 ( .A(net35106), .B(d_ff1_Z[2]), .Y(n1491) );
  AND2X4TS U812 ( .A(n1695), .B(n1119), .Y(n1879) );
  INVX8TS U813 ( .A(n1175), .Y(net35039) );
  CLKMX2X4TS U814 ( .A(n2184), .B(n2183), .S0(n2182), .Y(n1073) );
  NAND3X4TS U815 ( .A(n1330), .B(n1767), .C(n1261), .Y(n1797) );
  NAND2X4TS U816 ( .A(net36827), .B(n1254), .Y(n1172) );
  NOR2X2TS U817 ( .A(net34843), .B(n1191), .Y(n1245) );
  INVX1TS U818 ( .A(n1375), .Y(n1376) );
  CLKBUFX2TS U819 ( .A(n1801), .Y(n2253) );
  NAND2X4TS U820 ( .A(n1127), .B(n1112), .Y(n1111) );
  CLKBUFX2TS U821 ( .A(n1446), .Y(n2256) );
  NAND3X4TS U822 ( .A(n1349), .B(n1493), .C(n1644), .Y(n1744) );
  NAND2X2TS U823 ( .A(n1516), .B(d_ff_Yn[2]), .Y(n1515) );
  INVX4TS U824 ( .A(n1732), .Y(n1463) );
  BUFX12TS U825 ( .A(net35106), .Y(n1079) );
  OR2X4TS U826 ( .A(n1884), .B(n2024), .Y(n1709) );
  INVX2TS U827 ( .A(n1696), .Y(n1697) );
  NOR2X4TS U828 ( .A(n1794), .B(n2120), .Y(n1181) );
  INVX2TS U829 ( .A(n2112), .Y(n1058) );
  CLKXOR2X2TS U830 ( .A(n1317), .B(net34251), .Y(n1957) );
  AND2X2TS U831 ( .A(net35421), .B(n1827), .Y(n1087) );
  NAND3X4TS U832 ( .A(n2027), .B(n1492), .C(n1251), .Y(n1871) );
  BUFX4TS U833 ( .A(n1354), .Y(n2030) );
  BUFX2TS U834 ( .A(d_ff3_LUT_out[21]), .Y(n1481) );
  INVX8TS U835 ( .A(n1067), .Y(n1069) );
  BUFX6TS U836 ( .A(n1342), .Y(n1996) );
  INVX8TS U837 ( .A(n1067), .Y(n1068) );
  CLKBUFX3TS U838 ( .A(n1342), .Y(n1998) );
  BUFX6TS U839 ( .A(n1342), .Y(n2007) );
  CLKBUFX2TS U840 ( .A(d_ff2_Y[28]), .Y(n1059) );
  INVX4TS U841 ( .A(n1459), .Y(n1460) );
  NAND2X1TS U842 ( .A(net36503), .B(net36493), .Y(n1522) );
  NAND3X4TS U843 ( .A(n1581), .B(n1582), .C(n1701), .Y(n1330) );
  INVX12TS U844 ( .A(net34901), .Y(net34449) );
  AND2X2TS U845 ( .A(d_ff1_Z[28]), .B(net35106), .Y(n1528) );
  INVX2TS U846 ( .A(n1761), .Y(n1586) );
  INVX6TS U847 ( .A(n1492), .Y(n2024) );
  NAND2X6TS U848 ( .A(n1794), .B(n1385), .Y(n1748) );
  NAND2X2TS U849 ( .A(n1298), .B(net34251), .Y(n1587) );
  NAND3X2TS U850 ( .A(n1311), .B(n1581), .C(n1701), .Y(n1766) );
  NOR2X4TS U851 ( .A(n1737), .B(net37160), .Y(n1696) );
  NAND2X1TS U852 ( .A(n1827), .B(net35849), .Y(n1254) );
  INVX8TS U853 ( .A(net35581), .Y(net35027) );
  AND2X2TS U854 ( .A(n1585), .B(n1298), .Y(n1580) );
  NOR2X2TS U855 ( .A(n1314), .B(n1566), .Y(n1493) );
  NAND2X4TS U856 ( .A(net36493), .B(net37160), .Y(n1251) );
  INVX2TS U857 ( .A(n1306), .Y(n1525) );
  NAND2X2TS U858 ( .A(n1644), .B(n1643), .Y(n1641) );
  NAND2BX2TS U859 ( .AN(n1824), .B(n1737), .Y(n1831) );
  BUFX8TS U860 ( .A(net36827), .Y(n1127) );
  BUFX6TS U861 ( .A(net34732), .Y(n1119) );
  INVX2TS U862 ( .A(n1373), .Y(n1374) );
  INVX6TS U863 ( .A(n1872), .Y(n1737) );
  INVX8TS U864 ( .A(net35106), .Y(net35335) );
  NAND2X2TS U865 ( .A(n1884), .B(net36503), .Y(n1151) );
  INVX2TS U866 ( .A(n1136), .Y(n1096) );
  NOR2X2TS U867 ( .A(n1120), .B(n1080), .Y(n1691) );
  INVX4TS U868 ( .A(n1826), .Y(n1530) );
  NAND2X2TS U869 ( .A(net35421), .B(net37160), .Y(n1150) );
  BUFX4TS U870 ( .A(n1999), .Y(n1461) );
  NAND2X4TS U871 ( .A(net35054), .B(net36617), .Y(n1826) );
  NAND2X6TS U872 ( .A(n1326), .B(n1571), .Y(n1644) );
  BUFX6TS U873 ( .A(n1153), .Y(n1139) );
  OR2X2TS U874 ( .A(net34460), .B(net37160), .Y(n1824) );
  NAND2BX2TS U875 ( .AN(n1417), .B(n1278), .Y(n1309) );
  BUFX3TS U876 ( .A(net35006), .Y(n1136) );
  INVX2TS U877 ( .A(n1314), .Y(n1145) );
  INVX2TS U878 ( .A(net36274), .Y(n1122) );
  INVX8TS U879 ( .A(ready_add_subt), .Y(n1837) );
  NOR2X2TS U880 ( .A(n1294), .B(n1297), .Y(n1584) );
  INVX6TS U881 ( .A(net34251), .Y(n1090) );
  BUFX3TS U882 ( .A(net34830), .Y(net35442) );
  NAND2X6TS U883 ( .A(net36493), .B(n1099), .Y(n2027) );
  INVX2TS U884 ( .A(n1106), .Y(net36282) );
  NOR2X6TS U885 ( .A(n2019), .B(net34260), .Y(n1495) );
  BUFX6TS U886 ( .A(n1548), .Y(n1508) );
  NAND2X4TS U887 ( .A(net36493), .B(n1321), .Y(n2021) );
  BUFX3TS U888 ( .A(net35717), .Y(net36990) );
  NAND2X6TS U889 ( .A(n1348), .B(net36152), .Y(n1571) );
  BUFX16TS U890 ( .A(n1182), .Y(n1106) );
  INVX4TS U891 ( .A(n1317), .Y(n1318) );
  NOR2X4TS U892 ( .A(net34460), .B(n1302), .Y(n1637) );
  NAND2X4TS U893 ( .A(net34740), .B(net37029), .Y(net35356) );
  INVX6TS U894 ( .A(net35427), .Y(net36293) );
  INVX8TS U895 ( .A(inst_CORDIC_FSM_v3_state_reg_0_), .Y(n1182) );
  INVX12TS U896 ( .A(net35729), .Y(net36493) );
  INVX4TS U897 ( .A(n1340), .Y(n1341) );
  INVX4TS U898 ( .A(n1347), .Y(n1348) );
  INVX2TS U899 ( .A(n1321), .Y(n1322) );
  INVX12TS U900 ( .A(net35832), .Y(n1080) );
  INVX12TS U901 ( .A(net36274), .Y(n1089) );
  INVX12TS U902 ( .A(net37099), .Y(n1118) );
  INVX16TS U903 ( .A(net34460), .Y(net34533) );
  NAND2X6TS U904 ( .A(net27486), .B(data_output[2]), .Y(n1538) );
  NOR3X8TS U905 ( .A(net34987), .B(n2095), .C(net35335), .Y(n1441) );
  NAND2X4TS U906 ( .A(net35372), .B(net34546), .Y(n1226) );
  MXI2X4TS U907 ( .A(n2051), .B(n2301), .S0(n1344), .Y(n860) );
  MXI2X4TS U908 ( .A(n2072), .B(n2306), .S0(n1344), .Y(n855) );
  MXI2X4TS U909 ( .A(net28436), .B(n2287), .S0(n1344), .Y(n871) );
  MXI2X4TS U910 ( .A(n2042), .B(n2279), .S0(n1344), .Y(n878) );
  MXI2X4TS U911 ( .A(n2050), .B(n2299), .S0(n1344), .Y(n861) );
  MXI2X2TS U912 ( .A(n2123), .B(n2289), .S0(n1344), .Y(n870) );
  MXI2X4TS U913 ( .A(n2037), .B(n2273), .S0(n1344), .Y(n884) );
  AND3X8TS U914 ( .A(n1592), .B(n1591), .C(n1590), .Y(n2130) );
  NAND3X4TS U915 ( .A(net36827), .B(n1588), .C(n1589), .Y(n1590) );
  NAND2X6TS U916 ( .A(n1328), .B(n1878), .Y(n1917) );
  CLKINVX6TS U917 ( .A(beg_add_subt), .Y(n1544) );
  NAND2X8TS U918 ( .A(n1096), .B(n1094), .Y(n1093) );
  INVX8TS U919 ( .A(n1095), .Y(n1094) );
  OR2X6TS U920 ( .A(net37160), .B(net34251), .Y(n1260) );
  NAND3X4TS U921 ( .A(n1678), .B(n1679), .C(n1677), .Y(n2342) );
  NAND2X4TS U922 ( .A(net35373), .B(n1377), .Y(n1594) );
  NAND3X4TS U923 ( .A(net35596), .B(n1743), .C(d_ff2_Y[29]), .Y(n1647) );
  OR2X6TS U924 ( .A(n1292), .B(n1526), .Y(n2317) );
  OR2X6TS U925 ( .A(net34540), .B(n1276), .Y(n1677) );
  MXI2X4TS U926 ( .A(n2296), .B(n1370), .S0(n1078), .Y(n896) );
  MXI2X4TS U927 ( .A(n2271), .B(n1365), .S0(n1078), .Y(n886) );
  MX2X4TS U928 ( .A(result_add_subt[13]), .B(n1372), .S0(n1078), .Y(n904) );
  MX2X4TS U929 ( .A(result_add_subt[8]), .B(n1371), .S0(n1078), .Y(n909) );
  MXI2X4TS U930 ( .A(n2043), .B(n2283), .S0(n1343), .Y(n875) );
  MXI2X4TS U931 ( .A(n2047), .B(n2291), .S0(n1343), .Y(n868) );
  MXI2X4TS U932 ( .A(n2118), .B(n2297), .S0(n1343), .Y(n863) );
  MXI2X4TS U933 ( .A(n2119), .B(n2272), .S0(n1343), .Y(n885) );
  MXI2X4TS U934 ( .A(n2122), .B(n2281), .S0(n1343), .Y(n876) );
  MXI2X4TS U935 ( .A(n2040), .B(n2277), .S0(n1343), .Y(n880) );
  AOI22X2TS U936 ( .A0(n1996), .A1(d_ff2_Y[5]), .B0(n1987), .B1(d_ff2_Z[5]), 
        .Y(n1975) );
  CLKINVX12TS U937 ( .A(n1076), .Y(n1345) );
  CLKINVX12TS U938 ( .A(n1076), .Y(n1343) );
  CLKINVX12TS U939 ( .A(n1076), .Y(n1344) );
  CLKINVX12TS U940 ( .A(n1076), .Y(n1346) );
  AOI22X2TS U941 ( .A0(d_ff3_sh_x_out[1]), .A1(n2007), .B0(n1989), .B1(
        d_ff3_LUT_out[1]), .Y(n2005) );
  AOI22X2TS U942 ( .A0(n1996), .A1(d_ff2_Y[10]), .B0(n1989), .B1(n1241), .Y(
        n1976) );
  AOI22X2TS U943 ( .A0(n1996), .A1(d_ff2_Y[16]), .B0(n1989), .B1(n1243), .Y(
        n1968) );
  AOI22X2TS U944 ( .A0(n1059), .A1(n1990), .B0(n1989), .B1(d_ff2_Z[28]), .Y(
        n2001) );
  AOI22X2TS U945 ( .A0(n2007), .A1(d_ff2_Y[15]), .B0(n1989), .B1(n1238), .Y(
        n1983) );
  AOI22X2TS U946 ( .A0(n1990), .A1(n1290), .B0(n1989), .B1(n1421), .Y(n2031)
         );
  MXI2X4TS U947 ( .A(n2121), .B(n2280), .S0(n1346), .Y(n877) );
  INVX16TS U948 ( .A(n1252), .Y(n1332) );
  XOR2X4TS U949 ( .A(n1838), .B(n1252), .Y(n985) );
  MXI2X4TS U950 ( .A(n2273), .B(n1402), .S0(n2009), .Y(n916) );
  MXI2X4TS U951 ( .A(n2291), .B(n1386), .S0(n1189), .Y(n900) );
  BUFX20TS U952 ( .A(n1995), .Y(n1189) );
  NAND3X6TS U953 ( .A(n1652), .B(n1654), .C(n1653), .Y(n2315) );
  MX2X4TS U954 ( .A(d_ff2_Y[9]), .B(d_ff3_sh_y_out[9]), .S0(net35684), .Y(n748) );
  INVX16TS U955 ( .A(n2013), .Y(n2009) );
  NAND2BX2TS U956 ( .AN(net27868), .B(net34856), .Y(net34771) );
  NAND3X4TS U957 ( .A(n1612), .B(n1611), .C(n1610), .Y(n2334) );
  INVX6TS U958 ( .A(n1354), .Y(n2011) );
  XNOR2X4TS U959 ( .A(enab_cont_iter), .B(net36503), .Y(n1255) );
  NAND2X4TS U960 ( .A(net35299), .B(n1373), .Y(n1551) );
  NAND3X6TS U961 ( .A(n1676), .B(n1674), .C(n1675), .Y(n2343) );
  NAND3X6TS U962 ( .A(n1700), .B(n1699), .C(n1698), .Y(n804) );
  NAND3X4TS U963 ( .A(n1703), .B(n1763), .C(n1589), .Y(n1592) );
  NAND2X8TS U964 ( .A(net34251), .B(n1188), .Y(n1872) );
  INVX8TS U965 ( .A(net34828), .Y(n1084) );
  CLKINVX12TS U966 ( .A(n1630), .Y(n1083) );
  MXI2X4TS U967 ( .A(net28181), .B(net28182), .S0(net28183), .Y(net34567) );
  NAND3X6TS U968 ( .A(n1836), .B(net34498), .C(n1835), .Y(n2322) );
  NAND2X4TS U969 ( .A(net35299), .B(n1834), .Y(n1836) );
  NAND2X4TS U970 ( .A(net36302), .B(data_output[24]), .Y(n1228) );
  NAND2X4TS U971 ( .A(net36302), .B(data_output[1]), .Y(n1734) );
  MX2X4TS U972 ( .A(d_ff2_Y[2]), .B(d_ff3_sh_y_out[2]), .S0(net34495), .Y(n762) );
  MX2X4TS U973 ( .A(d_ff2_X[0]), .B(n1468), .S0(net34495), .Y(n702) );
  CLKMX2X4TS U974 ( .A(d_ff2_X[13]), .B(d_ff3_sh_x_out[13]), .S0(net34495), 
        .Y(n676) );
  NAND2X4TS U975 ( .A(net34495), .B(d_ff3_LUT_out[1]), .Y(n1710) );
  MX2X4TS U976 ( .A(d_ff2_X[1]), .B(d_ff3_sh_x_out[1]), .S0(net34495), .Y(n700) );
  AND2X8TS U977 ( .A(n1783), .B(n1093), .Y(n1092) );
  INVX16TS U978 ( .A(n1783), .Y(enab_cont_iter) );
  MX2X4TS U979 ( .A(d_ff2_X[7]), .B(d_ff3_sh_x_out[7]), .S0(net35684), .Y(n688) );
  INVX12TS U980 ( .A(net35596), .Y(net35684) );
  OAI21X2TS U981 ( .A0(n2268), .A1(n1923), .B0(n1993), .Y(add_subt_dataB[25])
         );
  OAI21X2TS U982 ( .A0(n2267), .A1(n1923), .B0(n1992), .Y(add_subt_dataB[24])
         );
  INVX8TS U983 ( .A(n1923), .Y(n1488) );
  NAND2X4TS U984 ( .A(net35373), .B(d_ff_Xn[11]), .Y(n1230) );
  NAND2X4TS U985 ( .A(net35373), .B(n1369), .Y(n1626) );
  OR3X6TS U986 ( .A(n1168), .B(n2109), .C(net35335), .Y(n1659) );
  NAND2X8TS U987 ( .A(n1168), .B(n1170), .Y(net34498) );
  NAND2X8TS U988 ( .A(n1168), .B(n1169), .Y(net34855) );
  NAND3X4TS U989 ( .A(n1911), .B(n1913), .C(n1919), .Y(n808) );
  BUFX20TS U990 ( .A(net37158), .Y(n1160) );
  OAI21X4TS U991 ( .A0(net35481), .A1(n2132), .B0(net34887), .Y(n716) );
  NAND2BX4TS U992 ( .AN(net35481), .B(n1420), .Y(n1658) );
  OR2X6TS U993 ( .A(net35481), .B(n1428), .Y(n1615) );
  OR2X8TS U994 ( .A(net35481), .B(net27844), .Y(net34782) );
  OR2X8TS U995 ( .A(net35481), .B(n2231), .Y(n1671) );
  NAND3X6TS U996 ( .A(n1655), .B(n1656), .C(n1657), .Y(n2330) );
  NAND3X6TS U997 ( .A(n1841), .B(net34486), .C(n1840), .Y(n2321) );
  NAND2X4TS U998 ( .A(net35372), .B(d_ff_Xn[21]), .Y(n1593) );
  AOI22X4TS U999 ( .A0(net35652), .A1(n2046), .B0(net34898), .B1(n1415), .Y(
        n671) );
  NAND2X4TS U1000 ( .A(n1125), .B(net35421), .Y(n1171) );
  NAND2X4TS U1001 ( .A(net35373), .B(n1383), .Y(n1561) );
  OAI2BB1X4TS U1002 ( .A0N(net36991), .A1N(n1290), .B0(n1559), .Y(n714) );
  AND2X8TS U1003 ( .A(n1494), .B(n1744), .Y(n1323) );
  INVX16TS U1004 ( .A(net37201), .Y(net35306) );
  OAI21X4TS U1005 ( .A0(n1104), .A1(n1391), .B0(n1133), .Y(n737) );
  OAI21X4TS U1006 ( .A0(n1104), .A1(n2118), .B0(n1134), .Y(n659) );
  OAI21X4TS U1007 ( .A0(n1716), .A1(n1108), .B0(n1715), .Y(n2356) );
  AOI2BB2X2TS U1008 ( .B0(n1768), .B1(n1797), .A0N(net36827), .A1N(
        d_ff3_sh_x_out[29]), .Y(n643) );
  NAND3X4TS U1009 ( .A(n1914), .B(n1912), .C(n1913), .Y(n818) );
  AO22X4TS U1010 ( .A0(n1299), .A1(d_ff_Xn[25]), .B0(n1516), .B1(n1395), .Y(
        n1534) );
  INVX16TS U1011 ( .A(net34875), .Y(net34453) );
  MX2X4TS U1012 ( .A(d_ff2_X[21]), .B(d_ff3_sh_x_out[21]), .S0(net34246), .Y(
        n660) );
  MX2X4TS U1013 ( .A(d_ff2_X[4]), .B(n1472), .S0(net34246), .Y(n694) );
  OAI2BB1X4TS U1014 ( .A0N(net36489), .A1N(n1576), .B0(n1575), .Y(n739) );
  NAND2X4TS U1015 ( .A(n1328), .B(n1697), .Y(n1699) );
  CLKMX2X4TS U1016 ( .A(d_ff2_X[15]), .B(d_ff3_sh_x_out[15]), .S0(net34235), 
        .Y(n672) );
  MX2X4TS U1017 ( .A(d_ff2_X[14]), .B(d_ff3_sh_x_out[14]), .S0(net34235), .Y(
        n674) );
  MX2X4TS U1018 ( .A(d_ff2_X[11]), .B(d_ff3_sh_x_out[11]), .S0(net34235), .Y(
        n680) );
  MX2X4TS U1019 ( .A(d_ff2_Y[7]), .B(d_ff3_sh_y_out[7]), .S0(net34235), .Y(
        n752) );
  MX2X4TS U1020 ( .A(d_ff2_Y[16]), .B(d_ff3_sh_y_out[16]), .S0(net34235), .Y(
        n734) );
  NAND3X6TS U1021 ( .A(n1164), .B(n1162), .C(n1161), .Y(n2338) );
  MXI2X4TS U1022 ( .A(n2105), .B(n1898), .S0(n1281), .Y(n973) );
  MXI2X4TS U1023 ( .A(n2100), .B(n1876), .S0(n1281), .Y(n971) );
  MXI2X4TS U1024 ( .A(net28353), .B(n1890), .S0(n1281), .Y(n954) );
  MXI2X4TS U1025 ( .A(net28360), .B(n1894), .S0(n1281), .Y(n962) );
  MXI2X4TS U1026 ( .A(n2099), .B(n1874), .S0(n1281), .Y(n978) );
  MXI2X4TS U1027 ( .A(n2093), .B(n1889), .S0(n1281), .Y(n966) );
  NAND3X4TS U1028 ( .A(n1915), .B(net36503), .C(n2024), .Y(n1861) );
  NAND3X2TS U1029 ( .A(n1226), .B(net34778), .C(net34779), .Y(net23567) );
  MX2X4TS U1030 ( .A(d_ff2_Z[31]), .B(d_ff3_sign_out), .S0(net34495), .Y(n768)
         );
  INVX16TS U1031 ( .A(net34489), .Y(net36991) );
  NAND2X2TS U1032 ( .A(net35371), .B(n1806), .Y(n1622) );
  OR2X8TS U1033 ( .A(net35334), .B(n2230), .Y(n1620) );
  MX2X1TS U1034 ( .A(d_ff2_X[9]), .B(d_ff3_sh_x_out[9]), .S0(net34237), .Y(
        n684) );
  AOI22X2TS U1035 ( .A0(n1474), .A1(n1996), .B0(n2030), .B1(n1296), .Y(n1774)
         );
  CLKMX2X4TS U1036 ( .A(d_ff2_X[6]), .B(d_ff3_sh_x_out[6]), .S0(net34395), .Y(
        n690) );
  CLKINVX12TS U1037 ( .A(n1148), .Y(net36640) );
  NAND2X8TS U1038 ( .A(n1158), .B(net35846), .Y(net35508) );
  OAI2BB1X4TS U1039 ( .A0N(net34987), .A1N(n1552), .B0(n1551), .Y(n745) );
  NAND2X8TS U1040 ( .A(n1527), .B(n1524), .Y(n1526) );
  INVX6TS U1041 ( .A(n1704), .Y(n1702) );
  NAND2BX4TS U1042 ( .AN(net34745), .B(n1304), .Y(n1558) );
  NAND2X4TS U1043 ( .A(n1147), .B(data_output[30]), .Y(n1539) );
  MXI2X4TS U1044 ( .A(net28350), .B(n1896), .S0(n1895), .Y(n957) );
  MXI2X4TS U1045 ( .A(n2111), .B(n1887), .S0(n1895), .Y(n981) );
  BUFX8TS U1046 ( .A(net35718), .Y(n1120) );
  INVX16TS U1047 ( .A(n1175), .Y(n1146) );
  BUFX20TS U1048 ( .A(net27489), .Y(n1176) );
  BUFX3TS U1049 ( .A(net36617), .Y(n1056) );
  MXI2X4TS U1050 ( .A(n1877), .B(n1417), .S0(n1140), .Y(n984) );
  INVX16TS U1051 ( .A(n1516), .Y(n1792) );
  INVX16TS U1052 ( .A(n1794), .Y(n1723) );
  OAI21X4TS U1053 ( .A0(n1141), .A1(n1900), .B0(n1057), .Y(n980) );
  NAND2X8TS U1054 ( .A(n1141), .B(n1058), .Y(n1057) );
  INVX16TS U1055 ( .A(n1300), .Y(n1355) );
  INVX16TS U1056 ( .A(net35476), .Y(net36998) );
  AND2X8TS U1057 ( .A(n1216), .B(n1187), .Y(n1102) );
  NAND3X6TS U1058 ( .A(n1647), .B(n1646), .C(n1645), .Y(n707) );
  AOI22X4TS U1059 ( .A0(n1299), .A1(d_ff_Xn[29]), .B0(n1794), .B1(d_ff_Yn[29]), 
        .Y(n1736) );
  CLKINVX12TS U1060 ( .A(n1509), .Y(n1732) );
  INVX16TS U1061 ( .A(n1461), .Y(n1067) );
  MX2X4TS U1062 ( .A(d_ff2_Y[10]), .B(d_ff3_sh_y_out[10]), .S0(net34235), .Y(
        n746) );
  INVX6TS U1063 ( .A(net27561), .Y(n1117) );
  NAND2X1TS U1064 ( .A(net34772), .B(n1491), .Y(n1408) );
  NAND2BX2TS U1065 ( .AN(net36827), .B(d_ff3_LUT_out[4]), .Y(n1088) );
  NAND2X1TS U1066 ( .A(n1069), .B(d_ff3_sh_x_out[7]), .Y(n1953) );
  NAND2X1TS U1067 ( .A(n1068), .B(d_ff3_sh_x_out[20]), .Y(n1960) );
  NAND2X1TS U1068 ( .A(n1462), .B(d_ff3_sh_x_out[29]), .Y(n1963) );
  INVX2TS U1069 ( .A(n1302), .Y(n1303) );
  INVX6TS U1070 ( .A(n2032), .Y(n1959) );
  NAND2X4TS U1071 ( .A(n1108), .B(data_output[31]), .Y(n2309) );
  INVX2TS U1072 ( .A(result_add_subt[8]), .Y(n2280) );
  INVX2TS U1073 ( .A(result_add_subt[30]), .Y(n2306) );
  INVX12TS U1074 ( .A(n1155), .Y(net37158) );
  OR2X4TS U1075 ( .A(net35596), .B(n1287), .Y(n1071) );
  NAND2X1TS U1076 ( .A(d_ff3_sh_y_out[28]), .B(net34237), .Y(n1072) );
  AND2X8TS U1077 ( .A(n1644), .B(n1643), .Y(n1074) );
  MX2X4TS U1078 ( .A(n2175), .B(n2174), .S0(n2173), .Y(n1075) );
  OR3X8TS U1079 ( .A(n1252), .B(n1333), .C(n1837), .Y(n1076) );
  AND2X4TS U1080 ( .A(net35844), .B(net35718), .Y(net35383) );
  NOR2X4TS U1081 ( .A(inst_CORDIC_FSM_v3_state_reg_0_), .B(net35718), .Y(
        net35004) );
  AND2X6TS U1082 ( .A(net35718), .B(net35846), .Y(net35341) );
  NAND2X2TS U1083 ( .A(enab_cont_iter), .B(n1506), .Y(n1505) );
  NAND3X2TS U1084 ( .A(n1619), .B(n1618), .C(n1165), .Y(n2324) );
  MXI2X2TS U1085 ( .A(n2278), .B(n1398), .S0(n2009), .Y(n911) );
  MXI2X2TS U1086 ( .A(n2304), .B(net35977), .S0(n2009), .Y(n889) );
  MXI2X2TS U1087 ( .A(n2301), .B(n1396), .S0(n2009), .Y(n892) );
  MXI2X2TS U1088 ( .A(n2298), .B(n1400), .S0(n2009), .Y(n894) );
  MXI2X2TS U1089 ( .A(n2279), .B(n1393), .S0(n2009), .Y(n910) );
  MXI2X2TS U1090 ( .A(n2299), .B(n1404), .S0(n2009), .Y(n893) );
  BUFX16TS U1091 ( .A(net34843), .Y(n1167) );
  INVX12TS U1092 ( .A(n2015), .Y(n2237) );
  INVX12TS U1093 ( .A(n2015), .Y(n2236) );
  INVX12TS U1094 ( .A(n2013), .Y(n1077) );
  INVX4TS U1095 ( .A(n1297), .Y(n1298) );
  INVX2TS U1096 ( .A(n2082), .Y(n1116) );
  NAND2X4TS U1097 ( .A(n1632), .B(n1149), .Y(n815) );
  AND2X4TS U1098 ( .A(n1443), .B(n2033), .Y(n988) );
  NAND2X2TS U1099 ( .A(n1505), .B(n1504), .Y(inst_CORDIC_FSM_v3_state_next[7])
         );
  NAND3X4TS U1100 ( .A(n1614), .B(n1613), .C(net34855), .Y(n2326) );
  NAND2X6TS U1101 ( .A(n1125), .B(n1087), .Y(n1086) );
  NAND2X4TS U1102 ( .A(net37196), .B(d_ff_Xn[4]), .Y(n1563) );
  NAND2X4TS U1103 ( .A(n1167), .B(n1166), .Y(n1165) );
  INVX6TS U1104 ( .A(n1288), .Y(ready_cordic) );
  MXI2X2TS U1105 ( .A(n2290), .B(n1531), .S0(n1189), .Y(n901) );
  MXI2X2TS U1106 ( .A(n2281), .B(n1389), .S0(n1189), .Y(n908) );
  NOR2X4TS U1107 ( .A(n1824), .B(n1825), .Y(n1529) );
  INVX8TS U1108 ( .A(n1748), .Y(n1113) );
  INVX6TS U1109 ( .A(n1825), .Y(n1098) );
  INVX2TS U1110 ( .A(n1831), .Y(n1506) );
  INVX16TS U1111 ( .A(n2227), .Y(n2015) );
  NAND2X4TS U1112 ( .A(n1150), .B(n1151), .Y(n1112) );
  INVX8TS U1113 ( .A(n2032), .Y(n2006) );
  BUFX8TS U1114 ( .A(n1354), .Y(n1426) );
  NAND2X6TS U1115 ( .A(n1260), .B(n2027), .Y(n1880) );
  BUFX20TS U1116 ( .A(n1342), .Y(n1990) );
  NAND2X4TS U1117 ( .A(n1130), .B(net36503), .Y(n1827) );
  INVX6TS U1118 ( .A(n2021), .Y(n1327) );
  INVX6TS U1119 ( .A(n1099), .Y(net35849) );
  INVX2TS U1120 ( .A(net27861), .Y(n1169) );
  INVX2TS U1121 ( .A(net35880), .Y(n1170) );
  INVX2TS U1122 ( .A(d_ff3_LUT_out[13]), .Y(n1927) );
  INVX2TS U1123 ( .A(n1335), .Y(n1336) );
  OAI21X2TS U1124 ( .A0(n2226), .A1(n2225), .B0(n2224), .Y(data_output[22]) );
  NAND2X6TS U1125 ( .A(data_output[7]), .B(n1108), .Y(n1519) );
  NAND3X4TS U1126 ( .A(n1231), .B(n1600), .C(n1601), .Y(n2331) );
  NAND2X4TS U1127 ( .A(n1920), .B(n1919), .Y(n806) );
  NAND3X6TS U1128 ( .A(n1088), .B(n1086), .C(n1085), .Y(n817) );
  NAND3X2TS U1129 ( .A(n1263), .B(n1830), .C(n1829), .Y(n819) );
  NAND2X6TS U1130 ( .A(n1126), .B(n1125), .Y(n1746) );
  NAND2X6TS U1131 ( .A(n1500), .B(n1705), .Y(n1706) );
  INVX3TS U1132 ( .A(n2033), .Y(n2025) );
  NAND2X6TS U1133 ( .A(n1530), .B(n1529), .Y(n2033) );
  NAND2X4TS U1134 ( .A(ready_cordic), .B(n1832), .Y(n1504) );
  INVX8TS U1135 ( .A(n1826), .Y(n1097) );
  CLKMX2X2TS U1136 ( .A(d_ff2_Y[14]), .B(d_ff3_sh_y_out[14]), .S0(net34395), 
        .Y(n738) );
  NAND2X4TS U1137 ( .A(net34772), .B(net35106), .Y(n1163) );
  INVX8TS U1138 ( .A(net34843), .Y(net36545) );
  MX2X2TS U1139 ( .A(n1394), .B(result_add_subt[30]), .S0(n2013), .Y(n887) );
  INVX16TS U1140 ( .A(net37158), .Y(net37201) );
  CLKMX2X2TS U1141 ( .A(d_ff2_Y[17]), .B(d_ff3_sh_y_out[17]), .S0(net34395), 
        .Y(n732) );
  INVX6TS U1142 ( .A(n2013), .Y(n1078) );
  INVX12TS U1143 ( .A(n2015), .Y(n2235) );
  INVX8TS U1144 ( .A(n1880), .Y(n1883) );
  INVX3TS U1145 ( .A(n1353), .Y(n2022) );
  INVX3TS U1146 ( .A(n1682), .Y(n1683) );
  NAND2X6TS U1147 ( .A(n1585), .B(n1584), .Y(n1761) );
  INVX6TS U1148 ( .A(n1764), .Y(n1585) );
  NAND2X8TS U1149 ( .A(n1990), .B(ready_add_subt), .Y(n2227) );
  INVX8TS U1150 ( .A(net35501), .Y(n1173) );
  INVX2TS U1151 ( .A(n1390), .Y(n1391) );
  INVX2TS U1152 ( .A(n1383), .Y(n1384) );
  INVX2TS U1153 ( .A(n1413), .Y(n1414) );
  INVX2TS U1154 ( .A(n1385), .Y(n1386) );
  INVX2TS U1155 ( .A(n1399), .Y(n1400) );
  INVX2TS U1156 ( .A(n1429), .Y(n1430) );
  INVX3TS U1157 ( .A(n1405), .Y(n1406) );
  MX2X4TS U1158 ( .A(n2217), .B(n2216), .S0(n2215), .Y(n1266) );
  INVX2TS U1159 ( .A(n1431), .Y(n1432) );
  MX2X4TS U1160 ( .A(n2213), .B(n2214), .S0(n1307), .Y(n1306) );
  INVX2TS U1161 ( .A(n1427), .Y(n1428) );
  INVX2TS U1162 ( .A(n1238), .Y(n1239) );
  INVX8TS U1163 ( .A(n1416), .Y(n1417) );
  INVX2TS U1164 ( .A(n1360), .Y(n1361) );
  INVX12TS U1165 ( .A(n1333), .Y(n1784) );
  OAI2BB1X4TS U1166 ( .A0N(n1358), .A1N(net37627), .B0(n1793), .Y(n2358) );
  CLKINVX12TS U1167 ( .A(net34831), .Y(net35309) );
  BUFX16TS U1168 ( .A(net27489), .Y(net35393) );
  INVX16TS U1169 ( .A(n1509), .Y(n1356) );
  NAND2X4TS U1170 ( .A(n1175), .B(data_output[29]), .Y(n1735) );
  OAI2BB1X4TS U1171 ( .A0N(net34700), .A1N(n1301), .B0(n1756), .Y(n2348) );
  NOR2X4TS U1172 ( .A(net35427), .B(net35831), .Y(n1187) );
  OAI2BB1X4TS U1173 ( .A0N(net37627), .A1N(n1325), .B0(n1733), .Y(n2371) );
  NAND2X8TS U1174 ( .A(n1223), .B(net34833), .Y(net34828) );
  NAND2X6TS U1175 ( .A(n1486), .B(n2012), .Y(beg_add_subt) );
  AOI2BB2X4TS U1176 ( .B0(n2048), .B1(net35652), .A0N(net34843), .A1N(
        d_ff2_X[19]), .Y(n665) );
  BUFX20TS U1177 ( .A(n1220), .Y(n1159) );
  NAND2X8TS U1178 ( .A(net34732), .B(n1485), .Y(n1849) );
  INVX16TS U1179 ( .A(n1081), .Y(net34732) );
  NAND2X8TS U1180 ( .A(net35015), .B(net34831), .Y(n1081) );
  OAI2BB1X4TS U1181 ( .A0N(n1174), .A1N(n1357), .B0(n1782), .Y(n2369) );
  INVX16TS U1182 ( .A(n1220), .Y(n1489) );
  NAND3X6TS U1183 ( .A(n1071), .B(n1916), .C(n1917), .Y(n821) );
  AND3X6TS U1184 ( .A(net35844), .B(n1106), .C(net34460), .Y(n1692) );
  NAND2X8TS U1185 ( .A(n1579), .B(n1578), .Y(n1958) );
  NAND2X8TS U1186 ( .A(n1581), .B(n1582), .Y(n1579) );
  NOR2X8TS U1187 ( .A(net34914), .B(net34460), .Y(n1229) );
  INVX16TS U1188 ( .A(net34982), .Y(net35665) );
  INVX16TS U1189 ( .A(n1082), .Y(n1915) );
  NAND2X4TS U1190 ( .A(n1915), .B(net36493), .Y(n1085) );
  NAND2X8TS U1191 ( .A(n1084), .B(n1083), .Y(n1082) );
  NAND2X8TS U1192 ( .A(n1090), .B(n1122), .Y(n1492) );
  INVX4TS U1193 ( .A(n1091), .Y(n1777) );
  XOR2X4TS U1194 ( .A(n1091), .B(n1290), .Y(n1144) );
  NAND3X8TS U1195 ( .A(n1074), .B(n1349), .C(n1143), .Y(n1091) );
  NAND3X4TS U1196 ( .A(net36998), .B(net36548), .C(n1056), .Y(n1095) );
  NAND2X8TS U1197 ( .A(n1098), .B(n1097), .Y(n1783) );
  BUFX12TS U1198 ( .A(net36152), .Y(n1099) );
  OAI21X4TS U1199 ( .A0(n2172), .A1(n2170), .B0(n1100), .Y(n1807) );
  NAND2BX4TS U1200 ( .AN(n2171), .B(n2170), .Y(n1100) );
  NAND2X8TS U1201 ( .A(n1102), .B(n1153), .Y(n1848) );
  NAND2BX4TS U1202 ( .AN(n1101), .B(n1543), .Y(n1738) );
  NAND2X1TS U1203 ( .A(n1102), .B(n1508), .Y(n1101) );
  INVX12TS U1204 ( .A(net35831), .Y(net35832) );
  NOR2X8TS U1205 ( .A(net35831), .B(inst_CORDIC_FSM_v3_state_reg_0_), .Y(
        net36997) );
  INVX16TS U1206 ( .A(n1103), .Y(n1104) );
  CLKINVX12TS U1207 ( .A(net37544), .Y(net36058) );
  INVX12TS U1208 ( .A(n1105), .Y(n1103) );
  BUFX20TS U1209 ( .A(net37544), .Y(n1105) );
  OAI22X4TS U1210 ( .A0(net34745), .A1(n2088), .B0(n1104), .B1(n1531), .Y(n735) );
  NOR3X8TS U1211 ( .A(n1182), .B(n1154), .C(n1080), .Y(n1485) );
  NAND2X8TS U1212 ( .A(net35844), .B(net35718), .Y(n1154) );
  NAND2X6TS U1213 ( .A(n1107), .B(n1171), .Y(n802) );
  OAI2BB1X4TS U1214 ( .A0N(net36991), .A1N(d_ff2_Y[31]), .B0(n1562), .Y(n705)
         );
  NAND2X8TS U1215 ( .A(n1172), .B(n1499), .Y(n1107) );
  INVX8TS U1216 ( .A(net34982), .Y(net35705) );
  INVX16TS U1217 ( .A(net34982), .Y(net34265) );
  NAND2X4TS U1218 ( .A(n1176), .B(data_output[15]), .Y(n1795) );
  NAND2X4TS U1219 ( .A(n2016), .B(n2020), .Y(n2017) );
  OAI2BB1X4TS U1220 ( .A0N(n1532), .A1N(net34700), .B0(n1538), .Y(n2372) );
  NAND2X4TS U1221 ( .A(n1176), .B(data_output[28]), .Y(n1719) );
  OAI21X2TS U1222 ( .A0(n1781), .A1(n1108), .B0(n1780), .Y(n2361) );
  INVX16TS U1223 ( .A(net34856), .Y(net35481) );
  NAND2X8TS U1224 ( .A(n1177), .B(data_output[17]), .Y(n1749) );
  CLKINVX12TS U1225 ( .A(net27489), .Y(n1174) );
  CLKBUFX2TS U1226 ( .A(n1299), .Y(n1110) );
  OAI21X4TS U1227 ( .A0(n1736), .A1(n1177), .B0(n1735), .Y(n2346) );
  OAI2BB1X4TS U1228 ( .A0N(n1174), .A1N(n1537), .B0(n1540), .Y(n2362) );
  AND2X8TS U1229 ( .A(n1111), .B(n1631), .Y(n1149) );
  INVX16TS U1230 ( .A(net34982), .Y(net34246) );
  AOI22X4TS U1231 ( .A0(n1779), .A1(d_ff_Xn[15]), .B0(n1794), .B1(n1390), .Y(
        n1796) );
  OR2X8TS U1232 ( .A(net34453), .B(n2232), .Y(n1840) );
  AOI2BB2X4TS U1233 ( .B0(net35652), .B1(n2045), .A0N(d_ff2_X[13]), .A1N(
        net34538), .Y(n677) );
  NAND3X8TS U1234 ( .A(net34831), .B(net36548), .C(net36998), .Y(net35328) );
  NOR2X8TS U1235 ( .A(n1113), .B(n1747), .Y(n1750) );
  AOI22X4TS U1236 ( .A0(net35303), .A1(net28436), .B0(net35877), .B1(net36489), 
        .Y(n675) );
  CLKBUFX2TS U1237 ( .A(n1485), .Y(n1114) );
  INVX16TS U1238 ( .A(net35927), .Y(n1158) );
  INVX6TS U1239 ( .A(n1115), .Y(n1729) );
  OAI22X4TS U1240 ( .A0(net28336), .A1(n1794), .B0(n1299), .B1(n1374), .Y(
        n1115) );
  OAI2BB1X4TS U1241 ( .A0N(net36991), .A1N(n1116), .B0(n1554), .Y(n753) );
  NAND2X4TS U1242 ( .A(n1728), .B(n1183), .Y(n2363) );
  NAND2X8TS U1243 ( .A(n1118), .B(n1117), .Y(n1227) );
  INVX6TS U1244 ( .A(net35927), .Y(net36548) );
  BUFX20TS U1245 ( .A(n1790), .Y(n1516) );
  OAI2BB1X4TS U1246 ( .A0N(d_ff2_Y[13]), .A1N(n1168), .B0(n1687), .Y(n741) );
  OAI2BB1X4TS U1247 ( .A0N(d_ff2_X[30]), .A1N(n1168), .B0(n1684), .Y(n650) );
  OAI2BB1X4TS U1248 ( .A0N(n1249), .A1N(net36545), .B0(n1858), .Y(n715) );
  AOI22X4TS U1249 ( .A0(n1060), .A1(d_ff_Yn[26]), .B0(d_ff_Xn[26]), .B1(n1299), 
        .Y(n1755) );
  NAND2X4TS U1250 ( .A(net35299), .B(d_ff_Yn[2]), .Y(n1567) );
  NAND3X4TS U1251 ( .A(net34453), .B(d_ff1_Z[0]), .C(n1079), .Y(n1675) );
  BUFX20TS U1252 ( .A(inst_CORDIC_FSM_v3_state_reg_0_), .Y(net37099) );
  INVX16TS U1253 ( .A(n1158), .Y(n1185) );
  NOR2X8TS U1254 ( .A(n1121), .B(n1227), .Y(net35323) );
  NAND2X8TS U1255 ( .A(n1223), .B(n1089), .Y(n1121) );
  INVX12TS U1256 ( .A(net36152), .Y(net34914) );
  MXI2X4TS U1257 ( .A(n2116), .B(n1891), .S0(n1895), .Y(n950) );
  BUFX6TS U1258 ( .A(n1222), .Y(n1123) );
  NAND2X8TS U1259 ( .A(net37546), .B(net35356), .Y(net37544) );
  NAND2X4TS U1260 ( .A(net35299), .B(n1839), .Y(n1841) );
  MX2X4TS U1261 ( .A(n1279), .B(n1280), .S0(n1299), .Y(n2310) );
  OAI21X4TS U1262 ( .A0(n2223), .A1(n2222), .B0(n2221), .Y(data_output[31]) );
  NOR2X2TS U1263 ( .A(n1416), .B(n1278), .Y(n1680) );
  BUFX6TS U1264 ( .A(n1221), .Y(n1124) );
  INVX12TS U1265 ( .A(n1355), .Y(n1779) );
  INVX12TS U1266 ( .A(net35665), .Y(n1125) );
  CLKINVX6TS U1267 ( .A(n1743), .Y(n1126) );
  AOI22X4TS U1268 ( .A0(n1355), .A1(net35976), .B0(d_ff_Xn[28]), .B1(n1299), 
        .Y(n1720) );
  MX2X4TS U1269 ( .A(d_ff2_X[2]), .B(n1470), .S0(net35705), .Y(n698) );
  NAND3X6TS U1270 ( .A(n1706), .B(n1708), .C(n1707), .Y(n645) );
  BUFX20TS U1271 ( .A(n1790), .Y(n1509) );
  AND2X8TS U1272 ( .A(net34982), .B(n1580), .Y(n1703) );
  OAI21X4TS U1273 ( .A0(n1128), .A1(net27486), .B0(n1722), .Y(n2364) );
  AOI22X4TS U1274 ( .A0(n1511), .A1(n1379), .B0(n1723), .B1(d_ff_Xn[10]), .Y(
        n1128) );
  INVX6TS U1275 ( .A(n1717), .Y(n1129) );
  OAI2BB1X4TS U1276 ( .A0N(n1371), .A1N(n1511), .B0(n1129), .Y(n1536) );
  INVX16TS U1277 ( .A(n1104), .Y(net37108) );
  OAI21X4TS U1278 ( .A0(net34745), .A1(n2057), .B0(n1563), .Y(n695) );
  INVX16TS U1279 ( .A(net35843), .Y(net35844) );
  NAND2X8TS U1280 ( .A(n1525), .B(net35368), .Y(n1524) );
  AND2X4TS U1281 ( .A(net37196), .B(n1816), .Y(n1435) );
  NAND2BX4TS U1282 ( .AN(n1105), .B(n1814), .Y(n1676) );
  BUFX6TS U1283 ( .A(net35729), .Y(n1130) );
  NAND3BX4TS U1284 ( .AN(n1409), .B(net34771), .C(n1131), .Y(n2335) );
  OAI21X4TS U1285 ( .A0(net34745), .A1(n2061), .B0(n1685), .Y(n667) );
  AND3X6TS U1286 ( .A(n1106), .B(net34533), .C(net36990), .Y(net34833) );
  NOR2BX2TS U1287 ( .AN(d_ff_Xn[22]), .B(n1355), .Y(n1833) );
  OAI21X2TS U1288 ( .A0(net34745), .A1(net36258), .B0(n1650), .Y(n721) );
  BUFX20TS U1289 ( .A(net36058), .Y(net35372) );
  OAI2BB1X4TS U1290 ( .A0N(n1534), .A1N(net35039), .B0(n1599), .Y(n2350) );
  MXI2X4TS U1291 ( .A(n1410), .B(n2077), .S0(net35596), .Y(n726) );
  NAND4X8TS U1292 ( .A(net35323), .B(net36122), .C(net36617), .D(net35054), 
        .Y(net35324) );
  NAND2X8TS U1293 ( .A(n1548), .B(net36997), .Y(net35006) );
  BUFX16TS U1294 ( .A(net27489), .Y(n1175) );
  INVX6TS U1295 ( .A(n1152), .Y(net36400) );
  BUFX20TS U1296 ( .A(n1159), .Y(n1222) );
  NAND2BX4TS U1297 ( .AN(n1441), .B(n1132), .Y(n2337) );
  AOI21X4TS U1298 ( .A0(n1805), .A1(net35368), .B0(n1293), .Y(n1132) );
  NAND2X8TS U1299 ( .A(n1135), .B(net35596), .Y(n1762) );
  NAND2X4TS U1300 ( .A(n1761), .B(n1405), .Y(n1135) );
  BUFX16TS U1301 ( .A(n1790), .Y(n1794) );
  NAND2X4TS U1302 ( .A(net35372), .B(net34567), .Y(n1225) );
  OAI21X4TS U1303 ( .A0(n1167), .A1(n2073), .B0(n1569), .Y(n757) );
  NAND2X6TS U1304 ( .A(net34265), .B(d_ff3_sh_x_out[24]), .Y(n1845) );
  NAND3X4TS U1305 ( .A(n1885), .B(n1914), .C(n1694), .Y(n812) );
  AOI21X4TS U1306 ( .A0(n1511), .A1(n1363), .B0(n1518), .Y(n1517) );
  OAI21X4TS U1307 ( .A0(net34843), .A1(n2081), .B0(n1689), .Y(n755) );
  INVX6TS U1308 ( .A(n1723), .Y(n1308) );
  NAND2X8TS U1309 ( .A(n1958), .B(n1701), .Y(n1704) );
  NAND2X4TS U1310 ( .A(n1915), .B(n1844), .Y(n1846) );
  OAI21X4TS U1311 ( .A0(n1138), .A1(net35705), .B0(n1137), .Y(n646) );
  NAND2BX2TS U1312 ( .AN(n2069), .B(net35705), .Y(n1137) );
  XOR2X4TS U1313 ( .A(n1305), .B(n1957), .Y(n1138) );
  BUFX20TS U1314 ( .A(net27561), .Y(net37160) );
  OAI21X4TS U1315 ( .A0(n1148), .A1(n1520), .B0(n1519), .Y(n2367) );
  OAI21X2TS U1316 ( .A0(n1130), .A1(net34237), .B0(n1523), .Y(n813) );
  INVX12TS U1317 ( .A(net35846), .Y(n1152) );
  BUFX16TS U1318 ( .A(n1489), .Y(n1141) );
  NAND2X8TS U1319 ( .A(n1849), .B(n1848), .Y(n1220) );
  NAND3X2TS U1320 ( .A(n1142), .B(n2020), .C(net34260), .Y(n1570) );
  NAND3X8TS U1321 ( .A(n1142), .B(n2020), .C(n1571), .Y(n1268) );
  OAI21X4TS U1322 ( .A0(n1327), .A1(n2019), .B0(n1142), .Y(n1503) );
  AND2X4TS U1323 ( .A(n2021), .B(n1142), .Y(n1334) );
  NAND2X8TS U1324 ( .A(n1188), .B(n1322), .Y(n1142) );
  NOR3BX4TS U1325 ( .AN(n1145), .B(d_ff2_Y[29]), .C(d_ff2_Y[28]), .Y(n1143) );
  INVX12TS U1326 ( .A(n1267), .Y(n1349) );
  AOI21X4TS U1327 ( .A0(n1144), .A1(n1127), .B0(n1778), .Y(n2311) );
  NAND2X4TS U1328 ( .A(n1175), .B(data_output[10]), .Y(n1722) );
  NOR2X6TS U1329 ( .A(n1511), .B(n2121), .Y(n1717) );
  BUFX20TS U1330 ( .A(net34856), .Y(n1168) );
  OR2X2TS U1331 ( .A(net34489), .B(n2229), .Y(n1674) );
  OAI2BB1X4TS U1332 ( .A0N(d_ff2_X[21]), .A1N(net34898), .B0(n1593), .Y(n661)
         );
  BUFX20TS U1333 ( .A(net34901), .Y(net34875) );
  NAND2BX2TS U1334 ( .AN(net34453), .B(n1421), .Y(n1652) );
  NAND2X8TS U1335 ( .A(n1152), .B(net35427), .Y(net35428) );
  INVX16TS U1336 ( .A(net35813), .Y(net35427) );
  INVX16TS U1337 ( .A(n1146), .Y(n1147) );
  BUFX20TS U1338 ( .A(n1175), .Y(n1148) );
  NAND2X8TS U1339 ( .A(net35017), .B(n1139), .Y(n2012) );
  AND2X8TS U1340 ( .A(n1184), .B(net35383), .Y(n1153) );
  INVX12TS U1341 ( .A(n1154), .Y(n1548) );
  NAND2X8TS U1342 ( .A(net37107), .B(n1157), .Y(n1156) );
  NOR2X8TS U1343 ( .A(net35508), .B(net36296), .Y(n1157) );
  NAND2X8TS U1344 ( .A(net34740), .B(net37029), .Y(net37107) );
  NOR2X8TS U1345 ( .A(net37547), .B(n1156), .Y(n1155) );
  NOR2X8TS U1346 ( .A(net35733), .B(net36152), .Y(net37029) );
  NOR2X8TS U1347 ( .A(n1117), .B(net35729), .Y(net34740) );
  NAND2X8TS U1348 ( .A(n1173), .B(net36997), .Y(net37547) );
  NOR2X8TS U1349 ( .A(net36293), .B(inst_CORDIC_FSM_v3_state_reg_0_), .Y(
        net35003) );
  OAI21X4TS U1350 ( .A0(n1547), .A1(n1546), .B0(n1545), .Y(
        inst_CORDIC_FSM_v3_state_next[0]) );
  INVX12TS U1351 ( .A(net34901), .Y(net34843) );
  NAND2BX4TS U1352 ( .AN(net37058), .B(net35303), .Y(n1161) );
  NAND2BX4TS U1353 ( .AN(n1163), .B(d_ff1_Z[5]), .Y(n1162) );
  INVX12TS U1354 ( .A(net34901), .Y(net34772) );
  NAND3X4TS U1355 ( .A(net34782), .B(n1225), .C(net34781), .Y(net23562) );
  NOR2X8TS U1356 ( .A(net35843), .B(net35923), .Y(net34832) );
  INVX16TS U1357 ( .A(n1174), .Y(n1177) );
  OAI21X4TS U1358 ( .A0(n1179), .A1(n1177), .B0(n1178), .Y(n2370) );
  NAND2X8TS U1359 ( .A(n1177), .B(data_output[4]), .Y(n1178) );
  NOR2X2TS U1360 ( .A(n1300), .B(n1384), .Y(n1180) );
  INVX12TS U1361 ( .A(n1790), .Y(n1300) );
  INVX12TS U1362 ( .A(net37160), .Y(net36503) );
  NAND2BX4TS U1363 ( .AN(n1729), .B(net35039), .Y(n1183) );
  NAND2X8TS U1364 ( .A(net35427), .B(net35476), .Y(net35501) );
  INVX12TS U1365 ( .A(net35923), .Y(net35476) );
  NOR2X2TS U1366 ( .A(n1273), .B(n1823), .Y(inst_CORDIC_FSM_v3_state_next[1])
         );
  NOR2X8TS U1367 ( .A(n1185), .B(net36400), .Y(n1184) );
  INVX16TS U1368 ( .A(net35717), .Y(net35718) );
  BUFX16TS U1369 ( .A(net35729), .Y(n1188) );
  INVX12TS U1370 ( .A(net35729), .Y(net36274) );
  NAND2X4TS U1371 ( .A(net35373), .B(d_ff_Yn[18]), .Y(n1564) );
  INVX2TS U1372 ( .A(n1190), .Y(n1191) );
  NAND4X4TS U1373 ( .A(n1859), .B(n1862), .C(n1860), .D(n1861), .Y(n2312) );
  MXI2X2TS U1374 ( .A(n2201), .B(n2200), .S0(n1193), .Y(n1817) );
  MXI2X4TS U1375 ( .A(n2181), .B(n2180), .S0(n2179), .Y(n1815) );
  INVX2TS U1376 ( .A(n1814), .Y(n1194) );
  INVX2TS U1377 ( .A(n1812), .Y(n1195) );
  INVX2TS U1378 ( .A(n1811), .Y(n1196) );
  INVX2TS U1379 ( .A(n1809), .Y(n1197) );
  MXI2X2TS U1380 ( .A(n2148), .B(n2147), .S0(n2146), .Y(n1810) );
  CLKAND2X2TS U1381 ( .A(net35368), .B(n1810), .Y(n1434) );
  INVX2TS U1382 ( .A(n1810), .Y(n2282) );
  INVX2TS U1383 ( .A(n1808), .Y(n1198) );
  INVX2TS U1384 ( .A(n1818), .Y(n1199) );
  MXI2X2TS U1385 ( .A(n2154), .B(n2153), .S0(n2152), .Y(n1818) );
  INVX2TS U1386 ( .A(net34567), .Y(net26474) );
  INVX2TS U1387 ( .A(n1820), .Y(n1200) );
  MXI2X2TS U1388 ( .A(n2204), .B(n2203), .S0(n2202), .Y(n1820) );
  INVX2TS U1389 ( .A(n1815), .Y(n1201) );
  INVX2TS U1390 ( .A(n1806), .Y(n1202) );
  INVX2TS U1391 ( .A(n1805), .Y(n1203) );
  INVX2TS U1392 ( .A(n1802), .Y(n1204) );
  MXI2X2TS U1393 ( .A(n2187), .B(n2186), .S0(n2185), .Y(n1816) );
  INVX2TS U1394 ( .A(n1816), .Y(n2288) );
  INVX2TS U1395 ( .A(n1839), .Y(n1205) );
  MXI2X2TS U1396 ( .A(n2193), .B(n2192), .S0(n2191), .Y(n1839) );
  MXI2X2TS U1397 ( .A(n2199), .B(n2198), .S0(n2197), .Y(n1813) );
  CLKAND2X2TS U1398 ( .A(net35368), .B(n1813), .Y(n1437) );
  INVX2TS U1399 ( .A(n1813), .Y(n2292) );
  INVX2TS U1400 ( .A(n1821), .Y(n1206) );
  MXI2X2TS U1401 ( .A(n2210), .B(n2209), .S0(n2208), .Y(n1821) );
  INVX2TS U1402 ( .A(n1822), .Y(n1207) );
  MXI2X2TS U1403 ( .A(n2220), .B(n2219), .S0(n2218), .Y(n1822) );
  MXI2X2TS U1404 ( .A(net27998), .B(net27999), .S0(net28000), .Y(net34546) );
  MX2X4TS U1405 ( .A(n2207), .B(n2206), .S0(n2205), .Y(n1256) );
  MXI2X4TS U1406 ( .A(n2190), .B(n2189), .S0(n2188), .Y(n1834) );
  MX2X4TS U1407 ( .A(n2166), .B(n2165), .S0(n2164), .Y(net37058) );
  MXI2X2TS U1408 ( .A(n2160), .B(n2159), .S0(n2158), .Y(n1804) );
  INVX2TS U1409 ( .A(n1803), .Y(n1208) );
  INVX2TS U1410 ( .A(n1819), .Y(n1209) );
  INVX2TS U1411 ( .A(n1804), .Y(n1210) );
  INVX2TS U1412 ( .A(n1807), .Y(n1211) );
  INVX2TS U1413 ( .A(n1834), .Y(n1212) );
  INVX2TS U1414 ( .A(net34546), .Y(net26466) );
  OAI21X2TS U1415 ( .A0(n2012), .A1(n1425), .B0(net35684), .Y(
        inst_CORDIC_FSM_v3_state_next[4]) );
  NOR2X8TS U1416 ( .A(net37099), .B(net36998), .Y(n1216) );
  NOR3X4TS U1417 ( .A(net35501), .B(net36282), .C(net35832), .Y(net35017) );
  NOR2X8TS U1418 ( .A(net35831), .B(net35927), .Y(net34830) );
  INVX16TS U1419 ( .A(net37583), .Y(net34495) );
  INVX8TS U1420 ( .A(net37583), .Y(net36779) );
  BUFX20TS U1421 ( .A(net37583), .Y(net35492) );
  BUFX20TS U1422 ( .A(net34983), .Y(net37583) );
  AND2X4TS U1423 ( .A(net36274), .B(n1321), .Y(n1326) );
  NOR2X4TS U1424 ( .A(net36493), .B(d_ff2_X[25]), .Y(n1577) );
  BUFX20TS U1425 ( .A(n1159), .Y(n1221) );
  INVX16TS U1426 ( .A(net34875), .Y(net34540) );
  OR2X4TS U1427 ( .A(net34453), .B(n1414), .Y(n1600) );
  BUFX20TS U1428 ( .A(net34832), .Y(n1223) );
  NAND3X4TS U1429 ( .A(n1622), .B(n1621), .C(n1620), .Y(n2340) );
  NAND2BX2TS U1430 ( .AN(net35334), .B(n1422), .Y(n1661) );
  INVX16TS U1431 ( .A(n1160), .Y(net35303) );
  OA22X4TS U1432 ( .A0(net35336), .A1(net36489), .B0(n1160), .B1(net36143), 
        .Y(net35873) );
  NAND4X8TS U1433 ( .A(net35004), .B(n1223), .C(net34831), .D(net34830), .Y(
        n1224) );
  INVX16TS U1434 ( .A(n1224), .Y(net34983) );
  BUFX20TS U1435 ( .A(n1331), .Y(n1252) );
  INVX8TS U1436 ( .A(n1566), .Y(n1643) );
  INVX2TS U1437 ( .A(n1309), .Y(n1681) );
  AOI2BB2X1TS U1438 ( .B0(n2004), .B1(n1466), .A0N(n2070), .A1N(n1439), .Y(
        n1993) );
  AOI22X1TS U1439 ( .A0(n2004), .A1(d_ff3_LUT_out[26]), .B0(n1996), .B1(
        d_ff3_sh_x_out[26]), .Y(n1507) );
  INVX2TS U1440 ( .A(n1314), .Y(n1315) );
  NAND2X2TS U1441 ( .A(net27486), .B(data_output[25]), .Y(n1599) );
  INVX2TS U1442 ( .A(n1364), .Y(n1365) );
  NAND2X6TS U1443 ( .A(n1636), .B(n1842), .Y(n1582) );
  NAND3X6TS U1444 ( .A(n1766), .B(n1767), .C(n1586), .Y(n1589) );
  NAND2X2TS U1445 ( .A(n1636), .B(n1842), .Y(n1311) );
  NAND3X2TS U1446 ( .A(n2012), .B(n1837), .C(n1784), .Y(n1786) );
  INVX2TS U1447 ( .A(d_ff3_sh_x_out[12]), .Y(n1459) );
  NAND3X4TS U1448 ( .A(net35492), .B(net36493), .C(net34460), .Y(n1860) );
  INVX2TS U1449 ( .A(n2058), .Y(n1487) );
  INVX2TS U1450 ( .A(net28420), .Y(net35498) );
  AOI22X2TS U1451 ( .A0(n1779), .A1(d_ff_Xn[13]), .B0(n1794), .B1(n1372), .Y(
        n1781) );
  NAND2X4TS U1452 ( .A(n1498), .B(n1496), .Y(n805) );
  NOR2X2TS U1453 ( .A(n1737), .B(net37160), .Y(n1497) );
  NAND2X2TS U1454 ( .A(net34395), .B(n1295), .Y(n1881) );
  INVX2TS U1455 ( .A(n2086), .Y(n1250) );
  INVX2TS U1456 ( .A(net36257), .Y(net36258) );
  NAND2X2TS U1457 ( .A(net35575), .B(n1399), .Y(n1650) );
  MXI2X2TS U1458 ( .A(n2038), .B(n2274), .S0(n1346), .Y(n883) );
  INVX2TS U1459 ( .A(n1366), .Y(n1367) );
  INVX2TS U1460 ( .A(n1369), .Y(n1370) );
  INVX2TS U1461 ( .A(n1377), .Y(n1378) );
  INVX2TS U1462 ( .A(n1381), .Y(n1382) );
  INVX2TS U1463 ( .A(n1379), .Y(n1380) );
  INVX2TS U1464 ( .A(n1388), .Y(n1389) );
  INVX2TS U1465 ( .A(n1350), .Y(n1351) );
  INVX2TS U1466 ( .A(n1392), .Y(n1393) );
  INVX2TS U1467 ( .A(n1395), .Y(n1396) );
  INVX2TS U1468 ( .A(net35976), .Y(net35977) );
  INVX2TS U1469 ( .A(n1397), .Y(n1398) );
  INVX2TS U1470 ( .A(n1401), .Y(n1402) );
  INVX2TS U1471 ( .A(n1403), .Y(n1404) );
  AOI2BB2X2TS U1472 ( .B0(n2055), .B1(net37108), .A0N(net34538), .A1N(n1405), 
        .Y(n651) );
  XNOR2X2TS U1473 ( .A(n2017), .B(net34260), .Y(n1412) );
  NAND2X2TS U1474 ( .A(net35575), .B(n1820), .Y(n1660) );
  NAND2X2TS U1475 ( .A(net35575), .B(n1819), .Y(n1670) );
  NAND2X2TS U1476 ( .A(net35665), .B(n1265), .Y(n1501) );
  INVX2TS U1477 ( .A(n2133), .Y(n1249) );
  BUFX3TS U1478 ( .A(n1446), .Y(n2254) );
  CLKINVX3TS U1479 ( .A(rst), .Y(n1464) );
  CLKBUFX3TS U1480 ( .A(n2376), .Y(n1801) );
  INVX3TS U1481 ( .A(n1449), .Y(n1446) );
  CLKINVX3TS U1482 ( .A(rst), .Y(n1457) );
  NAND2X2TS U1483 ( .A(net35705), .B(d_ff3_LUT_out[15]), .Y(n1911) );
  BUFX3TS U1484 ( .A(n1444), .Y(n2255) );
  CLKINVX3TS U1485 ( .A(n1449), .Y(n1455) );
  BUFX3TS U1486 ( .A(n1801), .Y(n2240) );
  BUFX3TS U1487 ( .A(n1451), .Y(n2258) );
  BUFX20TS U1488 ( .A(net34901), .Y(net34856) );
  BUFX20TS U1489 ( .A(net34959), .Y(net34901) );
  NAND4X8TS U1490 ( .A(n1223), .B(net35341), .C(net34830), .D(net35003), .Y(
        net34959) );
  NAND3X2TS U1491 ( .A(net34489), .B(d_ff1_Z[19]), .C(net37190), .Y(net34781)
         );
  INVX8TS U1492 ( .A(net35335), .Y(net37190) );
  NAND3X4TS U1493 ( .A(net35334), .B(d_ff1_Z[24]), .C(net37190), .Y(net34486)
         );
  INVX12TS U1494 ( .A(net37107), .Y(net35106) );
  BUFX20TS U1495 ( .A(net36058), .Y(net35368) );
  NOR2X8TS U1496 ( .A(net37547), .B(net37548), .Y(net37546) );
  OR2X8TS U1497 ( .A(net36296), .B(net35508), .Y(net37548) );
  NAND2BX1TS U1498 ( .AN(net35356), .B(d_ff1_Z[27]), .Y(net35336) );
  NAND2X6TS U1499 ( .A(net35844), .B(net35718), .Y(net36296) );
  CLKBUFX3TS U1500 ( .A(net37029), .Y(net35421) );
  OR2X4TS U1501 ( .A(net36257), .B(net27561), .Y(net34260) );
  INVX16TS U1502 ( .A(net35733), .Y(net34460) );
  NAND3X2TS U1503 ( .A(net34449), .B(d_ff1_Z[20]), .C(n1079), .Y(net34778) );
  OR2X2TS U1504 ( .A(net34449), .B(net27858), .Y(net34779) );
  OAI2BB1X4TS U1505 ( .A0N(n1219), .A1N(n1218), .B0(n1217), .Y(data_output[24]) );
  BUFX20TS U1506 ( .A(net27489), .Y(net35581) );
  INVX16TS U1507 ( .A(net35392), .Y(net27489) );
  NAND2X8TS U1508 ( .A(net35324), .B(net36594), .Y(net35392) );
  OR2X8TS U1509 ( .A(net35006), .B(net35328), .Y(net36594) );
  INVX16TS U1510 ( .A(net35309), .Y(net36617) );
  INVX16TS U1511 ( .A(net35428), .Y(net34831) );
  AND2X6TS U1512 ( .A(n1229), .B(n1120), .Y(net36122) );
  INVX16TS U1513 ( .A(net34914), .Y(net34251) );
  OAI2BB1X4TS U1514 ( .A0N(net34987), .A1N(d_ff2_X[11]), .B0(n1230), .Y(n681)
         );
  NAND2X4TS U1515 ( .A(net35303), .B(net35976), .Y(net34887) );
  INVX16TS U1516 ( .A(n1160), .Y(net36390) );
  BUFX20TS U1517 ( .A(net37201), .Y(net35371) );
  OR2X8TS U1518 ( .A(net35306), .B(n2121), .Y(n1572) );
  INVX16TS U1519 ( .A(net35027), .Y(net36302) );
  CLKINVX12TS U1520 ( .A(n1105), .Y(net37196) );
  OR2X8TS U1521 ( .A(net35306), .B(n1386), .Y(n1573) );
  NAND3X4TS U1522 ( .A(n1624), .B(n1623), .C(n1625), .Y(n2336) );
  CLKINVX12TS U1523 ( .A(net35393), .Y(net37627) );
  INVX16TS U1524 ( .A(net34237), .Y(net36827) );
  MXI2X4TS U1525 ( .A(n1272), .B(n1271), .S0(net36827), .Y(n696) );
  MXI2X4TS U1526 ( .A(n1253), .B(n1442), .S0(net36827), .Y(n668) );
  BUFX20TS U1527 ( .A(net34983), .Y(net34982) );
  OR2X8TS U1528 ( .A(net35306), .B(n2123), .Y(n1262) );
  NAND2X4TS U1529 ( .A(n1873), .B(n1919), .Y(n814) );
  MXI2X4TS U1530 ( .A(n1871), .B(d_ff3_LUT_out[7]), .S0(net34395), .Y(n1873)
         );
  BUFX16TS U1531 ( .A(net27489), .Y(net27486) );
  AOI2BB2X1TS U1532 ( .B0(n2053), .B1(net35371), .A0N(net34538), .A1N(n1297), 
        .Y(n653) );
  MXI2X4TS U1533 ( .A(n1481), .B(n1918), .S0(net35596), .Y(n1920) );
  INVX16TS U1534 ( .A(net34237), .Y(net35596) );
  OR2X4TS U1535 ( .A(net35306), .B(n1075), .Y(n1231) );
  NAND2X4TS U1536 ( .A(n1528), .B(net34843), .Y(n1527) );
  INVX2TS U1537 ( .A(n1232), .Y(n1233) );
  OAI21X2TS U1538 ( .A0(n1341), .A1(net34745), .B0(n1648), .Y(n720) );
  OAI21X2TS U1539 ( .A0(net34745), .A1(n1361), .B0(n1721), .Y(n657) );
  NAND2X2TS U1540 ( .A(n1177), .B(data_output[13]), .Y(n1780) );
  NOR2X8TS U1541 ( .A(n1905), .B(n1837), .Y(n1234) );
  INVX12TS U1542 ( .A(n1234), .Y(n1995) );
  INVX8TS U1543 ( .A(n1905), .Y(n1966) );
  INVX2TS U1544 ( .A(n1235), .Y(n1236) );
  OR2X8TS U1545 ( .A(net35306), .B(n1256), .Y(n1614) );
  OR2X8TS U1546 ( .A(net35306), .B(n2122), .Y(n1628) );
  OR2X8TS U1547 ( .A(net35306), .B(n2119), .Y(n1629) );
  OR2X8TS U1548 ( .A(net35306), .B(n1376), .Y(n1549) );
  NAND2X4TS U1549 ( .A(net35299), .B(n1815), .Y(n1673) );
  OAI21X2TS U1550 ( .A0(n1215), .A1(n1214), .B0(n1213), .Y(data_output[23]) );
  CLKAND2X2TS U1551 ( .A(net35368), .B(n1818), .Y(n1436) );
  NAND2X6TS U1552 ( .A(net37108), .B(n1395), .Y(n1649) );
  NAND2X4TS U1553 ( .A(net37108), .B(n1822), .Y(n1654) );
  NAND3X6TS U1554 ( .A(n1635), .B(n1634), .C(n1633), .Y(n2314) );
  NAND2X4TS U1555 ( .A(net36302), .B(data_output[14]), .Y(n1724) );
  INVX2TS U1556 ( .A(n1241), .Y(n1242) );
  INVX2TS U1557 ( .A(n1243), .Y(n1244) );
  OAI21X4TS U1558 ( .A0(net34745), .A1(n2084), .B0(n1686), .Y(n747) );
  INVX16TS U1559 ( .A(net36545), .Y(net34745) );
  AO21X4TS U1560 ( .A0(net35368), .A1(n1804), .B0(n1245), .Y(n1557) );
  OAI21X4TS U1561 ( .A0(net36422), .A1(n2074), .B0(n1688), .Y(n749) );
  NAND2X4TS U1562 ( .A(net36390), .B(d_ff_Yn[12]), .Y(n1865) );
  AOI2BB2X2TS U1563 ( .B0(net36390), .B1(n2052), .A0N(n1317), .A1N(net35334), 
        .Y(n654) );
  AOI2BB2X2TS U1564 ( .B0(net36390), .B1(n2054), .A0N(n1294), .A1N(net34538), 
        .Y(n652) );
  NAND2X2TS U1565 ( .A(net36390), .B(d_ff_Yn[26]), .Y(n1863) );
  AOI22X2TS U1566 ( .A0(net36390), .A1(n2047), .B0(n1442), .B1(net34898), .Y(
        n669) );
  AOI2BB2X2TS U1567 ( .B0(net36390), .B1(n2041), .A0N(d_ff2_X[6]), .A1N(
        net34540), .Y(n691) );
  AOI2BB2X2TS U1568 ( .B0(net36390), .B1(n2040), .A0N(d_ff2_X[5]), .A1N(
        net34540), .Y(n693) );
  NAND2X4TS U1569 ( .A(net36390), .B(n1401), .Y(n1864) );
  NAND2X4TS U1570 ( .A(n1558), .B(net35873), .Y(n2318) );
  NAND2X2TS U1571 ( .A(net35652), .B(d_ff_Xn[23]), .Y(n1721) );
  OR3X4TS U1572 ( .A(net36991), .B(n2116), .C(net35335), .Y(n1634) );
  OAI2BB1X4TS U1573 ( .A0N(n1168), .A1N(d_ff2_X[15]), .B0(n1262), .Y(n673) );
  INVX8TS U1574 ( .A(n2032), .Y(n2003) );
  INVX16TS U1575 ( .A(n2032), .Y(n1908) );
  OAI2BB1X4TS U1576 ( .A0N(net34987), .A1N(n1550), .B0(n1549), .Y(n761) );
  AOI2BB2X2TS U1577 ( .B0(net35652), .B1(n2049), .A0N(d_ff2_X[20]), .A1N(
        net34540), .Y(n663) );
  AOI2BB2X2TS U1578 ( .B0(n2042), .B1(net35652), .A0N(net34538), .A1N(
        d_ff2_X[7]), .Y(n689) );
  NAND2X2TS U1579 ( .A(net35371), .B(n1366), .Y(n1651) );
  NAND2X4TS U1580 ( .A(net35371), .B(n1362), .Y(n1556) );
  NAND2X4TS U1581 ( .A(net35371), .B(n1371), .Y(n1555) );
  AOI2BB2X2TS U1582 ( .B0(net35371), .B1(n2044), .A0N(d_ff2_X[12]), .A1N(
        net34538), .Y(n679) );
  OAI2BB1X4TS U1583 ( .A0N(net34987), .A1N(n1250), .B0(n1865), .Y(n743) );
  OAI2BB1X4TS U1584 ( .A0N(net34987), .A1N(d_ff2_X[8]), .B0(n1572), .Y(n687)
         );
  OAI21X4TS U1585 ( .A0(net34449), .A1(n2080), .B0(n1561), .Y(n759) );
  OA22X2TS U1586 ( .A0(net35306), .A1(d_ff_Xn[24]), .B0(n1302), .B1(net34538), 
        .Y(n656) );
  OAI21X4TS U1587 ( .A0(net36422), .A1(n2083), .B0(n1555), .Y(n751) );
  CLKBUFX3TS U1588 ( .A(n1801), .Y(n2257) );
  INVX6TS U1589 ( .A(n2027), .Y(n1884) );
  CLKBUFX3TS U1590 ( .A(n1450), .Y(n2261) );
  INVX2TS U1591 ( .A(n2238), .Y(n1449) );
  INVX2TS U1592 ( .A(net34260), .Y(net34742) );
  CLKMX2X2TS U1593 ( .A(data_in[23]), .B(d_ff1_Z[23]), .S0(n1489), .Y(n1257)
         );
  XOR2X1TS U1594 ( .A(n2033), .B(net36493), .Y(n1258) );
  NOR2X2TS U1595 ( .A(n1760), .B(n1406), .Y(n1259) );
  INVX2TS U1596 ( .A(n1278), .Y(n1424) );
  BUFX6TS U1597 ( .A(n1423), .Y(n1278) );
  NOR2X4TS U1598 ( .A(n1765), .B(n1764), .Y(n1261) );
  INVX2TS U1599 ( .A(n1522), .Y(n1828) );
  CLKINVX3TS U1600 ( .A(rst), .Y(n2376) );
  CLKINVX3TS U1601 ( .A(rst), .Y(n1456) );
  INVX2TS U1602 ( .A(rst), .Y(n1458) );
  CLKINVX3TS U1603 ( .A(rst), .Y(n1445) );
  CLKINVX3TS U1604 ( .A(n1449), .Y(n1444) );
  INVX2TS U1605 ( .A(n1449), .Y(n1452) );
  INVX2TS U1606 ( .A(n1449), .Y(n1450) );
  CLKBUFX2TS U1607 ( .A(n1800), .Y(n2238) );
  INVX2TS U1608 ( .A(rst), .Y(n1448) );
  INVX2TS U1609 ( .A(rst), .Y(n1447) );
  NOR2X8TS U1610 ( .A(net36998), .B(n1185), .Y(net35015) );
  NAND2X2TS U1611 ( .A(net36997), .B(net34732), .Y(n1521) );
  NOR2X8TS U1612 ( .A(n1080), .B(net36548), .Y(net35054) );
  OAI21X2TS U1613 ( .A0(n1731), .A1(n1148), .B0(n1730), .Y(n2365) );
  INVX2TS U1614 ( .A(n1349), .Y(n1359) );
  NOR2X8TS U1615 ( .A(n1495), .B(n1268), .Y(n1267) );
  MX2X4TS U1616 ( .A(d_ff3_sh_y_out[18]), .B(d_ff2_Y[18]), .S0(net35492), .Y(
        n730) );
  NAND3X4TS U1617 ( .A(n1917), .B(n1882), .C(n1881), .Y(n811) );
  MXI2X4TS U1618 ( .A(n2064), .B(n1270), .S0(net36779), .Y(n640) );
  NAND2X4TS U1619 ( .A(n1275), .B(n1737), .Y(n1498) );
  NOR2X2TS U1620 ( .A(net36827), .B(d_ff3_sh_y_out[30]), .Y(n1778) );
  NAND2X4TS U1621 ( .A(n1119), .B(n1114), .Y(n1273) );
  AND2X4TS U1622 ( .A(n1297), .B(net37583), .Y(n1274) );
  AND2X4TS U1623 ( .A(n1872), .B(net34732), .Y(n1693) );
  AND2X8TS U1624 ( .A(net37583), .B(net37160), .Y(n1275) );
  NAND2X4TS U1625 ( .A(net35373), .B(n1808), .Y(n1657) );
  XNOR2X4TS U1626 ( .A(n1683), .B(n1364), .Y(n1279) );
  XOR2X2TS U1627 ( .A(n1682), .B(d_ff_Xn[31]), .Y(n1280) );
  NOR2X4TS U1628 ( .A(n1740), .B(n1514), .Y(n1742) );
  INVX2TS U1629 ( .A(n1282), .Y(n1283) );
  INVX2TS U1630 ( .A(n1284), .Y(n1285) );
  NOR2X4TS U1631 ( .A(net36998), .B(net37099), .Y(n1286) );
  OR2X2TS U1632 ( .A(n1136), .B(net35328), .Y(n1288) );
  INVX16TS U1633 ( .A(net34901), .Y(net34489) );
  AND2X8TS U1634 ( .A(net34460), .B(n1340), .Y(n2019) );
  NAND2X4TS U1635 ( .A(net35373), .B(n1809), .Y(n1625) );
  BUFX20TS U1636 ( .A(net37201), .Y(net35652) );
  NOR3X4TS U1637 ( .A(net34856), .B(n2105), .C(net35335), .Y(n1409) );
  NAND3X4TS U1638 ( .A(n1167), .B(d_ff1_Z[17]), .C(net36078), .Y(n1613) );
  OAI2BB1X4TS U1639 ( .A0N(net34987), .A1N(d_ff2_X[0]), .B0(n1629), .Y(n703)
         );
  NAND2X6TS U1640 ( .A(n1701), .B(n1583), .Y(n1767) );
  NAND2X4TS U1641 ( .A(n1511), .B(n1394), .Y(n1513) );
  NOR2X6TS U1642 ( .A(n2047), .B(n1794), .Y(n1747) );
  OAI2BB1X4TS U1643 ( .A0N(n1289), .A1N(net36827), .B0(n1501), .Y(n710) );
  XNOR2X4TS U1644 ( .A(n1264), .B(n1502), .Y(n1289) );
  OAI2BB1X4TS U1645 ( .A0N(n1275), .A1N(n1360), .B0(n1553), .Y(n649) );
  NOR2X2TS U1646 ( .A(net35334), .B(n1407), .Y(n1292) );
  NAND2X8TS U1647 ( .A(n1508), .B(n1286), .Y(n1825) );
  NOR2X2TS U1648 ( .A(n2228), .B(net34489), .Y(n1293) );
  OAI21X4TS U1649 ( .A0(n1720), .A1(net27486), .B0(n1719), .Y(n2347) );
  BUFX20TS U1650 ( .A(n1300), .Y(n1299) );
  AOI2BB2X4TS U1651 ( .B0(net36390), .B1(n2038), .A0N(d_ff2_X[2]), .A1N(
        net34540), .Y(n699) );
  MX2X4TS U1652 ( .A(d_ff2_Y[5]), .B(d_ff3_sh_y_out[5]), .S0(net34237), .Y(
        n756) );
  NAND3X4TS U1653 ( .A(net35334), .B(d_ff1_Z[22]), .C(net36078), .Y(n1672) );
  NOR2X4TS U1654 ( .A(d_ff2_Y[28]), .B(n1314), .Y(n1490) );
  OAI21X4TS U1655 ( .A0(net36422), .A1(n1233), .B0(n1864), .Y(n765) );
  OAI2BB1X4TS U1656 ( .A0N(net34987), .A1N(d_ff2_X[9]), .B0(n1628), .Y(n685)
         );
  INVX12TS U1657 ( .A(n1510), .Y(n1790) );
  NAND3X4TS U1658 ( .A(n1711), .B(n1913), .C(n1710), .Y(n820) );
  NAND2X4TS U1659 ( .A(n1879), .B(n1871), .Y(n1711) );
  INVX16TS U1660 ( .A(net36991), .Y(net36422) );
  AOI2BB2X4TS U1661 ( .B0(d_ff_Xn[23]), .B1(n1110), .A0N(n1779), .A1N(n1400), 
        .Y(n1753) );
  AO22X4TS U1662 ( .A0(n1509), .A1(n1366), .B0(d_ff_Xn[27]), .B1(n1300), .Y(
        n1301) );
  INVX16TS U1663 ( .A(net34856), .Y(net34538) );
  NAND2X6TS U1664 ( .A(n1579), .B(n1578), .Y(n1305) );
  AND2X8TS U1665 ( .A(n1695), .B(n1119), .Y(n1328) );
  AOI21X4TS U1666 ( .A0(n1305), .A1(n1259), .B0(n1762), .Y(n1768) );
  NAND3X2TS U1667 ( .A(net34772), .B(d_ff1_Z[7]), .C(net36078), .Y(n1624) );
  NAND2X4TS U1668 ( .A(n1503), .B(n1570), .Y(n1502) );
  BUFX20TS U1669 ( .A(n1516), .Y(n1511) );
  INVX2TS U1670 ( .A(n1319), .Y(n1320) );
  NAND2X4TS U1671 ( .A(n1703), .B(n1704), .Y(n1707) );
  MXI2X4TS U1672 ( .A(n1285), .B(n1323), .S0(n1127), .Y(n709) );
  OAI2BB1X4TS U1673 ( .A0N(n1535), .A1N(net35039), .B0(n1539), .Y(n2345) );
  AO22X4TS U1674 ( .A0(n1356), .A1(d_ff_Xn[3]), .B0(n1516), .B1(n1375), .Y(
        n1325) );
  AND2X8TS U1675 ( .A(n1692), .B(n1691), .Y(n1695) );
  OAI2BB1X4TS U1676 ( .A0N(net35039), .A1N(n1329), .B0(n1734), .Y(n2373) );
  AO22X4TS U1677 ( .A0(n1779), .A1(d_ff_Xn[1]), .B0(n1511), .B1(n1401), .Y(
        n1329) );
  MXI2X4TS U1678 ( .A(n2039), .B(n2275), .S0(n1345), .Y(n882) );
  XOR2X4TS U1679 ( .A(n2022), .B(n1334), .Y(n2023) );
  OR2X4TS U1680 ( .A(n2011), .B(n2131), .Y(n1940) );
  NAND2X2TS U1681 ( .A(n1327), .B(n1571), .Y(n1338) );
  AND2X8TS U1682 ( .A(n1338), .B(n1339), .Y(n1642) );
  AND2X8TS U1683 ( .A(n1643), .B(n1490), .Y(n1339) );
  XNOR2X4TS U1684 ( .A(n1639), .B(n1638), .Y(n1640) );
  MXI2X4TS U1685 ( .A(n2289), .B(n1391), .S0(n1189), .Y(n902) );
  MXI2X2TS U1686 ( .A(n2303), .B(n1367), .S0(n1077), .Y(n890) );
  MXI2X2TS U1687 ( .A(n2284), .B(n1374), .S0(n1077), .Y(n906) );
  MXI2X2TS U1688 ( .A(n2275), .B(n1376), .S0(n1077), .Y(n914) );
  CLKMX2X2TS U1689 ( .A(result_add_subt[19]), .B(n1362), .S0(n1077), .Y(n898)
         );
  CLKMX2X2TS U1690 ( .A(result_add_subt[5]), .B(n1368), .S0(n1077), .Y(n912)
         );
  CLKMX2X2TS U1691 ( .A(result_add_subt[20]), .B(n1363), .S0(n1077), .Y(n897)
         );
  INVX4TS U1692 ( .A(n1583), .Y(n1578) );
  NOR2X4TS U1693 ( .A(n2108), .B(n1188), .Y(n1583) );
  NOR2X8TS U1694 ( .A(n1784), .B(n1252), .Y(n1342) );
  MXI2X4TS U1695 ( .A(n2285), .B(n2128), .S0(n2009), .Y(n905) );
  NAND3X4TS U1696 ( .A(net34453), .B(d_ff1_Z[13]), .C(net36078), .Y(n1656) );
  MX2X4TS U1697 ( .A(n2211), .B(n2212), .S0(n1192), .Y(net36143) );
  NAND3X4TS U1698 ( .A(n1744), .B(net35492), .C(n1059), .Y(n1745) );
  BUFX16TS U1699 ( .A(n1905), .Y(n2032) );
  AO21X4TS U1700 ( .A0(net34260), .A1(n2020), .B0(n2019), .Y(n1353) );
  NOR2X8TS U1701 ( .A(n1784), .B(n1332), .Y(n1354) );
  MXI2X4TS U1702 ( .A(n2044), .B(n2128), .S0(n1509), .Y(n1537) );
  AO22X4TS U1703 ( .A0(n1356), .A1(d_ff_Xn[5]), .B0(n1355), .B1(n1368), .Y(
        n1357) );
  CLKINVX12TS U1704 ( .A(net35393), .Y(net34700) );
  AO22X4TS U1705 ( .A0(n1792), .A1(d_ff_Xn[16]), .B0(n1516), .B1(n1387), .Y(
        n1358) );
  OAI21X4TS U1706 ( .A0(n1742), .A1(net27486), .B0(n1741), .Y(n2374) );
  OAI21X4TS U1707 ( .A0(n1796), .A1(net27486), .B0(n1795), .Y(n2359) );
  MXI2X4TS U1708 ( .A(n2041), .B(n2278), .S0(n1343), .Y(n879) );
  NOR2X8TS U1709 ( .A(net35849), .B(n1317), .Y(n1760) );
  OAI2BB1X4TS U1710 ( .A0N(net34875), .A1N(d_ff2_Y[0]), .B0(n1560), .Y(n767)
         );
  MXI2X4TS U1711 ( .A(n2124), .B(n2293), .S0(n1344), .Y(n867) );
  MXI2X2TS U1712 ( .A(n2117), .B(n2296), .S0(n1345), .Y(n864) );
  INVX8TS U1713 ( .A(net34983), .Y(net34395) );
  INVX12TS U1714 ( .A(net34982), .Y(net34235) );
  AOI2BB2X2TS U1715 ( .B0(net35652), .B1(n2043), .A0N(d_ff2_X[10]), .A1N(
        net34538), .Y(n683) );
  MXI2X2TS U1716 ( .A(n2049), .B(n2295), .S0(n1346), .Y(n865) );
  OAI2BB1X4TS U1717 ( .A0N(net34898), .A1N(n1321), .B0(n1649), .Y(n719) );
  INVX16TS U1718 ( .A(net34772), .Y(net34898) );
  NAND3X6TS U1719 ( .A(n1673), .B(n1672), .C(n1671), .Y(n2323) );
  OAI2BB1X4TS U1720 ( .A0N(net36489), .A1N(n1568), .B0(n1567), .Y(n763) );
  MX2X4TS U1721 ( .A(n1411), .B(n1412), .S0(net35492), .Y(n712) );
  MXI2X4TS U1722 ( .A(n1640), .B(n2070), .S0(net35665), .Y(n647) );
  OAI2BB1X4TS U1723 ( .A0N(net34898), .A1N(d_ff2_Y[21]), .B0(n1626), .Y(n725)
         );
  MXI2X4TS U1724 ( .A(n1418), .B(n2061), .S0(net36827), .Y(n666) );
  BUFX8TS U1725 ( .A(n1354), .Y(n1425) );
  BUFX8TS U1726 ( .A(n1354), .Y(n2004) );
  OAI2BB1X4TS U1727 ( .A0N(n1433), .A1N(net35039), .B0(n1791), .Y(n2355) );
  NAND3BX4TS U1728 ( .AN(n1434), .B(n1605), .C(n1604), .Y(n2333) );
  NAND3BX4TS U1729 ( .AN(n1435), .B(n1603), .C(n1602), .Y(n2328) );
  NAND3BX4TS U1730 ( .AN(n1436), .B(n1609), .C(n1608), .Y(n2327) );
  NAND3BX4TS U1731 ( .AN(n1437), .B(n1607), .C(n1606), .Y(n2325) );
  INVX6TS U1732 ( .A(n1462), .Y(n1439) );
  AOI2BB2X1TS U1733 ( .B0(n2004), .B1(d_ff3_LUT_out[24]), .A0N(n1439), .A1N(
        n1438), .Y(n1992) );
  AOI2BB2X1TS U1734 ( .B0(n2004), .B1(d_ff2_Z[0]), .A0N(n1439), .A1N(n1440), 
        .Y(n1985) );
  NAND3X2TS U1735 ( .A(net34772), .B(d_ff1_Z[3]), .C(net36078), .Y(n1621) );
  NOR2X4TS U1736 ( .A(n1356), .B(n2126), .Y(n1514) );
  NAND2X2TS U1737 ( .A(n1299), .B(d_ff_Xn[30]), .Y(n1512) );
  AO21X4TS U1738 ( .A0(enab_cont_iter), .A1(net36503), .B0(net34533), .Y(n1443) );
  NAND2X4TS U1739 ( .A(d_ff_Yn[0]), .B(net35575), .Y(n1560) );
  NAND2X4TS U1740 ( .A(net35575), .B(n1364), .Y(n1562) );
  NAND2X4TS U1741 ( .A(net35575), .B(d_ff_Xn[18]), .Y(n1685) );
  NAND2X4TS U1742 ( .A(net35575), .B(n1388), .Y(n1688) );
  CLKMX2X4TS U1743 ( .A(d_ff2_X[22]), .B(d_ff3_sh_x_out[22]), .S0(net34246), 
        .Y(n658) );
  NAND2X4TS U1744 ( .A(d_ff3_LUT_out[8]), .B(net34246), .Y(n1523) );
  BUFX3TS U1745 ( .A(n1451), .Y(n2260) );
  INVX16TS U1746 ( .A(net34983), .Y(net34237) );
  NAND2X2TS U1747 ( .A(net37196), .B(n1802), .Y(n1612) );
  NAND2X2TS U1748 ( .A(net35372), .B(n1812), .Y(n1679) );
  NAND2X2TS U1749 ( .A(net35372), .B(n1381), .Y(n1575) );
  NAND2X2TS U1750 ( .A(net34395), .B(n1277), .Y(n1829) );
  NAND2X4TS U1751 ( .A(net35665), .B(d_ff3_LUT_out[24]), .Y(n1698) );
  CLKMX2X4TS U1752 ( .A(d_ff2_Y[15]), .B(d_ff3_sh_y_out[15]), .S0(net34265), 
        .Y(n736) );
  MXI2X4TS U1753 ( .A(n2023), .B(n2268), .S0(net35665), .Y(n711) );
  CLKMX2X4TS U1754 ( .A(d_ff2_Y[11]), .B(d_ff3_sh_y_out[11]), .S0(net34265), 
        .Y(n744) );
  NAND2X2TS U1755 ( .A(net36779), .B(d_ff3_sh_y_out[29]), .Y(n1646) );
  INVX2TS U1756 ( .A(n1449), .Y(n1451) );
  BUFX3TS U1757 ( .A(n1801), .Y(n1454) );
  CLKBUFX3TS U1758 ( .A(n1801), .Y(n2259) );
  MXI2X4TS U1759 ( .A(d_ff3_sh_x_out[23]), .B(n1842), .S0(net35596), .Y(n1553)
         );
  BUFX12TS U1760 ( .A(n1999), .Y(n1462) );
  NAND2X2TS U1761 ( .A(n1069), .B(d_ff3_sh_x_out[22]), .Y(n1939) );
  OR2X6TS U1762 ( .A(net35596), .B(d_ff3_sh_x_out[27]), .Y(n1500) );
  INVX16TS U1763 ( .A(n1995), .Y(n2013) );
  AOI22X2TS U1764 ( .A0(n1509), .A1(n1397), .B0(d_ff_Xn[6]), .B1(n1356), .Y(
        n1727) );
  INVX16TS U1765 ( .A(n1105), .Y(net35575) );
  INVX2TS U1766 ( .A(n1465), .Y(n1466) );
  OAI2BB1X2TS U1767 ( .A0N(n2006), .A1N(d_ff3_sh_y_out[2]), .B0(n1771), .Y(
        add_subt_dataB[2]) );
  MXI2X4TS U1768 ( .A(n1737), .B(n2131), .S0(net35665), .Y(n807) );
  INVX2TS U1769 ( .A(n1467), .Y(n1468) );
  INVX2TS U1770 ( .A(n1469), .Y(n1470) );
  INVX2TS U1771 ( .A(n1471), .Y(n1472) );
  INVX2TS U1772 ( .A(n1473), .Y(n1474) );
  INVX2TS U1773 ( .A(n1475), .Y(n1476) );
  INVX2TS U1774 ( .A(n1477), .Y(n1478) );
  INVX2TS U1775 ( .A(n1479), .Y(n1480) );
  NAND2X2TS U1776 ( .A(net35299), .B(n1392), .Y(n1554) );
  MXI2X4TS U1777 ( .A(n2272), .B(n2126), .S0(n2009), .Y(n917) );
  INVX2TS U1778 ( .A(n1482), .Y(n1483) );
  OAI21X2TS U1779 ( .A0(n1923), .A1(n2269), .B0(n1507), .Y(add_subt_dataB[26])
         );
  NAND3X4TS U1780 ( .A(n1746), .B(n1072), .C(n1745), .Y(n708) );
  XOR2X4TS U1781 ( .A(n1484), .B(n1417), .Y(n1510) );
  XOR2X4TS U1782 ( .A(n1350), .B(n1423), .Y(n1484) );
  OAI2BB1X2TS U1783 ( .A0N(n1966), .A1N(d_ff3_sh_y_out[0]), .B0(n2002), .Y(
        add_subt_dataB[0]) );
  OAI2BB1X2TS U1784 ( .A0N(n2003), .A1N(d_ff3_sh_y_out[1]), .B0(n2005), .Y(
        add_subt_dataB[1]) );
  NOR2X8TS U1785 ( .A(n1784), .B(n1252), .Y(n1999) );
  NOR2X1TS U1786 ( .A(n1486), .B(n2227), .Y(inst_CORDIC_FSM_v3_state_next[6])
         );
  OAI22X2TS U1787 ( .A0(n2015), .A1(n1486), .B0(n2012), .B1(n2011), .Y(
        inst_CORDIC_FSM_v3_state_next[5]) );
  NAND2BX4TS U1788 ( .AN(n1521), .B(n1542), .Y(n1486) );
  OAI2BB1X2TS U1789 ( .A0N(n1488), .A1N(n1487), .B0(n1982), .Y(
        add_subt_dataA[8]) );
  OAI2BB1X2TS U1790 ( .A0N(n1488), .A1N(net35498), .B0(n1984), .Y(
        add_subt_dataA[11]) );
  BUFX4TS U1791 ( .A(n1354), .Y(n1989) );
  NAND2X2TS U1792 ( .A(net35575), .B(n1811), .Y(n1667) );
  NAND3X2TS U1793 ( .A(net34772), .B(d_ff1_Z[9]), .C(net36078), .Y(n1611) );
  NAND3X2TS U1794 ( .A(net34772), .B(d_ff1_Z[1]), .C(net36078), .Y(n1678) );
  NAND3X4TS U1795 ( .A(n1847), .B(n1846), .C(n1845), .Y(n648) );
  NAND2BX4TS U1796 ( .AN(n1557), .B(n1408), .Y(n2341) );
  NAND2X4TS U1797 ( .A(n1275), .B(net36493), .Y(n1862) );
  NAND2BX2TS U1798 ( .AN(net34449), .B(d_ff2_Z[31]), .Y(n1633) );
  NAND2X4TS U1799 ( .A(net35575), .B(n1821), .Y(n1635) );
  OAI21X2TS U1800 ( .A0(n2032), .A1(n2062), .B0(n1924), .Y(add_subt_dataA[21])
         );
  OR2X8TS U1801 ( .A(n1332), .B(n1333), .Y(n1905) );
  BUFX4TS U1802 ( .A(n1354), .Y(n1987) );
  NAND2X4TS U1803 ( .A(n1148), .B(data_output[11]), .Y(n1728) );
  INVX16TS U1804 ( .A(n1105), .Y(net35299) );
  OAI21X2TS U1805 ( .A0(n2032), .A1(n2061), .B0(n1980), .Y(add_subt_dataA[18])
         );
  OAI21X2TS U1806 ( .A0(n1905), .A1(n2059), .B0(n1981), .Y(add_subt_dataA[9])
         );
  OAI21X2TS U1807 ( .A0(n1905), .A1(n2060), .B0(n1983), .Y(add_subt_dataA[15])
         );
  OAI21X2TS U1808 ( .A0(n2032), .A1(n2064), .B0(n1986), .Y(add_subt_dataA[31])
         );
  OAI21X2TS U1809 ( .A0(n1923), .A1(n2057), .B0(n1991), .Y(add_subt_dataA[4])
         );
  OAI21X2TS U1810 ( .A0(n1361), .A1(n1923), .B0(n2008), .Y(add_subt_dataA[23])
         );
  OAI21X2TS U1811 ( .A0(n1406), .A1(n1923), .B0(n2014), .Y(add_subt_dataA[29])
         );
  OAI21X2TS U1812 ( .A0(n2032), .A1(n2063), .B0(n2029), .Y(add_subt_dataA[22])
         );
  OAI21X2TS U1813 ( .A0(n2032), .A1(n2065), .B0(n2031), .Y(add_subt_dataA[30])
         );
  OAI2BB1X2TS U1814 ( .A0N(d_ff2_X[7]), .A1N(n2003), .B0(n1969), .Y(
        add_subt_dataA[7]) );
  OAI2BB1X2TS U1815 ( .A0N(d_ff2_X[12]), .A1N(n2006), .B0(n1971), .Y(
        add_subt_dataA[12]) );
  OAI2BB1X2TS U1816 ( .A0N(d_ff2_X[6]), .A1N(n2003), .B0(n1974), .Y(
        add_subt_dataA[6]) );
  OAI2BB1X2TS U1817 ( .A0N(d_ff2_X[5]), .A1N(n2006), .B0(n1975), .Y(
        add_subt_dataA[5]) );
  OAI2BB1X2TS U1818 ( .A0N(d_ff2_X[10]), .A1N(n2006), .B0(n1976), .Y(
        add_subt_dataA[10]) );
  OAI2BB1X2TS U1819 ( .A0N(d_ff2_X[2]), .A1N(n2006), .B0(n1977), .Y(
        add_subt_dataA[2]) );
  OAI2BB1X2TS U1820 ( .A0N(d_ff2_X[3]), .A1N(n2006), .B0(n1978), .Y(
        add_subt_dataA[3]) );
  OAI2BB1X2TS U1821 ( .A0N(d_ff2_X[13]), .A1N(n2006), .B0(n1988), .Y(
        add_subt_dataA[13]) );
  OAI2BB1X2TS U1822 ( .A0N(d_ff2_X[17]), .A1N(n1959), .B0(n1967), .Y(
        add_subt_dataA[17]) );
  OAI2BB1X2TS U1823 ( .A0N(d_ff2_X[16]), .A1N(n1959), .B0(n1968), .Y(
        add_subt_dataA[16]) );
  OAI2BB1X2TS U1824 ( .A0N(d_ff2_X[20]), .A1N(n1959), .B0(n1970), .Y(
        add_subt_dataA[20]) );
  OAI2BB1X2TS U1825 ( .A0N(d_ff2_X[14]), .A1N(n1959), .B0(n1972), .Y(
        add_subt_dataA[14]) );
  OAI2BB1X2TS U1826 ( .A0N(d_ff2_X[19]), .A1N(n1959), .B0(n1973), .Y(
        add_subt_dataA[19]) );
  OAI2BB1X2TS U1827 ( .A0N(n1297), .A1N(n1959), .B0(n2000), .Y(
        add_subt_dataA[27]) );
  OAI2BB1X2TS U1828 ( .A0N(n1294), .A1N(n1959), .B0(n2001), .Y(
        add_subt_dataA[28]) );
  NAND3X2TS U1829 ( .A(n1167), .B(d_ff1_Z[12]), .C(n1079), .Y(n1601) );
  BUFX20TS U1830 ( .A(net34489), .Y(net35334) );
  BUFX20TS U1831 ( .A(net37201), .Y(net35373) );
  NAND3X4TS U1832 ( .A(n1544), .B(n1738), .C(n1273), .Y(n1547) );
  NOR2X8TS U1833 ( .A(net34251), .B(n1348), .Y(n1566) );
  OAI21X4TS U1834 ( .A0(n1641), .A1(n1359), .B0(n1314), .Y(n1494) );
  AOI22X4TS U1835 ( .A0(d_ff3_LUT_out[23]), .A1(net34495), .B0(net35492), .B1(
        n1497), .Y(n1496) );
  OR2X8TS U1836 ( .A(net35596), .B(d_ff3_LUT_out[26]), .Y(n1499) );
  NAND2X8TS U1837 ( .A(n1709), .B(net35492), .Y(n1913) );
  NAND2X4TS U1838 ( .A(n1777), .B(net35492), .Y(n1645) );
  OAI2BB1X4TS U1839 ( .A0N(d_ff_Xn[2]), .A1N(n1732), .B0(n1515), .Y(n1532) );
  OAI21X4TS U1840 ( .A0(n1517), .A1(n1148), .B0(n1751), .Y(n2354) );
  NOR2X8TS U1841 ( .A(n1308), .B(n2049), .Y(n1518) );
  NAND2X4TS U1842 ( .A(net35442), .B(net36617), .Y(n1630) );
  MXI2X4TS U1843 ( .A(n1884), .B(n1483), .S0(net34395), .Y(n1886) );
  NAND2X4TS U1844 ( .A(n1886), .B(n1885), .Y(n810) );
  AOI2BB2X4TS U1845 ( .B0(n2039), .B1(net35652), .A0N(net36422), .A1N(
        d_ff2_X[3]), .Y(n697) );
  AOI2BB2X4TS U1846 ( .B0(n2037), .B1(net37108), .A0N(net36422), .A1N(
        d_ff2_X[1]), .Y(n701) );
  OAI2BB1X4TS U1847 ( .A0N(n1764), .A1N(n1297), .B0(net35492), .Y(n1705) );
  OAI21X4TS U1848 ( .A0(n1750), .A1(n1176), .B0(n1749), .Y(n2357) );
  AOI22X2TS U1849 ( .A0(n1463), .A1(n1388), .B0(d_ff_Xn[9]), .B1(n1356), .Y(
        n1731) );
  XOR2X4TS U1850 ( .A(n1842), .B(n1302), .Y(n1843) );
  NOR2X8TS U1851 ( .A(net37160), .B(n1360), .Y(n1842) );
  NAND2X2TS U1852 ( .A(net35652), .B(n1403), .Y(n1648) );
  NAND2X4TS U1853 ( .A(net35299), .B(n1368), .Y(n1569) );
  AOI2BB2X2TS U1854 ( .B0(net35371), .B1(n2051), .A0N(d_ff2_X[25]), .A1N(
        net34538), .Y(n655) );
  NAND2X2TS U1855 ( .A(net35372), .B(d_ff_Xn[30]), .Y(n1684) );
  OAI21X2TS U1856 ( .A0(net36422), .A1(n1348), .B0(n1863), .Y(n718) );
  INVX12TS U1857 ( .A(n1908), .Y(n1923) );
  NAND2X8TS U1858 ( .A(n1341), .B(net34533), .Y(n2020) );
  MXI2X4TS U1859 ( .A(n1424), .B(n1904), .S0(n1123), .Y(n982) );
  MXI2X4TS U1860 ( .A(n1351), .B(n1903), .S0(n1124), .Y(n983) );
  MXI2X4TS U1861 ( .A(n2102), .B(n1901), .S0(n1869), .Y(n964) );
  MXI2X4TS U1862 ( .A(n2103), .B(n1899), .S0(n1869), .Y(n965) );
  MXI2X4TS U1863 ( .A(n2115), .B(n1897), .S0(n1869), .Y(n959) );
  MXI2X4TS U1864 ( .A(n2106), .B(n1893), .S0(n1222), .Y(n967) );
  MXI2X4TS U1865 ( .A(net28357), .B(n1902), .S0(n1221), .Y(n960) );
  MXI2X4TS U1866 ( .A(n2101), .B(n1888), .S0(n1869), .Y(n969) );
  MXI2X4TS U1867 ( .A(n2113), .B(n1875), .S0(n1222), .Y(n953) );
  MXI2X4TS U1868 ( .A(n2104), .B(n1892), .S0(n1221), .Y(n970) );
  NAND2X8TS U1869 ( .A(n1915), .B(n1871), .Y(n1885) );
  NAND2X8TS U1870 ( .A(n1915), .B(n1872), .Y(n1919) );
  NAND2X4TS U1871 ( .A(n1915), .B(n1696), .Y(n1700) );
  NAND2X4TS U1872 ( .A(n1915), .B(n1880), .Y(n1882) );
  NAND2X4TS U1873 ( .A(n1328), .B(n1843), .Y(n1847) );
  MXI2X4TS U1874 ( .A(n2092), .B(n1870), .S0(n1869), .Y(n976) );
  MXI2X4TS U1875 ( .A(n2114), .B(n1868), .S0(n1869), .Y(n956) );
  MXI2X4TS U1876 ( .A(n2091), .B(n1867), .S0(n1222), .Y(n977) );
  MXI2X4TS U1877 ( .A(n2098), .B(n1866), .S0(n1222), .Y(n979) );
  MXI2X4TS U1878 ( .A(n2097), .B(n1857), .S0(n1869), .Y(n963) );
  MXI2X4TS U1879 ( .A(n2096), .B(n1856), .S0(n1869), .Y(n968) );
  MXI2X4TS U1880 ( .A(net28374), .B(n1855), .S0(n1221), .Y(n961) );
  MXI2X4TS U1881 ( .A(n2107), .B(n1854), .S0(n1895), .Y(n974) );
  MXI2X4TS U1882 ( .A(n2095), .B(n1853), .S0(n1895), .Y(n975) );
  MXI2X4TS U1883 ( .A(n2110), .B(n1852), .S0(n1221), .Y(n952) );
  MXI2X4TS U1884 ( .A(n2109), .B(n1850), .S0(n1159), .Y(n955) );
  MXI2X4TS U1885 ( .A(n2094), .B(n1851), .S0(n1869), .Y(n951) );
  NAND2X2TS U1886 ( .A(n1147), .B(data_output[21]), .Y(n1541) );
  NAND2X2TS U1887 ( .A(net35581), .B(data_output[3]), .Y(n1733) );
  NAND2X2TS U1888 ( .A(net35581), .B(data_output[0]), .Y(n1741) );
  NAND2X2TS U1889 ( .A(net35581), .B(data_output[6]), .Y(n1726) );
  NAND2X2TS U1890 ( .A(n1177), .B(data_output[9]), .Y(n1730) );
  NAND2X2TS U1891 ( .A(n1147), .B(data_output[22]), .Y(n2307) );
  OAI21X2TS U1892 ( .A0(n1725), .A1(net36302), .B0(n1724), .Y(n2360) );
  NAND2X2TS U1893 ( .A(n1147), .B(data_output[8]), .Y(n1718) );
  NAND2X2TS U1894 ( .A(n1176), .B(data_output[16]), .Y(n1793) );
  NAND2X2TS U1895 ( .A(net36302), .B(data_output[23]), .Y(n1752) );
  INVX12TS U1896 ( .A(n1760), .Y(n1701) );
  MXI2X4TS U1897 ( .A(n2018), .B(n2071), .S0(n1141), .Y(n972) );
  INVX16TS U1898 ( .A(n1489), .Y(n1869) );
  NAND3X2TS U1899 ( .A(n2028), .B(n2027), .C(n2026), .Y(n986) );
  NAND2X2TS U1900 ( .A(n1915), .B(n1828), .Y(n1830) );
  NAND2X2TS U1901 ( .A(n1176), .B(data_output[5]), .Y(n1782) );
  NAND2X2TS U1902 ( .A(net35581), .B(data_output[27]), .Y(n1756) );
  NAND2X2TS U1903 ( .A(net35581), .B(data_output[26]), .Y(n1754) );
  NOR2X8TS U1904 ( .A(n1318), .B(net34251), .Y(n1764) );
  OR3X6TS U1905 ( .A(n1294), .B(n1297), .C(n1405), .Y(n1765) );
  AOI2BB2X4TS U1906 ( .B0(ready_cordic), .B1(ack_cordic), .A0N(n1273), .A1N(
        beg_fsm_cordic), .Y(n1545) );
  OR2X8TS U1907 ( .A(n1303), .B(net34533), .Y(n1636) );
  BUFX3TS U1908 ( .A(n1800), .Y(n2263) );
  BUFX3TS U1909 ( .A(n1800), .Y(n2264) );
  AO22X4TS U1910 ( .A0(n1779), .A1(d_ff_Xn[21]), .B0(n1060), .B1(n1369), .Y(
        n1533) );
  AO22X4TS U1911 ( .A0(n1299), .A1(d_ff_Xn[24]), .B0(n1308), .B1(n1403), .Y(
        net35109) );
  NAND2X2TS U1912 ( .A(net35303), .B(d_ff_Yn[29]), .Y(n1858) );
  AOI22X2TS U1913 ( .A0(n1511), .A1(n1381), .B0(d_ff_Xn[14]), .B1(n1723), .Y(
        n1725) );
  INVX2TS U1914 ( .A(n2090), .Y(n1595) );
  OR2X2TS U1915 ( .A(n2011), .B(n1927), .Y(n1951) );
  OR2X4TS U1916 ( .A(n2011), .B(n2270), .Y(n1965) );
  OAI2BB1X4TS U1920 ( .A0N(net35039), .A1N(n1533), .B0(n1541), .Y(n2353) );
  NOR2X1TS U1921 ( .A(net36990), .B(net35844), .Y(n1542) );
  NOR2X1TS U1922 ( .A(n1185), .B(net36400), .Y(n1543) );
  INVX2TS U1923 ( .A(n2079), .Y(n1550) );
  INVX2TS U1924 ( .A(n2085), .Y(n1552) );
  OAI21X4TS U1925 ( .A0(net34745), .A1(n2076), .B0(n1556), .Y(n729) );
  MXI2X2TS U1926 ( .A(n2163), .B(n2162), .S0(n2161), .Y(n1805) );
  INVX2TS U1927 ( .A(n2075), .Y(n1565) );
  OAI2BB1X4TS U1928 ( .A0N(net34987), .A1N(n1565), .B0(n1564), .Y(n731) );
  OAI21X4TS U1929 ( .A0(net36422), .A1(n2064), .B0(net34944), .Y(n641) );
  INVX2TS U1930 ( .A(n2078), .Y(n1568) );
  INVX2TS U1931 ( .A(n2089), .Y(n1574) );
  OAI2BB1X4TS U1932 ( .A0N(net34987), .A1N(n1574), .B0(n1573), .Y(n733) );
  INVX2TS U1933 ( .A(n2087), .Y(n1576) );
  NOR2X8TS U1934 ( .A(n1637), .B(n1577), .Y(n1581) );
  OAI21X1TS U1935 ( .A0(n1587), .A1(n1317), .B0(n1294), .Y(n1588) );
  OAI2BB1X4TS U1936 ( .A0N(net34898), .A1N(n1595), .B0(n1594), .Y(n723) );
  NAND3X1TS U1937 ( .A(net35334), .B(d_ff1_Z[29]), .C(net36078), .Y(n1597) );
  NAND2BX1TS U1938 ( .AN(net34449), .B(n1419), .Y(n1596) );
  NAND3X2TS U1939 ( .A(n1597), .B(n1598), .C(n1596), .Y(n2316) );
  MXI2X2TS U1940 ( .A(n2169), .B(n2168), .S0(n2167), .Y(n1802) );
  NAND3X1TS U1941 ( .A(net34772), .B(d_ff1_Z[11]), .C(n1079), .Y(n1616) );
  NAND3X2TS U1942 ( .A(n1616), .B(n1617), .C(n1615), .Y(n2332) );
  MXI2X2TS U1943 ( .A(n2178), .B(n2177), .S0(n2176), .Y(n1803) );
  MXI2X2TS U1944 ( .A(n2157), .B(n2156), .S0(n2155), .Y(n1806) );
  MXI2X2TS U1945 ( .A(n2145), .B(n2144), .S0(n2143), .Y(n1809) );
  OAI21X2TS U1946 ( .A0(n1167), .A1(n2077), .B0(n1627), .Y(n727) );
  NAND2X1TS U1947 ( .A(net34237), .B(n1296), .Y(n1631) );
  OAI21X2TS U1948 ( .A0(n1842), .A1(n1637), .B0(n1636), .Y(n1639) );
  NAND2X6TS U1949 ( .A(n1642), .B(n1349), .Y(n1743) );
  OAI21X2TS U1950 ( .A0(net36422), .A1(n1315), .B0(n1651), .Y(n717) );
  MXI2X2TS U1951 ( .A(n2151), .B(n2150), .S0(n2149), .Y(n1808) );
  NAND3X1TS U1952 ( .A(net35334), .B(d_ff1_Z[25]), .C(n1079), .Y(n1662) );
  NAND3X2TS U1953 ( .A(n1661), .B(n1662), .C(n1663), .Y(n2320) );
  MXI2X2TS U1954 ( .A(n2142), .B(n2141), .S0(n2140), .Y(n1811) );
  AND2X2TS U1955 ( .A(net34901), .B(n1337), .Y(n1664) );
  INVX2TS U1956 ( .A(n1664), .Y(n1665) );
  NAND3X2TS U1957 ( .A(n1666), .B(n1667), .C(n1665), .Y(n2339) );
  MXI2X2TS U1958 ( .A(n2196), .B(n2195), .S0(n2194), .Y(n1819) );
  NAND3X1TS U1959 ( .A(n1167), .B(d_ff1_Z[14]), .C(n1079), .Y(n1669) );
  NAND3X2TS U1960 ( .A(n1669), .B(n1670), .C(n1668), .Y(n2329) );
  MXI2X2TS U1961 ( .A(n2136), .B(n2135), .S0(n2134), .Y(n1814) );
  MXI2X2TS U1962 ( .A(n2139), .B(n2138), .S0(n2137), .Y(n1812) );
  MXI2X4TS U1963 ( .A(n1681), .B(n1680), .S0(n1350), .Y(n1682) );
  NAND2X2TS U1964 ( .A(net35372), .B(n1379), .Y(n1686) );
  NAND2X2TS U1965 ( .A(net35372), .B(n1372), .Y(n1687) );
  MXI2X4TS U1966 ( .A(net34742), .B(d_ff3_sh_y_out[23]), .S0(net34495), .Y(
        n1690) );
  OAI2BB1X4TS U1967 ( .A0N(n1275), .A1N(net36257), .B0(n1690), .Y(n713) );
  NAND2X2TS U1968 ( .A(n1693), .B(n1695), .Y(n1914) );
  NAND3X2TS U1969 ( .A(n1885), .B(n1713), .C(n1712), .Y(n816) );
  AOI21X2TS U1970 ( .A0(d_ff_Yn[18]), .A1(n1355), .B0(n1714), .Y(n1716) );
  OAI2BB1X4TS U1971 ( .A0N(net35039), .A1N(n1536), .B0(n1718), .Y(n2366) );
  OAI21X4TS U1972 ( .A0(n1727), .A1(net27486), .B0(n1726), .Y(n2368) );
  NAND2X1TS U1973 ( .A(enab_cont_iter), .B(n1831), .Y(n1739) );
  NAND2X2TS U1974 ( .A(n1739), .B(n1738), .Y(n2313) );
  NOR2BX4TS U1975 ( .AN(d_ff_Xn[0]), .B(n1516), .Y(n1740) );
  OAI21X4TS U1976 ( .A0(n1755), .A1(net27486), .B0(n1754), .Y(n2349) );
  AOI22X1TS U1977 ( .A0(n1340), .A1(n2007), .B0(n2030), .B1(d_ff2_Z[24]), .Y(
        n1757) );
  OAI21X2TS U1978 ( .A0(n1303), .A1(n1923), .B0(n1757), .Y(add_subt_dataA[24])
         );
  AOI22X1TS U1979 ( .A0(n1321), .A1(n1990), .B0(n1425), .B1(n1422), .Y(n1758)
         );
  OAI21X2TS U1980 ( .A0(n2108), .A1(n1923), .B0(n1758), .Y(add_subt_dataA[25])
         );
  AOI22X1TS U1981 ( .A0(n1347), .A1(n1068), .B0(n1426), .B1(n1420), .Y(n1759)
         );
  OAI21X2TS U1982 ( .A0(n1318), .A1(n1923), .B0(n1759), .Y(add_subt_dataA[26])
         );
  AOI22X1TS U1983 ( .A0(d_ff3_sh_x_out[21]), .A1(n1990), .B0(n2004), .B1(n1481), .Y(n1769) );
  OAI2BB1X2TS U1984 ( .A0N(d_ff3_sh_y_out[21]), .A1N(n2006), .B0(n1769), .Y(
        add_subt_dataB[21]) );
  AOI22X1TS U1985 ( .A0(n1460), .A1(n1999), .B0(n2004), .B1(d_ff3_LUT_out[12]), 
        .Y(n1770) );
  OAI2BB1X2TS U1986 ( .A0N(d_ff3_sh_y_out[12]), .A1N(n2006), .B0(n1770), .Y(
        add_subt_dataB[12]) );
  AOI22X1TS U1987 ( .A0(d_ff3_sh_x_out[2]), .A1(n2007), .B0(n1426), .B1(n1277), 
        .Y(n1771) );
  AOI22X1TS U1988 ( .A0(n1480), .A1(n1069), .B0(n2004), .B1(n1295), .Y(n1772)
         );
  OAI2BB1X2TS U1989 ( .A0N(d_ff3_sh_y_out[10]), .A1N(n2003), .B0(n1772), .Y(
        add_subt_dataB[10]) );
  AOI22X1TS U1990 ( .A0(d_ff3_sh_x_out[4]), .A1(n1462), .B0(n1425), .B1(
        d_ff3_LUT_out[4]), .Y(n1773) );
  OAI2BB1X2TS U1991 ( .A0N(d_ff3_sh_y_out[4]), .A1N(n1959), .B0(n1773), .Y(
        add_subt_dataB[4]) );
  OAI2BB1X2TS U1992 ( .A0N(d_ff3_sh_y_out[6]), .A1N(n1959), .B0(n1774), .Y(
        add_subt_dataB[6]) );
  AOI22X1TS U1993 ( .A0(n1478), .A1(n1069), .B0(n2004), .B1(d_ff3_LUT_out[9]), 
        .Y(n1775) );
  OAI2BB1X2TS U1994 ( .A0N(d_ff3_sh_y_out[9]), .A1N(n2006), .B0(n1775), .Y(
        add_subt_dataB[9]) );
  AOI22X1TS U1995 ( .A0(n1476), .A1(n1996), .B0(n1426), .B1(d_ff3_LUT_out[8]), 
        .Y(n1776) );
  OAI2BB1X2TS U1996 ( .A0N(d_ff3_sh_y_out[8]), .A1N(n1959), .B0(n1776), .Y(
        add_subt_dataB[8]) );
  NAND4X2TS U1997 ( .A(n1783), .B(n1333), .C(n2012), .D(n1837), .Y(n1789) );
  XOR2X1TS U1998 ( .A(n1252), .B(n1333), .Y(n1785) );
  NAND2X2TS U1999 ( .A(n1786), .B(n1785), .Y(n1788) );
  NAND2X1TS U2000 ( .A(enab_cont_iter), .B(n1908), .Y(n1787) );
  NAND3X2TS U2001 ( .A(n1789), .B(n1788), .C(n1787), .Y(n990) );
  XOR2X4TS U2002 ( .A(n1797), .B(d_ff2_X[30]), .Y(n1798) );
  MXI2X4TS U2003 ( .A(n1798), .B(n1320), .S0(net35665), .Y(n642) );
  BUFX3TS U2004 ( .A(n1464), .Y(n2244) );
  BUFX3TS U2005 ( .A(n1799), .Y(n2242) );
  BUFX3TS U2006 ( .A(n1799), .Y(n2251) );
  BUFX3TS U2007 ( .A(n1799), .Y(n2250) );
  BUFX3TS U2008 ( .A(n1799), .Y(n2249) );
  BUFX3TS U2009 ( .A(n1799), .Y(n2248) );
  BUFX3TS U2010 ( .A(n1451), .Y(n2247) );
  BUFX3TS U2011 ( .A(n1799), .Y(n2245) );
  CLKBUFX3TS U2012 ( .A(n1464), .Y(n1800) );
  BUFX3TS U2013 ( .A(n1800), .Y(n2243) );
  BUFX3TS U2014 ( .A(n1801), .Y(n2241) );
  BUFX3TS U2015 ( .A(n1445), .Y(n2246) );
  BUFX3TS U2016 ( .A(n1464), .Y(n2239) );
  BUFX3TS U2017 ( .A(n1800), .Y(n2266) );
  BUFX3TS U2018 ( .A(n1799), .Y(n2252) );
  BUFX3TS U2019 ( .A(n1800), .Y(n2262) );
  BUFX3TS U2020 ( .A(n1800), .Y(n2265) );
  INVX2TS U2021 ( .A(n1817), .Y(n2300) );
  INVX2TS U2022 ( .A(beg_fsm_cordic), .Y(n1823) );
  NAND2X2TS U2023 ( .A(net35684), .B(n2270), .Y(n801) );
  CLKMX2X2TS U2024 ( .A(d_ff2_Y[4]), .B(d_ff3_sh_y_out[4]), .S0(net34265), .Y(
        n758) );
  INVX2TS U2025 ( .A(d_ff_Xn[31]), .Y(net34525) );
  CLKMX2X2TS U2026 ( .A(d_ff2_Y[8]), .B(d_ff3_sh_y_out[8]), .S0(net34265), .Y(
        n750) );
  CLKMX2X2TS U2027 ( .A(d_ff2_Y[6]), .B(d_ff3_sh_y_out[6]), .S0(net34395), .Y(
        n754) );
  MXI2X1TS U2028 ( .A(n2125), .B(n2298), .S0(n1345), .Y(n862) );
  MXI2X1TS U2029 ( .A(net28336), .B(n2284), .S0(n1346), .Y(n874) );
  MXI2X1TS U2030 ( .A(n2120), .B(n2276), .S0(n1345), .Y(n881) );
  INVX2TS U2031 ( .A(ack_cordic), .Y(n1832) );
  MXI2X1TS U2032 ( .A(n2048), .B(n2294), .S0(n1346), .Y(n866) );
  MXI2X1TS U2033 ( .A(n2044), .B(n2285), .S0(n1346), .Y(n873) );
  MXI2X1TS U2034 ( .A(n2045), .B(n2286), .S0(n1346), .Y(n872) );
  MXI2X1TS U2035 ( .A(n2052), .B(n2302), .S0(n1345), .Y(n859) );
  MXI2X1TS U2036 ( .A(n2053), .B(n2303), .S0(n1346), .Y(n858) );
  MXI2X1TS U2037 ( .A(n2054), .B(n2304), .S0(n1345), .Y(n857) );
  MXI2X1TS U2038 ( .A(n2055), .B(n2305), .S0(n1346), .Y(n856) );
  MXI2X1TS U2039 ( .A(n2046), .B(n2290), .S0(n1345), .Y(n869) );
  AOI21X1TS U2040 ( .A0(n1377), .A1(n1511), .B0(n1833), .Y(n2308) );
  CLKMX2X2TS U2041 ( .A(d_ff2_X[12]), .B(n1460), .S0(net34246), .Y(n678) );
  CLKMX2X2TS U2042 ( .A(d_ff2_X[20]), .B(d_ff3_sh_x_out[20]), .S0(net34246), 
        .Y(n662) );
  CLKMX2X2TS U2043 ( .A(d_ff2_X[19]), .B(d_ff3_sh_x_out[19]), .S0(net34246), 
        .Y(n664) );
  INVX2TS U2044 ( .A(n1843), .Y(n1844) );
  INVX2TS U2045 ( .A(data_in[26]), .Y(n1850) );
  INVX2TS U2046 ( .A(data_in[30]), .Y(n1851) );
  INVX2TS U2047 ( .A(data_in[29]), .Y(n1852) );
  INVX2TS U2048 ( .A(data_in[6]), .Y(n1853) );
  INVX2TS U2049 ( .A(data_in[7]), .Y(n1854) );
  INVX2TS U2050 ( .A(data_in[20]), .Y(n1855) );
  INVX2TS U2051 ( .A(data_in[13]), .Y(n1856) );
  INVX2TS U2052 ( .A(data_in[18]), .Y(n1857) );
  NAND2X1TS U2053 ( .A(net34237), .B(d_ff3_LUT_out[25]), .Y(n1859) );
  INVX2TS U2054 ( .A(data_in[2]), .Y(n1866) );
  INVX2TS U2055 ( .A(data_in[4]), .Y(n1867) );
  INVX2TS U2056 ( .A(data_in[25]), .Y(n1868) );
  INVX2TS U2057 ( .A(data_in[5]), .Y(n1870) );
  INVX2TS U2058 ( .A(data_in[3]), .Y(n1874) );
  INVX2TS U2059 ( .A(data_in[28]), .Y(n1875) );
  INVX2TS U2060 ( .A(data_in[10]), .Y(n1876) );
  INVX2TS U2061 ( .A(operation), .Y(n1877) );
  NAND2X1TS U2062 ( .A(n2027), .B(n1251), .Y(n1878) );
  CLKMX2X2TS U2063 ( .A(n1918), .B(d_ff3_LUT_out[13]), .S0(net35665), .Y(n809)
         );
  INVX2TS U2064 ( .A(data_in[0]), .Y(n1887) );
  INVX2TS U2065 ( .A(data_in[12]), .Y(n1888) );
  INVX2TS U2066 ( .A(data_in[15]), .Y(n1889) );
  INVX2TS U2067 ( .A(data_in[27]), .Y(n1890) );
  INVX2TS U2068 ( .A(data_in[31]), .Y(n1891) );
  INVX2TS U2069 ( .A(data_in[11]), .Y(n1892) );
  INVX2TS U2070 ( .A(data_in[14]), .Y(n1893) );
  INVX2TS U2071 ( .A(data_in[19]), .Y(n1894) );
  INVX2TS U2072 ( .A(data_in[24]), .Y(n1896) );
  INVX2TS U2073 ( .A(data_in[22]), .Y(n1897) );
  INVX2TS U2074 ( .A(data_in[8]), .Y(n1898) );
  INVX2TS U2075 ( .A(data_in[16]), .Y(n1899) );
  INVX2TS U2076 ( .A(data_in[1]), .Y(n1900) );
  INVX2TS U2077 ( .A(data_in[17]), .Y(n1901) );
  INVX2TS U2078 ( .A(data_in[21]), .Y(n1902) );
  INVX2TS U2079 ( .A(shift_region_flag[0]), .Y(n1903) );
  INVX2TS U2080 ( .A(shift_region_flag[1]), .Y(n1904) );
  NAND2X2TS U2081 ( .A(n1069), .B(n1319), .Y(n1907) );
  NAND2X1TS U2082 ( .A(n1966), .B(d_ff3_sh_y_out[30]), .Y(n1906) );
  NAND2X2TS U2083 ( .A(n1907), .B(n1906), .Y(add_subt_dataB[30]) );
  NAND2X1TS U2084 ( .A(n1342), .B(d_ff3_sh_x_out[31]), .Y(n1910) );
  NAND2X1TS U2085 ( .A(n1908), .B(d_ff3_sh_y_out[31]), .Y(n1909) );
  NAND2X1TS U2086 ( .A(n1910), .B(n1909), .Y(add_subt_dataB[31]) );
  NAND2X1TS U2087 ( .A(net34237), .B(d_ff3_LUT_out[3]), .Y(n1912) );
  NAND2X4TS U2088 ( .A(n1915), .B(n1918), .Y(n1916) );
  NAND2X1TS U2089 ( .A(n1998), .B(n1282), .Y(n1922) );
  NAND2X1TS U2090 ( .A(n1966), .B(d_ff3_sh_y_out[28]), .Y(n1921) );
  NAND3X1TS U2091 ( .A(n1965), .B(n1922), .C(n1921), .Y(add_subt_dataB[28]) );
  AOI22X1TS U2092 ( .A0(n2007), .A1(d_ff2_Y[21]), .B0(n1425), .B1(n1431), .Y(
        n1924) );
  OR2X2TS U2093 ( .A(n2011), .B(n1336), .Y(n1943) );
  NAND2X1TS U2094 ( .A(n1068), .B(d_ff3_sh_x_out[14]), .Y(n1926) );
  NAND2X1TS U2095 ( .A(n1908), .B(d_ff3_sh_y_out[14]), .Y(n1925) );
  NAND3X1TS U2096 ( .A(n1943), .B(n1926), .C(n1925), .Y(add_subt_dataB[14]) );
  NAND2X1TS U2097 ( .A(n1990), .B(d_ff3_sh_x_out[13]), .Y(n1929) );
  NAND2X1TS U2098 ( .A(n1908), .B(d_ff3_sh_y_out[13]), .Y(n1928) );
  NAND3X1TS U2099 ( .A(n1951), .B(n1929), .C(n1928), .Y(add_subt_dataB[13]) );
  OR2X2TS U2100 ( .A(n2011), .B(n2068), .Y(n1954) );
  NAND2X1TS U2101 ( .A(n1996), .B(d_ff3_sh_x_out[11]), .Y(n1931) );
  NAND2X1TS U2102 ( .A(n1908), .B(d_ff3_sh_y_out[11]), .Y(n1930) );
  NAND3X1TS U2103 ( .A(n1954), .B(n1931), .C(n1930), .Y(add_subt_dataB[11]) );
  OR2X2TS U2104 ( .A(n2011), .B(n2066), .Y(n1948) );
  NAND2X1TS U2105 ( .A(n1990), .B(d_ff3_sh_x_out[16]), .Y(n1933) );
  NAND2X1TS U2106 ( .A(n1908), .B(d_ff3_sh_y_out[16]), .Y(n1932) );
  NAND3X1TS U2107 ( .A(n1948), .B(n1933), .C(n1932), .Y(add_subt_dataB[16]) );
  OR2X4TS U2108 ( .A(n2011), .B(n2067), .Y(n1962) );
  NAND2X1TS U2109 ( .A(n2007), .B(d_ff3_sh_x_out[17]), .Y(n1935) );
  NAND2X1TS U2110 ( .A(n1908), .B(d_ff3_sh_y_out[17]), .Y(n1934) );
  NAND3X1TS U2111 ( .A(n1962), .B(n1935), .C(n1934), .Y(add_subt_dataB[17]) );
  NAND2X1TS U2112 ( .A(n1998), .B(d_ff3_sh_x_out[19]), .Y(n1937) );
  NAND2X1TS U2113 ( .A(n1908), .B(d_ff3_sh_y_out[19]), .Y(n1936) );
  NAND3X1TS U2114 ( .A(n1940), .B(n1937), .C(n1936), .Y(add_subt_dataB[19]) );
  NAND2X1TS U2115 ( .A(n1966), .B(d_ff3_sh_y_out[22]), .Y(n1938) );
  NAND3X1TS U2116 ( .A(n1940), .B(n1939), .C(n1938), .Y(add_subt_dataB[22]) );
  NAND2X1TS U2117 ( .A(n1462), .B(d_ff3_sh_x_out[5]), .Y(n1942) );
  NAND2X1TS U2118 ( .A(n1966), .B(d_ff3_sh_y_out[5]), .Y(n1941) );
  NAND3X1TS U2119 ( .A(n1943), .B(n1942), .C(n1941), .Y(add_subt_dataB[5]) );
  NAND2X1TS U2120 ( .A(n1068), .B(d_ff3_sh_x_out[15]), .Y(n1945) );
  NAND2X1TS U2121 ( .A(n2003), .B(d_ff3_sh_y_out[15]), .Y(n1944) );
  NAND3X1TS U2122 ( .A(n1962), .B(n1945), .C(n1944), .Y(add_subt_dataB[15]) );
  NAND2X1TS U2123 ( .A(n1996), .B(d_ff3_sh_x_out[3]), .Y(n1947) );
  NAND2X1TS U2124 ( .A(n1966), .B(d_ff3_sh_y_out[3]), .Y(n1946) );
  NAND3X1TS U2125 ( .A(n1948), .B(n1947), .C(n1946), .Y(add_subt_dataB[3]) );
  NAND2X1TS U2126 ( .A(n1462), .B(d_ff3_sh_x_out[18]), .Y(n1950) );
  NAND2X1TS U2127 ( .A(n1908), .B(d_ff3_sh_y_out[18]), .Y(n1949) );
  NAND3X1TS U2128 ( .A(n1951), .B(n1950), .C(n1949), .Y(add_subt_dataB[18]) );
  NAND2X1TS U2129 ( .A(n1966), .B(d_ff3_sh_y_out[7]), .Y(n1952) );
  NAND3X1TS U2130 ( .A(n1954), .B(n1953), .C(n1952), .Y(add_subt_dataB[7]) );
  NAND2X1TS U2131 ( .A(n1966), .B(n1284), .Y(n1955) );
  NAND3X1TS U2132 ( .A(n1965), .B(n1956), .C(n1955), .Y(add_subt_dataB[27]) );
  NAND2X1TS U2133 ( .A(n2003), .B(d_ff3_sh_y_out[20]), .Y(n1961) );
  NAND3X1TS U2134 ( .A(n1962), .B(n1961), .C(n1960), .Y(add_subt_dataB[20]) );
  NAND2X1TS U2135 ( .A(n1966), .B(d_ff3_sh_y_out[29]), .Y(n1964) );
  NAND3X1TS U2136 ( .A(n1965), .B(n1964), .C(n1963), .Y(add_subt_dataB[29]) );
  MXI2X1TS U2137 ( .A(n2287), .B(n1382), .S0(n1189), .Y(n903) );
  MXI2X1TS U2138 ( .A(n2276), .B(n1384), .S0(n1189), .Y(n913) );
  MXI2X1TS U2139 ( .A(n2297), .B(n1378), .S0(n1189), .Y(n895) );
  AOI22X1TS U2140 ( .A0(n1462), .A1(d_ff2_Y[17]), .B0(n1987), .B1(d_ff2_Z[17]), 
        .Y(n1967) );
  AOI22X1TS U2141 ( .A0(n2007), .A1(d_ff2_Y[7]), .B0(n1426), .B1(d_ff2_Z[7]), 
        .Y(n1969) );
  AOI22X1TS U2142 ( .A0(n1068), .A1(d_ff2_Y[20]), .B0(n2030), .B1(d_ff2_Z[20]), 
        .Y(n1970) );
  AOI22X1TS U2143 ( .A0(n1990), .A1(d_ff2_Y[12]), .B0(n1426), .B1(n1413), .Y(
        n1971) );
  AOI22X1TS U2144 ( .A0(n1069), .A1(d_ff2_Y[14]), .B0(n1426), .B1(n1429), .Y(
        n1972) );
  AOI22X1TS U2145 ( .A0(n1462), .A1(d_ff2_Y[19]), .B0(n1425), .B1(d_ff2_Z[19]), 
        .Y(n1973) );
  AOI22X1TS U2146 ( .A0(n1462), .A1(d_ff2_Y[6]), .B0(n1425), .B1(d_ff2_Z[6]), 
        .Y(n1974) );
  AOI22X1TS U2147 ( .A0(n1069), .A1(d_ff2_Y[2]), .B0(n2030), .B1(n1190), .Y(
        n1977) );
  AOI22X1TS U2148 ( .A0(n2007), .A1(d_ff2_Y[3]), .B0(n1426), .B1(d_ff2_Z[3]), 
        .Y(n1978) );
  AOI22X1TS U2149 ( .A0(n1996), .A1(n1232), .B0(n2004), .B1(d_ff2_Z[1]), .Y(
        n1979) );
  OAI2BB1X1TS U2150 ( .A0N(d_ff2_X[1]), .A1N(n2003), .B0(n1979), .Y(
        add_subt_dataA[1]) );
  AOI22X1TS U2151 ( .A0(n1999), .A1(d_ff2_Y[18]), .B0(n1425), .B1(n1237), .Y(
        n1980) );
  AOI22X1TS U2152 ( .A0(n1990), .A1(d_ff2_Y[9]), .B0(n2030), .B1(n1235), .Y(
        n1981) );
  AOI22X1TS U2153 ( .A0(n1068), .A1(d_ff2_Y[8]), .B0(n1425), .B1(d_ff2_Z[8]), 
        .Y(n1982) );
  AOI22X1TS U2154 ( .A0(n1462), .A1(d_ff2_Y[11]), .B0(n1425), .B1(n1427), .Y(
        n1984) );
  OAI21X1TS U2155 ( .A0(n2032), .A1(n2056), .B0(n1985), .Y(add_subt_dataA[0])
         );
  AOI22X1TS U2156 ( .A0(n1068), .A1(d_ff2_Y[31]), .B0(n1987), .B1(d_ff2_Z[31]), 
        .Y(n1986) );
  AOI22X1TS U2157 ( .A0(n1069), .A1(d_ff2_Y[13]), .B0(n2030), .B1(d_ff2_Z[13]), 
        .Y(n1988) );
  AOI22X1TS U2158 ( .A0(n2007), .A1(d_ff2_Y[4]), .B0(n1425), .B1(n1337), .Y(
        n1991) );
  INVX2TS U2159 ( .A(d_ff_Yn[26]), .Y(n1994) );
  MXI2X1TS U2160 ( .A(n2302), .B(n1994), .S0(n1189), .Y(n891) );
  MXI2X1TS U2161 ( .A(n2293), .B(n2129), .S0(n1995), .Y(n899) );
  AOI22X2TS U2162 ( .A0(d_ff3_sh_x_out[23]), .A1(n1996), .B0(n2004), .B1(
        d_ff3_LUT_out[23]), .Y(n1997) );
  OAI2BB1X1TS U2163 ( .A0N(d_ff3_sh_y_out[23]), .A1N(n2003), .B0(n1997), .Y(
        add_subt_dataB[23]) );
  AOI22X1TS U2164 ( .A0(n1314), .A1(n2007), .B0(n1987), .B1(n1304), .Y(n2000)
         );
  AOI22X1TS U2165 ( .A0(d_ff3_sh_x_out[0]), .A1(n1069), .B0(n1987), .B1(
        d_ff3_LUT_out[0]), .Y(n2002) );
  AOI22X1TS U2166 ( .A0(net36257), .A1(n1068), .B0(n1426), .B1(d_ff2_Z[23]), 
        .Y(n2008) );
  INVX2TS U2167 ( .A(d_ff_Yn[29]), .Y(n2010) );
  MXI2X1TS U2168 ( .A(n2305), .B(n2010), .S0(n1189), .Y(n888) );
  MXI2X1TS U2169 ( .A(n2283), .B(n1380), .S0(n1189), .Y(n907) );
  MXI2X1TS U2170 ( .A(n2274), .B(n2127), .S0(n1995), .Y(n915) );
  AOI22X1TS U2171 ( .A0(d_ff2_Y[29]), .A1(n1998), .B0(n1987), .B1(n1419), .Y(
        n2014) );
  CLKMX2X2TS U2172 ( .A(d_ff2_Y[3]), .B(d_ff3_sh_y_out[3]), .S0(net34265), .Y(
        n760) );
  CLKMX2X2TS U2173 ( .A(d_ff2_Y[22]), .B(d_ff3_sh_y_out[22]), .S0(net34265), 
        .Y(n722) );
  INVX2TS U2174 ( .A(n2019), .Y(n2016) );
  CLKMX2X2TS U2175 ( .A(d_ff2_X[16]), .B(d_ff3_sh_x_out[16]), .S0(net34246), 
        .Y(n670) );
  INVX2TS U2176 ( .A(data_in[9]), .Y(n2018) );
  NAND2X2TS U2177 ( .A(n2025), .B(n2024), .Y(n2028) );
  CLKMX2X2TS U2178 ( .A(d_ff2_Y[12]), .B(d_ff3_sh_y_out[12]), .S0(net34265), 
        .Y(n742) );
  CLKMX2X2TS U2179 ( .A(d_ff2_Y[0]), .B(d_ff3_sh_y_out[0]), .S0(net36779), .Y(
        n766) );
  CLKMX2X2TS U2180 ( .A(n1232), .B(d_ff3_sh_y_out[1]), .S0(net34246), .Y(n764)
         );
  CLKMX2X2TS U2181 ( .A(d_ff2_Y[31]), .B(d_ff3_sh_y_out[31]), .S0(net36779), 
        .Y(n704) );
  CLKMX2X2TS U2182 ( .A(d_ff2_X[5]), .B(d_ff3_sh_x_out[5]), .S0(net34246), .Y(
        n692) );
  AOI22X1TS U2183 ( .A0(n1068), .A1(d_ff2_Y[22]), .B0(n1426), .B1(d_ff2_Z[22]), 
        .Y(n2029) );
  XOR2X1TS U2184 ( .A(n1252), .B(d_ff3_sign_out), .Y(op_add_subt) );
  CLKMX2X2TS U2185 ( .A(d_ff2_Y[21]), .B(d_ff3_sh_y_out[21]), .S0(net34265), 
        .Y(n724) );
initial $sdf_annotate("CORDIC_Arch3v1_ASIC_fpu_syn_constraints_clk1.tcl_syn.sdf"); 
 endmodule

