// To parse this JSON data, do
//
//     final transactionModel = transactionModelFromJson(jsonString);

import 'dart:convert';

TransactionReturnModel transactionModelFromJson(String str) =>
    TransactionReturnModel.fromJson(json.decode(str));

String transactionModelToJson(TransactionReturnModel data) =>
    json.encode(data.toJson());

class TransactionReturnModel {
  TransactionReturnModel({
    this.token,
    this.transaction,
    this.redirectUrl,
  });

  String? token;
  TransactionModel? transaction;
  String? redirectUrl;

  factory TransactionReturnModel.fromJson(Map<String, dynamic> json) =>
      TransactionReturnModel(
        token: json["token"],
        transaction: TransactionModel.fromJson(json["transaction"]),
        redirectUrl: json["redirect_url"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "transaction": transaction!.toJson(),
        "redirect_url": redirectUrl,
      };
}

class TransactionModel {
  TransactionModel({
    this.id,
    this.code,
    this.date,
    this.total,
    this.status,
    this.totalOffset,
  });

  String? id;
  String? code;
  DateTime? date;
  int? total;
  String? status;
  int? totalOffset;

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      TransactionModel(
        id: json["id"],
        code: json["code"],
        date: DateTime.parse(json["date"]),
        total: json["total"],
        status: json["status"],
        totalOffset: json["total_offset"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "code": code,
        "date":
            "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "total": total,
        "status": status,
        "total_offset": totalOffset,
      };
}
