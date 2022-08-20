import 'package:cryptodesign/API/remote/response/ApiResponse.dart';
import 'package:cryptodesign/Screens/ExchangePage/OrderBook/Model/OrderBookModel.dart';
import 'package:cryptodesign/Screens/ExchangePage/OrderBook/Repository/OrderBookRepository.dart';
import 'package:flutter/material.dart';

class OrderBookVM extends ChangeNotifier {
  final _myRepo = OrderBookRepository();

  ApiResponse<OrderBookModel> orderBook = ApiResponse.loading();

  void _setOrderBook(ApiResponse<OrderBookModel> response) {
    print("OrderBookVM :: $response");
    orderBook = response;
    notifyListeners();
  }

  Future<void> fetchMarkets() async {
    _setOrderBook(ApiResponse.loading());
    _myRepo
        .getOrderBook()
        .then((value) => _setOrderBook(ApiResponse.completed(value)))
        .onError((error, stackTrace) =>
            _setOrderBook(ApiResponse.error(error.toString())));
  }
}
