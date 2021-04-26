import 'package:books_app/src/views/pages/book_categories.dart';
import 'package:books_app/src/views/pages/home.dart';
import 'package:books_app/src/views/pages/posts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TabNavigationItem {
  final Widget page;
  final Widget title;
  final Icon icon;

  TabNavigationItem({
    @required this.page,
    @required this.title,
    @required this.icon,
  });

  static List<TabNavigationItem> get items => [
        TabNavigationItem(
          page: Home(),
          icon: Icon(Icons.home),
          title: Text("Home"),
        ),
        TabNavigationItem(
          page: BookCategories(),
          icon: Icon(Icons.book),
          title: Text("Books Categories"),
        ),
        TabNavigationItem(
          page: PostPage(),
          icon: Icon(Icons.comment),
          title: Text("Posts"),
        ),
      ];
}
