import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/detail_distribute_trees_respone_model.dart';
import '../resources/app_constants.dart';
import '../resources/token.dart';

class DetailDistributeTreesService {
  String url = AppConstants.apiUrl;

  Future<DetailDistributeTreesRespone> getDetail() async {
    String detailtreeurl = "$url/users/detail_distribute_trees";

    print(url);

    try {
      final response = await http.get(
        Uri.parse(detailtreeurl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Cache-control': 'no-cache',
          'Accept': 'application/json',
          'Authorization': 'Bearer $globalAccessToken',
        },
      );

      if (response.statusCode == 200) {
        return DetailDistributeTreesRespone.fromJson(jsonDecode(response.body));
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
