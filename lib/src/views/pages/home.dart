import 'package:books_app/src/main_header.dart';
import 'package:books_app/src/menu.dart';
import 'package:books_app/src/views/widgets/favorites_posts.dart';
import 'package:books_app/src/views/widgets/home_tab_1.dart';

import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        endDrawer: Menu(),
        appBar: MainHeader(
          heightSize: 130,
          title: 'Home',
          tabs: TabBar(
            tabs: <Widget>[
              Tab(
                icon: const Icon(Icons.home),
                text: 'Added Post',
              ),
              Tab(
                icon: const Icon(Icons.star),
                text: 'Saved Posts',
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: Container(
            child: TabBarView(
              children: <Widget>[
                HomeTab1(),
                FavoritesPosts(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
