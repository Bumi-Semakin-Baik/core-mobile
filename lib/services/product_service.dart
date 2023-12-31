import 'dart:convert';

import 'package:new_bumi_baik/models/news_model.dart';
import 'package:new_bumi_baik/models/product_adopt_model.dart';
import 'package:new_bumi_baik/models/product_planting_model.dart';
import 'package:new_bumi_baik/resources/app_constants.dart';
import 'package:http/http.dart' as http;

import '../resources/token.dart';

class ProductService {
  String productUrl = "${AppConstants.apiUrl}/products";

  Future<List<ProductAdoptModel>> getProductAdopt() async {
    String url = "$productUrl/adopt";

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

  Future<ProductAdoptModel> getProductAdoptDetail(int id) async {
    String url = "$productUrl/adopt/$id";

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

        return ProductAdoptModel.fromJson(data);
      } else {
        print(response.statusCode);
        throw Exception("ehe");
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<ProductPlantingModel> getProductPlantingDetail(int id) async {
    String url = "$productUrl/planting/$id";

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

        return ProductPlantingModel.fromJson(data);
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
