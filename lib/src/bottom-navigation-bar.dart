// not in use!!!!
import 'package:books_app/src/views/pages/book_categories.dart';
import 'package:books_app/src/views/pages/home.dart';
import 'package:books_app/src/views/pages/posts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomTabs extends StatefulWidget {
  @override
  _BottomTabsState createState() => _BottomTabsState();
}

class _BottomTabsState extends State<BottomTabs> {
  int _selectedPage = 0;
  final List<Widget> _children = [
    Home(),
    BookCategories(),
    PostPage(),
  ];

  void _cahngePage(int index) {
    Navigator.pushNamed(
      context,
      Home.routeName,
    );
    // Navigator.of(context).push(MaterialPageRoute(
    //     builder: (BuildContext context) =>
    //         _children[_selectedPage])); // this has changed

    setState(() {
      _selectedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: _cahngePage,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.white,
      currentIndex: _selectedPage,
      items: [
        BottomNavigationBarItem(
          icon: const Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.book),
          label: 'Books Categories',
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.comment),
          label: 'Posts',
        )
      ],
    );
  }
}
