import 'package:flutter/material.dart';
import 'package:flutter_assignment/articles/presentations/view_articles_list.dart';
import 'package:flutter_assignment/shared/widgets/custom_tab.dart';

import '../../articles/presentations/favourite_list.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text("My HomePage"),
            centerTitle: true,
            bottom: TabBar(
              tabs: [
                CustomTab(
                  title: "All Articles",
                  icon: (Icons.all_inbox_sharp),
                ),
                CustomTab(
                  title: "Favorite Articles",
                  icon: (Icons.favorite),
                ),
              ],
            ),
          ),
          body: TabBarView(children: [
            ViewArticlesList(isFavoriteList: false),
            FavouriteListScreen()
          ]),
        ));
  }
}
