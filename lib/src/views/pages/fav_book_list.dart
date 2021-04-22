import 'package:books_app/src/main_header.dart';
import 'package:books_app/src/menu.dart';

import 'package:flutter/material.dart';

class FavoriteUserBookList extends StatelessWidget {
  static const routeName = '/favBookList';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Menu(),
      appBar: MainHeader(title: 'Favoirte Books'),
      body: SafeArea(
        child: Container(),
      ),
    );
  }
}
