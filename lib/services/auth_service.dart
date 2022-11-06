import 'dart:convert';

import 'package:bumibaik_app/models/complete_user_model.dart';
import 'package:bumibaik_app/models/auth_response_model.dart';
import 'package:http/http.dart' as http;

import '../resources/app_constants.dart';

class AuthService {
  String authUrl = "${AppConstants.apiUrl}/auth";

  Future<AuthResponseModel> register(Map<String, dynamic> data) async {
    String url = "$authUrl/register";

    print(url);

    try {
      final http.Response response = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'name': data['name'],
          'email': data['email'],
          'telp': data['telp'],
          'password': data['password'],
          'password_confirm': data['password_confirm'],
        }),
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        var result = json.decode(response.body)['data'];
        return AuthResponseModel.fromJson(result);
      } else {
        throw json.decode(response.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<AuthResponseModel> login(Map<String, dynamic> data) async {
    String url = "$authUrl/login";

    print(url);

    try {
      final http.Response response = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'user': data['user'],
          'password': data['password'],
        }),
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        var result = json.decode(response.body)['data'];
        return AuthResponseModel.fromJson(result);
      } else {
        throw json.decode(response.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }
}
