import 'package:blott_assessment/helpers/assets/url.dart';
import 'package:dio/dio.dart';

import '../model/news_model.dart';
import 'dioClient.dart';

class BlottApi {
  final Dio dio = Dio();

  final baseUrl = Blotturl.baseUrl;
  Future<List<NewsModel>> fetchNews() async {
    try {
      final response = await ApiCall.getInstance().getReq(
        baseUrl,
        options: Options(headers: {
          'Content-Type': 'application/json',
        }),
      );

      List<dynamic> jsonData = response.data;
      return jsonData.map((json) => NewsModel.fromJson(json)).toList();
    } on DioException catch (e) {
      print('Error fetching news: ${e.message}');
      rethrow;
    }
  }
}
