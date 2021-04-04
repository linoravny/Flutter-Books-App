import 'package:books_app/src/main-shell.dart';

import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final pageBody = Container(
    child: Text('Home Page...'),
  );

  @override
  Widget build(BuildContext context) {
    return AppMainShell(widget: pageBody);
  }
}
