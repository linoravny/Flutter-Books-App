// not in use!!!!

import 'package:books_app/src/main_header.dart';
import 'package:books_app/src/views/pages/books_categories.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'menu.dart';
import 'main_header.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final pageBody = SafeArea(
    child: SingleChildScrollView(
      child: BookCategories(),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return //Platform.isIOS
        // ? CupertinoPageScaffold(
        //     navigationBar: CupertinoNavigationBar(
        //       backgroundColor: CupertinoColors.systemGrey.withOpacity(0.8),
        //       middle: const Text('Books App'),
        //     ),
        //     child: Column(
        //       children: <Widget>[pageBody],
        //     ),
        //   )
        //:
        Scaffold(
      endDrawer: Menu(),
      appBar: MainHeader(title: 'Books App'),
      body: pageBody,
    );
  }
}
