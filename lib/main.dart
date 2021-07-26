// import 'file:///C:/yoad-new/study/flutter/Yoad-Git/crypto_stock_tracker_flutter/lib/screen/homePage/view/mainScreenPage_screen.dart';

import 'package:crypto_stock_tracker_flutter/screen/coinData/view/coinData_Screen.dart';
import 'package:crypto_stock_tracker_flutter/screen/mainScreenPage/view/mainScreenPage_screen.dart';
import 'package:crypto_stock_tracker_flutter/screen/portfolioPage/view/portfolioPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light(),
      // home: HomePage(),
      getPages: [
        GetPage(name: "/mainScreenPage", page: () => MainScreenPage()),
        GetPage(name: "/portfolioPage", page: () => PortfolioPage()),
        GetPage(name: "/coinDataPage", page: () => CoinDataPage())
      ],
      // initialRoute: "/mainScreenPage", //real start
      initialRoute: "/coinDataPage", //for test
    );
  }
}
