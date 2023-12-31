// To parse this JSON data, do
//
//     final projectDetailModel = projectDetailModelFromJson(jsonString);

import 'dart:convert';

ProjectDetailModel projectDetailModelFromJson(String str) =>
    ProjectDetailModel.fromJson(json.decode(str));

String projectDetailModelToJson(ProjectDetailModel data) =>
    json.encode(data.toJson());

class ProjectDetailModel {
  ProjectDetailModel({
    this.id,
    this.name,
    this.description,
    this.partnerId,
    this.partnerName,
    this.plantingDate,
    this.address,
    this.treeTotal,
    this.photo,
  });

  int? id;
  String? name;
  String? description;
  int? partnerId;
  String? partnerName;
  DateTime? plantingDate;
  String? address;
  int? treeTotal;
  String? photo;

  factory ProjectDetailModel.fromJson(Map<String, dynamic> json) =>
      ProjectDetailModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        partnerId: json["partner_id"],
        partnerName: json["partner_name"],
        plantingDate: json["planting_date"] == null
            ? null
            : DateTime.parse(json["planting_date"]),
        address: json["address"],
        treeTotal: json["tree_total"],
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
        "address": address,
        "tree_total": treeTotal,
        "photo": photo,
      };
}
