import 'package:flutter/material.dart';
import 'package:crypto_stock_tracker_flutter/components/reusable_card_dataCoinTitle.dart';
import 'package:crypto_stock_tracker_flutter/components/reusable_card.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class CoinDataPage extends StatefulWidget {
  @override
  _CoinDataPageState createState() => _CoinDataPageState();
}

class _CoinDataPageState extends State<CoinDataPage> {
  int colorButton = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        // centerTitle: true,
        title: Text(
          'Coin Data',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 21.0),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_back,
                size: 22.0,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0.0),
          child: Column(
            children: [
              Container(
                child: ReusableCardDataCoinTitle(
                  color: Color(0xff26243b),
                  // color: Colors.grey[900],
                  cardChild: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 26.0, horizontal: 28.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Bitcoin',
                                        style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),
                                      ),
                                      SizedBox(
                                        width: 3.0,
                                      ),
                                      Text(
                                        '(BTC)',
                                        style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold, color: Colors.white70),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 7.0,
                                  ),
                                  Text('50,000', style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold, color: Colors.white)),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    '+ 4.65%',
                                    style: TextStyle(fontSize: 20.0, color: Colors.green, fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 7.0,
                                  ),
                                  Text(
                                    '+ 2600',
                                    style: TextStyle(fontSize: 32.0, color: Colors.green, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                // decoration: BoxDecoration(
                //   color: Color(0xffFFFFFF),
                //
                //   // border: Border(
                //   //   bottom: BorderSide(color: Colors.white10, width: 2.0),
                //   // ),
                // ),
                child: Column(
                  children: [
                    //
                    //
                    /// Chart
                    SfCartesianChart(),
                    //
                    //
                    /// butoons Chart
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //
                        ///button 1D
                        MaterialButton(
                            onPressed: () {
                              setState(() {
                                colorButton = 1;
                              });
                            },
                            child: Text('1D'),
                            minWidth: 0,
                            color: colorButton == 1 ? Colors.grey[500] : Colors.grey[300]),

                        ///button 1W
                        MaterialButton(
                            onPressed: () {
                              setState(() {
                                colorButton = 2;
                              });
                            },
                            child: Text('1W'),
                            minWidth: 0,
                            color: colorButton == 2 ? Colors.grey[500] : Colors.grey[300]),

                        ///button 1M
                        MaterialButton(
                            onPressed: () {
                              setState(() {
                                colorButton = 3;
                              });
                            },
                            child: Text('1M'),
                            minWidth: 0,
                            color: colorButton == 3 ? Colors.grey[500] : Colors.grey[300]),

                        ///button 3M
                        MaterialButton(
                            onPressed: () {
                              setState(() {
                                colorButton = 4;
                              });
                            },
                            child: Text('3M'),
                            minWidth: 0,
                            color: colorButton == 4 ? Colors.grey[500] : Colors.grey[300]),

                        ///button 6M
                        MaterialButton(
                            onPressed: () {
                              setState(() {
                                colorButton = 5;
                              });
                            },
                            child: Text('6M'),
                            minWidth: 0,
                            color: colorButton == 5 ? Colors.grey[500] : Colors.grey[300]),

                        ///button 1Y
                        MaterialButton(
                            onPressed: () {
                              setState(() {
                                colorButton = 6;
                              });
                            },
                            child: Text('1Y'),
                            minWidth: 0,
                            color: colorButton == 6 ? Colors.grey[500] : Colors.grey[300]),

                        ///button MAX
                        MaterialButton(
                            onPressed: () {
                              setState(() {
                                colorButton = 7;
                              });
                            },
                            child: Text('MAX'),
                            minWidth: 0,
                            color: colorButton == 7 ? Colors.grey[500] : Colors.grey[300]),
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ReusableCard(
                            color: Colors.green,
                            cardChild: Text(
                              'fff',
                              style: TextStyle(fontSize: 120.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                    // Container(
                    //   height: 80,
                    //   width: 100,
                    //   color: Colors.red,
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<ChartSampleData> getChartData() {}
}

class ChartSampleData {
  ChartSampleData({this.low, this.high, this.close, this.open, this.x});
  final DateTime x;
  final num open;
  final num close;
  final num low;
  final num high;
}
