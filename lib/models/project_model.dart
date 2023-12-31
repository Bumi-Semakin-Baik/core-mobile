// To parse this JSON data, do
//
//     final projectModel = projectModelFromJson(jsonString);

import 'dart:convert';

ProjectModel projectModelFromJson(String str) =>
    ProjectModel.fromJson(json.decode(str));

String projectModelToJson(ProjectModel data) => json.encode(data.toJson());

class ProjectModel {
  ProjectModel({
    this.id,
    this.name,
    this.description,
    this.partnerId,
    this.partnerName,
    this.plantingDate,
    this.photo,
  });

  int? id;
  String? name;
  String? description;
  int? partnerId;
  String? partnerName;
  DateTime? plantingDate;
  String? photo;

  factory ProjectModel.fromJson(Map<String, dynamic> json) => ProjectModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        partnerId: json["partner_id"],
        partnerName: json["partner_name"],
        plantingDate: json["planting_date"] == null
            ? null
            : DateTime.parse(json["planting_date"]),
        photo: json["photo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "partner_id": partnerId,
        "partner_name": partnerName,
        "planting_date":
            "${plantingDate!.year.toString().padLeft(4, '0')}-${plantingDate!.month.toString().padLeft(2, '0')}-${plantingDate!.day.toString().padLeft(2, '0')}",
        "photo": photo,
      };
}
