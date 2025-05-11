import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_assignment/models/articles_model.dart';
import 'package:flutter_assignment/services/local_storages.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../view_articles_provider/article_provider.dart';

class FavoriteProvider extends ChangeNotifier {
  List<int> favouriteIDs = [];
  List<ArticleModel> _articleList = [];
  List<ArticleModel> get favouriteArticle => _articleList;

  addAndRemoveInArticleModel(ArticleModel model) {
    print("Favourtie $model");
    if (checkIFExistInList(model.id)) {
      favouriteIDs.remove(model.id);
      _articleList.remove(model);
      LocalStorage.removeDataFromFavoriteBox(model.id);
    } else {
      favouriteIDs.add(model.id);
      _articleList.add(model);

      LocalStorage.addDataIntoFavoriteBox(model.id);
    }
    notifyListeners();
  }

  removeArticleModel(int id) {
    favouriteIDs.remove(id);
    _articleList.removeWhere(
      (element) => element.id == id,
    );
    notifyListeners();
  }

  getAllDatafromLocalSto() {
    final localStoragelist = LocalStorage.getAllDataFromFavBox();
    favouriteIDs = localStoragelist;
    notifyListeners();
  }

  updateAllLocalStorageData(WidgetRef ref) {
    getAllDatafromLocalSto();
    getAllListFromIDs(ref);
  }

  getAllListFromIDs(WidgetRef ref) {
    final allArticleList = ref.read(articlesProvider).articlesList ?? [];
    favouriteIDs.forEach((id) {
      final findArticleModel = _articleList?.firstWhere(
        (element) => element.id == id,
      );
      if (findArticleModel != null) {
        favouriteArticle.add(findArticleModel);
      }
    });
    notifyListeners();
  }

  bool checkIFExistInList(int id) {
    return favouriteArticle.any(
      (element) => element.id == id,
    );
  }
}

final favoriteProvider = ChangeNotifierProvider(
  (ref) => FavoriteProvider(),
);
