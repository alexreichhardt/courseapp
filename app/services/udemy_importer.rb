require "base64"
require 'pp'
class UdemyImporter
  include HTTParty
    base_uri 'https://www.udemy.com/api-2.0/courses'
  # fetch API
  # transform each relevant key value pair to the form we need according to schema
  # create instance of course

  def self.call
    # This method should "translate" the corresponding platform API
    # And create an instance of each course
    new.get_data
  end

  def get_data
    get_results
  end

  private

  def get_ids
    @auth = { username:ENV['YOUR_CLIENT_ID'] , password: ENV['YOUR_CLIENT_SECRET'] }
    @options = {basic_auth: @auth}
    ids = []
    page_num = 1
    loop do
      if page_num == 2
        p ids
        return ids
        break
      end
      url = "/?page=#{page_num}&page_size=100&category=Development&language=en"
      response = self.class.get(url, @options)

      p "Error Code #{response.code}"
      case response.code
      when 404
        puts response
        return ids
        break
      when 429
        puts response
        return ids
        break
      when 400
        puts response
        return ids
        break
      else
        response["results"].each do |course|
           ids << course["id"]
        end
        p "id_count: #{page_num}00"
        if page_num % 10 == 0
          puts "sleeping for 1 minute.."
          sleep(61)
        end
        page_num += 1
      end
    end
    return ids

    #return ids = [1658166, 1062284, 1551066, 1591688, 1589856, 1267892, 1596850, 674764, 1658968, 1401479, 1153784, 1319746, 1384236, 948830, 1330272, 1256744, 1475808, 1506372, 548278, 1609984, 246392, 1322574, 1349958, 548068, 797038, 673420, 1621894, 1570568, 1649714, 1534654, 700300, 1693348, 1506550, 1305358, 1252630, 991290, 1747522, 931038, 1756026, 246652, 761790, 1517150, 1667618, 310112, 1138168, 1498364, 1420982, 43718, 1693396, 1485842, 1396072, 1357688, 1345324, 1568166, 1697086, 1320344, 1181546, 1364804, 990850, 1656358, 825690, 1465024, 857896, 534376, 246314, 390866, 1262158, 1703882, 1323462, 340844, 603014, 1552596, 230590, 1605732, 1396322, 1315568, 628222, 1208638, 1388250, 1587422, 578112, 1666402, 1487510, 1479726, 56582, 886300, 857162, 618736, 1736616, 919038, 1321544, 1777904, 1203292, 645126, 99554, 1627244, 752658, 1065250, 1255560, 419318, 1137616, 513018, 754694, 1020866, 1245088, 1378412, 1135088, 1321548, 1077472, 1106662, 164554, 1324998, 967058, 1630476, 11475, 1400916, 1594918, 693188, 1419388, 1627896, 665042, 1702782, 903526, 1630644, 1646098, 1742056, 1463186, 1463512, 701636, 1138310, 1594746, 1168666, 1609622, 1400360, 992114, 1086390, 1569462, 1666930, 1438206, 902734, 1576314, 1206542, 246154, 1459272, 1426010, 1023200, 1710932, 670034, 1562640, 1700026, 1121254, 791802, 1189488, 1154100, 221696, 646056, 835234, 1630106, 1374394, 1627276, 1257908, 1591570, 1587120, 1506352, 1547948, 729552, 701570, 1389128, 405456, 973918, 865646, 1077838, 1233396, 1458240, 1279620, 911318, 382066, 1104380, 652438, 1317972, 1116366, 1761488, 1396126, 920544, 204776, 438552, 1130832, 1609494, 1679872, 1229416, 1227222, 1054034, 1454068, 1316576, 21323, 1027812, 1359608, 1253100, 1259602, 1516790, 125958, 778112, 47963, 1084120, 1460728, 633832, 1023976, 60792, 1580786, 1679516, 1016536, 1426300, 924794, 1576596, 602084, 1775908, 1186394, 1054814, 1450282, 846662, 1473838, 798580, 477958, 1319770, 1643774, 1051548, 1407832, 1400140, 1277772, 534066, 1002676, 1568136, 776466, 1187514, 1509816, 702210, 1461696, 832862, 1070458, 111712, 958532, 197828, 1089744, 481002, 1381906, 648112, 293534, 421328, 803378, 1412422, 1587732, 1566876, 627032, 582636, 496050, 767596, 308072, 1391308, 648118, 771164, 1776276, 1336522, 254180, 1250572, 808532, 1643388, 940604, 609992, 1220616, 1202008, 752950, 788514, 1541542, 1362988, 359550, 1558718, 38917, 1608616, 1299396, 607218, 159070, 1617804, 1671020, 1623028, 1746206, 1089570, 1461156, 1598388, 504270, 1315926, 928858, 708674, 1389568, 1443358, 1049802, 297390, 16646, 445534, 1322796, 1320404, 1446964, 1506370, 1312042, 1209220, 577622, 1444632, 1613974, 358540, 1281336, 1017568, 1223302, 1395714, 1259422, 76052, 1563886, 723522, 962556, 254186, 1192848, 938560, 1242880, 1540668, 1379740, 1630400, 1529576, 736940, 1485210, 1242504, 1706514, 1568960, 1218130, 1626832, 1489982, 1731180, 1466532, 1288400, 1435554, 514182, 1334840, 1717430, 1555166, 480894, 654680, 1340610, 1463992, 1578270, 1143726, 1521110, 44689, 410170, 81094, 924704, 1772240, 702440, 1341322, 808904, 1576856, 1593954, 1412986, 1488790, 1577518, 1650770, 812588, 1368106, 1561426, 1715720, 1245130, 1000812, 1297528, 1496356, 1105026, 1079032, 1435230, 574876, 1310800, 1531584, 1317756, 1457292, 1350264, 842934, 1673770, 978852, 1339192, 1375375, 1121650, 641868, 1375217, 72466, 870252, 1269662, 1559408, 1568344, 499632, 1619768, 1345304, 1121448, 879166, 1705248, 1420080, 1287196]
    #return ids = [1795642, 625204, 567828, 1794208, 1794212, 1289478, 24823, 1713468, 1780636, 764164, 533682, 1794176, 1783922, 756150, 1794472, 1769414, 1362070, 258316, 1430746, 1792414, 1781200, 657932, 1731874, 1758486, 1723848, 851712, 1691862, 1522024, 1713422, 1187016, 1785464, 951618, 1755870, 922484, 1769016, 1780694, 705264, 1326292, 1711804, 146156, 1552854, 1782932, 892102, 1699194, 1693292, 1763664, 1787556, 949766, 692188, 1727766, 1535678, 1207960, 1466612, 959700, 1731774, 1763796, 1726950, 1042110, 1035000, 1247828, 1746350, 1770172, 1349770, 1784844, 473160, 1650610, 1755342, 1396598, 41295, 1218586, 995016, 1738022, 1764464, 1254420, 1756528, 1739596, 1612762, 895786, 629302, 364426, 1680244, 1651564, 1706134, 1781964, 775330, 1409142, 1769340, 247190, 1427466, 543600, 1724378, 1587718, 1261830, 1646980, 1557250, 1712214, 1463348, 1325686, 1675864, 1638522, 1165096, 1035484, 1399352, 1777054, 949282, 1360780, 1770136, 437398, 1599486, 1699816, 1758674, 1641648, 1178124, 1687824, 1158572, 1700334, 1105822, 433798, 1286908, 1385042, 816356, 772618, 1212032, 1328572, 461160, 707962, 1078522, 671576, 917724, 1736426, 709660, 387820, 1694816, 1110626, 1655400, 1727286, 1307308, 1253188, 396876, 1515336, 1727072, 1329100, 1592856, 882826, 405926, 1576854, 1350984, 620660, 822444, 1708340, 1775638, 1144936, 173548, 1413516, 1736768, 1207948, 1631914, 903378, 1087374, 1210008, 1741230, 806922, 59014, 1436092, 1738194, 932344, 1322294, 1696326, 1646726, 1646506, 881980, 1746570, 1171966, 1490124, 1676170, 1634954, 1775636, 1034400, 1744776, 1026604, 1775658, 993754, 1313502, 1723000, 1562070, 1400228, 983534, 1645696, 1728948, 1312930, 1166306, 1508458, 1589254, 1716630, 1173872, 781532, 1750344, 1212244, 500632, 1691646, 1758368, 289230, 1668048, 1692302, 958492, 1146014, 1265942, 1465244, 1135796, 9711, 1774800, 919872, 1609820, 1172996, 1750490, 1343868, 1767834, 787236, 1332354, 1262952, 1775616, 1704450, 1355438, 1070124, 857104, 642102, 1470462, 708578, 957106, 577248, 1198640, 1587302, 130064, 1397484, 1760530, 446134, 1252484, 1508164, 1227322, 519442, 1553532, 1503118, 164058, 1029638, 1725682, 980770, 1512962, 1368248, 1623512, 1657248, 1235124, 647428, 1779176, 1309202, 1483872, 1454570, 1745282, 1775620, 833442, 382002, 1661428, 22169, 1025026, 1352468, 1000574, 1741512, 1547268, 1636712, 1764962, 712010, 25584, 1544802, 1441478, 314462, 719002, 1241254, 1693602, 1561724, 405282, 1686008, 1273748, 1405812, 1749818, 1751808, 1633292, 866460, 1646770, 809994, 1470810, 1248974, 1166070, 1109926, 1455016, 1749520, 1469706, 1735948, 1644086, 1334868, 1217894, 1560080, 1336378, 1607124, 953976, 1676008, 1707250, 1779452, 1075334, 1318256, 1629910, 882488, 642078, 860444, 1667934, 47817, 1285808, 951684, 1493228, 1727778, 963412, 1762882, 1564144, 1620210, 1614452, 1294240, 1282020, 1297394, 1211292, 1575278, 354176, 1440516, 1779540, 866196, 1338454, 1297194, 1305806, 1719922, 1692472, 225796, 1144726, 1086834, 958750, 1036542, 1681280, 1446594, 362632, 1109736, 1078568, 1744616, 1137010, 1618116, 1316370, 1426718, 1199596, 1746202, 65330, 1636576, 580466, 980450, 366280, 1191946, 1001946, 1567262, 556248, 1456124, 1343636, 383576, 1783614, 1383496, 1350750, 1349250, 1724724, 53670, 1751882, 1244898, 649070, 1027342, 1586184, 1017116, 947098, 1056766, 1597674, 1289588, 1482296, 555100, 1353212, 20366, 805992, 1444308, 1240248, 1648522, 1475534, 971496, 1783292, 763172, 356030, 1637982, 1672626, 1039062, 1523224, 1569384, 706978, 1749826, 1262202, 1311964, 1277924, 1510954, 1608768, 1481126, 1319066, 520116, 1758860, 722416, 1404946, 1662630, 1629308, 1654884, 1697332, 172572, 1343252, 1296184, 1334796, 629142, 1078102, 821312, 22878, 861624, 1720450, 1422530, 756914, 1314970, 21386, 1645828, 1644828, 1354592, 47806, 970600, 1751740, 1004034, 1079198, 1631686, 1450524, 1172526, 1132057, 1513500, 354422, 1278642, 1308290, 1626928, 1642074, 1492086, 1678908, 1470550, 1400924, 1437938, 1538348, 1087426, 1575564, 1205024, 486628, 1715520, 1692502, 1419186, 1749824, 1713660, 1410218, 1518026, 1562632, 1362796, 1303294, 1207662, 1467808, 1755282, 1201882, 1669982, 1381896, 1246246, 1324688, 1014354, 980798, 1194906, 1304160, 1609014, 1744324, 1193034, 1713612, 889558, 1496348, 1328642, 1759418, 1758912, 1374742, 267560, 674608, 1434318, 511934, 714724, 1105778, 809410, 1142564, 1647778, 1600118, 1697200, 700886, 1148688, 1358300, 1609926, 1415652, 1612066, 609956, 1302610, 745420, 622414, 808622, 1701092, 969388, 1663770, 1316578, 1414842, 796014, 776634, 1629588, 1424464, 1716586, 1283930, 151198, 1541226, 1670680, 1020950, 1561436, 1638634, 1529146, 1716356, 1258436, 1239544, 12318, 1124970, 48456, 1401134, 1581488, 1026214, 1540038, 1337374, 1340652, 1682266, 1002030, 1641478, 1589870, 1421116, 1777758, 1228434, 802808, 1299656, 1743420, 1514560, 799014, 991630, 1593440, 1402966, 1346050, 1241518, 1587320, 1342418, 35351, 792902, 11174, 1033356, 1000888, 1689384, 1744036, 535622, 1075642, 1768690, 1595156, 1167778, 1362870, 597442, 756480, 1662608, 1690994, 1107524, 1380352, 1023062, 80940, 1427866, 1548430, 822660, 1612620, 1744980, 1689476, 1537090, 884946, 1552806, 1637244, 1320942, 1716148, 1651758, 81368, 1753506, 217000, 312662, 94432, 1787720, 1211366, 1090870, 1456946, 1419490, 1557558, 758582, 1357600, 766592, 484342, 460570, 818990, 1171564, 1584662, 268632, 1651774, 1755680, 695656, 1706436, 1692008, 1466840, 882422, 1697790, 1568060, 1545984, 1668266, 625078, 1331290, 470288, 1506356, 1546278, 663278, 1088442, 1293070, 1200530, 1547608, 529438, 982914, 19332, 1474224, 1346834, 1631652, 1586464, 1703932, 778226, 1467886, 1247516, 1158058, 646070, 1646050, 1442430, 890810, 934680, 1686802, 1567888, 682484, 802794, 1305992, 1555808, 1050632, 653846, 1724206, 997636, 1764020, 1154218, 1609282, 1663666, 1249876, 662390, 907386, 1243474, 1335962, 1548410, 706204, 17503, 1573894, 1313542, 900434, 1532188, 1303806, 429364, 1532952, 1451100, 1554318, 1695856, 1249018, 1629270, 169638, 1320446, 1358068, 1608162, 1586100, 1775384, 360920, 1030774, 1355690, 1195366, 1178394, 1538634, 1365038, 1381590, 1434786, 1679734, 1731896, 1350412, 1503370, 516062, 1155840, 1630748, 1254172, 781502, 856490, 357726, 1422940, 1618618, 1739202, 1322880, 1578098, 1201054, 622106, 1049092, 1605258, 1336008, 918870, 763774, 1210652, 980984, 1527300, 1562008, 1479342, 1763844, 1471136, 1515506, 799974, 1071470, 1436136, 846272, 1324950, 1217948, 1245870, 1662906, 1304740, 1145678, 1121284, 1551656, 1337000, 776236, 563066, 1248732, 1266780, 1566320, 1237194, 1558098, 1605992, 673222, 1387194, 1273474, 1041426, 607048, 1419330, 1282932, 1120038, 1515256, 1535972, 1539514, 835824, 1614488, 1287142, 1607634, 1272450, 937208, 1321016, 1341538, 1515826, 1723588, 1189688, 1010586, 1472122, 900464, 371090, 1424326, 1479540, 1580600, 1706344, 311538, 1593020, 1313410, 1382482, 1770030, 1548060, 1349938, 1294046, 551498, 48023, 1114060, 1320790, 1084894, 1282080, 1639836, 1040216, 1357674, 1169378, 1621394, 1211596, 1627912, 1724978, 1556988, 1198108, 1457362, 1309166, 1309954, 950614, 1655614, 382786, 1617524, 894308, 1544644, 752706, 1311542, 479440, 1538794, 874166, 685550, 1226578, 1420198, 642410, 1422532, 86656, 994740, 1076168, 995922, 922600, 1443750, 1312844, 1595730, 1657392, 1294186, 1546884, 1767758, 1590202, 1049854, 1299240, 785066, 1567526, 886614, 1210580, 639654, 1576340, 1660066, 826392, 1568624, 1145430, 369662, 1154322, 1330540, 1411966, 1343662, 1566316, 1594184, 777654, 782428, 1465948, 1055398, 1156926, 817338, 1575586, 1575790, 1643006, 1354088, 1297370, 1699476, 1543228, 1687538, 1052118, 1009452, 1764092, 1512578, 1472630, 1356020, 1691942, 963416, 1281518, 1430842, 1500070, 1500948, 1608308, 1535976, 1027212, 1671408, 1341268, 9463, 660600, 1558398, 221674, 1492794, 1420028, 1570570, 904462, 881210, 1033944, 1212546, 1289352, 1227664, 1106646, 1660470, 977360, 482834, 1397392, 1009254, 1609392, 672600, 1623846, 19603, 1796734, 1549448, 1245526, 807580, 1603694, 1472500, 1581082, 1134722, 1203894, 1181526, 1230848, 705934, 1566326, 363854, 1034284, 1014776, 808912, 1656620, 1466230, 370636, 1032334, 249130, 1300216, 1319662, 1280456, 1646794, 1564738, 1103448, 65830, 1196394, 1064766, 1296728, 1593076, 1296510, 579338, 631128, 1101194, 1327920, 120042, 609984, 1188846, 426570, 1467412, 866696, 744606, 1495670, 1279322, 505208, 1324996, 1154338, 939962, 1271992, 1208618, 1093734, 1365480, 1168848, 1478318, 878484, 778084, 28295, 1073793, 1399390, 1024888, 1748844, 1360966, 1662160, 1648774, 1162064, 1229086, 1052304, 1473530, 837958, 1724376, 1210796, 746014, 1181900, 1220372, 877482, 1493144, 1326802, 1560456, 427530, 1644554, 1094808, 1239022, 1619728, 1658166, 1062284, 1551066, 1591688, 1589856, 1267892, 1596850, 674764, 1658968, 1401479, 1153784, 1319746, 1384236, 948830, 1330272, 1256744, 1475808, 1506372, 548278, 1609984, 246392, 1322574, 1349958, 548068, 797038, 673420, 1621894, 1570568, 1649714, 1534654, 700300, 1693348, 1506550, 1305358, 1252630, 991290, 1747522, 931038, 1756026, 246652, 761790, 1517150, 1667618, 310112, 1138168, 1498364, 1420982, 43718, 1693396, 1485842, 1396072, 1357688, 1345324, 1568166, 1697086, 1320344, 1181546, 1364804, 990850, 1656358, 825690, 1465024, 857896, 534376, 246314, 390866, 1262158, 1703882, 1323462, 340844, 603014, 1552596, 230590, 1605732, 1396322, 1315568, 628222, 1208638, 1388250, 1587422, 578112, 1666402, 1487510, 1479726, 56582, 886300, 857162, 618736, 1736616, 919038, 1321544, 1777904, 1203292, 645126, 99554, 1627244, 752658, 1065250, 1255560, 419318, 1137616, 513018, 754694, 1020866, 1245088, 1378412, 1135088, 1321548, 1077472, 1106662, 164554, 1324998, 967058, 1630476, 11475, 1400916, 1594918, 693188, 1419388, 1627896, 665042, 1702782, 903526, 1630644, 1646098, 1742056, 1463186, 1463512, 701636, 1138310, 1594746, 1168666, 1609622, 1400360, 992114, 1086390, 1569462, 1666930, 1438206, 902734, 1576314, 1206542, 246154, 1459272, 1426010, 1023200, 1710932, 670034, 1562640, 1700026, 1121254, 791802, 1189488, 1154100, 221696, 646056, 835234, 1630106, 1374394, 1627276, 1257908, 1591570, 1587120, 1506352, 1547948, 729552, 701570, 1389128, 405456, 973918, 865646, 1077838, 1233396, 1458240, 1279620, 911318, 382066, 1104380, 652438, 1317972, 1116366, 1761488, 1396126, 920544, 204776, 438552, 1130832, 1609494, 1679872, 1229416, 1227222, 1054034, 1454068, 1316576, 21323, 1027812, 1359608, 1253100, 1259602, 1516790, 125958, 778112, 47963, 1084120, 1460728, 633832, 1023976, 60792, 1580786, 1679516, 1016536, 1426300, 924794, 1576596, 602084, 1775908, 1186394, 1054814, 1450282, 846662, 1473838, 798580, 477958, 1319770, 1643774, 1051548, 1407832, 1400140, 1277772, 534066, 1002676, 1568136, 776466, 1187514, 1509816, 702210, 1461696, 832862, 1070458, 111712, 958532, 197828, 1089744, 481002, 1381906, 648112, 293534, 421328, 803378, 1412422, 1587732, 1566876, 627032, 582636, 496050, 767596, 308072, 1391308, 648118, 771164, 1776276, 1336522, 254180, 1250572, 808532, 1643388, 940604, 609992, 1220616, 1202008, 752950, 788514, 1541542, 1362988, 359550, 1558718, 38917, 1608616, 1299396, 607218, 159070, 1617804, 1671020, 1623028, 1746206, 1089570, 1461156, 1598388, 504270, 1315926, 928858, 708674, 1389568, 1443358, 1049802, 297390, 16646, 445534, 1322796, 1320404, 1446964, 1506370, 1312042, 1209220, 577622, 1444632, 1613974, 358540, 1281336, 1017568, 1223302, 1395714, 1259422, 76052, 1563886, 723522, 962556, 254186, 1192848, 938560, 1242880, 1540668, 1379740, 1630400, 1529576, 736940, 1485210, 1242504, 1706514, 1568960, 1218130, 1626832, 1489982, 1731180, 1466532, 1288400, 1435554, 514182, 1334840, 1717430, 1555166, 480894, 654680, 1340610, 1463992, 1578270, 1143726, 1521110, 44689, 410170, 81094, 924704, 1772240, 702440, 1341322, 808904, 1576856, 1593954, 1412986, 1488790, 1577518, 1650770, 812588, 1368106, 1561426, 1715720, 1245130, 1000812, 1297528, 1496356, 1105026, 1079032, 1435230, 574876, 1310800, 1531584, 1317756, 1457292, 1350264, 842934, 1673770, 978852, 1339192, 1375375, 1121650, 641868, 1375217, 72466, 870252, 1269662, 1559408, 1568344, 499632, 1619768, 1345304, 1121448, 879166, 1705248, 1420080, 1287196]
  end

  def get_results
    ids = get_ids
    ids.each do |id|
      p "fetch data"
      instance_attributes = {}
      url = "/#{id}?fields[course]=@all"
      # if !Course.where(platform_id: id)
      #   p "#{id} already exists"
      #   next
      # else

      response = self.class.get(url, @options)
      case response.code
      when 404
        puts response

        break
      when 429
        puts response
        break
      when 400
        puts response
        break
      when 443
        puts "#{id}"
        puts response
        break
      else
        if Course.where(platform: "udemy", platform_id: response["id"]).size != 0
          p "already exists in db"
          next
        else
          p response["price"]
          p response["discount"]
          p "next --------"

          instance_attributes[:platform_id] = response["id"]
          instance_attributes[:platform] = "udemy"
          instance_attributes[:title] = response["title"]
          instance_attributes[:subtitle] = nil
          instance_attributes[:description] = remove_strong_tags(response["description"])
          instance_attributes[:categories] = categories(response)
          instance_attributes[:price] = edit_price(response["price"], response["discount"])
          instance_attributes[:price_unit] = price_unit(response)
          instance_attributes[:image] = response["image_100x100"]
          instance_attributes[:organization] = nil
          instance_attributes[:url] = create_url(response["url"])
          instance_attributes[:active] = active_status(response["status_label"])
          instance_attributes[:language] = "english"
          instance_attributes[:instructor] = instructors(response["visible_instructors"])
          instance_attributes[:duration] = get_duration(response["estimated_content_length"].to_s) +" "+get_duration_unit(response["estimated_content_length"])
          instance_attributes[:duration_unit] = get_duration_unit(response["estimated_content_length"])
          instance_attributes[:knowledge_level] = skill_level(response["instructional_level"])
          instance_attributes[:completion_time] = get_completion_time(response["estimated_content_length"])

          i = Course.new(instance_attributes)
          i.save!
          p "finished with #{i}"
        end
      end
      #p instance_attributes
    end
    #return instance_attributes
  end

  def price_unit(input)
    if input["is_paid"] == false || input["is_paid"].nil?
      "€"
    elsif !input["price_detail"]["currency_symbol"].nil?
      input["price_detail"]["currency_symbol"]
    else
      nil
    end
  end

  def get_duration(duration)
    if !duration.nil?
      a = (duration.to_i / 60).to_s
      if a == "0"
        "1"
      else
        a
      end
    else
      nil
    end
  end

  def get_duration_unit(duration)
    if !duration.nil? && (duration.to_i / 60) < 2
      "hour"
    elsif  !duration.nil?
      "hours"
    else
      nil
    end
  end

  def categories(course)

    title = course["title"]
    description = course["description"]
    joined_string = title + description
    categories = CategoryHelper.call(joined_string)
    subjects_hash = {}
    subjects_hash["categories"] = categories
    subjects_hash
    # if !cat_primary.nil? && !cat_sub.nil?
    #   subjects_array = [cat_primary, cat_sub]
    # elsif !cat_primary.nil? && cat_sub.nil?
    #   subjects_array = [cat_primary]
    # elsif cat_primary.nil? && !cat_sub.nil?
    #   subjects_array = [cat_sub]
    # else
    #   return nil
    # end


  end

  def remove_strong_tags(description)
    doc = Nokogiri::HTML("#{description}")
    doc.css('strong').each { |node| node.replace(node.children) }
    doc.to_s
    # doc.at_xpath("//p").to_s
  end

  def get_completion_time(content_length)
    hours_of_content = content_length.to_i / 60
    if hours_of_content > 17
      return "long"
    else
      return "short"
    end
  end

  def active_status(input)
    if input == "Live" && !input.nil?
      true
    else
      false
    end
  end

  def instructors(input)
    if !input.nil?
      instructor_array = input
      instructors_array = []
      instructor_array.each do |instructor|
        instructor_hash = {}
        instructor_hash["name"] = instructor["title"]
        instructor_hash["image"] = instructor["image_100x100"]
        instructor_hash["bio"] = instructor["job_title"]
        instructors_array << instructor_hash
      end
      instructors_hash = {}
      instructors_hash["instructors"] = instructors_array
      instructors_hash
    else
      nil
    end
  end

  def skill_level(input)
    if input == "All Levels"
      return 1
    elsif input == "Beginner Level"
      return 0
    elsif input == "Intermediate Level"
      return 1
    elsif input == "Expert Level"
      return 2
    else
      nil
    end
  end

  def create_url(input)
    return "https://www.udemy.com#{input}"
  end

  def edit_price(list, discount)
    if list == "Free"
      0
    elsif discount["price"]["amount"] != discount["list_price"]["amount"]
      discount["price"]["amount"]
    else
      discount["list_price"]["amount"]
    end
  end

end
