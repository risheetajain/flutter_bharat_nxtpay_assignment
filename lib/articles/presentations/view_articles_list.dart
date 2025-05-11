import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_assignment/articles/providers/view_articles_provider/article_provider.dart';
import 'package:flutter_assignment/articles/presentations/articles_details_screen.dart';
import 'package:flutter_assignment/services/api_services/api_services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/articles_model.dart';
import '../../services/api_services/network_value.dart';
import '../providers/favourites_provider/favourite_provider.dart';
import '../providers/view_articles_provider/articles_state.dart';

class ViewArticlesList extends ConsumerStatefulWidget {
  const ViewArticlesList({super.key, required this.isFavoriteList});

  final bool isFavoriteList;

  @override
  ConsumerState<ViewArticlesList> createState() => _ViewArticlesListState();
}

class _ViewArticlesListState extends ConsumerState<ViewArticlesList> {
  bool get isFavoritePage => widget.isFavoriteList;

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      ref.read(articlesProvider.notifier).getDataFromProvider();
      ref.read(favoriteProvider.notifier).updateAllLocalStorageData(ref);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final articleNotifier = ref.watch(articlesProvider.notifier);
    final ArticlesState articlesState = ref.watch(articlesProvider);
    final favoriteNotifier = ref.watch(favoriteProvider);
    print("ryrrr" +
        (ref.watch(favoriteProvider.notifier).favouriteArticle).toString());
    return Scaffold(
      body: RefreshIndicator.adaptive(
        onRefresh: () =>
            ref.read(articlesProvider.notifier).getDataFromProvider(),
        child: (articlesState.isLoading)
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: 'Search By Title/Body',
                          labelText: "Search"),
                      onChanged: (value) =>
                          articleNotifier.setQueryFromList(value),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Expanded(
                      child: articlesState.articlesList?.isEmpty ?? true
                          ? Center(
                              child: Text("No Data Found"),
                            )
                          : ListView.builder(
                              itemCount:
                                  articlesState.articlesList?.length ?? 0,
                              itemBuilder: (ctx, index) {
                                final articleModel =
                                    articlesState.articlesList![index];
                                return Card(
                                  child: ListTile(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ArticlesDetailsScreen(
                                                    articleModel: articleModel),
                                          ));
                                    },
                                    title: Text(articleModel.title ?? ""),
                                    subtitle: Text(articleModel.body ?? ""),
                                    trailing: InkWell(
                                        onTap: () {
                                          favoriteNotifier
                                              .addAndRemoveInArticleModel(
                                                  articleModel);
                                        },
                                        child: Icon(
                                            favoriteNotifier.checkIFExistInList(
                                                    articleModel.id)
                                                ? Icons.favorite_sharp
                                                : Icons.favorite_outline)),
                                  ),
                                );
                              }),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
