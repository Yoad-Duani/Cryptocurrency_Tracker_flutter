import 'package:crypto_stock_tracker_flutter/service/network.dart ';
import 'package:flutter/material.dart';

//https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&ids=bitcoin

const dataCoinURL_part1 = 'https://api.coingecko.com/api/v3/coins/markets';
// const dataCoinURL_part2 = 'order=market_cap_desc&per_page=100&page=1&sparkline=false';
const URL1 = 'URL';
const URL2 = 'URL';
const URL3 = 'URL';

class CoinDataModel {
  //
  Future<dynamic> getCoinData(String coinID, String currencyVS) async {
    NetworkingHelper networkingHelper = NetworkingHelper(url: '$dataCoinURL_part1?vs_currency=$currencyVS&ids=$coinID');
    var coinData = await networkingHelper.getData();
    return coinData;
  }

  //
  Future<dynamic> getCoinHistoricalData(String coinID, String currencyVS) {}

//Future<dynamic> getLocationWeather(Position location) async {
//     NetworkingHelper networkingHelper =
//         NetworkingHelper(url: '$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKeyOpenWeatherMap&units=metric');
//     var weatherData = await networkingHelper.getData();
//     return weatherData;
//   }
}
