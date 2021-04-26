// not in use!!!!

import 'package:books_app/src/bottom-navigation-bar.dart';
import 'package:books_app/src/business_logic/models/tabs.dart';
import 'package:books_app/src/main_header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'menu.dart';
import 'main_header.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
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
      //body: routes.elementAt(_selectedIndex),
      // SafeArea(
      //   child: IndexedStack(
      //     index: _selectedPage,
      //     children: [
      //       for (final tabItem in TabNavigationItem.items) tabItem.page,
      //     ],
      //   ),
      // ),
      //bottomNavigationBar: BottomTabs(),
    );
  }
}
