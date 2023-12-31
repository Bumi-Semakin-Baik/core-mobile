// To parse this JSON data, do
//
//     final productPlantModel = productPlantModelFromJson(jsonString);

import 'dart:convert';

import 'package:new_bumi_baik/models/tree_model.dart';

ProductPlantingModel productPlantModelFromJson(String str) =>
    ProductPlantingModel.fromJson(json.decode(str));

String productPlantModelToJson(ProductPlantingModel data) =>
    json.encode(data.toJson());

class ProductPlantingModel {
  ProductPlantingModel({
    this.id,
    this.name,
    this.datePlanting,
    this.images,
    this.detail,
    this.tree,
    this.price,
    this.location,
  });

  int? id;
  String? name;
  DateTime? datePlanting;
  List<String>? images;
  String? detail;
  TreeModel? tree;
  String? location;
  int? price;

  factory ProductPlantingModel.fromJson(Map<String, dynamic> json) =>
      ProductPlantingModel(
        id: json["id"],
        name: json["name"],
        detail: json["detail"] ?? "",
        location: json["location"] ?? "",
        price: json["price"] ?? 0,
        tree: json["tree"] == null ? null : TreeModel.fromJson(json["tree"]),
        datePlanting: DateTime.parse(json["date_planting"]),
        images: List<String>.from(json["images"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "date_planting":
            "${datePlanting!.year.toString().padLeft(4, '0')}-${datePlanting!.month.toString().padLeft(2, '0')}-${datePlanting!.day.toString().padLeft(2, '0')}",
        "images": List<dynamic>.from(images!.map((x) => x)),
      };
}
