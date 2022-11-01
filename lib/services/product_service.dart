import 'dart:convert';

import 'package:bumibaik_app/models/news_model.dart';
import 'package:bumibaik_app/models/product_adopt_model.dart';
import 'package:bumibaik_app/models/product_planting_model.dart';
import 'package:bumibaik_app/resources/app_constants.dart';
import 'package:http/http.dart' as http;

import '../resources/token.dart';

class ProductService {
  String productUrl = "${AppConstants.apiUrl}/products";

  Future<List<ProductAdoptModel>> getProductAdopt() async {
    String url = "$productUrl/adopt";

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
        List<ProductAdoptModel> newsData = [];

        for (var item in data) {
          newsData.add(ProductAdoptModel.fromJson(item));
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

  Future<List<ProductPlantingModel>> getProductPlanting() async {
    String url = "$productUrl/planting";

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
        List<ProductPlantingModel> newsData = [];

        for (var item in data) {
          newsData.add(ProductPlantingModel.fromJson(item));
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
}
