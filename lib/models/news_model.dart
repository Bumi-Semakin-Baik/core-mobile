// To parse this JSON data, do
//
//     final newsModel = newsModelFromJson(jsonString);

import 'dart:convert';

NewsModel newsModelFromJson(String str) => NewsModel.fromJson(json.decode(str));

String newsModelToJson(NewsModel data) => json.encode(data.toJson());

class NewsModel {
  NewsModel({
    this.id,
    this.title,
    this.slug,
    this.image,
    this.createdAt,
    this.views,
    this.author,
    this.content,
  });

  int? id;
  String? title;
  String? slug;
  String? image;
  DateTime? createdAt;
  int? views;
  String? content;
  String? author;

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        id: json["id"],
        title: json["title"],
        slug: json["slug"],
        image: json["image"],
        author: json["author"],
        content: json["content"],
        createdAt: DateTime.parse(json["created_at"]),
        views: json["views"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "slug": slug,
        "image": image,
        "created_at": createdAt!.toIso8601String(),
        "views": views,
      };
}
