import 'dart:math';

import 'package:crypto_stock_tracker_flutter/service/coinData.dart';
import 'package:crypto_stock_tracker_flutter/utils/databaseCoin.dart';
import 'package:flutter/material.dart';
import 'package:crypto_stock_tracker_flutter/components/coinDataRowHomePage_Widget.dart';
import 'package:crypto_stock_tracker_flutter/models/coinModel.dart';
import 'package:crypto_stock_tracker_flutter/utils/databaseCoin.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

extension Ex on double {
  double toPrecision(int n) => double.parse(toStringAsFixed(n));
}

class homePage extends StatefulWidget {
  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  dynamic coins;
  Future<dynamic> _coinFuture;
  Future<List<CoinDataRowHomePageWidget>> coinDataListFuture;
  List<CoinDataRowHomePageWidget> coinDataList = [];
  CoinDataModel coinDataModel = CoinDataModel();

  Future<List<CoinDataRowHomePageWidget>> updateUI(dynamic coinData, int numOfCoin) async {
    List<CoinDataRowHomePageWidget> coinDataListReturn = [];
    dynamic coinAPIdata;
    String coinName;
    String coinSymbol;
    double coinChangeValuePercentage;
    double coinCurrentValue;
    String coinStringImage;

    List<Future<dynamic>> multiHttpRequrest = [];
    for (var i = 0; i < numOfCoin; i++) {
      multiHttpRequrest.add(
        coinDataModel.getCoinData(coinData[i]['coinID'], 'usd'),
      );
    }
    final result = await Future.wait(multiHttpRequrest);

    for (var i = 0; i < numOfCoin; i++) {
      coinName = coinData[i]['coinName'];
      coinSymbol = coinData[i]['coinTicker'];
      coinAPIdata = result[i]; //todo: add option to choose between dollar euros and more.

      try {
        var formatPercentage = NumberFormat("###.0#", "en_US");
        var formatValue = NumberFormat("##0.0##", "en_US");
        coinChangeValuePercentage = (coinAPIdata[0]['price_change_percentage_24h']).toDouble();
        var coinChangeValuePercentageFormt = formatPercentage.format(coinChangeValuePercentage);
        coinCurrentValue = (coinAPIdata[0]['current_price']).toDouble();
        var coinCurrentValueFormat = formatValue.format(coinCurrentValue);
        coinStringImage = coinAPIdata[0]['image'];

        coinDataListReturn.add(
          CoinDataRowHomePageWidget(
            keyIndex: i,
            coinChangeValuePercentage: double.parse(coinChangeValuePercentageFormt),
            coinCurrentValue: coinCurrentValueFormat,
            coinName: coinName,
            coinStringImage: coinStringImage,
            coinSymbol: coinSymbol,
          ),
        );
      } catch (e) {
        print(e);
      }
    }

    // for (var i = 0; i < numOfCoin; i++) {
    //   coinName = coinData[i]['coinName'];
    //   coinSymbol = coinData[i]['coinTicker'];
    //   coinAPIdata = await coinDataModel.getCoinData(coinData[i]['coinID'], 'usd'); //todo: add option to choose between dollar euros and more.
    //
    //   var formatPercentage = NumberFormat("###.0#", "en_US");
    //   var formatValue = NumberFormat("###.0##", "en_US");
    //   coinChangeValuePercentage = (coinAPIdata[0]['price_change_percentage_24h']).toDouble();
    //   var coinChangeValuePercentageFormt = formatPercentage.format(coinChangeValuePercentage);
    //   coinCurrentValue = (coinAPIdata[0]['current_price']).toDouble();
    //   var coinCurrentValueFormat = formatValue.format(coinCurrentValue);
    //   coinStringImage = coinAPIdata[0]['image'];
    //
    //   coinDataListReturn.add(
    //     CoinDataRowHomePageWidget(
    //       coinChangeValuePercentage: double.parse(coinChangeValuePercentageFormt),
    //       coinCurrentValue: coinCurrentValueFormat,
    //       coinName: coinName,
    //       coinStringImage: coinStringImage,
    //       coinSymbol: coinSymbol,
    //     ),
    //   );
    // }
    return coinDataListReturn;
  }

