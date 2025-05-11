import 'package:flutter_assignment/articles/domains/articles_data_source.dart';
import 'package:flutter_assignment/shared/utils/utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'articles_state.dart';

class ArticleListProvider extends StateNotifier<ArticlesState> {
  ArticleListProvider() : super(ArticlesState());

  getDataFromProvider() async {
    updateState(state.copyWith(
        hasData: false,
        isLoading: true,
        articlesList: [],
        articlesListMaster: []));
    final data = await ArticlesDataSource.getArticleModel();
    print("data from api ${state.hasData}");

    updateState(state.copyWith(
        hasData: true,
        isLoading: false,
        articlesList: data,
        articlesListMaster: data));
    print("data from state ${state.hasData}");
  }

  updateState(ArticlesState updateState) {
    state = updateState;
  }

  setQueryFromList(String query) {
    print(
        "Articles MAster ${state.articlesListMaster?.length}  view list ${state.articlesList?.length}");
    final updateList = state.articlesListMaster
        ?.where(
          (element) =>
              Utils.checkForWhereCOndition(element.body)
                  .contains(Utils.checkForWhereCOndition(query)) ||
              Utils.checkForWhereCOndition(element.title)
                  .contains(Utils.checkForWhereCOndition(query)),
        )
        .toList();
    updateState(state.copyWith(articlesList: updateList));
  }
}

final articlesProvider =
    StateNotifierProvider<ArticleListProvider, ArticlesState>((ref) {
  return ArticleListProvider();
});
