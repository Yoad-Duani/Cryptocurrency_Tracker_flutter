import 'dart:convert';

import 'package:flutter/foundation.dart';

Coin coinFromJson(String str) => Coin.fromJson(json.decode(str));

String userToJson(Coin data) => json.encode(data.toJson());

class Coin {
  String coinID;
  String coinName;
  String coinTicker;

  Coin({
    this.coinID,
    this.coinName,
    this.coinTicker,
  });

  factory Coin.fromJson(Map<String, dynamic> json) => Coin(
        coinID: json["coinID"],
        coinName: json['coinName'],
        coinTicker: json['coinTicker'],
      );

  Map<String, dynamic> toJson() => {
        'coinID': coinID,
        'coinName': coinName,
        'coinTicker': coinTicker,
      };
}
