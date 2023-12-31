// To parse this JSON data, do
//
//     final registerResponseModel = registerResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:new_bumi_baik/models/user_model.dart';

AuthResponseModel registerResponseModelFromJson(String str) =>
    AuthResponseModel.fromJson(json.decode(str));

String registerResponseModelToJson(AuthResponseModel data) =>
    json.encode(data.toJson());

class AuthResponseModel {
  AuthResponseModel({
    this.accessToken,
    this.refreshToken,
    this.user,
  });

  String? accessToken;
  String? refreshToken;
  UserModel? user;

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) =>
      AuthResponseModel(
        accessToken: json["access_token"],
        refreshToken: json["refresh_token"],
        //user: UserModel.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "refresh_token": refreshToken,
        "user": user!.toJson(),
      };
}
