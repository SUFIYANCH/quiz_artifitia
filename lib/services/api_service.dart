import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:quiz_artifitia/models/api_model.dart';

class ApiService {
  final Dio dio = Dio();

  Future<List<ApiModel>?> getData() async {
    try {
      Response response =
          await dio.get("https://nice-lime-hippo-wear.cyclic.app/api/v1/quiz");
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        var jsonResponse = json.encode(response.data);
        return apiModelFromJson(jsonResponse);
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
