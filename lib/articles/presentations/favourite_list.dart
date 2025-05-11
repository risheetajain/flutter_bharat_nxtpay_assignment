import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_assignment/articles/providers/view_articles_provider/article_provider.dart';
import 'package:flutter_assignment/articles/presentations/articles_details_screen.dart';

import 'package:flutter_assignment/services/api_services/api_services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/articles_model.dart';
import '../../services/api_services/network_value.dart';
import '../providers/favourites_provider/favourite_provider.dart';

class FavouriteListScreen extends ConsumerStatefulWidget {
  const FavouriteListScreen({
    super.key,
  });

  @override
  ConsumerState<FavouriteListScreen> createState() =>
      _FavouriteListScreenState();
}

class _FavouriteListScreenState extends ConsumerState<FavouriteListScreen> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      ref.read(articlesProvider.notifier).getDataFromProvider();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final favoriteNotifier = ref.watch(favoriteProvider.notifier);
    print("ryrrr" +
        (ref.watch(favoriteProvider.notifier).favouriteArticle).toString());
    return Scaffold(
      body: favoriteNotifier.favouriteArticle.isEmpty
          ? Center(
              child: Text("No Favourite selected yet"),
            )
          : ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16),
              itemCount: favoriteNotifier.favouriteArticle.length ?? 0,
              itemBuilder: (ctx, index) {
                final articleModel = favoriteNotifier.favouriteArticle[index];
                return Card(
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ArticlesDetailsScreen(
                                articleModel: articleModel),
                          ));
                    },
                    title: Text(articleModel.title ?? ""),
                    subtitle: Text(articleModel.body ?? ""),
                    trailing:
                        favoriteNotifier.checkIFExistInList(articleModel.id)
                            ? InkWell(
                                onTap: () {
                                  favoriteNotifier
                                      .removeArticleModel(articleModel.id);
                                },
                                child: Icon(Icons.favorite_sharp))
                            : null,
                  ),
                );
              }),
    );
  }
}
