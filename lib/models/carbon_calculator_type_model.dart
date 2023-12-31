// To parse this JSON data, do
//
//     final carbonCalculatorTypeModel = carbonCalculatorTypeModelFromJson(jsonString);

import 'dart:convert';

import 'package:new_bumi_baik/models/carbon_calculator_type_item_model.dart';

CarbonCalculatorTypeModel carbonCalculatorTypeModelFromJson(String str) =>
    CarbonCalculatorTypeModel.fromJson(json.decode(str));

String carbonCalculatorTypeModelToJson(CarbonCalculatorTypeModel data) =>
    json.encode(data.toJson());

class CarbonCalculatorTypeModel {
  CarbonCalculatorTypeModel({
    this.fuel,
    this.electricity,
    this.gas,
  });

  List<CarbonCalculatorTypeItemModel>? fuel;
  List<CarbonCalculatorTypeItemModel>? electricity;
  List<CarbonCalculatorTypeItemModel>? gas;

  factory CarbonCalculatorTypeModel.fromJson(Map<String, dynamic> json) =>
      CarbonCalculatorTypeModel(
        fuel: List<CarbonCalculatorTypeItemModel>.from(
            json["fuel"].map((x) => CarbonCalculatorTypeItemModel.fromJson(x))),
        electricity: List<CarbonCalculatorTypeItemModel>.from(
            json["electricity"]
                .map((x) => CarbonCalculatorTypeItemModel.fromJson(x))),
        gas: List<CarbonCalculatorTypeItemModel>.from(
            json["gas"].map((x) => CarbonCalculatorTypeItemModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "fuel": List<dynamic>.from(fuel!.map((x) => x.toJson())),
        "electricity": List<dynamic>.from(electricity!.map((x) => x.toJson())),
        "gas": List<dynamic>.from(gas!.map((x) => x.toJson())),
      };
}
