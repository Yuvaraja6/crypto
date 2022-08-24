import 'package:cryptodesign/API/remote/network/ApiEndPoints.dart';
import 'package:cryptodesign/API/remote/network/BaseApiService.dart';
import 'package:cryptodesign/API/remote/network/NetworkApiService.dart';
import 'package:cryptodesign/demo/PostApi/Model/PostApiModel.dart';

class PostApiRepository {
  final BaseApiService _apiService = NetworkApiService();

  Future<PostApiModel?> postAPI(Map<String, dynamic>? body) async {
    try {
      dynamic response =
          await _apiService.postResponse(ApiEndPoints().getData, body);

      print("Post########: $response");
      final jsonData = PostApiModel.fromJson(response);
      return jsonData;
    } catch (e) {
      throw e;
    }
  }
}
