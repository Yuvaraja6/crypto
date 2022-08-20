abstract class BaseApiService {
  final String baseUrl = "https://api.binance.com/api/v3/";

  Future<dynamic> getResponse(String url);
}
