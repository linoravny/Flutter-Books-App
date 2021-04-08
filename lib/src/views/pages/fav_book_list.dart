import 'package:books_app/src/main-shell.dart';

import 'package:flutter/material.dart';

class FavoriteUserBookList extends StatelessWidget {
  static const routeName = '/favBookList';
// https://www.googleapis.com/books/v1/volumes?q=search+terms

  @override
  Widget build(BuildContext context) {
    final pageBody = Container();

    return AppMainShell(widget: pageBody);
  }
}
