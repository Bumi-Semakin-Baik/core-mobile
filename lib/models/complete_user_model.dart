// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

CompleteUserModel userModelFromJson(String str) =>
    CompleteUserModel.fromJson(json.decode(str));

String userModelToJson(CompleteUserModel data) => json.encode(data.toJson());

class CompleteUserModel {
  CompleteUserModel({
    this.id,
    this.name,
    this.email,
    this.telp,
    this.birthDate,
    this.gender,
    this.address,
    this.photo,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? name;
  String? email;
  String? telp;
  dynamic birthDate;
  dynamic gender;
  dynamic address;
  dynamic photo;
  DateTime? emailVerifiedAt;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory CompleteUserModel.fromJson(Map<String, dynamic> json) =>
      CompleteUserModel(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        telp: json["telp"],
        birthDate: json["birth_date"],
        gender: json["gender"],
        address: json["address"],
        photo: json["photo"],
        emailVerifiedAt: DateTime.parse(json["email_verified_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
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
        "email_verified_at": emailVerifiedAt!.toIso8601String(),
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}
