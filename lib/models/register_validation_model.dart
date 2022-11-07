// To parse this JSON data, do
//
//     final registerValidationModel = registerValidationModelFromJson(jsonString);

import 'dart:convert';

RegisterValidationModel registerValidationModelFromJson(String str) =>
    RegisterValidationModel.fromJson(json.decode(str));

String registerValidationModelToJson(RegisterValidationModel data) =>
    json.encode(data.toJson());

class RegisterValidationModel {
  RegisterValidationModel({
    this.email,
    this.telp,
    this.password,
    this.passwordConfirm,
  });

  List<String>? email;
  List<String>? telp;
  List<String>? password;
  List<String>? passwordConfirm;

  factory RegisterValidationModel.fromJson(Map<String, dynamic> json) =>
      RegisterValidationModel(
        email: json["email"] == null
            ? null
            : List<String>.from(json["email"].map((x) => x)),
        telp: json["telp"] == null
            ? null
            : List<String>.from(json["telp"].map((x) => x)),
        password: json["password"] == null
            ? null
            : List<String>.from(json["password"].map((x) => x)),
        passwordConfirm: json["password_confirm"] == null
            ? null
            : List<String>.from(json["password_confirm"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "email": List<dynamic>.from(email!.map((x) => x)),
        "telp": List<dynamic>.from(telp!.map((x) => x)),
        "password": List<dynamic>.from(password!.map((x) => x)),
        "password_confirm": List<dynamic>.from(passwordConfirm!.map((x) => x)),
      };
}
