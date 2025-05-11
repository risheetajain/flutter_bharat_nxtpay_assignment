import 'dart:convert';

import 'package:flutter_assignment/models/articles_model.dart';
import 'package:flutter_assignment/services/api_services/api_services.dart';
import 'package:flutter_assignment/services/api_services/network_value.dart';

class ArticlesDataSource {
  static Future<List<ArticleModel>> getArticleModel() async {
    final networkResponse =
        await ApiServices.getRequest(NetworkValues.getArticles);
    List<ArticleModel> articlesList = List.generate(
      networkResponse.data.length,
      (index) {
        return ArticleModel.fromJson((networkResponse.data[index]));
      },
    );
    return articlesList;
  }
}
