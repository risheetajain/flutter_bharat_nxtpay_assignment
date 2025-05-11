// To parse this JSON data, do
//
//     final articleModel = articleModelFromJson(jsonString);

import 'dart:convert';

ArticleModel articleModelFromJson(String str) => ArticleModel.fromJson(json.decode(str));

String articleModelToJson(ArticleModel data) => json.encode(data.toJson());

class ArticleModel {
    final int userId;
    final int id;
    final String title;
    final String body;

    ArticleModel({
        required this.userId,
        required this.id,
        required this.title,
        required this.body,
    });

    ArticleModel copyWith({
        int? userId,
        int? id,
        String? title,
        String? body,
    }) => 
        ArticleModel(
            userId: userId ?? this.userId,
            id: id ?? this.id,
            title: title ?? this.title,
            body: body ?? this.body,
        );

    factory ArticleModel.fromJson(Map<String, dynamic> json) => ArticleModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
    };
}
