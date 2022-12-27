import 'dart:convert';

import 'package:bumibaik_app/models/user_model.dart';
import 'package:bumibaik_app/resources/app_constants.dart';
import 'package:bumibaik_app/resources/token.dart';
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
}
