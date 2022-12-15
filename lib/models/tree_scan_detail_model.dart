// To parse this JSON data, do
//
//     final treeScanDetailModel = treeScanDetailModelFromJson(jsonString);

import 'dart:convert';

TreeScanDetailModel treeScanDetailModelFromJson(String str) =>
    TreeScanDetailModel.fromJson(json.decode(str));

String treeScanDetailModelToJson(TreeScanDetailModel data) =>
    json.encode(data.toJson());

class TreeScanDetailModel {
  TreeScanDetailModel({
    this.id,
    this.code,
    this.name,
    this.description,
    this.locationName,
    this.plantingDate,
    this.location,
    this.images,
    this.createdAt,
  });

  int? id;
  String? code;
  String? name;
  String? description;
  String? locationName;
  DateTime? plantingDate;
  Location? location;
  List<String>? images;
  DateTime? createdAt;

  factory TreeScanDetailModel.fromJson(Map<String, dynamic> json) =>
      TreeScanDetailModel(
        id: json["id"],
        code: json["code"],
        name: json["name"],
        description: json["description"],
        locationName: json["location_name"],
        plantingDate: DateTime.parse(json["planting_date"]),
        location: Location.fromJson(json["location"]),
        images: List<String>.from(json["images"].map((x) => x)),
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "code": code,
        "name": name,
        "description": description,
        "location_name": locationName,
        "planting_date":
            "${plantingDate!.year.toString().padLeft(4, '0')}-${plantingDate!.month.toString().padLeft(2, '0')}-${plantingDate!.day.toString().padLeft(2, '0')}",
        "location": location!.toJson(),
        "images": List<dynamic>.from(images!.map((x) => x)),
        "created_at": createdAt!.toIso8601String(),
      };
}

class Location {
  Location({
    this.latitude,
    this.longitude,
  });

  String? latitude;
  String? longitude;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        latitude: json["latitude"],
        longitude: json["longitude"],
      );

  Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
      };
}
