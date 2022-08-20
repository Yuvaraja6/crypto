import 'dart:convert';

OrderBookModel orderBookFromJson(String str) =>
    OrderBookModel.fromJson(json.decode(str));

String orderBookToJson(OrderBookModel data) => json.encode(data.toJson());

class OrderBookModel {
  OrderBookModel({
    this.lastUpdateId,
    this.bids,
    this.asks,
  });

  int? lastUpdateId;
  List<List<String>>? bids;
  List<List<String>>? asks;

  factory OrderBookModel.fromJson(Map<String, dynamic> json) => OrderBookModel(
        lastUpdateId: json["lastUpdateId"],
        bids: List<List<String>>.from(
            json["bids"].map((x) => List<String>.from(x.map((x) => x)))),
        asks: List<List<String>>.from(
            json["asks"].map((x) => List<String>.from(x.map((x) => x)))),
      );

  Map<String, dynamic> toJson() => {
        "lastUpdateId": lastUpdateId,
        "bids": List<dynamic>.from(
            bids!.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "asks": List<dynamic>.from(
            asks!.map((x) => List<dynamic>.from(x.map((x) => x)))),
      };
}
