// To parse this JSON data, do
//
//     final detailDonasiResponseModel = detailDonasiResponseModelFromJson(jsonString);

import 'dart:convert';

DetailDonasiResponseModel detailDonasiResponseModelFromJson(String str) =>
    DetailDonasiResponseModel.fromJson(json.decode(str));

String detailDonasiResponseModelToJson(DetailDonasiResponseModel data) =>
    json.encode(data.toJson());

class DetailDonasiResponseModel {
    DetailDonasiResponseModel({
        this.id,
        this.title,
        this.image,
        this.description,
        this.target,
        this.collected,
        this.due_date,
        this.nama_ukm,
        this.nama_lokasi,
        this.plantingDate,
        this.nama_mitra,
    });

    int? id;
    String? title;
    String? image;
    String? description;
    int? target;
    int? collected;
    DateTime? due_date;
    String? nama_ukm;
    String? nama_lokasi;
    dynamic plantingDate;
    String? nama_mitra;

    factory DetailDonasiResponseModel.fromJson(Map<String, dynamic> json) =>
        DetailDonasiResponseModel(
          id: json["id"],
          title: json["title"],
          image: json["image"] ?? "",
          description: json["description"],
          target: json["target"],
          collected: json["collected"],
          due_date: json["due_date"] == null
              ? null
              : DateTime.parse(json["due_date"]),
          nama_ukm: json["nama_ukm"],
          nama_lokasi: json["nama_lokasi"],
          plantingDate: json["plantingDate"],
          nama_mitra: json["nama_mitra"],
        );


    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "image": image,
        "description": description,
        "target": target,
        "collected": collected,
        "due_date":
            "${due_date!.year.toString().padLeft(4, '0')}-${due_date!.month.toString().padLeft(2, '0')}-${due_date!.day.toString().padLeft(2, '0')}",
        "nama_ukm": nama_ukm,
        "nama_lokasi": nama_lokasi,
        "planting_date": plantingDate,
        "nama_mitra": nama_mitra,
    };
}