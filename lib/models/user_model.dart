// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.id,
    this.name,
    this.email,
    this.telp,
    this.birthDate,
    this.gender,
    this.address,
    this.photo,
    this.type,
    this.emailVerifiedAt,
  });

  int? id;
  String? name;
  String? email;
  String? telp;
  dynamic birthDate;
  dynamic gender;
  dynamic address;
  String? photo;
  String? type;
  DateTime? emailVerifiedAt;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        telp: json["telp"],
        birthDate: json["birth_date"] ?? "",
        gender: json["gender"] ?? "",
        address: json["address"] ?? "",
        photo: json["photo"],
        type: json["type"],
        emailVerifiedAt: DateTime.parse(json["email_verified_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "telp": telp,
        "birth_date": birthDate,
        "gender": gender,
        "address": address,
        "photo": photo,
        "type": type,
        "email_verified_at": emailVerifiedAt!.toIso8601String(),
      };
}
