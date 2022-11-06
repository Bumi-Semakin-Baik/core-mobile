// To parse this JSON data, do
//
//     final treeModel = treeModelFromJson(jsonString);

import 'dart:convert';

TreeModel treeModelFromJson(String str) => TreeModel.fromJson(json.decode(str));

String treeModelToJson(TreeModel data) => json.encode(data.toJson());

class TreeModel {
  TreeModel({
    this.code,
    this.latitude,
    this.longitude,
  });

  String? code;
  String? latitude;
  String? longitude;

  factory TreeModel.fromJson(Map<String, dynamic> json) => TreeModel(
        code: json["code"],
        latitude: json["latitude"],
        longitude: json["longitude"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "latitude": latitude,
        "longitude": longitude,
      };
}
