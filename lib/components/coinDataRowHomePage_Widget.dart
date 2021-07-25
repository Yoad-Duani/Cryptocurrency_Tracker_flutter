import 'package:flutter/material.dart';

class CoinDataRowHomePageWidget extends StatelessWidget {
  const CoinDataRowHomePageWidget({
    // @required this.theAmountOfCoins,
    @required this.coinName,
    @required this.coinChangeValuePercentage,
    @required this.coinCurrentValue,
    @required this.coinSymbol,
    @required this.coinStringImage,
    @required this.keyIndex,
  });

  final int keyIndex;
  final String coinName;
  final String coinSymbol;
  final double coinChangeValuePercentage;
  final dynamic coinCurrentValue;
  // final int theAmountOfCoins;
  final String coinStringImage;
  // final String symbolCurrencyForComparison; TODO: add option to choose between dollar euros and more.

  @override
  Widget build(BuildContext context) {
    // return ListTile(
    //   tileColor: Colors.purple,
    //   key: Key('$keyIndex'),
    //title:
    return Container(
      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey[100], width: 1.5))),
      child: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Expanded(
                flex: 6,
                child: Row(
                  children: [
                    Image.network(
                      '$coinStringImage',
                      height: 30.0,
                      width: 30.0,
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('$coinName', style: TextStyle(color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.w400)),
                        Text('$coinSymbol', style: TextStyle(color: Colors.grey[500], fontSize: 14.0, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 4,
                child: Text(
                  "\$$coinCurrentValue",
                  textAlign: TextAlign.right,
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
              Expanded(
                flex: 4,
                child: Text("$coinChangeValuePercentage%",
                    style: TextStyle(color: getColorForChangeValuePercentage(coinChangeValuePercentage), fontSize: 18.0, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.right),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
    // );
  }

  Color getColorForChangeValuePercentage(double coinChangeValuePercentage) {
    if (coinChangeValuePercentage > 0) {
      return Colors.green;
    } else {
      if (coinChangeValuePercentage < 0) {
        return Colors.red;
      } else {
        return Colors.black;
      }
    }
  }
}
