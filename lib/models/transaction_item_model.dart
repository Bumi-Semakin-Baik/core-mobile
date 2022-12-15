// To parse this JSON data, do
//
//     final transactionItemModel = transactionItemModelFromJson(jsonString);

import 'dart:convert';

List<TransactionItemModel> transactionItemModelFromJson(String str) =>
    List<TransactionItemModel>.from(
        json.decode(str).map((x) => TransactionItemModel.fromJson(x)));

String transactionItemModelToJson(List<TransactionItemModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TransactionItemModel {
  TransactionItemModel({
    this.id,
    this.type,
    this.code,
    this.detail,
    this.date,
    this.total,
    this.status,
  });

  String? id;
  String? type;
  String? code;
  String? detail;
  DateTime? date;
  int? total;
  String? status;

  factory TransactionItemModel.fromJson(Map<String, dynamic> json) =>
      TransactionItemModel(
        id: json["id"],
        type: json["type"],
        code: json["code"],
        detail: json["detail"],
        date: DateTime.parse(json["date"]),
        total: json["total"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "code": code,
        "detail": detail,
        "date":
            "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "total": total,
        "status": status,
      };
}
