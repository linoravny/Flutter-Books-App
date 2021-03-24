import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../src/views/pages/books_categories.dart';

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
    return
        // Platform.isIOS
        //   ? CupertinoPageScaffold(
        //       navigationBar: CupertinoNavigationBar(
        //         backgroundColor: CupertinoColors.systemGrey.withOpacity(0.8),
        //         middle: const Text('Books App'),
        //       ),
        //       child: Column(
        //         children: <Widget>[pageBody],
        //       ),
        //     )
        //   :
        Scaffold(
      appBar: AppBar(
        title: const Text('Books App'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: null,
          )
        ],
      ),
      body: pageBody,
    );
  }
}
