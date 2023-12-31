import 'dart:convert';

import 'package:new_bumi_baik/models/news_model.dart';
import 'package:new_bumi_baik/models/tree_scan_detail_model.dart';
import 'package:new_bumi_baik/resources/app_constants.dart';
import 'package:http/http.dart' as http;

import '../resources/token.dart';

class TreeService {
  String treeUrl = "${AppConstants.apiUrl}/trees";

  Future<List<NewsModel>> getNews() async {
    String url = treeUrl;

    print(url);

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Cache-control': 'no-cache',
          'Accept': 'application/json',
          'Authorization': 'Bearer $globalAccessToken',
        },
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body)['data'];
        List<NewsModel> newsData = [];

        for (var item in data) {
          newsData.add(NewsModel.fromJson(item));
        }

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

  Future<TreeScanDetailModel> getTreeScanDetails(String code) async {
    String url = "$treeUrl/scan/$code";

    print(url);

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Cache-control': 'no-cache',
          'Accept': 'application/json',
          'Authorization': 'Bearer $globalAccessToken',
        },
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body)['data'];

        return TreeScanDetailModel.fromJson(data);
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
