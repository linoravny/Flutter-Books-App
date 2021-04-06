import 'package:books_app/src/main-shell.dart';

import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  static const routeName = '/home';

  final pageBody = Container(
    child: Text('Home Page...'),
  );

  @override
  Widget build(BuildContext context) {
    return AppMainShell(widget: pageBody);
  }
}
