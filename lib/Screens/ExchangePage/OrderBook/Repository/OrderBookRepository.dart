import 'package:cryptodesign/API/remote/network/ApiEndPoints.dart';
import 'package:cryptodesign/API/remote/network/BaseApiService.dart';
import 'package:cryptodesign/API/remote/network/NetworkApiService.dart';
import 'package:cryptodesign/Screens/ExchangePage/OrderBook/Model/OrderBookModel.dart';
import 'package:cryptodesign/Screens/MarketPage/Model/Markets.dart';

class OrderBookRepository {
  final BaseApiService _apiService = NetworkApiService();

  Future<OrderBookModel> getOrderBook() async {
    try {
      dynamic response =
          await _apiService.getResponse(ApiEndPoints().getOrderBook);
      print("OrderBook########: $response");
      final jsonData = OrderBookModel.fromJson(response);
      return jsonData;
    } catch (e) {
      throw e;
    }
  }
}
