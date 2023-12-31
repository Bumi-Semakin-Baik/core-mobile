// To parse this JSON data, do
//
//     final listDonasiResponseModel = listDonasiResponseModelFromJson(jsonString);

import 'dart:convert';

ListDonasiResponseModel listDonasiResponseModelFromJson(String str) =>
    ListDonasiResponseModel.fromJson(json.decode(str));

String listDonasiResponseModelToJson(ListDonasiResponseModel data) =>
    json.encode(data.toJson());

class ListDonasiResponseModel {
  ListDonasiResponseModel({
    this.id,
    this.title,
    this.image,
    this.nama_ukm,
    this.nama_lokasi,
    this.nama_mitra,
    this.target,
    this.collected,
    this.due_date,
    this.new_image,
    this.progress,
  });

  int? id;
  String? title;
  String? image;
  String? nama_ukm;
  String? nama_lokasi;
  String? nama_mitra;
  int? target;
  int? collected;
  DateTime? due_date;
  String? new_image;
  double? progress;

  factory ListDonasiResponseModel.fromJson(Map<String, dynamic> json) =>
      ListDonasiResponseModel(
        id: json["id"],
        title: json["title"],
        image: json["image"],
        nama_ukm: json["nama_ukm"],
        nama_lokasi: json["nama_lokasi"],
        nama_mitra: json["nama_mitra"],
        target: json["target"],
        collected: json["collected"],
        due_date:
            json["due_date"] == null ? null : DateTime.parse(json["due_date"]),
        new_image: json["new_image"],
        progress: json["progress"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "image": image,
        "nama_ukm": nama_ukm,
        "nama_lokasi": nama_lokasi,
        "nama_mitra": nama_mitra,
        "target": target,
        "collected": collected,
        "due_date":
            "${due_date!.year.toString().padLeft(4, '0')}-${due_date!.month.toString().padLeft(2, '0')}-${due_date!.day.toString().padLeft(2, '0')}",
        "new_image": new_image,
        "progress": progress,
      };
}
