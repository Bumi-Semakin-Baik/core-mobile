import 'dart:convert';

import 'package:new_bumi_baik/models/transaction_item_model.dart';
import 'package:new_bumi_baik/models/transaction_model.dart';
import 'package:new_bumi_baik/resources/token.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import '../resources/app_constants.dart';

class TransactionService {
  String transUrl = "${AppConstants.apiUrl}/transactions";

  Future<String> createMidtransToken(int orderId, double total) async {
    var client = http.Client();

    String serverKey = AppConstants.isProd
        ? dotenv.env['PROD_SERVER_KEY'] ?? ""
        : dotenv.env['SB_SERVER_KEY'] ?? "";

    print(serverKey);

    String credentials = "$serverKey:";
    Codec<String, String> stringToBase64Url = utf8.fuse(base64Url);
    String encoded = stringToBase64Url.encode(credentials);

    // Codec<String, String> stringToBase64 = utf8.fuse(base64);
    // String a = base64Encode(serverKey);
    // String authString = stringToBase64.encode("$serverKey:");

    String midtransUrl = AppConstants.isProd
        ? dotenv.env['PROD_MIDTRANS_MERCHANT_BASE_URL']!
        : dotenv.env['SB_MIDTRANS_MERCHANT_BASE_URL']!;

    String url = "$midtransUrl/snap/v1/transactions";

    print(url);

    try {
      var response = await client.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Basic $encoded',
        },
        body: jsonEncode(<dynamic, dynamic>{
          'transaction_details': {
            'order_id': orderId,
            'gross_amount': total,
          },
        }),
      );

      if (response.statusCode == 201) {
        print(jsonDecode(response.body)['token']);
        return jsonDecode(response.body)['token'];
      } else {
        print(response.body);
      }
    } catch (e) {
      print(e);
      client.close();
      throw Exception(e);
    }
    return "Failed";
  }

  Future<TransactionReturnModel> adoptTree(Map<String, dynamic> data) async {
    var client = http.Client();

    String url = "${AppConstants.apiUrl}/transactions/adopt";

    print(url);

    try {
      var response = await client.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $globalAccessToken',
        },
        body: jsonEncode(<dynamic, dynamic>{
          'product_id': data['productId'],
          'product_name': data['productName'],
          'total': data['total'],
        }),
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body)['data'];

        return TransactionReturnModel.fromJson(data);
      } else {
        print(response.body);
        throw response.body;
      }
    } catch (e) {
      client.close();
      rethrow;
    }
  }

  Future<List<TransactionItemModel>> getTransactions() async {
    String url = transUrl;

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
        List<TransactionItemModel> transData = [];

        for (var item in data) {
          transData.add(TransactionItemModel.fromJson(item));
        }

        return transData;
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
