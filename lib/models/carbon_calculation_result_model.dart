// To parse this JSON data, do
//
//     final carbonCalculationResultModel = carbonCalculationResultModelFromJson(jsonString);

import 'dart:convert';

CarbonCalculationResultModel carbonCalculationResultModelFromJson(String str) =>
    CarbonCalculationResultModel.fromJson(json.decode(str));

String carbonCalculationResultModelToJson(CarbonCalculationResultModel data) =>
    json.encode(data.toJson());

class CarbonCalculationResultModel {
  CarbonCalculationResultModel({
    this.result,
    this.unit,
  });

  double? result;
  String? unit;

  factory CarbonCalculationResultModel.fromJson(Map<String, dynamic> json) =>
      CarbonCalculationResultModel(
        result: json["result"].toDouble(),
        unit: json["unit"],
      );

  Map<String, dynamic> toJson() => {
        "result": result,
        "unit": unit,
      };
}
