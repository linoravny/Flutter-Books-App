import 'package:books_app/src/main-shell.dart';
import 'package:books_app/src/views/widgets/add_book.dart';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  static const routeName = '/home';

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  BuildContext dialogContext;

  @override
  void initState() {
    super.initState();
  }

  // @override
  // void dispose() {
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final pageBody = Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(15),
          child: Text('Home Page'),
        ),
        Center(
          child: Text('page body'),
        ),
        Expanded(
          child: Align(
            alignment: FractionalOffset.bottomCenter,
            child: FloatingActionButton(
              onPressed: () {
                //open modal:
                showDialog<void>(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    dialogContext = context;
                    return AddBook();
                  },
                );
              },
              child: Icon(Icons.add),
              tooltip: 'add custom book to your list',
            ),
          ),
        ),
      ],
    );

    return AppMainShell(widget: pageBody);
  }
}
