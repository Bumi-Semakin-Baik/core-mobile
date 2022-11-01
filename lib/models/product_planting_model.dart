// To parse this JSON data, do
//
//     final productPlantModel = productPlantModelFromJson(jsonString);

import 'dart:convert';

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
  });

  int? id;
  String? name;
  DateTime? datePlanting;
  List<String>? images;

  factory ProductPlantingModel.fromJson(Map<String, dynamic> json) =>
      ProductPlantingModel(
        id: json["id"],
        name: json["name"],
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
