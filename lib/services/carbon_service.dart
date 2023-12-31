import 'dart:convert';

import 'package:new_bumi_baik/models/carbon_and_tree_model.dart';
import 'package:new_bumi_baik/models/carbon_calculation_result_model.dart';
import 'package:new_bumi_baik/models/carbon_calculator_type_model.dart';
import 'package:new_bumi_baik/models/complete_user_model.dart';
import 'package:new_bumi_baik/models/auth_response_model.dart';
import 'package:new_bumi_baik/resources/token.dart';
import 'package:http/http.dart' as http;

import '../resources/app_constants.dart';

class CarbonService {
  String carbonUrl = "${AppConstants.apiUrl}/carbon";

  Future<CarbonCalculationResultModel> calculateCarbon(
      Map<String, dynamic> data) async {
    String url = "$carbonUrl/calculator";

    print(url);

    try {
      final http.Response response = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json',
          'Authorization': 'Bearer $globalAccessToken',
        },
        body: jsonEncode(<String, int>{
          "user_id": data['user_id'],
          "fuel": data['fuel'],
          "fuel_type": data['fuel_type'],
          "electricity": data['electricity'],
          "electricity_type": data['electricity_type'],
          "gas": data['gas'],
          "gas_type": data['gas_type'],
        }),
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        var result = json.decode(response.body)['data'];
        return CarbonCalculationResultModel.fromJson(result);
      } else {
        throw json.decode(response.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<CarbonCalculatorTypeModel> getCalculatorType() async {
    String url = "$carbonUrl/calculator/type";

    print(url);

    try {
      final http.Response response = await http.get(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json',
          'Authorization': 'Bearer $globalAccessToken',
        },
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        var result = json.decode(response.body)['data'];
        return CarbonCalculatorTypeModel.fromJson(result);
      } else {
        throw json.decode(response.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<CarbonAndTreeModel> getCarbon() async {
    String url = carbonUrl;

    print(url);

    try {
      final http.Response response = await http.get(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json',
          'Authorization': 'Bearer $globalAccessToken',
        },
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        var result = json.decode(response.body)['data'];
        return CarbonAndTreeModel.fromJson(result);
      } else {
        throw json.decode(response.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }
}
