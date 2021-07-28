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
    final List<SalesData> chartData = [
      SalesData(2000, 12),
      SalesData(2001, 18),
      SalesData(2002, 14),
      SalesData(2003, 24),
      SalesData(2004, 28),
      SalesData(2005, 34),
      SalesData(2006, 32),
      SalesData(2007, 40)
    ];
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.grey[300],
        // centerTitle: true,
        title: Text(
          '',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 5.0),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.add_alert,
                size: 22.0,
                color: Colors.black,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.more_vert,
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
          child: Container(
            decoration: BoxDecoration(
                // borderRadius: BorderRadius.only(topRight: Radius.circular(20.0), topLeft: Radius.circular(20.0)),
                color: Color(0xff26243b)),
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
                  decoration: BoxDecoration(
                    color: Colors.white12,
                    borderRadius: BorderRadius.only(topRight: Radius.circular(25.0), topLeft: Radius.circular(25.0)),
                    // border: Border(
                    //   bottom: BorderSide(color: Colors.white10, width: 2.0),
                    // ),
                  ),
                  child: Column(
                    children: [
                      //
                      //
                      /// Chart
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: SfCartesianChart(
                          plotAreaBorderWidth: 0.0,
                          // primaryXAxis: CategoryAxis(),
                          primaryYAxis: NumericAxis(
                            labelStyle: TextStyle(color: Colors.white),
                            opposedPosition: true,
                            majorGridLines: MajorGridLines(width: 0),
                            majorTickLines: MajorTickLines(width: .0),
                            axisLine: AxisLine(width: 0),
                            // axisLine: AxisLine(color: Colors.deepOrange, width: 2, dashArray: <double>[5, 5]),
                            isInversed: false,
                            rangePadding: ChartRangePadding.additional,
                          ),
                          primaryXAxis: NumericAxis(
                            labelStyle: TextStyle(color: Colors.white),
                            // isVisible: false,
                            majorGridLines: MajorGridLines(width: 0),
                            majorTickLines: MajorTickLines(width: .0),
                            axisLine: AxisLine(width: 0),
                          ),
                          series: <ChartSeries>[
                            // Initialize line series
                            FastLineSeries<SalesData, double>(
                                color: Color(0xff149552),
                                width: 1.2,
                                dataSource: chartData,
                                xValueMapper: (SalesData sales, _) => sales.year,
                                yValueMapper: (SalesData sales, _) => sales.sales),
                          ],
                        ),
                      ),
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
                              child: Text('1D', style: TextStyle(color: Colors.white)),
                              minWidth: 0,
                              color: colorButton == 1 ? Color(0xff524b80) : Color(0xff302b4f)),

                          ///button 1W
                          MaterialButton(
                              onPressed: () {
                                setState(() {
                                  colorButton = 2;
                                });
                              },
                              child: Text('1W', style: TextStyle(color: Colors.white)),
                              minWidth: 0,
                              color: colorButton == 2 ? Color(0xff524b80) : Color(0xff302b4f)),

                          ///button 1M
                          MaterialButton(
                              onPressed: () {
                                setState(() {
                                  colorButton = 3;
                                });
                              },
                              child: Text('1M', style: TextStyle(color: Colors.white)),
                              minWidth: 0,
                              color: colorButton == 3 ? Color(0xff524b80) : Color(0xff302b4f)),

                          ///button 3M
                          MaterialButton(
                              onPressed: () {
                                setState(() {
                                  colorButton = 4;
                                });
                              },
                              child: Text('3M', style: TextStyle(color: Colors.white)),
                              minWidth: 0,
                              color: colorButton == 4 ? Color(0xff524b80) : Color(0xff302b4f)),

                          ///button 6M
                          MaterialButton(
                              onPressed: () {
                                setState(() {
                                  colorButton = 5;
                                });
                              },
                              child: Text('6M', style: TextStyle(color: Colors.white)),
                              minWidth: 0,
                              color: colorButton == 5 ? Color(0xff524b80) : Color(0xff302b4f)),

                          ///button 1Y
                          MaterialButton(
                              onPressed: () {
                                setState(() {
                                  colorButton = 6;
                                });
                              },
                              child: Text('1Y', style: TextStyle(color: Colors.white)),
                              minWidth: 0,
                              color: colorButton == 6 ? Color(0xff524b80) : Color(0xff302b4f)),

                          ///button MAX
                          MaterialButton(
                              onPressed: () {
                                setState(() {
                                  colorButton = 7;
                                });
                              },
                              child: Text('MAX', style: TextStyle(color: Colors.white)),
                              minWidth: 0,
                              color: colorButton == 7 ? Color(0xff524b80) : Color(0xff302b4f)),
                        ],
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: ReusableCard(
                                color: Color(0xff26243b),
                                cardChild: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 4.0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text('market cap rank:', style: TextStyle(color: Colors.white60)),
                                                Text('1', style: TextStyle(color: Colors.white))
                                              ],
                                            ),
                                            SizedBox(height: 25.0),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text('high 24h:', style: TextStyle(color: Colors.white60)),
                                                Text('40347', style: TextStyle(color: Colors.white))
                                              ],
                                            ),
                                            SizedBox(height: 25.0),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [Text('low 24h:', style: TextStyle(color: Colors.white60)), Text('36277', style: TextStyle(color: Colors.white))],
                                            ),
                                            SizedBox(height: 25.0),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text('24h Volume:', style: TextStyle(color: Colors.white60)),
                                                Text('41667733566', style: TextStyle(color: Colors.white))
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 15.0,
                                      ),
                                      Expanded(
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text('circulating supply:', style: TextStyle(color: Colors.white60)),
                                                Text('18767993', style: TextStyle(color: Colors.white))
                                              ],
                                            ),
                                            SizedBox(height: 25.0),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text('max supply:', style: TextStyle(color: Colors.white60)),
                                                Text('21000000', style: TextStyle(color: Colors.white))
                                              ],
                                            ),
                                            SizedBox(height: 25.0),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text('all time high:', style: TextStyle(color: Colors.white60)),
                                                Text('64805', style: TextStyle(color: Colors.white))
                                              ],
                                            ),
                                            SizedBox(height: 25.0),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text('ATH change %:', style: TextStyle(color: Colors.white60)),
                                                Text('-42.50536', style: TextStyle(color: Colors.white))
                                              ],
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                )),
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
      ),
    );
  }

  List<ChartSampleData> getChartData() {}
}

class ChartSampleData {
  ChartSampleData({this.day, this.price});
  final String day;
  final double price;
  // final num open;
  // final num close;
  // final num low;
  // final num high;
}

class SalesData {
  SalesData(this.year, this.sales);
  final double year;
  final double sales;
}
