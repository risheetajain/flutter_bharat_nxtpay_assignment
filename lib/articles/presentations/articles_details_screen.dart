import 'package:flutter/material.dart';
import 'package:flutter_assignment/models/articles_model.dart';
import 'package:flutter_assignment/shared/constants/app_string.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/favourites_provider/favourite_provider.dart';

class ArticlesDetailsScreen extends ConsumerWidget {
  const ArticlesDetailsScreen({super.key, required this.articleModel});
  final ArticleModel articleModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteNotifier = ref.watch(favoriteProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: Text(AppString.articlesDetailsTitle),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (favoriteNotifier.checkIFExistInList(articleModel.id))
                const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(Icons.favorite_sharp),
                  ],
                ),
              Text.rich(
                TextSpan(
                    text: "Title : ",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                          text: articleModel.title ?? "",
                          style: TextStyle(fontWeight: FontWeight.w300))
                    ]),
              ),
              Text.rich(
                TextSpan(
                    text: "Description : ",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                          text: articleModel.title ?? "",
                          style: TextStyle(fontWeight: FontWeight.w300))
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
