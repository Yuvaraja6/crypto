import 'package:cryptodesign/API/remote/response/ApiResponse.dart';
import 'package:cryptodesign/Screens/MarketPage/Model/Markets.dart';
import 'package:cryptodesign/Screens/MarketPage/Repository/MarketRepository.dart';
import 'package:flutter/material.dart';

class MarketVM extends ChangeNotifier {
  final _myRepo = MarketRepository();

  ApiResponse<Markets> markets = ApiResponse.loading();

  void _setMarket(ApiResponse<Markets> response) {
    print("MarketVM :: $response");
    markets = response;
    notifyListeners();
  }

  Future<void> fetchMarkets() async {
    _setMarket(ApiResponse.loading());
    _myRepo
        .getMarketList()
        .then((value) => _setMarket(ApiResponse.completed(value)))
        .onError((error, stackTrace) =>
            _setMarket(ApiResponse.error(error.toString())));
  }
}
