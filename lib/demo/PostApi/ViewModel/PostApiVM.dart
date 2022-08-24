import 'package:cryptodesign/API/remote/response/ApiResponse.dart';
import 'package:cryptodesign/demo/PostApi/Model/PostApiModel.dart';
import 'package:cryptodesign/demo/PostApi/Repository/PostApiRepository.dart';
import 'package:flutter/material.dart';

class PostApiVM extends ChangeNotifier {
  final _myRepo = PostApiRepository();

  ApiResponse<PostApiModel> postapi = ApiResponse.loading();

  void _setPostApi(ApiResponse<PostApiModel> response) {
    print("PostVM :: $response");
    postapi = response;
    notifyListeners();
  }

  Future<void> fetchPostApi(Map<String, dynamic> body) async {
    _setPostApi(ApiResponse.loading());
    _myRepo
        .postAPI(body)
        .then((value) => _setPostApi(ApiResponse.completed(value)))
        .onError((error, stackTrace) =>
            _setPostApi(ApiResponse.error(error.toString())));
  }
}
