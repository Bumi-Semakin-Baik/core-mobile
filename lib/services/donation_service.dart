import 'dart:convert';

import 'package:new_bumi_baik/models/news_model.dart';
import 'package:new_bumi_baik/models/product_adopt_model.dart';
import 'package:new_bumi_baik/models/product_planting_model.dart';
import 'package:new_bumi_baik/resources/app_constants.dart';
import 'package:http/http.dart' as http;

import '../models/detail_donasi_response_model.dart';
import '../models/list_donasi_response_model.dart';
import '../resources/token.dart';

class DonasiService {
  String productUrl = "${AppConstants.apiUrl}";
  // String productUrl1 = "${AppConstants.apiUrl1}";

  Future<List<ListDonasiResponseModel>> getListDonasi() async {
    String url = "$productUrl/donations";

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
        List<ListDonasiResponseModel> newsData = [];

        for (var item in data) {
          newsData.add(ListDonasiResponseModel.fromJson(item));
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


  Future<ListDonasiResponseModel> getDonasiDetail(int id) async {
    String url = "$productUrl/donations/$id";

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

        return ListDonasiResponseModel.fromJson(data);
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
