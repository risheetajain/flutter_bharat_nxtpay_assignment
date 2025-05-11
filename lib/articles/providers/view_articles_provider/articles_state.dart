import 'package:flutter_assignment/models/articles_model.dart';

class ArticlesState {
  final bool? hasData;
  final bool isLoading;
  final List<ArticleModel>? articlesList;
  final List<ArticleModel>? articlesListMaster;

  ArticlesState(
      {this.hasData,
      this.isLoading = false,
      this.articlesList,
      this.articlesListMaster});

  ArticlesState copyWith({
    bool? hasData,
    bool? isLoading,
    List<ArticleModel>? articlesList,
    List<ArticleModel>? articlesListMaster,
  }) =>
      ArticlesState(
          hasData: hasData ?? this.hasData,
          isLoading: isLoading ?? this.isLoading,
          articlesList: articlesList ?? this.articlesList,
          articlesListMaster: articlesListMaster ?? this.articlesListMaster);
}