  @override
  void initState() {
    super.initState();
    // await updateUI();
    // coinDataList = [];
    _coinFuture = getCoins();
    // var newCoin = Coin(coinName: 'test3', coinTicker: 'HF');
    // DBProvider.db.newCoin(newCoin);
    // var newCoin = Coin(coinName: 'test1', coinTicker: 'HF');
    // DBProvider.db.newCoin(newCoin);
  }

  getCoins() async {
    final _coinData = await DBProvider.db.getCoin();
    return _coinData;
  }

  // void initializesCoinDataList() {
  //   coinDataList = [];
  // }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _coinFuture,
      builder: (_, coinData) {
        // () async {
        // print('FutureBuilder 111');
        switch (coinData.connectionState) {
          case ConnectionState.none:
            return Container(child: Text('none 111')); // TODO: problem
          case ConnectionState.waiting:
            print('waiting 111');
            return LodingDataWidget(); // TODO: loading
          // case ConnectionState.active:
          case ConnectionState.done:
            print('done 111');
            {
              // coinDataList = [];
              coins = coinData.data;
              print(coins);
              print(coins.length);
              // print(coins[0]['coinName']);
              // print(coins);

              coinDataListFuture = updateUI(coins, coins.length);
              // print(coins.length);
              // initializesCoinDataList();
              return FutureBuilder(
                  future: coinDataListFuture,
                  builder: (_, updateUIBuilder) {
                    // print('FutureBuilder 222');
                    // if (coins != null) { //TODO: check if has data

                    switch (updateUIBuilder.connectionState) {
                      case ConnectionState.none:
                        {
                          return Container(child: Text('none 111')); // TODO: problem
                        }
                      case ConnectionState.waiting:
                        {
                          print('waiting 222');
                          return LodingDataWidget(); // TODO: loading
                        }
                      // case ConnectionState.active:
                      // return Container(child: Text('waiting')); // TODO: loading
                      case ConnectionState.done:
                        {
                          coinDataList = updateUIBuilder.data;
                          print('done 222');
                          // print(coinDataList.length);
                          // coinDataList = updateUIBuilder.data;
                          return Padding(
                            padding: const EdgeInsets.only(top: 8.0, bottom: 10.0, left: 8.0, right: 8.0),
                            child: Container(
                              constraints: BoxConstraints.expand(),
                              child: SafeArea(
                                child: Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.grey[300],
                                      ),
                                      height: 35.0,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            flex: 6,
                                            child: Text(
                                              'Coin',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 4,
                                            child: Text(
                                              'Last Price',
                                              textAlign: TextAlign.right,
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 4,
                                            child: Text(
                                              'Change (24h)',
                                              textAlign: TextAlign.right,
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 2.0),
                                          child: ListView(
                                            // onReorder: ((int oldIndex, int newIndex) {}),
                                            scrollDirection: Axis.vertical,
                                            shrinkWrap: true,
                                            // reverse: true,
                                            children: coinDataList,
                                            // CoinDataRowHomePageWidget(theAmountOfCoins: theAmountOfCoins),
                                            //
                                            //
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }
                      default:
                        return Container(child: Text('problem A'));
                    }
                  });
            }
          default:
            return Container(child: Text('problem B'));
        }
      },
    );
  }
}

class LodingDataWidget extends StatelessWidget {
  const LodingDataWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Loading...',
            style: TextStyle(
              fontSize: 35.0,
              fontWeight: FontWeight.bold,
              color: Colors.grey[700],
            ),
          ),
          SizedBox(height: 20.0),
          SpinKitRing(
            color: Colors.grey[700],
            size: 100.0,
          ),
        ],
      ),
    );
  }
}
