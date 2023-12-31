// To parse this JSON data, do
//
//     final detailDistributeTreesRespone = detailDistributeTreesResponeFromJson(jsonString);

import 'dart:convert';

DetailDistributeTreesRespone detailDistributeTreesResponeFromJson(String str) =>
    DetailDistributeTreesRespone.fromJson(json.decode(str));

String detailDistributeTreesResponeToJson(DetailDistributeTreesRespone data) =>
    json.encode(data.toJson());

class DetailDistributeTreesRespone {
  String? message;
  Data? data;

  DetailDistributeTreesRespone({
    this.message,
    this.data,
  });

  factory DetailDistributeTreesRespone.fromJson(Map<String, dynamic> json) =>
      DetailDistributeTreesRespone(
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  int? corporateCarbon;
  String? corporateTreeDistributionImage;
  String? corporateTreeDistributionDocument;

  Data({
    this.corporateCarbon,
    this.corporateTreeDistributionImage,
    this.corporateTreeDistributionDocument,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        corporateCarbon: json["corporate_carbon"],
        corporateTreeDistributionImage:
            json["corporate_tree_distribution_image"],
        corporateTreeDistributionDocument:
            json["corporate_tree_distribution_document"],
      );

  Map<String, dynamic> toJson() => {
        "corporate_carbon": corporateCarbon,
        "corporate_tree_distribution_image": corporateTreeDistributionImage,
        "corporate_tree_distribution_document":
            corporateTreeDistributionDocument,
      };
}
