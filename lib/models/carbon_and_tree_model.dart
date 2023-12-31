// To parse this JSON data, do
//
//     final carbonAndTreeModel = carbonAndTreeModelFromJson(jsonString);

import 'dart:convert';

import 'package:new_bumi_baik/models/carbon_model.dart';
import 'package:new_bumi_baik/models/tree_model.dart';

CarbonAndTreeModel carbonAndTreeModelFromJson(String str) =>
    CarbonAndTreeModel.fromJson(json.decode(str));

String carbonAndTreeModelToJson(CarbonAndTreeModel data) =>
    json.encode(data.toJson());

class CarbonAndTreeModel {
  CarbonAndTreeModel({
    this.carbon,
    this.trees,
  });

  CarbonModel? carbon;
  List<TreeModel>? trees;

  factory CarbonAndTreeModel.fromJson(Map<String, dynamic> json) =>
      CarbonAndTreeModel(
        carbon: CarbonModel.fromJson(json["carbon"]),
        trees: List<TreeModel>.from(
            json["trees"].map((x) => TreeModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "carbon": carbon!.toJson(),
        "trees": List<dynamic>.from(trees!.map((x) => x.toJson())),
      };
}
