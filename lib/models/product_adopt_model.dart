// To parse this JSON data, do
//
//     final pohonModel = pohonModelFromJson(jsonString);

import 'dart:convert';

ProductAdoptModel pohonModelFromJson(String str) =>
    ProductAdoptModel.fromJson(json.decode(str));

String pohonModelToJson(ProductAdoptModel data) => json.encode(data.toJson());

class ProductAdoptModel {
  ProductAdoptModel({
    this.id,
    this.name,
    this.location,
    this.images,
  });

  int? id;
  String? name;
  String? location;
  List<String>? images;

  factory ProductAdoptModel.fromJson(Map<String, dynamic> json) =>
      ProductAdoptModel(
        id: json["id"],
        name: json["name"],
        location: json["location"],
        images: List<String>.from(json["images"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "location": location,
        "images": List<dynamic>.from(images!.map((x) => x)),
      };
}
