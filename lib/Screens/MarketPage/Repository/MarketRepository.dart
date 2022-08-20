import 'package:cryptodesign/API/remote/network/ApiEndPoints.dart';
import 'package:cryptodesign/API/remote/network/BaseApiService.dart';
import 'package:cryptodesign/API/remote/network/NetworkApiService.dart';
import 'package:cryptodesign/Screens/MarketPage/Model/Markets.dart';

class MarketRepository {
  final BaseApiService _apiService = NetworkApiService();

  Future<Markets?> getMarketList() async {
    try {
      dynamic response =
          await _apiService.getResponse(ApiEndPoints().getMarket);
      print("Market########: $response");
      final jsonData = Markets.fromJson({'MarketData': response});
      return jsonData;
    } catch (e) {
      throw e;
    }
  }
}
