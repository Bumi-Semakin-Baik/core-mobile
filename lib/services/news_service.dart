import 'dart:convert';

import 'package:bumibaik_app/models/news_model.dart';
import 'package:bumibaik_app/resources/app_constants.dart';
import 'package:http/http.dart' as http;

class NewsService {
  Future<List<NewsModel>> getNews() async {
    try {
      final response = await http.get(
        Uri.parse("${AppConstants.apiUrl}news"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Cache-control': 'no-cache',
        },
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body)['data'];
        List<NewsModel> newsData = [];

        for (var item in data) {
          newsData.add(NewsModel.fromJson(item));
        }

        print(newsData);

        return newsData;
      } else {
        print(response.statusCode);
        throw Exception("ehe");
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
