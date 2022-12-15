// To parse this JSON data, do
//
//     final carbonModel = carbonModelFromJson(jsonString);

import 'dart:convert';

CarbonModel carbonModelFromJson(String str) =>
    CarbonModel.fromJson(json.decode(str));

String carbonModelToJson(CarbonModel data) => json.encode(data.toJson());

class CarbonModel {
  CarbonModel({
    this.userId,
    this.emision,
    this.offset,
    this.lastCalculate,
  });

  int? userId;
  double? emision;
  double? offset;
  DateTime? lastCalculate;

  factory CarbonModel.fromJson(Map<String, dynamic> json) => CarbonModel(
        userId: json["user_id"],
        emision: json["emision"],
        offset: json["offset"].toDouble(),
        lastCalculate: DateTime.parse(json["last_calculate"]),
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "emision": emision,
        "offset": offset,
        "last_calculate":
            "${lastCalculate!.year.toString().padLeft(4, '0')}-${lastCalculate!.month.toString().padLeft(2, '0')}-${lastCalculate!.day.toString().padLeft(2, '0')}",
      };
}
