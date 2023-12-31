import 'dart:convert';

import 'package:new_bumi_baik/models/complete_user_model.dart';
import 'package:new_bumi_baik/models/auth_response_model.dart';
import 'package:new_bumi_baik/models/register_validation_model.dart';
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
          'birth_date': data['birth_date'],
          'gender': data['gender'],
          'password': data['password'],
          'password_confirm': data['password_confirm'],
        }),
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        var result = json.decode(response.body)['data'];
        return AuthResponseModel.fromJson(result);
      } else {
        print(json.decode(response.body));
        throw RegisterValidationModel.fromJson(
          json.decode(response.body)['validation_error'],
        );
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

        print(result);
        return AuthResponseModel.fromJson(result);
      } else {
        print(response.body);
        // throw RegisterValidationModel.fromJson(
        //   json.decode(response.body)['validation_error'],
        // );
        throw json.decode(response.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }
}
