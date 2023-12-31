import 'dart:convert';

import 'package:new_bumi_baik/models/user_model.dart';
import 'package:new_bumi_baik/resources/app_constants.dart';
import 'package:new_bumi_baik/resources/token.dart';
import 'package:http/http.dart' as http;

class UserService {
  String userUrl = "${AppConstants.apiUrl}/users";

  Future<UserModel> getUserDetails() async {
    String url = userUrl;

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

        return UserModel.fromJson(data);
      } else {
        print(response.statusCode);
        throw Exception("ehe");
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<void> updateUserDetails(Map<String, dynamic> data) async {
    String url = userUrl;

    print(url);

    try {
      final response = await http.put(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Cache-control': 'no-cache',
          'Accept': 'application/json',
          'Authorization': 'Bearer $globalAccessToken',
        },
        body: jsonEncode(<String, String>{
          'name': data['name'],
          'email': data['email'],
          'telp': data['telp'],
          'birth_date': data['birth_date'],
          'gender': data['gender'],
        }),
      );

      if (response.statusCode == 500) {
        // return response.body.toString();
      } else {
        print(response.statusCode);
        // throw Exception("ehe");
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
